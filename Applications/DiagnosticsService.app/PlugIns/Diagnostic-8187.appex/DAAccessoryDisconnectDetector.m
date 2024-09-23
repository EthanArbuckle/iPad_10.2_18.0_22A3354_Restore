@implementation DAAccessoryDisconnectDetector

- (DAAccessoryDisconnectDetector)initWithModelNumbers:(id)a3
{
  id v5;
  DAAccessoryDisconnectDetector *v6;
  DAAccessoryDisconnectDetector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAAccessoryDisconnectDetector;
  v6 = -[DAAccessoryDisconnectDetector init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modelNumbers, a3);

  return v7;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = DiagnosticLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccessoryDisconnectDetector modelNumbers](self, "modelNumbers"));
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accessory disconnect detector started for accessories: %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "accessoryDidDisconnect:", EAAccessoryDidDisconnectNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  objc_msgSend(v7, "registerForLocalNotifications");

}

- (void)accessoryDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  unsigned int v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAAccessoryKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelNumber"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccessoryDisconnectDetector modelNumbers](self, "modelNumbers"));
  v8 = objc_msgSend(v7, "containsObject:", v6);

  v9 = DiagnosticLogHandleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 1024;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Accessory disconnect detector informed that %@ has disconnected. Matches watchlist: %d", buf, 0x12u);
  }

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = CFSTR("accessoryModelNumber");
    v14 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("AccessoryDisconnectedNotification"), 0, v12);

  }
}

- (void)stop
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = DiagnosticLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccessoryDisconnectDetector modelNumbers](self, "modelNumbers"));
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accessory disconnect detector stopped for accessories: %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, EAAccessoryDidDisconnectNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  objc_msgSend(v7, "unregisterForLocalNotifications");

}

- (NSArray)modelNumbers
{
  return self->_modelNumbers;
}

- (void)setModelNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_modelNumbers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNumbers, 0);
}

@end
