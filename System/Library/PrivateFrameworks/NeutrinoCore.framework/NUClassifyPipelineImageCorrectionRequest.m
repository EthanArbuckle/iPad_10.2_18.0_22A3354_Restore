@implementation NUClassifyPipelineImageCorrectionRequest

- (NUClassifyPipelineImageCorrectionRequest)initWithComposition:(id)a3
{
  NUClassifyPipelineImageCorrectionRequest *v3;
  uint64_t v4;
  NUScalePolicy *scalePolicy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUClassifyPipelineImageCorrectionRequest;
  v3 = -[NURenderRequest initWithComposition:](&v7, sel_initWithComposition_, a3);
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
  v7.super_class = (Class)NUClassifyPipelineImageCorrectionRequest;
  v4 = -[NURenderRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 19, self->_scalePolicy);
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUClassifyPipelineImageCorrectionRequest;
  -[NURenderRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUClassifyPipelineImageCorrectionRequest scalePolicy](self, "scalePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" Scale Policy: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)newRenderJob
{
  return -[NUClassifyPipelineImageCorrectionJob initWithClassifyPipelineImageCorrectionRequest:]([NUClassifyPipelineImageCorrectionJob alloc], "initWithClassifyPipelineImageCorrectionRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 152, 1);
}

- (void)setScalePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

@end
