@implementation MPCLeaseController

- (void)setStackController:(id)a3
{
  objc_storeWeak((id *)&self->_stackController, a3);
}

- (MPCLeaseController)initWithTranslator:(id)a3 leaseManager:(id)a4
{
  id v7;
  id v8;
  MPCLeaseController *v9;
  MPCLeaseController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCLeaseController;
  v9 = -[MPCLeaseController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_translator, a3);
    objc_storeStrong((id *)&v10->_leaseManager, a4);
  }

  return v10;
}

- (void)requestLeaseForItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  MPCLeaseController *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v28 = self;
    v29 = 2114;
    v30 = v6;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseController: %p -  Requesting lease for %{public}@", buf, 0x16u);
  }

  -[MPCLeaseController leaseManager](self, "leaseManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCanStealLeaseIfNeeded");

  -[MPCLeaseController translator](self, "translator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "MPAVItemForMFPlayerItem:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resumeContentKeySession");
  LODWORD(v12) = 1.0;
  objc_msgSend(v11, "prepareForRate:completionHandler:", v7, v12);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[MPCLeaseController stackController](self, "stackController", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nextItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18);
        -[MPCLeaseController translator](self, "translator");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "MPAVItemForMFPlayerItem:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v21)
          objc_msgSend(v21, "resumeContentKeySession");

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

}

- (void)relinquishLeaseForItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  MPCLeaseController *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v27 = self;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseController: %p -  Relinquishing lease for %{public}@", buf, 0x16u);
  }

  -[MPCLeaseController translator](self, "translator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "MPAVItemForMFPlayerItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = 0;
  objc_msgSend(v10, "prepareForRate:completionHandler:", v7, v11);
  objc_msgSend(v10, "pauseContentKeySession");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[MPCLeaseController stackController](self, "stackController", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nextItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
        -[MPCLeaseController translator](self, "translator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "MPAVItemForMFPlayerItem:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v20)
          objc_msgSend(v20, "pauseContentKeySession");

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

}

- (MFPlaybackStackController)stackController
{
  return (MFPlaybackStackController *)objc_loadWeakRetained((id *)&self->_stackController);
}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (_MPCLeaseManager)leaseManager
{
  return self->_leaseManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaseManager, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_destroyWeak((id *)&self->_stackController);
}

@end
