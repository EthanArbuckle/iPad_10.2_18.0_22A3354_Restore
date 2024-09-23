@implementation CMDeviceMotionLite

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMDeviceMotionLite)initWithDeviceMotionLite:(id *)a3 andDeviceID:(id)a4
{
  char *v6;
  CMAttitude *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double var2;
  BOOL v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMDeviceMotionLite;
  v6 = -[CMDeviceMotionLite init](&v24, sel_init);
  if (v6)
  {
    v7 = [CMAttitude alloc];
    *((_QWORD *)v6 + 3) = objc_msgSend_initWithQuaternion_(v7, v8, v9, v10, v11, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var0.var3);
    *((double *)v6 + 6) = sub_18F1FE3CC(&a3->var0.var0);
    *((double *)v6 + 7) = v12;
    *((double *)v6 + 8) = v13;
    v14 = *(float32x2_t *)&a3->var1.var2;
    *(float64x2_t *)(v6 + 72) = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var0);
    *(float64x2_t *)(v6 + 88) = vcvtq_f64_f32(v14);
    v15 = *(float32x2_t *)&a3->var3.var0;
    *(float64x2_t *)(v6 + 104) = vcvtq_f64_f32(*(float32x2_t *)&a3->var2.var1);
    *(float64x2_t *)(v6 + 120) = vcvtq_f64_f32(v15);
    v16 = *(float32x2_t *)&a3->var4.var1;
    *(float64x2_t *)(v6 + 136) = vcvtq_f64_f32(*(float32x2_t *)&a3->var3.var2);
    *(float64x2_t *)(v6 + 152) = vcvtq_f64_f32(v16);
    *((_QWORD *)v6 + 5) = a3->var5;
    v6[8] = a3->var6;
    *((_QWORD *)v6 + 4) = objc_msgSend_copy(a4, v17, v18, v19, v20);
    *((_DWORD *)v6 + 3) = LODWORD(a3->var7);
    *((_DWORD *)v6 + 4) = LODWORD(a3->var8);
    var2 = a3->var9.var2;
    *(float64x2_t *)(v6 + 168) = vcvtq_f64_f32(*(float32x2_t *)&a3->var9.var0);
    *((double *)v6 + 23) = var2;
  }
  if (qword_1ECEDFD38 != -1)
    dispatch_once(&qword_1ECEDFD38, &unk_1E29542A8);
  if (byte_1ECEDFD30)
    v22 = byte_1ECEDFD31 == 0;
  else
    v22 = 1;
  if (!v22)
  {
    mach_absolute_time();
    kdebug_trace();
  }
  return (CMDeviceMotionLite *)v6;
}

