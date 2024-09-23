@implementation CMSWOLFSummary

- (CMSWOLFSummary)initWithCLSWOLFSummary:(const CLSWOLFSummary *)a3
{
  CMSWOLFSummary *v4;
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
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMSWOLFSummary;
  v4 = -[CMSWOLFSummary init](&v24, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v5, v6, v7, v8, v9, a3->var0);
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var1);
    v15 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v4->fSourceId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v15, v16, (uint64_t)a3->var3, v17, v18);
    v19 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v4->fSessionId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v19, v20, (uint64_t)a3->var2, v21, v22);
    v4->fSWOLF = a3->var4;
    v4->fFreestyleSWOLF = a3->var5;
    v4->fBackstrokeSWOLF = a3->var6;
    v4->fBreaststrokeSWOLF = a3->var7;
    v4->fButterflySWOLF = a3->var8;
  }
  return v4;
}

- (CMSWOLFSummary)initWithSessionId:(id)a3 sourceId:(id)a4 startDate:(id)a5 endDate:(id)a6 SWOLF:(double)a7 freestyleSWOLF:(double)a8 backstrokeSWOLF:(double)a9 breaststrokeSWOLF:(double)a10 butterflySWOLF:(double)a11
{
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CMSWOLFSummary *v24;
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
  uint64_t v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CMSWOLFSummary;
  v24 = -[CMSWOLFSummary init](&v38, sel_init);
  if (v24)
  {
    v24->fStartDate = (NSDate *)objc_msgSend_copy(a5, v20, v21, v22, v23);
    v24->fEndDate = (NSDate *)objc_msgSend_copy(a6, v25, v26, v27, v28);
    v24->fSourceId = (NSUUID *)objc_msgSend_copy(a4, v29, v30, v31, v32);
    v24->fSessionId = (NSUUID *)objc_msgSend_copy(a3, v33, v34, v35, v36);
    v24->fSWOLF = a7;
    v24->fFreestyleSWOLF = a8;
    v24->fBackstrokeSWOLF = a9;
    v24->fBreaststrokeSWOLF = a10;
    v24->fButterflySWOLF = a11;
  }
  return v24;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMSWOLFSummary;
  -[CMSWOLFSummary dealloc](&v3, sel_dealloc);
}

- (NSData)startDate
{
  return (NSData *)self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (double)SWOLF
{
  return self->fSWOLF;
}

- (double)freestyleSWOLF
{
  return self->fFreestyleSWOLF;
}

- (double)backstrokeSWOLF
{
  return self->fBackstrokeSWOLF;
}

- (double)breaststrokeSWOLF
{
  return self->fBreaststrokeSWOLF;
}

- (double)butterflySWOLF
{
  return self->fButterflySWOLF;
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
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_sessionId(self, v16, v17, v18, v19);
  v25 = objc_msgSend_sourceId(self, v21, v22, v23, v24);
  objc_msgSend_SWOLF(self, v26, v27, v28, v29);
  v31 = v30;
  objc_msgSend_freestyleSWOLF(self, v32, v33, v34, v35);
  v37 = v36;
  objc_msgSend_backstrokeSWOLF(self, v38, v39, v40, v41);
  v43 = v42;
  objc_msgSend_breaststrokeSWOLF(self, v44, v45, v46, v47);
  v49 = v48;
  objc_msgSend_butterflySWOLF(self, v50, v51, v52, v53);
  return (id)objc_msgSend_stringWithFormat_(v3, v54, (uint64_t)CFSTR("%@,<startDate, %@, endDate, %@, sessionId, %@, sourceId, %@, SWOLF, %.02f, freestyleSWOLF, %.02f, backstrokeSWOLF, %.02f, breaststrokeSWOLF, %.02f, butterflySWOLF, %.02f>"), v55, v56, v5, started, v15, v20, v25, v31, v37, v43, v49, v57);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSWOLFSummary)initWithCoder:(id)a3
{
  CMSWOLFSummary *v4;
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
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)CMSWOLFSummary;
  v4 = -[CMSWOLFSummary init](&v48, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v8 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyStartDate"), v7);
    v4->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10, v11, v12);
    v13 = objc_opt_class();
    v16 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyEndDate"), v15);
    v4->fEndDate = (NSDate *)objc_msgSend_copy(v16, v17, v18, v19, v20);
    v21 = objc_opt_class();
    v4->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, (uint64_t)CFSTR("kSWOLFSummaryCodingKeySourceId"), v23);
    v24 = objc_opt_class();
    v4->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v25, v24, (uint64_t)CFSTR("kSWOLFSummaryCodingKeySessionId"), v26);
    objc_msgSend_decodeDoubleForKey_(a3, v27, (uint64_t)CFSTR("kSWOLFSummaryCodingKeySWOLF"), v28, v29);
    v4->fSWOLF = v30;
    objc_msgSend_decodeDoubleForKey_(a3, v31, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyFreestyleSWOLF"), v32, v33);
    v4->fFreestyleSWOLF = v34;
    objc_msgSend_decodeDoubleForKey_(a3, v35, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyBackstrokeSWOLF"), v36, v37);
    v4->fBackstrokeSWOLF = v38;
    objc_msgSend_decodeDoubleForKey_(a3, v39, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyBreaststrokeSWOLF"), v40, v41);
    v4->fBreaststrokeSWOLF = v42;
    objc_msgSend_decodeDoubleForKey_(a3, v43, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyButterflySWOLF"), v44, v45);
    v4->fButterflySWOLF = v46;
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
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithSessionId_sourceId_startDate_endDate_SWOLF_freestyleSWOLF_backstrokeSWOLF_breaststrokeSWOLF_butterflySWOLF_, self->fSessionId, self->fSourceId, self->fStartDate);
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
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyEndDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kSWOLFSummaryCodingKeySourceId"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kSWOLFSummaryCodingKeySessionId"), v11);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kSWOLFSummaryCodingKeySWOLF"), v13, v14, self->fSWOLF);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyFreestyleSWOLF"), v16, v17, self->fFreestyleSWOLF);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyBackstrokeSWOLF"), v19, v20, self->fBackstrokeSWOLF);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyBreaststrokeSWOLF"), v22, v23, self->fBreaststrokeSWOLF);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("kSWOLFSummaryCodingKeyButterflySWOLF"), v25, v26, self->fButterflySWOLF);
}

@end
