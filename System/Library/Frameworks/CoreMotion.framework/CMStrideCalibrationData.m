@implementation CMStrideCalibrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMStrideCalibrationData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMStrideCalibrationData *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMStrideCalibrationData;
  v7 = -[CMStrideCalibrationData init](&v21, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kCMStrideCalibrationDataCodingKeyBegin"), v5, v6);
    v7->_begin = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kCMStrideCalibrationDataCodingKeyEnd"), v10, v11);
    v7->_end = v12;
    v7->_state = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("kCMStrideCalibrationDataCodingKeyState"), v14, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMStrideCalibrationDataCodingKeyKValue"), v17, v18);
    v7->_kValue = v19;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kCMStrideCalibrationDataCodingKeyBegin"), v3, v4, self->_begin);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kCMStrideCalibrationDataCodingKeyEnd"), v8, v9, self->_end);
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_state, (uint64_t)CFSTR("kCMStrideCalibrationDataCodingKeyState"), v11);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCMStrideCalibrationDataCodingKeyKValue"), v13, v14, self->_kValue);
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
  id result;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  result = (id)objc_msgSend_init(v9, v10, v11, v12, v13);
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_begin;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_end;
  *((_QWORD *)result + 1) = self->_state;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_kValue;
  return result;
}

- (CMStrideCalibrationData)initWithBegin:(double)a3 end:(double)a4 state:(int64_t)a5 kValue:(double)a6
{
  CMStrideCalibrationData *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMStrideCalibrationData;
  result = -[CMStrideCalibrationData init](&v11, sel_init);
  if (result)
  {
    result->_begin = a3;
    result->_end = a4;
    result->_state = a5;
    result->_kValue = a6;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
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
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v48[4];
  _QWORD v49[5];

  v49[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v48[0] = CFSTR("begin");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_begin(self, v7, v8, v9, v10);
  v49[0] = objc_msgSend_numberWithDouble_(v6, v11, v12, v13, v14);
  v48[1] = CFSTR("end");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_end(self, v16, v17, v18, v19);
  v49[1] = objc_msgSend_numberWithDouble_(v15, v20, v21, v22, v23);
  v48[2] = CFSTR("state");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  v29 = objc_msgSend_state(self, v25, v26, v27, v28);
  v49[2] = objc_msgSend_numberWithInteger_(v24, v30, v29, v31, v32);
  v48[3] = CFSTR("kValue");
  v33 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_kValue(self, v34, v35, v36, v37);
  v49[3] = objc_msgSend_numberWithDouble_(v33, v38, v39, v40, v41);
  v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v42, (uint64_t)v49, (uint64_t)v48, 4);
  return (id)objc_msgSend_stringWithFormat_(v3, v44, (uint64_t)CFSTR("%@,%@"), v45, v46, v5, v43);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)kValue
{
  return self->_kValue;
}

- (void)setKValue:(double)a3
{
  self->_kValue = a3;
}

- (double)begin
{
  return self->_begin;
}

- (void)setBegin:(double)a3
{
  self->_begin = a3;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

@end
