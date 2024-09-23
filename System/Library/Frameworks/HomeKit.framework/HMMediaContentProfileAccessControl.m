@implementation HMMediaContentProfileAccessControl

- (HMMediaContentProfileAccessControl)initWithUser:(id)a3 accessories:(id)a4
{
  id v6;
  HMMediaContentProfileAccessControl *v7;
  uint64_t v8;
  NSMutableSet *internalAccessories;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMediaContentProfileAccessControl;
  v7 = -[HMAccessControl initWithUser:](&v11, sel_initWithUser_, a3);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    internalAccessories = v7->_internalAccessories;
    v7->_internalAccessories = (NSMutableSet *)v8;

  }
  return v7;
}

- (HMMediaContentProfileAccessControl)initWithUser:(id)a3
{
  return -[HMMediaContentProfileAccessControl initWithUser:accessories:](self, "initWithUser:accessories:", a3, MEMORY[0x1E0C9AA60]);
}

- (NSArray)accessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_internalAccessories, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableMediaContentProfileAccessControl *v4;
  void *v5;
  void *v6;
  HMMutableMediaContentProfileAccessControl *v7;

  v4 = +[HMMutableMediaContentProfileAccessControl allocWithZone:](HMMutableMediaContentProfileAccessControl, "allocWithZone:", a3);
  -[HMAccessControl user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaContentProfileAccessControl accessories](self, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMediaContentProfileAccessControl initWithUser:accessories:](v4, "initWithUser:accessories:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaContentProfileAccessControl *v4;
  HMMediaContentProfileAccessControl *v5;
  HMMediaContentProfileAccessControl *v6;
  HMMediaContentProfileAccessControl *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v16;

  v4 = (HMMediaContentProfileAccessControl *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMMediaContentProfileAccessControl;
    if (-[HMAccessControl isEqual:](&v16, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0C99E60];
        -[HMMediaContentProfileAccessControl accessories](self, "accessories");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = (void *)MEMORY[0x1E0C99E60];
        -[HMMediaContentProfileAccessControl accessories](v7, "accessories");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v10, "isEqualToSet:", v13);
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E3AB7688;
  }
  -[HMMediaContentProfileAccessControl accessories](self, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[HMMediaContentProfileAccessControl accessories](self, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Accessories = %@>"), v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Accessories = %@>"), v6, v7, CFSTR("None"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v3)
  return v10;
}

- (id)debugDescription
{
  return -[HMMediaContentProfileAccessControl descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMMediaContentProfileAccessControl descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAccessories, 0);
}

+ (BOOL)isAccessorySupported:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E")))
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v3, "supportsMediaContentProfile");

  if ((v6 & 1) == 0)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = 1;
LABEL_6:

  return v7;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
