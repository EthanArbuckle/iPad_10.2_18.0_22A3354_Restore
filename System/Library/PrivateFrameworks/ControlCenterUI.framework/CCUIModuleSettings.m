@implementation CCUIModuleSettings

- (CCUIModuleSettings)initWithGridSizeClass:(id)a3 moduleContainerBundleIdentifier:(id)a4 controlExtensionIdentifier:(id)a5 controlContainerBundleIdentifier:(id)a6 controlKind:(id)a7 controlType:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CCUIModuleSettings *v20;
  uint64_t v21;
  NSString *gridSizeClass;
  uint64_t v23;
  NSString *moduleContainerBundleIdentifier;
  uint64_t v25;
  NSString *parityControlExtensionIdentifier;
  uint64_t v27;
  NSString *parityControlContainerBundleIdentifier;
  uint64_t v29;
  NSString *parityControlKind;
  uint64_t v31;
  NSString *parityControlType;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CCUIModuleSettings;
  v20 = -[CCUIModuleSettings init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    gridSizeClass = v20->_gridSizeClass;
    v20->_gridSizeClass = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    moduleContainerBundleIdentifier = v20->_moduleContainerBundleIdentifier;
    v20->_moduleContainerBundleIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    parityControlExtensionIdentifier = v20->_parityControlExtensionIdentifier;
    v20->_parityControlExtensionIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    parityControlContainerBundleIdentifier = v20->_parityControlContainerBundleIdentifier;
    v20->_parityControlContainerBundleIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    parityControlKind = v20->_parityControlKind;
    v20->_parityControlKind = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    parityControlType = v20->_parityControlType;
    v20->_parityControlType = (NSString *)v31;

  }
  return v20;
}

- (CCUIModuleSettings)initWithGridSizeClass:(id)a3 containerBundleIdentifier:(id)a4
{
  return -[CCUIModuleSettings initWithGridSizeClass:moduleContainerBundleIdentifier:controlExtensionIdentifier:controlContainerBundleIdentifier:controlKind:controlType:](self, "initWithGridSizeClass:moduleContainerBundleIdentifier:controlExtensionIdentifier:controlContainerBundleIdentifier:controlKind:controlType:", a3, a4, 0, 0, 0, 0);
}

- (id)description
{
  void *v3;
  NSString *parityControlExtensionIdentifier;
  NSString *parityControlContainerBundleIdentifier;
  NSString *parityControlKind;
  NSString *parityControlType;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_gridSizeClass, CFSTR("Grid size class"));
  objc_msgSend(v3, "appendString:withName:", self->_moduleContainerBundleIdentifier, CFSTR("Container bundle identifier"));
  parityControlExtensionIdentifier = self->_parityControlExtensionIdentifier;
  if (parityControlExtensionIdentifier)
    objc_msgSend(v3, "appendString:withName:", parityControlExtensionIdentifier, CFSTR("Parity control extension identifier"));
  parityControlContainerBundleIdentifier = self->_parityControlContainerBundleIdentifier;
  if (parityControlContainerBundleIdentifier)
    objc_msgSend(v3, "appendString:withName:", parityControlContainerBundleIdentifier, CFSTR("Parity control container bundle identifier"));
  parityControlKind = self->_parityControlKind;
  if (parityControlKind)
    objc_msgSend(v3, "appendString:withName:", parityControlKind, CFSTR("Parity control kind"));
  parityControlType = self->_parityControlType;
  if (parityControlType)
    objc_msgSend(v3, "appendString:withName:", parityControlType, CFSTR("Parity control type"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_gridSizeClass);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_moduleContainerBundleIdentifier);
  if (self->_parityControlExtensionIdentifier)
    v6 = (id)objc_msgSend(v3, "appendString:");
  if (self->_parityControlContainerBundleIdentifier)
    v7 = (id)objc_msgSend(v3, "appendString:");
  if (self->_parityControlKind)
    v8 = (id)objc_msgSend(v3, "appendString:");
  if (self->_parityControlType)
    v9 = (id)objc_msgSend(v3, "appendString:");
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CCUIModuleSettings *v4;
  CCUIModuleSettings *v5;
  char v6;

  v4 = (CCUIModuleSettings *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if (BSEqualStrings()
        && BSEqualStrings()
        && BSEqualStrings()
        && BSEqualStrings()
        && BSEqualStrings())
      {
        v6 = BSEqualStrings();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (void)setGridSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)moduleContainerBundleIdentifier
{
  return self->_moduleContainerBundleIdentifier;
}

- (NSString)parityControlExtensionIdentifier
{
  return self->_parityControlExtensionIdentifier;
}

- (NSString)parityControlContainerBundleIdentifier
{
  return self->_parityControlContainerBundleIdentifier;
}

- (NSString)parityControlKind
{
  return self->_parityControlKind;
}

- (NSString)parityControlType
{
  return self->_parityControlType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parityControlType, 0);
  objc_storeStrong((id *)&self->_parityControlKind, 0);
  objc_storeStrong((id *)&self->_parityControlContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_parityControlExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_moduleContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
}

@end
