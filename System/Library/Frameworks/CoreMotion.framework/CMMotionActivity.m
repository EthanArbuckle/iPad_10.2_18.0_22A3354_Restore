@implementation CMMotionActivity

- (CMMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3 endDate:(double)a4
{
  void *v12;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CMMotionActivity *v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v31;

  v12 = *(void **)&a5;
  v14 = *(double *)&a3[1].type;
  v31.receiver = self;
  v31.super_class = (Class)CMMotionActivity;
  v19 = -[CMLogItem initWithTimestamp:](&v31, sel_initWithTimestamp_, v14, a10);
  if (v19)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(v12, v15, v16, v17, v18);
    v19->fEndTime = v20;
    *(_OWORD *)&v19->fState.type = *(_OWORD *)&a3->type;
    v21 = *(_OWORD *)&a3->vehicleType;
    v23 = *(_OWORD *)&a3->mountedConfidence;
    v22 = *(_OWORD *)&a3->isStanding;
    *(_OWORD *)&v19->fState.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&v19->fState.vehicleType = v21;
    *(_OWORD *)&v19->fState.mountedConfidence = v23;
    *(_OWORD *)&v19->fState.isStanding = v22;
    v25 = *(_OWORD *)&a3[1].mountedConfidence;
    v24 = *(_OWORD *)&a3[1].isStanding;
    v26 = *(_OWORD *)&a3[1].type;
    *(_QWORD *)&v19->_anon_60[48] = *(_QWORD *)&a3[1].isVehicleConnected;
    *(_OWORD *)&v19->_anon_60[16] = v25;
    *(_OWORD *)&v19->_anon_60[32] = v24;
    *(_OWORD *)v19->_anon_60 = v26;
    objc_msgSend_setIsRunWalk_(v19, v27, 0, v28, v29);
  }
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)CMMotionActivity;
  -[CMLogItem encodeWithCoder:](&v39, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->fState.type, (uint64_t)CFSTR("kCMMotionActivityCodingKeyType"), v6);
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->fState.confidence, (uint64_t)CFSTR("kCMMotionActivityCodingKeyConfidence"), v8);
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("kCMMotionActivityCodingKeyStartTime"), v10, v11, *(double *)self->_anon_60);
  v15 = 0.0;
  if (self->fState.isVehicleConnected)
    v15 = 1.0;
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicleConnected"), v13, v14, v15);
  objc_msgSend_encodeBool_forKey_(a3, v16, (self->_anon_60[16] >> 1) & 1, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularGpsHint"), v17);
  objc_msgSend_encodeBool_forKey_(a3, v18, (self->_anon_60[16] >> 2) & 1, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularBasebandHint"), v19);
  objc_msgSend_encodeBool_forKey_(a3, v20, (self->_anon_60[16] >> 3) & 1, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularWifiHint"), v21);
  objc_msgSend_encodeBool_forKey_(a3, v22, self->_anon_60[16] & 1, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularMotionHint"), v23);
  objc_msgSend_encodeBool_forKey_(a3, v24, (self->_anon_60[16] >> 4) & 1, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularBTHint"), v25);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("kCMMotionActivityCodingKeyTimestamp"), v27, v28, self->fState.timestamp);
  objc_msgSend_encodeInteger_forKey_(a3, v29, self->fState.conservativeMountedState, (uint64_t)CFSTR("kCMMotionActivityCodingKeyMounted"), v30);
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("kCMMotionActivityCodingKeyMountedProbability"), v32, v33, self->fState.conservativeMountedProbability);
  objc_msgSend_encodeInteger_forKey_(a3, v34, self->fState.vehicleType, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicleType"), v35);
  objc_msgSend_encodeDouble_forKey_(a3, v36, (uint64_t)CFSTR("kCMMotionActivityCodingKeyEndTime"), v37, v38, self->fEndTime);
}

- (CMMotionActivity)initWithCoder:(id)a3
{
  char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)CMMotionActivity;
  v4 = -[CMLogItem initWithCoder:](&v61, sel_initWithCoder_);
  v8 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 2) = 0;
    *((_QWORD *)v4 + 13) = 0;
    *((_DWORD *)v4 + 13) = 0;
    *(_QWORD *)(v4 + 36) = 0;
    *(_QWORD *)(v4 + 28) = 0;
    *((_DWORD *)v4 + 11) = 0;
    *((_QWORD *)v4 + 7) = 0xBFF0000000000000;
    *((_DWORD *)v4 + 17) = 0;
    *((_QWORD *)v4 + 9) = 0xBFF0000000000000;
    *((_QWORD *)v4 + 12) = 0xBFF0000000000000;
    v4[48] = 0;
    v4[64] = 0;
    v4[112] = 0;
    *(_QWORD *)(v4 + 116) = 0;
    *((_DWORD *)v4 + 6) = 0;
    *((_DWORD *)v4 + 20) = 0;
    *((_QWORD *)v4 + 16) = 0;
    *((_QWORD *)v4 + 17) = 0;
    *((_DWORD *)v4 + 36) = 0;
    *((_DWORD *)v4 + 4) = objc_msgSend_decodeIntegerForKey_(a3, v5, (uint64_t)CFSTR("kCMMotionActivityCodingKeyType"), v6, v7);
    *((_DWORD *)v8 + 5) = objc_msgSend_decodeIntegerForKey_(a3, v9, (uint64_t)CFSTR("kCMMotionActivityCodingKeyConfidence"), v10, v11);
    objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCMMotionActivityCodingKeyStartTime"), v13, v14);
    *((_QWORD *)v8 + 12) = v15;
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicleConnected"), v17, v18);
    v8[64] = v19 != 0.0;
    if (objc_msgSend_decodeBoolForKey_(a3, v20, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularGpsHint"), v21, v22))v26 = 2;
    else
      v26 = 0;
    v8[112] = v8[112] & 0xFD | v26;
    if (objc_msgSend_decodeBoolForKey_(a3, v23, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularBasebandHint"), v24, v25))v30 = 4;
    else
      v30 = 0;
    v8[112] = v8[112] & 0xFB | v30;
    if (objc_msgSend_decodeBoolForKey_(a3, v27, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularWifiHint"), v28, v29))v34 = 8;
    else
      v34 = 0;
    v8[112] = v8[112] & 0xF7 | v34;
    v8[112] = v8[112] & 0xFE | objc_msgSend_decodeBoolForKey_(a3, v31, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularMotionHint"), v32, v33);
    if (objc_msgSend_decodeBoolForKey_(a3, v35, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicularBTHint"), v36, v37))v41 = 16;
    else
      v41 = 0;
    v8[112] = v8[112] & 0xEF | v41;
    objc_msgSend_decodeDoubleForKey_(a3, v38, (uint64_t)CFSTR("kCMMotionActivityCodingKeyTimestamp"), v39, v40);
    *((_QWORD *)v8 + 7) = v42;
    *((_DWORD *)v8 + 9) = objc_msgSend_decodeIntegerForKey_(a3, v43, (uint64_t)CFSTR("kCMMotionActivityCodingKeyMounted"), v44, v45);
    objc_msgSend_decodeDoubleForKey_(a3, v46, (uint64_t)CFSTR("kCMMotionActivityCodingKeyMountedProbability"), v47, v48);
    *((_QWORD *)v8 + 5) = v49;
    *((_DWORD *)v8 + 20) = objc_msgSend_decodeIntegerForKey_(a3, v50, (uint64_t)CFSTR("kCMMotionActivityCodingKeyVehicleType"), v51, v52);
    objc_msgSend_decodeDoubleForKey_(a3, v53, (uint64_t)CFSTR("kCMMotionActivityCodingKeyEndTime"), v54, v55);
    *((_QWORD *)v8 + 19) = v56;
    objc_msgSend_setIsRunWalk_(v8, v57, 0, v58, v59);
  }
  return (CMMotionActivity *)v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMMotionActivity;
  -[CMLogItem dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)walking
{
  int type;
  BOOL v3;

  type = self->fState.type;
  v3 = 1;
  if (type != 4 && type != 41)
  {
    if (type == 8)
      return ((uint64_t (*)(CMMotionActivity *, char *))MEMORY[0x1E0DE7D20])(self, sel_isRunWalk);
    return 0;
  }
  return v3;
}

- (BOOL)unknown
{
  return self->fState.type == 0;
}

- (BOOL)stationary
{
  return (self->fState.type < 0xCu) & (0xC06u >> self->fState.type);
}

- (NSDate)startDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, *(double *)self->_anon_60);
}

- (BOOL)running
{
  return self->fState.type == 8;
}

- (CMMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3
{
  double timestamp;
  CMMotionActivity *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CMMotionActivity *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v26;

  timestamp = a3->timestamp;
  v26.receiver = self;
  v26.super_class = (Class)CMMotionActivity;
  v14 = -[CMLogItem initWithTimestamp:](&v26, sel_initWithTimestamp_, timestamp, a10);
  v18 = v14;
  if (v14)
  {
    v14->fEndTime = 1.79769313e308;
    v20 = *(_OWORD *)&a3[1].mountedConfidence;
    v19 = *(_OWORD *)&a3[1].isStanding;
    v21 = *(_OWORD *)&a3[1].type;
    *(_QWORD *)&v14->_anon_60[48] = *(_QWORD *)&a3[1].isVehicleConnected;
    *(_OWORD *)&v14->_anon_60[16] = v20;
    *(_OWORD *)&v14->_anon_60[32] = v19;
    *(_OWORD *)v14->_anon_60 = v21;
    v23 = *(_OWORD *)&a3->mountedConfidence;
    v22 = *(_OWORD *)&a3->isStanding;
    v24 = *(_OWORD *)&a3->vehicleType;
    *(_OWORD *)&v14->fState.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&v14->fState.vehicleType = v24;
    *(_OWORD *)&v14->fState.mountedConfidence = v23;
    *(_OWORD *)&v14->fState.isStanding = v22;
    *(_OWORD *)&v14->fState.type = *(_OWORD *)&a3->type;
    objc_msgSend_setIsRunWalk_(v14, v15, 0, v16, v17);
  }
  return v18;
}

- (CMMotionActivityConfidence)confidence
{
  return (unint64_t)self->fState.confidence;
}

- (BOOL)automotive
{
  int type;
  BOOL v3;

  type = self->fState.type;
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

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMMotionActivity;
  result = -[CMLogItem copyWithZone:](&v11, sel_copyWithZone_, a3);
  if (result)
  {
    *((_OWORD *)result + 1) = *(_OWORD *)&self->fState.type;
    v5 = *(_OWORD *)&self->fState.vehicleType;
    v7 = *(_OWORD *)&self->fState.mountedConfidence;
    v6 = *(_OWORD *)&self->fState.isStanding;
    *((_OWORD *)result + 4) = *(_OWORD *)&self->fState.isVehicleConnected;
    *((_OWORD *)result + 5) = v5;
    *((_OWORD *)result + 2) = v7;
    *((_OWORD *)result + 3) = v6;
    v9 = *(_OWORD *)&self->_anon_60[16];
    v8 = *(_OWORD *)&self->_anon_60[32];
    v10 = *(_OWORD *)self->_anon_60;
    *((_QWORD *)result + 18) = *(_QWORD *)&self->_anon_60[48];
    *((_OWORD *)result + 7) = v9;
    *((_OWORD *)result + 8) = v8;
    *((_OWORD *)result + 6) = v10;
    *((_QWORD *)result + 19) = *(_QWORD *)&self->fEndTime;
  }
  return result;
}

- (BOOL)isVehicleConnected
{
  return self->fState.isVehicleConnected;
}

- (BOOL)isVehicleWifiHint
{
  return (self->_anon_60[16] >> 3) & 1;
}

- (BOOL)isVehicleGpsHint
{
  return (self->_anon_60[16] >> 1) & 1;
}

- (BOOL)isVehicleBasebandHint
{
  return (self->_anon_60[16] >> 2) & 1;
}

- (BOOL)isVehicleMotionHint
{
  return self->_anon_60[16] & 1;
}

- (BOOL)isVehicleBTHint
{
  return (self->_anon_60[16] >> 4) & 1;
}

- (BOOL)isMounted
{
  return self->fState.conservativeMountedState != 0;
}

- (double)mountedProbability
{
  return self->fState.conservativeMountedProbability;
}

- (int64_t)vehicleType
{
  return self->fState.vehicleType;
}

- (BOOL)cycling
{
  return self->fState.type == 6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t started;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_timestamp(self, v6, v7, v8, v9);
  v11 = v10;
  started = objc_msgSend_startDate(self, v12, v13, v14, v15);
  v21 = objc_msgSend_confidence(self, v17, v18, v19, v20);
  v26 = objc_msgSend_unknown(self, v22, v23, v24, v25);
  v31 = objc_msgSend_stationary(self, v27, v28, v29, v30);
  v36 = objc_msgSend_walking(self, v32, v33, v34, v35);
  v41 = objc_msgSend_running(self, v37, v38, v39, v40);
  v46 = objc_msgSend_cycling(self, v42, v43, v44, v45);
  v51 = objc_msgSend_automotive(self, v47, v48, v49, v50);
  return (id)objc_msgSend_stringWithFormat_(v3, v52, (uint64_t)CFSTR("%@ @ %f,<startDate,%@,confidence,%ld,unknown,%d,stationary,%d,walking,%d,running,%d,cycling,%d,automotive,%d>"), v53, v54, v5, v11, started, v21, v26, v31, v36, v41, v46, v51);
}

- (id)descriptionInternal
{
  objc_class *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int isVehicleConnected;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int isVehicleMotionHint;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int isVehicleGpsHint;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int isVehicleBTHint;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int isVehicleWifiHint;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int isVehicleBasebandHint;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unsigned int isMounted;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t started;
  NSString *v104;
  void *v105;

  v105 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v104 = NSStringFromClass(v3);
  objc_msgSend_timestamp(self, v4, v5, v6, v7);
  v9 = v8;
  started = objc_msgSend_startDate(self, v10, v11, v12, v13);
  v102 = objc_msgSend_endDate(self, v14, v15, v16, v17);
  v101 = objc_msgSend_confidence(self, v18, v19, v20, v21);
  v100 = objc_msgSend_unknown(self, v22, v23, v24, v25);
  v99 = objc_msgSend_stationary(self, v26, v27, v28, v29);
  v98 = objc_msgSend_walking(self, v30, v31, v32, v33);
  v97 = objc_msgSend_running(self, v34, v35, v36, v37);
  v96 = objc_msgSend_cycling(self, v38, v39, v40, v41);
  v46 = objc_msgSend_automotive(self, v42, v43, v44, v45);
  v51 = objc_msgSend_vehicleType(self, v47, v48, v49, v50);
  isVehicleConnected = objc_msgSend_isVehicleConnected(self, v52, v53, v54, v55);
  isVehicleMotionHint = objc_msgSend_isVehicleMotionHint(self, v57, v58, v59, v60);
  isVehicleGpsHint = objc_msgSend_isVehicleGpsHint(self, v62, v63, v64, v65);
  isVehicleBTHint = objc_msgSend_isVehicleBTHint(self, v67, v68, v69, v70);
  isVehicleWifiHint = objc_msgSend_isVehicleWifiHint(self, v72, v73, v74, v75);
  isVehicleBasebandHint = objc_msgSend_isVehicleBasebandHint(self, v77, v78, v79, v80);
  isMounted = objc_msgSend_isMounted(self, v82, v83, v84, v85);
  objc_msgSend_mountedProbability(self, v87, v88, v89, v90);
  return (id)objc_msgSend_stringWithFormat_(v105, v91, (uint64_t)CFSTR("%@ @ %f,<startDate,%@,endDate,%@,confidence,%ld,unknown,%d,stationary,%d,walking,%d,running,%d,cycling,%d,automotive,%d,vehicleType,%ld,vehicleConnected,%d,motionHint,%d,gpsHint,%d,btHint,%d,wifiHint,%d,bbHint,%d,mounted,%d,mountedProb,%lf>"), v92, v93, v104, v9, started, v102, v101, v100, v99, v98, v97, v96, v46, v51, isVehicleConnected, isVehicleMotionHint,
               isVehicleGpsHint,
               isVehicleBTHint,
               isVehicleWifiHint,
               isVehicleBasebandHint,
               isMounted,
               v94);
}

- (CLMotionActivity)motionActivity
{
  return &self->fState;
}

- (NSDate)endDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->fEndTime);
}

- (BOOL)isSameStateAs:(id)a3
{
  uint64_t v3;
  uint64_t v4;
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
  int v23;
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
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (objc_msgSend_unknown(self, a2, (uint64_t)a3, v3, v4)
    && (objc_msgSend_unknown(a3, v7, v8, v9, v10) & 1) != 0
    || ((objc_msgSend_walking(self, v7, v8, v9, v10) & 1) != 0
     || objc_msgSend_running(self, v11, v12, v13, v14))
    && ((objc_msgSend_walking(a3, v11, v12, v13, v14) & 1) != 0
     || (objc_msgSend_running(a3, v15, v16, v17, v18) & 1) != 0)
    || objc_msgSend_cycling(self, v11, v12, v13, v14)
    && (objc_msgSend_cycling(a3, v19, v20, v21, v22) & 1) != 0
    || (objc_msgSend_stationary(self, v19, v20, v21, v22) & 1) == 0
    && objc_msgSend_automotive(self, v24, v25, v26, v27)
    && (objc_msgSend_stationary(a3, v24, v25, v26, v27) & 1) == 0
    && (objc_msgSend_automotive(a3, v24, v25, v26, v27) & 1) != 0
    || (objc_msgSend_stationary(self, v24, v25, v26, v27) & 1) == 0
    && objc_msgSend_automotive(self, v28, v29, v30, v31)
    && objc_msgSend_stationary(a3, v28, v29, v30, v31)
    && (objc_msgSend_automotive(a3, v28, v29, v30, v31) & 1) != 0
    || objc_msgSend_stationary(self, v28, v29, v30, v31)
    && objc_msgSend_automotive(self, v32, v33, v34, v35)
    && (objc_msgSend_stationary(a3, v32, v33, v34, v35) & 1) == 0
    && (objc_msgSend_automotive(a3, v32, v33, v34, v35) & 1) != 0
    || objc_msgSend_stationary(self, v32, v33, v34, v35)
    && objc_msgSend_automotive(self, v36, v37, v38, v39)
    && objc_msgSend_stationary(a3, v36, v37, v38, v39)
    && (objc_msgSend_automotive(a3, v36, v37, v38, v39) & 1) != 0)
  {
    LOBYTE(v23) = 1;
  }
  else
  {
    v23 = objc_msgSend_stationary(self, v36, v37, v38, v39);
    if (v23)
      LOBYTE(v23) = objc_msgSend_stationary(a3, v40, v41, v42, v43);
  }
  return v23;
}

- (void)setEndTime:(double)a3
{
  self->fEndTime = a3;
}

- (BOOL)isRunWalk
{
  return self->_isRunWalk;
}

- (void)setIsRunWalk:(BOOL)a3
{
  self->_isRunWalk = a3;
}

@end
