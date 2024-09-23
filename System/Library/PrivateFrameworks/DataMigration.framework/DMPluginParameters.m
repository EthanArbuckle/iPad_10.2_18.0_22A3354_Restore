@implementation DMPluginParameters

- (DMPluginParameters)initWithDispositionSupersetOfContext:(id)a3 backupDeviceUUID:(id)a4
{
  id v6;
  id v7;
  DMPluginParameters *v8;
  DMPluginParameters *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DMPluginParameters;
  v8 = -[DMPluginParameters init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[DMPluginParameters setDispositionSupersetOfContext:](v8, "setDispositionSupersetOfContext:", v6);
    -[DMPluginParameters setBackupDeviceUUID:](v9, "setBackupDeviceUUID:", v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_4;
  -[DMPluginParameters dispositionSupersetOfContext](self, "dispositionSupersetOfContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispositionSupersetOfContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[DMPluginParameters dispositionSupersetOfContext](self, "dispositionSupersetOfContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dispositionSupersetOfContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[DMPluginParameters backupDeviceUUID](self, "backupDeviceUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backupDeviceUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {
    v11 = 1;
  }
  else
  {
    -[DMPluginParameters backupDeviceUUID](self, "backupDeviceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backupDeviceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v14, "isEqualToString:", v15);

  }
LABEL_10:

  return v11;
}

+ (id)backupDeviceUUIDFromDispositionSupersetOfContext:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BackupDeviceUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (NSDictionary)dispositionSupersetOfContext
{
  return self->_dispositionSupersetOfContext;
}

- (void)setDispositionSupersetOfContext:(id)a3
{
  objc_storeStrong((id *)&self->_dispositionSupersetOfContext, a3);
}

- (NSString)backupDeviceUUID
{
  return self->_backupDeviceUUID;
}

- (void)setBackupDeviceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupDeviceUUID, 0);
  objc_storeStrong((id *)&self->_dispositionSupersetOfContext, 0);
}

@end
