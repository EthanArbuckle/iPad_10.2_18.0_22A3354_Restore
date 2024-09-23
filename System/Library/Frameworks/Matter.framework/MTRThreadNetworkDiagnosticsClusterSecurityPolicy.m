@implementation MTRThreadNetworkDiagnosticsClusterSecurityPolicy

- (MTRThreadNetworkDiagnosticsClusterSecurityPolicy)init
{
  MTRThreadNetworkDiagnosticsClusterSecurityPolicy *v2;
  MTRThreadNetworkDiagnosticsClusterSecurityPolicy *v3;
  NSNumber *rotationTime;
  NSNumber *flags;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRThreadNetworkDiagnosticsClusterSecurityPolicy;
  v2 = -[MTRThreadNetworkDiagnosticsClusterSecurityPolicy init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    rotationTime = v2->_rotationTime;
    v2->_rotationTime = (NSNumber *)&unk_250591B18;

    flags = v3->_flags;
    v3->_flags = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThreadNetworkDiagnosticsClusterSecurityPolicy *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterSecurityPolicy);
  objc_msgSend_rotationTime(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRotationTime_(v4, v8, (uint64_t)v7);

  objc_msgSend_flags(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFlags_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: rotationTime:%@; flags:%@; >"),
    v5,
    self->_rotationTime,
    self->_flags);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)rotationTime
{
  return self->_rotationTime;
}

- (void)setRotationTime:(NSNumber *)rotationTime
{
  objc_setProperty_nonatomic_copy(self, a2, rotationTime, 8);
}

- (NSNumber)flags
{
  return self->_flags;
}

- (void)setFlags:(NSNumber *)flags
{
  objc_setProperty_nonatomic_copy(self, a2, flags, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_rotationTime, 0);
}

@end
