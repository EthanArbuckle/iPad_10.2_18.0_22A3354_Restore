@implementation MTRServiceAreaClusterProgressStruct

- (MTRServiceAreaClusterProgressStruct)init
{
  MTRServiceAreaClusterProgressStruct *v2;
  MTRServiceAreaClusterProgressStruct *v3;
  NSNumber *locationID;
  NSNumber *status;
  NSNumber *totalOperationalTime;
  NSNumber *estimatedTime;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRServiceAreaClusterProgressStruct;
  v2 = -[MTRServiceAreaClusterProgressStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    locationID = v2->_locationID;
    v2->_locationID = (NSNumber *)&unk_250591B18;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_250591B18;

    totalOperationalTime = v3->_totalOperationalTime;
    v3->_totalOperationalTime = 0;

    estimatedTime = v3->_estimatedTime;
    v3->_estimatedTime = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRServiceAreaClusterProgressStruct *v4;
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

  v4 = objc_alloc_init(MTRServiceAreaClusterProgressStruct);
  objc_msgSend_locationID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocationID_(v4, v8, (uint64_t)v7);

  objc_msgSend_status(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v12, (uint64_t)v11);

  objc_msgSend_totalOperationalTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTotalOperationalTime_(v4, v16, (uint64_t)v15);

  objc_msgSend_estimatedTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEstimatedTime_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: locationID:%@; status:%@; totalOperationalTime:%@; estimatedTime:%@; >"),
    v5,
    self->_locationID,
    self->_status,
    self->_totalOperationalTime,
    self->_estimatedTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)totalOperationalTime
{
  return self->_totalOperationalTime;
}

- (void)setTotalOperationalTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)estimatedTime
{
  return self->_estimatedTime;
}

- (void)setEstimatedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedTime, 0);
  objc_storeStrong((id *)&self->_totalOperationalTime, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_locationID, 0);
}

@end
