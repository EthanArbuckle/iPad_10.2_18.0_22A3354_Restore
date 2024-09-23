@implementation LACDTOMutableNotificationCategory

- (LACDTOMutableNotificationCategory)initWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewShowsTitle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  LACDTOMutableNotificationCategory *v10;
  LACDTOMutableNotificationCategory *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LACDTOMutableNotificationCategory;
  v10 = -[LACDTOMutableNotificationCategory init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[LACDTOMutableNotificationCategory setIdentifier:](v10, "setIdentifier:", v8);
    -[LACDTOMutableNotificationCategory setActions:](v11, "setActions:", v9);
    -[LACDTOMutableNotificationCategory setHiddenPreviewShowsTitle:](v11, "setHiddenPreviewShowsTitle:", v5);
  }

  return v11;
}

+ (id)newSecurityDelayRequiredCategory
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)a1);
  +[LACDTOMutableNotificationAction startNewDelayAction](LACDTOMutableNotificationAction, "startNewDelayAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[LACDTOMutableNotificationAction doNotStartNewDelayAction](LACDTOMutableNotificationAction, "doNotStartNewDelayAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithIdentifier:actions:hiddenPreviewShowsTitle:", CFSTR("com.apple.coreauthd.notifications.category.securityDelay.required"), v5, 1);

  return v6;
}

+ (id)securityDelayEndedCategory
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithIdentifier:actions:hiddenPreviewShowsTitle:", CFSTR("com.apple.coreauthd.notifications.category.securityDelay.ended"), MEMORY[0x24BDBD1A8], 1);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (BOOL)hiddenPreviewShowsTitle
{
  return self->_hiddenPreviewShowsTitle;
}

- (void)setHiddenPreviewShowsTitle:(BOOL)a3
{
  self->_hiddenPreviewShowsTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
