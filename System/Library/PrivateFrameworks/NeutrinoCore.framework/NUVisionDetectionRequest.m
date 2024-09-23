@implementation NUVisionDetectionRequest

- (NUVisionDetectionRequest)initWithComposition:(id)a3
{
  NUVisionDetectionRequest *v3;
  uint64_t v4;
  NUScalePolicy *scalePolicy;
  NSArray *visionRequests;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUVisionDetectionRequest;
  v3 = -[NURenderRequest initWithComposition:](&v8, sel_initWithComposition_, a3);
  +[NUFixedScalePolicy oneToOneScalePolicy](NUFixedScalePolicy, "oneToOneScalePolicy");
  v4 = objc_claimAutoreleasedReturnValue();
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  visionRequests = v3->_visionRequests;
  v3->_visionRequests = (NSArray *)MEMORY[0x1E0C9AA60];

  -[NURenderRequest setSampleMode:](v3, "setSampleMode:", 2);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUVisionDetectionRequest;
  v5 = -[NURenderRequest copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 19, self->_scalePolicy);
    v7 = -[NSArray copyWithZone:](self->_visionRequests, "copyWithZone:", a3);
    v8 = v6[20];
    v6[20] = (id)v7;

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUVisionDetectionRequest;
  -[NURenderRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVisionDetectionRequest scalePolicy](self, "scalePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" Scale Policy: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)newRenderJob
{
  return -[NUVisionDetectionJob initWithVisionDetectionRequest:]([NUVisionDetectionJob alloc], "initWithVisionDetectionRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)submitGenericSynchronous:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUVisionDetectionRequest;
  -[NURenderRequest submitGenericSynchronous:](&v4, sel_submitGenericSynchronous_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setScalePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scalePolicy, a3);
}

- (NSArray)visionRequests
{
  return self->_visionRequests;
}

- (void)setVisionRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionRequests, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

+ (void)warmUpRequests:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "visionSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  LOBYTE(v4) = objc_msgSend(v5, "prepareForPerformingRequests:error:", v3, &v8);

  v6 = v8;
  if ((v4 & 1) == 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14117);
    v7 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Failed to warm up Vision requests, error: %{public}@", buf, 0xCu);
    }
  }

}

@end
