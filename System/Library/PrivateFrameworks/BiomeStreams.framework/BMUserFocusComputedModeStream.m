@implementation BMUserFocusComputedModeStream

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D40], "libraryPathForStreamIdentifier:", CFSTR("UserFocusComputedMode"));
}

- (BMUserFocusComputedModeStream)init
{
  BMUserFocusComputedModeStream *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BMStoreStream *storeStream;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BMUserFocusComputedModeStream;
  v2 = -[BMUserFocusComputedModeStream init](&v17, sel_init);
  if (v2)
  {
    BMRootLibraryBridge();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UserFocus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ComputedMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeStreamWithLegacyClass:", objc_opt_class());
    v6 = objc_claimAutoreleasedReturnValue();
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v6;

    if (!v2->_storeStream)
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BMUserFocusComputedModeStream init].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  return v2;
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
  -[BMUserFocusComputedModeStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLStreamPublisher initWithIdentifier:streamType:eventDataClass:](v3, "initWithIdentifier:streamType:eventDataClass:", v4, 1, objc_opt_class());

  return v5;
}

- (id)source
{
  return -[BMStoreStream source](self->_storeStream, "source");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "Unable to initialize BMPublicStreamsUserFocusComputedMode, please consult error logs for cause", a5, a6, a7, a8, 0);
}

@end
