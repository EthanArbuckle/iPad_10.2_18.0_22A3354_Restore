@implementation CMAmbientPressureData

- (CMAmbientPressureData)initWithPressure:(id)a3 andTimestamp:(double)a4
{
  float var1;
  float var0;
  CMAmbientPressureData *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  var1 = a3.var1;
  var0 = a3.var0;
  v26.receiver = self;
  v26.super_class = (Class)CMAmbientPressureData;
  v6 = -[CMLogItem initWithTimestamp:](&v26, sel_initWithTimestamp_, a4);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3758]);
    v12 = objc_msgSend_kilopascals(MEMORY[0x1E0CB3AF0], v8, v9, v10, v11);
    v6->_pressure = (NSMeasurement *)objc_msgSend_initWithDoubleValue_unit_(v7, v13, v12, v14, v15, var0);
    v16 = objc_alloc(MEMORY[0x1E0CB3758]);
    v21 = objc_msgSend_celsius(MEMORY[0x1E0CB3B00], v17, v18, v19, v20);
    v6->_temperature = (NSMeasurement *)objc_msgSend_initWithDoubleValue_unit_(v16, v22, v21, v23, v24, var1);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMAmbientPressureData)initWithCoder:(id)a3
{
  CMAmbientPressureData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMAmbientPressureData;
  v4 = -[CMLogItem initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_pressure = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMAmbientPressureCodingKeyPressure"), v7);
    v8 = objc_opt_class();
    v4->_temperature = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMAmbientPressureCodingKeyTemperature"), v10);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CMAmbientPressureData;
  -[CMLogItem encodeWithCoder:](&v19, sel_encodeWithCoder_);
  v9 = objc_msgSend_pressure(self, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(a3, v10, v9, (uint64_t)CFSTR("kCMAmbientPressureCodingKeyPressure"), v11);
  v16 = objc_msgSend_temperature(self, v12, v13, v14, v15);
  objc_msgSend_encodeObject_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMAmbientPressureCodingKeyTemperature"), v18);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMAmbientPressureData;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CMAmbientPressureData;
  v9 = -[CMLogItem copyWithZone:](&v23, sel_copyWithZone_);
  if (v9)
  {
    v10 = (void *)objc_msgSend_pressure(self, v5, v6, v7, v8);
    v9[2] = objc_msgSend_copyWithZone_(v10, v11, (uint64_t)a3, v12, v13);
    v18 = (void *)objc_msgSend_temperature(self, v14, v15, v16, v17);
    v9[3] = objc_msgSend_copyWithZone_(v18, v19, (uint64_t)a3, v20, v21);
  }
  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  const char *v5;
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
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v3 = (id)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_msgSend_pressure(self, v5, v6, v7, v8);
  v13 = objc_msgSend_stringFromMeasurement_(v3, v10, v9, v11, v12);
  v18 = objc_msgSend_temperature(self, v14, v15, v16, v17);
  v22 = objc_msgSend_stringFromMeasurement_(v3, v19, v18, v20, v21);
  v28.receiver = self;
  v28.super_class = (Class)CMAmbientPressureData;
  -[CMLogItem timestamp](&v28, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v4, v23, (uint64_t)CFSTR("Pressure %@ Temperature %@ @ %f"), v24, v25, v13, v22, v26);
}

- (NSMeasurement)pressure
{
  return self->_pressure;
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  int64_t result;
  uint64_t v31;

  v7 = (void *)objc_msgSend_pressure(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_doubleValue(v7, v8, v9, v10, v11);
  v13 = v12;
  v18 = (void *)objc_msgSend_temperature(self, v14, v15, v16, v17);
  objc_msgSend_doubleValue(v18, v19, v20, v21, v22);
  v24 = v23;
  objc_msgSend_timestamp(self, v25, v26, v27, v28);
  LODWORD(result) = snprintf_l(byte_1EE16E734, 0x62uLL, 0, "{\"pressure\": %0.*g, \"temperature\": %0.*g, \"timestamp\": %ld}", 9, v13, 9, v24, (uint64_t)v29);
  if ((int)result <= 0)
    return (int)result;
  else
    return MEMORY[0x1E0DE7D20](a3, sel_write_maxLength_, byte_1EE16E734, result, v31);
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

@end
