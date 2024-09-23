@implementation VNTrackLegacyFaceCoreObjectRequest

- (VNTrackLegacyFaceCoreObjectRequest)initWithDetectedObjectObservation:(id)a3
{
  VNTrackLegacyFaceCoreObjectRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNTrackLegacyFaceCoreObjectRequest;
  result = -[VNTrackObjectRequest initWithDetectedObjectObservation:](&v4, sel_initWithDetectedObjectObservation_, a3);
  if (result)
    result->_faceCoreKalmanFilter = 0.5;
  return result;
}

- (void)populateDetectorProcessingOptions:(id)a3 session:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[VNTrackLegacyFaceCoreObjectRequest faceCoreMinFaceSize](self, "faceCoreMinFaceSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_MinFaceSize"));

  -[VNTrackLegacyFaceCoreObjectRequest faceCoreNumberOfDetectionAngles](self, "faceCoreNumberOfDetectionAngles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_NumberOfDetectionAngles"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNTrackLegacyFaceCoreObjectRequest faceCoreEnhanceEyesAndMouthLocalization](self, "faceCoreEnhanceEyesAndMouthLocalization"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("VNTrackObjectPrivateRevisionLegacyCoreProcessOption_EnhanceEyesAndMouthLocalization"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNTrackLegacyFaceCoreObjectRequest faceCoreExtractBlink](self, "faceCoreExtractBlink"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_ExtractBlink"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNTrackLegacyFaceCoreObjectRequest faceCoreExtractSmile](self, "faceCoreExtractSmile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_ExtractSmile"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[VNTrackLegacyFaceCoreObjectRequest faceCoreKalmanFilter](self, "faceCoreKalmanFilter");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_KalmanFilter"));

}

- (NSNumber)faceCoreMinFaceSize
{
  return self->_faceCoreMinFaceSize;
}

- (void)setFaceCoreMinFaceSize:(id)a3
{
  objc_storeStrong((id *)&self->_faceCoreMinFaceSize, a3);
}

- (NSNumber)faceCoreNumberOfDetectionAngles
{
  return self->_faceCoreNumberOfDetectionAngles;
}

- (void)setFaceCoreNumberOfDetectionAngles:(id)a3
{
  objc_storeStrong((id *)&self->_faceCoreNumberOfDetectionAngles, a3);
}

- (BOOL)faceCoreEnhanceEyesAndMouthLocalization
{
  return self->_faceCoreEnhanceEyesAndMouthLocalization;
}

- (void)setFaceCoreEnhanceEyesAndMouthLocalization:(BOOL)a3
{
  self->_faceCoreEnhanceEyesAndMouthLocalization = a3;
}

- (BOOL)faceCoreExtractBlink
{
  return self->_faceCoreExtractBlink;
}

- (void)setFaceCoreExtractBlink:(BOOL)a3
{
  self->_faceCoreExtractBlink = a3;
}

- (BOOL)faceCoreExtractSmile
{
  return self->_faceCoreExtractSmile;
}

- (void)setFaceCoreExtractSmile:(BOOL)a3
{
  self->_faceCoreExtractSmile = a3;
}

- (float)faceCoreKalmanFilter
{
  return self->_faceCoreKalmanFilter;
}

- (void)setFaceCoreKalmanFilter:(float)a3
{
  self->_faceCoreKalmanFilter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCoreNumberOfDetectionAngles, 0);
  objc_storeStrong((id *)&self->_faceCoreMinFaceSize, 0);
}

+ (unint64_t)defaultRevision
{
  return 3737841664;
}

+ (id)publicRevisionsSet
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

+ (id)privateRevisionsSet
{
  if (+[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::onceToken, &__block_literal_global_19807);
  return (id)+[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 3737841664)
  {
    v4 = CFSTR("VNObjectTrackerRevisionLegacyFaceCoreType");
    v5 = CFSTR("VNObjectTrackerRevisionLegacyFaceCoreType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3
{
  return 1111970369;
}

void __57__VNTrackLegacyFaceCoreObjectRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF000uLL, a2, a3, a4, a5, a6, a7, a8, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

@end
