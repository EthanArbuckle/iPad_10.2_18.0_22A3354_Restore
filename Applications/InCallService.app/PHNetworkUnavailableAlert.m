@implementation PHNetworkUnavailableAlert

+ (id)alertWithCallProvider:(id)a3 dialType:(int64_t)a4 senderIdentityUUID:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithCallProvider:dialType:senderIdentityUUID:", v9, a4, v8);

  return v10;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHNetworkUnavailableAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)message
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHNetworkUnavailableAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "message"));

  return v3;
}

- (id)defaultButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHNetworkUnavailableAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actions"));

  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)alternateButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHNetworkUnavailableAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actions"));

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  }
  return v5;
}

- (id)otherButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHNetworkUnavailableAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actions"));

  if ((unint64_t)objc_msgSend(v3, "count") < 3)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  }
  return v5;
}

- (void)defaultResponse
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHNetworkUnavailableAlert alertController](self, "alertController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));

  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));

    if (v5)
    {
      v5[2](v5, 0);

    }
  }
  -[PHNetworkUnavailableAlert handleAlertDidFinish](self, "handleAlertDidFinish");

}

- (void)alternateResponse
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHNetworkUnavailableAlert alertController](self, "alertController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));

    if (v5)
    {
      v5[2](v5, 0);

    }
  }
  -[PHNetworkUnavailableAlert handleAlertDidFinish](self, "handleAlertDidFinish");

}

- (void)otherResponse
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHNetworkUnavailableAlert alertController](self, "alertController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));

  if ((unint64_t)objc_msgSend(v6, "count") >= 3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 1));
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));

    if (v5)
    {
      v5[2](v5, 0);

    }
  }
  -[PHNetworkUnavailableAlert handleAlertDidFinish](self, "handleAlertDidFinish");

}

- (void)handleAlertDidFinish
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PHNetworkUnavailableAlertDidFinishNotification"), 0);

}

- (PHNetworkUnavailableAlert)initWithCallProvider:(id)a3 dialType:(int64_t)a4 senderIdentityUUID:(id)a5
{
  id v8;
  id v9;
  PHNetworkUnavailableAlert *v10;
  uint64_t v11;
  UIAlertController *alertController;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PHNetworkUnavailableAlert;
  v10 = -[PHNetworkUnavailableAlert init](&v14, "init");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[UIAlertController networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:](UIAlertController, "networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:", v8, a4, v9));
    alertController = v10->_alertController;
    v10->_alertController = (UIAlertController *)v11;

  }
  return v10;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
