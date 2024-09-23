@implementation ICSCarPlayServicesController

- (void)acquireAssertionWithActivation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCarPlayServicesController assertion](self, "assertion"));
  if (v5)
    v6 = v3;
  else
    v6 = 1;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCarPlayServicesController assertion](self, "assertion"));
  if (!v7)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Acquiring and activating CarPlay assertion", (uint8_t *)&v15, 2u);
    }

    v10 = objc_msgSend(objc_alloc((Class)CRSInCallAssertion), "initWithReason:", CFSTR("incoming call"));
    -[ICSCarPlayServicesController setAssertion:](self, "setAssertion:", v10);

  }
  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCarPlayServicesController assertion](self, "assertion"));
    v15 = 138412290;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v15, 0xCu);

  }
  if (v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCarPlayServicesController assertion](self, "assertion"));
    objc_msgSend(v14, "activate");

  }
}

- (void)invalidateAssertion
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCarPlayServicesController assertion](self, "assertion"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating CarPlay assertion: %@", (uint8_t *)&v7, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCarPlayServicesController assertion](self, "assertion"));
  objc_msgSend(v6, "invalidate");

  -[ICSCarPlayServicesController setAssertion:](self, "setAssertion:", 0);
}

- (void)setAllowsBanners:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting banners allowed %d on CarPlay assertion", (uint8_t *)v8, 8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCarPlayServicesController assertion](self, "assertion"));
  objc_msgSend(v7, "setAllowsBanners:", v3);

}

- (BOOL)allowsBanners
{
  return self->_allowsBanners;
}

- (CRSInCallAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
