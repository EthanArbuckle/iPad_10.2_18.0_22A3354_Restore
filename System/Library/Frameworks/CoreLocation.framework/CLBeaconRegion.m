@implementation CLBeaconRegion

+ (id)any
{
  if (qword_1EE172F80 != -1)
    dispatch_once(&qword_1EE172F80, &unk_1E2990770);
  return (id)qword_1EE172F78;
}

- (void)setGutsWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 notifyOnDisplay:(BOOL)a6
{
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v10 = a3 != 0;
  if (a4)
    v10 |= 2u;
  if (a5)
    v10 |= 4u;
  self->_definitionMask = v10;
  self->_UUID = (NSUUID *)objc_msgSend_copy(a3, a2, (uint64_t)a3, (uint64_t)a4);
  self->_major = (NSNumber *)objc_msgSend_copy(a4, v11, v12, v13);
  self->_minor = (NSNumber *)objc_msgSend_copy(a5, v14, v15, v16);
  self->_notifyEntryStateOnDisplay = a6;
}

- (CLBeaconRegion)init
{
  uint64_t v2;
  uint64_t v3;
  CLBeaconRegion *v4;

  v4 = self;
  if (!objc_msgSend_UUID(self, a2, v2, v3))
  {

    return 0;
  }
  return v4;
}

- (CLBeaconRegion)initWithIdentifier:(id)a3
{
  CLBeaconRegion *v3;
  const char *v4;
  CLBeaconRegion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLBeaconRegion;
  v3 = -[CLRegion initWithIdentifier:andRegionType:](&v7, sel_initWithIdentifier_andRegionType_, a3, 0);
  v5 = v3;
  if (v3)
    objc_msgSend_setGutsWithProximityUUID_major_minor_notifyOnDisplay_(v3, v4, 0, 0, 0, 0);
  return v5;
}

- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid identifier:(NSString *)identifier
{
  CLBeaconRegion *v5;
  const char *v6;
  CLBeaconRegion *v7;
  objc_super v9;

  if (uuid)
  {
    v9.receiver = self;
    v9.super_class = (Class)CLBeaconRegion;
    v5 = -[CLRegion initWithIdentifier:andRegionType:](&v9, sel_initWithIdentifier_andRegionType_, identifier, 0);
    v7 = v5;
    if (v5)
      objc_msgSend_setGutsWithProximityUUID_major_minor_notifyOnDisplay_(v5, v6, (uint64_t)uuid, 0, 0, 0);
  }
  else
  {

    return 0;
  }
  return v7;
}

- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major identifier:(NSString *)identifier
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  CLBeaconRegion *v9;
  uint64_t v10;
  const char *v11;
  objc_super v13;

  if (uuid)
  {
    v5 = major;
    v13.receiver = self;
    v13.super_class = (Class)CLBeaconRegion;
    v9 = -[CLRegion initWithIdentifier:andRegionType:](&v13, sel_initWithIdentifier_andRegionType_, identifier, 0);
    if (v9)
    {
      v10 = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v7, v5, v8);
      objc_msgSend_setGutsWithProximityUUID_major_minor_notifyOnDisplay_(v9, v11, (uint64_t)uuid, v10, 0, 0);
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor identifier:(NSString *)identifier
{
  if (uuid)
    return (CLBeaconRegion *)MEMORY[0x1E0DE7D20](self, sel_initWithUUID_major_minor_identifier_notifyEntryStateOnDisplay_, uuid, major);

  return 0;
}

- (CLBeaconRegion)initWithUUID:(id)a3 major:(unsigned __int16)a4 minor:(unsigned __int16)a5 identifier:(id)a6 notifyEntryStateOnDisplay:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  const char *v11;
  uint64_t v12;
  CLBeaconRegion *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  objc_super v20;

  v7 = a7;
  v8 = a5;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CLBeaconRegion;
  v13 = -[CLRegion initWithIdentifier:andRegionType:](&v20, sel_initWithIdentifier_andRegionType_, a6, 0);
  if (v13)
  {
    v14 = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v11, v9, v12);
    v17 = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v15, v8, v16);
    objc_msgSend_setGutsWithProximityUUID_major_minor_notifyOnDisplay_(v13, v18, (uint64_t)a3, v14, v17, v7);
  }
  return v13;
}

