@implementation GCControllerElementSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCControllerElementSettings)initWithElementKey:(id)a3
{
  id v5;
  GCControllerElementSettings *v6;
  GCControllerElementSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCControllerElementSettings;
  v6 = -[GCControllerElementSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mappingKey, a3);
    -[GCControllerElementSettings setDefaultValues](v7, "setDefaultValues");
  }

  return v7;
}

- (BOOL)isCustomized
{
  return self->_invertVertically || self->_invertHorizontally || self->_swapAxes;
}

- (void)setDefaultValues
{
  *(_WORD *)&self->_invertHorizontally = 0;
  self->_swapAxes = 0;
}

- (void)setInvertVertically:(BOOL)a3
{
  void (**changedHandler)(id, GCControllerElementSettings *);

  if (self->_invertVertically != a3)
  {
    self->_invertVertically = a3;
    changedHandler = (void (**)(id, GCControllerElementSettings *))self->_changedHandler;
    if (changedHandler)
      changedHandler[2](changedHandler, self);
  }
}

- (void)setInvertHorizontally:(BOOL)a3
{
  void (**changedHandler)(id, GCControllerElementSettings *);

  if (self->_invertHorizontally != a3)
  {
    self->_invertHorizontally = a3;
    changedHandler = (void (**)(id, GCControllerElementSettings *))self->_changedHandler;
    if (changedHandler)
      changedHandler[2](changedHandler, self);
  }
}

- (void)setSwapAxes:(BOOL)a3
{
  void (**changedHandler)(id, GCControllerElementSettings *);

  if (self->_swapAxes != a3)
  {
    self->_swapAxes = a3;
    changedHandler = (void (**)(id, GCControllerElementSettings *))self->_changedHandler;
    if (changedHandler)
      changedHandler[2](changedHandler, self);
  }
}

- (void)setDictionaryRepresentation:(id)a3
{
  -[GCControllerElementSettings setDictionaryRepresentation:fromCoder:](self, "setDictionaryRepresentation:fromCoder:", a3, 0);
}

- (void)setDictionaryRepresentation:(id)a3 fromCoder:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSString *mappingKey;
  void *v19;
  int v20;
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  if (a4)
    goto LABEL_9;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("elementMappingKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_8:
    -[GCControllerElementSettings setDefaultValues](self, "setDefaultValues");
    goto LABEL_9;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("elementMappingKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", self->_mappingKey);

  if ((v10 & 1) == 0)
  {
    getGCSettingsLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mappingKey = self->_mappingKey;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("elementMappingKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = mappingKey;
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_215181000, v11, OS_LOG_TYPE_ERROR, "Attempting to set dictionary representation element settings with key %@ to representation with key %@", (uint8_t *)&v20, 0x16u);

    }
    goto LABEL_15;
  }
LABEL_9:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("invertHorizontally"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (self->_invertHorizontally != v13)
  {
    -[GCControllerElementSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("invertHorizontally"));
    self->_invertHorizontally = v13;
    -[GCControllerElementSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("invertHorizontally"));
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("invertVertically"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (self->_invertVertically != v15)
  {
    -[GCControllerElementSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("invertVertically"));
    self->_invertVertically = v15;
    -[GCControllerElementSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("invertVertically"));
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("swapAxes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (self->_swapAxes != v17)
  {
    -[GCControllerElementSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("swapAxes"));
    self->_swapAxes = v17;
    -[GCControllerElementSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("swapAxes"));
  }
LABEL_15:

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = self->_mappingKey;
  v8[0] = CFSTR("elementMappingKey");
  v8[1] = CFSTR("invertHorizontally");
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", self->_invertHorizontally);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("invertVertically");
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", self->_invertVertically);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("swapAxes");
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", self->_swapAxes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCControllerElementSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionaryRepresentation"));

}

- (GCControllerElementSettings)initWithCoder:(id)a3
{
  id v4;
  GCControllerElementSettings *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCControllerElementSettings;
  v5 = -[GCControllerElementSettings init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("dictionaryRepresentation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[GCControllerElementSettings setDefaultValues](v5, "setDefaultValues");
    -[GCControllerElementSettings setDictionaryRepresentation:fromCoder:](v5, "setDictionaryRepresentation:fromCoder:", v9, 1);

  }
  return v5;
}

- (NSString)mappingKey
{
  return self->_mappingKey;
}

- (id)changedHandler
{
  return self->_changedHandler;
}

- (void)setChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)invertHorizontally
{
  return self->_invertHorizontally;
}

- (BOOL)invertVertically
{
  return self->_invertVertically;
}

- (BOOL)swapAxes
{
  return self->_swapAxes;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changedHandler, 0);
  objc_storeStrong((id *)&self->_mappingKey, 0);
}

@end
