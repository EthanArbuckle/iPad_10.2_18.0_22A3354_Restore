@implementation HMBLocalZoneConfiguration

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMBMutableLocalZoneConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[HMBMutableLocalZoneConfiguration init](+[HMBMutableLocalZoneConfiguration allocWithZone:](HMBMutableLocalZoneConfiguration, "allocWithZone:", a3), "init");
  -[HMBLocalZoneConfiguration setReadOnly:](v4, "setReadOnly:", -[HMBLocalZoneConfiguration readOnly](self, "readOnly"));
  -[HMBLocalZoneConfiguration setCreateIfNeeded:](v4, "setCreateIfNeeded:", -[HMBLocalZoneConfiguration createIfNeeded](self, "createIfNeeded"));
  -[HMBLocalZoneConfiguration modelContainer](self, "modelContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZoneConfiguration setModelContainer:](v4, "setModelContainer:", v5);

  -[HMBLocalZoneConfiguration delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZoneConfiguration setDelegate:](v4, "setDelegate:", v6);

  return v4;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)createIfNeeded
{
  return self->_createIfNeeded;
}

- (void)setCreateIfNeeded:(BOOL)a3
{
  self->_createIfNeeded = a3;
}

- (HMBModelContainer)modelContainer
{
  return self->_modelContainer;
}

- (void)setModelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_modelContainer, a3);
}

- (HMBLocalZoneDelegate)delegate
{
  return (HMBLocalZoneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modelContainer, 0);
}

@end
