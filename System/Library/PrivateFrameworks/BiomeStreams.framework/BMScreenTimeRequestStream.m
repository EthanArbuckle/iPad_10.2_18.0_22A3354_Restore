@implementation BMScreenTimeRequestStream

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:", 34);
}

- (BMScreenTimeRequestStream)init
{
  BMScreenTimeRequestStream *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BMStoreStream *storeStream;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BMScreenTimeRequestStream;
  v2 = -[BMScreenTimeRequestStream init](&v11, sel_init);
  if (v2)
  {
    BMRootLibraryBridge();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Family");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ScreenTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "Request");
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
        -[BMScreenTimeRequestStream init].cold.1(v9);

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

- (id)source
{
  return -[BMStoreStream source](self->_storeStream, "source");
}

- (id)publisher
{
  BMDSLStreamPublisher *v3;
  void *v4;
  BMDSLStreamPublisher *v5;

  v3 = [BMDSLStreamPublisher alloc];
  -[BMScreenTimeRequestStream identifier](self, "identifier");
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
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D810000, log, OS_LOG_TYPE_FAULT, "Unable to initialize BMPublicStreamScreenTimeRequest, please consult error logs for cause", v1, 2u);
}

@end
