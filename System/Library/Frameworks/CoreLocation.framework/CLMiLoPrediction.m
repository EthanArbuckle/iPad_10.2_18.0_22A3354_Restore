@implementation CLMiLoPrediction

- (CLMiLoPrediction)initWithPlacePredictions:(id)a3 locationSimilarityList:(id)a4 closeDeviceList:(id)a5 error:(id)a6 requestIdentifier:(id)a7 predictionTime:(id)a8 confidence:(unint64_t)a9 placeConfidenceReasons:(id)a10 localizationFingerprintMetaInfo:(id)a11
{
  CLMiLoPrediction *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLMiLoPrediction;
  v17 = -[CLMiLoPrediction init](&v19, sel_init);
  if (v17)
  {
    v17->_placePredictions = (NSArray *)a3;
    v17->_locationSimilarityList = (CLMiLoServicePredictionLocationSimilarityList *)a4;
    v17->_closeDeviceList = (CLMiLoPredictionCloseDeviceList *)a5;
    v17->_error = (NSError *)a6;
    v17->_requestIdentifier = (NSUUID *)a7;
    v17->_predictionTime = (NSDate *)a8;
    v17->_confidence = a9;
    v17->_placeConfidenceReasons = (NSArray *)a10;
    v17->_localizationFingerprintMetaInfo = (CLMiLoFingerprintMetaInfo *)a11;
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPrediction;
  -[CLMiLoPrediction dealloc](&v3, sel_dealloc);
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
  return (id)objc_msgSend_initWithPlacePredictions_locationSimilarityList_closeDeviceList_error_requestIdentifier_predictionTime_confidence_placeConfidenceReasons_localizationFingerprintMetaInfo_(v8, v9, (uint64_t)self->_placePredictions, (uint64_t)self->_locationSimilarityList, self->_closeDeviceList, self->_error, self->_requestIdentifier, self->_predictionTime, self->_confidence, self->_placeConfidenceReasons, self->_localizationFingerprintMetaInfo);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPrediction)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v9 = objc_msgSend_setWithObjects_(v4, v7, v5, v8, v6, 0);
  v11 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v10, v9, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionPlacePredictions"));
  v12 = objc_opt_class();
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionLocationSimilarityList"));
  v15 = objc_opt_class();
  v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionCloseDeviceList"));
  v18 = objc_opt_class();
  v20 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionError"));
  v21 = objc_opt_class();
  v23 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionRequestIdentifier"));
  v24 = objc_opt_class();
  v26 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v25, v24, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionTime"));
  v29 = objc_msgSend_decodeIntegerForKey_(a3, v27, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceConfidenceEnum"), v28);
  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v35 = objc_msgSend_setWithObjects_(v30, v33, v31, v34, v32, 0);
  v37 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v36, v35, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceConfidenceReasons"));
  v38 = objc_opt_class();
  v40 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v39, v38, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocalizationFingerprintMetaInfo"));
  return (CLMiLoPrediction *)objc_msgSend_initWithPlacePredictions_locationSimilarityList_closeDeviceList_error_requestIdentifier_predictionTime_confidence_placeConfidenceReasons_localizationFingerprintMetaInfo_(self, v41, v11, v14, v17, v20, v23, v26, v29, v37, v40);
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

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_placePredictions, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionPlacePredictions"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_locationSimilarityList, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionLocationSimilarityList"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_closeDeviceList, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionCloseDeviceList"));
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_error, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionError"));
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_requestIdentifier, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionRequestIdentifier"));
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_predictionTime, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPredictionTime"));
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_confidence, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceConfidenceEnum"));
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_placeConfidenceReasons, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceConfidenceReasons"));
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_localizationFingerprintMetaInfo, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocalizationFingerprintMetaInfo"));
}

- (NSArray)placePredictions
{
  return self->_placePredictions;
}

- (CLMiLoServicePredictionLocationSimilarityList)locationSimilarityList
{
  return self->_locationSimilarityList;
}

- (CLMiLoPredictionCloseDeviceList)closeDeviceList
{
  return self->_closeDeviceList;
}

- (NSError)error
{
  return self->_error;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSDate)predictionTime
{
  return self->_predictionTime;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (NSArray)placeConfidenceReasons
{
  return self->_placeConfidenceReasons;
}

- (CLMiLoFingerprintMetaInfo)localizationFingerprintMetaInfo
{
  return self->_localizationFingerprintMetaInfo;
}

@end
