@implementation CLBeaconIdentityCondition

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBeaconIdentityCondition;
  -[CLCondition dealloc](&v3, sel_dealloc);
}

- (CLBeaconIdentityCondition)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return 0;
}

- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid
{
  uint64_t v3;
  void *v8;
  const char *v9;

  if (!uuid)
  {
    v8 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, CFSTR("CLBeaconIdentityCondition.mm"), 31, CFSTR("The UUID parameter is required"));
  }
  return (CLBeaconIdentityCondition *)objc_msgSend__initWithUUID_major_minor_(self, a2, (uint64_t)uuid, 0, 0);
}

- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major
{
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  void *v11;
  const char *v12;

  v4 = major;
  if (!uuid)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, major);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLBeaconIdentityCondition.mm"), 37, CFSTR("The UUID parameter is required"));
  }
  v7 = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], a2, v4, major);
  return (CLBeaconIdentityCondition *)objc_msgSend__initWithUUID_major_minor_(self, v8, (uint64_t)uuid, v7, 0);
}

- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v16;
  const char *v17;

  v5 = minor;
  v6 = major;
  if (!uuid)
  {
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, major);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLBeaconIdentityCondition.mm"), 43, CFSTR("The UUID parameter is required"));
  }
  v9 = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], a2, v6, major);
  v12 = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v10, v5, v11);
  return (CLBeaconIdentityCondition *)objc_msgSend__initWithUUID_major_minor_(self, v13, (uint64_t)uuid, v9, v12);
}

- (id)_initWithUUID:(id)a3 major:(id)a4 minor:(id)a5
{
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLBeaconIdentityCondition;
  v8 = -[CLCondition initCondition](&v10, sel_initCondition);
  if (v8)
  {
    v8[9] = a3;
    v8[10] = a4;
    v8[11] = a5;
  }
  return v8;
}

+ (id)any
{
  CLBeaconIdentityCondition *v2;
  const char *v3;

  v2 = [CLBeaconIdentityCondition alloc];
  return (id)objc_msgSend__initWithUUID_major_minor_(v2, v3, 0, 0, 0);
}

- (CLBeaconIdentityCondition)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v21;
  const char *v22;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v21 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, (uint64_t)self, CFSTR("CLBeaconIdentityCondition.mm"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[decoder allowsKeyedCoding]"));
  }
  v10 = objc_opt_class();
  v12 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLBeaconIdentityConstraintUUID"));
  v13 = objc_opt_class();
  v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kCLBeaconIdentityConstraintMajor"));
  v16 = objc_opt_class();
  v18 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCLBeaconIdentityConstraintMinor"));
  return (CLBeaconIdentityCondition *)objc_msgSend__initWithUUID_major_minor_(self, v19, v12, v15, v18);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLBeaconIdentityCondition.mm"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[encoder allowsKeyedCoding]"));
  }
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_UUID, (uint64_t)CFSTR("kCLBeaconIdentityConstraintUUID"));
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_major, (uint64_t)CFSTR("kCLBeaconIdentityConstraintMajor"));
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_minor, (uint64_t)CFSTR("kCLBeaconIdentityConstraintMinor"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_UUID(self, a2, v2, v3);
  v10 = objc_msgSend_major(self, v7, v8, v9);
  v14 = objc_msgSend_minor(self, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("CLBeaconIdentityCondition (uuid:%@, major:%@, minor:%@)"), v16, v6, v10, v14);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  int isEqual;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  char v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  char v40;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend_UUID(self, v5, v6, v7) || objc_msgSend_UUID(a3, v8, v9, v10))
    {
      v11 = (void *)objc_msgSend_UUID(self, v8, v9, v10);
      v15 = objc_msgSend_UUID(a3, v12, v13, v14);
      isEqual = objc_msgSend_isEqual_(v11, v16, v15, v17);
    }
    else
    {
      isEqual = 1;
    }
    if (objc_msgSend_major(self, v8, v9, v10) || objc_msgSend_major(a3, v19, v20, v21))
    {
      v22 = (void *)objc_msgSend_major(self, v19, v20, v21);
      v26 = objc_msgSend_major(a3, v23, v24, v25);
      v29 = objc_msgSend_isEqual_(v22, v27, v26, v28);
    }
    else
    {
      v29 = 1;
    }
    if (objc_msgSend_minor(self, v19, v20, v21) || objc_msgSend_minor(a3, v30, v31, v32))
    {
      v33 = (void *)objc_msgSend_minor(self, v30, v31, v32);
      v37 = objc_msgSend_minor(a3, v34, v35, v36);
      v40 = objc_msgSend_isEqual_(v33, v38, v37, v39);
      if (isEqual)
        return v29 & v40;
    }
    else
    {
      v40 = 1;
      if (isEqual)
        return v29 & v40;
    }
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = (void *)objc_msgSend_UUID(self, a2, v2, v3);
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_major(self, v10, v11, v12);
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  v21 = (void *)objc_msgSend_minor(self, v18, v19, v20);
  return v17 ^ objc_msgSend_hash(v21, v22, v23, v24);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)major
{
  return self->_major;
}

- (NSNumber)minor
{
  return self->_minor;
}

@end
