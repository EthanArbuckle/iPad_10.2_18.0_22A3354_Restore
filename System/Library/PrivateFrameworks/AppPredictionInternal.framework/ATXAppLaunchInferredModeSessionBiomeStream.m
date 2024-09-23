@implementation ATXAppLaunchInferredModeSessionBiomeStream

- (NSString)identifier
{
  return (NSString *)CFSTR("appLaunchInferredMode");
}

- (ATXAppLaunchInferredModeSessionBiomeStream)init
{
  return -[ATXAppLaunchInferredModeSessionBiomeStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

- (ATXAppLaunchInferredModeSessionBiomeStream)initWithStoreConfig:(id)a3
{
  id v4;
  ATXAppLaunchInferredModeSessionBiomeStream *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *inner;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXAppLaunchInferredModeSessionBiomeStream;
  v5 = -[ATXAppLaunchInferredModeSessionBiomeStream init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D024C0], "atx_storeConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", CFSTR("appLaunchInferredMode"), v6, objc_opt_class());
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;

  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)-[BMStoreStream publisherFromStartTime:](self->_inner, "publisherFromStartTime:", a3);
}

- (id)source
{
  return (id)-[BMStoreStream source](self->_inner, "source");
}

- (void)sendEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXAppLaunchInferredModeSessionBiomeStream source](self, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
