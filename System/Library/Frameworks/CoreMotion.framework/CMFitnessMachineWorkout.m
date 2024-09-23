@implementation CMFitnessMachineWorkout

+ (BOOL)isAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return objc_msgSend_isAvailable(CMWorkout, v2, v3, v4, v5);
}

- (CMFitnessMachineWorkout)initWithSessionId:(id)a3 workoutType:(int64_t)a4 manufacturerName:(id)a5 model:(id)a6
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CMFitnessMachineWorkout *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  const char *v23;
  objc_super v24;

  if ((unint64_t)a4 > 0x12 || ((1 << a4) & 0x51A20) == 0)
  {
    v22 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 1067, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workoutType == kCMWorkoutTypeIndoorRunning || workoutType == kCMWorkoutTypeIndoorWalking || workoutType == kCMWorkoutTypeIndoorCycling || workoutType == kCMWorkoutTypeElliptical || workoutType == kCMWorkoutTypeStairClimbing || workoutType == kCMWorkoutTypeRowing"));
  }
  v24.receiver = self;
  v24.super_class = (Class)CMFitnessMachineWorkout;
  v16 = -[CMWorkout initWithSessionId:type:](&v24, sel_initWithSessionId_type_, a3, a4);
  if (v16)
  {
    v16->fManufacturerName = (NSString *)objc_msgSend_copy(a5, v12, v13, v14, v15);
    v16->fModel = (NSString *)objc_msgSend_copy(a6, v17, v18, v19, v20);
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMFitnessMachineWorkout;
  -[CMWorkout dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMFitnessMachineWorkout)initWithCoder:(id)a3
{
  CMFitnessMachineWorkout *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CMFitnessMachineWorkout;
  v4 = -[CMWorkout initWithCoder:](&v22, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v8 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyFitnessMachineManufacturerName"), v7);
    v4->fManufacturerName = (NSString *)objc_msgSend_copy(v8, v9, v10, v11, v12);
    v13 = objc_opt_class();
    v16 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kCMFitnessMachineWorkoutDataCodingKeyModel"), v15);
    v4->fModel = (NSString *)objc_msgSend_copy(v16, v17, v18, v19, v20);
  }
  return v4;
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
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_sessionId(self, v10, v11, v12, v13);
  v19 = objc_msgSend_type(self, v15, v16, v17, v18);
  v21 = (void *)objc_msgSend_initWithSessionId_workoutType_manufacturerName_model_(v9, v20, v14, v19, (uint64_t)self->fManufacturerName, self->fModel);
  v26 = objc_msgSend_appId(self, v22, v23, v24, v25);
  objc_msgSend_setAppId_(v21, v27, v26, v28, v29);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMFitnessMachineWorkout;
  -[CMWorkout encodeWithCoder:](&v9, sel_encodeWithCoder_);
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fManufacturerName, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyFitnessMachineManufacturerName"), v6);
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fModel, (uint64_t)CFSTR("kCMFitnessMachineWorkoutDataCodingKeyModel"), v8);
}

- (NSString)manufacturerName
{
  return self->fManufacturerName;
}

- (NSString)model
{
  return self->fModel;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_sessionId(self, v6, v7, v8, v9);
  v15 = objc_msgSend_type(self, v11, v12, v13, v14);
  v19 = objc_msgSend_workoutName_(CMWorkout, v16, v15, v17, v18);
  v24 = objc_msgSend_manufacturerName(self, v20, v21, v22, v23);
  v29 = objc_msgSend_model(self, v25, v26, v27, v28);
  return (id)objc_msgSend_stringWithFormat_(v3, v30, (uint64_t)CFSTR("%@, <sessionId %@, type, %@, manufacturerName, %@, model, %@>"), v31, v32, v5, v10, v19, v24, v29);
}

+ (id)fitnessMachineWorkoutInstance:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(a3, v5, v4, v6, v7))
    return a3;
  else
    return 0;
}

@end
