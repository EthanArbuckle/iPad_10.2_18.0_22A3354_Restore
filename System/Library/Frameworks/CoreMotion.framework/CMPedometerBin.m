@implementation CMPedometerBin

- (int64_t)state
{
  return self->_state;
}

- (CMPedometerBin)initWithValueOut:(double)a3 begin:(double)a4 end:(double)a5 state:(int64_t)a6
{
  CMPedometerBin *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMPedometerBin;
  result = -[CMPedometerBin init](&v11, sel_init);
  if (result)
  {
    result->_valueOut = a3;
    result->_begin = a4;
    result->_end = a5;
    result->_state = a6;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMPedometerBin;
  -[CMPedometerBin dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPedometerBin)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMPedometerBin *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMPedometerBin;
  v7 = -[CMPedometerBin init](&v21, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kCMPedometerBinCodingKeyValueOut"), v5, v6);
    v7->_valueOut = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kCMPedometerBinCodingKeyBegin"), v10, v11);
    v7->_begin = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v13, (uint64_t)CFSTR("kCMPedometerBinCodingKeyEnd"), v14, v15);
    v7->_end = v16;
    v7->_state = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("kCMPedometerBinCodingKeyState"), v18, v19);
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
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kCMPedometerBinCodingKeyValueOut"), v3, v4, self->_valueOut);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kCMPedometerBinCodingKeyBegin"), v8, v9, self->_begin);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCMPedometerBinCodingKeyEnd"), v11, v12, self->_end);
  objc_msgSend_encodeInteger_forKey_(a3, v13, self->_state, (uint64_t)CFSTR("kCMPedometerBinCodingKeyState"), v14);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_begin(self, a2, v2, v3, v4);
  v8 = v7;
  objc_msgSend_end(self, v9, v10, v11, v12);
  v14 = v13;
  v19 = objc_msgSend_state(self, v15, v16, v17, v18);
  objc_msgSend_valueOut(self, v20, v21, v22, v23);
  return (id)objc_msgSend_stringWithFormat_(v6, v24, (uint64_t)CFSTR("Begin,%.4f,End,%.4f,State,%ld,ValueOut,%.4f"), v25, v26, v8, v14, v19, v27);
}

- (double)lowerQuartile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  objc_msgSend_begin(self, a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_end(self, v8, v9, v10, v11);
  v13 = v12;
  objc_msgSend_begin(self, v14, v15, v16, v17);
  return v7 + (v13 - v18) * 0.25;
}

- (double)center
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  objc_msgSend_begin(self, a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_end(self, v8, v9, v10, v11);
  v13 = v12;
  objc_msgSend_begin(self, v14, v15, v16, v17);
  return v7 + (v13 - v18) * 0.5;
}

- (double)upperQuartile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  objc_msgSend_end(self, a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_end(self, v8, v9, v10, v11);
  v13 = v12;
  objc_msgSend_begin(self, v14, v15, v16, v17);
  return v7 + (v13 - v18) * -0.25;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t state;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double valueOut;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double begin;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double end;
  double v25;

  state = self->_state;
  if (state != objc_msgSend_state(a3, a2, (uint64_t)a3, v3, v4))
    return 0;
  valueOut = self->_valueOut;
  objc_msgSend_valueOut(a3, v8, v9, v10, v11);
  if (valueOut != v17)
    return 0;
  begin = self->_begin;
  objc_msgSend_begin(a3, v13, v14, v15, v16);
  if (begin != v23)
    return 0;
  end = self->_end;
  objc_msgSend_end(a3, v19, v20, v21, v22);
  return end == v25;
}

- (double)valueOut
{
  return self->_valueOut;
}

- (double)begin
{
  return self->_begin;
}

- (double)end
{
  return self->_end;
}

@end
