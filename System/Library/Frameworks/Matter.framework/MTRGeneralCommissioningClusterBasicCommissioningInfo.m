@implementation MTRGeneralCommissioningClusterBasicCommissioningInfo

- (MTRGeneralCommissioningClusterBasicCommissioningInfo)init
{
  MTRGeneralCommissioningClusterBasicCommissioningInfo *v2;
  MTRGeneralCommissioningClusterBasicCommissioningInfo *v3;
  NSNumber *failSafeExpiryLengthSeconds;
  NSNumber *maxCumulativeFailsafeSeconds;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRGeneralCommissioningClusterBasicCommissioningInfo;
  v2 = -[MTRGeneralCommissioningClusterBasicCommissioningInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    failSafeExpiryLengthSeconds = v2->_failSafeExpiryLengthSeconds;
    v2->_failSafeExpiryLengthSeconds = (NSNumber *)&unk_250591B18;

    maxCumulativeFailsafeSeconds = v3->_maxCumulativeFailsafeSeconds;
    v3->_maxCumulativeFailsafeSeconds = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGeneralCommissioningClusterBasicCommissioningInfo *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRGeneralCommissioningClusterBasicCommissioningInfo);
  objc_msgSend_failSafeExpiryLengthSeconds(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFailSafeExpiryLengthSeconds_(v4, v8, (uint64_t)v7);

  objc_msgSend_maxCumulativeFailsafeSeconds(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxCumulativeFailsafeSeconds_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: failSafeExpiryLengthSeconds:%@; maxCumulativeFailsafeSeconds:%@; >"),
    v5,
    self->_failSafeExpiryLengthSeconds,
    self->_maxCumulativeFailsafeSeconds);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)failSafeExpiryLengthSeconds
{
  return self->_failSafeExpiryLengthSeconds;
}

- (void)setFailSafeExpiryLengthSeconds:(NSNumber *)failSafeExpiryLengthSeconds
{
  objc_setProperty_nonatomic_copy(self, a2, failSafeExpiryLengthSeconds, 8);
}

- (NSNumber)maxCumulativeFailsafeSeconds
{
  return self->_maxCumulativeFailsafeSeconds;
}

- (void)setMaxCumulativeFailsafeSeconds:(NSNumber *)maxCumulativeFailsafeSeconds
{
  objc_setProperty_nonatomic_copy(self, a2, maxCumulativeFailsafeSeconds, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxCumulativeFailsafeSeconds, 0);
  objc_storeStrong((id *)&self->_failSafeExpiryLengthSeconds, 0);
}

@end
