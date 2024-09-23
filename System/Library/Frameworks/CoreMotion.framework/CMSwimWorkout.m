@implementation CMSwimWorkout

+ (BOOL)isAvailable
{
  if ((sub_18F1F7758() & 1) == 0)
    sub_18F1F77DC();
  return 0;
}

- (CMSwimWorkout)initWithSessionId:(id)a3 location:(int64_t)a4 poolLength:(double)a5
{
  uint64_t v5;
  NSObject *v10;
  CMSwimWorkout *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CMSwimWorkout *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v22;
  const char *v23;
  char *v24;
  objc_super v25;
  int v26;
  double v27;
  uint8_t buf[4];
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a4 >= 2)
  {
    v22 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, v5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 894, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location < kCMSwimWorkoutLocationMax"));
  }
  else if (!a4 && a5 < 1.0)
  {
    if (qword_1EE16D7F8 != -1)
      dispatch_once(&qword_1EE16D7F8, &unk_1E2952F68);
    v10 = qword_1EE16D800;
    if (os_log_type_enabled((os_log_t)qword_1EE16D800, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = a5;
      _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_FAULT, "Workout, pool length %f for workout is too small and may lead to undefined behavior.", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D7F8 != -1)
        dispatch_once(&qword_1EE16D7F8, &unk_1E2952F68);
      v26 = 134217984;
      v27 = a5;
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSwimWorkout initWithSessionId:location:poolLength:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf)
        free(v24);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)CMSwimWorkout;
  v11 = -[CMWorkout initWithSessionId:type:](&v25, sel_initWithSessionId_type_, a3, 19);
  v15 = v11;
  if (v11)
  {
    v11->fLocation = a4;
    v11->fPoolLength = a5;
    v16 = objc_msgSend_CMWorkoutLocationTypeFromCMSwimWorkoutLocation_(CMWorkout, v12, a4, v13, v14);
    objc_msgSend_setLocationType_(v15, v17, v16, v18, v19);
  }
  return v15;
}

- (CMSwimWorkout)initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5
{
  NSObject *v9;
  CMSwimWorkout *result;
  char *v11;
  objc_super v12;
  int v13;
  double v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a4 == 1 && a5 < 1.0)
  {
    if (qword_1EE16D7F8 != -1)
      dispatch_once(&qword_1EE16D7F8, &unk_1E2952F68);
    v9 = qword_1EE16D800;
    if (os_log_type_enabled((os_log_t)qword_1EE16D800, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = a5;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "Workout, pool length %f for workout is too small and may lead to undefined behavior.", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D7F8 != -1)
        dispatch_once(&qword_1EE16D7F8, &unk_1E2952F68);
      v13 = 134217984;
      v14 = a5;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSwimWorkout initWithSessionId:locationType:poolLength:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CMSwimWorkout;
  result = -[CMWorkout initWithSessionId:type:locationType:](&v12, sel_initWithSessionId_type_locationType_, a3, 19, a4);
  if (result)
    result->fPoolLength = a5;
  return result;
}

- (CMSwimWorkout)initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5 startDate:(id)a6 endDate:(id)a7
{
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;

  if (!a6)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 923, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));
    if (a7)
      return (CMSwimWorkout *)objc_msgSend__initWithSessionId_locationType_poolLength_startDate_endDate_(self, a2, (uint64_t)a3, a4, (uint64_t)a6, a7, a5);
LABEL_5:
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, (uint64_t)a6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 924, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));
    return (CMSwimWorkout *)objc_msgSend__initWithSessionId_locationType_poolLength_startDate_endDate_(self, a2, (uint64_t)a3, a4, (uint64_t)a6, a7, a5);
  }
  if (!a7)
    goto LABEL_5;
  return (CMSwimWorkout *)objc_msgSend__initWithSessionId_locationType_poolLength_startDate_endDate_(self, a2, (uint64_t)a3, a4, (uint64_t)a6, a7, a5);
}

