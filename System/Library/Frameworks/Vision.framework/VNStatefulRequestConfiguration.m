@implementation VNStatefulRequestConfiguration

- (VNStatefulRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNStatefulRequestConfiguration *v3;
  uint64_t v4;
  NSUUID *requestUUID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNStatefulRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v7, sel_initWithRequestClass_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = objc_claimAutoreleasedReturnValue();
    requestUUID = v3->_requestUUID;
    v3->_requestUUID = (NSUUID *)v4;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  int64_t epoch;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNStatefulRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 18, self->_requestUUID);
    epoch = self->_frameAnalysisSpacing.epoch;
    *(_OWORD *)(v5 + 19) = *(_OWORD *)&self->_frameAnalysisSpacing.value;
    v5[21] = (id)epoch;
  }
  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameAnalysisSpacing
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_frameAnalysisSpacing, 24, 1, 0);
  return result;
}

- (void)setFrameAnalysisSpacing:(id *)a3
{
  objc_copyStruct(&self->_frameAnalysisSpacing, a3, 24, 1, 0);
}

- (NSUUID)requestUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
