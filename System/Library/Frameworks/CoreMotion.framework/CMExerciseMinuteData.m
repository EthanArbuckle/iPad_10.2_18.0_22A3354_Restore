@implementation CMExerciseMinuteData

- (CMExerciseMinuteData)initWithStartDate:(double)a3 recordId:(int64_t)a4 sourceId:(id)a5
{
  CMExerciseMinuteData *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CMExerciseMinuteData *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMExerciseMinuteData;
  v8 = -[CMExerciseMinuteData init](&v15, sel_init);
  v13 = v8;
  if (v8)
  {
    v8->fStartDate = a3;
    v8->fRecordId = a4;
    v8->fSourceId = (NSUUID *)objc_msgSend_copy(a5, v9, v10, v11, v12);
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMExerciseMinuteData;
  -[CMExerciseMinuteData dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMExerciseMinuteData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMExerciseMinuteData *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMExerciseMinuteData;
  v7 = -[CMExerciseMinuteData init](&v16, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kExerciseMinuteDataCodingKeyStartDate"), v5, v6);
    v7->fStartDate = v8;
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v9, (uint64_t)CFSTR("kExerciseMinuteDataCodingKeyRecordId"), v10, v11);
    v12 = objc_opt_class();
    v7->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, (uint64_t)CFSTR("kExerciseMinuteDataCodingKeySourceId"), v14);
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
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithStartDate_recordId_sourceId_, self->fRecordId, self->fSourceId, v10);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kExerciseMinuteDataCodingKeyStartDate"), v3, v4, self->fStartDate);
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->fRecordId, (uint64_t)CFSTR("kExerciseMinuteDataCodingKeyRecordId"), v8);
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kExerciseMinuteDataCodingKeySourceId"), v10);
}

- (NSDate)startDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->fStartDate);
}

- (int64_t)recordId
{
  return self->fRecordId;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

+ (id)maxExerciseMinuteDataEntries
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, 1000, v2, v3);
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
  uint64_t started;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_sourceId(self, v16, v17, v18, v19);
  return (id)objc_msgSend_stringWithFormat_(v3, v21, (uint64_t)CFSTR("%@, <recordId %lu, startDate %@, sourceId %@>"), v22, v23, v5, v10, started, v20);
}

@end
