@implementation CMActivityEventData

- (CMActivityEventData)initWithStartDate:(id)a3 eventType:(int64_t)a4 action:(int64_t)a5 reason:(int64_t)a6 workoutType:(int64_t)a7
{
  CMActivityEventData *v12;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CMActivityEventData;
  v12 = -[CMActivityEventData init](&v19, sel_init);
  if (v12)
  {
    v12->_startDate = (NSDate *)a3;
    v12->_eventType = a4;
    v12->_action = a5;
    v12->_reason = a6;
    v12->_workoutType = a7;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v12->_heartRateRecoveryStartTime = _Q0;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMActivityEventData;
  -[CMActivityEventData dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id result;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  result = (id)objc_msgSend_initWithStartDate_eventType_action_reason_workoutType_(v9, v10, (uint64_t)self->_startDate, self->_eventType, self->_action, self->_reason, self->_workoutType);
  if (result)
  {
    *((_QWORD *)result + 6) = *(_QWORD *)&self->_heartRateRecoveryStartTime;
    *((_QWORD *)result + 7) = *(_QWORD *)&self->_heartRateRecoveryEndTime;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMActivityEventData)initWithCoder:(id)a3
{
  CMActivityEventData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CMActivityEventData;
  v4 = -[CMActivityEventData init](&v29, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCCMActivityEventDataCodingKeyStartDate"), v7);
    v4->_eventType = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyEventType"), v9, v10);
    v4->_action = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyAction"), v12, v13);
    v4->_reason = objc_msgSend_decodeIntegerForKey_(a3, v14, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyReason"), v15, v16);
    v4->_workoutType = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyWorkoutType"), v18, v19);
    objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyRecoveryStart"), v21, v22);
    v4->_heartRateRecoveryStartTime = v23;
    objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyRecoveryEnd"), v25, v26);
    v4->_heartRateRecoveryEndTime = v27;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, (uint64_t)CFSTR("kCCMActivityEventDataCodingKeyStartDate"), v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_eventType, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyEventType"), v7);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_action, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyAction"), v9);
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_reason, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyReason"), v11);
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->_workoutType, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyWorkoutType"), v13);
  objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyRecoveryStart"), v15, v16, self->_heartRateRecoveryStartTime);
  objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("kCMActivityEventDataCodingKeyRecoveryEnd"), v18, v19, self->_heartRateRecoveryEndTime);
}

+ (id)eventTypeName:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("WorkoutPrediction");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("BackgroundEscalation");
}

+ (id)actionName:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Stop");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("Start");
}

+ (id)reasonName:(int64_t)a3
{
  if ((unint64_t)a3 > 0x16)
    return 0;
  else
    return off_1E29592E0[a3];
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSDate *startDate;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  startDate = self->_startDate;
  v10 = objc_msgSend_eventTypeName_(CMActivityEventData, v7, self->_eventType, v8, v9);
  v14 = objc_msgSend_actionName_(CMActivityEventData, v11, self->_action, v12, v13);
  v18 = objc_msgSend_reasonName_(CMActivityEventData, v15, self->_reason, v16, v17);
  v22 = objc_msgSend_workoutName_(CMWorkout, v19, self->_workoutType, v20, v21);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v23, (uint64_t)CFSTR("%@, startDate %@, eventType %@, action %@, reason %@, workoutType %@, recoveryStart %f, recoveryEnd %f>"), v24, v25, v5, startDate, v10, v14, v18, v22, *(_QWORD *)&self->_heartRateRecoveryStartTime, *(_QWORD *)&self->_heartRateRecoveryEndTime);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (int64_t)action
{
  return self->_action;
}

- (int64_t)reason
{
  return self->_reason;
}

- (int64_t)workoutType
{
  return self->_workoutType;
}

- (double)heartRateRecoveryStartTime
{
  return self->_heartRateRecoveryStartTime;
}

- (void)setHeartRateRecoveryStartTime:(double)a3
{
  self->_heartRateRecoveryStartTime = a3;
}

- (double)heartRateRecoveryEndTime
{
  return self->_heartRateRecoveryEndTime;
}

- (void)setHeartRateRecoveryEndTime:(double)a3
{
  self->_heartRateRecoveryEndTime = a3;
}

- (id)binarySampleRepresentation
{
  void *v3;
  const char *v4;
  id v5;

  v3 = (void *)MEMORY[0x194001B4C](self, a2);
  v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)self, 1, 0);
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (CMActivityEventData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMActivityEventData *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMActivityEventData;
    v8 = -[CMActivityEventData init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMActivityEventData *)v13;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *started;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  _QWORD v72[7];
  _QWORD v73[8];

  v73[7] = *MEMORY[0x1E0C80C00];
  v72[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v8, v9, v10, v11);
  v73[0] = objc_msgSend_numberWithDouble_(v6, v12, v13, v14, v15);
  v72[1] = CFSTR("eventType");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v21 = objc_msgSend_eventType(self, v17, v18, v19, v20);
  v73[1] = objc_msgSend_numberWithInteger_(v16, v22, v21, v23, v24);
  v72[2] = CFSTR("action");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  v30 = objc_msgSend_action(self, v26, v27, v28, v29);
  v73[2] = objc_msgSend_numberWithInteger_(v25, v31, v30, v32, v33);
  v72[3] = CFSTR("reason");
  v34 = (void *)MEMORY[0x1E0CB37E8];
  v39 = objc_msgSend_reason(self, v35, v36, v37, v38);
  v73[3] = objc_msgSend_numberWithInteger_(v34, v40, v39, v41, v42);
  v72[4] = CFSTR("workoutType");
  v43 = (void *)MEMORY[0x1E0CB37E8];
  v48 = objc_msgSend_workoutType(self, v44, v45, v46, v47);
  v73[4] = objc_msgSend_numberWithInteger_(v43, v49, v48, v50, v51);
  v72[5] = CFSTR("recoveryStart");
  v52 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_heartRateRecoveryStartTime(self, v53, v54, v55, v56);
  v73[5] = objc_msgSend_numberWithDouble_(v52, v57, v58, v59, v60);
  v72[6] = CFSTR("recoveryEnd");
  v61 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_heartRateRecoveryEndTime(self, v62, v63, v64, v65);
  v73[6] = objc_msgSend_numberWithDouble_(v61, v66, v67, v68, v69);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v70, (uint64_t)v73, (uint64_t)v72, 7);
}

@end
