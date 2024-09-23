@implementation DAUserInterruptAlertFactory

+ (id)sharedInstance
{
  if (qword_10016E8C8 != -1)
    dispatch_once(&qword_10016E8C8, &stru_1001334F0);
  return (id)qword_10016E8C0;
}

+ (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v8, "activateAlertForSuiteName:withHandler:", v7, v6);

}

+ (void)reset
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertVisibleLock"));
  objc_msgSend(v2, "lock");

  objc_msgSend(v4, "setVisibleAlert:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertVisibleLock"));
  objc_msgSend(v3, "unlock");

}

- (DAUserInterruptAlertFactory)init
{
  uint64_t v2;
  DAUserInterruptAlertFactory *v3;
  uint64_t v4;
  NSLock *alertVisibleLock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DAUserInterruptAlertFactory;
  v3 = -[DAUserInterruptAlertFactory init](&v7, "init");
  if (v3)
  {
    v4 = objc_opt_new(NSLock, v2);
    alertVisibleLock = v3->_alertVisibleLock;
    v3->_alertVisibleLock = (NSLock *)v4;

  }
  return v3;
}

- (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  DAUserInterruptAlert *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory alertVisibleLock](self, "alertVisibleLock"));
  objc_msgSend(v7, "lock");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory visibleAlert](self, "visibleAlert"));
  if (!v8)
  {
    v9 = -[DAUserInterruptAlert initWithSuiteName:withHandler:]([DAUserInterruptAlert alloc], "initWithSuiteName:withHandler:", v14, v6);
    -[DAUserInterruptAlertFactory setVisibleAlert:](self, "setVisibleAlert:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory alertVisibleLock](self, "alertVisibleLock"));
    objc_msgSend(v10, "unlock");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory visibleAlert](self, "visibleAlert"));
    objc_msgSend(v11, "activate");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory alertVisibleLock](self, "alertVisibleLock"));
    objc_msgSend(v12, "lock");

    -[DAUserInterruptAlertFactory setVisibleAlert:](self, "setVisibleAlert:", 0);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory alertVisibleLock](self, "alertVisibleLock"));
  objc_msgSend(v13, "unlock");

}

- (NSLock)alertVisibleLock
{
  return self->_alertVisibleLock;
}

- (void)setAlertVisibleLock:(id)a3
{
  objc_storeStrong((id *)&self->_alertVisibleLock, a3);
}

- (DAUserInterruptAlert)visibleAlert
{
  return self->_visibleAlert;
}

- (void)setVisibleAlert:(id)a3
{
  objc_storeStrong((id *)&self->_visibleAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleAlert, 0);
  objc_storeStrong((id *)&self->_alertVisibleLock, 0);
}

@end
