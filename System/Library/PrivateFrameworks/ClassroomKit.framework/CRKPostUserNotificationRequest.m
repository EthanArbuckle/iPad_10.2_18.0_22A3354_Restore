@implementation CRKPostUserNotificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKPostUserNotificationRequest)initWithCoder:(id)a3
{
  id v4;
  CRKPostUserNotificationRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKPostUserNotificationRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_notificationType = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKPostUserNotificationRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKPostUserNotificationRequest notificationType](self, "notificationType", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("notificationType"));

}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(int64_t)a3
{
  self->_notificationType = a3;
}

@end
