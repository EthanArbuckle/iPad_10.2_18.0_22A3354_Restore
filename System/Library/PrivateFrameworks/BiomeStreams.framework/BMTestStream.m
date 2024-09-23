@implementation BMTestStream

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:", 3);
}

- (BMTestStream)init
{
  BMTestStream *v2;
  void *v3;
  BMStoreStream *v4;
  void *v5;
  uint64_t v6;
  BMStoreStream *storeStream;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BMTestStream;
  v2 = -[BMTestStream init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newPublicStreamDefaultConfigurationWithProtectionClass:", 3);
    v4 = [BMStoreStream alloc];
    -[BMTestStream identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v4, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v5, v3, 2, objc_opt_class(), *MEMORY[0x1E0D01C98]);
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v6;

    if (!v2->_storeStream)
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BMTestStream init].cold.1(v8);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D810000, log, OS_LOG_TYPE_FAULT, "Unable to initialize BMTestStream, please consult error logs for cause", v1, 2u);
}

@end
