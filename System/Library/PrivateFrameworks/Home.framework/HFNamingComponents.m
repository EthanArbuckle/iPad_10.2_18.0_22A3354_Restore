@implementation HFNamingComponents

+ (id)namingComponentFromService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHomeKitObject:", v3);
  objc_msgSend(v4, "setIsService:", 1);
  objc_msgSend(v3, "hf_parentService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsChildService:", v5 != 0);

  objc_msgSend(v4, "setAllowsNullResettableName:", 0);
  objc_msgSend(v4, "setIsTelevision:", objc_msgSend(v3, "hf_isTelevision"));
  v6 = objc_msgSend(v3, "hf_isTelevision");

  objc_msgSend(v4, "setAllowsEmptyNameTextField:", v6);
  return v4;
}

- (HFNamingComponents)initWithHomeKitObject:(id)a3
{
  id v5;
  HFNamingComponents *v6;
  HFNamingComponents *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFNamingComponents;
  v6 = -[HFNamingComponents init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_homeKitObject, a3);
    -[HFNamingComponents setAllowsEmptyNameTextField:](v7, "setAllowsEmptyNameTextField:", 0);
    -[HFNamingComponents setAllowsNullResettableName:](v7, "setAllowsNullResettableName:", 0);
    -[HFNamingComponents setIsAccessory:](v7, "setIsAccessory:", 0);
    -[HFNamingComponents setIsDiscoveredAccessory:](v7, "setIsDiscoveredAccessory:", 0);
    -[HFNamingComponents setIsService:](v7, "setIsService:", 0);
    -[HFNamingComponents setIsChildService:](v7, "setIsChildService:", 0);
    -[HFNamingComponents setIsServiceGroup:](v7, "setIsServiceGroup:", 0);
    -[HFNamingComponents setIsMediaAccessoryOrStereoPair:](v7, "setIsMediaAccessoryOrStereoPair:", 0);
    -[HFNamingComponents setIsTelevision:](v7, "setIsTelevision:", 0);
  }

  return v7;
}

- (void)setIsTelevision:(BOOL)a3
{
  self->_isTelevision = a3;
}

- (void)setAllowsNullResettableName:(BOOL)a3
{
  self->_allowsNullResettableName = a3;
}

- (void)setAllowsEmptyNameTextField:(BOOL)a3
{
  self->_allowsEmptyNameTextField = a3;
}

- (void)setIsService:(BOOL)a3
{
  self->_isService = a3;
}

- (void)setIsChildService:(BOOL)a3
{
  self->_isChildService = a3;
}

- (void)setIsMediaAccessoryOrStereoPair:(BOOL)a3
{
  self->_isMediaAccessoryOrStereoPair = a3;
}

- (void)setIsAccessory:(BOOL)a3
{
  self->_isAccessory = a3;
}

- (void)setIsServiceGroup:(BOOL)a3
{
  self->_isServiceGroup = a3;
}

- (void)setIsDiscoveredAccessory:(BOOL)a3
{
  self->_isDiscoveredAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_homeKitObject, 0);
}

