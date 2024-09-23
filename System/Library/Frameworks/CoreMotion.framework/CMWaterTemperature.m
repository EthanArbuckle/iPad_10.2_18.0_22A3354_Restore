@implementation CMWaterTemperature

- (CMWaterTemperature)initWithTemperature:(id)a3 andTemperatureUncertainty:(id)a4 andDate:(id)a5
{
  CMWaterTemperature *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMWaterTemperature;
  v8 = -[CMWaterTemperature init](&v10, sel_init);
  if (v8)
  {
    v8->_temperature = (NSMeasurement *)a3;
    v8->_temperatureUncertainty = (NSMeasurement *)a4;
    v8->_date = (NSDate *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWaterTemperature;
  -[CMWaterTemperature dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  uint64_t v24;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_temperature(self, v10, v11, v12, v13);
  v19 = objc_msgSend_temperatureUncertainty(self, v15, v16, v17, v18);
  v24 = objc_msgSend_date(self, v20, v21, v22, v23);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithTemperature_andTemperatureUncertainty_andDate_, v14, v19, v24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWaterTemperature)initWithCoder:(id)a3
{
  CMWaterTemperature *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMWaterTemperature;
  v4 = -[CMWaterTemperature init](&v15, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_temperature = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMWaterTemperature"), v7);
    v8 = objc_opt_class();
    v4->_temperatureUncertainty = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMWaterTemperatureUncertainty"), v10);
    v11 = objc_opt_class();
    v4->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMWTemperatureUpdateDate"), v13);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  v7 = objc_msgSend_temperature(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_encodeObject_forKey_(a3, v8, v7, (uint64_t)CFSTR("kCMWaterTemperature"), v9);
  v14 = objc_msgSend_temperatureUncertainty(self, v10, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMWaterTemperatureUncertainty"), v16);
  v21 = objc_msgSend_date(self, v17, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(a3, v22, v21, (uint64_t)CFSTR("kCMWTemperatureUpdateDate"), v23);
}

- (id)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
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
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  v3 = (id)objc_opt_new();
  objc_msgSend_setUnitOptions_(v3, v4, 1, v5, v6);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_msgSend_temperature(self, v8, v9, v10, v11);
  v16 = objc_msgSend_stringFromMeasurement_(v3, v13, v12, v14, v15);
  v21 = objc_msgSend_temperatureUncertainty(self, v17, v18, v19, v20);
  v25 = objc_msgSend_stringFromMeasurement_(v3, v22, v21, v23, v24);
  v30 = objc_msgSend_date(self, v26, v27, v28, v29);
  return (id)objc_msgSend_stringWithFormat_(v7, v31, (uint64_t)CFSTR("CMWaterTemperature (temperature:%@, temperatureUncertainty:%@, date:%@)"), v32, v33, v16, v25, v30);
}

- (NSDate)date
{
  return self->_date;
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (NSMeasurement)temperatureUncertainty
{
  return self->_temperatureUncertainty;
}

@end
