@implementation CCUIModuleInstance

- (CCSModuleMetadata)metadata
{
  return self->_metadata;
}

- (CCUILayoutSize)prototypeModuleSize
{
  unint64_t height;
  unint64_t width;
  CCUILayoutSize result;

  height = self->_prototypeModuleSize.height;
  width = self->_prototypeModuleSize.width;
  result.height = height;
  result.width = width;
  return result;
}

- (CCUIContentModule)module
{
  return self->_module;
}

- (CCUIModuleInstance)initWithMetadata:(id)a3 module:(id)a4 prototypeModuleSize:(CCUILayoutSize)a5
{
  unint64_t height;
  unint64_t width;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CCUIModuleInstance *v14;

  height = a5.height;
  width = a5.width;
  v9 = (void *)MEMORY[0x1E0CB3A28];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CCUIModuleInstance initWithMetadata:module:prototypeModuleSize:uniqueIdentifier:displayName:](self, "initWithMetadata:module:prototypeModuleSize:uniqueIdentifier:displayName:", v11, v10, width, height, v13, 0);
  return v14;
}

- (CCUIModuleInstance)initWithMetadata:(id)a3 module:(id)a4 prototypeModuleSize:(CCUILayoutSize)a5 uniqueIdentifier:(id)a6 displayName:(id)a7
{
  unint64_t height;
  unint64_t width;
  id v14;
  id v15;
  id v16;
  id v17;
  CCUIModuleInstance *v18;
  CCUIModuleInstance *v19;
  uint64_t v20;
  NSString *uniqueIdentifier;
  uint64_t v22;
  NSString *displayName;
  objc_super v25;

  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CCUIModuleInstance;
  v18 = -[CCUIModuleInstance init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_metadata, a3);
    objc_storeStrong((id *)&v19->_module, a4);
    v19->_prototypeModuleSize.width = width;
    v19->_prototypeModuleSize.height = height;
    v20 = objc_msgSend(v16, "copy");
    uniqueIdentifier = v19->_uniqueIdentifier;
    v19->_uniqueIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v17, "copy");
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v22;

  }
  return v19;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