- (NSString)name
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;

  if (-[HFNamingComponents isMediaAccessoryOrStereoPair](self, "isMediaAccessoryOrStereoPair"))
    goto LABEL_2;
  if (!-[HFNamingComponents isTelevision](self, "isTelevision"))
  {
    -[HFNamingComponents homeKitObject](self, "homeKitObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      objc_opt_class();
      -[HFNamingComponents homeKitObject](self, "homeKitObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v4 = v14;

      if (v4)
      {
        objc_msgSend(v4, "accessory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[HFNamingComponents homeKitObject](self, "homeKitObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Could not determine name for HFNamingComponents created with object: %@"), v15);
        v9 = 0;
      }

      goto LABEL_11;
    }
    -[HFNamingComponents homeKitObject](self, "homeKitObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v9 = v5;
LABEL_11:

    return (NSString *)v9;
  }
  -[HFNamingComponents defaultName](self, "defaultName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFNamingComponents configuredName](self, "configuredName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (!v8)
  {
LABEL_2:
    -[HFNamingComponents configuredName](self, "configuredName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[HFNamingComponents categoryName](self, "categoryName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_10;
  }
  -[HFNamingComponents categoryName](self, "categoryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v9;
}

- (id)homeKitObject
{
  return self->_homeKitObject;
}

- (BOOL)isTelevision
{
  return self->_isTelevision;
}

- (BOOL)isMediaAccessoryOrStereoPair
{
  return self->_isMediaAccessoryOrStereoPair;
}

+ (id)namingComponentFromAccessory:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHomeKitObject:", v3);
  v5 = 1;
  objc_msgSend(v4, "setIsAccessory:", 1);
  objc_msgSend(v4, "setIsMediaAccessoryOrStereoPair:", objc_msgSend(v3, "hf_isMediaAccessory"));
  objc_msgSend(v4, "setIsTelevision:", objc_msgSend(v3, "hf_isTelevision"));
  objc_msgSend(v4, "setAllowsNullResettableName:", objc_msgSend(v3, "hf_isMediaAccessory"));
  if ((objc_msgSend(v3, "hf_isMediaAccessory") & 1) == 0)
    v5 = objc_msgSend(v3, "hf_isTelevision");
  objc_msgSend(v4, "setAllowsEmptyNameTextField:", v5);

  return v4;
}

+ (id)namingComponentFromServiceGroup:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHomeKitObject:", v3);

  objc_msgSend(v4, "setIsServiceGroup:", 1);
  objc_msgSend(v4, "setAllowsNullResettableName:", 0);
  return v4;
}

+ (id)namingComponentFromMediaProfile:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v3, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithHomeKitObject:", v5);
  objc_msgSend(v6, "setIsAccessory:", 1);
  objc_msgSend(v6, "setIsMediaAccessoryOrStereoPair:", 1);
  objc_msgSend(v6, "setIsTelevision:", 0);
  objc_msgSend(v6, "setAllowsNullResettableName:", 1);
  objc_msgSend(v6, "setAllowsEmptyNameTextField:", 1);
  return v6;
}

+ (id)namingComponentFromMediaSystem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHomeKitObject:", v3);

  objc_msgSend(v4, "setIsMediaAccessoryOrStereoPair:", 1);
  objc_msgSend(v4, "setAllowsNullResettableName:", 1);
  objc_msgSend(v4, "setAllowsEmptyNameTextField:", 1);
  return v4;
}

+ (id)namingComponentFromDiscoveredAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHomeKitObject:", v3);
  objc_msgSend(v4, "setIsDiscoveredAccessory:", 1);
  objc_msgSend(v3, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsMediaAccessoryOrStereoPair:", objc_msgSend(v5, "hf_isMediaAccessory"));

  objc_msgSend(v3, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsTelevision:", objc_msgSend(v6, "hf_isTelevision"));
  return v4;
}

+ (id)namingComponentFromHomeKitObject:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "namingComponentFromService:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "namingComponentFromAccessory:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "namingComponentFromMediaProfile:", v3);
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_opt_class(), "namingComponentFromMediaSystem:", v3);
          v4 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v6 = (void *)objc_opt_class();
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v6, "namingComponentFromServiceGroup:", v3);
            v4 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v4 = objc_msgSend(objc_alloc((Class)v6), "initWithHomeKitObject:", v3);
          }
        }
      }
    }
  }
  v7 = (void *)v4;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFNamingComponents name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("name"));

  -[HFNamingComponents placeholderText](self, "placeholderText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("placeholder text"));

  -[HFNamingComponents textFieldDisplayText](self, "textFieldDisplayText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("text field text"));

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)placeholderText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[HFNamingComponents isTelevision](self, "isTelevision"))
  {
    -[HFNamingComponents categoryName](self, "categoryName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFNamingComponents defaultName](self, "defaultName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[HFNamingComponents name](self, "name");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v6;

  }
  return (NSString *)v3;
}