- (CLBeaconRegion)initWithBeaconIdentityConstraint:(CLBeaconIdentityConstraint *)beaconIdentityConstraint identifier:(NSString *)identifier
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CLBeaconRegion *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v23;
  const char *v24;
  objc_super v25;

  if (!beaconIdentityConstraint)
  {
    v23 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)identifier);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, CFSTR("CLBeaconRegion.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beaconIdentityConstraint"));
  }
  v25.receiver = self;
  v25.super_class = (Class)CLBeaconRegion;
  v10 = -[CLRegion initWithIdentifier:andRegionType:](&v25, sel_initWithIdentifier_andRegionType_, identifier, 0);
  if (v10)
  {
    v11 = objc_msgSend_UUID(beaconIdentityConstraint, v7, v8, v9);
    v15 = objc_msgSend_major(beaconIdentityConstraint, v12, v13, v14);
    v19 = objc_msgSend_minor(beaconIdentityConstraint, v16, v17, v18);
    objc_msgSend_setGutsWithProximityUUID_major_minor_notifyOnDisplay_(v10, v20, v11, v15, v19, 0);
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLBeaconRegion)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLBeaconRegion *v7;
  uint64_t v8;
  const char *v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  unsigned __int8 v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CLBeaconRegion;
  v7 = -[CLRegion initWithCoder:](&v38, sel_initWithCoder_);
  if (v7)
  {
    v37 = 0;
    if ((objc_msgSend_allowsKeyedCoding(a3, v4, v5, v6) & 1) != 0)
    {
      v8 = objc_opt_class();
      v10 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCLBeaconRegionCodingKeyProximityUUID"));
      v11 = objc_opt_class();
      v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCLBeaconRegionCodingKeyMajor"));
      v14 = objc_opt_class();
      v16 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCLBeaconRegionCodingKeyMinor"));
      v37 = objc_msgSend_decodeBoolForKey_(a3, v17, (uint64_t)CFSTR("kCLBeaconRegionNotifyEntryStateOnDisplay"), v18);
    }
    else
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v25 = objc_msgSend_decodeObject(a3, v22, v23, v24);
      v10 = (id)objc_msgSend_initWithUUIDString_(v21, v26, v25, v27);
      v13 = objc_msgSend_decodeObject(a3, v28, v29, v30);
      v16 = objc_msgSend_decodeObject(a3, v31, v32, v33);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v34, (uint64_t)"B", (uint64_t)&v37);
    }
    objc_msgSend_setType_(v7, v19, 0, v20);
    objc_msgSend_setGutsWithProximityUUID_major_minor_notifyOnDisplay_(v7, v35, (uint64_t)v10, v13, v16, v37);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  char v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CLBeaconRegion;
  -[CLRegion encodeWithCoder:](&v47, sel_encodeWithCoder_);
  v8 = objc_msgSend_notifyEntryStateOnDisplay(self, v5, v6, v7);
  v46 = v8;
  v12 = objc_msgSend_allowsKeyedCoding(a3, v9, v10, v11);
  v16 = (void *)objc_msgSend_UUID(self, v13, v14, v15);
  if ((v12 & 1) != 0)
  {
    objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)v16, (uint64_t)CFSTR("kCLBeaconRegionCodingKeyProximityUUID"));
    v22 = objc_msgSend_major(self, v19, v20, v21);
    objc_msgSend_encodeObject_forKey_(a3, v23, v22, (uint64_t)CFSTR("kCLBeaconRegionCodingKeyMajor"));
    v27 = objc_msgSend_minor(self, v24, v25, v26);
    objc_msgSend_encodeObject_forKey_(a3, v28, v27, (uint64_t)CFSTR("kCLBeaconRegionCodingKeyMinor"));
    objc_msgSend_encodeBool_forKey_(a3, v29, v8, (uint64_t)CFSTR("kCLBeaconRegionNotifyEntryStateOnDisplay"));
  }
  else
  {
    v30 = objc_msgSend_UUIDString(v16, v17, (uint64_t)v16, v18);
    objc_msgSend_encodeObject_(a3, v31, v30, v32);
    v36 = objc_msgSend_major(self, v33, v34, v35);
    objc_msgSend_encodeObject_(a3, v37, v36, v38);
    v42 = objc_msgSend_minor(self, v39, v40, v41);
    objc_msgSend_encodeObject_(a3, v43, v42, v44);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v45, (uint64_t)"B", (uint64_t)&v46);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CLBeaconRegion;
  v7 = -[CLRegion copyWithZone:](&v23, sel_copyWithZone_, a3);
  if (v7)
  {
    v8 = objc_msgSend_UUID(self, v4, v5, v6);
    v12 = objc_msgSend_major(self, v9, v10, v11);
    v16 = objc_msgSend_minor(self, v13, v14, v15);
    v20 = objc_msgSend_notifyEntryStateOnDisplay(self, v17, v18, v19);
    objc_msgSend_setGutsWithProximityUUID_major_minor_notifyOnDisplay_(v7, v21, v8, v12, v16, v20);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_UUID = 0;
  self->_major = 0;
  self->_minor = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBeaconRegion;
  -[CLRegion dealloc](&v3, sel_dealloc);
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
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_identifier(self, a2, v2, v3);
  v10 = objc_msgSend_UUID(self, v7, v8, v9);
  v14 = objc_msgSend_major(self, v11, v12, v13);
  v18 = objc_msgSend_minor(self, v15, v16, v17);
  return (id)objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("CLBeaconRegion (identifier:'%@', uuid:%@, major:%@, minor:%@)"), v20, v6, v10, v14, v18);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v5 = (void *)objc_msgSend_identifier(self, a2, v2, v3);
  if (objc_msgSend_isEqualToString_(v5, v6, (uint64_t)&stru_1E2993188, v7))
  {
    v11 = (void *)objc_msgSend_beaconIdentityConstraint(self, v8, v9, v10);
    return objc_msgSend_hash(v11, v12, v13, v14);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CLBeaconRegion;
    return -[CLRegion hash](&v16, sel_hash);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int isMemberOfClass;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;

  if (self == a3)
  {
    LOBYTE(isMemberOfClass) = 1;
  }
  else
  {
    v5 = objc_opt_class();
    isMemberOfClass = objc_msgSend_isMemberOfClass_(a3, v6, v5, v7);
    if (isMemberOfClass)
    {
      v12 = (void *)objc_msgSend_identifier(self, v9, v10, v11);
      if (objc_msgSend_isEqualToString_(v12, v13, (uint64_t)&stru_1E2993188, v14)
        && (v18 = (void *)objc_msgSend_identifier(self, v15, v16, v17),
            v22 = objc_msgSend_identifier(a3, v19, v20, v21),
            objc_msgSend_isEqualToString_(v18, v23, v22, v24)))
      {
        v25 = (void *)objc_msgSend_beaconIdentityConstraint(self, v15, v16, v17);
        v29 = objc_msgSend_beaconIdentityConstraint(a3, v26, v27, v28);
        LOBYTE(isMemberOfClass) = objc_msgSend_isEqual_(v25, v30, v29, v31);
      }
      else
      {
        v32 = (void *)objc_msgSend_identifier(self, v15, v16, v17);
        v36 = objc_msgSend_identifier(a3, v33, v34, v35);
        LOBYTE(isMemberOfClass) = objc_msgSend_isEqualToString_(v32, v37, v36, v38);
      }
    }
  }
  return isMemberOfClass;
}

