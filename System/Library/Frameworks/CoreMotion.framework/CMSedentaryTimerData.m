@implementation CMSedentaryTimerData

- (CMSedentaryTimerData)initWithStartDate:(double)a3 firedDate:(double)a4 alarmType:(int64_t)a5 didWake:(BOOL)a6
{
  CMSedentaryTimerData *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMSedentaryTimerData;
  result = -[CMSedentaryTimerData init](&v11, sel_init);
  if (result)
  {
    result->fStartDate = a3;
    result->fFiredDate = a4;
    result->fAlarmType = a5;
    result->fDidWake = a6;
  }
  return result;
}

- (CMSedentaryTimerData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMSedentaryTimerData *v7;
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CMSedentaryTimerData;
  v7 = -[CMSedentaryTimerData init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kSedentaryTimerDataCodingKeyStartDate"), v5, v6);
    v7->fStartDate = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kSedentaryTimerDataCodingKeyFiredDate"), v10, v11);
    v7->fFiredDate = v12;
    v7->fAlarmType = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("kSedentaryTimerDataCodingKeyAlarmType"), v14, v15);
    v7->fDidWake = objc_msgSend_decodeBoolForKey_(a3, v16, (uint64_t)CFSTR("kSedentaryTimerDataCodingKeyDidWake"), v17, v18);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithStartDate_firedDate_alarmType_didWake_, self->fAlarmType, self->fDidWake, v10);
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

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kSedentaryTimerDataCodingKeyStartDate"), v3, v4, self->fStartDate);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kSedentaryTimerDataCodingKeyFiredDate"), v8, v9, self->fFiredDate);
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->fAlarmType, (uint64_t)CFSTR("kSedentaryTimerDataCodingKeyAlarmType"), v11);
  objc_msgSend_encodeBool_forKey_(a3, v12, self->fDidWake, (uint64_t)CFSTR("kSedentaryTimerDataCodingKeyDidWake"), v13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)startDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->fStartDate);
}

- (NSDate)firedDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->fFiredDate);
}

- (int64_t)alarmType
{
  return self->fAlarmType;
}

- (BOOL)didWake
{
  return self->fDidWake;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t fAlarmType;
  __CFString *v7;
  void *v8;
  uint64_t started;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;

  if (qword_1ECEDF828 != -1)
    dispatch_once(&qword_1ECEDF828, &unk_1E2953368);
  fAlarmType = self->fAlarmType;
  if (fAlarmType > 4)
    v7 = 0;
  else
    v7 = off_1E2956D80[fAlarmType];
  v8 = (void *)qword_1ECEDF820;
  started = objc_msgSend_startDate(self, a2, v2, v3, v4);
  v13 = objc_msgSend_stringFromDate_(v8, v10, started, v11, v12);
  v14 = (void *)qword_1ECEDF820;
  v19 = objc_msgSend_firedDate(self, v15, v16, v17, v18);
  v23 = objc_msgSend_stringFromDate_(v14, v20, v19, v21, v22);
  v24 = (void *)MEMORY[0x1E0CB3940];
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  v27 = (void *)MEMORY[0x1E0CB37E8];
  v32 = objc_msgSend_didWake(self, v28, v29, v30, v31);
  v36 = objc_msgSend_numberWithBool_(v27, v33, v32, v34, v35);
  return (id)objc_msgSend_stringWithFormat_(v24, v37, (uint64_t)CFSTR("%@, <startDate %@, firedDate %@, alarmType %@, didWake %@>"), v38, v39, v26, v13, v23, v7, v36);
}

@end
