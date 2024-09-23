@implementation BMDKEventStream

- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4
{
  return -[BMStoreStream pruneEventsWithError:predicateBlock:](self->_storeStream, "pruneEventsWithError:predicateBlock:", a3, a4);
}

+ (id)streamNameFromDKStreamName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v3, "length"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "length"))
        {
          v12 = objc_msgSend(v5, "length");
          upperCaseInitialCharacter(v11);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v12)
            objc_msgSend(v5, "appendFormat:", CFSTR(".%@"), v13);
          else
            objc_msgSend(v5, "appendString:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(CFSTR("_DKEvent."), "stringByAppendingString:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BMDKEventStream)init
{
  BMDKEventStream *result;

  result = (BMDKEventStream *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Must use designated initializer for BMDKEventStream"));
  __break(1u);
  return result;
}

- (BMDKEventStream)initWithDKStreamIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  BMDKEventStream *v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE buf[24];
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v5 = (void *)get_CDEventStreamsClass_softClass;
  v19 = get_CDEventStreamsClass_softClass;
  if (!get_CDEventStreamsClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __get_CDEventStreamsClass_block_invoke;
    v21 = &unk_1E2647EA8;
    v22 = &v16;
    __get_CDEventStreamsClass_block_invoke((uint64_t)buf);
    v5 = (void *)v17[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v6, "eventStreamPropertiesForKBName:", v4, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D024B0]);
  objc_msgSend(v7, "timeToLive");
  v9 = (void *)objc_msgSend(v8, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, 52428800);
  +[BMDKEventStream streamNameFromDKStreamName:](BMDKEventStream, "streamNameFromDKStreamName:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = BMServiceDomainForStream();
  __biome_log_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BMStringForServiceDomain();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_18D810000, v12, OS_LOG_TYPE_INFO, "Initializing BMDKEventStream %{public}@ with domain %{public}@", buf, 0x16u);

  }
  v14 = -[BMDKEventStream initWithStreamIdentifier:contentProtection:pruningPolicy:domain:](self, "initWithStreamIdentifier:contentProtection:pruningPolicy:domain:", v10, 3, v9, v11);

  return v14;
}

- (BMDKEventStream)initWithStreamIdentifier:(id)a3 contentProtection:(unint64_t)a4 pruningPolicy:(id)a5 domain:(unint64_t)a6
{
  id v12;
  id v13;
  BMDKEventStream *v14;
  BMDKEventStream *v15;
  void *v16;
  BMStoreStream *v17;
  uint64_t v18;
  BMStoreStream *storeStream;
  void *v21;
  objc_super v22;

  v12 = a3;
  v13 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDKEventStream.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v22.receiver = self;
  v22.super_class = (Class)BMDKEventStream;
  v14 = -[BMDKEventStream init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    v16 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newRestrictedStreamWithSegmentSize:protectionClass:domain:", 0x100000, a4, a6);
    objc_msgSend(v16, "setPruningPolicy:", v13);
    v17 = [BMStoreStream alloc];
    v18 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v17, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v12, v16, 2, objc_opt_class(), *MEMORY[0x1E0D01C88]);
    storeStream = v15->_storeStream;
    v15->_storeStream = (BMStoreStream *)v18;

  }
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

- (id)publisher
{
  BMDSLStreamPublisher *v3;
  void *v4;
  BMDSLStreamPublisher *v5;

  v3 = [BMDSLStreamPublisher alloc];
  -[BMDKEventStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLStreamPublisher initWithIdentifier:streamType:](v3, "initWithIdentifier:streamType:", v4, 2);

  return v5;
}

- (void)pruneWithPredicateBlock:(id)a3
{
  -[BMDKEventStream pruneEventsWithError:predicateBlock:](self, "pruneEventsWithError:predicateBlock:", 0, a3);
}

- (void)deleteLocalAndRemoteEventsWithPredicateBlock:(id)a3
{
  -[BMStoreStream pruneLocalAndRemoteEventsWithReason:usingPredicateBlock:](self->_storeStream, "pruneLocalAndRemoteEventsWithReason:usingPredicateBlock:", 0, a3);
}

- (void)deleteLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
  -[BMStoreStream pruneLocalAndRemoteEventsWithReason:usingPredicateBlock:](self->_storeStream, "pruneLocalAndRemoteEventsWithReason:usingPredicateBlock:", a3, a4);
}

@end
