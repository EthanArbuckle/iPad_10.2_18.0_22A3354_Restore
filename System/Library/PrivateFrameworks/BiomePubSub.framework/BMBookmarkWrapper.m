@implementation BMBookmarkWrapper

- (BMBookmarkWrapper)initWithUpstream:(id)a3 initialState:(id)a4
{
  id v7;
  id v8;
  BMBookmarkWrapper *v9;
  BMBookmarkWrapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMBookmarkWrapper;
  v9 = -[BMBookmarkWrapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    objc_storeStrong(&v10->_initialState, a4);
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  _BPSBookmarkedInner *v5;
  void *v6;
  void *v7;
  void *v8;
  _BPSBookmarkedInner *v9;

  v4 = a3;
  v5 = [_BPSBookmarkedInner alloc];
  -[BMBookmarkWrapper upstream](self, "upstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBookmarkWrapper initialState](self, "initialState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_BPSBookmarkedInner initWithUpstream:downstream:state:](v5, "initWithUpstream:downstream:state:", v6, v4, v7);

  -[BMBookmarkWrapper upstream](self, "upstream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribe:", v9);

}

- (NSArray)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMBookmarkWrapper upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BMBookmarkWrapper *v8;
  void *v9;
  BMBookmarkWrapper *v10;

  v6 = a5;
  v7 = a4;
  v8 = [BMBookmarkWrapper alloc];
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BMBookmarkWrapper initWithUpstream:initialState:](v8, "initWithUpstream:initialState:", v9, v6);
  return v10;
}

- (id)withBookmark:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  BMBookmarkWrapper *v11;
  void *v12;
  void *v13;
  BMBookmarkWrapper *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "upstreams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMBookmarkWrapper upstream](self, "upstream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EEAF4F80);

    if (v9)
    {
      -[BMBookmarkWrapper upstream](self, "upstream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = [BMBookmarkWrapper alloc];
      objc_msgSend(v10, "withBookmark:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[BMBookmarkWrapper initWithUpstream:initialState:](v11, "initWithUpstream:initialState:", v12, v13);

    }
    else
    {
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1A956A000, v16, OS_LOG_TYPE_DEFAULT, "Can't update upstreams with bookmark", v18, 2u);
      }

      v14 = self;
    }

  }
  else
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMBookmarkWrapper withBookmark:].cold.1(v15);

    v14 = self;
  }

  return v14;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 0;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)initialState
{
  return self->_initialState;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialState, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)withBookmark:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A956A000, log, OS_LOG_TYPE_ERROR, "Can't unwrap bookmark", v1, 2u);
}

@end
