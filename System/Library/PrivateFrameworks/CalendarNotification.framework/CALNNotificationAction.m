@implementation CALNNotificationAction

+ (CALNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5
{
  return (CALNNotificationAction *)objc_msgSend(a1, "actionWithIdentifier:title:systemImageName:url:", a3, a4, a5, 0);
}

+ (CALNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5 url:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:systemImageName:url:", v13, v12, v11, v10);

  return (CALNNotificationAction *)v14;
}

- (CALNNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5 url:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CALNNotificationAction *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSURL *url;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CALNNotificationAction;
  v14 = -[CALNNotificationAction init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v17;

    objc_storeStrong((id *)&v14->_systemImageName, a5);
    v19 = objc_msgSend(v13, "copy");
    url = v14->_url;
    v14->_url = (NSURL *)v19;

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[CALNNotificationAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[CALNNotificationAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[CALNNotificationAction systemImageName](self, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[CALNNotificationAction url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNNotificationAction isEqualToAction:](self, "isEqualToAction:", v4);

  return v5;
}

- (BOOL)isEqualToAction:(id)a3
{
  CALNNotificationAction *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (CALNNotificationAction *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    -[CALNNotificationAction identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationAction identifier](v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalEqualStrings();

    if (!v7)
      goto LABEL_6;
    -[CALNNotificationAction title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationAction title](v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CalEqualStrings();

    if (!v10)
      goto LABEL_6;
    -[CALNNotificationAction systemImageName](self, "systemImageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationAction systemImageName](v4, "systemImageName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CalEqualStrings();

    if (v13)
    {
      -[CALNNotificationAction url](self, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNNotificationAction url](v4, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CalEqualObjects();

    }
    else
    {
LABEL_6:
      v16 = 0;
    }
  }

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNNotificationAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationAction title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationAction systemImageName](self, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationAction url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(identifier = %@, title = %@, systemImage = %@, url = %@)"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
