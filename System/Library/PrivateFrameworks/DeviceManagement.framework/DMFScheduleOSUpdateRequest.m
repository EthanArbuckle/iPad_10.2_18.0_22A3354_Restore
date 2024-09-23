@implementation DMFScheduleOSUpdateRequest

+ (BOOL)_action:(unint64_t *)a3 fromString:(id)a4
{
  BOOL v4;
  void *v6;
  unint64_t v7;

  v4 = 0;
  if (a3 && a4)
  {
    objc_msgSend(a4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("download")) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("install")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("default")))
      {
        v4 = 0;
        goto LABEL_10;
      }
      v7 = 2;
    }
    *a3 = v7;
    v4 = 1;
LABEL_10:

  }
  return v4;
}

+ (id)_descriptionForAction:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Invalid Action");
  else
    return off_1E6ED8A10[a3];
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMFScheduleOSUpdateRequest _descriptionForAction:](DMFScheduleOSUpdateRequest, "_descriptionForAction:", -[DMFScheduleOSUpdateRequest action](self, "action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tAction          : %@\n"), v4);

  -[DMFScheduleOSUpdateRequest productKey](self, "productKey");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("None");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tProduct Key     : %@\n"), v7);

  -[DMFScheduleOSUpdateRequest productVersion](self, "productVersion");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("None");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tProduct Version : %@\n"), v10);

  v11 = -[DMFScheduleOSUpdateRequest useDelay](self, "useDelay");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tUse Delay       : %@\n"), v12);
  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (DMFScheduleOSUpdateRequest)init
{
  DMFScheduleOSUpdateRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFScheduleOSUpdateRequest;
  result = -[CATTaskRequest init](&v3, sel_init);
  if (result)
  {
    result->_action = 2;
    result->_useDelay = 0;
  }
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4D30;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFScheduleOSUpdateRequest)initWithCoder:(id)a3
{
  id v4;
  DMFScheduleOSUpdateRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *productKey;
  void *v9;
  uint64_t v10;
  NSString *productVersion;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DMFScheduleOSUpdateRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("productKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    productKey = v5->_productKey;
    v5->_productKey = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("productVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_action = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useDelay"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useDelay = objc_msgSend(v13, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMFScheduleOSUpdateRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[DMFScheduleOSUpdateRequest productKey](self, "productKey", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("productKey"));

  -[DMFScheduleOSUpdateRequest productVersion](self, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFScheduleOSUpdateRequest action](self, "action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("action"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFScheduleOSUpdateRequest useDelay](self, "useDelay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("useDelay"));

}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (NSString)productKey
{
  return self->_productKey;
}

- (void)setProductKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)useDelay
{
  return self->_useDelay;
}

- (void)setUseDelay:(BOOL)a3
{
  self->_useDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productKey, 0);
}

@end
