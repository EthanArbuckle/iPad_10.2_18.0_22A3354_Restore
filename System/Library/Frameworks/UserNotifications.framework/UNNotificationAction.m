@implementation UNNotificationAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_textInputPlaceholder, 0);
  objc_storeStrong((id *)&self->_textInputButtonTitle, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UNNotificationActionOptions v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationAction identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualStrings(v5, v6))
    {
      -[UNNotificationAction title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (UNEqualObjects(v7, v8)
        && (v9 = -[UNNotificationAction options](self, "options"), v9 == objc_msgSend(v4, "options")))
      {
        -[UNNotificationAction url](self, "url");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = UNEqualObjects(v10, v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UNNotificationAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationAction options](self, "options"), CFSTR("options"));
  -[UNNotificationAction title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[UNNotificationAction textInputButtonTitle](self, "textInputButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("textInputButtonTitle"));

  -[UNNotificationAction textInputPlaceholder](self, "textInputPlaceholder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("textInputPlaceholder"));

  -[UNNotificationAction url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("url"));

  -[UNNotificationAction icon](self, "icon");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("icon"));

}

- (UNNotificationActionOptions)options
{
  return self->_options;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (UNNotificationActionIcon)icon
{
  return self->_icon;
}

- (NSString)textInputPlaceholder
{
  return self->_textInputPlaceholder;
}

- (NSString)textInputButtonTitle
{
  return self->_textInputButtonTitle;
}

- (UNNotificationAction)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UNNotificationAction *v26;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("options"));
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("textInputButtonTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v19, CFSTR("textInputPlaceholder"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(v24, "copy");
  v26 = -[UNNotificationAction _initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:](self, "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v5, v10, v11, v16, v21, v23, v25);

  return v26;
}

- (id)_initWithIdentifier:(id)a3 title:(id)a4 options:(unint64_t)a5 textInputButtonTitle:(id)a6 textInputPlaceholder:(id)a7 url:(id)a8 icon:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  UNNotificationAction *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *title;
  uint64_t v26;
  NSString *textInputButtonTitle;
  uint64_t v28;
  NSString *textInputPlaceholder;
  uint64_t v30;
  NSURL *url;
  uint64_t v32;
  UNNotificationActionIcon *icon;
  objc_super v35;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)UNNotificationAction;
  v21 = -[UNNotificationAction init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v21->_options = a5;
    v24 = objc_msgSend(v16, "copy");
    title = v21->_title;
    v21->_title = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    textInputButtonTitle = v21->_textInputButtonTitle;
    v21->_textInputButtonTitle = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    textInputPlaceholder = v21->_textInputPlaceholder;
    v21->_textInputPlaceholder = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    url = v21->_url;
    v21->_url = (NSURL *)v30;

    v32 = objc_msgSend(v20, "copy");
    icon = v21->_icon;
    v21->_icon = (UNNotificationActionIcon *)v32;

  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UNNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options
{
  NSString *v8;
  NSString *v9;
  void *v10;

  v8 = title;
  v9 = identifier;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v9, v8, options, &stru_1E57F06A0, &stru_1E57F06A0, 0, 0);

  return (UNNotificationAction *)v10;
}

+ (UNNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options icon:(UNNotificationActionIcon *)icon
{
  UNNotificationActionIcon *v10;
  NSString *v11;
  NSString *v12;
  void *v13;

  v10 = icon;
  v11 = title;
  v12 = identifier;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v12, v11, options, &stru_1E57F06A0, &stru_1E57F06A0, 0, v10);

  return (UNNotificationAction *)v13;
}

+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v10, v9, 4, &stru_1E57F06A0, &stru_1E57F06A0, v8, 0);

  return (UNNotificationAction *)v11;
}

+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 icon:(id)a6
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
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v13, v12, 4, &stru_1E57F06A0, &stru_1E57F06A0, v11, v10);

  return (UNNotificationAction *)v14;
}

+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v12, v11, a6 | 4, &stru_1E57F06A0, &stru_1E57F06A0, v10, 0);

  return (UNNotificationAction *)v13;
}

+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 options:(unint64_t)a6 icon:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v15, v14, a6 | 4, &stru_1E57F06A0, &stru_1E57F06A0, v13, v12);

  return (UNNotificationAction *)v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  UNNotificationActionOptions v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  -[UNNotificationAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[UNNotificationAction options](self, "options") ^ v4;
  -[UNNotificationAction title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[UNNotificationAction textInputButtonTitle](self, "textInputButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[UNNotificationAction textInputPlaceholder](self, "textInputPlaceholder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[UNNotificationAction url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (id)_description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAction title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAction icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAction options](self, "options");
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAction options](self, "options");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAction options](self, "options");
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, title: %@, icon: %@, isAuthenticationRequired: %@, isDestructive: %@, isForeground: %@"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[UNNotificationAction _description](self, "_description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
