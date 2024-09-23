@implementation PHEmergencyEndCallAlert

+ (id)alertWithDialRequest:(id)a3 dialAction:(id)a4 title:(id)a5 buttonTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithDialRequest:dialAction:title:buttonTitle:", v13, v12, v11, v10);

  return v14;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyEndCallAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)message
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyEndCallAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "message"));

  return v3;
}

- (id)defaultButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyEndCallAlert alertController](self, "alertController"));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyEndCallAlert alertController](self, "alertController"));
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

- (void)defaultResponse
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyEndCallAlert alertController](self, "alertController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actions"));

  if (objc_msgSend(v5, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handler"));

    if (v4)
    {
      v4[2](v4, 0);

    }
  }

}

- (void)alternateResponse
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyEndCallAlert alertController](self, "alertController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actions"));

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handler"));

    if (v4)
    {
      v4[2](v4, 0);

    }
  }

}

- (PHEmergencyEndCallAlert)initWithDialRequest:(id)a3 dialAction:(id)a4 title:(id)a5 buttonTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PHEmergencyEndCallAlert *v14;
  uint64_t v15;
  UIAlertController *alertController;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PHEmergencyEndCallAlert;
  v14 = -[PHEmergencyEndCallAlert init](&v18, "init");
  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[UIAlertController callEndStewieControllerWithDialRequest:dialAction:title:buttonTitle:](UIAlertController, "callEndStewieControllerWithDialRequest:dialAction:title:buttonTitle:", v10, v11, v12, v13));
    alertController = v14->_alertController;
    v14->_alertController = (UIAlertController *)v15;

  }
  return v14;
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
