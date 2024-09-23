@implementation CLBeacon

- (NSUUID)UUID
{
  return self->_internal->proximityUUID;
}

- (NSUUID)proximityUUID
{
  return self->_internal->proximityUUID;
}

- (NSNumber)major
{
  return self->_internal->major;
}

- (NSNumber)minor
{
  return self->_internal->minor;
}

- (CLProximity)proximity
{
  return self->_internal->proximity;
}

- (CLLocationAccuracy)accuracy
{
  return self->_internal->accuracy;
}

- (NSInteger)rssi
{
  return self->_internal->rssi;
}

- (NSDate)timestamp
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, self->_internal->timestamp);
}

- (CLBeacon)initWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 proximity:(int64_t)a6 accuracy:(double)a7 rssi:(int64_t)a8
{
  CLBeacon *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CLBeacon;
  v14 = -[CLBeacon init](&v25, sel_init);
  if (v14)
  {
    v14->_internal = objc_alloc_init(CLBeaconInternal);
    v14->_internal->proximityUUID = (NSUUID *)objc_msgSend_copy(a3, v15, v16, v17);
    v14->_internal->major = (NSNumber *)objc_msgSend_copy(a4, v18, v19, v20);
    v14->_internal->minor = (NSNumber *)objc_msgSend_copy(a5, v21, v22, v23);
    v14->_internal->proximity = a6;
    v14->_internal->accuracy = a7;
    v14->_internal->rssi = a8;
  }
  return v14;
}

- (CLBeacon)initWithUUID:(id)a3 major:(id)a4 minor:(id)a5 proximity:(int64_t)a6 accuracy:(double)a7 rssi:(int64_t)a8 timestamp:(double)a9
{
  CLBeacon *result;

  result = (CLBeacon *)objc_msgSend_initWithProximityUUID_major_minor_proximity_accuracy_rssi_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a8, a7);
  result->_internal->timestamp = a9;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_internal->proximityUUID = 0;
  self->_internal->major = 0;

  self->_internal->minor = 0;
  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBeacon;
  -[CLBeacon dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLBeacon)initWithCoder:(id)a3
{
  CLBeacon *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  const char *v38;
  double v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CLBeacon;
  v4 = -[CLBeacon init](&v41, sel_init);
  if (v4)
  {
    v4->_internal = objc_alloc_init(CLBeaconInternal);
    if ((objc_msgSend_allowsKeyedCoding(a3, v5, v6, v7) & 1) != 0)
    {
      v8 = objc_opt_class();
      v4->_internal->proximityUUID = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCLBeaconCodingKeyProximityUUID"));
      v10 = objc_opt_class();
      v4->_internal->major = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLBeaconCodingKeyMajor"));
      v12 = objc_opt_class();
      v4->_internal->minor = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, (uint64_t)CFSTR("kCLBeaconCodingKeyMinor"));
      v4->_internal->proximity = (int)objc_msgSend_decodeIntForKey_(a3, v14, (uint64_t)CFSTR("kCLBeaconCodingKeyProximity"), v15);
      objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCLBeaconCodingKeyAccuracy"), v17);
      v4->_internal->accuracy = v18;
      v4->_internal->rssi = objc_msgSend_decodeIntegerForKey_(a3, v19, (uint64_t)CFSTR("kCLBeaconCodingKeyRSSI"), v20);
    }
    else
    {
      v23 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v27 = objc_msgSend_decodeObject(a3, v24, v25, v26);
      v4->_internal->proximityUUID = (NSUUID *)objc_msgSend_initWithUUIDString_(v23, v28, v27, v29);
      v4->_internal->major = (NSNumber *)(id)objc_msgSend_decodeObject(a3, v30, v31, v32);
      v4->_internal->minor = (NSNumber *)(id)objc_msgSend_decodeObject(a3, v33, v34, v35);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v36, (uint64_t)"q", (uint64_t)&v4->_internal->proximity);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v37, (uint64_t)"d", (uint64_t)&v4->_internal->accuracy);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v38, (uint64_t)"q", (uint64_t)&v4->_internal->rssi);
    }
    objc_msgSend_decodeDoubleForKey_(a3, v21, (uint64_t)CFSTR("kCLBeaconCodingKeyTimestamp"), v22);
    v4->_internal->timestamp = v39;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  char v6;
  const char *v7;
  uint64_t v8;
  CLBeaconInternal *internal;
  uint64_t proximityUUID;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  const char *v28;

  v6 = objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3);
  internal = self->_internal;
  proximityUUID = (uint64_t)internal->proximityUUID;
  if ((v6 & 1) != 0)
  {
    objc_msgSend_encodeObject_forKey_(a3, v7, proximityUUID, (uint64_t)CFSTR("kCLBeaconCodingKeyProximityUUID"));
    objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_internal->major, (uint64_t)CFSTR("kCLBeaconCodingKeyMajor"));
    objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_internal->minor, (uint64_t)CFSTR("kCLBeaconCodingKeyMinor"));
    objc_msgSend_encodeInt_forKey_(a3, v13, LODWORD(self->_internal->proximity), (uint64_t)CFSTR("kCLBeaconCodingKeyProximity"));
    objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("kCLBeaconCodingKeyAccuracy"), v15, self->_internal->accuracy);
    objc_msgSend_encodeInteger_forKey_(a3, v16, self->_internal->rssi, (uint64_t)CFSTR("kCLBeaconCodingKeyRSSI"));
  }
  else
  {
    v19 = objc_msgSend_UUIDString(internal->proximityUUID, v7, proximityUUID, v8);
    objc_msgSend_encodeObject_(a3, v20, v19, v21);
    objc_msgSend_encodeObject_(a3, v22, (uint64_t)self->_internal->major, v23);
    objc_msgSend_encodeObject_(a3, v24, (uint64_t)self->_internal->minor, v25);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v26, (uint64_t)"q", (uint64_t)&self->_internal->proximity);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v27, (uint64_t)"d", (uint64_t)&self->_internal->accuracy);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v28, (uint64_t)"q", (uint64_t)&self->_internal->rssi);
  }
  objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("kCLBeaconCodingKeyTimestamp"), v18, self->_internal->timestamp);
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_UUID(self, a2, v2, v3);
  v10 = objc_msgSend_major(self, v7, v8, v9);
  v14 = objc_msgSend_minor(self, v11, v12, v13);
  v18 = objc_msgSend_proximity(self, v15, v16, v17);
  objc_msgSend_accuracy(self, v19, v20, v21);
  v23 = v22;
  v27 = objc_msgSend_rssi(self, v24, v25, v26);
  v31 = objc_msgSend_timestamp(self, v28, v29, v30);
  return (id)objc_msgSend_stringWithFormat_(v5, v32, (uint64_t)CFSTR("CLBeacon (uuid:%@, major:%@, minor:%@, proximity:%d +/- %.2fm, rssi:%ld, timestamp:%@)"), v33, v6, v10, v14, v18, v23, v27, v31);
}

- (int)referenceFrame
{
  return 0;
}

@end
