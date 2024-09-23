@implementation CMActivity

- (CMActivity)initWithMotionActivity:(CLMotionActivity *)a3
{
  double timestamp;
  CMActivity *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMLogItem v20;
  objc_super v21;

  timestamp = a3->timestamp;
  v21.receiver = self;
  v21.super_class = (Class)CMActivity;
  result = -[CMLogItem initWithTimestamp:](&v21, sel_initWithTimestamp_, timestamp, a10);
  if (result)
  {
    *(_OWORD *)&result->fActivity.type = *(_OWORD *)&a3->type;
    v15 = *(_OWORD *)&a3->vehicleType;
    v17 = *(_OWORD *)&a3->mountedConfidence;
    v16 = *(_OWORD *)&a3->isStanding;
    *(_OWORD *)&result->fActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&result->fActivity.vehicleType = v15;
    *(_OWORD *)&result->fActivity.mountedConfidence = v17;
    *(_OWORD *)&result->fActivity.isStanding = v16;
    v19 = *(_OWORD *)&a3[1].mountedConfidence;
    v18 = *(_OWORD *)&a3[1].isStanding;
    v20 = *(CMLogItem *)&a3[1].type;
    *(_QWORD *)&result[1].fActivity.isStanding = *(_QWORD *)&a3[1].isVehicleConnected;
    *(_OWORD *)&result[1].fActivity.type = v19;
    *(_OWORD *)&result[1].fActivity.mountedConfidence = v18;
    result[1].super = v20;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMActivity)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)CMActivity;
  v7 = -[CMLogItem initWithCoder:](&v49, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMActivityCodingKeyType"), v5, v6);
    v12 = objc_msgSend_decodeIntegerForKey_(a3, v9, (uint64_t)CFSTR("kCMActivityCodingKeyConfidence"), v10, v11);
    v16 = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("kCMActivityCodingKeyMounted"), v14, v15);
    v20 = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("kCMActivityCodingKeyMountedConfidence"), v18, v19);
    v24 = objc_msgSend_decodeBoolForKey_(a3, v21, (uint64_t)CFSTR("kCMActivityCodingKeyIsStanding"), v22, v23);
    objc_msgSend_decodeFloatForKey_(a3, v25, (uint64_t)CFSTR("kCMActivityCodingKeyTiltAngle"), v26, v27);
    v29 = v28;
    objc_msgSend_decodeDoubleForKey_(a3, v30, (uint64_t)CFSTR("kCMActivityCodingKeyTimestamp"), v31, v32);
    v34 = v33;
    v38 = objc_msgSend_decodeIntegerForKey_(a3, v35, (uint64_t)CFSTR("kCMActivityCodingKeyVehicleExitState"), v36, v37);
    objc_msgSend_decodeDoubleForKey_(a3, v39, (uint64_t)CFSTR("kCMActivityCodingKeyEstExitTime"), v40, v41);
    v43 = v42;
    objc_msgSend_decodeDoubleForKey_(a3, v44, (uint64_t)CFSTR("kCMActivityCodingKeyStartTime"), v45, v46);
    *((_DWORD *)v7 + 4) = v8;
    *((_DWORD *)v7 + 5) = v12;
    *((_DWORD *)v7 + 6) = 0;
    *((_DWORD *)v7 + 7) = v16;
    *((_DWORD *)v7 + 8) = v20;
    *((_DWORD *)v7 + 9) = 0;
    *((_QWORD *)v7 + 5) = 0;
    v7[48] = v24;
    *((_DWORD *)v7 + 13) = v29;
    *((_QWORD *)v7 + 7) = v34;
    v7[64] = 0;
    *((_DWORD *)v7 + 17) = v38;
    *((_QWORD *)v7 + 9) = v43;
    *((_DWORD *)v7 + 22) = 0;
    *((_DWORD *)v7 + 20) = 0;
    *(_DWORD *)(v7 + 83) = 0;
    *((_QWORD *)v7 + 12) = v47;
    *((_QWORD *)v7 + 13) = 0;
    v7[112] = 0;
    *((_DWORD *)v7 + 29) = 0;
    *((_DWORD *)v7 + 30) = 0;
    *((_DWORD *)v7 + 36) = 0;
    *((_QWORD *)v7 + 16) = 0;
    *((_QWORD *)v7 + 17) = 0;
  }
  return (CMActivity *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  CMActivity *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v4 = self;
  v30.receiver = self;
  v30.super_class = (Class)CMActivity;
  -[CMLogItem encodeWithCoder:](&v30, sel_encodeWithCoder_);
  v4 = (CMActivity *)((char *)v4 + 16);
  objc_msgSend_encodeInteger_forKey_(a3, v5, LODWORD(v4->super.super.isa), (uint64_t)CFSTR("kCMActivityCodingKeyType"), v6);
  objc_msgSend_encodeInteger_forKey_(a3, v7, HIDWORD(v4->super.super.isa), (uint64_t)CFSTR("kCMActivityCodingKeyConfidence"), v8);
  objc_msgSend_encodeInteger_forKey_(a3, v9, HIDWORD(v4->super._internalLogItem), (uint64_t)CFSTR("kCMActivityCodingKeyMounted"), v10);
  objc_msgSend_encodeInteger_forKey_(a3, v11, v4->fActivity.type, (uint64_t)CFSTR("kCMActivityCodingKeyMountedConfidence"), v12);
  objc_msgSend_encodeBool_forKey_(a3, v13, LOBYTE(v4->fActivity.mountedConfidence), (uint64_t)CFSTR("kCMActivityCodingKeyIsStanding"), v14);
  LODWORD(v15) = v4->fActivity.conservativeMountedState;
  objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("kCMActivityCodingKeyTiltAngle"), v17, v18, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("kCMActivityCodingKeyTimestamp"), v20, v21, v4->fActivity.conservativeMountedProbability);
  objc_msgSend_encodeInteger_forKey_(a3, v22, LODWORD(v4->fActivity.tilt), (uint64_t)CFSTR("kCMActivityCodingKeyVehicleExitState"), v23);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("kCMActivityCodingKeyEstExitTime"), v25, v26, v4->fActivity.timestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v27, (uint64_t)CFSTR("kCMActivityCodingKeyStartTime"), v28, v29, *(double *)&v4->fActivity.vehicleType);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMLogItem super;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMActivity;
  result = -[CMLogItem copyWithZone:](&v11, sel_copyWithZone_, a3);
  if (result)
  {
    *((_OWORD *)result + 1) = *(_OWORD *)&self->fActivity.type;
    v5 = *(_OWORD *)&self->fActivity.vehicleType;
    v7 = *(_OWORD *)&self->fActivity.mountedConfidence;
    v6 = *(_OWORD *)&self->fActivity.isStanding;
    *((_OWORD *)result + 4) = *(_OWORD *)&self->fActivity.isVehicleConnected;
    *((_OWORD *)result + 5) = v5;
    *((_OWORD *)result + 2) = v7;
    *((_OWORD *)result + 3) = v6;
    v9 = *(_OWORD *)&self[1].fActivity.type;
    v8 = *(_OWORD *)&self[1].fActivity.mountedConfidence;
    super = self[1].super;
    *((_QWORD *)result + 18) = *(_QWORD *)&self[1].fActivity.isStanding;
    *((_OWORD *)result + 7) = v9;
    *((_OWORD *)result + 8) = v8;
    *((CMLogItem *)result + 6) = super;
  }
  return result;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  objc_class *v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  if (self)
    objc_msgSend_activity(self, a2, v2, v3, v4);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_msgSend_timestamp(self, v9, v10, v11, v12);
  v14 = v13;
  v19 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v15, v16, v17, v18, 0.0);
  v20 = CLMotionActivity::activityTypeToString(0);
  return (id)objc_msgSend_stringWithFormat_(v6, v21, (uint64_t)CFSTR("%@ @ %f,<startDate,%@,type,%s,confidence,%s,mountedState,%d,mountedConfidence,%s,isStanding,%d,tiltAngle,%f,exitState,%d,estExitTime,%f>"), v22, v23, v8, v14, v19, v20, "low", 0, "low", 0, 0.0, 0, 0);
}

