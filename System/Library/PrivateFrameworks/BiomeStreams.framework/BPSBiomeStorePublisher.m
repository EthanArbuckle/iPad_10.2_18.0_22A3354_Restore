@implementation BPSBiomeStorePublisher

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)applyBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (id)startWithSubscriber:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = -[BPSBiomeStorePublisher _newEnumerator](self, "_newEnumerator", a3);
  if ((objc_msgSend(v4, "isDataAccessible") & 1) != 0)
  {
    -[BPSBiomeStorePublisher setEnumerator:](self, "setEnumerator:", v4);
    v5 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ data is not accessible"), v8);

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D02418];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_enumerator, a3);
}

- (BPSBiomeStorePublisher)initWithStreamDatastoreReader:(id)a3 streamsAccessClient:(id)a4
{
  id v7;
  id v8;
  BPSBiomeStorePublisher *v9;
  BPSBiomeStorePublisher *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BPSBiomeStorePublisher;
  v9 = -[BPSBiomeStorePublisher init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_reversed = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v10->_startTime = v12;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v10->_endTime = v14;

    v10->_maxEvents = -1;
    v10->_lastEventCount = -1;
    objc_storeStrong((id *)&v10->_streamDatastoreReader, a3);
    objc_storeStrong((id *)&v10->_accessClient, a4);
  }

  return v10;
}

- (id)_newEnumerator
{
  double startTime;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double endTime;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BMIndexSearch *indexSearch;
  double v24;
  double v25;
  unint64_t maxEvents;
  _BOOL8 reversed;
  void *v28;
  NSObject *v29;
  BMStreamDatastoreReader *streamDatastoreReader;
  NSObject *v31;
  uint64_t v32;
  NSObject *v34;
  BMIndexSearch *v35;
  void *v36;
  BMIndexSearch *v37;
  BMIndexSearch *v38;
  BMIndexSearch *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint8_t buf[4];
  BMIndexSearch *v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  startTime = self->_startTime;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  if (startTime == v7)
  {
    if (self->_reversed)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v10 = v9;

    }
    else
    {
      v10 = 0.0;
    }
  }
  else
  {
    v10 = self->_startTime;
  }
  endTime = self->_endTime;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  if (endTime == v14)
  {
    v15 = 0.0;
    if (!self->_reversed)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      v15 = v17;

    }
  }
  else
  {
    v15 = self->_endTime;
  }
  if (self->_bookmark)
  {
    if (!self->_indexSearch
      || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          -[BPSBiomeStorePublisher streamId](self, "streamId"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSBiomeStorePublisher.m"), 273, CFSTR("both bookmark and indexSearch may not both be set. Stream: %@, bookmark: %@, indexSearch: %@"), v22, self->_bookmark, self->_indexSearch), v22, v21, self->_bookmark))
    {
      v18 = (void *)-[BMStreamDatastoreReader newEnumeratorFromBookmark:](self->_streamDatastoreReader, "newEnumeratorFromBookmark:");
      if (v18)
      {
        v19 = v18;
        objc_msgSend(v18, "setEndTime:maxEvents:lastN:reverse:", self->_maxEvents, self->_lastEventCount, self->_reversed, v15);
        return v19;
      }
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[BPSBiomeStorePublisher _newEnumerator].cold.1(self);
      goto LABEL_29;
    }
  }
  indexSearch = self->_indexSearch;
  if (indexSearch)
  {
    if (self->_lastEventCount != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSBiomeStorePublisher streamId](self, "streamId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSBiomeStorePublisher.m"), 287, CFSTR("lastN and indexSearch may not both be set. Stream: %@, indexSearch: %@ lastN: %lu"), v41, self->_indexSearch, self->_lastEventCount);

      indexSearch = self->_indexSearch;
    }
    v24 = self->_startTime;
    v25 = self->_endTime;
    maxEvents = self->_maxEvents;
    reversed = self->_reversed;
    v43 = 0;
    -[BMIndexSearch performSearchWithStartTime:endTime:maxEvents:reversed:error:](indexSearch, "performSearchWithStartTime:endTime:maxEvents:reversed:error:", maxEvents, reversed, &v43, v24, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v43;
    if (v28)
    {
      streamDatastoreReader = self->_streamDatastoreReader;
      v42 = v29;
      v19 = (void *)-[BMStreamDatastoreReader newEnumeratorFromBookmarkEnumerator:error:](streamDatastoreReader, "newEnumeratorFromBookmarkEnumerator:error:", v28, &v42);
      v20 = v42;

      if (v19)
      {

        return v19;
      }
      __biome_log_for_category();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        -[BPSBiomeStorePublisher streamId](self, "streamId");
        v38 = (BMIndexSearch *)objc_claimAutoreleasedReturnValue();
        v39 = self->_indexSearch;
        *(_DWORD *)buf = 138412802;
        v45 = v38;
        v46 = 2112;
        v47 = *(double *)&v39;
        v48 = 2112;
        v49 = *(double *)&v20;
        _os_log_error_impl(&dword_18D810000, v31, OS_LOG_TYPE_ERROR, "newEnumeratorFromBookmark nil for stream: %@ and _indexSearch: %@, error: %@. No enumeration performed", buf, 0x20u);

      }
    }
    else
    {
      __biome_log_for_category();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v35 = self->_indexSearch;
        -[BPSBiomeStorePublisher streamId](self, "streamId");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v45 = v35;
        v46 = 2112;
        v47 = *(double *)&v36;
        v48 = 2112;
        v49 = *(double *)&v29;
        _os_log_error_impl(&dword_18D810000, v31, OS_LOG_TYPE_ERROR, "-[BMIndexSearch performSearchWithError:] returns a nil BMIndexRowEnumerator for BMIndexSearch: %@ nil on stream: %@. Error: %@, No enumeration performed", buf, 0x20u);

      }
      v20 = v29;
    }

