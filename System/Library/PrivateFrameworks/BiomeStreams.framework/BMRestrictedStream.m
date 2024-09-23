@implementation BMRestrictedStream

- (id)remoteDevices
{
  return -[BMStoreStream remoteDevices](self->_storeStream, "remoteDevices");
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  return -[BMStoreStream publishersForRemoteDevices:startTime:includeLocal:pipeline:](self->_storeStream, "publishersForRemoteDevices:startTime:includeLocal:pipeline:", a3, a5, a6, a4);
}

- (BMRestrictedStream)initWithIdentifier:(id)a3
{
  return -[BMRestrictedStream initWithIdentifier:eventDataClass:](self, "initWithIdentifier:eventDataClass:", a3, 0);
}

- (BMRestrictedStream)initWithIdentifier:(id)a3 eventDataClass:(Class)a4
{
  id v7;
  BMRestrictedStream *v8;
  int v9;
  void *v10;
  void *v11;
  __CFString *v12;
  BMStoreStream *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  BMStoreStream *storeStream;
  void *v18;
  uint64_t v19;
  BMStoreStream *v20;
  void *v22;
  id v23;
  objc_super v24;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMRestrictedStream.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v24.receiver = self;
  v24.super_class = (Class)BMRestrictedStream;
  v8 = -[BMRestrictedStream init](&v24, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("Messages.CommunicationSafety.ResultWithoutImage"));
    BMRootLibraryBridge();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "streamWithIdentifier:error:", CFSTR("Messages.CommunicationSafety"), 0);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v13 = [BMStoreStream alloc];
      -[__CFString configuration](v12, "configuration");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject storeConfig](v14, "storeConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v13, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", CFSTR("Messages.CommunicationSafety.ResultWithoutImage"), v15, 2, a4, *MEMORY[0x1E0D01C98]);
      storeStream = v8->_storeStream;
      v8->_storeStream = (BMStoreStream *)v16;

    }
    else
    {
      v23 = 0;
      objc_msgSend(v10, "streamWithIdentifier:error:", v7, &v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (__CFString *)v23;
      objc_msgSend(v18, "storeStreamWithLegacyClass:", a4);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v8->_storeStream;
      v8->_storeStream = (BMStoreStream *)v19;

      if (v8->_storeStream)
      {
LABEL_10:

        goto LABEL_11;
      }
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BMRestrictedStream initWithIdentifier:eventDataClass:].cold.1((uint64_t)v7, v12, v14);
    }

    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4
{
  return -[BMRestrictedStream initWithIdentifier:segmentSize:pruningPolicy:](self, "initWithIdentifier:segmentSize:pruningPolicy:", a3, a4, 0);
}

- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4 pruningPolicy:(id)a5
{
  return -[BMRestrictedStream initWithIdentifier:segmentSize:pruningPolicy:eventDataClass:](self, "initWithIdentifier:segmentSize:pruningPolicy:eventDataClass:", a3, a4, a5, 0);
}

- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4 pruningPolicy:(id)a5 eventDataClass:(Class)a6
{
  id v11;
  id v12;
  BMRestrictedStream *v13;
  void *v14;
  BMStoreStream *v15;
  BMStoreStream *storeStream;
  NSObject *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  if (v11)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMRestrictedStream.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMRestrictedStream.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("segmentSize"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)BMRestrictedStream;
  v13 = -[BMRestrictedStream init](&v21, sel_init);
  if (v13)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newRestrictedStreamWithSegmentSize:", a4);
    objc_msgSend(v14, "setPruningPolicy:", v12);
    v15 = -[BMStoreStream initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:]([BMStoreStream alloc], "initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:", v11, v14, a6);
    storeStream = v13->_storeStream;
    v13->_storeStream = v15;

    if (!v13->_storeStream)
    {
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[BMRestrictedStream initWithIdentifier:segmentSize:pruningPolicy:eventDataClass:].cold.1((uint64_t)v11, a4, v17);

    }
  }

  return v13;
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

- (void)pruneWithPredicateBlock:(id)a3
{
  -[BMStoreStream pruneWithPredicateBlock:](self->_storeStream, "pruneWithPredicateBlock:", a3);
}

- (void)pruneLocalAndRemoteEventsWithPredicateBlock:(id)a3
{
  -[BMStoreStream pruneLocalAndRemoteEventsWithPredicateBlock:](self->_storeStream, "pruneLocalAndRemoteEventsWithPredicateBlock:", a3);
}

- (void)pruneLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
  -[BMStoreStream pruneLocalAndRemoteEventsWithReason:usingPredicateBlock:](self->_storeStream, "pruneLocalAndRemoteEventsWithReason:usingPredicateBlock:", a3, a4);
}

- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  return -[BMStoreStream publishersForDevices:startTime:includeLocal:pipeline:](self->_storeStream, "publishersForDevices:startTime:includeLocal:pipeline:", a3, a5, a6, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (void)initWithIdentifier:(NSObject *)a3 eventDataClass:.cold.1(uint64_t a1, const __CFString *a2, NSObject *a3)
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = &stru_1E2672FA8;
  if (a2)
    v3 = a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_0_9(&dword_18D810000, a3, (uint64_t)a3, "BMRestrictedBaseStream(%@): unable to initialize stream. %@", (uint8_t *)&v4);
}

- (void)initWithIdentifier:(NSObject *)a3 segmentSize:pruningPolicy:eventDataClass:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_9(&dword_18D810000, a3, v6, "BMRestrictedBaseStream(%@): unable to initialize stream with segment size %@", (uint8_t *)&v7);

}

@end
