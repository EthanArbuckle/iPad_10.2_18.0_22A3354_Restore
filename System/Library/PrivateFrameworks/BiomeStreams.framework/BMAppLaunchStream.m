@implementation BMAppLaunchStream

- (id)publisherFromStartTime:(double)a3
{
  return -[BMStoreStream publisherFromStartTime:](self->_storeStream, "publisherFromStartTime:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (BMAppLaunchStream)init
{
  BMAppLaunchStream *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BMStoreStream *storeStream;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BMAppLaunchStream;
  v2 = -[BMAppLaunchStream init](&v10, sel_init);
  if (v2)
  {
    BMRootLibraryBridge();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "App");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "InFocus");
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
        -[BMAppLaunchStream init].cold.1();

    }
  }
  return v2;
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:", 1);
}

- (BMAppLaunchStream)initWithConfig:(id)a3
{
  id v4;
  BMAppLaunchStream *v5;
  BMStoreStream *v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *storeStream;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMAppLaunchStream;
  v5 = -[BMAppLaunchStream init](&v12, sel_init);
  if (v5)
  {
    v6 = [BMStoreStream alloc];
    -[BMAppLaunchStream identifier](v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v6, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v7, v4, 2, objc_opt_class(), *MEMORY[0x1E0D01C98]);
    storeStream = v5->_storeStream;
    v5->_storeStream = (BMStoreStream *)v8;

    if (!v5->_storeStream)
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BMAppLaunchStream init].cold.1();

    }
  }

  return v5;
}

- (id)remoteDevices
{
  return -[BMStoreStream remoteDevices](self->_storeStream, "remoteDevices");
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
  -[BMAppLaunchStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLStreamPublisher initWithIdentifier:streamType:eventDataClass:](v3, "initWithIdentifier:streamType:eventDataClass:", v4, 1, objc_opt_class());

  return v5;
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  return -[BMStoreStream publishersForRemoteDevices:startTime:includeLocal:pipeline:](self->_storeStream, "publishersForRemoteDevices:startTime:includeLocal:pipeline:", a3, a5, a6, a4);
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  return -[BMStoreStream publishersForRemoteDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](self->_storeStream, "publishersForRemoteDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", a3, a4, a5, a6, a7, a8);
}

- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  return -[BMStoreStream publishersForDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](self->_storeStream, "publishersForDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", a3, a4, a5, a6, a7, a8);
}

- (id)remoteDevicesWithError:(id *)a3
{
  return -[BMStoreStream remoteDevicesWithError:](self->_storeStream, "remoteDevicesWithError:", a3);
}

- (id)source
{
  return -[BMStoreStream source](self->_storeStream, "source");
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
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "Unable to initialize BMAppLaunchStream, please consult error logs for cause", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
