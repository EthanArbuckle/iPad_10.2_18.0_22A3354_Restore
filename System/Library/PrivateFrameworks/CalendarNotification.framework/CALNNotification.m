@implementation CALNNotification

+ (id)notificationWithRequest:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  CALNNotification *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CALNNotification initWithNotificationRequest:date:]([CALNNotification alloc], "initWithNotificationRequest:date:", v6, v5);

  return v7;
}

- (CALNNotification)initWithNotificationRequest:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  CALNNotification *v8;
  uint64_t v9;
  NSDate *date;
  uint64_t v11;
  CALNNotificationRequest *request;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNNotification;
  v8 = -[CALNNotification init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    v11 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (CALNNotificationRequest *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CALNNotification date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CALNNotification request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNNotification isEqualToNotification:](self, "isEqualToNotification:", v4);

  return v5;
}

- (BOOL)isEqualToNotification:(id)a3
{
  CALNNotification *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (CALNNotification *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[CALNNotification date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotification date](v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalEqualObjects();

    if (v7)
    {
      -[CALNNotification request](self, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNNotification request](v4, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CalEqualObjects();

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
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
  -[CALNNotification date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotification request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p(date: %@, request: %@)"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CALNNotification date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

  -[CALNNotification request](self, "request");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("request"));

}

- (CALNNotification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CALNNotification *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CALNNotification initWithNotificationRequest:date:](self, "initWithNotificationRequest:date:", v6, v5);
  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (CALNNotificationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
