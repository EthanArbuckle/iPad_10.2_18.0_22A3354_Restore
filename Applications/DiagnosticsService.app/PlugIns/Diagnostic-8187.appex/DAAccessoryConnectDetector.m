@implementation DAAccessoryConnectDetector

- (DAAccessoryConnectDetector)initWithModelNumbers:(id)a3
{
  id v5;
  DAAccessoryConnectDetector *v6;
  DAAccessoryConnectDetector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAAccessoryConnectDetector;
  v6 = -[DAAccessoryConnectDetector init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modelNumbers, a3);

  return v7;
}

- (void)start
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "accessoryDidConnect:", EAAccessoryDidConnectNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  objc_msgSend(v4, "registerForLocalNotifications");

}

- (void)accessoryDidConnect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAAccessoryKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelNumber"));

  v7 = objc_alloc((Class)NSNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccessoryConnectDetector modelNumbers](self, "modelNumbers"));
  v9 = objc_msgSend(v7, "initWithBool:", objc_msgSend(v8, "containsObject:", v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12[0] = CFSTR("accessoryModelNumber");
  v12[1] = CFSTR("accessoryModelNumberInList");
  v13[0] = v6;
  v13[1] = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("AccessoryConnectedNotification"), 0, v11);

}

- (void)stop
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, EAAccessoryDidConnectNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  objc_msgSend(v4, "unregisterForLocalNotifications");

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
