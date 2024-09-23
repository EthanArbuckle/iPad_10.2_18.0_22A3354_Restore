@implementation CMFitnessPlusWorkout

+ (BOOL)isAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return objc_msgSend_isAvailable(CMWorkout, v2, v3, v4, v5);
}

- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6
{
  uint64_t v10;
  const char *v11;

  v10 = objc_msgSend_UUIDString(a5, a2, (uint64_t)a3, a4, (uint64_t)a5);
  return (CMFitnessPlusWorkout *)objc_msgSend_initWithSessionId_type_catalogWorkoutId_mediaType_error_(self, v11, (uint64_t)a3, a4, v10, a6, 0);
}

- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6 error:(id *)a7
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CMFitnessPlusWorkout *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)CMFitnessPlusWorkout;
  v14 = -[CMWorkout initWithSessionId:type:](&v19, sel_initWithSessionId_type_, a3, a4);
  if (v14)
  {
    if (a5 && (unint64_t)objc_msgSend_length(a5, v10, v11, v12, v13) <= 0x3F)
    {
      v14->fCatalogWorkoutId = (NSString *)a5;
    }
    else
    {
      v14->fCatalogWorkoutId = (NSString *)CFSTR("Invalid");
      if (a7)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v20 = *MEMORY[0x1E0CB2D50];
        v21[0] = CFSTR("catalogWorkoutId string too long");
        v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v21, (uint64_t)&v20, 1);
        *a7 = (id)objc_msgSend_errorWithDomain_code_userInfo_(v15, v17, (uint64_t)CFSTR("CMErrorDomain"), 107, v16);
      }
    }
    v14->fMediaType = a6;
  }
  return v14;
}

- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6 locationType:(int64_t)a7 error:(id *)a8
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  if (objc_msgSend_initWithSessionId_type_catalogWorkoutId_mediaType_error_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6, a8))
  {
    objc_msgSend_setLocationType_(self, v10, a7, v11, v12);
  }
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMFitnessPlusWorkout;
  -[CMWorkout dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMFitnessPlusWorkout)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMFitnessPlusWorkout *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CMFitnessPlusWorkout;
  v7 = -[CMWorkout initWithCoder:](&v18, sel_initWithCoder_);
  if (v7)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyFitnessPlusCatalogWorkoutId"), v5, v6))
    {
      v11 = objc_opt_class();
      v7->fCatalogWorkoutId = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyFitnessPlusCatalogWorkoutId"), v13);
    }
    if (objc_msgSend_containsValueForKey_(a3, v8, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyFitnessPlusMediaType"), v9, v10))v7->fMediaType = objc_msgSend_decodeIntegerForKey_(a3, v14, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyFitnessPlusMediaType"), v15, v16);
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_sessionId(self, v10, v11, v12, v13);
  v19 = objc_msgSend_type(self, v15, v16, v17, v18);
  v24 = objc_msgSend_catalogWorkoutId(self, v20, v21, v22, v23);
  v29 = objc_msgSend_mediaType(self, v25, v26, v27, v28);
  v31 = (void *)objc_msgSend_initWithSessionId_type_catalogWorkoutId_mediaType_error_(v9, v30, v14, v19, v24, v29, 0);
  v36 = objc_msgSend_locationType(self, v32, v33, v34, v35);
  objc_msgSend_setLocationType_(v31, v37, v36, v38, v39);
  v44 = objc_msgSend_mode(self, v40, v41, v42, v43);
  objc_msgSend_setWorkoutMode_(v31, v45, v44, v46, v47);
  v52 = objc_msgSend_appId(self, v48, v49, v50, v51);
  objc_msgSend_setAppId_(v31, v53, v52, v54, v55);
  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMFitnessPlusWorkout;
  -[CMWorkout encodeWithCoder:](&v9, sel_encodeWithCoder_);
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fCatalogWorkoutId, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyFitnessPlusCatalogWorkoutId"), v6);
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->fMediaType, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyFitnessPlusMediaType"), v8);
}

- (NSString)catalogWorkoutId
{
  return self->fCatalogWorkoutId;
}

- (int64_t)mediaType
{
  return self->fMediaType;
}

+ (id)mediaTypeName:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_1E2956350[a3];
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
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_sessionId(self, v6, v7, v8, v9);
  v15 = objc_msgSend_type(self, v11, v12, v13, v14);
  v19 = objc_msgSend_workoutName_(CMWorkout, v16, v15, v17, v18);
  v24 = objc_msgSend_locationType(self, v20, v21, v22, v23);
  v28 = objc_msgSend_workoutLocationName_(CMWorkout, v25, v24, v26, v27);
  v33 = objc_msgSend_catalogWorkoutId(self, v29, v30, v31, v32);
  v38 = objc_msgSend_mediaType(self, v34, v35, v36, v37);
  v42 = objc_msgSend_mediaTypeName_(CMFitnessPlusWorkout, v39, v38, v40, v41);
  return (id)objc_msgSend_stringWithFormat_(v3, v43, (uint64_t)CFSTR("%@, <sessionId %@, type, %@, locationType, %@, catalogWorkoutId, %@, mediaType, %@>"), v44, v45, v5, v10, v19, v28, v33, v42);
}

+ (id)fitnessPlusWorkoutInstance:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(a3, v5, v4, v6, v7))
    return a3;
  else
    return 0;
}

@end
