@implementation CALNNotificationRequest

+ (id)requestWithIdentifier:(id)a3 content:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CALNNotificationRequest _initWithIdentifier:content:]([CALNNotificationRequest alloc], "_initWithIdentifier:content:", v6, v5);

  return v7;
}

- (id)_initWithIdentifier:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  CALNNotificationRequest *v8;
  uint64_t v9;
  CALNNotificationContent *content;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNNotificationRequest;
  v8 = -[CALNNotificationRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    content = v8->_content;
    v8->_content = (CALNNotificationContent *)v9;

    v11 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CALNNotificationRequest content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CALNNotificationRequest identifier](self, "identifier");
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
    && -[CALNNotificationRequest isEqualToRequest:](self, "isEqualToRequest:", v4);

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  CALNNotificationRequest *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (CALNNotificationRequest *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[CALNNotificationRequest identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationRequest identifier](v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalEqualStrings();

    if (v7)
    {
      -[CALNNotificationRequest content](self, "content");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNNotificationRequest content](v4, "content");
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
  -[CALNNotificationRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRequest content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(identifier = %@, content = %@)"), v4, self, v5, v6);
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
  -[CALNNotificationRequest content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("content"));

  -[CALNNotificationRequest identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

}

- (CALNNotificationRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CALNNotificationRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CALNNotificationRequest _initWithIdentifier:content:](self, "_initWithIdentifier:content:", v6, v5);
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CALNNotificationContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
