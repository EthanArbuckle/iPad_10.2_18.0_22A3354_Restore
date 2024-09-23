@implementation MTRGeneralDiagnosticsClusterBootReasonEvent

- (MTRGeneralDiagnosticsClusterBootReasonEvent)init
{
  MTRGeneralDiagnosticsClusterBootReasonEvent *v2;
  MTRGeneralDiagnosticsClusterBootReasonEvent *v3;
  NSNumber *bootReason;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTRGeneralDiagnosticsClusterBootReasonEvent;
  v2 = -[MTRGeneralDiagnosticsClusterBootReasonEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    bootReason = v2->_bootReason;
    v2->_bootReason = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGeneralDiagnosticsClusterBootReasonEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRGeneralDiagnosticsClusterBootReasonEvent);
  objc_msgSend_bootReason(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBootReason_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: bootReason:%@; >"), v5, self->_bootReason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)bootReason
{
  return self->_bootReason;
}

- (void)setBootReason:(NSNumber *)bootReason
{
  objc_setProperty_nonatomic_copy(self, a2, bootReason, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootReason, 0);
}

@end
