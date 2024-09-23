@implementation CLTripSegmentInertialData

- (CLTripSegmentInertialData)initWithTime:(id)a3 dataPeriodSec:(double)a4 deltaCourseRad:(double)a5 deltaSpeedMps:(double)a6 deltaCourseVarRad2:(double)a7 deltaSpeedVarMps2:(double)a8 deltaCourseSpeedCovarRadMps:(double)a9
{
  CLTripSegmentInertialData *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLTripSegmentInertialData;
  v16 = -[CLTripSegmentInertialData init](&v18, sel_init);
  if (v16)
  {
    v16->_timestamp = (NSDate *)a3;
    v16->_dataPeriod_s = a4;
    v16->_deltaCourse_rad = a5;
    v16->_deltaSpeed_mps = a6;
    v16->_deltaCourseVar_rad2 = a7;
    v16->_deltaSpeedVar_mps2 = a8;
    v16->_deltaCourseSpeedCovar_radmps = a9;
  }
  return v16;
}

- (BOOL)isValid
{
  return self->_timestamp
      && self->_dataPeriod_s > 0.0
      && self->_deltaCourseVar_rad2 > 0.0
      && self->_deltaSpeedVar_mps2 > 0.0;
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
  double v43;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_timestamp(self, v9, v10, v11);
  objc_msgSend_dataPeriod_s(self, v13, v14, v15);
  v17 = v16;
  objc_msgSend_deltaCourse_rad(self, v18, v19, v20);
  v22 = v21;
  objc_msgSend_deltaSpeed_mps(self, v23, v24, v25);
  v27 = v26;
  objc_msgSend_deltaSpeedVar_mps2(self, v28, v29, v30);
  v32 = v31;
  objc_msgSend_deltaSpeedVar_mps2(self, v33, v34, v35);
  v37 = v36;
  objc_msgSend_deltaCourseSpeedCovar_radmps(self, v38, v39, v40);
  return (id)objc_msgSend_initWithTime_dataPeriodSec_deltaCourseRad_deltaSpeedMps_deltaCourseVarRad2_deltaSpeedVarMps2_deltaCourseSpeedCovarRadMps_(v8, v41, v12, v42, v17, v22, v27, v32, v37, v43);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentInertialData;
  -[CLTripSegmentInertialData dealloc](&v3, sel_dealloc);
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
  uint64_t v29;
  const char *v30;
  uint64_t v31;
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = (void *)objc_msgSend_timestamp(self, v6, v7, v8);
  objc_msgSend_timeIntervalSinceReferenceDate(v9, v10, v11, v12);
  v14 = v13;
  objc_msgSend_dataPeriod_s(self, v15, v16, v17);
  v19 = v18;
  objc_msgSend_deltaCourse_rad(self, v20, v21, v22);
  v24 = v23;
  objc_msgSend_deltaSpeed_mps(self, v25, v26, v27);
  v29 = v28;
  objc_msgSend_deltaCourseVar_rad2(self, v30, v31, v32);
  v34 = v33;
  objc_msgSend_deltaSpeedVar_mps2(self, v35, v36, v37);
  v39 = v38;
  objc_msgSend_deltaCourseSpeedCovar_radmps(self, v40, v41, v42);
  return (id)objc_msgSend_stringWithFormat_(v3, v43, (uint64_t)CFSTR("%@,timestamp,%.2f,dataperiod,%.2f,deltaCourse,%.6f,deltaSpeed,%.4f,courseVar,%.6f,speedVar,%.6lf,courseSpeedCovar,%.6lf"), v44, v5, v14, v19, v24, v29, v34, v39, v45);
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
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;

  v6 = objc_msgSend_timestamp(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("timestamp"));
  objc_msgSend_dataPeriod_s(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("dataPeriod"), v12);
  objc_msgSend_deltaCourse_rad(self, v13, v14, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("deltaCourse"), v17);
  objc_msgSend_deltaSpeed_mps(self, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("deltaSpeed"), v22);
  objc_msgSend_deltaCourseVar_rad2(self, v23, v24, v25);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("deltaCourseVar"), v27);
  objc_msgSend_deltaSpeedVar_mps2(self, v28, v29, v30);
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("deltaSpeedVar"), v32);
  objc_msgSend_deltaCourseSpeedCovar_radmps(self, v33, v34, v35);
  objc_msgSend_encodeDouble_forKey_(a3, v36, (uint64_t)CFSTR("deltaCourseSpeedCovar"), v37);
}

- (CLTripSegmentInertialData)initWithCoder:(id)a3
{
  CLTripSegmentInertialData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  double v32;

  v4 = [CLTripSegmentInertialData alloc];
  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("timestamp"));
  objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("dataPeriod"), v9);
  v11 = v10;
  objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("deltaCourse"), v13);
  v15 = v14;
  objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("deltaSpeed"), v17);
  v19 = v18;
  objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("deltaCourseVar"), v21);
  v23 = v22;
  objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("deltaSpeedVar"), v25);
  v27 = v26;
  objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("deltaCourseSpeedCovar"), v29);
  return (CLTripSegmentInertialData *)objc_msgSend_initWithTime_dataPeriodSec_deltaCourseRad_deltaSpeedMps_deltaCourseVarRad2_deltaSpeedVarMps2_deltaCourseSpeedCovarRadMps_(v4, v30, v7, v31, v11, v15, v19, v23, v27, v32);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)dataPeriod_s
{
  return self->_dataPeriod_s;
}

- (void)setDataPeriod_s:(double)a3
{
  self->_dataPeriod_s = a3;
}

- (double)deltaCourse_rad
{
  return self->_deltaCourse_rad;
}

- (void)setDeltaCourse_rad:(double)a3
{
  self->_deltaCourse_rad = a3;
}

- (double)deltaSpeed_mps
{
  return self->_deltaSpeed_mps;
}

- (void)setDeltaSpeed_mps:(double)a3
{
  self->_deltaSpeed_mps = a3;
}

- (double)deltaCourseVar_rad2
{
  return self->_deltaCourseVar_rad2;
}

- (void)setDeltaCourseVar_rad2:(double)a3
{
  self->_deltaCourseVar_rad2 = a3;
}

- (double)deltaSpeedVar_mps2
{
  return self->_deltaSpeedVar_mps2;
}

- (void)setDeltaSpeedVar_mps2:(double)a3
{
  self->_deltaSpeedVar_mps2 = a3;
}

- (double)deltaCourseSpeedCovar_radmps
{
  return self->_deltaCourseSpeedCovar_radmps;
}

- (void)setDeltaCourseSpeedCovar_radmps:(double)a3
{
  self->_deltaCourseSpeedCovar_radmps = a3;
}

@end
