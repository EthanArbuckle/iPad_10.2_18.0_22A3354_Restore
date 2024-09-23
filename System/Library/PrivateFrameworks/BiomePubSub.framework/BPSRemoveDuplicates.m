@implementation BPSRemoveDuplicates

- (BPSRemoveDuplicates)initWithUpstream:(id)a3 isDuplicate:(id)a4
{
  id v7;
  id v8;
  BPSRemoveDuplicates *v9;
  BPSRemoveDuplicates *v10;
  uint64_t v11;
  id isDuplicate;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSRemoveDuplicates;
  v9 = -[BPSRemoveDuplicates init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    v11 = objc_msgSend(v8, "copy");
    isDuplicate = v10->_isDuplicate;
    v10->_isDuplicate = (id)v11;

  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BPSRemoveDuplicatesInner *v6;
  void *v7;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BPSRemoveDuplicates subscribe:].cold.1((uint64_t)self, v5);

  v6 = -[_BPSRemoveDuplicatesInner initWithDownstream:isDuplicate:]([_BPSRemoveDuplicatesInner alloc], "initWithDownstream:isDuplicate:", v4, self->_isDuplicate);
  -[BPSRemoveDuplicates upstream](self, "upstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", v6);

}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSRemoveDuplicates upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;

  -[BPSRemoveDuplicates upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    while (1)
    {
      -[BPSRemoveDuplicates last](self, "last");
      v5 = objc_claimAutoreleasedReturnValue();
      if (!v5)
        break;
      v6 = (void *)v5;
      -[BPSRemoveDuplicates isDuplicate](self, "isDuplicate");
      v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[BPSRemoveDuplicates last](self, "last");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v8, v4);

      if ((v9 & 1) == 0)
        break;
      -[BPSRemoveDuplicates upstream](self, "upstream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nextEvent");
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
      if (!v11)
        return v4;
    }
    -[BPSRemoveDuplicates setLast:](self, "setLast:", v4);
  }
  return v4;
}

- (void)reset
{
  objc_super v3;

  -[BPSRemoveDuplicates setLast:](self, "setLast:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BPSRemoveDuplicates;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)isDuplicate
{
  return self->_isDuplicate;
}

- (id)last
{
  return self->_last;
}

- (void)setLast:(id)a3
{
  objc_storeStrong(&self->_last, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_last, 0);
  objc_storeStrong(&self->_isDuplicate, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = objc_opt_class();
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v3, 0xCu);
}

@end
