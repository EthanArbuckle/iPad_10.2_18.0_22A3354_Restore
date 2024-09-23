@implementation MTRGroupKeyManagementClusterGroupKeySetStruct

- (MTRGroupKeyManagementClusterGroupKeySetStruct)init
{
  MTRGroupKeyManagementClusterGroupKeySetStruct *v2;
  MTRGroupKeyManagementClusterGroupKeySetStruct *v3;
  NSNumber *groupKeySetID;
  NSNumber *groupKeySecurityPolicy;
  NSData *epochKey0;
  NSNumber *epochStartTime0;
  NSData *epochKey1;
  NSNumber *epochStartTime1;
  NSData *epochKey2;
  NSNumber *epochStartTime2;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRGroupKeyManagementClusterGroupKeySetStruct;
  v2 = -[MTRGroupKeyManagementClusterGroupKeySetStruct init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    groupKeySetID = v2->_groupKeySetID;
    v2->_groupKeySetID = (NSNumber *)&unk_250591B18;

    groupKeySecurityPolicy = v3->_groupKeySecurityPolicy;
    v3->_groupKeySecurityPolicy = (NSNumber *)&unk_250591B18;

    epochKey0 = v3->_epochKey0;
    v3->_epochKey0 = 0;

    epochStartTime0 = v3->_epochStartTime0;
    v3->_epochStartTime0 = 0;

    epochKey1 = v3->_epochKey1;
    v3->_epochKey1 = 0;

    epochStartTime1 = v3->_epochStartTime1;
    v3->_epochStartTime1 = 0;

    epochKey2 = v3->_epochKey2;
    v3->_epochKey2 = 0;

    epochStartTime2 = v3->_epochStartTime2;
    v3->_epochStartTime2 = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGroupKeyManagementClusterGroupKeySetStruct *v4;
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
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;

  v4 = objc_alloc_init(MTRGroupKeyManagementClusterGroupKeySetStruct);
  objc_msgSend_groupKeySetID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupKeySetID_(v4, v8, (uint64_t)v7);

  objc_msgSend_groupKeySecurityPolicy(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupKeySecurityPolicy_(v4, v12, (uint64_t)v11);

  objc_msgSend_epochKey0(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEpochKey0_(v4, v16, (uint64_t)v15);

  objc_msgSend_epochStartTime0(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEpochStartTime0_(v4, v20, (uint64_t)v19);

  objc_msgSend_epochKey1(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEpochKey1_(v4, v24, (uint64_t)v23);

  objc_msgSend_epochStartTime1(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEpochStartTime1_(v4, v28, (uint64_t)v27);

  objc_msgSend_epochKey2(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEpochKey2_(v4, v32, (uint64_t)v31);

  objc_msgSend_epochStartTime2(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEpochStartTime2_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *groupKeySetID;
  NSNumber *groupKeySecurityPolicy;
  const char *v8;
  void *v9;
  NSNumber *epochStartTime0;
  const char *v11;
  void *v12;
  NSNumber *epochStartTime1;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  groupKeySetID = self->_groupKeySetID;
  groupKeySecurityPolicy = self->_groupKeySecurityPolicy;
  objc_msgSend_base64EncodedStringWithOptions_(self->_epochKey0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  epochStartTime0 = self->_epochStartTime0;
  objc_msgSend_base64EncodedStringWithOptions_(self->_epochKey1, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  epochStartTime1 = self->_epochStartTime1;
  objc_msgSend_base64EncodedStringWithOptions_(self->_epochKey2, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("<%@: groupKeySetID:%@; groupKeySecurityPolicy:%@; epochKey0:%@; epochStartTime0:%@; epochKey1:%@; epochStartTime1:%@; epochKey2:%@; epochStartTime2:%@; >"),
    v5,
    groupKeySetID,
    groupKeySecurityPolicy,
    v9,
    epochStartTime0,
    v12,
    epochStartTime1,
    v15,
    self->_epochStartTime2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSNumber)groupKeySetID
{
  return self->_groupKeySetID;
}

- (void)setGroupKeySetID:(NSNumber *)groupKeySetID
{
  objc_setProperty_nonatomic_copy(self, a2, groupKeySetID, 8);
}

- (NSNumber)groupKeySecurityPolicy
{
  return self->_groupKeySecurityPolicy;
}

- (void)setGroupKeySecurityPolicy:(NSNumber *)groupKeySecurityPolicy
{
  objc_setProperty_nonatomic_copy(self, a2, groupKeySecurityPolicy, 16);
}

- (NSData)epochKey0
{
  return self->_epochKey0;
}

- (void)setEpochKey0:(NSData *)epochKey0
{
  objc_setProperty_nonatomic_copy(self, a2, epochKey0, 24);
}

- (NSNumber)epochStartTime0
{
  return self->_epochStartTime0;
}

- (void)setEpochStartTime0:(NSNumber *)epochStartTime0
{
  objc_setProperty_nonatomic_copy(self, a2, epochStartTime0, 32);
}

- (NSData)epochKey1
{
  return self->_epochKey1;
}

- (void)setEpochKey1:(NSData *)epochKey1
{
  objc_setProperty_nonatomic_copy(self, a2, epochKey1, 40);
}

- (NSNumber)epochStartTime1
{
  return self->_epochStartTime1;
}

- (void)setEpochStartTime1:(NSNumber *)epochStartTime1
{
  objc_setProperty_nonatomic_copy(self, a2, epochStartTime1, 48);
}

- (NSData)epochKey2
{
  return self->_epochKey2;
}

- (void)setEpochKey2:(NSData *)epochKey2
{
  objc_setProperty_nonatomic_copy(self, a2, epochKey2, 56);
}

- (NSNumber)epochStartTime2
{
  return self->_epochStartTime2;
}

- (void)setEpochStartTime2:(NSNumber *)epochStartTime2
{
  objc_setProperty_nonatomic_copy(self, a2, epochStartTime2, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_epochStartTime2, 0);
  objc_storeStrong((id *)&self->_epochKey2, 0);
  objc_storeStrong((id *)&self->_epochStartTime1, 0);
  objc_storeStrong((id *)&self->_epochKey1, 0);
  objc_storeStrong((id *)&self->_epochStartTime0, 0);
  objc_storeStrong((id *)&self->_epochKey0, 0);
  objc_storeStrong((id *)&self->_groupKeySecurityPolicy, 0);
  objc_storeStrong((id *)&self->_groupKeySetID, 0);
}

@end
