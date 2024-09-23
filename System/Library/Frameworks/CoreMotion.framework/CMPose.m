@implementation CMPose

- (CMPose)initWithPose:(id *)a3 timestamp:(double)a4
{
  CMPose *v5;
  CMPoseInternal *v6;
  __int128 v7;
  __int128 v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CMPose;
  v5 = -[CMLogItem initWithTimestamp:](&v14, sel_initWithTimestamp_, a4);
  if (v5)
  {
    v6 = [CMPoseInternal alloc];
    v7 = *(_OWORD *)&a3->var1.var2;
    v13[2] = *(_OWORD *)&a3->var1.var0;
    v13[3] = v7;
    v13[4] = *(_OWORD *)&a3->var3;
    v8 = *(_OWORD *)&a3->var0.var2;
    v13[0] = *(_OWORD *)&a3->var0.var0;
    v13[1] = v8;
    v5->_internal = (id)objc_msgSend_initWithPose_(v6, v9, (uint64_t)v13, v10, v11);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPose)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMPose *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  CMPoseInternal *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[10];
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)CMPose;
  v7 = -[CMLogItem initWithCoder:](&v61, sel_initWithCoder_);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kCMPoseCodingKeyQuaternionW"), v5, v6);
    v59 = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kCMPoseCodingKeyQuaternionX"), v10, v11);
    v58 = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v13, (uint64_t)CFSTR("kCMPoseCodingKeyQuaternionY"), v14, v15);
    v17 = v16;
    objc_msgSend_decodeDoubleForKey_(a3, v18, (uint64_t)CFSTR("kCMPoseCodingKeyQuaternionZ"), v19, v20);
    v22 = v21;
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("kCMPoseCodingKeyTranslationX"), v24, v25);
    v27 = v26;
    objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("kCMPoseCodingKeyTranslationY"), v29, v30);
    v32 = v31;
    objc_msgSend_decodeDoubleForKey_(a3, v33, (uint64_t)CFSTR("kCMPoseCodingKeyTranslationZ"), v34, v35);
    v37 = v36;
    objc_msgSend_decodeDoubleForKey_(a3, v38, (uint64_t)CFSTR("kCMPoseCodingKeyConsumedAuxTimestamp"), v39, v40);
    v42 = v41;
    objc_msgSend_decodeDoubleForKey_(a3, v43, (uint64_t)CFSTR("kCMPoseCodingKeyReceivedAuxTimestamp"), v44, v45);
    v47 = v46;
    objc_msgSend_decodeDoubleForKey_(a3, v48, (uint64_t)CFSTR("kCMPoseCodingKeyMachAbsTimestamp"), v49, v50);
    v52 = v51;
    v53 = [CMPoseInternal alloc];
    v60[0] = v59;
    v60[1] = v58;
    v60[2] = v17;
    v60[3] = v22;
    v60[4] = v27;
    v60[5] = v32;
    v60[6] = v37;
    v60[7] = v42;
    v60[8] = v47;
    v60[9] = v52;
    v7->_internal = (id)objc_msgSend_initWithPose_(v53, v54, (uint64_t)v60, v55, v56);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void **internal;
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
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)CMPose;
  -[CMLogItem encodeWithCoder:](&v46, sel_encodeWithCoder_);
  internal = (void **)self->_internal;
  objc_msgSend_quaternion(internal[1], v6, v7, v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("kCMPoseCodingKeyQuaternionX"), v17, v18);
  objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("kCMPoseCodingKeyQuaternionY"), v20, v21, v11);
  objc_msgSend_encodeDouble_forKey_(a3, v22, (uint64_t)CFSTR("kCMPoseCodingKeyQuaternionZ"), v23, v24, v13);
  objc_msgSend_encodeDouble_forKey_(a3, v25, (uint64_t)CFSTR("kCMPoseCodingKeyQuaternionW"), v26, v27, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v28, (uint64_t)CFSTR("kCMPoseCodingKeyTranslationX"), v29, v30, *((double *)internal + 2));
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("kCMPoseCodingKeyTranslationY"), v32, v33, *((double *)internal + 3));
  objc_msgSend_encodeDouble_forKey_(a3, v34, (uint64_t)CFSTR("kCMPoseCodingKeyTranslationZ"), v35, v36, *((double *)internal + 4));
  objc_msgSend_encodeDouble_forKey_(a3, v37, (uint64_t)CFSTR("kCMPoseCodingKeyConsumedAuxTimestamp"), v38, v39, *((double *)internal + 5));
  objc_msgSend_encodeDouble_forKey_(a3, v40, (uint64_t)CFSTR("kCMPoseCodingKeyReceivedAuxTimestamp"), v41, v42, *((double *)internal + 6));
  objc_msgSend_encodeDouble_forKey_(a3, v43, (uint64_t)CFSTR("kCMPoseCodingKeyMachAbsTimestamp"), v44, v45, *((double *)internal + 7));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMPose;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMPose;
  v8 = -[CMLogItem copyWithZone:](&v10, sel_copyWithZone_);
  if (v8)
    v8[2] = objc_msgSend_copyWithZone_(self->_internal, v5, (uint64_t)a3, v6, v7);
  return v8;
}

- (BOOL)isEqualToPose:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  if (a3
    && (objc_msgSend_timestamp(self, a2, (uint64_t)a3, v3, v4),
        v8 = v7,
        objc_msgSend_timestamp(a3, v9, v10, v11, v12),
        v8 == v16))
  {
    return objc_msgSend_isEqual_(self->_internal, v13, *((_QWORD *)a3 + 2), v14, v15);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return MEMORY[0x1E0DE7D20](self, sel_isEqualToPose_, a3, v5, v6);
  else
    return 0;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **internal;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  objc_super v37;

  internal = (void **)self->_internal;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_quaternion(internal[1], a2, v2, v3, v4);
  v9 = v8;
  objc_msgSend_quaternion(internal[1], v10, v11, v12, v13);
  v15 = v14;
  objc_msgSend_quaternion(internal[1], v16, v17, v18, v19);
  v21 = v20;
  objc_msgSend_quaternion(internal[1], v22, v23, v24, v25);
  v27 = v26;
  v35 = *((_OWORD *)internal + 2);
  v36 = *((_OWORD *)internal + 1);
  v28 = internal[6];
  v29 = internal[7];
  v37.receiver = self;
  v37.super_class = (Class)CMPose;
  -[CMLogItem timestamp](&v37, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v7, v30, (uint64_t)CFSTR("CMPose,q.x,%f,q.y,%f,q.z,%f,q.w,%f,translation.x,%f,translation.y,%f,translation.z,%f,consumedAuxTimestamp,%f,receivedAuxTimestamp,%f,machAbsTimestamp,%f,timestamp,%f"), v31, v32, v9, v15, v21, v27, v36, v35, v28, v29, v33);
}

- (CMAttitude)attitude
{
  return (CMAttitude *)*((_QWORD *)self->_internal + 1);
}

- ($1AB5FA073B851C12C2339EC22442E995)translation
{
  double *internal;
  double v3;
  double v4;
  double v5;
  $1AB5FA073B851C12C2339EC22442E995 result;

  internal = (double *)self->_internal;
  v3 = internal[2];
  v4 = internal[3];
  v5 = internal[4];
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (double)consumedAuxTimestamp
{
  return *((double *)self->_internal + 5);
}

- (double)receivedAuxTimestamp
{
  return *((double *)self->_internal + 6);
}

- (double)machAbsTimestamp
{
  return *((double *)self->_internal + 7);
}

@end
