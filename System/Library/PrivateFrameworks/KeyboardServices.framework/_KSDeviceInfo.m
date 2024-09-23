@implementation _KSDeviceInfo

+ (id)ksDecviceWithiCloudDeviceInfo:(id)a3
{
  id v3;
  _KSDeviceInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(_KSDeviceInfo);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSDeviceInfo setName:](v4, "setName:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("swVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSDeviceInfo setSwVersion:](v4, "setSwVersion:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSDeviceInfo setModel:](v4, "setModel:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("modelDisplayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_KSDeviceInfo setModelDisplayName:](v4, "setModelDisplayName:", v8);
  return v4;
}

+ (id)ksDecviceWithName:(id)a3 swVersion:(id)a4 model:(id)a5 modelDisplayName:(id)a6
{
  id v8;
  id v9;
  id v10;
  _KSDeviceInfo *v11;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(_KSDeviceInfo);
  -[_KSDeviceInfo setName:](v11, "setName:", v10);

  -[_KSDeviceInfo setSwVersion:](v11, "setSwVersion:", v9);
  -[_KSDeviceInfo setModel:](v11, "setModel:", v8);
  -[_KSDeviceInfo setModelDisplayName:](v11, "setModelDisplayName:", v8);

  return v11;
}

+ (id)ksDeviceWithName:(id)a3 needsUpgrade:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _KSDeviceInfo *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(_KSDeviceInfo);
  -[_KSDeviceInfo setName:](v6, "setName:", v5);

  -[_KSDeviceInfo setNeedsUpdate:](v6, "setNeedsUpdate:", v4);
  return v6;
}

+ (id)ksDeviceWithName:(id)a3 swVersion:(id)a4
{
  id v5;
  id v6;
  _KSDeviceInfo *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_KSDeviceInfo);
  -[_KSDeviceInfo setName:](v7, "setName:", v6);

  -[_KSDeviceInfo setSwVersion:](v7, "setSwVersion:", v5);
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)swVersion
{
  return self->_swVersion;
}

- (void)setSwVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (void)setModelDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
