@implementation CMOdometry

- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 rotationArbitraryToTrueNorth:(float)a13 staticFlag:(int64_t)a14 timestamp:(double)a15
{
  CMOdometry *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMOdometry;
  v22 = -[CMLogItem initWithTimestamp:](&v24, sel_initWithTimestamp_, a15);
  if (v22)
  {
    v22->_deltaPositionX = (NSNumber *)a3;
    v22->_deltaPositionY = (NSNumber *)a4;
    v22->_deltaPositionZ = (NSNumber *)a5;
    v22->_deltaVelocityX = (NSNumber *)a6;
    v22->_deltaVelocityY = (NSNumber *)a7;
    v22->_deltaVelocityZ = (NSNumber *)a8;
    v22->_quaternionX = (NSNumber *)a9;
    v22->_quaternionY = (NSNumber *)a10;
    v22->_quaternionZ = (NSNumber *)a11;
    v22->_quaternionW = (NSNumber *)a12;
    v22->_referenceFrame = 1;
    v22->_rotationArbitraryToTrueNorth = a13;
    v22->_staticFlag = a14;
  }
  return v22;
}

- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 timestamp:(double)a13
{
  double v13;

  v13 = a13;
  LODWORD(a13) = 0;
  return (CMOdometry *)objc_msgSend_initWithDeltaPositionX_deltaPositionY_deltaPositionZ_deltaVelocityX_deltaVelocityY_deltaVelocityZ_quaternionX_quaternionY_quaternionZ_quaternionW_rotationArbitraryToTrueNorth_staticFlag_timestamp_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a13, v13, a9, a10, a11, a12, 0);
}

