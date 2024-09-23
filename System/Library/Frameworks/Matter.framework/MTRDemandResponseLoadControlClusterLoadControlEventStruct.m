@implementation MTRDemandResponseLoadControlClusterLoadControlEventStruct

- (MTRDemandResponseLoadControlClusterLoadControlEventStruct)init
{
  const char *v2;
  uint64_t v3;
  MTRDemandResponseLoadControlClusterLoadControlEventStruct *v4;
  uint64_t v5;
  NSData *eventID;
  NSData *programID;
  NSNumber *control;
  NSNumber *deviceClass;
  NSNumber *enrollmentGroup;
  NSNumber *criticality;
  NSNumber *startTime;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *transitions;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTRDemandResponseLoadControlClusterLoadControlEventStruct;
  v4 = -[MTRDemandResponseLoadControlClusterLoadControlEventStruct init](&v18, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    eventID = v4->_eventID;
    v4->_eventID = (NSData *)v5;

    programID = v4->_programID;
    v4->_programID = 0;

    control = v4->_control;
    v4->_control = (NSNumber *)&unk_250591B18;

    deviceClass = v4->_deviceClass;
    v4->_deviceClass = (NSNumber *)&unk_250591B18;

    enrollmentGroup = v4->_enrollmentGroup;
    v4->_enrollmentGroup = 0;

    criticality = v4->_criticality;
    v4->_criticality = (NSNumber *)&unk_250591B18;

    startTime = v4->_startTime;
    v4->_startTime = 0;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    transitions = v4->_transitions;
    v4->_transitions = (NSArray *)v15;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterLoadControlEventStruct *v4;
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

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterLoadControlEventStruct);
  objc_msgSend_eventID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventID_(v4, v8, (uint64_t)v7);

  objc_msgSend_programID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProgramID_(v4, v12, (uint64_t)v11);

  objc_msgSend_control(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setControl_(v4, v16, (uint64_t)v15);

  objc_msgSend_deviceClass(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceClass_(v4, v20, (uint64_t)v19);

  objc_msgSend_enrollmentGroup(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnrollmentGroup_(v4, v24, (uint64_t)v23);

  objc_msgSend_criticality(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCriticality_(v4, v28, (uint64_t)v27);

  objc_msgSend_startTime(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v4, v32, (uint64_t)v31);

  objc_msgSend_transitions(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitions_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_eventID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_programID, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: eventID:%@; programID:%@; control:%@; deviceClass:%@; enrollmentGroup:%@; criticality:%@; startTime:%@; transitions:%@; >"),
    v5,
    v7,
    v9,
    self->_control,
    self->_deviceClass,
    self->_enrollmentGroup,
    self->_criticality,
    self->_startTime,
    self->_transitions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSData)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)programID
{
  return self->_programID;
}

- (void)setProgramID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)enrollmentGroup
{
  return self->_enrollmentGroup;
}

- (void)setEnrollmentGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)criticality
{
  return self->_criticality;
}

- (void)setCriticality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_criticality, 0);
  objc_storeStrong((id *)&self->_enrollmentGroup, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_programID, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end
