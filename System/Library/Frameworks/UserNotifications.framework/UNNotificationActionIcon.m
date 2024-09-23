@implementation UNNotificationActionIcon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UNNotificationActionIcon imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("imageName"));

  objc_msgSend(v5, "encodeBool:forKey:", -[UNNotificationActionIcon isSystemIcon](self, "isSystemIcon"), CFSTR("systemIcon"));
}

- (BOOL)isSystemIcon
{
  return self->_systemIcon;
}

- (NSString)imageName
{
  return self->_imageName;
}

+ (id)_iconWithImageName:(id)a3 systemIcon:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImageName:systemIcon:", v6, v4);

  return v7;
}

- (UNNotificationActionIcon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UNNotificationActionIcon *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("systemIcon"));
  v8 = -[UNNotificationActionIcon _initWithImageName:systemIcon:](self, "_initWithImageName:systemIcon:", v6, v7);

  return v8;
}

- (id)_initWithImageName:(id)a3 systemIcon:(BOOL)a4
{
  id v6;
  UNNotificationActionIcon *v7;
  uint64_t v8;
  NSString *imageName;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UNNotificationActionIcon;
  v7 = -[UNNotificationActionIcon init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    imageName = v7->_imageName;
    v7->_imageName = (NSString *)v8;

    v7->_systemIcon = a4;
  }

  return v7;
}

+ (UNNotificationActionIcon)iconWithSystemImageName:(NSString *)systemImageName
{
  return (UNNotificationActionIcon *)objc_msgSend(a1, "_iconWithImageName:systemIcon:", systemImageName, 1);
}

+ (UNNotificationActionIcon)iconWithTemplateImageName:(NSString *)templateImageName
{
  return (UNNotificationActionIcon *)objc_msgSend(a1, "_iconWithImageName:systemIcon:", templateImageName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[UNNotificationActionIcon imageName](self, "imageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[UNNotificationActionIcon isSystemIcon](self, "isSystemIcon");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationActionIcon imageName](self, "imageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualStrings(v5, v6))
    {
      v7 = -[UNNotificationActionIcon isSystemIcon](self, "isSystemIcon");
      v8 = v7 ^ objc_msgSend(v4, "isSystemIcon") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationActionIcon imageName](self, "imageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationActionIcon isSystemIcon](self, "isSystemIcon");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; imageName: %@, isSystemIcon: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[UNNotificationActionIcon _description](self, "_description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSystemIcon:(BOOL)a3
{
  self->_systemIcon = a3;
}

@end
