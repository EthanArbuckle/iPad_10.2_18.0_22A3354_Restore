@implementation NUFaceDetectionRequest

- (NUFaceDetectionRequest)initWithComposition:(id)a3
{
  NUFaceDetectionRequest *v3;
  uint64_t v4;
  NUScalePolicy *scalePolicy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUFaceDetectionRequest;
  v3 = -[NURenderRequest initWithComposition:](&v7, sel_initWithComposition_, a3);
  v3->_maxFaceCount = 0x7FFFFFFFFFFFFFFFLL;
  +[NUFixedScalePolicy oneToOneScalePolicy](NUFixedScalePolicy, "oneToOneScalePolicy");
  v4 = objc_claimAutoreleasedReturnValue();
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUFaceDetectionRequest;
  v4 = -[NURenderRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[19] = (id)self->_maxFaceCount;
    objc_storeStrong(v4 + 20, self->_scalePolicy);
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUFaceDetectionRequest;
  -[NURenderRequest description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NUFaceDetectionRequest maxFaceCount](self, "maxFaceCount");
  -[NUFaceDetectionRequest scalePolicy](self, "scalePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" Max Face Count: %ld, Scale Policy: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)newRenderJob
{
  return -[NUFaceDetectionJob initWithFaceDetectionRequest:]([NUFaceDetectionJob alloc], "initWithFaceDetectionRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (int64_t)maxFaceCount
{
  return self->_maxFaceCount;
}

- (void)setMaxFaceCount:(int64_t)a3
{
  self->_maxFaceCount = a3;
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 160, 1);
}

- (void)setScalePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

@end
