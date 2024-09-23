@implementation ISURLResourcePropertySpecification

void __52__ISURLResourcePropertySpecification_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ISURLResourcePropertySpecification _init]([ISURLResourcePropertySpecification alloc], "_init");
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (id)_init
{
  ISURLResourcePropertySpecification *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *generalProperties;
  NSArray *applicationProperties;
  NSArray *v12;
  NSArray *volumeProperties;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *otherProperties;
  void *v18;
  void *v19;
  uint64_t v20;
  NSSet *allowedMissingProperties;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[10];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)ISURLResourcePropertySpecification;
  v2 = -[ISURLResourcePropertySpecification init](&v23, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x1E0C99A00];
    v26[0] = *MEMORY[0x1E0C999D0];
    v26[1] = v3;
    v4 = *MEMORY[0x1E0C99A48];
    v26[2] = *MEMORY[0x1E0C999E8];
    v26[3] = v4;
    v5 = *MEMORY[0x1E0C999C0];
    v26[4] = *MEMORY[0x1E0C999B8];
    v26[5] = v5;
    v6 = *MEMORY[0x1E0C99A18];
    v26[6] = *MEMORY[0x1E0C99A28];
    v26[7] = v6;
    v7 = *MEMORY[0x1E0C9AC60];
    v26[8] = *MEMORY[0x1E0C99AA8];
    v26[9] = v7;
    v27 = *MEMORY[0x1E0C9AC58];
    v8 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 11);
    v9 = objc_claimAutoreleasedReturnValue();
    generalProperties = v2->_generalProperties;
    v2->_generalProperties = (NSArray *)v9;

    applicationProperties = v2->_applicationProperties;
    v12 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_applicationProperties = (NSArray *)MEMORY[0x1E0C9AA60];

    volumeProperties = v2->_volumeProperties;
    v2->_volumeProperties = v12;

    v14 = *MEMORY[0x1E0C99A30];
    v25[0] = *MEMORY[0x1E0C998C8];
    v25[1] = v14;
    v15 = *MEMORY[0x1E0C998D8];
    v25[2] = *MEMORY[0x1E0C99A40];
    v25[3] = v15;
    v25[4] = *MEMORY[0x1E0C998C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
    v16 = objc_claimAutoreleasedReturnValue();
    otherProperties = v2->_otherProperties;
    v2->_otherProperties = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v24 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    allowedMissingProperties = v2->_allowedMissingProperties;
    v2->_allowedMissingProperties = (NSSet *)v20;

  }
  return v2;
}

- (NSArray)generalProperties
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_10);
  return (id)sharedInstance_sharedInstance_1;
}

- (NSArray)iconInitWithURLProperties
{
  return self->_generalProperties;
}

- (NSSet)allowedMissingProperties
{
  return self->_allowedMissingProperties;
}

- (NSArray)applicationProperties
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)volumeProperties
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)otherProperties
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherProperties, 0);
  objc_storeStrong((id *)&self->_allowedMissingProperties, 0);
  objc_storeStrong((id *)&self->_volumeProperties, 0);
  objc_storeStrong((id *)&self->_applicationProperties, 0);
  objc_storeStrong((id *)&self->_generalProperties, 0);
}

@end
