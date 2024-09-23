@implementation BPSFilter

- (id)upstreamPublishers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BPSFilter upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BPSFilter upstream](self, "upstream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  char v6;
  void *v7;
  uint64_t v8;

  -[BPSFilter upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      -[BPSFilter isIncluded](self, "isIncluded");
      v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6 = ((uint64_t (**)(_QWORD, void *))v5)[2](v5, v4);

      if ((v6 & 1) != 0)
        break;
      -[BPSFilter upstream](self, "upstream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nextEvent");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
    while (v8);
  }
  return v4;
}

- (id)isIncluded
{
  return self->_isIncluded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong(&self->_isIncluded, 0);
}

- (BPSFilter)initWithUpstream:(id)a3 isIncluded:(id)a4
{
  id v7;
  id v8;
  BPSFilter *v9;
  BPSFilter *v10;
  uint64_t v11;
  id isIncluded;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSFilter;
  v9 = -[BPSFilter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    v11 = objc_msgSend(v8, "copy");
    isIncluded = v10->_isIncluded;
    v10->_isIncluded = (id)v11;

  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BPSFilterInner *v6;
  void *v7;
  _BPSFilterInner *v8;
  void *v9;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BPSFilter subscribe:].cold.1((uint64_t)self, v5);

  v6 = [_BPSFilterInner alloc];
  -[BPSFilter isIncluded](self, "isIncluded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_BPSFilterInner initWithDownstream:isIncluded:](v6, "initWithDownstream:isIncluded:", v4, v7);

  -[BPSFilter upstream](self, "upstream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribe:", v8);

}

- (void)setUpstream:(id)a3
{
  objc_storeStrong((id *)&self->_upstream, a3);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BPSFilter *v8;
  void *v9;
  void *v10;
  BPSFilter *v11;

  v6 = a3;
  v7 = a4;
  v8 = [BPSFilter alloc];
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "isIncluded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BPSFilter initWithUpstream:isIncluded:](v8, "initWithUpstream:isIncluded:", v9, v10);

  return v11;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSFilter upstream](self, "upstream");
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

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v4, 0xCu);

}

@end
