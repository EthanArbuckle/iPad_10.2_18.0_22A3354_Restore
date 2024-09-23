@implementation BREvictItemOperation

- (BREvictItemOperation)initWithURL:(id)a3
{
  id v5;
  BREvictItemOperation *v6;
  BREvictItemOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BREvictItemOperation;
  v6 = -[BROperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (id)description
{
  BREvictItemOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = v2;
  v7.super_class = (Class)BREvictItemOperation;
  -[BROperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ url=%@"), v4, v2->_url);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v5;
}

- (void)main
{
  $3C52EB5FA2A5D3907B44D7DBAB114CA7 *p_section;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSURL *v9;
  id v10;
  void *v11;
  NSURL *v12;
  NSURL *url;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  NSURL *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_section = &self->_section;
  v16 = 0uLL;
  v17 = 0;
  __brc_create_section(0, (uint64_t)"-[BREvictItemOperation main]", 33, &v16);
  brc_bread_crumbs((uint64_t)"-[BREvictItemOperation main]", 33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    *(_DWORD *)buf = 134218498;
    v19 = v16;
    v20 = 2112;
    v21 = url;
    v22 = 2112;
    v23 = v4;
    _os_log_debug_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx evicting item at: %@%@", buf, 0x20u);
  }

  *(_OWORD *)&p_section->sectionID = v16;
  *(_QWORD *)&p_section->line = v17;
  if (BRIsFPFSEnabled(v6, v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_url;
    v15 = 0;
    objc_msgSend(v8, "evictUbiquitousItemAtURL:error:", v9, &v15);
    v10 = v15;

    -[BROperation completedWithResult:error:](self, "completedWithResult:error:", 0, v10);
  }
  else
  {
    -[BROperation remoteLegacyObject](self, "remoteLegacyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_url;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __28__BREvictItemOperation_main__block_invoke;
    v14[3] = &unk_1E3DA47F0;
    v14[4] = self;
    objc_msgSend(v11, "startOperation:toEvictItemAtURL:reply:", self, v12, v14);

  }
}

uint64_t __28__BREvictItemOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSURL *url;
  objc_super v13;
  $3C52EB5FA2A5D3907B44D7DBAB114CA7 section;
  uint8_t buf[4];
  unint64_t sectionID;
  __int16 v17;
  NSURL *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  section = self->_section;
  brc_bread_crumbs((uint64_t)"-[BREvictItemOperation finishWithResult:error:]", 48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    *(_DWORD *)buf = 134218498;
    sectionID = section.sectionID;
    v17 = 2112;
    v18 = url;
    v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx eviction for %@ finished%@", buf, 0x20u);
  }

  -[BREvictItemOperation evictionCompletionBlock](self, "evictionCompletionBlock");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v7);
    -[BREvictItemOperation setEvictionCompletionBlock:](self, "setEvictionCompletionBlock:", 0);
  }

  v13.receiver = self;
  v13.super_class = (Class)BREvictItemOperation;
  -[BROperation finishWithResult:error:](&v13, sel_finishWithResult_error_, v6, v7);
  __brc_leave_section((uint64_t)&section);

}

- (id)evictionCompletionBlock
{
  return objc_getProperty(self, a2, 328, 1);
}

- (void)setEvictionCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_evictionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
