@implementation PHTelephonyAccountUnavailableAlert

- (PHTelephonyAccountUnavailableAlert)initWithSenderIdentities:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PHTelephonyAccountUnavailableAlert *v8;
  uint64_t v9;
  UIAlertController *alertController;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHTelephonyAccountUnavailableAlert;
  v8 = -[PHTelephonyAccountUnavailableAlert init](&v12, "init");
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[UIAlertController telephonyAccountUnavailableAlertControllerWithSenderIdentities:preferredStyle:completion:](UIAlertController, "telephonyAccountUnavailableAlertControllerWithSenderIdentities:preferredStyle:completion:", v6, 1, v7));
    alertController = v8->_alertController;
    v8->_alertController = (UIAlertController *)v9;

  }
  return v8;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTelephonyAccountUnavailableAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)message
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTelephonyAccountUnavailableAlert alertController](self, "alertController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "message"));

  return v3;
}

- (id)defaultButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTelephonyAccountUnavailableAlert alertController](self, "alertController"));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTelephonyAccountUnavailableAlert alertController](self, "alertController"));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTelephonyAccountUnavailableAlert alertController](self, "alertController"));
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
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTelephonyAccountUnavailableAlert alertController](self, "alertController"));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTelephonyAccountUnavailableAlert alertController](self, "alertController"));
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

- (void)otherResponse
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTelephonyAccountUnavailableAlert alertController](self, "alertController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actions"));

  if ((unint64_t)objc_msgSend(v5, "count") >= 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 1));
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handler"));

    if (v4)
    {
      v4[2](v4, 0);

    }
  }

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
