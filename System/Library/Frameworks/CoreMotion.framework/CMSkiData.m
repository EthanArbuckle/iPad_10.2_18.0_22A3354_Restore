@implementation CMSkiData

- (CMSkiData)initWithRecordId:(unint64_t)a3 sourceId:(id)a4 sessionId:(id)a5 startDate:(id)a6 endDate:(id)a7 runDistance:(double)a8 runAvgSpeed:(double)a9 runMaxSpeed:(double)a10 runSlope:(double)a11 runElevationDescent:(double)a12
{
  CMSkiData *v24;
  CMSkiData *v25;
  void *v27;
  const char *v28;
  objc_super v29;

  if (!a7 || !a4 || !a5 || !a6)
  {
    v27 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSkiData.mm"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceId && sessionId && startDate && endDate"));
  }
  v29.receiver = self;
  v29.super_class = (Class)CMSkiData;
  v24 = -[CMSkiData init](&v29, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->fRecordId = a3;
    v24->fSourceId = (NSUUID *)a4;
    v25->fSessionId = (NSUUID *)a5;
    v25->fStartDate = (NSDate *)a6;
    v25->fEndDate = (NSDate *)a7;
    v25->fRunDistance = a8;
    v25->fRunAvgSpeed = a9;
    v25->fRunMaxSpeed = a10;
    v25->fRunSlope = a11;
    v25->fRunElevationDescent = a12;
  }
  return v25;
}

- (CMSkiData)initWithSessionId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMSkiData *v7;
  CMSkiData *v8;
  void *v11;
  const char *v12;
  objc_super v13;

  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSkiData.mm"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionId"));
  }
  v13.receiver = self;
  v13.super_class = (Class)CMSkiData;
  v7 = -[CMSkiData init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->fRecordId = 0;
    v7->fSourceId = 0;
    v7->fSessionId = (NSUUID *)a3;
    *(_OWORD *)&v8->fStartDate = 0u;
    *(_OWORD *)&v8->fRunDistance = 0u;
    *(_OWORD *)&v8->fRunMaxSpeed = 0u;
    v8->fRunElevationDescent = 0.0;
  }
  return v8;
}

- (CMSkiData)initWithSkiEntry:(const CLSkiEntry *)a3
{
  CMSkiData *v4;
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
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CMSkiData;
  v4 = -[CMSkiData init](&v26, sel_init);
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
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v15, v16, v17, v18, v19, a3->var3);
    v20 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v20, v21, v22, v23, v24, a3->var4);
    v4->fRunDistance = a3->var5;
    v4->fRunAvgSpeed = a3->var6;
    v4->fRunMaxSpeed = a3->var7;
    v4->fRunSlope = a3->var8;
    v4->fRunElevationDescent = a3->var9;
  }
  return v4;
}

- (void)convertToSkiEntry:(CLSkiEntry *)a3
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uuid_t src;
  uuid_t uu;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  memset(src, 0, sizeof(src));
  uuid_clear(uu);
  uuid_clear(src);
  objc_msgSend_getUUIDBytes_(self->fSourceId, v5, (uint64_t)uu, v6, v7);
  objc_msgSend_getUUIDBytes_(self->fSessionId, v8, (uint64_t)src, v9, v10);
  a3->var0 = self->fRecordId;
  uuid_copy(a3->var1, uu);
  uuid_copy(a3->var2, src);
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, v11, v12, v13, v14);
  a3->var3 = v15;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fEndDate, v16, v17, v18, v19);
  a3->var4 = v20;
  a3->var5 = self->fRunDistance;
  a3->var6 = self->fRunAvgSpeed;
  a3->var7 = self->fRunMaxSpeed;
  a3->var8 = self->fRunSlope;
  a3->var9 = self->fRunElevationDescent;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMSkiData;
  -[CMSkiData dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSkiData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMSkiData *v7;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CMSkiData;
  v7 = -[CMSkiData init](&v41, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMSkiDataCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v7->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMSkiDataCodingKeySourceId"), v10);
    v11 = objc_opt_class();
    v7->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMSkiDataCodingKeySessionId"), v13);
    v14 = objc_opt_class();
    v7->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMSkiDataCodingKeyStartDate"), v16);
    v17 = objc_opt_class();
    v7->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMSkiDataCodingKeyEndDate"), v19);
    objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunDistance"), v21, v22);
    v7->fRunDistance = v23;
    objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunAvgSpeed"), v25, v26);
    v7->fRunAvgSpeed = v27;
    objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunMaxSpeed"), v29, v30);
    v7->fRunMaxSpeed = v31;
    objc_msgSend_decodeDoubleForKey_(a3, v32, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunSlope"), v33, v34);
    v7->fRunSlope = v35;
    objc_msgSend_decodeDoubleForKey_(a3, v36, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunElevationDescent"), v37, v38);
    v7->fRunElevationDescent = v39;
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
  return (id)objc_msgSend_initWithRecordId_sourceId_sessionId_startDate_endDate_runDistance_runAvgSpeed_runMaxSpeed_runSlope_runElevationDescent_(v9, v10, self->fRecordId, (uint64_t)self->fSourceId, (uint64_t)self->fSessionId, self->fStartDate, self->fEndDate, self->fRunDistance, self->fRunAvgSpeed, self->fRunMaxSpeed, self->fRunSlope, self->fRunElevationDescent);
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMSkiDataCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kCMSkiDataCodingKeySourceId"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kCMSkiDataCodingKeySessionId"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMSkiDataCodingKeyStartDate"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMSkiDataCodingKeyEndDate"), v13);
  objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunDistance"), v15, v16, self->fRunDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunAvgSpeed"), v18, v19, self->fRunAvgSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v20, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunMaxSpeed"), v21, v22, self->fRunMaxSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v23, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunSlope"), v24, v25, self->fRunSlope);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("kCMSkiDataCodingKeyRunElevationDescent"), v27, v28, self->fRunElevationDescent);
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

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (double)runDistance
{
  return self->fRunDistance;
}

- (double)runAvgSpeed
{
  return self->fRunAvgSpeed;
}

- (double)runMaxSpeed
{
  return self->fRunMaxSpeed;
}

- (double)runSlope
{
  return self->fRunSlope;
}

- (double)runElevationDescent
{
  return self->fRunElevationDescent;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_sessionId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_endDate(self, v16, v17, v18, v19);
  objc_msgSend_runDistance(self, v21, v22, v23, v24);
  v26 = v25;
  objc_msgSend_runAvgSpeed(self, v27, v28, v29, v30);
  v32 = v31;
  objc_msgSend_runMaxSpeed(self, v33, v34, v35, v36);
  v38 = v37;
  objc_msgSend_runSlope(self, v39, v40, v41, v42);
  v44 = v43;
  objc_msgSend_runElevationDescent(self, v45, v46, v47, v48);
  return (id)objc_msgSend_stringWithFormat_(v3, v49, (uint64_t)CFSTR("%@, <sessionId %@, startDate %@, endDate %@, runDistance %.2f, runAvgSpeed %.2f, runMaxSpeed %.2f, runSlope %.2f, runElevationDescent %.2f>"), v50, v51, v5, v10, started, v20, v26, v32, v38, v44, v52);
}

@end
