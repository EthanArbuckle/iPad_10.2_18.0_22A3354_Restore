@implementation BMContentStream

- (BMContentStream)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  BMContentStream *result;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Must override method %@ in a subclass"), v4);

  __break(1u);
  return result;
}

- (NSString)identifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSString *result;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Must override method %@ in a subclass"), v4);

  __break(1u);
  return result;
}

- (BMContentStream)initWithStreamIdentifier:(id)a3
{
  return -[BMContentStream initWithStreamIdentifier:eventClass:](self, "initWithStreamIdentifier:eventClass:", a3, 0);
}

- (BMContentStream)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4
{
  id v7;
  BMContentStream *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  BMStoreStream *storeStream;
  NSObject *v14;
  BMContentStream *v15;
  BMContentSource *v16;
  void *v17;
  uint64_t v18;
  BMContentSource *contentSource;
  void *v21;
  void *v22;
  id v23;
  objc_super v24;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMContentStream.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("streamIdentifier"));

  }
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("ProactiveHarvesting.")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMContentStream.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[streamIdentifier hasPrefix:@\"ProactiveHarvesting.\"]"));

  }
  v24.receiver = self;
  v24.super_class = (Class)BMContentStream;
  v8 = -[BMContentStream init](&v24, sel_init);
  if (!v8)
    goto LABEL_11;
  BMRootLibraryBridge();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v9, "streamWithIdentifier:error:", v7, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  objc_msgSend(v10, "storeStreamWithLegacyClass:", a4);
  v12 = objc_claimAutoreleasedReturnValue();
  storeStream = v8->_storeStream;
  v8->_storeStream = (BMStoreStream *)v12;

  if (!v11)
  {
    v16 = [BMContentSource alloc];
    -[BMStoreStream storeConfig](v8->_storeStream, "storeConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BMStoreSource initWithIdentifier:storeConfig:](v16, "initWithIdentifier:storeConfig:", v7, v17);
    contentSource = v8->_contentSource;
    v8->_contentSource = (BMContentSource *)v18;

LABEL_11:
    v15 = v8;
    goto LABEL_12;
  }
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    -[BMContentStream initWithStreamIdentifier:eventClass:].cold.1((uint64_t)v7, v14);

  v15 = 0;
LABEL_12:

  return v15;
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
  -[BMContentStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLStreamPublisher initWithIdentifier:streamType:](v3, "initWithIdentifier:streamType:", v4, 2);

  return v5;
}

- (void)pruneWithPredicateBlock:(id)a3
{
  -[BMContentStream pruneEventsWithError:predicateBlock:](self, "pruneEventsWithError:predicateBlock:", 0, a3);
}

- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4
{
  return -[BMStoreStream pruneEventsWithError:predicateBlock:](self->_storeStream, "pruneEventsWithError:predicateBlock:", a3, a4);
}

- (id)source
{
  return self->_contentSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSource, 0);
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (void)initWithStreamIdentifier:(uint64_t)a1 eventClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "Failed to find content stream with identifier %@", (uint8_t *)&v2, 0xCu);
}

@end
