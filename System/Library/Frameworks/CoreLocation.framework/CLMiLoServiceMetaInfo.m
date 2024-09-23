@implementation CLMiLoServiceMetaInfo

- (CLMiLoServiceMetaInfo)initWithNumClustersLearnedInModel:(id)a3 numRecordingTriggersAtCurrentLOI:(id)a4 numInputValidFingerprints:(id)a5 numInputValidFingerprintsLabeled:(id)a6 numInputValidFingerprintsUnlabeled:(id)a7 numFingerprintsBeforePruning:(id)a8 numFingerprintsAfterPruning:(id)a9 numWiFiAccessPoints:(id)a10 numBLESources:(id)a11 numUWBSources:(id)a12
{
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CLMiLoServiceMetaInfo *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
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
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)CLMiLoServiceMetaInfo;
  v21 = -[CLMiLoServiceMetaInfo init](&v50, sel_init);
  if (v21)
  {
    v21->_numberOfClustersLearnedInModel = (NSNumber *)objc_msgSend_copy(a3, v18, v19, v20);
    v21->_numberOfRecordingTriggersAtCurrentLocationOfInterest = (NSNumber *)objc_msgSend_copy(a4, v22, v23, v24);
    v21->_numberOfInputValidFingerprints = (NSNumber *)objc_msgSend_copy(a5, v25, v26, v27);
    v21->_numberOfInputValidFingerprintsLabeled = (NSNumber *)objc_msgSend_copy(a6, v28, v29, v30);
    v21->_numberOfInputValidFingerprintsUnLabeled = (NSNumber *)objc_msgSend_copy(a7, v31, v32, v33);
    v21->_numberOfFingerprintsBeforePruning = (NSNumber *)objc_msgSend_copy(a8, v34, v35, v36);
    v21->_numberOfFingerprintsAfterPruning = (NSNumber *)objc_msgSend_copy(a9, v37, v38, v39);
    v21->_numberOfWiFiAccessPoints = (NSNumber *)objc_msgSend_copy(a10, v40, v41, v42);
    v21->_numberOfBLESources = (NSNumber *)objc_msgSend_copy(a11, v43, v44, v45);
    v21->_numberOfUWBSources = (NSNumber *)objc_msgSend_copy(a12, v46, v47, v48);
  }
  return v21;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServiceMetaInfo;
  -[CLMiLoServiceMetaInfo dealloc](&v3, sel_dealloc);
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
  return (id)objc_msgSend_initWithNumClustersLearnedInModel_numRecordingTriggersAtCurrentLOI_numInputValidFingerprints_numInputValidFingerprintsLabeled_numInputValidFingerprintsUnlabeled_numFingerprintsBeforePruning_numFingerprintsAfterPruning_numWiFiAccessPoints_numBLESources_numUWBSources_(v8, v9, (uint64_t)self->_numberOfClustersLearnedInModel, (uint64_t)self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, self->_numberOfInputValidFingerprints, self->_numberOfInputValidFingerprintsLabeled, self->_numberOfInputValidFingerprintsUnLabeled, self->_numberOfFingerprintsBeforePruning, self->_numberOfFingerprintsAfterPruning, self->_numberOfWiFiAccessPoints, self->_numberOfBLESources, self->_numberOfUWBSources);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceMetaInfo)initWithCoder:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v35;

  v4 = objc_opt_class();
  v35 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v5, v4, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfClustersInModel"));
  v6 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfRecordingTriggersAtCurrentLocationOfInterest"));
  v9 = objc_opt_class();
  v11 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprints"));
  v12 = objc_opt_class();
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprintsLabeled"));
  v15 = objc_opt_class();
  v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprintsUnLabeled"));
  v18 = objc_opt_class();
  v20 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfFingerprintsBeforePruning"));
  v21 = objc_opt_class();
  v23 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfFingerprintsAfterPruning"));
  v24 = objc_opt_class();
  v26 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v25, v24, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfWiFiAccessPoints"));
  v27 = objc_opt_class();
  v29 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfBLESources"));
  v30 = objc_opt_class();
  v32 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v31, v30, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfUWBSources"));
  return (CLMiLoServiceMetaInfo *)objc_msgSend_initWithNumClustersLearnedInModel_numRecordingTriggersAtCurrentLOI_numInputValidFingerprints_numInputValidFingerprintsLabeled_numInputValidFingerprintsUnlabeled_numFingerprintsBeforePruning_numFingerprintsAfterPruning_numWiFiAccessPoints_numBLESources_numUWBSources_(self, v33, v35, v8, v11, v14, v17, v20, v23, v26, v29, v32);
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
  const char *v13;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_numberOfClustersLearnedInModel, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfClustersInModel"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfRecordingTriggersAtCurrentLocationOfInterest"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_numberOfInputValidFingerprints, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprints"));
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_numberOfInputValidFingerprintsLabeled, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprintsLabeled"));
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_numberOfInputValidFingerprintsUnLabeled, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprintsUnLabeled"));
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_numberOfFingerprintsBeforePruning, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfFingerprintsBeforePruning"));
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_numberOfFingerprintsAfterPruning, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfFingerprintsAfterPruning"));
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_numberOfWiFiAccessPoints, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfWiFiAccessPoints"));
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_numberOfBLESources, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfBLESources"));
  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)self->_numberOfUWBSources, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyNumberOfUWBSources"));
}

- (NSNumber)numberOfClustersLearnedInModel
{
  return self->_numberOfClustersLearnedInModel;
}

- (NSNumber)numberOfRecordingTriggersAtCurrentLocationOfInterest
{
  return self->_numberOfRecordingTriggersAtCurrentLocationOfInterest;
}

- (NSNumber)numberOfInputValidFingerprints
{
  return self->_numberOfInputValidFingerprints;
}

- (NSNumber)numberOfInputValidFingerprintsLabeled
{
  return self->_numberOfInputValidFingerprintsLabeled;
}

- (NSNumber)numberOfInputValidFingerprintsUnLabeled
{
  return self->_numberOfInputValidFingerprintsUnLabeled;
}

- (NSNumber)numberOfFingerprintsBeforePruning
{
  return self->_numberOfFingerprintsBeforePruning;
}

- (NSNumber)numberOfFingerprintsAfterPruning
{
  return self->_numberOfFingerprintsAfterPruning;
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

@end