LABEL_29:
  }
  if (!self->_indexSearch)
  {
    v32 = 8 * self->_reversed;
    v19 = (void *)-[BMStreamDatastoreReader newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:](self->_streamDatastoreReader, "newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:", self->_maxEvents, self->_lastEventCount, v32, v10, v15);
    if (v19)
      return v19;
    __biome_log_for_category();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[BPSBiomeStorePublisher streamId](self, "streamId");
      v37 = (BMIndexSearch *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v45 = v37;
      v46 = 2048;
      v47 = v10;
      v48 = 2048;
      v49 = v15;
      v50 = 2048;
      v51 = v32;
      _os_log_error_impl(&dword_18D810000, v34, OS_LOG_TYPE_ERROR, "newEnumeratorFromStartTime nil for stream: %@, start time: %lf endTime: %lf options: %lu", buf, 0x2Au);

    }
  }
  return 0;
}

- (id)withStartTime:(double)a3
{
  *((double *)self + 1) = a3;
  return self;
}

- (void)reset
{
  -[BPSBiomeStorePublisher setFinished:](self, "setFinished:", 0);
  -[BPSBiomeStorePublisher setEnumerator:](self, "setEnumerator:", 0);
}

- (id)bookmark
{
  void *v2;
  void *v3;

  -[BPSBiomeStorePublisher enumerator](self, "enumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  id v5;

  -[BPSBiomeStorePublisher enumerator](self, "enumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    -[BPSBiomeStorePublisher setFinished:](self, "setFinished:", 1);

  return v4;
}

- (BMStoreEnumerator)enumerator
{
  return self->_enumerator;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)withMaxEvents:(unint64_t)a3
{
  *((_QWORD *)self + 3) = a3;
  return self;
}

- (id)withEndTime:(double)a3
{
  *((double *)self + 2) = a3;
  return self;
}

- (id)reverse
{
  *((_BYTE *)self + 40) = 1;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_streamDatastoreReader, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_indexSearch, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

- (id)validateBookmark:(id)a3
{
  id v3;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ expected bookmark of class %@, but received %@"), v7, v9, v3);

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D02418];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 2, v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4
{
  return -[BPSBiomeStorePublisher initWithStreamId:storeConfig:streamsAccessClient:](self, "initWithStreamId:storeConfig:streamsAccessClient:", a3, a4, 0);
}

- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4 streamsAccessClient:(id)a5
{
  return -[BPSBiomeStorePublisher initWithStreamId:storeConfig:streamsAccessClient:eventDataClass:](self, "initWithStreamId:storeConfig:streamsAccessClient:eventDataClass:", a3, a4, a5, 0);
}

- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4 streamsAccessClient:(id)a5 eventDataClass:(Class)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BPSBiomeStorePublisher *v16;

  v10 = (objc_class *)MEMORY[0x1E0D024E0];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [v10 alloc];
  v15 = (void *)objc_msgSend(v14, "initWithStream:config:eventDataClass:useCase:", v13, v12, a6, *MEMORY[0x1E0D01C98]);

  v16 = -[BPSBiomeStorePublisher initWithStreamDatastoreReader:streamsAccessClient:](self, "initWithStreamDatastoreReader:streamsAccessClient:", v15, v11);
  return v16;
}

- (NSString)streamId
{
  return (NSString *)-[BMStreamDatastoreReader streamIdentifier](self->_streamDatastoreReader, "streamIdentifier");
}

- (void)subscribe:(id)a3
{
  id v4;
  _BPSInnerBiomeSubscription *v5;
  void *v6;
  _BPSInnerBiomeSubscription *v7;
  id v8;

  v4 = a3;
  v8 = -[BPSBiomeStorePublisher _newEnumerator](self, "_newEnumerator");
  v5 = [_BPSInnerBiomeSubscription alloc];
  -[BPSBiomeStorePublisher streamId](self, "streamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_BPSInnerBiomeSubscription initWithStreamEnumerator:downstream:streamId:accessClient:](v5, "initWithStreamEnumerator:downstream:streamId:accessClient:", v8, v4, v6, self->_accessClient);

  objc_msgSend(v4, "receiveSubscription:", v7);
}

- (id)withIndexSearch:(id)a3
{
  objc_storeStrong((id *)&self->_indexSearch, a3);
  return self;
}

- (id)withLastEvents:(unint64_t)a3
{
  *((_QWORD *)self + 4) = a3;
  return self;
}

- (id)withBookmark:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  BPSBiomeStorePublisher *v9;
  void *v10;
  NSObject *v11;
  BPSBiomeStorePublisher *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BPSBiomeStorePublisher withBookmark:].cold.1(v7);

    goto LABEL_8;
  }
  if (!v4)
  {
LABEL_8:
    v9 = self;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "value");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v4;
  }
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_bookmark, v10);
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BPSBiomeStorePublisher withBookmark:].cold.2(self, v11);

  }
  v12 = self;

LABEL_16:
  return self;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 0;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  return a3;
}

- (id)bookmarkableUpstreams
{
  return 0;
}

- (void)_newEnumerator
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "streamId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7(&dword_18D810000, v2, v3, "newEnumeratorFromBookmark nil for stream: %@. Going to try default start time: %lf", v4, v5, v6, v7, 2u);

}

- (void)withBookmark:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Found null when restoring bookmark for store publisher", v1, 2u);
}

- (void)withBookmark:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "streamId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "Can't use store bookmark for stream: %@, since the input bookmark object is invalid", (uint8_t *)&v4, 0xCu);

}

@end
