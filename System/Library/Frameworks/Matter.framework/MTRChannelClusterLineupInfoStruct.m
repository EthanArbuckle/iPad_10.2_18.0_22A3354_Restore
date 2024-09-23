@implementation MTRChannelClusterLineupInfoStruct

- (MTRChannelClusterLineupInfoStruct)init
{
  MTRChannelClusterLineupInfoStruct *v2;
  MTRChannelClusterLineupInfoStruct *v3;
  NSString *operatorName;
  NSString *lineupName;
  NSString *postalCode;
  NSNumber *lineupInfoType;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRChannelClusterLineupInfoStruct;
  v2 = -[MTRChannelClusterLineupInfoStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    operatorName = v2->_operatorName;
    v2->_operatorName = (NSString *)&stru_2505249E8;

    lineupName = v3->_lineupName;
    v3->_lineupName = 0;

    postalCode = v3->_postalCode;
    v3->_postalCode = 0;

    lineupInfoType = v3->_lineupInfoType;
    v3->_lineupInfoType = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterLineupInfoStruct *v4;
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

  v4 = objc_alloc_init(MTRChannelClusterLineupInfoStruct);
  objc_msgSend_operatorName(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperatorName_(v4, v8, (uint64_t)v7);

  objc_msgSend_lineupName(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLineupName_(v4, v12, (uint64_t)v11);

  objc_msgSend_postalCode(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPostalCode_(v4, v16, (uint64_t)v15);

  objc_msgSend_lineupInfoType(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLineupInfoType_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: operatorName:%@; lineupName:%@; postalCode:%@; lineupInfoType:%@; >"),
    v5,
    self->_operatorName,
    self->_lineupName,
    self->_postalCode,
    self->_lineupInfoType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(NSString *)operatorName
{
  objc_setProperty_nonatomic_copy(self, a2, operatorName, 8);
}

- (NSString)lineupName
{
  return self->_lineupName;
}

- (void)setLineupName:(NSString *)lineupName
{
  objc_setProperty_nonatomic_copy(self, a2, lineupName, 16);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(NSString *)postalCode
{
  objc_setProperty_nonatomic_copy(self, a2, postalCode, 24);
}

- (NSNumber)lineupInfoType
{
  return self->_lineupInfoType;
}

- (void)setLineupInfoType:(NSNumber *)lineupInfoType
{
  objc_setProperty_nonatomic_copy(self, a2, lineupInfoType, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineupInfoType, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_lineupName, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
}

@end
