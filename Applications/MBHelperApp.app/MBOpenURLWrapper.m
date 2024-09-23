@implementation MBOpenURLWrapper

- (MBOpenURLWrapper)init
{
  void *v3;
  MBOpenURLWrapper *v4;

  -[MBOpenURLWrapper doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", &stru_100004128));
  v4 = -[MBOpenURLWrapper initWithURL:](self, "initWithURL:", v3);

  return v4;
}

- (MBOpenURLWrapper)initWithURL:(id)a3
{
  id v4;
  MBOpenURLWrapper *v5;
  NSURL *v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBOpenURLWrapper;
  v5 = -[MBOpenURLWrapper init](&v9, "init");
  if (v5)
  {
    v6 = (NSURL *)objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = v6;

  }
  return v5;
}

- (BOOL)isHTTPURL
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBOpenURLWrapper url](self, "url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("http")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("https"));

  return v5;
}

- (BOOL)isPrepareBuddyURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBOpenURLWrapper url](self, "url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "host"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  LOBYTE(v2) = objc_msgSend(v4, "isEqualToString:", CFSTR("prepare.icloud.com"));
  return (char)v2;
}

- (void)openPrebuddyURL
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = MBGetDefaultLog(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Open prefs-prebuddy://", v6, 2u);
    _MBLog(CFSTR("DEFAULT"), "Open prefs-prebuddy://");
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs-prebuddy://")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v5, "openURL:withOptions:", v4, 0);

}

- (void)open
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;

  v3 = -[MBOpenURLWrapper isHTTPURL](self, "isHTTPURL");
  if (v3)
  {
    v5 = MBGetDefaultLog(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBOpenURLWrapper url](self, "url"));
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received associated domain link: %{public}@", buf, 0xCu);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBOpenURLWrapper url](self, "url"));
      _MBLog(CFSTR("DEFAULT"), "Received associated domain link: %{public}@", v8);

    }
    if (-[MBOpenURLWrapper isPrepareBuddyURL](self, "isPrepareBuddyURL"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBOpenURLWrapper delegate](self, "delegate"));
      v10 = objc_opt_respondsToSelector(v9, "openURLWrapper:willOpenURL:");
      if ((v10 & 1) != 0)
        v10 = (uint64_t)objc_msgSend(v9, "openURLWrapper:willOpenURL:", self, self->_url);
      v12 = MBGetDefaultLog(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received Prebuddy link. Opening Settings.", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Received Prebuddy link. Opening Settings.");
      }

      -[MBOpenURLWrapper openPrebuddyURL](self, "openPrebuddyURL");
      if ((objc_opt_respondsToSelector(v9, "openURLWrapper:didOpenURL:") & 1) != 0)
        objc_msgSend(v9, "openURLWrapper:didOpenURL:", self, self->_url);

    }
  }
}

- (MBOpenURLWrapperDelegate)delegate
{
  return (MBOpenURLWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
