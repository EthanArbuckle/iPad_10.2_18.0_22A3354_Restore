@implementation CLBackgroundInertialOdometrySample

- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 machContinuousTimestamp:(double)a4 sampleInterval:(double)a5 deltaPosition:(id)a6 deltaVelocity:(id)a7 quaternion:(id)a8 referenceFrameContinuity:(unint64_t)a9 referenceFrame:(unint64_t)a10 staticFlag:(unint64_t)a11
{
  CLBackgroundInertialOdometrySample *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CLBackgroundInertialOdometrySample;
  v19 = -[CLBackgroundInertialOdometrySample init](&v21, sel_init);
  if (v19)
  {
    v19->_cfAbsTimestamp = (NSDate *)a3;
    v19->_machContinuousTimestamp_s = a4;
    v19->_sampleInterval_s = a5;
    v19->_deltaPosition_m = (CLBIO_DeltaPosition *)a6;
    v19->_deltaVelocity_mps = (CLBIO_DeltaVelocity *)a7;
    v19->_quaternion = (CLBIO_Quaternion *)a8;
    v19->_referenceFrameContinuity = a9;
    v19->_sessionReferenceFrame = a10;
    v19->_staticFlag = a11;
  }
  return v19;
}

- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 machContinuousTimestamp:(double)a4 sampleInterval:(double)a5 deltaPosition:(id)a6 deltaVelocity:(id)a7 quaternion:(id)a8
{
  return (CLBackgroundInertialOdometrySample *)objc_msgSend_initWithTimestamp_machContinuousTimestamp_sampleInterval_deltaPosition_deltaVelocity_quaternion_referenceFrameContinuity_referenceFrame_staticFlag_(self, a2, (uint64_t)a3, (uint64_t)a6, a7, a8, 0, 1, a4, a5, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_cfAbsTimestamp(self, v9, v10, v11);
  objc_msgSend_machContinuousTimestamp_s(self, v13, v14, v15);
  v17 = v16;
  objc_msgSend_sampleInterval_s(self, v18, v19, v20);
  v22 = v21;
  v26 = objc_msgSend_deltaPosition_m(self, v23, v24, v25);
  v30 = objc_msgSend_deltaVelocity_mps(self, v27, v28, v29);
  v34 = objc_msgSend_quaternion(self, v31, v32, v33);
  v38 = objc_msgSend_referenceFrameContinuity(self, v35, v36, v37);
  v42 = objc_msgSend_sessionReferenceFrame(self, v39, v40, v41);
  v46 = objc_msgSend_staticFlag(self, v43, v44, v45);
  return (id)objc_msgSend_initWithTimestamp_machContinuousTimestamp_sampleInterval_deltaPosition_deltaVelocity_quaternion_referenceFrameContinuity_referenceFrame_staticFlag_(v8, v47, v12, v26, v30, v34, v38, v42, v17, v22, v46);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBackgroundInertialOdometrySample;
  -[CLBackgroundInertialOdometrySample dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
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
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = (void *)objc_msgSend_cfAbsTimestamp(self, v6, v7, v8);
  objc_msgSend_timeIntervalSinceReferenceDate(v9, v10, v11, v12);
  v129 = v13;
  objc_msgSend_machContinuousTimestamp_s(self, v14, v15, v16);
  v128 = v17;
  objc_msgSend_sampleInterval_s(self, v18, v19, v20);
  v127 = v21;
  v25 = (void *)objc_msgSend_deltaPosition_m(self, v22, v23, v24);
  objc_msgSend_X(v25, v26, v27, v28);
  v126 = v29;
  v33 = (void *)objc_msgSend_deltaPosition_m(self, v30, v31, v32);
  objc_msgSend_Y(v33, v34, v35, v36);
  v125 = v37;
  v41 = (void *)objc_msgSend_deltaPosition_m(self, v38, v39, v40);
  objc_msgSend_Z(v41, v42, v43, v44);
  v46 = v45;
  v50 = (void *)objc_msgSend_deltaVelocity_mps(self, v47, v48, v49);
  objc_msgSend_X(v50, v51, v52, v53);
  v55 = v54;
  v59 = (void *)objc_msgSend_deltaVelocity_mps(self, v56, v57, v58);
  objc_msgSend_Y(v59, v60, v61, v62);
  v64 = v63;
  v68 = (void *)objc_msgSend_deltaVelocity_mps(self, v65, v66, v67);
  objc_msgSend_Z(v68, v69, v70, v71);
  v73 = v72;
  v77 = (void *)objc_msgSend_quaternion(self, v74, v75, v76);
  objc_msgSend_X(v77, v78, v79, v80);
  v82 = v81;
  v86 = (void *)objc_msgSend_quaternion(self, v83, v84, v85);
  objc_msgSend_Y(v86, v87, v88, v89);
  v91 = v90;
  v95 = (void *)objc_msgSend_quaternion(self, v92, v93, v94);
  objc_msgSend_Z(v95, v96, v97, v98);
  v100 = v99;
  v104 = (void *)objc_msgSend_quaternion(self, v101, v102, v103);
  objc_msgSend_W(v104, v105, v106, v107);
  v109 = v108;
  v113 = objc_msgSend_referenceFrameContinuity(self, v110, v111, v112);
  v117 = objc_msgSend_sessionReferenceFrame(self, v114, v115, v116);
  v121 = objc_msgSend_staticFlag(self, v118, v119, v120);
  return (id)objc_msgSend_stringWithFormat_(v3, v122, (uint64_t)CFSTR("%@,cfAbsTimestamp, %.3f, machContinuousTimestamp_s, %.3f, sampleInterval_s, %.3f, deltaPosition_m.X, %.3f, deltaPosition_m.Y, %.3f, deltaPosition_m.Z, %.3f, deltaVelocity_mps.X, %.3f, deltaVelocity_mps.Y, %.3f, deltaVelocity_mps.Z, %.3f, quaternion.X, %.3f, quaternion.Y, %.3f, quaternion.Z, %.3f, quaternion.W, %.3f, referenceFrameContinuity, %zu, sessionReferenceFrame, %zu, staticFlag, %zu"), v123, v5, v129, v128, v127, v126, v125, v46, v55, v64, v73, v82, v91, v100, v109, v113,
               v117,
               v121);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;

  v6 = objc_msgSend_cfAbsTimestamp(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("timestamp"));
  objc_msgSend_machContinuousTimestamp_s(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("machContinuousTimestamp"), v12);
  objc_msgSend_sampleInterval_s(self, v13, v14, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("sampleInterval"), v17);
  v21 = objc_msgSend_deltaPosition_m(self, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(a3, v22, v21, (uint64_t)CFSTR("deltaPosition"));
  v26 = objc_msgSend_deltaVelocity_mps(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(a3, v27, v26, (uint64_t)CFSTR("deltaVelocity"));
  v31 = objc_msgSend_quaternion(self, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(a3, v32, v31, (uint64_t)CFSTR("quaternion"));
  v36 = objc_msgSend_referenceFrameContinuity(self, v33, v34, v35) != 0;
  objc_msgSend_encodeBool_forKey_(a3, v37, v36, (uint64_t)CFSTR("referenceFrameContinuity"));
  v41 = objc_msgSend_sessionReferenceFrame(self, v38, v39, v40);
  objc_msgSend_encodeInteger_forKey_(a3, v42, v41, (uint64_t)CFSTR("referenceFrame"));
  v46 = objc_msgSend_staticFlag(self, v43, v44, v45);
  objc_msgSend_encodeInteger_forKey_(a3, v47, v46, (uint64_t)CFSTR("staticFlag"));
}

- (CLBackgroundInertialOdometrySample)initWithCoder:(id)a3
{
  CLBackgroundInertialOdometrySample *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CLBackgroundInertialOdometrySample;
  v4 = -[CLBackgroundInertialOdometrySample init](&v26, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_cfAbsTimestamp = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("timestamp"));
    objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("machContinuousTimestamp"), v8);
    v4->_machContinuousTimestamp_s = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("sampleInterval"), v11);
    v4->_sampleInterval_s = v12;
    v13 = objc_opt_class();
    v4->_deltaPosition_m = (CLBIO_DeltaPosition *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("deltaPosition"));
    v15 = objc_opt_class();
    v4->_deltaVelocity_mps = (CLBIO_DeltaVelocity *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("deltaVelocity"));
    v17 = objc_opt_class();
    v4->_quaternion = (CLBIO_Quaternion *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("quaternion"));
    v4->_referenceFrameContinuity = objc_msgSend_decodeBoolForKey_(a3, v19, (uint64_t)CFSTR("referenceFrameContinuity"), v20);
    v4->_sessionReferenceFrame = objc_msgSend_decodeIntegerForKey_(a3, v21, (uint64_t)CFSTR("referenceFrame"), v22);
    v4->_staticFlag = objc_msgSend_decodeIntegerForKey_(a3, v23, (uint64_t)CFSTR("staticFlag"), v24);
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  const char *v6;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  BOOL result;
  char v96;
  int isEqual;
  int isMemberOfClass;

  v5 = objc_opt_class();
  isMemberOfClass = objc_msgSend_isMemberOfClass_(a3, v6, v5, v7);
  v11 = (void *)objc_msgSend_cfAbsTimestamp(self, v8, v9, v10);
  v15 = objc_msgSend_cfAbsTimestamp(a3, v12, v13, v14);
  isEqual = objc_msgSend_isEqual_(v11, v16, v15, v17);
  objc_msgSend_machContinuousTimestamp_s(self, v18, v19, v20);
  v22 = v21;
  objc_msgSend_machContinuousTimestamp_s(a3, v23, v24, v25);
  v27 = v26;
  objc_msgSend_sampleInterval_s(self, v28, v29, v30);
  v32 = v31;
  objc_msgSend_sampleInterval_s(a3, v33, v34, v35);
  v37 = v36;
  if (objc_msgSend_deltaPosition_m(self, v38, v39, v40) || objc_msgSend_deltaPosition_m(a3, v41, v42, v43))
  {
    v44 = (void *)objc_msgSend_deltaPosition_m(self, v41, v42, v43);
    v48 = objc_msgSend_deltaPosition_m(a3, v45, v46, v47);
    v96 = objc_msgSend_isEqual_(v44, v49, v48, v50) ^ 1;
  }
  else
  {
    v96 = 0;
  }
  if (objc_msgSend_deltaVelocity_mps(self, v41, v42, v43) || objc_msgSend_deltaVelocity_mps(a3, v51, v52, v53))
  {
    v54 = (void *)objc_msgSend_deltaVelocity_mps(self, v51, v52, v53);
    v58 = objc_msgSend_deltaVelocity_mps(a3, v55, v56, v57);
    v61 = objc_msgSend_isEqual_(v54, v59, v58, v60) ^ 1;
  }
  else
  {
    LOBYTE(v61) = 0;
  }
  if (objc_msgSend_quaternion(self, v51, v52, v53) || objc_msgSend_quaternion(a3, v62, v63, v64))
  {
    v65 = (void *)objc_msgSend_quaternion(self, v62, v63, v64);
    v69 = objc_msgSend_quaternion(a3, v66, v67, v68);
    v72 = objc_msgSend_isEqual_(v65, v70, v69, v71) ^ 1;
  }
  else
  {
    v72 = 0;
  }
  v73 = objc_msgSend_referenceFrameContinuity(self, v62, v63, v64);
  v77 = objc_msgSend_referenceFrameContinuity(a3, v74, v75, v76);
  v81 = objc_msgSend_sessionReferenceFrame(self, v78, v79, v80);
  v85 = objc_msgSend_sessionReferenceFrame(a3, v82, v83, v84);
  v89 = objc_msgSend_staticFlag(self, v86, v87, v88);
  v93 = objc_msgSend_staticFlag(a3, v90, v91, v92);
  result = 0;
  if (!((v22 != v27 || (isMemberOfClass & isEqual & 1) == 0) | (v32 != v37) | v96 & 1 | v61 & 1)
    && (v72 & 1) == 0
    && v73 == v77)
  {
    return v81 == v85 && v89 == v93;
  }
  return result;
}

- (NSDate)cfAbsTimestamp
{
  return self->_cfAbsTimestamp;
}

- (double)machContinuousTimestamp_s
{
  return self->_machContinuousTimestamp_s;
}

- (double)sampleInterval_s
{
  return self->_sampleInterval_s;
}

- (CLBIO_DeltaPosition)deltaPosition_m
{
  return self->_deltaPosition_m;
}

- (CLBIO_DeltaVelocity)deltaVelocity_mps
{
  return self->_deltaVelocity_mps;
}

- (CLBIO_Quaternion)quaternion
{
  return self->_quaternion;
}

- (unint64_t)referenceFrameContinuity
{
  return self->_referenceFrameContinuity;
}

- (unint64_t)sessionReferenceFrame
{
  return self->_sessionReferenceFrame;
}

- (unint64_t)staticFlag
{
  return self->_staticFlag;
}

@end
