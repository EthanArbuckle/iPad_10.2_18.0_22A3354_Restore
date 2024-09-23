@implementation BKSMousePointerDevice

- (BKSMousePointerDevice)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSMousePointerDevice.m"), 22, CFSTR("-init is not allowed on %@"), objc_opt_class());

  return 0;
}

- (BKSMousePointerDevice)initWithSenderDescriptor:(id)a3
{
  id v5;
  void *v6;
  BKSMousePointerDevice *v7;
  uint64_t v8;
  BKSHIDEventSenderDescriptor *senderDescriptor;
  void *v11;
  objc_super v12;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  if ((objc_msgSend(v6, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSMousePointerDevice.m"), 27, CFSTR("subclassing BKSMousePointerDevice is not supported"));

  }
  v12.receiver = self;
  v12.super_class = (Class)BKSMousePointerDevice;
  v7 = -[BKSMousePointerDevice init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v5, "copy");
    senderDescriptor = v7->_senderDescriptor;
    v7->_senderDescriptor = (BKSHIDEventSenderDescriptor *)v8;

  }
  return v7;
}

- (id)preferences
{
  void *v3;
  void *v4;

  +[BKSMousePointerService sharedInstance](BKSMousePointerService, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesForDevice:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPreferences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[BKSMousePointerService sharedInstance](BKSMousePointerService, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferences:forDevice:", v4, self);

}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventSenderDescriptor *senderDescriptor;
  id v5;

  senderDescriptor = self->_senderDescriptor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", senderDescriptor, CFSTR("t:1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferenceKey, CFSTR("t:2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productName, CFSTR("t:3"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturerName, CFSTR("t:4"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVirtualMouseButtons, CFSTR("t:5"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsDragLock, CFSTR("t:6"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsLightClick, CFSTR("t:7"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsSystemHaptics, CFSTR("t:8"));

}

- (BKSMousePointerDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *productName;
  NSString *v9;
  NSString *manufacturerName;
  char v11;
  BKSMousePointerDevice *v12;
  BKSMousePointerDevice *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t:1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t:2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t:3"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  productName = self->_productName;
  self->_productName = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t:4"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v9;

  self->_hasVirtualMouseButtons = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("t:5"));
  self->_supportsDragLock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("t:6"));
  self->_supportsLightClick = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("t:7"));
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("t:8"));

  self->_supportsSystemHaptics = v11;
  v12 = -[BKSMousePointerDevice initWithSenderDescriptor:](self, "initWithSenderDescriptor:", v5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_preferenceKey, v6);

  return v13;
}

- (id)initForProtobufDecoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSMousePointerDevice;
  return -[BKSMousePointerDevice init](&v3, sel_init);
}

- (unint64_t)hash
{
  return -[BKSHIDEventSenderDescriptor hash](self->_senderDescriptor, "hash");
}

- (BOOL)isEqual:(id)a3
{
  BKSMousePointerDevice *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BKSMousePointerDevice *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && -[BKSHIDEventSenderDescriptor isEqual:](self->_senderDescriptor, "isEqual:", v4->_senderDescriptor)
      && -[NSString isEqual:](self->_preferenceKey, "isEqual:", v4->_preferenceKey)
      && -[NSString isEqual:](self->_productName, "isEqual:", v4->_productName)
      && -[NSString isEqual:](self->_manufacturerName, "isEqual:", v4->_manufacturerName)
      && self->_hasVirtualMouseButtons == v4->_hasVirtualMouseButtons
      && self->_supportsDragLock == v4->_supportsDragLock
      && self->_supportsLightClick == v4->_supportsLightClick
      && self->_supportsSystemHaptics == v4->_supportsSystemHaptics;
  }

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)BKSMousePointerDevice;
  -[BKSMousePointerDevice description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ -- product:%@ manufacturer:%@ pref:%@ virtalButtons:%d supportsDragLock:%d"), self->_senderDescriptor, self->_productName, self->_manufacturerName, self->_preferenceKey, self->_hasVirtualMouseButtons, self->_supportsDragLock);
  objc_msgSend(v5, "appendFormat:", CFSTR(" supportsLightClick:%d supportsSystemHaptics:%d"), self->_supportsLightClick, self->_supportsSystemHaptics);
  return (NSString *)v5;
}

- (BKSHIDEventSenderDescriptor)senderDescriptor
{
  return self->_senderDescriptor;
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasVirtualMouseButtons
{
  return self->_hasVirtualMouseButtons;
}

- (void)setHasVirtualMouseButtons:(BOOL)a3
{
  self->_hasVirtualMouseButtons = a3;
}

- (BOOL)supportsDragLock
{
  return self->_supportsDragLock;
}

- (void)setSupportsDragLock:(BOOL)a3
{
  self->_supportsDragLock = a3;
}

- (BOOL)supportsLightClick
{
  return self->_supportsLightClick;
}

- (void)setSupportsLightClick:(BOOL)a3
{
  self->_supportsLightClick = a3;
}

- (BOOL)supportsSystemHaptics
{
  return self->_supportsSystemHaptics;
}

- (void)setSupportsSystemHaptics:(BOOL)a3
{
  self->_supportsSystemHaptics = a3;
}

- (NSString)preferenceKey
{
  return self->_preferenceKey;
}

- (void)setPreferenceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceKey, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BKSMousePointerDevice_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_2615 != -1)
    dispatch_once(&protobufSchema_onceToken_2615, block);
  return (id)protobufSchema_schema_2616;
}

void __39__BKSMousePointerDevice_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_2618);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_2616;
  protobufSchema_schema_2616 = v1;

}

void __39__BKSMousePointerDevice_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_senderDescriptor");
  objc_msgSend(v2, "addField:", "_preferenceKey");
  objc_msgSend(v2, "addField:", "_productName");
  objc_msgSend(v2, "addField:", "_manufacturerName");
  objc_msgSend(v2, "addField:", "_hasVirtualMouseButtons");
  objc_msgSend(v2, "addField:", "_supportsDragLock");
  objc_msgSend(v2, "addField:", "_supportsLightClick");
  objc_msgSend(v2, "addField:", "_supportsSystemHaptics");

}

@end