- (void)rotateArbitraryToTrueNorth
{
  NSNumber *quaternionX;
  float rotationArbitraryToTrueNorth;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float32x4_t v28;
  float32x4_t v29;
  id v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSNumber *deltaPositionX;
  __int32 v59;
  __int32 v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  id v66;
  double v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  double v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSNumber *deltaVelocityX;
  __int32 v83;
  __int32 v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  id v90;
  double v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  double v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  uint64_t v105;
  float v106;

  if (self->_referenceFrame == 1)
  {
    quaternionX = self->_quaternionX;
    if (quaternionX)
    {
      if (self->_quaternionY)
      {
        if (self->_quaternionZ)
        {
          if (self->_quaternionW)
          {
            rotationArbitraryToTrueNorth = self->_rotationArbitraryToTrueNorth;
            if (rotationArbitraryToTrueNorth != 0.0)
            {
              v105 = 0;
              v106 = rotationArbitraryToTrueNorth;
              v5 = sub_18F3D3AA8(&v104, (float *)&v105);
              objc_msgSend_floatValue(quaternionX, v6, v7, v8, v9, v5);
              v11 = v10;
              objc_msgSend_floatValue(self->_quaternionY, v12, v13, v14, v15);
              v17 = v16;
              objc_msgSend_floatValue(self->_quaternionZ, v18, v19, v20, v21);
              v23 = v22;
              objc_msgSend_floatValue(self->_quaternionW, v24, v25, v26, v27);
              v103.i64[0] = __PAIR64__(v17, v11);
              v103.i64[1] = __PAIR64__(v28.u32[0], v23);
              v29 = sub_18F1FFE94(&v103, v28);
              sub_18F3D3764((uint64_t)&v103, v104.f32, &v102, v29);
              v103 = v102;

              v30 = objc_alloc(MEMORY[0x1E0CB37E8]);
              LODWORD(v31) = v103.i32[0];
              self->_quaternionX = (NSNumber *)objc_msgSend_initWithFloat_(v30, v32, v33, v34, v35, v31);
              v36 = objc_alloc(MEMORY[0x1E0CB37E8]);
              LODWORD(v37) = v103.i32[1];
              self->_quaternionY = (NSNumber *)objc_msgSend_initWithFloat_(v36, v38, v39, v40, v41, v37);
              v42 = objc_alloc(MEMORY[0x1E0CB37E8]);
              LODWORD(v43) = v103.i32[2];
              self->_quaternionZ = (NSNumber *)objc_msgSend_initWithFloat_(v42, v44, v45, v46, v47, v43);
              v48 = objc_alloc(MEMORY[0x1E0CB37E8]);
              LODWORD(v49) = v103.i32[3];
              self->_quaternionW = (NSNumber *)objc_msgSend_initWithFloat_(v48, v50, v51, v52, v53, v49);
              deltaPositionX = self->_deltaPositionX;
              if (deltaPositionX && self->_deltaPositionY)
              {
                objc_msgSend_floatValue(deltaPositionX, v54, v55, v56, v57);
                v60 = v59;
                objc_msgSend_floatValue(self->_deltaPositionY, v61, v62, v63, v64);
                v102.i32[0] = v60;
                *(uint64_t *)((char *)v102.i64 + 4) = v65;
                sub_18F3D3A2C(v104.f32, (uint64_t)&v102);

                v66 = objc_alloc(MEMORY[0x1E0CB37E8]);
                LODWORD(v67) = v102.i32[0];
                self->_deltaPositionX = (NSNumber *)objc_msgSend_initWithFloat_(v66, v68, v69, v70, v71, v67);
                v72 = objc_alloc(MEMORY[0x1E0CB37E8]);
                LODWORD(v73) = v102.i32[1];
                self->_deltaPositionY = (NSNumber *)objc_msgSend_initWithFloat_(v72, v74, v75, v76, v77, v73);
              }
              else
              {

                self->_deltaPositionX = 0;
                self->_deltaPositionY = 0;
              }
              deltaVelocityX = self->_deltaVelocityX;
              if (deltaVelocityX && self->_deltaVelocityY)
              {
                objc_msgSend_floatValue(deltaVelocityX, v78, v79, v80, v81);
                v84 = v83;
                objc_msgSend_floatValue(self->_deltaVelocityY, v85, v86, v87, v88);
                v102.i32[0] = v84;
                *(uint64_t *)((char *)v102.i64 + 4) = v89;
                sub_18F3D3A2C(v104.f32, (uint64_t)&v102);

                v90 = objc_alloc(MEMORY[0x1E0CB37E8]);
                LODWORD(v91) = v102.i32[0];
                self->_deltaVelocityX = (NSNumber *)objc_msgSend_initWithFloat_(v90, v92, v93, v94, v95, v91);
                v96 = objc_alloc(MEMORY[0x1E0CB37E8]);
                LODWORD(v97) = v102.i32[1];
                self->_deltaVelocityY = (NSNumber *)objc_msgSend_initWithFloat_(v96, v98, v99, v100, v101, v97);
              }
              else
              {

                self->_deltaVelocityX = 0;
                self->_deltaVelocityY = 0;
              }
              self->_referenceFrame = 8;
            }
          }
        }
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOdometry)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMOdometry *v7;
  const char *v8;
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
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)CMOdometry;
  v7 = -[CMLogItem initWithCoder:](&v52, sel_initWithCoder_);
  if (v7)
  {
    v7->_deltaPositionX = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v4, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaPositionX"), v5, v6);
    v7->_deltaPositionY = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v8, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaPositionY"), v9, v10);
    v7->_deltaPositionZ = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v11, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaPositionZ"), v12, v13);
    v7->_deltaVelocityX = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v14, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaVelocityX"), v15, v16);
    v7->_deltaVelocityY = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v17, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaVelocityY"), v18, v19);
    v7->_deltaVelocityZ = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v20, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaVelocityZ"), v21, v22);
    v7->_quaternionX = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v23, (uint64_t)CFSTR("kCMOdometryCodingKeyQuaternionX"), v24, v25);
    v7->_quaternionY = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v26, (uint64_t)CFSTR("kCMOdometryCodingKeyQuaternionY"), v27, v28);
    v7->_quaternionZ = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v29, (uint64_t)CFSTR("kCMOdometryCodingKeyQuaternionZ"), v30, v31);
    v7->_quaternionW = (NSNumber *)(id)objc_msgSend_decodeObjectForKey_(a3, v32, (uint64_t)CFSTR("kCMOdometryCodingKeyQuaternionW"), v33, v34);
    objc_msgSend_decodeFloatForKey_(a3, v35, (uint64_t)CFSTR("kCMOdometryCodingKeyReferenceFrame"), v36, v37);
    v7->_referenceFrame = (unint64_t)v38;
    objc_msgSend_decodeFloatForKey_(a3, v39, (uint64_t)CFSTR("kCMOdometryCodingKeyRotationArbitraryToTrueNort"), v40, v41);
    v7->_rotationArbitraryToTrueNorth = v42;
    v46 = (void *)objc_msgSend_decodeObjectForKey_(a3, v43, (uint64_t)CFSTR("kCMOdometryCodingKeyStaticFlag"), v44, v45);
    v7->_staticFlag = objc_msgSend_integerValue(v46, v47, v48, v49, v50);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
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
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)CMOdometry;
  -[CMLogItem encodeWithCoder:](&v39, sel_encodeWithCoder_);
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_deltaPositionX, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaPositionX"), v6);
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_deltaPositionY, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaPositionY"), v8);
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_deltaPositionZ, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaPositionZ"), v10);
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_deltaVelocityX, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaVelocityX"), v12);
  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)self->_deltaVelocityY, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaVelocityY"), v14);
  objc_msgSend_encodeObject_forKey_(a3, v15, (uint64_t)self->_deltaVelocityZ, (uint64_t)CFSTR("kCMOdometryCodingKeyDeltaVelocityZ"), v16);
  objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_quaternionX, (uint64_t)CFSTR("kCMOdometryCodingKeyQuaternionX"), v18);
  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)self->_quaternionY, (uint64_t)CFSTR("kCMOdometryCodingKeyQuaternionY"), v20);
  objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->_quaternionZ, (uint64_t)CFSTR("kCMOdometryCodingKeyQuaternionZ"), v22);
  objc_msgSend_encodeObject_forKey_(a3, v23, (uint64_t)self->_quaternionW, (uint64_t)CFSTR("kCMOdometryCodingKeyQuaternionW"), v24);
  *(float *)&v25 = (float)self->_referenceFrame;
  objc_msgSend_encodeFloat_forKey_(a3, v26, (uint64_t)CFSTR("kCMOdometryCodingKeyReferenceFrame"), v27, v28, v25);
  *(float *)&v29 = self->_rotationArbitraryToTrueNorth;
  objc_msgSend_encodeFloat_forKey_(a3, v30, (uint64_t)CFSTR("kCMOdometryCodingKeyRotationArbitraryToTrueNort"), v31, v32, v29);
  v36 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v33, self->_staticFlag, v34, v35);
  objc_msgSend_encodeObject_forKey_(a3, v37, v36, (uint64_t)CFSTR("kCMOdometryCodingKeyStaticFlag"), v38);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMOdometry;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)CMOdometry;
  v8 = -[CMLogItem copyWithZone:](&v37, sel_copyWithZone_);
  if (v8)
  {
    v8[3] = objc_msgSend_copyWithZone_(self->_deltaPositionX, v5, (uint64_t)a3, v6, v7);
    v8[4] = objc_msgSend_copyWithZone_(self->_deltaPositionY, v9, (uint64_t)a3, v10, v11);
    v8[5] = objc_msgSend_copyWithZone_(self->_deltaPositionZ, v12, (uint64_t)a3, v13, v14);
    v8[6] = objc_msgSend_copyWithZone_(self->_deltaVelocityX, v15, (uint64_t)a3, v16, v17);
    v8[7] = objc_msgSend_copyWithZone_(self->_deltaVelocityY, v18, (uint64_t)a3, v19, v20);
    v8[8] = objc_msgSend_copyWithZone_(self->_deltaVelocityZ, v21, (uint64_t)a3, v22, v23);
    v8[9] = objc_msgSend_copyWithZone_(self->_quaternionX, v24, (uint64_t)a3, v25, v26);
    v8[10] = objc_msgSend_copyWithZone_(self->_quaternionY, v27, (uint64_t)a3, v28, v29);
    v8[11] = objc_msgSend_copyWithZone_(self->_quaternionZ, v30, (uint64_t)a3, v31, v32);
    v8[12] = objc_msgSend_copyWithZone_(self->_quaternionW, v33, (uint64_t)a3, v34, v35);
    v8[13] = self->_referenceFrame;
    *((_DWORD *)v8 + 4) = LODWORD(self->_rotationArbitraryToTrueNorth);
    v8[14] = self->_staticFlag;
  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v13.receiver = self;
  v13.super_class = (Class)CMOdometry;
  -[CMLogItem timestamp](&v13, sel_timestamp);
  v9 = objc_msgSend_numberWithDouble_(v4, v5, v6, v7, v8);
  return (id)objc_msgSend_stringWithFormat_(v3, (const char *)self->_quaternionW, (uint64_t)CFSTR("Timestamp, %@, DeltaPositionXYZ, %@, %@, %@, DeltaVelocityXYZ, %@, %@, %@, QuaternionXYZW, %@, %@, %@, %@, ReferenceFrame, %d, StaticFlag, %d"), v10, v11, v9, self->_deltaPositionX, self->_deltaPositionY, self->_deltaPositionZ, self->_deltaVelocityX, self->_deltaVelocityY, self->_deltaVelocityZ, self->_quaternionX, self->_quaternionY, self->_quaternionZ, self->_quaternionW, self->_referenceFrame, self->_staticFlag);
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (NSNumber)deltaVelocityX
{
  return self->_deltaVelocityX;
}

- (NSNumber)deltaVelocityY
{
  return self->_deltaVelocityY;
}

- (NSNumber)deltaVelocityZ
{
  return self->_deltaVelocityZ;
}

- (NSNumber)quaternionX
{
  return self->_quaternionX;
}

- (NSNumber)quaternionY
{
  return self->_quaternionY;
}

- (NSNumber)quaternionZ
{
  return self->_quaternionZ;
}

- (NSNumber)quaternionW
{
  return self->_quaternionW;
}

- (unint64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (int64_t)staticFlag
{
  return self->_staticFlag;
}

@end
