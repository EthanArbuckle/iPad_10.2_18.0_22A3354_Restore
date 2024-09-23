@implementation PKUISSListener_Banner

- (PKUISSListener_Banner)init
{

  return 0;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t Object;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteProcess"));
  v7 = v6;
  if (!v6)
  {
    Object = PKLogFacilityTypeGetObject(4);
    v10 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v5;
      v13 = "PKUISSBannerHandle: rejecting connection %p - missing remote process.";
      v14 = v10;
      v15 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
    }
LABEL_11:

    objc_msgSend(v5, "invalidate");
    goto LABEL_12;
  }
  v8 = objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.wallet.banner"));
  v9 = PKLogFacilityTypeGetObject(4);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v11)
    {
      v16 = 134218240;
      v17 = v5;
      v18 = 2050;
      v19 = (int)objc_msgSend(v7, "pid");
      v13 = "PKUISSBannerHandle: rejecting connection %p - remote process %{public}ld missing entitlement com.apple.wallet.banner.";
      v14 = v10;
      v15 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v11)
  {
    v16 = 134218240;
    v17 = v5;
    v18 = 2050;
    v19 = (int)objc_msgSend(v7, "pid");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle: accepting connection %p for remote process %{public}ld.", (uint8_t *)&v16, 0x16u);
  }

LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
