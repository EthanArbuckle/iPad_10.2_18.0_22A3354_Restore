@implementation CMDeviceMotion

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMDeviceMotion;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

- (CMDeviceMotion)initWithDeviceMotion:(id *)a3 internal:(id)a4 timestamp:(double)a5
{
  CMDeviceMotion *v7;
  CMDeviceMotionInternal *v8;
  __int128 v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v15[5];
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CMDeviceMotion;
  v7 = -[CMLogItem initWithTimestamp:](&v17, sel_initWithTimestamp_, a5);
  if (v7)
  {
    v8 = [CMDeviceMotionInternal alloc];
    v9 = *(_OWORD *)&a3->var2.var1;
    v15[2] = *(_OWORD *)&a3->var1.var0;
    v15[3] = v9;
    v15[4] = *(_OWORD *)&a3->var3.var2;
    v16 = *(_QWORD *)&a3->var9;
    v10 = *(_OWORD *)&a3->var0.var2;
    v15[0] = *(_OWORD *)&a3->var0.var0;
    v15[1] = v10;
    v7->_internal = (id)objc_msgSend_initWithDeviceMotion_internal_(v8, v11, (uint64_t)v15, v12, v13, COERCE_DOUBLE(__PAIR64__(DWORD1(v15[0]), a4.var0)));
  }
  return v7;
}

- (CMAcceleration)gravity
{
  double *internal;
  double v3;
  double v4;
  double v5;
  CMAcceleration result;

  internal = (double *)self->_internal;
  v3 = internal[1];
  v4 = internal[2];
  v5 = internal[3];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CMAcceleration)userAcceleration
{
  double *internal;
  double v3;
  double v4;
  double v5;
  CMAcceleration result;

  internal = (double *)self->_internal;
  v3 = internal[4];
  v4 = internal[5];
  v5 = internal[6];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CMAttitude)attitude
{
  return (CMAttitude *)*((_QWORD *)self->_internal + 10);
}

