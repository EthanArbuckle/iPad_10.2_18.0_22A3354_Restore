@implementation TVRemoteWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allTouches"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v6, "locationInView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRemoteWindow hitTest:withEvent:](self, "hitTest:withEvent:", v4));

  if (objc_msgSend(v6, "phase") == (id)3)
  {
    v9 = _TVRUIServiceAppLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recursiveDescription"));
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UIEvent: %@, hitView: %@", buf, 0x16u);

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)TVRemoteWindow;
  -[TVRemoteWindow sendEvent:](&v12, "sendEvent:", v4);

}

@end
