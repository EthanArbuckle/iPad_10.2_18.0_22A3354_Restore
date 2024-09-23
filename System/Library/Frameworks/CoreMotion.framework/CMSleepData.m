@implementation CMSleepData

- (void)convertToSpringTrackerEntry:(CLSpringTrackerEntry *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uuid_t src;
  uuid_t uu;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  memset(src, 0, sizeof(src));
  uuid_clear(uu);
  uuid_clear(src);
  objc_msgSend_getUUIDBytes_(self->fSourceId, v5, (uint64_t)uu, v6, v7);
  objc_msgSend_getUUIDBytes_(self->fSessionId, v8, (uint64_t)uu, v9, v10);
  a3->var0 = self->fRecordId;
  uuid_copy(a3->var1, uu);
  uuid_copy(a3->var2, src);
  objc_msgSend_timeIntervalSinceReferenceDate(self->fEventTime, v11, v12, v13, v14);
  a3->var3 = v15;
  a3->var4 = self->fEventType;
}

- (CMSleepData)initWithRecordId:(unint64_t)a3 sourceId:(id)a4 sessionId:(id)a5 eventTime:(id)a6 eventType:(int64_t)a7
{
  CMSleepData *v12;
  CMSleepData *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMSleepData;
  v12 = -[CMSleepData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->fRecordId = a3;
    v12->fSourceId = (NSUUID *)a4;
    v13->fSessionId = (NSUUID *)a5;
    v13->fEventTime = (NSDate *)a6;
    v13->fEventType = a7;
  }
  return v13;
}

- (CMSleepData)initWithSessionId:(id)a3
{
  CMSleepData *v4;
  CMSleepData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMSleepData;
  v4 = -[CMSleepData init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = 1;
    v4->fSourceId = 0;
    v4->fSessionId = (NSUUID *)a3;
    v5->fEventTime = 0;
    v5->fEventType = 1;
  }
  return v5;
}

- (CMSleepData)initWithSpringEntry:(const CLSpringTrackerEntry *)a3
{
  CMSleepData *v4;
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
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMSleepData;
  v4 = -[CMSleepData init](&v21, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v9 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var1, v7, v8);
    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v14 = objc_msgSend_initWithUUIDBytes_(v10, v11, (uint64_t)a3->var2, v12, v13);
    v4->fRecordId = a3->var0;
    v4->fSourceId = (NSUUID *)v9;
    v4->fSessionId = (NSUUID *)v14;
    v15 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fEventTime = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v15, v16, v17, v18, v19, a3->var3);
    v4->fEventType = a3->var4;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMSleepData;
  -[CMSleepData dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSleepData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMSleepData *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMSleepData;
  v7 = -[CMSleepData init](&v21, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMSpringDataCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v7->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMSpringDataCodingKeySourceId"), v10);
    v11 = objc_opt_class();
    v7->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMSpringDataCodingKeySessionId"), v13);
    v14 = objc_opt_class();
    v7->fEventTime = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMSpringDataCodingKeyEventTime"), v16);
    v7->fEventType = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("kCMSpringDataCodingKeyEventType"), v18, v19);
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
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithRecordId_sourceId_sessionId_eventTime_eventType_, self->fRecordId, self->fSourceId, self->fSessionId);
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

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMSpringDataCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kCMSpringDataCodingKeySourceId"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kCMSpringDataCodingKeySessionId"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fEventTime, (uint64_t)CFSTR("kCMSpringDataCodingKeyEventTime"), v11);
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->fEventType, (uint64_t)CFSTR("kCMSpringDataCodingKeyEventType"), v13);
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (NSDate)eventTime
{
  return self->fEventTime;
}

- (int64_t)eventType
{
  return self->fEventType;
}

+ (id)eventTypeName:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Max");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("OutOfBid");
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_eventTime(self, v6, v7, v8, v9);
  v15 = objc_msgSend_eventType(self, v11, v12, v13, v14);
  v19 = objc_msgSend_eventTypeName_(CMSleepData, v16, v15, v17, v18);
  return (id)objc_msgSend_stringWithFormat_(v3, v20, (uint64_t)CFSTR("%@, <eventTime, %@, eventType, %@>"), v21, v22, v5, v10, v19);
}

@end
