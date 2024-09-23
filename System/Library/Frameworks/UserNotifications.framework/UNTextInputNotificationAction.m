@implementation UNTextInputNotificationAction

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UNTextInputNotificationAction;
  if (-[UNNotificationAction isEqual:](&v11, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UNNotificationAction textInputButtonTitle](self, "textInputButtonTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textInputButtonTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (UNEqualObjects(v5, v6))
      {
        -[UNNotificationAction textInputPlaceholder](self, "textInputPlaceholder");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "textInputPlaceholder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = UNEqualObjects(v7, v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (UNTextInputNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options textInputButtonTitle:(NSString *)textInputButtonTitle textInputPlaceholder:(NSString *)textInputPlaceholder
{
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  void *v16;

  v12 = textInputPlaceholder;
  v13 = textInputButtonTitle;
  v14 = title;
  v15 = identifier;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v15, v14, options, v13, v12, 0, 0);

  return (UNTextInputNotificationAction *)v16;
}

+ (UNTextInputNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options icon:(UNNotificationActionIcon *)icon textInputButtonTitle:(NSString *)textInputButtonTitle textInputPlaceholder:(NSString *)textInputPlaceholder
{
  NSString *v14;
  NSString *v15;
  UNNotificationActionIcon *v16;
  NSString *v17;
  NSString *v18;
  void *v19;

  v14 = textInputPlaceholder;
  v15 = textInputButtonTitle;
  v16 = icon;
  v17 = title;
  v18 = identifier;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:url:icon:", v18, v17, options, v15, v14, 0, v16);

  return (UNTextInputNotificationAction *)v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UNNotificationAction _description](self, "_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAction textInputButtonTitle](self, "textInputButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAction textInputPlaceholder](self, "textInputPlaceholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, textInputButtonTitle: %@, textInputPlaceholder: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