- (CMDeviceMotionLite)initWithCoder:(id)a3
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  int v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  int v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  int v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD v132[4];
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  uint64_t v145;
  char v146;
  __int16 v147;
  char v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  __int16 v154;
  char v155;
  int v156;
  char v157;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3, v4) & 1) != 0)
  {
    v148 = 0;
    v147 = 0;
    v156 = 0;
    v157 = 0;
    objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyQuaternionW"), v8, v9);
    v131 = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyQuaternionX"), v12, v13);
    v130 = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyQuaternionY"), v16, v17);
    v129 = v18;
    objc_msgSend_decodeDoubleForKey_(a3, v19, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyQuaternionZ"), v20, v21);
    v128 = v22;
    objc_msgSend_decodeFloatForKey_(a3, v23, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyUserAccelerationX"), v24, v25);
    v127 = v26;
    objc_msgSend_decodeFloatForKey_(a3, v27, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyUserAccelerationY"), v28, v29);
    v126 = v30;
    objc_msgSend_decodeFloatForKey_(a3, v31, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyUserAccelerationZ"), v32, v33);
    v125 = v34;
    objc_msgSend_decodeFloatForKey_(a3, v35, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRotationRateX"), v36, v37);
    v124 = v38;
    objc_msgSend_decodeFloatForKey_(a3, v39, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRotationRateY"), v40, v41);
    v123 = v42;
    objc_msgSend_decodeFloatForKey_(a3, v43, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRotationRateZ"), v44, v45);
    v122 = v46;
    objc_msgSend_decodeFloatForKey_(a3, v47, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawAccelerationX"), v48, v49);
    v121 = v50;
    objc_msgSend_decodeFloatForKey_(a3, v51, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawAccelerationY"), v52, v53);
    v120 = v54;
    objc_msgSend_decodeFloatForKey_(a3, v55, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawAccelerationZ"), v56, v57);
    v119 = v58;
    objc_msgSend_decodeFloatForKey_(a3, v59, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawRotationRateX"), v60, v61);
    v63 = v62;
    objc_msgSend_decodeFloatForKey_(a3, v64, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawRotationRateY"), v65, v66);
    v68 = v67;
    objc_msgSend_decodeFloatForKey_(a3, v69, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawRotationRateZ"), v70, v71);
    v73 = v72;
    v74 = objc_opt_class();
    v77 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v75, v74, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyMachTimestamp"), v76);
    v82 = objc_msgSend_unsignedLongLongValue(v77, v78, v79, v80, v81);
    v86 = objc_msgSend_decodeBoolForKey_(a3, v83, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyUsingCompass"), v84, v85);
    objc_msgSend_decodeFloatForKey_(a3, v87, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyGyroTemperature"), v88, v89);
    v91 = v90;
    objc_msgSend_decodeFloatForKey_(a3, v92, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyCompassTemperature"), v93, v94);
    v96 = v95;
    objc_msgSend_decodeFloatForKey_(a3, v97, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawMagneticFieldX"), v98, v99);
    v101 = v100;
    objc_msgSend_decodeFloatForKey_(a3, v102, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawMagneticFieldY"), v103, v104);
    v106 = v105;
    objc_msgSend_decodeFloatForKey_(a3, v107, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawMagneticFieldZ"), v108, v109);
    v111 = v110;
    v112 = objc_opt_class();
    v115 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v113, v112, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyPhysicalDeviceUniqueID"), v114);
    v132[0] = v131;
    v132[1] = v130;
    v132[2] = v129;
    v132[3] = v128;
    v133 = v127;
    v134 = v126;
    v135 = v125;
    v136 = v124;
    v137 = v123;
    v138 = v122;
    v139 = v121;
    v140 = v120;
    v141 = v119;
    v142 = v63;
    v143 = v68;
    v144 = v73;
    v145 = v82;
    v146 = v86;
    v149 = v91;
    v150 = v96;
    v151 = v101;
    v152 = v106;
    v153 = v111;
    v155 = 0;
    v154 = 0;
    return (CMDeviceMotionLite *)objc_msgSend_initWithDeviceMotionLite_andDeviceID_(self, v116, (uint64_t)v132, v115, v117);
  }
  else
  {

    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double x;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double y;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  double z;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  double v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3, v4) & 1) == 0)
  {
    v117 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v117, v118, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMDeviceMotionLite.mm"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[encoder allowsKeyedCoding]"));
  }
  objc_msgSend_quaternion(self->_attitude, v8, v9, v10, v11);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyQuaternionX"), v13, v14);
  objc_msgSend_quaternion(self->_attitude, v15, v16, v17, v18);
  objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyQuaternionY"), v20, v21, v22);
  objc_msgSend_quaternion(self->_attitude, v23, v24, v25, v26);
  objc_msgSend_encodeDouble_forKey_(a3, v27, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyQuaternionZ"), v28, v29, v30);
  objc_msgSend_quaternion(self->_attitude, v31, v32, v33, v34);
  objc_msgSend_encodeDouble_forKey_(a3, v35, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyQuaternionW"), v36, v37, v38);
  x = self->_userAcceleration.x;
  *(float *)&x = x;
  objc_msgSend_encodeFloat_forKey_(a3, v40, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyUserAccelerationX"), v41, v42, x);
  y = self->_userAcceleration.y;
  *(float *)&y = y;
  objc_msgSend_encodeFloat_forKey_(a3, v44, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyUserAccelerationY"), v45, v46, y);
  z = self->_userAcceleration.z;
  *(float *)&z = z;
  objc_msgSend_encodeFloat_forKey_(a3, v48, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyUserAccelerationZ"), v49, v50, z);
  v51 = self->_rotationRate.x;
  *(float *)&v51 = v51;
  objc_msgSend_encodeFloat_forKey_(a3, v52, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRotationRateX"), v53, v54, v51);
  v55 = self->_rotationRate.y;
  *(float *)&v55 = v55;
  objc_msgSend_encodeFloat_forKey_(a3, v56, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRotationRateY"), v57, v58, v55);
  v59 = self->_rotationRate.z;
  *(float *)&v59 = v59;
  objc_msgSend_encodeFloat_forKey_(a3, v60, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRotationRateZ"), v61, v62, v59);
  v63 = self->_rawAcceleration.x;
  *(float *)&v63 = v63;
  objc_msgSend_encodeFloat_forKey_(a3, v64, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawAccelerationX"), v65, v66, v63);
  v67 = self->_rawAcceleration.y;
  *(float *)&v67 = v67;
  objc_msgSend_encodeFloat_forKey_(a3, v68, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawAccelerationY"), v69, v70, v67);
  v71 = self->_rawAcceleration.z;
  *(float *)&v71 = v71;
  objc_msgSend_encodeFloat_forKey_(a3, v72, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawAccelerationZ"), v73, v74, v71);
  v75 = self->_rawRotationRate.x;
  *(float *)&v75 = v75;
  objc_msgSend_encodeFloat_forKey_(a3, v76, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawRotationRateX"), v77, v78, v75);
  v79 = self->_rawRotationRate.y;
  *(float *)&v79 = v79;
  objc_msgSend_encodeFloat_forKey_(a3, v80, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawRotationRateY"), v81, v82, v79);
  v83 = self->_rawRotationRate.z;
  *(float *)&v83 = v83;
  objc_msgSend_encodeFloat_forKey_(a3, v84, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawRotationRateZ"), v85, v86, v83);
  v90 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v87, self->_machTimestamp, v88, v89);
  objc_msgSend_encodeObject_forKey_(a3, v91, v90, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyMachTimestamp"), v92);
  objc_msgSend_encodeBool_forKey_(a3, v93, self->_usingCompass, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyUsingCompass"), v94);
  objc_msgSend_encodeObject_forKey_(a3, v95, (uint64_t)self->_physicalDeviceUniqueID, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyPhysicalDeviceUniqueID"), v96);
  *(float *)&v97 = self->_gyroTemperature;
  objc_msgSend_encodeFloat_forKey_(a3, v98, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyGyroTemperature"), v99, v100, v97);
  *(float *)&v101 = self->_compassTemperature;
  objc_msgSend_encodeFloat_forKey_(a3, v102, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyCompassTemperature"), v103, v104, v101);
  v105 = self->_rawMagneticField.x;
  *(float *)&v105 = v105;
  objc_msgSend_encodeFloat_forKey_(a3, v106, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawMagneticFieldX"), v107, v108, v105);
  v109 = self->_rawMagneticField.y;
  *(float *)&v109 = v109;
  objc_msgSend_encodeFloat_forKey_(a3, v110, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawMagneticFieldY"), v111, v112, v109);
  v113 = self->_rawMagneticField.z;
  *(float *)&v113 = v113;
  objc_msgSend_encodeFloat_forKey_(a3, v114, (uint64_t)CFSTR("kCMDeviceMotionLiteCodingKeyRawMagneticFieldZ"), v115, v116, v113);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMDeviceMotionLite;
  -[CMDeviceMotionLite dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double z;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v17 = objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v17)
  {
    *(_QWORD *)(v17 + 24) = objc_msgSend_copyWithZone_(self->_attitude, v14, (uint64_t)a3, v15, v16);
    z = self->_gravity.z;
    *(_OWORD *)(v17 + 48) = *(_OWORD *)&self->_gravity.x;
    *(double *)(v17 + 64) = z;
    v19 = *(_OWORD *)&self->_userAcceleration.x;
    *(double *)(v17 + 88) = self->_userAcceleration.z;
    *(_OWORD *)(v17 + 72) = v19;
    v20 = *(_OWORD *)&self->_rotationRate.x;
    *(double *)(v17 + 112) = self->_rotationRate.z;
    *(_OWORD *)(v17 + 96) = v20;
    v21 = *(_OWORD *)&self->_rawAcceleration.x;
    *(double *)(v17 + 136) = self->_rawAcceleration.z;
    *(_OWORD *)(v17 + 120) = v21;
    v22 = *(_OWORD *)&self->_rawRotationRate.x;
    *(double *)(v17 + 160) = self->_rawRotationRate.z;
    *(_OWORD *)(v17 + 144) = v22;
    *(_QWORD *)(v17 + 40) = self->_machTimestamp;
    *(_BYTE *)(v17 + 8) = self->_usingCompass;
    *(_QWORD *)(v17 + 32) = objc_msgSend_copyWithZone_(self->_physicalDeviceUniqueID, v23, (uint64_t)a3, v24, v25);
    *(float *)(v17 + 12) = self->_gyroTemperature;
    *(float *)(v17 + 16) = self->_compassTemperature;
    v26 = *(_OWORD *)&self->_rawMagneticField.x;
    *(double *)(v17 + 184) = self->_rawMagneticField.z;
    *(_OWORD *)(v17 + 168) = v26;
  }
  return (id)v17;
}

- (id)description
{
  _BOOL4 usingCompass;
  void *v4;
  objc_class *v5;
  NSString *v6;
  double x;
  double y;
  double z;
  double v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  double v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  double v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;

  usingCompass = self->_usingCompass;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  x = self->_gravity.x;
  y = self->_gravity.y;
  z = self->_gravity.z;
  v10 = self->_userAcceleration.x;
  v11 = self->_userAcceleration.y;
  v12 = self->_userAcceleration.z;
  objc_msgSend_tip(self, v13, v14, v15, v16);
  v18 = v17;
  objc_msgSend_tilt(self, v19, v20, v21, v22);
  v28 = v27;
  if (usingCompass)
  {
    objc_msgSend_quaternion(self->_attitude, v23, v24, v25, v26);
    v64 = x;
    v62 = v29;
    objc_msgSend_quaternion(self->_attitude, v30, v31, v32, v33);
    v63 = y;
    v35 = v34;
    objc_msgSend_quaternion(self->_attitude, v36, v37, v38, v39);
    v61 = z;
    v41 = v40;
    objc_msgSend_quaternion(self->_attitude, v42, v43, v44, v45);
    v60 = v10;
    v47 = v46;
    v59 = *(_OWORD *)&self->_rotationRate.x;
    v48 = v11;
    v49 = self->_rotationRate.z;
    v50 = sub_18F1FD20C(self->_machTimestamp);
    return (id)objc_msgSend_stringWithFormat_(v4, v51, (uint64_t)CFSTR("%@,Gravity,%f,%f,%f,UserAcceleration,%f,%f,%f,Tip,%f,Tilt,%f,Attitude,%f,%f,%f,%f,RotationRate,%f,%f,%f,MachTimestamp,%f,UsingCompass,%d,PhysicalDeviceUniqueID,%@"), v52, v53, v6, *(_QWORD *)&v64, *(_QWORD *)&v63, *(_QWORD *)&v61, *(_QWORD *)&v60, *(_QWORD *)&v48, *(_QWORD *)&v12, *(_QWORD *)&v18, *(_QWORD *)&v28, v62, v35, v41, v47, v59,
                 *(_QWORD *)&v49,
                 *(_QWORD *)&v50,
                 self->_usingCompass,
                 self->_physicalDeviceUniqueID);
  }
  else
  {
    v55 = sub_18F1FD20C(self->_machTimestamp);
    return (id)objc_msgSend_stringWithFormat_(v4, v56, (uint64_t)CFSTR("%@,Gravity,%f,%f,%f,UserAcceleration,%f,%f,%f,Tip,%f,Tilt,%f,MachTimestamp,%f,UsingCompass,%d,PhysicalDeviceUniqueID,%@"), v57, v58, v6, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&z, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v18, *(_QWORD *)&v28, *(_QWORD *)&v55, self->_usingCompass, self->_physicalDeviceUniqueID);
  }
}

- (id)debugDescription
{
  void *v3;
  double compassTemperature;
  double z;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v11;
  NSString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_usingCompass)
  {
    compassTemperature = self->_compassTemperature;
    v65 = *(_OWORD *)&self->_rawMagneticField.x;
    z = self->_rawMagneticField.z;
    v6 = sub_18F1FD20C(self->_machTimestamp);
    return (id)objc_msgSend_stringWithFormat_(v3, v7, (uint64_t)CFSTR("Magnesium,%f,%f,%f,%f,MachTimestamp,%f,PhysicalDeviceUniqueID,%@"), v8, v9, *(_QWORD *)&compassTemperature, v65, *(_QWORD *)&z, *(_QWORD *)&v6, self->_physicalDeviceUniqueID);
  }
  else
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v17 = (void *)objc_msgSend_attitude(self, v13, v14, v15, v16);
    objc_msgSend_quaternion(v17, v18, v19, v20, v21);
    v23 = v22;
    v28 = (void *)objc_msgSend_attitude(self, v24, v25, v26, v27);
    objc_msgSend_quaternion(v28, v29, v30, v31, v32);
    v34 = v33;
    v39 = (void *)objc_msgSend_attitude(self, v35, v36, v37, v38);
    objc_msgSend_quaternion(v39, v40, v41, v42, v43);
    v45 = v44;
    v50 = (void *)objc_msgSend_attitude(self, v46, v47, v48, v49);
    objc_msgSend_quaternion(v50, v51, v52, v53, v54);
    v56 = v55;
    v64 = *(_OWORD *)&self->_rotationRate.z;
    v66 = *(_OWORD *)&self->_rotationRate.x;
    v63 = *(_OWORD *)&self->_rawAcceleration.y;
    v62 = *(_OWORD *)&self->_rawRotationRate.x;
    v57 = self->_rawRotationRate.z;
    v58 = sub_18F1FD20C(self->_machTimestamp);
    return (id)objc_msgSend_stringWithFormat_(v3, v59, (uint64_t)CFSTR("%@,Quaternion,%f,%f,%f,%f,RotationRate,%f,%f,%f, RawAcceleration,%f,%f,%f,RawRotationRate,%f,%f,%f,MachTimestamp,%f,UsingCompass,%d PhysicalDeviceUniqueID,%@"), v60, v61, v12, v23, v34, v45, v56, v66, v64, v63, v62, *(_QWORD *)&v57, *(_QWORD *)&v58, self->_usingCompass, self->_physicalDeviceUniqueID);
  }
}

- (float)tip
{
  double z;
  double v3;

  z = self->_gravity.z;
  v3 = -self->_gravity.y;
  if (fabs(z) <= 0.1)
    return asin(v3);
  else
    return atan2(v3, -z);
}

- (float)tilt
{
  double z;
  double x;

  z = self->_gravity.z;
  x = self->_gravity.x;
  if (fabs(z) <= 0.1)
    return asin(x);
  else
    return atan2(x, -z);
}

- ($1AB5FA073B851C12C2339EC22442E995)gravity
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  z = self->_gravity.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)userAcceleration
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_userAcceleration.x;
  y = self->_userAcceleration.y;
  z = self->_userAcceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (CMAttitude)attitude
{
  return self->_attitude;
}

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_rotationRate.x;
  y = self->_rotationRate.y;
  z = self->_rotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (BOOL)isUsingCompass
{
  return self->_usingCompass;
}

- (NSString)physicalDeviceUniqueID
{
  return self->_physicalDeviceUniqueID;
}

- ($1AB5FA073B851C12C2339EC22442E995)rawAcceleration
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_rawAcceleration.x;
  y = self->_rawAcceleration.y;
  z = self->_rawAcceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)rawRotationRate
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_rawRotationRate.x;
  y = self->_rawRotationRate.y;
  z = self->_rawRotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (unint64_t)machTimestamp
{
  return self->_machTimestamp;
}

- (float)gyroTemperature
{
  return self->_gyroTemperature;
}

- (float)compassTemperature
{
  return self->_compassTemperature;
}

- ($1AB5FA073B851C12C2339EC22442E995)rawMagneticField
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_rawMagneticField.x;
  y = self->_rawMagneticField.y;
  z = self->_rawMagneticField.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

@end
