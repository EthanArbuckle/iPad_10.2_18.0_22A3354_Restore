@implementation VNFeaturePrintObservation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VNElementType)elementType
{
  return 0;
}

- (NSUInteger)elementCount
{
  return 0;
}

- (NSData)data
{
  return (NSData *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", 0, 0);
}

- (BOOL)computeDistance:(float *)outDistance toFeaturePrintObservation:(VNFeaturePrintObservation *)featurePrint error:(NSError *)error
{
  VNFeaturePrintObservation *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  vDSP_Length v12;
  void *v13;
  uint64_t v14;
  VNElementType v15;
  const float *v16;
  const float *v17;
  float v18;
  BOOL v19;
  void *v20;
  float __C;

  v8 = featurePrint;
  __C = NAN;
  v9 = -[VNObservation requestRevision](self, "requestRevision");
  if (v9 == -[VNObservation requestRevision](v8, "requestRevision"))
  {
    -[VNFeaturePrintObservation data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    v12 = -[VNFeaturePrintObservation elementCount](self, "elementCount");
    -[VNFeaturePrintObservation data](v8, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    v15 = -[VNFeaturePrintObservation elementType](self, "elementType");
    if (v15 == -[VNFeaturePrintObservation elementType](v8, "elementType")
      && -[VNFeaturePrintObservation elementType](self, "elementType") == VNElementTypeFloat
      && v12 == -[VNFeaturePrintObservation elementCount](v8, "elementCount")
      && v11 == v14)
    {
      v16 = (const float *)objc_msgSend(objc_retainAutorelease(v10), "bytes");
      v17 = (const float *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
      if (v16 && v17)
      {
        vDSP_distancesq(v16, 1, v17, 1, &__C, v12);
        v18 = sqrtf(__C);
        __C = v18;
        if (outDistance)
          *outDistance = v18;
        v19 = 1;
        goto LABEL_20;
      }
      if (error)
      {
        +[VNError errorForUnknownErrorWithLocalizedDescription:](VNError, "errorForUnknownErrorWithLocalizedDescription:", CFSTR("One or more of the feature prints are empty"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else if (error)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 12, CFSTR("The observations do not have a feature print that match each others format"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v19 = 0;
      *error = (NSError *)v20;
LABEL_20:

      goto LABEL_21;
    }
    v19 = 0;
    goto LABEL_20;
  }
  if (error)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 12, CFSTR("The revision of the observations do not match"));
    v19 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_21:

  return v19;
}

- (float)computeDistanceToFeaturePrintObservation:(id)a3 error:(id *)a4
{
  float v5;

  v5 = NAN;
  -[VNFeaturePrintObservation computeDistance:toFeaturePrintObservation:error:](self, "computeDistance:toFeaturePrintObservation:error:", &v5, a3, a4);
  return v5;
}

@end
