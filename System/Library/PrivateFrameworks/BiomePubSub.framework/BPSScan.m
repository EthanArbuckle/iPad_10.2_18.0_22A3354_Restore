@implementation BPSScan

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSScan upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;

  -[BPSScan upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BPSScan nextPartialResult](self, "nextPartialResult");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[BPSScan result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v5)[2](v5, v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSScan setResult:](self, "setResult:", v7);

    -[BPSScan result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong(&self->_result, a3);
}

- (id)nextPartialResult
{
  return self->_nextPartialResult;
}

- (void)reset
{
  void *v3;
  objc_super v4;

  -[BPSScan initialResult](self, "initialResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSScan setResult:](self, "setResult:", v3);

  v4.receiver = self;
  v4.super_class = (Class)BPSScan;
  -[BPSPublisher reset](&v4, sel_reset);
}

- (id)initialResult
{
  return self->_initialResult;
}

- (BPSScan)initWithUpstream:(id)a3 initialResult:(id)a4 nextPartialResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  BPSScan *v12;
  BPSScan *v13;
  uint64_t v14;
  id nextPartialResult;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BPSScan;
  v12 = -[BPSScan init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    objc_storeStrong(&v13->_initialResult, a4);
    objc_storeStrong(&v13->_result, a4);
    v14 = objc_msgSend(v11, "copy");
    nextPartialResult = v13->_nextPartialResult;
    v13->_nextPartialResult = (id)v14;

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong(&self->_nextPartialResult, 0);
  objc_storeStrong(&self->_initialResult, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BPSScanInner *v6;
  void *v7;
  void *v8;
  _BPSScanInner *v9;
  void *v10;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BPSScan subscribe:].cold.1();

  v6 = [_BPSScanInner alloc];
  -[BPSScan nextPartialResult](self, "nextPartialResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSScan initialResult](self, "initialResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_BPSScanInner initWithDownstream:nextPartialResult:initialResult:](v6, "initWithDownstream:nextPartialResult:initialResult:", v4, v7, v8);

  -[BPSScan upstream](self, "upstream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribe:", v9);

}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v7;
  id v8;
  id v9;
  BPSScan *v10;
  void *v11;
  void *v12;
  void *v13;
  BPSScan *v14;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = [BPSScan alloc];
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v8;
  if (!v8)
  {
    objc_msgSend(v7, "initialResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "nextPartialResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BPSScan initWithUpstream:initialResult:nextPartialResult:](v10, "initWithUpstream:initialResult:nextPartialResult:", v11, v12, v13);

  if (!v8)
  return v14;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSScan upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 1;
}

- (void)subscribe:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_0(&dword_1A956A000, v2, v3, "%@ - subscribe", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
