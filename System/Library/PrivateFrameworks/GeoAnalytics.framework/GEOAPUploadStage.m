@implementation GEOAPUploadStage

- (GEOAPUploadStage)initWithURLSessionConfig:(id)a3 ttl:(double)a4
{
  id v7;
  GEOAPUploadStage *v8;
  GEOAPUploadStage *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOAPUploadStage;
  v8 = -[GEOAPUploadStage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_urlSessionConfig, a3);
    v9->_ttl = a4;
  }

  return v9;
}

- (GEOAPURLSessionConfig)urlSessionConfig
{
  return self->_urlSessionConfig;
}

- (double)ttl
{
  return self->_ttl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSessionConfig, 0);
}

@end
