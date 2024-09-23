@implementation _BMDSLStatePublisher

- (_BMDSLStatePublisher)initWithUpstream:(id)a3 state:(id)a4 DSLState:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BMDSLStatePublisher *v12;
  _BMDSLStatePublisher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_BMDSLStatePublisher;
  v12 = -[_BMDSLStatePublisher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    objc_storeStrong((id *)&v13->_state, a4);
    objc_storeStrong((id *)&v13->_DSLState, a5);
  }

  return v13;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BMDSLStatePublisherInner *v6;
  void *v7;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_BMDSLStatePublisher subscribe:].cold.1((uint64_t)self, v5);

  v6 = -[_BMDSLStatePublisherInner initWithDownstream:state:DSLState:]([_BMDSLStatePublisherInner alloc], "initWithDownstream:state:DSLState:", v4, self->_state, self->_DSLState);
  -[_BMDSLStatePublisher upstream](self, "upstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", v6);

}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_BMDSLStatePublisher upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextEvent
{
  void *v3;
  BMDSLStateValue *v4;
  BMDSLStateValue *state;
  BMDSLStateValue *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BMDSLStateValue *v13;

  -[_BMDSLStatePublisher upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (BMDSLStateValue *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    state = self->_state;
    if (!state)
      state = v4;
    v6 = state;
    -[BMDSLState upstreamCombinedState](self->_DSLState, "upstreamCombinedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[BMDSLState key](self->_DSLState, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v9, 0);

    v11 = v10;
    v12 = v11;
    if (v7)
    {
      objc_msgSend(v7, "reduceWithNext:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[BMDSLState setCombinedValue:](self->_DSLState, "setCombinedValue:", v12);
    v13 = v4;

  }
  return v4;
}

- (id)bookmark
{
  void *v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  BMDSLState *DSLState;
  id v8;
  void *v9;
  void *v10;

  -[BMDSLState combinedValue](self->_DSLState, "combinedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLState value](self->_DSLState, "value");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    DSLState = self->_DSLState;
    v8 = v3;
    -[BMDSLState key](DSLState, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)validateBookmark:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ expected bookmark of class %@, but received %@"), v6, objc_opt_class(), v3);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D02418];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 2, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)applyBookmark:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[_BMDSLStatePublisher setState:](self, "setState:");
  }
  else
  {
    -[_BMDSLStatePublisher DSLState](self, "DSLState");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BMDSLStatePublisher setState:](self, "setState:", v4);

  }
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (BMDSLStateValue)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (BMDSLState)DSLState
{
  return self->_DSLState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSLState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _BMDSLStatePublisher *v13;
  void *v14;
  void *v15;
  _BMDSLStatePublisher *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v7, "DSLState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = [_BMDSLStatePublisher alloc];
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "DSLState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_BMDSLStatePublisher initWithUpstream:state:DSLState:](v13, "initWithUpstream:state:DSLState:", v14, v11, v15);

  return v16;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_BMDSLStatePublisher upstream](self, "upstream");
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
  return 0;
}

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = objc_opt_class();
  _os_log_debug_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v3, 0xCu);
}

@end
