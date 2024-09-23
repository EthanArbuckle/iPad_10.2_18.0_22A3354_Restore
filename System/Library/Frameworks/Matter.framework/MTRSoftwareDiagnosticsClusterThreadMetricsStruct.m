@implementation MTRSoftwareDiagnosticsClusterThreadMetricsStruct

- (MTRSoftwareDiagnosticsClusterThreadMetricsStruct)init
{
  MTRSoftwareDiagnosticsClusterThreadMetricsStruct *v2;
  MTRSoftwareDiagnosticsClusterThreadMetricsStruct *v3;
  NSNumber *id;
  NSString *name;
  NSNumber *stackFreeCurrent;
  NSNumber *stackFreeMinimum;
  NSNumber *stackSize;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRSoftwareDiagnosticsClusterThreadMetricsStruct;
  v2 = -[MTRSoftwareDiagnosticsClusterThreadMetricsStruct init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    id = v2->_id;
    v2->_id = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = 0;

    stackFreeCurrent = v3->_stackFreeCurrent;
    v3->_stackFreeCurrent = 0;

    stackFreeMinimum = v3->_stackFreeMinimum;
    v3->_stackFreeMinimum = 0;

    stackSize = v3->_stackSize;
    v3->_stackSize = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRSoftwareDiagnosticsClusterThreadMetricsStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_alloc_init(MTRSoftwareDiagnosticsClusterThreadMetricsStruct);
  objc_msgSend_id(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setId_(v4, v8, (uint64_t)v7);

  objc_msgSend_name(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  objc_msgSend_stackFreeCurrent(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStackFreeCurrent_(v4, v16, (uint64_t)v15);

  objc_msgSend_stackFreeMinimum(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStackFreeMinimum_(v4, v20, (uint64_t)v19);

  objc_msgSend_stackSize(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStackSize_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: id:%@; name:%@; stackFreeCurrent:%@; stackFreeMinimum:%@; stackSize:%@; >"),
    v5,
    self->_id,
    self->_name,
    self->_stackFreeCurrent,
    self->_stackFreeMinimum,
    self->_stackSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(NSNumber *)id
{
  objc_setProperty_nonatomic_copy(self, a2, id, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 16);
}

- (NSNumber)stackFreeCurrent
{
  return self->_stackFreeCurrent;
}

- (void)setStackFreeCurrent:(NSNumber *)stackFreeCurrent
{
  objc_setProperty_nonatomic_copy(self, a2, stackFreeCurrent, 24);
}

- (NSNumber)stackFreeMinimum
{
  return self->_stackFreeMinimum;
}

- (void)setStackFreeMinimum:(NSNumber *)stackFreeMinimum
{
  objc_setProperty_nonatomic_copy(self, a2, stackFreeMinimum, 32);
}

- (NSNumber)stackSize
{
  return self->_stackSize;
}

- (void)setStackSize:(NSNumber *)stackSize
{
  objc_setProperty_nonatomic_copy(self, a2, stackSize, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackSize, 0);
  objc_storeStrong((id *)&self->_stackFreeMinimum, 0);
  objc_storeStrong((id *)&self->_stackFreeCurrent, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
