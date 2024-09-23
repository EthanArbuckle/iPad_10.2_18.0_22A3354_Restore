@implementation MTRRVCOperationalStateClusterOperationalStateStruct

- (MTRRVCOperationalStateClusterOperationalStateStruct)init
{
  MTRRVCOperationalStateClusterOperationalStateStruct *v2;
  MTRRVCOperationalStateClusterOperationalStateStruct *v3;
  NSNumber *operationalStateID;
  NSString *operationalStateLabel;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRRVCOperationalStateClusterOperationalStateStruct;
  v2 = -[MTRRVCOperationalStateClusterOperationalStateStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    operationalStateID = v2->_operationalStateID;
    v2->_operationalStateID = (NSNumber *)&unk_250591B18;

    operationalStateLabel = v3->_operationalStateLabel;
    v3->_operationalStateLabel = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRRVCOperationalStateClusterOperationalStateStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRRVCOperationalStateClusterOperationalStateStruct);
  objc_msgSend_operationalStateID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationalStateID_(v4, v8, (uint64_t)v7);

  objc_msgSend_operationalStateLabel(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationalStateLabel_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: operationalStateID:%@; operationalStateLabel:%@; >"),
    v5,
    self->_operationalStateID,
    self->_operationalStateLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)operationalStateID
{
  return self->_operationalStateID;
}

- (void)setOperationalStateID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)operationalStateLabel
{
  return self->_operationalStateLabel;
}

- (void)setOperationalStateLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalStateLabel, 0);
  objc_storeStrong((id *)&self->_operationalStateID, 0);
}

@end
