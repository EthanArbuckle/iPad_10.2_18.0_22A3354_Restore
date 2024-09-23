@implementation MTROperationalStateClusterErrorStateStruct

- (MTROperationalStateClusterErrorStateStruct)init
{
  MTROperationalStateClusterErrorStateStruct *v2;
  MTROperationalStateClusterErrorStateStruct *v3;
  NSNumber *errorStateID;
  NSString *errorStateLabel;
  NSString *errorStateDetails;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTROperationalStateClusterErrorStateStruct;
  v2 = -[MTROperationalStateClusterErrorStateStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    errorStateID = v2->_errorStateID;
    v2->_errorStateID = (NSNumber *)&unk_250591B18;

    errorStateLabel = v3->_errorStateLabel;
    v3->_errorStateLabel = 0;

    errorStateDetails = v3->_errorStateDetails;
    v3->_errorStateDetails = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROperationalStateClusterErrorStateStruct *v4;
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

  v4 = objc_alloc_init(MTROperationalStateClusterErrorStateStruct);
  objc_msgSend_errorStateID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setErrorStateID_(v4, v8, (uint64_t)v7);

  objc_msgSend_errorStateLabel(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setErrorStateLabel_(v4, v12, (uint64_t)v11);

  objc_msgSend_errorStateDetails(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setErrorStateDetails_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: errorStateID:%@; errorStateLabel:%@; errorStateDetails:%@; >"),
    v5,
    self->_errorStateID,
    self->_errorStateLabel,
    self->_errorStateDetails);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)errorStateID
{
  return self->_errorStateID;
}

- (void)setErrorStateID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)errorStateLabel
{
  return self->_errorStateLabel;
}

- (void)setErrorStateLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)errorStateDetails
{
  return self->_errorStateDetails;
}

- (void)setErrorStateDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorStateDetails, 0);
  objc_storeStrong((id *)&self->_errorStateLabel, 0);
  objc_storeStrong((id *)&self->_errorStateID, 0);
}

@end
