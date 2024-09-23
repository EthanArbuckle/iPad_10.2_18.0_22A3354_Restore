@implementation UNNotificationIcon

+ (id)iconNamed:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIconInfo:type:shouldSuppressMask:", v4, 1, 0);

  return v5;
}

+ (id)iconAtPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIconInfo:type:shouldSuppressMask:", v4, 2, 0);

  return v5;
}

+ (id)iconForApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIconInfo:type:shouldSuppressMask:", v4, 3, 0);

  return v5;
}

+ (id)iconForSystemImageNamed:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIconInfo:type:shouldSuppressMask:", v4, 4, 0);

  return v5;
}

+ (id)iconWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIconInfo:type:shouldSuppressMask:", v4, 5, 0);

  return v5;
}

+ (id)iconNamed:(id)a3 shouldSuppressMask:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIconInfo:type:shouldSuppressMask:", v6, 1, v4);

  return v7;
}

+ (id)iconAtPath:(id)a3 shouldSuppressMask:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIconInfo:type:shouldSuppressMask:", v6, 2, v4);

  return v7;
}

- (id)_initWithIconInfo:(id)a3 type:(int64_t)a4 shouldSuppressMask:(BOOL)a5
{
  id v8;
  UNNotificationIcon *v9;
  uint64_t v10;
  id iconInfo;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNNotificationIcon;
  v9 = -[UNNotificationIcon init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    iconInfo = v9->_iconInfo;
    v9->_iconInfo = (id)v10;

    v9->_iconInfoType = a4;
    v9->_shouldSuppressMask = a5;
  }

  return v9;
}

- (UNNotificationIcon)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationIcon.m"), 74, CFSTR("use appropriate class method"));

  return 0;
}

- (id)applicationIdentifier
{
  uint64_t v3;
  void *v4;

  if (self->_iconInfoType == 3)
  {
    v3 = objc_opt_class();
    UNSafeCast(v3, self->_iconInfo);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)name
{
  uint64_t v3;
  void *v4;

  if (self->_iconInfoType == 1)
  {
    v3 = objc_opt_class();
    UNSafeCast(v3, self->_iconInfo);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)path
{
  uint64_t v3;
  void *v4;

  if (self->_iconInfoType == 2)
  {
    v3 = objc_opt_class();
    UNSafeCast(v3, self->_iconInfo);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)systemImageName
{
  uint64_t v3;
  void *v4;

  if (self->_iconInfoType == 4)
  {
    v3 = objc_opt_class();
    UNSafeCast(v3, self->_iconInfo);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)data
{
  uint64_t v3;
  void *v4;

  if (self->_iconInfoType == 5)
  {
    v3 = objc_opt_class();
    UNSafeCast(v3, self->_iconInfo);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)shouldSuppressMask
{
  return self->_shouldSuppressMask;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = objc_msgSend(self->_iconInfo, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_iconInfoType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3 ^ self->_shouldSuppressMask;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  BOOL v5;

  v4 = (void **)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && UNEqualStrings(self->_iconInfo, v4[1])
    && (void *)self->_iconInfoType == v4[2]
    && self->_shouldSuppressMask == *((unsigned __int8 *)v4 + 24);

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_iconInfoType - 1;
  if (v5 > 4)
    v6 = CFSTR("[INVALID]");
  else
    v6 = off_1E57EFA98[v5];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; iconInfo: %@; iconInfoType: %@; shouldSuppressMask: %d>"),
               v4,
               self,
               self->_iconInfo,
               v6,
               self->_shouldSuppressMask);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 2, CFSTR("codingVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_iconInfo, CFSTR("iconInfo"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_iconInfoType, CFSTR("iconInfoType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldSuppressMask, CFSTR("shouldSuppressMask"));

}

- (UNNotificationIcon)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UNNotificationIcon *v13;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingVersion")) == 2)
  {
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("iconInfoType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconInfo"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuppressMask"));
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v5 = 3;
      v11 = v8;
    }
    else
    {
      v12 = objc_msgSend(v9, "length");
      if (v12)
        v11 = v9;
      else
        v11 = v10;
      if (v12)
        v5 = 1;
      else
        v5 = 2;
    }
    v6 = v11;

    v7 = 0;
  }
  v13 = -[UNNotificationIcon _initWithIconInfo:type:shouldSuppressMask:](self, "_initWithIconInfo:type:shouldSuppressMask:", v6, v5, v7);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_iconInfo, 0);
}

@end
