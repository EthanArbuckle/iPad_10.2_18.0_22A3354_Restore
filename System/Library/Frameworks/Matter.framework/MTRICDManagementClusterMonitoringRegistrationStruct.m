@implementation MTRICDManagementClusterMonitoringRegistrationStruct

- (MTRICDManagementClusterMonitoringRegistrationStruct)init
{
  MTRICDManagementClusterMonitoringRegistrationStruct *v2;
  MTRICDManagementClusterMonitoringRegistrationStruct *v3;
  NSNumber *checkInNodeID;
  NSNumber *monitoredSubject;
  NSNumber *clientType;
  NSNumber *fabricIndex;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRICDManagementClusterMonitoringRegistrationStruct;
  v2 = -[MTRICDManagementClusterMonitoringRegistrationStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    checkInNodeID = v2->_checkInNodeID;
    v2->_checkInNodeID = (NSNumber *)&unk_250591B18;

    monitoredSubject = v3->_monitoredSubject;
    v3->_monitoredSubject = (NSNumber *)&unk_250591B18;

    clientType = v3->_clientType;
    v3->_clientType = (NSNumber *)&unk_250591B18;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRICDManagementClusterMonitoringRegistrationStruct *v4;
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

  v4 = objc_alloc_init(MTRICDManagementClusterMonitoringRegistrationStruct);
  objc_msgSend_checkInNodeID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCheckInNodeID_(v4, v8, (uint64_t)v7);

  objc_msgSend_monitoredSubject(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMonitoredSubject_(v4, v12, (uint64_t)v11);

  objc_msgSend_clientType(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientType_(v4, v16, (uint64_t)v15);

  objc_msgSend_fabricIndex(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: checkInNodeID:%@; monitoredSubject:%@; clientType:%@; fabricIndex:%@; >"),
    v5,
    self->_checkInNodeID,
    self->_monitoredSubject,
    self->_clientType,
    self->_fabricIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)checkInNodeID
{
  return self->_checkInNodeID;
}

- (void)setCheckInNodeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)monitoredSubject
{
  return self->_monitoredSubject;
}

- (void)setMonitoredSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
  objc_storeStrong((id *)&self->_monitoredSubject, 0);
  objc_storeStrong((id *)&self->_checkInNodeID, 0);
}

@end
