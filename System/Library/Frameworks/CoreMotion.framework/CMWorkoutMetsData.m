@implementation CMWorkoutMetsData

- (CMWorkoutMetsData)initWithCLWorkoutMets:(const CLWorkoutMets *)a3
{
  CMWorkoutMetsData *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CMWorkoutMetsData;
  v4 = -[CMWorkoutMetsData init](&v29, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v5, v6, v7, v8, v9, a3->var0);
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var1);
    v15 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v4->fMets = (NSNumber *)objc_msgSend_initWithDouble_(v15, v16, v17, v18, v19, a3->var4);
    v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v4->fSourceId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v20, v21, (uint64_t)a3->var3, v22, v23);
    v24 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v4->fSessionId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v24, v25, (uint64_t)a3->var2, v26, v27);
  }
  return v4;
}

- (CMWorkoutMetsData)initWithSessionId:(id)a3 sourceId:(id)a4 startDate:(id)a5 endDate:(id)a6 mets:(id)a7
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CMWorkoutMetsData *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
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
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CMWorkoutMetsData;
  v16 = -[CMWorkoutMetsData init](&v34, sel_init);
  if (v16)
  {
    v16->fStartDate = (NSDate *)objc_msgSend_copy(a5, v12, v13, v14, v15);
    v16->fEndDate = (NSDate *)objc_msgSend_copy(a6, v17, v18, v19, v20);
    v16->fMets = (NSNumber *)objc_msgSend_copy(a7, v21, v22, v23, v24);
    v16->fSourceId = (NSUUID *)objc_msgSend_copy(a4, v25, v26, v27, v28);
    v16->fSessionId = (NSUUID *)objc_msgSend_copy(a3, v29, v30, v31, v32);
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutMetsData;
  -[CMWorkoutMetsData dealloc](&v3, sel_dealloc);
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (NSNumber)mets
{
  return self->fMets;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
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
  uint64_t started;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_mets(self, v16, v17, v18, v19);
  v25 = objc_msgSend_sessionId(self, v21, v22, v23, v24);
  v30 = objc_msgSend_sourceId(self, v26, v27, v28, v29);
  return (id)objc_msgSend_stringWithFormat_(v3, v31, (uint64_t)CFSTR("%@,<startDate, %@, endDate, %@, mets, %@, sessionId, %@, sourceId, %@>"), v32, v33, v5, started, v15, v20, v25, v30);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWorkoutMetsData)initWithCoder:(id)a3
{
  CMWorkoutMetsData *v4;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CMWorkoutMetsData;
  v4 = -[CMWorkoutMetsData init](&v36, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v8 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kWorkoutMetsCodingKeyStartDate"), v7);
    v4->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10, v11, v12);
    v13 = objc_opt_class();
    v16 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kWorkoutMetsCodingKeyEndDate"), v15);
    v4->fEndDate = (NSDate *)objc_msgSend_copy(v16, v17, v18, v19, v20);
    v21 = objc_opt_class();
    v24 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, (uint64_t)CFSTR("kWorkoutMetsCodingKeyMets"), v23);
    v4->fMets = (NSNumber *)objc_msgSend_copy(v24, v25, v26, v27, v28);
    v29 = objc_opt_class();
    v4->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v30, v29, (uint64_t)CFSTR("kWorkoutMetsCodingKeySourceId"), v31);
    v32 = objc_opt_class();
    v4->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, (uint64_t)CFSTR("kWorkoutMetsCodingKeySessionId"), v34);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithSessionId_sourceId_startDate_endDate_mets_, self->fSessionId, self->fSourceId, self->fStartDate);
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

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kWorkoutMetsCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kWorkoutMetsCodingKeyEndDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fMets, (uint64_t)CFSTR("kWorkoutMetsCodingKeyMets"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kWorkoutMetsCodingKeySourceId"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kWorkoutMetsCodingKeySessionId"), v13);
}

@end
