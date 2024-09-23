@implementation BPSMap

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSMap upstream](self, "upstream");
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
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;

  -[BPSMap upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    while (1)
    {
      -[BPSMap transform](self, "transform");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v5)[2](v5, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        break;
      -[BPSMap upstream](self, "upstream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nextEvent");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
      if (!v8)
        goto LABEL_4;
    }

  }
  else
  {
LABEL_4:
    v6 = 0;
  }
  return v6;
}

- (id)transform
{
  return self->_transform;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (BPSMap)initWithUpstream:(id)a3 transform:(id)a4
{
  id v7;
  id v8;
  BPSMap *v9;
  BPSMap *v10;
  uint64_t v11;
  id transform;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSMap;
  v9 = -[BPSMap init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    v11 = objc_msgSend(v8, "copy");
    transform = v10->_transform;
    v10->_transform = (id)v11;

  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _BPSMapInner *v7;
  void *v8;
  _BPSMapInner *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_1A956A000, v5, OS_LOG_TYPE_INFO, "%@ - subscribe", (uint8_t *)&v11, 0xCu);

  }
  v7 = [_BPSMapInner alloc];
  -[BPSMap transform](self, "transform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_BPSMapInner initWithDownstream:transform:](v7, "initWithDownstream:transform:", v4, v8);

  -[BPSMap upstream](self, "upstream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribe:", v9);

}

- (void)setTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BPSMap *v8;
  void *v9;
  void *v10;
  BPSMap *v11;

  v6 = a3;
  v7 = a4;
  v8 = [BPSMap alloc];
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "transform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BPSMap initWithUpstream:transform:](v8, "initWithUpstream:transform:", v9, v10);

  return v11;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSMap upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
