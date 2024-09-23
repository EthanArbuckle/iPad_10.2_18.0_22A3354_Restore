@implementation AUNotificationRequest

- (id)initUnplugReplugNotificationWithAccessoryName:(id)a3
{
  AUNotificationRequest *v4;
  AUNotificationRequest *v5;
  objc_super v7;

  if (!a3)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)AUNotificationRequest;
  v4 = -[AUNotificationRequest init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = 1;
    v4->_accessoryName = (NSString *)objc_msgSend(a3, "copy");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AUNotificationRequest;
  -[AUNotificationRequest dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_accessoryName, CFSTR("accessoryName"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
}

- (AUNotificationRequest)initWithCoder:(id)a3
{
  AUNotificationRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AUNotificationRequest;
  v4 = -[AUNotificationRequest init](&v6, sel_init);
  if (v4)
  {
    v4->_accessoryName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryName")), "copy");
    v4->_type = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("type"));
  }
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