- (id)_initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5 startDate:(id)a6 endDate:(id)a7
{
  NSObject *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v23;
  objc_super v24;
  int v25;
  double v26;
  uint8_t buf[4];
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a4 == 1 && a5 < 1.0)
  {
    if (qword_1EE16D7F8 != -1)
      dispatch_once(&qword_1EE16D7F8, &unk_1E2952F68);
    v13 = qword_1EE16D800;
    if (os_log_type_enabled((os_log_t)qword_1EE16D800, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = a5;
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_FAULT, "Workout, pool length %f for workout is too small and may lead to undefined behavior.", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D7F8 != -1)
        dispatch_once(&qword_1EE16D7F8, &unk_1E2952F68);
      v25 = 134217984;
      v26 = a5;
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSwimWorkout _initWithSessionId:locationType:poolLength:startDate:endDate:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)CMSwimWorkout;
  v14 = -[CMWorkout _initWithSessionId:type:locationType:mode:startDate:endDate:](&v24, sel__initWithSessionId_type_locationType_mode_startDate_endDate_, a3, 19, a4, 0, a6, a7);
  v18 = v14;
  if (v14)
  {
    *((double *)v14 + 11) = a5;
    *((_QWORD *)v14 + 10) = objc_msgSend_CMSwimWorkoutLocationFromCMWorkoutLocationType_(CMWorkout, v15, a4, v16, v17);
    objc_msgSend_setIsUserInitiated_(v18, v19, 0, v20, v21);
  }
  return v18;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMSwimWorkout;
  -[CMWorkout dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSwimWorkout)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMSwimWorkout *v7;
  const char *v8;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CMSwimWorkout;
  v7 = -[CMWorkout initWithCoder:](&v33, sel_initWithCoder_);
  if (v7)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, (uint64_t)CFSTR("kCMWorkoutDataCodingKeySwimLocation"), v5, v6))
    {
      v7->fLocation = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMWorkoutDataCodingKeySwimLocation"), v9, v10);
      v15 = objc_msgSend_location(v7, v11, v12, v13, v14);
      v19 = objc_msgSend_CMWorkoutLocationTypeFromCMSwimWorkoutLocation_(CMWorkout, v16, v15, v17, v18);
      objc_msgSend_setLocationType_(v7, v20, v19, v21, v22);
    }
    if (objc_msgSend_containsValueForKey_(a3, v8, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyLocationType"), v9, v10))
    {
      v27 = objc_msgSend_locationType(v7, v23, v24, v25, v26);
      v7->fLocation = objc_msgSend_CMSwimWorkoutLocationFromCMWorkoutLocationType_(CMWorkout, v28, v27, v29, v30);
    }
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyPoolLength"), v25, v26);
    v7->fPoolLength = v31;
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
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t started;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_sessionId(self, v10, v11, v12, v13);
  v19 = objc_msgSend_locationType(self, v15, v16, v17, v18);
  objc_msgSend_poolLength(self, v20, v21, v22, v23);
  v25 = v24;
  started = objc_msgSend_startDate(self, v26, v27, v28, v29);
  v35 = objc_msgSend_endDate(self, v31, v32, v33, v34);
  v37 = (void *)objc_msgSend__initWithSessionId_locationType_poolLength_startDate_endDate_(v9, v36, v14, v19, started, v35, v25);
  v42 = objc_msgSend_appId(self, v38, v39, v40, v41);
  objc_msgSend_setAppId_(v37, v43, v42, v44, v45);
  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMSwimWorkout;
  -[CMWorkout encodeWithCoder:](&v10, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->fLocation, (uint64_t)CFSTR("kCMWorkoutDataCodingKeySwimLocation"), v6);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyPoolLength"), v8, v9, self->fPoolLength);
}

- (int64_t)location
{
  return self->fLocation;
}

- (double)poolLength
{
  return self->fPoolLength;
}

+ (id)swimLocationName:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E2956338[a3];
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_sessionId(self, v6, v7, v8, v9);
  v15 = objc_msgSend_location(self, v11, v12, v13, v14);
  v19 = objc_msgSend_swimLocationName_(CMSwimWorkout, v16, v15, v17, v18);
  objc_msgSend_poolLength(self, v20, v21, v22, v23);
  return (id)objc_msgSend_stringWithFormat_(v3, v24, (uint64_t)CFSTR("%@, <sessionId %@, type, kCMWorkoutTypeSwimming, location, %@, poolLength, %f>"), v25, v26, v5, v10, v19, v27);
}

+ (id)swimWorkoutInstance:(id)a3
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
