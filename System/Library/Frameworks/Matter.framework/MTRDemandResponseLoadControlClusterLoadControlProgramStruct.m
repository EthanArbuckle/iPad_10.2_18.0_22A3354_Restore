@implementation MTRDemandResponseLoadControlClusterLoadControlProgramStruct

- (MTRDemandResponseLoadControlClusterLoadControlProgramStruct)init
{
  const char *v2;
  uint64_t v3;
  MTRDemandResponseLoadControlClusterLoadControlProgramStruct *v4;
  uint64_t v5;
  NSData *programID;
  NSString *name;
  NSNumber *enrollmentGroup;
  NSNumber *randomStartMinutes;
  NSNumber *randomDurationMinutes;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRDemandResponseLoadControlClusterLoadControlProgramStruct;
  v4 = -[MTRDemandResponseLoadControlClusterLoadControlProgramStruct init](&v12, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    programID = v4->_programID;
    v4->_programID = (NSData *)v5;

    name = v4->_name;
    v4->_name = (NSString *)&stru_2505249E8;

    enrollmentGroup = v4->_enrollmentGroup;
    v4->_enrollmentGroup = 0;

    randomStartMinutes = v4->_randomStartMinutes;
    v4->_randomStartMinutes = 0;

    randomDurationMinutes = v4->_randomDurationMinutes;
    v4->_randomDurationMinutes = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterLoadControlProgramStruct *v4;
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

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterLoadControlProgramStruct);
  objc_msgSend_programID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProgramID_(v4, v8, (uint64_t)v7);

  objc_msgSend_name(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  objc_msgSend_enrollmentGroup(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnrollmentGroup_(v4, v16, (uint64_t)v15);

  objc_msgSend_randomStartMinutes(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRandomStartMinutes_(v4, v20, (uint64_t)v19);

  objc_msgSend_randomDurationMinutes(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRandomDurationMinutes_(v4, v24, (uint64_t)v23);

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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_programID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: programID:%@; name:%@; enrollmentGroup:%@; randomStartMinutes:%@; randomDurationMinutes:%@; >"),
    v5,
    v7,
    self->_name,
    self->_enrollmentGroup,
    self->_randomStartMinutes,
    self->_randomDurationMinutes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)programID
{
  return self->_programID;
}

- (void)setProgramID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)enrollmentGroup
{
  return self->_enrollmentGroup;
}

- (void)setEnrollmentGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)randomStartMinutes
{
  return self->_randomStartMinutes;
}

- (void)setRandomStartMinutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)randomDurationMinutes
{
  return self->_randomDurationMinutes;
}

- (void)setRandomDurationMinutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomDurationMinutes, 0);
  objc_storeStrong((id *)&self->_randomStartMinutes, 0);
  objc_storeStrong((id *)&self->_enrollmentGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_programID, 0);
}

@end
