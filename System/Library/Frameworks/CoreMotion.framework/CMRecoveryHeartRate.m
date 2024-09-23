@implementation CMRecoveryHeartRate

- (id)sr_dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *started;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_heartRateConfidence(self, a2, v2, v3, v4);
  if (v10 >= 0.6)
  {
    objc_msgSend_heartRateConfidence(self, v6, v7, v8, v9);
    if (v12 >= 0.8)
    {
      objc_msgSend_heartRateConfidence(self, v6, v7, v8, v9);
      if (v13 >= 1.0)
        v11 = 3;
      else
        v11 = 2;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
  v38[0] = CFSTR("startTime");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, v6, v7, v8, v9);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v16, v17, v18, v19);
  v39[0] = objc_msgSend_numberWithDouble_(v14, v20, v21, v22, v23);
  v38[1] = CFSTR("heartRate");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_heartRate(self, v25, v26, v27, v28);
  v39[1] = objc_msgSend_numberWithDouble_(v24, v29, v30, v31, v32);
  v38[2] = CFSTR("confidence");
  v39[2] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v33, v11, v34, v35);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v36, (uint64_t)v39, (uint64_t)v38, 3);
}

- (CMRecoveryHeartRate)initWithRecordId:(unint64_t)a3 startDate:(id)a4 heartRate:(double)a5 heartRateConfidence:(double)a6
{
  CMRecoveryHeartRate *v10;
  CMRecoveryHeartRate *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMRecoveryHeartRate;
  v10 = -[CMRecoveryHeartRate init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->fRecordId = a3;
    v10->fStartDate = (NSDate *)a4;
    v11->fHeartRate = a5;
    v11->fHeartRateConfidence = a6;
  }
  return v11;
}

- (CMRecoveryHeartRate)initWithSample:(HRRecoveryInputHR *)a3
{
  CMRecoveryHeartRate *v4;
  CMRecoveryHeartRate *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMRecoveryHeartRate;
  v4 = -[CMRecoveryHeartRate init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, a3->var1);
    v5->fHeartRate = a3->var2;
    v5->fHeartRateConfidence = a3->var3;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMRecoveryHeartRate;
  -[CMRecoveryHeartRate dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecoveryHeartRate)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMRecoveryHeartRate *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CMRecoveryHeartRate;
  v7 = -[CMRecoveryHeartRate init](&v25, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMRecoveryHeartRateCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMRecoveryHeartRateCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMRecoveryHeartRateCodingKeyHeartRate"), v17, v18);
    v7->fHeartRate = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("kCMRecoveryHeartRateCodingKeyHeartRateConfidence"), v21, v22);
    v7->fHeartRateConfidence = v23;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t fRecordId;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[4];

  fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3, v3, v4);
  v9 = v8;
  *(float *)&v8 = self->fHeartRate;
  v10 = *(float *)&v8;
  *(float *)&v8 = self->fHeartRateConfidence;
  v11 = *(float *)&v8;
  v12 = (void *)objc_opt_class();
  v16 = (void *)objc_msgSend_allocWithZone_(v12, v13, (uint64_t)a3, v14, v15);
  v21[0] = fRecordId;
  v21[1] = v9;
  *(double *)&v21[2] = v10;
  *(double *)&v21[3] = v11;
  return (id)objc_msgSend_initWithSample_(v16, v17, (uint64_t)v21, v18, v19);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMRecoveryHeartRateCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMRecoveryHeartRateCodingKeyStartDate"), v7);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCMRecoveryHeartRateCodingKeyHeartRate"), v9, v10, self->fHeartRate);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("kCMRecoveryHeartRateCodingKeyHeartRateConfidence"), v12, v13, self->fHeartRateConfidence);
}

- (BOOL)isEqual:(id)a3
{
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *started;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int isEqualToDate;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_8;
  if (!objc_msgSend_startDate(self, v14, v15, v16, v17) && !objc_msgSend_startDate(a3, v18, v19, v20, v21)
    || (started = (void *)objc_msgSend_startDate(self, v18, v19, v20, v21),
        v27 = objc_msgSend_startDate(a3, v23, v24, v25, v26),
        (isEqualToDate = objc_msgSend_isEqualToDate_(started, v28, v27, v29, v30)) != 0))
  {
    objc_msgSend_heartRate(self, v18, v19, v20, v21);
    v33 = v32;
    objc_msgSend_heartRate(a3, v34, v35, v36, v37);
    if (v33 == v42)
    {
      objc_msgSend_heartRateConfidence(self, v38, v39, v40, v41);
      v44 = v43;
      objc_msgSend_heartRateConfidence(a3, v45, v46, v47, v48);
      LOBYTE(isEqualToDate) = v44 == v49;
      return isEqualToDate;
    }
LABEL_8:
    LOBYTE(isEqualToDate) = 0;
  }
  return isEqualToDate;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (double)heartRate
{
  return self->fHeartRate;
}

- (double)heartRateConfidence
{
  return self->fHeartRateConfidence;
}

- (NSString)description
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
  uint64_t started;
  const char *v16;
  uint64_t v17;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  objc_msgSend_heartRate(self, v16, v17, v18, v19);
  v21 = v20;
  objc_msgSend_heartRateConfidence(self, v22, v23, v24, v25);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v26, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, hr, %.3f, hrConf, %.3f>"), v27, v28, v5, v10, started, v21, v29);
}

+ (HRRecoveryInputHR)inputFromPreparedStatement:(SEL)a3
{
  HRRecoveryInputHR *result;

  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  retstr->var2 = sqlite3_column_double(a4, 2);
  retstr->var3 = sqlite3_column_double(a4, 3);
  return result;
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

- (CMRecoveryHeartRate)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMRecoveryHeartRate *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMRecoveryHeartRate;
    v8 = -[CMRecoveryHeartRate init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMRecoveryHeartRate *)v13;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

@end