- (CMRotationRate)rotationRate
{
  double *internal;
  double v3;
  double v4;
  double v5;
  CMRotationRate result;

  internal = (double *)self->_internal;
  v3 = internal[7];
  v4 = internal[8];
  v5 = internal[9];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (int)magneticFieldCalibrationLevel
{
  return *((_DWORD *)self->_internal + 28);
}

- (double)heading
{
  return *((float *)self->_internal + 30);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMDeviceMotion)initWithCoder:(id)a3
{
  CMDeviceMotion *v4;
  CMDeviceMotionInternal *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  float v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  float v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  float v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  float v101;
  CMAttitude *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  _QWORD v119[4];
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  float v127;
  float v128;
  int v129;
  char v130;
  char v131;
  char v132;
  float v133;
  char v134;
  char v135;
  int v136;
  objc_super v137;

  v137.receiver = self;
  v137.super_class = (Class)CMDeviceMotion;
  v4 = -[CMLogItem initWithCoder:](&v137, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_alloc_init(CMDeviceMotionInternal);
    v4->_internal = v5;
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyQuaternionX"), v7, v8);
    v10 = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyQuaternionY"), v12, v13);
    v15 = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyQuaternionZ"), v17, v18);
    v20 = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v21, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyQuaternionW"), v22, v23);
    v25 = v24;
    objc_msgSend_decodeDoubleForKey_(a3, v26, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyUserAccelerationX"), v27, v28);
    *(float *)&v29 = v29;
    v118 = LODWORD(v29);
    objc_msgSend_decodeDoubleForKey_(a3, v30, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyUserAccelerationY"), v31, v32);
    *(float *)&v33 = v33;
    v117 = LODWORD(v33);
    objc_msgSend_decodeDoubleForKey_(a3, v34, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyUserAccelerationZ"), v35, v36);
    *(float *)&v37 = v37;
    v116 = LODWORD(v37);
    objc_msgSend_decodeDoubleForKey_(a3, v38, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyRotationRateX"), v39, v40);
    *(float *)&v41 = v41;
    v115 = LODWORD(v41);
    objc_msgSend_decodeDoubleForKey_(a3, v42, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyRotationRateY"), v43, v44);
    *(float *)&v45 = v45;
    v114 = LODWORD(v45);
    objc_msgSend_decodeDoubleForKey_(a3, v46, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyRotationRateZ"), v47, v48);
    *(float *)&v49 = v49;
    v113 = LODWORD(v49);
    objc_msgSend_decodeDoubleForKey_(a3, v50, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyMagneticFieldX"), v51, v52);
    *(float *)&v53 = v53;
    v112 = LODWORD(v53);
    objc_msgSend_decodeDoubleForKey_(a3, v54, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyMagneticFieldY"), v55, v56);
    v58 = v57;
    objc_msgSend_decodeDoubleForKey_(a3, v59, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyMagneticFieldZ"), v60, v61);
    v63 = v62;
    v67 = objc_msgSend_decodeIntegerForKey_(a3, v64, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyMagneticFieldCalibrationLevel"), v65, v66);
    v71 = objc_msgSend_decodeBoolForKey_(a3, v68, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyDoingYawCorrection"), v69, v70);
    v75 = objc_msgSend_decodeBoolForKey_(a3, v72, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyDoingBiasEstimation"), v73, v74);
    v79 = objc_msgSend_decodeBoolForKey_(a3, v76, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyIsInitialized"), v77, v78);
    objc_msgSend_decodeDoubleForKey_(a3, v80, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyHeading"), v81, v82);
    v84 = v83;
    v88 = objc_msgSend_decodeBoolForKey_(a3, v85, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyFusedWithVision"), v86, v87);
    v92 = objc_msgSend_decodeBoolForKey_(a3, v89, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyUsingVisionCorrections"), v90, v91);
    v96 = objc_msgSend_decodeIntegerForKey_(a3, v93, (uint64_t)CFSTR("kCMDeviceMotionCodingKeySensorLocation"), v94, v95);
    objc_msgSend_decodeDoubleForKey_(a3, v97, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyHeadingAccuracy"), v98, v99);
    v101 = v100;
    v102 = [CMAttitude alloc];
    v5->fAttitude = (CMAttitude *)objc_msgSend_initWithQuaternion_(v102, v103, v104, v105, v106, v25, v10, v15, v20);
    *(double *)v119 = v25;
    *(double *)&v119[1] = v10;
    *(double *)&v119[2] = v15;
    *(double *)&v119[3] = v20;
    v120 = v118;
    v121 = v117;
    v122 = v116;
    v123 = v115;
    v124 = v114;
    v125 = v113;
    v126 = v112;
    v127 = v58;
    v128 = v63;
    v129 = v67;
    v130 = v71;
    v131 = v75;
    v132 = v79;
    v133 = v84;
    v134 = v88;
    v135 = v92;
    v136 = v96;
    *(float *)&v107 = v101;
    objc_msgSend_setDeviceMotion_internal_(v5, v108, (uint64_t)v119, v109, v110, v107);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int *internal;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  objc_super v75;

  v75.receiver = self;
  v75.super_class = (Class)CMDeviceMotion;
  -[CMLogItem encodeWithCoder:](&v75, sel_encodeWithCoder_);
  internal = (int *)self->_internal;
  objc_msgSend_quaternion(*((void **)internal + 10), v6, v7, v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyQuaternionX"), v17, v18);
  objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyQuaternionY"), v20, v21, v11);
  objc_msgSend_encodeDouble_forKey_(a3, v22, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyQuaternionZ"), v23, v24, v13);
  objc_msgSend_encodeDouble_forKey_(a3, v25, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyQuaternionW"), v26, v27, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v28, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyUserAccelerationX"), v29, v30, *((double *)internal + 4));
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyUserAccelerationY"), v32, v33, *((double *)internal + 5));
  objc_msgSend_encodeDouble_forKey_(a3, v34, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyUserAccelerationZ"), v35, v36, *((double *)internal + 6));
  objc_msgSend_encodeDouble_forKey_(a3, v37, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyRotationRateX"), v38, v39, *((double *)internal + 7));
  objc_msgSend_encodeDouble_forKey_(a3, v40, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyRotationRateY"), v41, v42, *((double *)internal + 8));
  objc_msgSend_encodeDouble_forKey_(a3, v43, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyRotationRateZ"), v44, v45, *((double *)internal + 9));
  objc_msgSend_encodeDouble_forKey_(a3, v46, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyMagneticFieldX"), v47, v48, *((double *)internal + 11));
  objc_msgSend_encodeDouble_forKey_(a3, v49, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyMagneticFieldY"), v50, v51, *((double *)internal + 12));
  objc_msgSend_encodeDouble_forKey_(a3, v52, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyMagneticFieldZ"), v53, v54, *((double *)internal + 13));
  objc_msgSend_encodeInteger_forKey_(a3, v55, internal[28], (uint64_t)CFSTR("kCMDeviceMotionCodingKeyMagneticFieldCalibrationLevel"), v56);
  objc_msgSend_encodeBool_forKey_(a3, v57, *((unsigned __int8 *)internal + 116), (uint64_t)CFSTR("kCMDeviceMotionCodingKeyDoingYawCorrection"), v58);
  objc_msgSend_encodeBool_forKey_(a3, v59, *((unsigned __int8 *)internal + 117), (uint64_t)CFSTR("kCMDeviceMotionCodingKeyDoingBiasEstimation"), v60);
  objc_msgSend_encodeBool_forKey_(a3, v61, *((unsigned __int8 *)internal + 118), (uint64_t)CFSTR("kCMDeviceMotionCodingKeyIsInitialized"), v62);
  objc_msgSend_encodeDouble_forKey_(a3, v63, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyHeading"), v64, v65, *((float *)internal + 30));
  objc_msgSend_encodeBool_forKey_(a3, v66, *((unsigned __int8 *)internal + 128), (uint64_t)CFSTR("kCMDeviceMotionCodingKeyFusedWithVision"), v67);
  objc_msgSend_encodeBool_forKey_(a3, v68, *((unsigned __int8 *)internal + 129), (uint64_t)CFSTR("kCMDeviceMotionCodingKeyUsingVisionCorrections"), v69);
  objc_msgSend_encodeDouble_forKey_(a3, v70, (uint64_t)CFSTR("kCMDeviceMotionCodingKeyHeadingAccuracy"), v71, v72, *((float *)internal + 31));
  objc_msgSend_encodeInteger_forKey_(a3, v73, *((_QWORD *)internal + 17), (uint64_t)CFSTR("kCMDeviceMotionCodingKeySensorLocation"), v74);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMDeviceMotion;
  v8 = -[CMLogItem copyWithZone:](&v10, sel_copyWithZone_);
  if (v8)
    v8[2] = objc_msgSend_copyWithZone_(self->_internal, v5, (uint64_t)a3, v6, v7);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_timestamp(self, v5, v6, v7, v8),
        v10 = v9,
        objc_msgSend_timestamp(a3, v11, v12, v13, v14),
        v10 == v18))
  {
    return objc_msgSend_isEqual_(self->_internal, v15, *((_QWORD *)a3 + 2), v16, v17);
  }
  else
  {
    return 0;
  }
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **internal;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  internal = (void **)self->_internal;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_quaternion(internal[10], a2, v2, v3, v4);
  v58 = v8;
  objc_msgSend_quaternion(internal[10], v9, v10, v11, v12);
  v57 = v13;
  objc_msgSend_quaternion(internal[10], v14, v15, v16, v17);
  v19 = v18;
  objc_msgSend_quaternion(internal[10], v20, v21, v22, v23);
  v25 = v24;
  v55 = *((_OWORD *)internal + 3);
  v56 = *((_OWORD *)internal + 2);
  v26 = internal[8];
  v27 = internal[9];
  objc_msgSend_magneticField(self, v28, v29, v30, v31);
  v32 = v63;
  objc_msgSend_magneticField(self, v33, v34, v35, v36);
  v37 = v62;
  objc_msgSend_magneticField(self, v38, v39, v40, v41);
  v42 = v61;
  objc_msgSend_magneticField(self, v43, v44, v45, v46);
  v47 = *((float *)internal + 30);
  v48 = internal[17];
  v59.receiver = self;
  v59.super_class = (Class)CMDeviceMotion;
  v49 = v60;
  -[CMLogItem timestamp](&v59, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v7, v50, (uint64_t)CFSTR("QuaternionX %f QuaternionY %f QuaternionZ %f QuaternionW %f UserAccelX %f UserAccelY %f UserAccelZ %f RotationRateX %f RotationRateY %f RotationRateZ %f MagneticFieldX %f MagneticFieldY %f MagneticFieldZ %f MagneticFieldAccuracy %d Heading %f SensorLocation %d @ %f"), v51, v52, v58, v57, v19, v25, v56, v55, v26, v27, v32, v37, v42, v49, *(_QWORD *)&v47, v48,
               v53);
}

- (CMCalibratedMagneticField)magneticField
{
  double z;
  int v4;
  CMMagneticFieldCalibrationAccuracy v5;

  z = self->field.z;
  *(_OWORD *)&retstr->field.x = *(_OWORD *)(*(_QWORD *)&z + 88);
  retstr->field.z = *(double *)(*(_QWORD *)&z + 104);
  v4 = *(_DWORD *)(*(_QWORD *)&z + 112) - 1;
  if (v4 > 5)
    v5 = CMMagneticFieldCalibrationAccuracyUncalibrated;
  else
    v5 = dword_18F505BD0[v4];
  retstr->accuracy = v5;
  return self;
}

- (BOOL)doingYawCorrection
{
  return *((_BYTE *)self->_internal + 116);
}

- (BOOL)doingBiasEstimation
{
  return *((_BYTE *)self->_internal + 117);
}

- (BOOL)isInitialized
{
  return *((_BYTE *)self->_internal + 118);
}

- (double)headingAccuracy
{
  return *((float *)self->_internal + 31);
}

- (BOOL)fusedWithVision
{
  return *((_BYTE *)self->_internal + 128);
}

- (BOOL)usingVisionCorrections
{
  return *((_BYTE *)self->_internal + 129);
}

- (CMDeviceMotionSensorLocation)sensorLocation
{
  return *((_QWORD *)self->_internal + 17);
}

@end
