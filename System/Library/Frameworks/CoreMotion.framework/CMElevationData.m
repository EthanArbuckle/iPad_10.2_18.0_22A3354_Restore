@implementation CMElevationData

- (CMElevationData)initWithSignificantElevationSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t started;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  void *v48;
  const char *v49;

  if (!a3)
  {
    v48 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMElevationData.mm"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sample"));
  }
  started = objc_msgSend_startDate(a3, a2, (uint64_t)a3, v3, v4);
  v12 = objc_msgSend_endDate(a3, v8, v9, v10, v11);
  v17 = (void *)objc_msgSend_elevationAscended(a3, v13, v14, v15, v16);
  objc_msgSend_doubleValue(v17, v18, v19, v20, v21);
  v23 = (unint64_t)(v22 * 100.0);
  v28 = (void *)objc_msgSend_elevationDescended(a3, v24, v25, v26, v27);
  objc_msgSend_doubleValue(v28, v29, v30, v31, v32);
  v34 = (unint64_t)(v33 * 100.0);
  v39 = objc_msgSend_recordId(a3, v35, v36, v37, v38);
  v44 = objc_msgSend_sourceId(a3, v40, v41, v42, v43);
  return (CMElevationData *)objc_msgSend_initWithStartDate_endDate_elevationAscended_elevationDescended_source_recordId_sourceId_(self, v45, started, v12, v23, v34, 1000, v39, v44);
}

- (CMElevationData)initWithStartDate:(id)a3 endDate:(id)a4 elevationAscended:(unint64_t)a5 elevationDescended:(unint64_t)a6 source:(int64_t)a7 recordId:(unint64_t)a8 sourceId:(id)a9
{
  CMElevationData *v17;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  objc_super v23;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMElevationData.mm"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));
    if (a4)
      goto LABEL_3;
  }
  v21 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, a5);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMElevationData.mm"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));
LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)CMElevationData;
  v17 = -[CMElevationData init](&v23, sel_init);
  if (v17)
  {
    v17->fStartDate = (NSDate *)a3;
    v17->fEndDate = (NSDate *)a4;
    v17->fElevationAscended = a5;
    v17->fElevationDescended = a6;
    v17->fSource = a7;
    v17->fRecordId = a8;
    v17->fSourceId = (NSUUID *)a9;
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMElevationData;
  -[CMElevationData dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMElevationData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMElevationData *v7;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CMElevationData;
  v7 = -[CMElevationData init](&v27, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMElevationDataCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v7->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMElevationDataCodingKeySourceId"), v10);
    v11 = objc_opt_class();
    v7->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMElevationDataCodingKeyStartDate"), v13);
    v14 = objc_opt_class();
    v7->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMElevationDataCodingKeyEndDate"), v16);
    v7->fElevationAscended = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("kCMElevationDataCodingKeyElevationAscended"), v18, v19);
    v7->fElevationDescended = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("kCMElevationDataCodingKeyElevationDescended"), v21, v22);
    v7->fSource = objc_msgSend_decodeIntegerForKey_(a3, v23, (uint64_t)CFSTR("kCMElevationDataCodingKeySource"), v24, v25);
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
  return (id)objc_msgSend_initWithStartDate_endDate_elevationAscended_elevationDescended_source_recordId_sourceId_(v9, v10, (uint64_t)self->fStartDate, (uint64_t)self->fEndDate, self->fElevationAscended, self->fElevationDescended, self->fSource, self->fRecordId, self->fSourceId);
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
  const char *v16;
  uint64_t v17;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMElevationDataCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kCMElevationDataCodingKeySourceId"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMElevationDataCodingKeyStartDate"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMElevationDataCodingKeyEndDate"), v11);
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->fElevationAscended, (uint64_t)CFSTR("kCMElevationDataCodingKeyElevationAscended"), v13);
  objc_msgSend_encodeInteger_forKey_(a3, v14, self->fElevationDescended, (uint64_t)CFSTR("kCMElevationDataCodingKeyElevationDescended"), v15);
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->fSource, (uint64_t)CFSTR("kCMElevationDataCodingKeySource"), v17);
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

- (unint64_t)elevationAscended
{
  return self->fElevationAscended;
}

- (unint64_t)elevationDescended
{
  return self->fElevationDescended;
}

- (int64_t)source
{
  return self->fSource;
}

+ (id)sourceName:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 0:
      result = CFSTR("Phone");
      break;
    case 1:
      result = CFSTR("Watch");
      break;
    case 2:
      result = CFSTR("WatchDEM");
      break;
    case 3:
      result = CFSTR("WatchGPS");
      break;
    default:
      if (a3 == 1000)
        result = CFSTR("None");
      else
        result = 0;
      break;
  }
  return result;
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
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_elevationAscended(self, v16, v17, v18, v19);
  v25 = objc_msgSend_elevationDescended(self, v21, v22, v23, v24);
  v30 = objc_msgSend_source(self, v26, v27, v28, v29);
  v34 = objc_msgSend_sourceName_(CMElevationData, v31, v30, v32, v33);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v35, (uint64_t)CFSTR("%@, <startDate, %@, endDate, %@, elevationAscended, %lu, elevationDescended, %lu, source, %@>"), v36, v37, v5, started, v15, v20, v25, v34);
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

- (CMElevationData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMElevationData *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMElevationData;
    v8 = -[CMElevationData init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMElevationData *)v13;
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