- (NSString)textFieldDisplayText
{
  void *v3;
  void *v4;
  HFNamingComponents *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (!-[HFNamingComponents allowsEmptyNameTextField](self, "allowsEmptyNameTextField"))
    goto LABEL_11;
  if (!-[HFNamingComponents isMediaAccessoryOrStereoPair](self, "isMediaAccessoryOrStereoPair"))
  {
    if (-[HFNamingComponents isTelevision](self, "isTelevision"))
    {
      -[HFNamingComponents defaultName](self, "defaultName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[HFNamingComponents configuredName](self, "configuredName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = self;
        goto LABEL_8;
      }
    }
LABEL_11:
    -[HFNamingComponents name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v9;
  }
  -[HFNamingComponents defaultName](self, "defaultName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFNamingComponents name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  if (v3)
  {
LABEL_8:
    -[HFNamingComponents defaultName](v5, "defaultName");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[HFNamingComponents roomName](self, "roomName");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v8 = (void *)v6;
  if ((objc_msgSend(v4, "isEqualToString:", v6) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[HFNamingComponents name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (id)homeKitSafeStringForString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    +[HFUtilities sanitizeUserEnteredHomeKitName:](HFUtilities, "sanitizeUserEnteredHomeKitName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v6 = v5;
    }
    else
    {
      if (-[HFNamingComponents allowsEmptyNameTextField](self, "allowsEmptyNameTextField"))
      {
        v7 = 0;
        goto LABEL_14;
      }
      if (-[HFNamingComponents isChildService](self, "isChildService"))
      {
        -[HFNamingComponents defaultName](self, "defaultName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = v8;
        }
        else
        {
          -[HFNamingComponents name](self, "name");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v7 = v10;

        goto LABEL_14;
      }
      -[HFNamingComponents textFieldDisplayText](self, "textFieldDisplayText");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
LABEL_14:

    goto LABEL_15;
  }
  -[HFNamingComponents textFieldDisplayText](self, "textFieldDisplayText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v7;
}

- (id)commitableNameForString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    if (-[HFNamingComponents allowsNullResettableName](self, "allowsNullResettableName"))
    {
      v5 = v4;
      goto LABEL_7;
    }
    -[HFNamingComponents defaultName](self, "defaultName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HFNamingComponents defaultName](self, "defaultName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  -[HFNamingComponents homeKitSafeStringForString:](self, "homeKitSafeStringForString:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = v5;

  return v7;
}

- (id)roomName
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFNamingComponents homeKitObject](self, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1F04292C0);

  if (v4)
  {
    -[HFNamingComponents homeKitObject](self, "homeKitObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_parentRoom");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSString)defaultName
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  if (-[HFNamingComponents isService](self, "isService"))
  {
    objc_opt_class();
    -[HFNamingComponents homeKitObject](self, "homeKitObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

LABEL_6:
    objc_msgSend(v5, "defaultName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v11 = v6;

    return (NSString *)v11;
  }
  if (-[HFNamingComponents isMediaAccessoryOrStereoPair](self, "isMediaAccessoryOrStereoPair"))
  {
    -[HFNamingComponents categoryName](self, "categoryName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v7)
    {
      v6 = v7;
    }
    else
    {
      -[HFNamingComponents roomName](self, "roomName");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_17;
  }
  if (-[HFNamingComponents isTelevision](self, "isTelevision"))
  {
    objc_opt_class();
    -[HFNamingComponents homeKitObject](self, "homeKitObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "hf_primaryService");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v11 = 0;
  return (NSString *)v11;
}

- (id)configuredName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HFNamingComponents homeKitObject](self, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HFNamingComponents homeKitObject](self, "homeKitObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuredName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)categoryName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  if (!-[HFNamingComponents isAccessory](self, "isAccessory"))
  {
    if (!-[HFNamingComponents isDiscoveredAccessory](self, "isDiscoveredAccessory"))
    {
      if (-[HFNamingComponents isService](self, "isService"))
      {
        objc_opt_class();
        -[HFNamingComponents homeKitObject](self, "homeKitObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
        v8 = v7;

        objc_msgSend(v8, "accessory");
        v5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      if (!-[HFNamingComponents isMediaAccessoryOrStereoPair](self, "isMediaAccessoryOrStereoPair"))
      {
        v9 = 0;
        return v9;
      }
    }
    objc_opt_class();
    -[HFNamingComponents homeKitObject](self, "homeKitObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(v12, "category");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "categoryType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_userFriendlyLocalizedCapitalizedDescription:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  objc_opt_class();
  -[HFNamingComponents homeKitObject](self, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

LABEL_12:
  objc_msgSend(v5, "hf_userFriendlyLocalizedCapitalizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v9;
}

- (BOOL)isAccessory
{
  return self->_isAccessory;
}

- (BOOL)isDiscoveredAccessory
{
  return self->_isDiscoveredAccessory;
}

- (BOOL)isService
{
  return self->_isService;
}

- (BOOL)isChildService
{
  return self->_isChildService;
}

- (BOOL)isServiceGroup
{
  return self->_isServiceGroup;
}

- (BOOL)allowsEmptyNameTextField
{
  return self->_allowsEmptyNameTextField;
}

- (BOOL)allowsNullResettableName
{
  return self->_allowsNullResettableName;
}

@end
