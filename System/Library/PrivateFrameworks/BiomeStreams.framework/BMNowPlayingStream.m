@implementation BMNowPlayingStream

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:", 17);
}

- (BMNowPlayingStream)init
{
  BMNowPlayingStream *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BMStoreStream *storeStream;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BMNowPlayingStream;
  v2 = -[BMNowPlayingStream init](&v10, sel_init);
  if (v2)
  {
    BMRootLibraryBridge();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "NowPlaying");
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
        -[BMNowPlayingStream init].cold.1(v8);

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
  -[BMNowPlayingStream identifier](self, "identifier");
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

- (id)remoteDevices
{
  return -[BMStoreStream remoteDevices](self->_storeStream, "remoteDevices");
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
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D810000, log, OS_LOG_TYPE_FAULT, "Unable to initialize BMPublicStreamNowPlaying, please consult error logs for cause", v1, 2u);
}

@end
