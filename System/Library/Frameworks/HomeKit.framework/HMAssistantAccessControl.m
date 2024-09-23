@implementation HMAssistantAccessControl

- (HMAssistantAccessControl)initWithUser:(id)a3
{
  HMAssistantAccessControl *v3;
  uint64_t v4;
  NSSet *accessories;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMAssistantAccessControl;
  v3 = -[HMAccessControl initWithUser:](&v7, sel_initWithUser_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    accessories = v3->_accessories;
    v3->_accessories = (NSSet *)v4;

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMAssistantAccessControl *v4;
  HMAssistantAccessControl *v5;
  HMAssistantAccessControl *v6;
  HMAssistantAccessControl *v7;
  _BOOL4 v8;
  unint64_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  char v33;
  objc_super v35;

  v4 = (HMAssistantAccessControl *)a3;
  if (self == v4)
  {
    v33 = 1;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)HMAssistantAccessControl;
    if (-[HMAccessControl isEqual:](&v35, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (!v7)
        goto LABEL_17;
      v8 = -[HMAssistantAccessControl isEnabled](self, "isEnabled");
      if (v8 != -[HMAssistantAccessControl isEnabled](v7, "isEnabled"))
        goto LABEL_17;
      v9 = -[HMAssistantAccessControl options](self, "options");
      if (v9 != -[HMAssistantAccessControl options](v7, "options"))
        goto LABEL_17;
      v10 = -[HMAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests");
      if (v10 != -[HMAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](v7, "areActivityNotificationsEnabledForPersonalRequests"))goto LABEL_17;
      -[HMAssistantAccessControl accessories](self, "accessories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      -[HMAssistantAccessControl accessories](v7, "accessories");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v12 == v14)
      {
        v15 = (void *)MEMORY[0x1A1AC1AAC]();
        v16 = (void *)MEMORY[0x1E0C99E20];
        -[HMAssistantAccessControl accessories](self, "accessories");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithCapacity:", objc_msgSend(v17, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x1E0C99E20];
        -[HMAssistantAccessControl accessories](v7, "accessories");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setWithCapacity:", objc_msgSend(v20, "count"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMAssistantAccessControl accessories](self, "accessories");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23)
        {
          v24 = 0;
          do
          {
            -[HMAssistantAccessControl accessories](self, "accessories");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "uuid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v27);

            -[HMAssistantAccessControl accessories](v7, "accessories");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndexedSubscript:", v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "uuid");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v30);

            ++v24;
            -[HMAssistantAccessControl accessories](self, "accessories");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "count");

          }
          while (v24 < v32);
        }
        v33 = objc_msgSend(v18, "isEqualToSet:", v21);

        objc_autoreleasePoolPop(v15);
      }
      else
      {
LABEL_17:
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
    }
  }

  return v33;
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
  void *v11;
  void *v12;
  void *v13;

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
  -[HMAssistantAccessControl isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMAssistantAccessControlOptionsToString(-[HMAssistantAccessControl options](self, "options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAssistantAccessControl accessories](self, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[HMAssistantAccessControl accessories](self, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Enabled = %@, Options = %@, Activity Notifications Enabled For Personal Requests = %@, Accessories = %@>"), v6, v7, v8, v9, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Enabled = %@, Options = %@, Activity Notifications Enabled For Personal Requests = %@, Accessories = %@>"), v6, v7, v8, v9, v10, CFSTR("None"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v3)
  return v13;
}

- (id)debugDescription
{
  return -[HMAssistantAccessControl descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMAssistantAccessControl descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)areActivityNotificationsEnabledForPersonalRequests
{
  return self->_activityNotificationsEnabledForPersonalRequests;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)allowUnauthenticatedRequests
{
  return -[HMAssistantAccessControl options](self, "options") & 1;
}

- (NSArray)accessories
{
  return -[NSSet allObjects](self->_accessories, "allObjects");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableAssistantAccessControl *v5;
  void *v6;
  HMMutableAssistantAccessControl *v7;
  void *v8;
  void *v9;

  v5 = +[HMMutableAssistantAccessControl allocWithZone:](HMMutableAssistantAccessControl, "allocWithZone:");
  -[HMAccessControl user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMAssistantAccessControl initWithUser:](v5, "initWithUser:", v6);

  -[HMMutableAssistantAccessControl setEnabled:](v7, "setEnabled:", -[HMAssistantAccessControl isEnabled](self, "isEnabled"));
  -[HMMutableAssistantAccessControl setOptions:](v7, "setOptions:", -[HMAssistantAccessControl options](self, "options"));
  -[HMMutableAssistantAccessControl setActivityNotificationsEnabledForPersonalRequests:](v7, "setActivityNotificationsEnabledForPersonalRequests:", -[HMAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests"));
  -[HMAssistantAccessControl accessories](self, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[HMMutableAssistantAccessControl setAccessories:](v7, "setAccessories:", v9);

  return v7;
}

- (HMAssistantAccessControl)initWithCoder:(id)a3
{
  id v4;
  HMAssistantAccessControl *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSSet *accessories;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAssistantAccessControl;
  v5 = -[HMAccessControl initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    *(&v5->_enabled + 4) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.enabled"));
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.options"));
    v5->_activityNotificationsEnabledForPersonalRequests = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.activityNotificationsEnabledForPersonalRequests"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), CFSTR("HM.accessories"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    accessories = v5->_accessories;
    v5->_accessories = (NSSet *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMAssistantAccessControl isEnabled](self, "isEnabled"), CFSTR("HM.enabled"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAssistantAccessControl options](self, "options"), CFSTR("HM.options"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests"), CFSTR("HM.activityNotificationsEnabledForPersonalRequests"));

}

- (BOOL)isEnabled
{
  return *(&self->_enabled + 4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
}

+ (BOOL)isAccessorySupported:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("1D8FD40E-7CAE-4AD5-9973-977D18890DE2"));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "siriEndpointProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  return v7;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
