@implementation AMSMetricsIdentifierKey

+ (id)keyWithName:(id)a3 crossDeviceSync:(BOOL)a4 isActiveITunesAccountRequired:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  void *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setName:", v7);

  objc_msgSend(v8, "setCrossDeviceSync:", v6);
  objc_msgSend(v8, "setIsActiveITunesAccountRequired:", v5);
  return v8;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setIsActiveITunesAccountRequired:(BOOL)a3
{
  self->_isActiveITunesAccountRequired = a3;
}

- (void)setCrossDeviceSync:(BOOL)a3
{
  self->_crossDeviceSync = a3;
}

+ (id)keyWithName:(id)a3 crossDeviceSync:(BOOL)a4
{
  return (id)objc_msgSend(a1, "keyWithName:crossDeviceSync:isActiveITunesAccountRequired:", a3, a4, 0);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isActiveITunesAccountRequired
{
  return self->_isActiveITunesAccountRequired;
}

- (BOOL)crossDeviceSync
{
  return self->_crossDeviceSync;
}

- (id)description
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSMetricsIdentifierKey;
  -[AMSMetricsIdentifierKey description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_crossDeviceSync);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActiveITunesAccountRequired);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (name: %@, crossDeviceSync: %@, isActiveITunesAccountRequired: %@)"), name, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
