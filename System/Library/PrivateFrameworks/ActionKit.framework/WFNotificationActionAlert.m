@implementation WFNotificationActionAlert

- (WFNotificationActionAlert)initWithTitle:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  WFNotificationActionAlert *v8;
  uint64_t v9;
  NSString *title;
  void *v11;
  uint64_t v12;
  NSString *body;
  WFNotificationActionAlert *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFNotificationActionAlert;
  v8 = -[WFNotificationActionAlert init](&v16, sel_init);
  if (v8)
  {
    if (objc_msgSend(v6, "length") || objc_msgSend(v7, "length"))
    {
      if (objc_msgSend(v7, "length"))
      {
        v9 = objc_msgSend(v6, "copy");
        title = v8->_title;
        v8->_title = (NSString *)v9;
      }
      else
      {
        title = v8->_title;
        v8->_title = 0;
      }

      if (objc_msgSend(v7, "length"))
        v11 = v7;
      else
        v11 = v6;
      v12 = objc_msgSend(v11, "copy");
    }
    else
    {
      WFLocalizedString(CFSTR("Notification"));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    body = v8->_body;
    v8->_body = (NSString *)v12;

    v14 = v8;
  }

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
