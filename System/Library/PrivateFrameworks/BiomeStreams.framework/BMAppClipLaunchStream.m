@implementation BMAppClipLaunchStream

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D40], "libraryPathForStreamIdentifier:", CFSTR("AppClipLaunch"));
}

- (BMAppClipLaunchStream)init
{
  BMAppClipLaunchStream *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BMStoreStream *storeStream;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BMAppClipLaunchStream;
  v2 = -[BMAppClipLaunchStream init](&v11, sel_init);
  if (v2)
  {
    BMRootLibraryBridge();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "App");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Clip");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "InFocus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storeStreamWithLegacyClass:", objc_opt_class());
    v7 = objc_claimAutoreleasedReturnValue();
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v7;

    if (!v2->_storeStream)
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BMAppClipLaunchStream init].cold.1();

    }
  }
  return v2;
}

- (id)source
{
  BMAppClipLaunchSource *v3;
  void *v4;
  BMAppClipLaunchSource *v5;

  v3 = [BMAppClipLaunchSource alloc];
  -[BMStoreStream source](self->_storeStream, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMAppClipLaunchSource initWithStoreSource:](v3, "initWithStoreSource:", v4);

  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return -[BMStoreStream publisherFromStartTime:](self->_storeStream, "publisherFromStartTime:", a3);
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return -[BMStoreStream publisherWithStartTime:endTime:maxEvents:lastN:reversed:](self->_storeStream, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", a3, a4, a5, 0, a6);
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return -[BMStoreStream publisherWithStartTime:endTime:maxEvents:lastN:reversed:](self->_storeStream, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", a3, a4, a5, a6, a7);
}

- (id)publisher
{
  BMDSLStreamPublisher *v3;
  void *v4;
  BMDSLStreamPublisher *v5;

  v3 = [BMDSLStreamPublisher alloc];
  -[BMAppClipLaunchStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLStreamPublisher initWithIdentifier:streamType:eventDataClass:](v3, "initWithIdentifier:streamType:eventDataClass:", v4, 1, objc_opt_class());

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "Unable to initialize BMPublicStreamAppClipLaunch, please consult error logs for cause", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
