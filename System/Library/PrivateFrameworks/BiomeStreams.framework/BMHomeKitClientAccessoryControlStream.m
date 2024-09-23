@implementation BMHomeKitClientAccessoryControlStream

- (id)publisherFromStartTime:(double)a3
{
  return -[BMStoreStream publisherFromStartTime:](self->_storeStream, "publisherFromStartTime:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (BMHomeKitClientAccessoryControlStream)init
{
  BMHomeKitClientAccessoryControlStream *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BMStoreStream *storeStream;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BMHomeKitClientAccessoryControlStream;
  v2 = -[BMHomeKitClientAccessoryControlStream init](&v18, sel_init);
  if (v2)
  {
    BMRootLibraryBridge();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "HomeKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "AccessoryControl");
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
        -[BMHomeKitClientAccessoryControlStream init].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    }
  }
  return v2;
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:", 14);
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
  -[BMHomeKitClientAccessoryControlStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLStreamPublisher initWithIdentifier:streamType:eventDataClass:](v3, "initWithIdentifier:streamType:eventDataClass:", v4, 1, objc_opt_class());

  return v5;
}

- (id)source
{
  return -[BMStoreStream source](self->_storeStream, "source");
}

- (void)init
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "Unable to initialize BMPublicStreamHomeKitClientAccessoryControl, please consult error logs for cause", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
