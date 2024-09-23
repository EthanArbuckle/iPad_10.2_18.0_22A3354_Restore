@implementation ANManagedAccountNotification

- (void)takeValuesFromAccountNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedAccountNotification setIdentifier:](self, "setIdentifier:", v5);

  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedAccountNotification setTitle:](self, "setTitle:", v6);

  objc_msgSend(v4, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedAccountNotification setMessage:](self, "setMessage:", v7);

  objc_msgSend(v4, "accountTypeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedAccountNotification setAccountTypeID:](self, "setAccountTypeID:", v8);

  objc_msgSend(v4, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedAccountNotification setDate:](self, "setDate:", v9);

  objc_msgSend(v4, "activateButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedAccountNotification setActivateButtonTitle:](self, "setActivateButtonTitle:", v10);

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedAccountNotification setUserInfo:](self, "setUserInfo:", v11);

  objc_msgSend(v4, "callbackMachService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedAccountNotification setCallbackMachServiceName:](self, "setCallbackMachServiceName:", v12);

  objc_msgSend(v4, "eventIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[ANManagedAccountNotification setEventID:](self, "setEventID:", v13);
}

@end
