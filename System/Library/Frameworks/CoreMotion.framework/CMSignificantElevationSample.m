@implementation CMSignificantElevationSample

- (CMSignificantElevationSample)initWithRecordId:(unint64_t)a3 sourceId:(id)a4 startDate:(id)a5 endDate:(id)a6 elevationAscended:(id)a7 elevationDescended:(id)a8
{
  CMSignificantElevationSample *v16;
  CMSignificantElevationSample *v17;
  void *v19;
  const char *v20;
  objc_super v21;

  if (!a8 || !a4 || !a5 || !a6 || !a7)
  {
    v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltitude.mm"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceId && startDate && endDate && elevationAscended && elevationDescended"));
  }
  v21.receiver = self;
  v21.super_class = (Class)CMSignificantElevationSample;
  v16 = -[CMSignificantElevationSample init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->fRecordId = a3;
    v16->fSourceId = (NSUUID *)a4;
    v17->fStartDate = (NSDate *)a5;
    v17->fEndDate = (NSDate *)a6;
    v17->fElevationAscended = (NSNumber *)a7;
    v17->fElevationDescended = (NSNumber *)a8;
  }
  return v17;
}

- (CMSignificantElevationSample)initWithSignificantElevation:(const CLSignificantElevation *)a3
{
  CMSignificantElevationSample *v4;
  CMSignificantElevationSample *v5;
  id v6;
  const char *v7;
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
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CMSignificantElevationSample;
  v4 = -[CMSignificantElevationSample init](&v33, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v5->fSourceId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v6, v7, (uint64_t)a3->var1, v8, v9);
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var2);
    v15 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v15, v16, v17, v18, v19, a3->var3);
    v20 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v21) = a3->var4;
    v5->fElevationAscended = (NSNumber *)objc_msgSend_initWithDouble_(v20, v22, v23, v24, v25, (double)v21 / 100.0);
    v26 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v27) = a3->var5;
    v5->fElevationDescended = (NSNumber *)objc_msgSend_initWithDouble_(v26, v28, v29, v30, v31, (double)v27 / 100.0);
  }
  return v5;
}

- (CMSignificantElevationSample)initWithFilteredElevation:(const CLElevationChangeEntry *)a3
{
  CMSignificantElevationSample *v4;
  CMSignificantElevationSample *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CMSignificantElevationSample;
  v4 = -[CMSignificantElevationSample init](&v29, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = 0;
    v4->fSourceId = 0;
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, a3->var1);
    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v11, v12, v13, v14, v15, a3->var1);
    v16 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v17) = a3->var2;
    v5->fElevationAscended = (NSNumber *)objc_msgSend_initWithDouble_(v16, v18, v19, v20, v21, (double)v17 / 100.0);
    v22 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v23) = a3->var3;
    v5->fElevationDescended = (NSNumber *)objc_msgSend_initWithDouble_(v22, v24, v25, v26, v27, (double)v23 / 100.0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMSignificantElevationSample;
  -[CMSignificantElevationSample dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSignificantElevationSample)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMSignificantElevationSample *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMSignificantElevationSample;
  v7 = -[CMSignificantElevationSample init](&v24, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v7->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMSignificantElevationCodingKeySourceId"), v10);
    v11 = objc_opt_class();
    v7->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyStartDate"), v13);
    v14 = objc_opt_class();
    v7->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyEndDate"), v16);
    v17 = objc_opt_class();
    v7->fElevationAscended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyElevationAscended"), v19);
    v20 = objc_opt_class();
    v7->fElevationDescended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyElevationDescended"), v22);
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

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithRecordId_sourceId_startDate_endDate_elevationAscended_elevationDescended_(v9, v10, self->fRecordId, (uint64_t)self->fSourceId, (uint64_t)self->fStartDate, self->fEndDate, self->fElevationAscended, self->fElevationDescended);
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

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kCMSignificantElevationCodingKeySourceId"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyStartDate"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyEndDate"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fElevationAscended, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyElevationAscended"), v13);
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->fElevationDescended, (uint64_t)CFSTR("kCMSignificantElevationCodingKeyElevationDescended"), v15);
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_elevationAscended(self, v16, v17, v18, v19);
  v25 = objc_msgSend_elevationDescended(self, v21, v22, v23, v24);
  return (id)objc_msgSend_stringWithFormat_(v3, v26, (uint64_t)CFSTR("%@, <startDate, %@, endDate, %@, elevationAscended, %@ elevationDescended, %@>"), v27, v28, v5, started, v15, v20, v25);
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (NSNumber)elevationAscended
{
  return self->fElevationAscended;
}

- (NSNumber)elevationDescended
{
  return self->fElevationDescended;
}

@end
