@implementation CLMiLoServiceStatus

- (CLMiLoServiceStatus)initWithServiceState:(unint64_t)a3 suspendReasons:(id)a4 serviceDescriptor:(id)a5 currentLocationOfInterestUuid:(id)a6 currentLocationOfInterestType:(id)a7 error:(id)a8 serviceQualityInfo:(id)a9 places:(id)a10 metaInfo:(id)a11
{
  CLMiLoServiceStatus *v17;
  CLMiLoServiceStatus *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CLMiLoServiceStatus;
  v17 = -[CLMiLoServiceStatus init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_serviceState = a3;
    v17->_serviceSuspendReasons = (NSArray *)a4;
    v18->_serviceDescriptor = (CLMiLoServiceDescriptor *)a5;
    v18->_currentLocationOfInterestUuid = (NSUUID *)objc_msgSend_copy(a6, v19, v20, v21);
    v18->_currentLocationOfInterestType = (CLMiLoLocationType *)a7;
    v18->_error = (NSError *)a8;
    v18->_serviceQualityInfo = (CLMiLoServiceQualityInfo *)a9;
    v18->_places = (NSArray *)a10;
    v18->_metaInfo = (CLMiLoServiceMetaInfo *)a11;
  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServiceStatus;
  -[CLMiLoServiceStatus dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithServiceState_suspendReasons_serviceDescriptor_currentLocationOfInterestUuid_currentLocationOfInterestType_error_serviceQualityInfo_places_metaInfo_(v8, v9, self->_serviceState, (uint64_t)self->_serviceSuspendReasons, self->_serviceDescriptor, self->_currentLocationOfInterestUuid, self->_currentLocationOfInterestType, self->_error, self->_serviceQualityInfo, self->_places, self->_metaInfo);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceStatus)initWithCoder:(id)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
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
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v41;

  v41 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceState"), v3);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v7, 0);
  v12 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceSuspendReasons"));
  v13 = objc_opt_class();
  v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceDescriptor"));
  v16 = objc_opt_class();
  v18 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyCurrentLocationOfInterestUuid"));
  v19 = objc_opt_class();
  v21 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyCurrentLocationOfInterestType"));
  v22 = objc_opt_class();
  v24 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v22, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceError"));
  v25 = objc_opt_class();
  v27 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v26, v25, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceQualityInfo"));
  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v33 = objc_msgSend_setWithObjects_(v28, v31, v29, v32, v30, 0);
  v35 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v34, v33, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaces"));
  v36 = objc_opt_class();
  v38 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v37, v36, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceMetaInfo"));
  return (CLMiLoServiceStatus *)objc_msgSend_initWithServiceState_suspendReasons_serviceDescriptor_currentLocationOfInterestUuid_currentLocationOfInterestType_error_serviceQualityInfo_places_metaInfo_(self, v39, v41, v12, v15, v18, v21, v24, v27, v35, v38);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_serviceState, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceState"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_serviceSuspendReasons, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceSuspendReasons"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_serviceDescriptor, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceDescriptor"));
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_currentLocationOfInterestUuid, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyCurrentLocationOfInterestUuid"));
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_currentLocationOfInterestType, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyCurrentLocationOfInterestType"));
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_error, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceError"));
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_serviceQualityInfo, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceQualityInfo"));
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_places, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaces"));
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_metaInfo, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceMetaInfo"));
}

- (unint64_t)serviceState
{
  return self->_serviceState;
}

- (NSArray)serviceSuspendReasons
{
  return self->_serviceSuspendReasons;
}

- (CLMiLoServiceDescriptor)serviceDescriptor
{
  return self->_serviceDescriptor;
}

- (NSUUID)currentLocationOfInterestUuid
{
  return self->_currentLocationOfInterestUuid;
}

- (CLMiLoLocationType)currentLocationOfInterestType
{
  return self->_currentLocationOfInterestType;
}

- (NSError)error
{
  return self->_error;
}

- (CLMiLoServiceQualityInfo)serviceQualityInfo
{
  return self->_serviceQualityInfo;
}

- (NSArray)places
{
  return self->_places;
}

- (CLMiLoServiceMetaInfo)metaInfo
{
  return self->_metaInfo;
}

@end
