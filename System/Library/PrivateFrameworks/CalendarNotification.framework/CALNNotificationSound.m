@implementation CALNNotificationSound

+ (CALNNotificationSound)soundWithAlertType:(int64_t)a3 alertTopic:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAlertType:alertTopic:", a3, v6);

  return (CALNNotificationSound *)v7;
}

- (id)_initWithAlertType:(int64_t)a3 alertTopic:(id)a4
{
  id v6;
  CALNNotificationSound *v7;
  CALNNotificationSound *v8;
  uint64_t v9;
  NSString *alertTopic;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNNotificationSound;
  v7 = -[CALNNotificationSound init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_alertType = a3;
    v9 = objc_msgSend(v6, "copy");
    alertTopic = v8->_alertTopic;
    v8->_alertTopic = (NSString *)v9;

  }
  return v8;
}

- (CALNNotificationSound)init
{

  return 0;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[CALNNotificationSound alertType](self, "alertType");
  -[CALNNotificationSound alertTopic](self, "alertTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNNotificationSound isEqualToSound:](self, "isEqualToSound:", v4);

  return v5;
}

- (BOOL)isEqualToSound:(id)a3
{
  CALNNotificationSound *v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (CALNNotificationSound *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = -[CALNNotificationSound alertType](self, "alertType");
    if (v5 == -[CALNNotificationSound alertType](v4, "alertType"))
    {
      -[CALNNotificationSound alertTopic](self, "alertTopic");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNNotificationSound alertTopic](v4, "alertTopic");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CalEqualStrings();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CALNNotificationSound alertType](self, "alertType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationSound alertTopic](self, "alertTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(alertType = %@, alertTopic = %@)"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CALNMutableNotificationSound *v4;
  int64_t v5;
  void *v6;
  id v7;

  v4 = +[CALNMutableNotificationSound allocWithZone:](CALNMutableNotificationSound, "allocWithZone:", a3);
  v5 = -[CALNNotificationSound alertType](self, "alertType");
  -[CALNNotificationSound alertTopic](self, "alertTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CALNNotificationSound _initWithAlertType:alertTopic:](v4, "_initWithAlertType:alertTopic:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CALNNotificationSound alertTopic](self, "alertTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("alertTopic"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CALNNotificationSound alertType](self, "alertType"), CFSTR("alertType"));
}

- (CALNNotificationSound)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  CALNNotificationSound *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertTopic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alertType"));

  v7 = -[CALNNotificationSound _initWithAlertType:alertTopic:](self, "_initWithAlertType:alertTopic:", v6, v5);
  return v7;
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)alertTopic
{
  return self->_alertTopic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertTopic, 0);
}

@end
