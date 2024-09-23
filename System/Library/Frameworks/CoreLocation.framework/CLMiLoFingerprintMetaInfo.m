@implementation CLMiLoFingerprintMetaInfo

- (CLMiLoFingerprintMetaInfo)initWithNumWiFiAccessPoints:(id)a3 numBLESources:(id)a4 numUWBSources:(id)a5 requestIdentifier:(id)a6 errors:(id)a7
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CLMiLoFingerprintMetaInfo *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CLMiLoFingerprintMetaInfo;
  v15 = -[CLMiLoFingerprintMetaInfo init](&v26, sel_init);
  if (v15)
  {
    v15->_numberOfWiFiAccessPoints = (NSNumber *)objc_msgSend_copy(a3, v12, v13, v14);
    v15->_numberOfBLESources = (NSNumber *)objc_msgSend_copy(a4, v16, v17, v18);
    v15->_numberOfUWBSources = (NSNumber *)objc_msgSend_copy(a5, v19, v20, v21);
    v15->_requestIdentifier = (NSUUID *)objc_msgSend_copy(a6, v22, v23, v24);
    v15->_errors = (NSArray *)a7;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoFingerprintMetaInfo;
  -[CLMiLoFingerprintMetaInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithNumWiFiAccessPoints_numBLESources_numUWBSources_requestIdentifier_errors_, self->_numberOfWiFiAccessPoints, self->_numberOfBLESources);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoFingerprintMetaInfo)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfWiFiAccessPoints"));
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfBLESources"));
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfUWBSources"));
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyObservationMetaInfoRequestIdentifier"));
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v20 = objc_msgSend_setWithObjects_(v15, v18, v16, v19, v17, 0);
  objc_msgSend_decodeObjectOfClasses_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyFingerprintErrors"));
  return (CLMiLoFingerprintMetaInfo *)MEMORY[0x1E0DE7D20](self, sel_initWithNumWiFiAccessPoints_numBLESources_numUWBSources_requestIdentifier_errors_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_numberOfWiFiAccessPoints, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfWiFiAccessPoints"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_numberOfBLESources, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfBLESources"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_numberOfUWBSources, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfUWBSources"));
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_requestIdentifier, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyObservationMetaInfoRequestIdentifier"));
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_errors, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyFingerprintErrors"));
}

- (NSNumber)numberOfWiFiAccessPoints
{
  return self->_numberOfWiFiAccessPoints;
}

- (NSNumber)numberOfBLESources
{
  return self->_numberOfBLESources;
}

- (NSNumber)numberOfUWBSources
{
  return self->_numberOfUWBSources;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSArray)errors
{
  return self->_errors;
}

@end
