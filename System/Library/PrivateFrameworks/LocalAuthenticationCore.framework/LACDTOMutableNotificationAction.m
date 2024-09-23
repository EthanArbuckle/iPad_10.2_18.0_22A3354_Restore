@implementation LACDTOMutableNotificationAction

- (LACDTOMutableNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 isTitleLocalized:(BOOL)a5 isDestructive:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  LACDTOMutableNotificationAction *v12;
  LACDTOMutableNotificationAction *v13;
  objc_super v15;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOMutableNotificationAction;
  v12 = -[LACDTOMutableNotificationAction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[LACDTOMutableNotificationAction setIdentifier:](v12, "setIdentifier:", v10);
    -[LACDTOMutableNotificationAction setTitle:](v13, "setTitle:", v11);
    -[LACDTOMutableNotificationAction setIsTitleLocalized:](v13, "setIsTitleLocalized:", v7);
    -[LACDTOMutableNotificationAction setIsDestructive:](v13, "setIsDestructive:", v6);
  }

  return v13;
}

+ (id)doNotStartNewDelayAction
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:isTitleLocalized:isDestructive:", CFSTR("com.apple.coreauthd.notifications.action.securityDelay.start"), CFSTR("START_SECURITY_DELAY_ACTION"), 0, 0);
}

+ (id)startNewDelayAction
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:isTitleLocalized:isDestructive:", CFSTR("com.apple.coreauthd.notifications.action.securityDelay.dismiss"), CFSTR("NOT_NOW_ACTION"), 0, 1);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (BOOL)isTitleLocalized
{
  return self->_isTitleLocalized;
}

- (void)setIsTitleLocalized:(BOOL)a3
{
  self->_isTitleLocalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
