@implementation BRProgressProxy

- (BRProgressProxy)initWithURL:(id)a3
{
  id v5;
  BRProgressProxy *v6;
  BRProgressProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRProgressProxy;
  v6 = -[BRProgressProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _globalProgressSubscriber == nil%@", (uint8_t *)&v2, 0xCu);
}

- (void)start
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id globalProgressSubscriber;
  uint64_t v13;
  _QWORD v14[5];

  -[BRProgressProxy setTotalUnitCount:](self, "setTotalUnitCount:", -1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat(CFSTR("PROGRESS_PROXY_INIT"), CFSTR("Localizable"), v3, v4, v5, v6, v7, v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRProgressProxy setLocalizedDescription:](self, "setLocalizedDescription:", v9);

  -[BRProgressProxy setLocalizedAdditionalDescription:](self, "setLocalizedAdditionalDescription:", 0);
  -[BRProgressProxy setCancellable:](self, "setCancellable:", 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __24__BRProgressProxy_start__block_invoke;
  v14[3] = &unk_1E3DA6378;
  v14[4] = self;
  v10 = (void *)MEMORY[0x1A1AD85E4](v14);
  objc_msgSend(MEMORY[0x1E0CB38A8], "_addSubscriberForFileURL:withPublishingHandler:", self->_url, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  globalProgressSubscriber = self->_globalProgressSubscriber;
  self->_globalProgressSubscriber = v11;

}

id __24__BRProgressProxy_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v4, "progressProxy:shouldProxyProgress:", *(_QWORD *)(a1 + 32), v3))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("localizedDescription"), 4, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("localizedAdditionalDescription"), 4, 0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __24__BRProgressProxy_start__block_invoke_2;
    v13[3] = &unk_1E3DA4A70;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v15 = v6;
    v7 = (void *)MEMORY[0x1A1AD85E4](v13);
    v11 = (void *)MEMORY[0x1A1AD85E4](v7, v8, v9, v10);

  }
  return v11;
}

uint64_t __24__BRProgressProxy_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("localizedDescription"));
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("localizedAdditionalDescription"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat(CFSTR("PROGRESS_PROXY_FINAL"), CFSTR("Localizable"), v2, v3, v4, v5, v6, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLocalizedDescription:", v8);

  objc_msgSend(*(id *)(a1 + 40), "setLocalizedAdditionalDescription:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setTotalUnitCount:", -1);
  objc_msgSend(*(id *)(a1 + 40), "setLocalizedDescription:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setLocalizedAdditionalDescription:", 0);
}

- (void)stop
{
  id globalProgressSubscriber;

  objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:", self->_globalProgressSubscriber);
  globalProgressSubscriber = self->_globalProgressSubscriber;
  self->_globalProgressSubscriber = 0;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v11;
    -[BRProgressProxy delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v14, "progressProxy:localizedDescriptionForProgress:", self, v13),
          (v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v13, "localizedDescription");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    -[BRProgressProxy setLocalizedDescription:](self, "setLocalizedDescription:", v15);

    objc_msgSend(v13, "localizedAdditionalDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRProgressProxy setLocalizedAdditionalDescription:](self, "setLocalizedAdditionalDescription:", v17);

    -[BRProgressProxy setTotalUnitCount:](self, "setTotalUnitCount:", objc_msgSend(v13, "totalUnitCount"));
    -[BRProgressProxy setCompletedUnitCount:](self, "setCompletedUnitCount:", objc_msgSend(v13, "completedUnitCount"));

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BRProgressProxy;
    -[BRProgressProxy observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BRProgressProxyDelegate)delegate
{
  return (BRProgressProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_globalProgressSubscriber, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
