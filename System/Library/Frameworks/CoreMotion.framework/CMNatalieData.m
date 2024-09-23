@implementation CMNatalieData

- (CMNatalieData)initWithStartDate:(double)a3 recordId:(int64_t)a4 activityType:(int64_t)a5 mets:(double)a6 natalies:(double)a7 basalNatalies:(double)a8 sourceId:(id)a9
{
  CMNatalieData *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CMNatalieData *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CMNatalieData;
  v16 = -[CMLogItem initWithTimestamp:](&v23, sel_initWithTimestamp_, 0.0);
  v21 = v16;
  if (v16)
  {
    v16->fStartDate = a3;
    v16->fRecordId = a4;
    v16->fActivityType = a5;
    v16->fMets = a6;
    v16->fNatalies = a7;
    v16->fBasalNatalies = a8;
    v16->fSourceId = (NSUUID *)objc_msgSend_copy(a9, v17, v18, v19, v20);
  }
  return v21;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMNatalieData;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMNatalieData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMNatalieData *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CMNatalieData;
  v7 = -[CMLogItem initWithCoder:](&v31, sel_initWithCoder_);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kNatalieDataCodingKeyStartDate"), v5, v6);
    v7->fStartDate = v8;
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v9, (uint64_t)CFSTR("kNatalieDataCodingKeyRecordId"), v10, v11);
    v7->fActivityType = objc_msgSend_decodeIntegerForKey_(a3, v12, (uint64_t)CFSTR("kNatalieDataCodingKeySession"), v13, v14);
    objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("kNatalieDataCodingKeyMets"), v16, v17);
    v7->fMets = v18;
    objc_msgSend_decodeDoubleForKey_(a3, v19, (uint64_t)CFSTR("kNatalieDataCodingKeyNatalies"), v20, v21);
    v7->fNatalies = v22;
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("kNatalieDataCodingKeyBasalNatalies"), v24, v25);
    v7->fBasalNatalies = v26;
    v27 = objc_opt_class();
    v7->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, (uint64_t)CFSTR("kNatalieDataCodingKeySourceId"), v29);
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

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithStartDate_recordId_activityType_mets_natalies_basalNatalies_sourceId_, self->fRecordId, self->fActivityType, self->fSourceId);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CMNatalieData;
  -[CMLogItem encodeWithCoder:](&v23, sel_encodeWithCoder_);
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("kNatalieDataCodingKeyStartDate"), v6, v7, self->fStartDate);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->fRecordId, (uint64_t)CFSTR("kNatalieDataCodingKeyRecordId"), v9);
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->fActivityType, (uint64_t)CFSTR("kNatalieDataCodingKeySession"), v11);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kNatalieDataCodingKeyMets"), v13, v14, self->fMets);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kNatalieDataCodingKeyNatalies"), v16, v17, self->fNatalies);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kNatalieDataCodingKeyBasalNatalies"), v19, v20, self->fBasalNatalies);
  objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kNatalieDataCodingKeySourceId"), v22);
}

- (NSDate)startDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->fStartDate);
}

- (NSNumber)mets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, self->fMets);
}

- (NSNumber)natalies
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, self->fNatalies);
}

- (NSNumber)basalNatalies
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, self->fBasalNatalies);
}

- (int64_t)activityType
{
  return self->fActivityType;
}

- (int64_t)recordId
{
  return self->fRecordId;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

+ (id)maxNatalieEntries
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
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
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v19 = objc_msgSend_workoutName_(CMWorkout, v16, self->fActivityType, v17, v18);
  v24 = (void *)objc_msgSend_mets(self, v20, v21, v22, v23);
  v29 = objc_msgSend_stringValue(v24, v25, v26, v27, v28);
  v34 = (void *)objc_msgSend_natalies(self, v30, v31, v32, v33);
  v39 = objc_msgSend_stringValue(v34, v35, v36, v37, v38);
  v44 = (void *)objc_msgSend_basalNatalies(self, v40, v41, v42, v43);
  v49 = objc_msgSend_stringValue(v44, v45, v46, v47, v48);
  v54 = objc_msgSend_sourceId(self, v50, v51, v52, v53);
  return (id)objc_msgSend_stringWithFormat_(v3, v55, (uint64_t)CFSTR("%@, <recordId %lu, startDate %@, session %@, mets %@, natalies %@, basalNatalies %@, sourceId %@>"), v56, v57, v5, v10, started, v19, v29, v39, v49, v54);
}

@end