- (CLMotionActivity)activity
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v10 = *(_OWORD *)&self[1].isVehicleConnected;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[1].isStanding;
  *(_OWORD *)&retstr[1].isStanding = v10;
  *(_QWORD *)&retstr[1].isVehicleConnected = *(_QWORD *)&self[1].vehicleType;
  v11 = *(_OWORD *)&self->vehicleType;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self->isVehicleConnected;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  v12 = *(_OWORD *)&self[1].mountedConfidence;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[1].type;
  *(_OWORD *)&retstr[1].type = v12;
  v13 = *(_OWORD *)&self->isStanding;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->mountedConfidence;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (int)confidence
{
  return self->fActivity.confidence;
}

- (BOOL)isMoving
{
  return (self->fActivity.type > 0xBu) | (0x3F8u >> self->fActivity.type) & 1;
}

- (BOOL)isWalking
{
  int type;

  type = self->fActivity.type;
  return type == 4 || type == 41;
}

- (BOOL)isRunning
{
  return self->fActivity.type == 8;
}

- (BOOL)isDriving
{
  int type;
  BOOL v3;

  type = self->fActivity.type;
  v3 = 1;
  if (type > 51)
  {
    if (type == 52 || type == 56)
      return (type & 0xFFFFFFFE) == 0xA || v3;
    goto LABEL_7;
  }
  if (!type)
    return 0;
  if (type != 5)
LABEL_7:
    v3 = 0;
  return (type & 0xFFFFFFFE) == 0xA || v3;
}

- (BOOL)maybeExitingVehicle
{
  return self->fActivity.exitState == 1;
}

- (BOOL)hasExitedVehicle
{
  return self->fActivity.exitState == 2;
}

@end