- (char)_measuredPowerForDevice
{
  sub_18F5CC0B8();
  return sub_18F672EE0();
}

- (NSMutableDictionary)peripheralDataWithMeasuredPower:(NSNumber *)measuredPower
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  char v38;
  __int16 v39;
  __int16 v40;
  uuid_t uu;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  if (objc_msgSend_UUID(self, v5, v6, v7))
  {
    v11 = (void *)objc_msgSend_UUID(self, v8, v9, v10);
    objc_msgSend_getUUIDBytes_(v11, v12, (uint64_t)uu, v13);
  }
  v40 = 0;
  if (objc_msgSend_major(self, v8, v9, v10))
  {
    v17 = (void *)objc_msgSend_major(self, v14, v15, v16);
    v40 = bswap32(objc_msgSend_shortValue(v17, v18, v19, v20)) >> 16;
  }
  v39 = 0;
  if (objc_msgSend_minor(self, v14, v15, v16))
  {
    v24 = (void *)objc_msgSend_minor(self, v21, v22, v23);
    v39 = bswap32(objc_msgSend_shortValue(v24, v25, v26, v27)) >> 16;
  }
  if (measuredPower)
    v28 = objc_msgSend_charValue(measuredPower, v21, v22, v23);
  else
    v28 = objc_msgSend__measuredPowerForDevice(self, v21, v22, v23);
  v38 = v28;
  v31 = (void *)objc_msgSend_dataWithCapacity_(MEMORY[0x1E0C99DF0], v29, 21, v30);
  objc_msgSend_appendBytes_length_(v31, v32, (uint64_t)uu, 16);
  objc_msgSend_appendBytes_length_(v31, v33, (uint64_t)&v40, 2);
  objc_msgSend_appendBytes_length_(v31, v34, (uint64_t)&v39, 2);
  objc_msgSend_appendBytes_length_(v31, v35, (uint64_t)&v38, 1);
  return (NSMutableDictionary *)objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E0C99E08], v36, (uint64_t)v31, *MEMORY[0x1E0C97608]);
}

- (CLBeaconIdentityConstraint)beaconIdentityConstraint
{
  CLBeaconIdentityConstraint *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;

  v3 = [CLBeaconIdentityConstraint alloc];
  v7 = objc_msgSend_UUID(self, v4, v5, v6);
  v11 = objc_msgSend_major(self, v8, v9, v10);
  v15 = objc_msgSend_minor(self, v12, v13, v14);
  return (CLBeaconIdentityConstraint *)(id)objc_msgSend__initWithUUID_major_minor_(v3, v16, v7, v11, v15);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSNumber)major
{
  return self->_major;
}

- (NSNumber)minor
{
  return self->_minor;
}

- (BOOL)notifyEntryStateOnDisplay
{
  return self->_notifyEntryStateOnDisplay;
}

- (void)setNotifyEntryStateOnDisplay:(BOOL)notifyEntryStateOnDisplay
{
  self->_notifyEntryStateOnDisplay = notifyEntryStateOnDisplay;
}

- (int)definitionMask
{
  return self->_definitionMask;
}

@end
