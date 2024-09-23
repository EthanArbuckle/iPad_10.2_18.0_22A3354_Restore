@implementation HMDSiriAccessoryInfo

- (BOOL)isActiveAndSupportsDragonSiri
{
  void *v3;
  BOOL v4;

  -[HMDSiriAccessoryInfo targetsAccessory](self, "targetsAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[HMDSiriAccessoryInfo supportsDragonSiri](self, "supportsDragonSiri");
  else
    v4 = 0;

  return v4;
}

- (id)targetsAccessory
{
  return objc_loadWeakRetained(&self->_targetsAccessory);
}

- (void)setTargetsAccessory:(id)a3
{
  objc_storeWeak(&self->_targetsAccessory, a3);
}

- (BOOL)supportsDragonSiri
{
  return self->_supportsDragonSiri;
}

- (void)setSupportsDragonSiri:(BOOL)a3
{
  self->_supportsDragonSiri = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_targetsAccessory);
}

+ (id)infoWithTargetableAccessory:(id)a3
{
  id v3;
  HMDSiriAccessoryInfo *v4;
  HMDSiriAccessoryInfo *v5;

  v3 = a3;
  v4 = objc_alloc_init(HMDSiriAccessoryInfo);
  v5 = v4;
  if (v4)
    -[HMDSiriAccessoryInfo setTargetsAccessory:](v4, "setTargetsAccessory:", v3);

  return v5;
}

@end
