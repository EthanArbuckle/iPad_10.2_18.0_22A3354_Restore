@implementation CMPedestrianGrade

- (CMPedestrianGrade)initWithRecordId:(unint64_t)a3 startDate:(id)a4 grade:(float)a5
{
  CMPedestrianGrade *v8;
  CMPedestrianGrade *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMPedestrianGrade;
  v8 = -[CMPedestrianGrade init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->fRecordId = a3;
    v8->fStartDate = (NSDate *)a4;
    v9->fGrade = a5;
  }
  return v9;
}

- (CMPedestrianGrade)initWithSample:(CLElevationGradeEntry *)a3
{
  CMPedestrianGrade *v4;
  CMPedestrianGrade *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float var2;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMPedestrianGrade;
  v4 = -[CMPedestrianGrade init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, a3->var1);
    var2 = a3->var2;
    v5->fGrade = var2;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMPedestrianGrade;
  -[CMPedestrianGrade dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPedestrianGrade)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMPedestrianGrade *v7;
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
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMPedestrianGrade;
  v7 = -[CMPedestrianGrade init](&v21, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMPedestrianGradeCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMPedestrianGradeCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMPedestrianGradeCodingKeyGrade"), v17, v18);
    *(float *)&v19 = v19;
    v7->fGrade = *(float *)&v19;
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
  double fGrade;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[3];

  fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3, v3, v4);
  v9 = v8;
  fGrade = self->fGrade;
  v11 = (void *)objc_opt_class();
  v15 = (void *)objc_msgSend_allocWithZone_(v11, v12, (uint64_t)a3, v13, v14);
  v20[0] = fRecordId;
  v20[1] = v9;
  *(double *)&v20[2] = fGrade;
  return (id)objc_msgSend_initWithSample_(v15, v16, (uint64_t)v20, v17, v18);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMPedestrianGradeCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMPedestrianGradeCodingKeyStartDate"), v7);
  *(float *)&v8 = self->fGrade;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("kCMPedestrianGradeCodingKeyGrade"), v10, v11, v8);
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
  float v32;
  float v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float v38;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9 = objc_msgSend_recordId(self, v5, v6, v7, v8), v9 == objc_msgSend_recordId(a3, v10, v11, v12, v13)))
  {
    if (!objc_msgSend_startDate(self, v14, v15, v16, v17) && !objc_msgSend_startDate(a3, v18, v19, v20, v21)
      || (started = (void *)objc_msgSend_startDate(self, v18, v19, v20, v21),
          v27 = objc_msgSend_startDate(a3, v23, v24, v25, v26),
          (isEqualToDate = objc_msgSend_isEqualToDate_(started, v28, v27, v29, v30)) != 0))
    {
      objc_msgSend_grade(self, v18, v19, v20, v21);
      v33 = v32;
      objc_msgSend_grade(a3, v34, v35, v36, v37);
      LOBYTE(isEqualToDate) = v33 == v38;
    }
  }
  else
  {
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

- (float)grade
{
  return self->fGrade;
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
  float v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  objc_msgSend_grade(self, v16, v17, v18, v19);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v21, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, grade, %f>"), v22, v23, v5, v10, started, v20);
}

+ (CLElevationGradeEntry)inputFromPreparedStatement:(SEL)a3
{
  CLElevationGradeEntry *result;

  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  retstr->var2 = sqlite3_column_double(a4, 2);
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

- (CMPedestrianGrade)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMPedestrianGrade *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMPedestrianGrade;
    v8 = -[CMPedestrianGrade init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMPedestrianGrade *)v13;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v8, v9, v10, v11);
  v27[1] = CFSTR("grade");
  v28[0] = objc_msgSend_numberWithDouble_(v6, v12, v13, v14, v15);
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_grade(self, v17, v18, v19, v20);
  v28[1] = objc_msgSend_numberWithFloat_(v16, v21, v22, v23, v24);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v28, (uint64_t)v27, 2);
}

@end
