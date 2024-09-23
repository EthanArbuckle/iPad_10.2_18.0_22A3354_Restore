@implementation CMWaterSubmersionMeasurement

- (CMWaterSubmersionMeasurement)initWithDepth:(id)a3 andPressure:(id)a4 andSurfacePressure:(id)a5 andState:(int64_t)a6 andDate:(id)a7
{
  CMWaterSubmersionMeasurement *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CMWaterSubmersionMeasurement;
  v12 = -[CMWaterSubmersionMeasurement init](&v14, sel_init);
  if (v12)
  {
    v12->_depth = (NSMeasurement *)a3;
    v12->_pressure = (NSMeasurement *)a4;
    v12->_surfacePressure = (NSMeasurement *)a5;
    v12->_submersionState = a6;
    v12->_date = (NSDate *)a7;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWaterSubmersionMeasurement;
  -[CMWaterSubmersionMeasurement dealloc](&v3, sel_dealloc);
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_depth(self, v10, v11, v12, v13);
  v19 = objc_msgSend_pressure(self, v15, v16, v17, v18);
  v24 = objc_msgSend_surfacePressure(self, v20, v21, v22, v23);
  objc_msgSend_submersionState(self, v25, v26, v27, v28);
  objc_msgSend_date(self, v29, v30, v31, v32);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithDepth_andPressure_andSurfacePressure_andState_andDate_, v14, v19, v24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWaterSubmersionMeasurement)initWithCoder:(id)a3
{
  CMWaterSubmersionMeasurement *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMWaterSubmersionMeasurement;
  v4 = -[CMWaterSubmersionMeasurement init](&v21, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_depth = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdateDepth"), v7);
    v8 = objc_opt_class();
    v4->_pressure = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdatePressure"), v10);
    v11 = objc_opt_class();
    v4->_surfacePressure = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdateSurfacePressure"), v13);
    v4->_submersionState = (int)objc_msgSend_decodeIntForKey_(a3, v14, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdateState"), v15, v16);
    v17 = objc_opt_class();
    v4->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdateDate"), v19);
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;

  v7 = objc_msgSend_depth(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_encodeObject_forKey_(a3, v8, v7, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdateDepth"), v9);
  v14 = objc_msgSend_pressure(self, v10, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdatePressure"), v16);
  v21 = objc_msgSend_surfacePressure(self, v17, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(a3, v22, v21, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdateSurfacePressure"), v23);
  v28 = objc_msgSend_submersionState(self, v24, v25, v26, v27);
  objc_msgSend_encodeInteger_forKey_(a3, v29, v28, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdateState"), v30);
  v35 = objc_msgSend_date(self, v31, v32, v33, v34);
  objc_msgSend_encodeObject_forKey_(a3, v36, v35, (uint64_t)CFSTR("kCMWaterSubmersionMeasurementUpdateDate"), v37);
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
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;

  v3 = (id)objc_opt_new();
  objc_msgSend_setUnitOptions_(v3, v4, 1, v5, v6);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_msgSend_depth(self, v8, v9, v10, v11);
  v16 = objc_msgSend_stringFromMeasurement_(v3, v13, v12, v14, v15);
  v21 = objc_msgSend_pressure(self, v17, v18, v19, v20);
  v25 = objc_msgSend_stringFromMeasurement_(v3, v22, v21, v23, v24);
  v30 = objc_msgSend_surfacePressure(self, v26, v27, v28, v29);
  v34 = objc_msgSend_stringFromMeasurement_(v3, v31, v30, v32, v33);
  v39 = objc_msgSend_submersionState(self, v35, v36, v37, v38);
  v44 = objc_msgSend_date(self, v40, v41, v42, v43);
  return (id)objc_msgSend_stringWithFormat_(v7, v45, (uint64_t)CFSTR("CMWaterSubmersionMeasurement (depth:%@, pressure:%@, surfacePressure:%@, state:%d, date:%@)"), v46, v47, v16, v25, v34, v39, v44);
}

- (NSDate)date
{
  return self->_date;
}

- (NSMeasurement)depth
{
  return self->_depth;
}

- (NSMeasurement)pressure
{
  return self->_pressure;
}

- (NSMeasurement)surfacePressure
{
  return self->_surfacePressure;
}

- (CMWaterSubmersionDepthState)submersionState
{
  return self->_submersionState;
}

@end
