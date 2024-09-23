@implementation CMGenericWorkout

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

- (CMGenericWorkout)initWithSessionId:(id)a3 workoutLabel:(unint64_t)a4
{
  CMGenericWorkout *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMGenericWorkout;
  result = -[CMWorkout initWithSessionId:type:](&v6, sel_initWithSessionId_type_, a3, 14);
  if (result)
    result->fWorkoutLabel = a4;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMGenericWorkout;
  -[CMWorkout dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMGenericWorkout)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMGenericWorkout *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMGenericWorkout;
  v7 = -[CMWorkout initWithCoder:](&v12, sel_initWithCoder_);
  if (v7
    && objc_msgSend_containsValueForKey_(a3, v4, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyWorkoutLabel"), v5, v6))
  {
    v7->fWorkoutLabel = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyWorkoutLabel"), v9, v10);
  }
  return v7;
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
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_sessionId(self, v10, v11, v12, v13);
  v19 = objc_msgSend_workoutLabel(self, v15, v16, v17, v18);
  v22 = (void *)objc_msgSend_initWithSessionId_workoutLabel_(v9, v20, v14, v19, v21);
  v27 = objc_msgSend_appId(self, v23, v24, v25, v26);
  objc_msgSend_setAppId_(v22, v28, v27, v29, v30);
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMGenericWorkout;
  -[CMWorkout encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->fWorkoutLabel, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyWorkoutLabel"), v6);
}

- (unint64_t)workoutLabel
{
  return self->fWorkoutLabel;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_sessionId(self, v6, v7, v8, v9);
  v15 = objc_msgSend_workoutLabel(self, v11, v12, v13, v14);
  return (id)objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("%@, <sessionId %@, label, %lu>"), v17, v18, v5, v10, v15);
}

+ (id)genericWorkoutInstance:(id)a3
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
