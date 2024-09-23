@implementation HDAppSubscription

- (HDAppSubscription)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDAppSubscription)initWithBundleIdentifier:(id)a3 dataCode:(int64_t)a4
{
  id v7;
  HDAppSubscription *v8;
  HDAppSubscription *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDAppSubscription;
  v8 = -[HDAppSubscription init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    v9->_dataCode = a4;
  }

  return v9;
}

- (HKObjectType)objectType
{
  void *v3;

  if (_HKValidDataTypeCode())
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", self->_dataCode);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (HKObjectType *)v3;
}

- (void)setUpdateFrequency:(unint64_t)a3
{
  self->_updateFrequency = a3;
}

- (void)setLastAckTime:(int64_t)a3
{
  self->_lastAckTime = a3;
}

- (void)setLastAnchor:(unint64_t)a3
{
  self->_lastAnchor = a3;
}

- (void)setLaunchTimeHysteresis:(int64_t)a3
{
  self->_launchTimeHysteresis = a3;
}

- (void)setLastAssociationAnchor:(unint64_t)a3
{
  self->_lastAssociationAnchor = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)dataCode
{
  return self->_dataCode;
}

- (unint64_t)updateFrequency
{
  return self->_updateFrequency;
}

- (unint64_t)lastAnchor
{
  return self->_lastAnchor;
}

- (int64_t)lastAckTime
{
  return self->_lastAckTime;
}

- (int64_t)launchTimeHysteresis
{
  return self->_launchTimeHysteresis;
}

- (unint64_t)lastAssociationAnchor
{
  return self->_lastAssociationAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
