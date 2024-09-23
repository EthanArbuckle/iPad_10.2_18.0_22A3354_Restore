@implementation BMContextualActionsStream

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:", 5);
}

- (BMContextualActionsStream)init
{
  BMContextualActionsStream *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BMStoreStream *storeStream;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BMContextualActionsStream;
  v2 = -[BMContextualActionsStream init](&v10, sel_init);
  if (v2)
  {
    BMRootLibraryBridge();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "App");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ContextualActions");
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
        -[BMContextualActionsStream init].cold.1();

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
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "Unable to initialize BMContextualActionsStream, please consult error logs for cause", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
