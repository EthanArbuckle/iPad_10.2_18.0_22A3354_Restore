@implementation IPPublishedIdentityProgress

- (IPPublishedIdentityProgress)initWithAppIdentity:(id)a3 observer:(id)a4
{
  id v6;
  id v7;
  IPPublishedIdentityProgress *v8;
  IPPublishedIdentityProgress *v9;
  IPInstallableProgressData *v10;
  IPInstallableProgressData *progressData;
  uint64_t v12;
  MIAppIdentity *miIdentity;
  uint64_t v14;
  id v15;
  LSApplicationIdentity *lsIdentity;
  NSObject *v17;
  NSObject *v18;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IPPublishedIdentityProgress;
  v8 = -[IPPublishedIdentityProgress init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_alloc_init(IPInstallableProgressData);
    progressData = v9->_progressData;
    v9->_progressData = v10;

    v12 = objc_msgSend(v6, "copy");
    miIdentity = v9->_miIdentity;
    v9->_miIdentity = (MIAppIdentity *)v12;

    v20 = 0;
    IPLSIdentityFromMIIdentity(v6, &v20);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v20;
    lsIdentity = v9->_lsIdentity;
    v9->_lsIdentity = (LSApplicationIdentity *)v14;

    if (!v9->_lsIdentity)
    {
      _IPServerLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[IPPublishedIdentityProgress initWithAppIdentity:observer:].cold.1((uint64_t)v6, (uint64_t)v15, v17);

    }
    objc_storeWeak((id *)&v9->_observer, v7);
    _IPDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2048;
      v25 = v7;
      _os_log_impl(&dword_23F108000, v18, OS_LOG_TYPE_DEFAULT, "Created published identity progress for %@, observer %p", buf, 0x16u);
    }

  }
  return v9;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[MIAppIdentity bundleID](self->_miIdentity, "bundleID");
}

- (NSString)personaUniqueString
{
  return (NSString *)-[MIAppIdentity personaUniqueString](self->_miIdentity, "personaUniqueString");
}

- (id)miIdentity
{
  return self->_miIdentity;
}

- (id)lsIdentity
{
  return self->_lsIdentity;
}

- (id)currentProgress
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__IPPublishedIdentityProgress_currentProgress__block_invoke;
  v4[3] = &unk_250FA3B78;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __46__IPPublishedIdentityProgress_currentProgress__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)completedUnitCountForPhase:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__IPPublishedIdentityProgress_completedUnitCountForPhase___block_invoke;
  v5[3] = &unk_250FA3CB0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  IPDoWithLock(&self->_lock, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__IPPublishedIdentityProgress_completedUnitCountForPhase___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "completedUnitCountForPhase:", IPProgressPhaseForLSInstallPhase(a1[6]));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)setCompletedUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4
{
  id WeakRetained;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__IPPublishedIdentityProgress_setCompletedUnitCount_forPhase___block_invoke;
  v6[3] = &unk_250FA3CD8;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = self;
  v6[5] = &v7;
  IPDoWithLock(&self->_lock, v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "identityProgress:didChangeProgressData:", self, v8[5]);

  _Block_object_dispose(&v7, 8);
}

void __62__IPPublishedIdentityProgress_setCompletedUnitCount_forPhase___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "setCompletedUnitCount:forPhase:", a1[6], IPProgressPhaseForLSInstallPhase(a1[7]));
  v2 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)totalUnitCountForPhase:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__IPPublishedIdentityProgress_totalUnitCountForPhase___block_invoke;
  v5[3] = &unk_250FA3CB0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  IPDoWithLock(&self->_lock, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__IPPublishedIdentityProgress_totalUnitCountForPhase___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "totalUnitCountForPhase:", IPProgressPhaseForLSInstallPhase(a1[6]));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)setTotalUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPPublishedIdentityProgress setTotalUnitCountsForPhases:](self, "setTotalUnitCountsForPhases:", v8);

}

- (void)setTotalUnitCountsForPhases:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", IPProgressPhaseForLSInstallPhase(objc_msgSend(v10, "unsignedLongLongValue")));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v7);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__IPPublishedIdentityProgress_setTotalUnitCountsForPhases___block_invoke;
  v15[3] = &unk_250FA3D00;
  v15[4] = self;
  v13 = v5;
  v16 = v13;
  v17 = &v22;
  IPDoWithLock(&self->_lock, v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "identityProgress:didChangeProgressData:", self, v23[5]);

  _Block_object_dispose(&v22, 8);
}

void __59__IPPublishedIdentityProgress_setTotalUnitCountsForPhases___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "setTotalUnitCountsForPhases:", a1[5]);
  v2 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)finishProgressWithState:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "identityProgress:didFinishWithState:", self, a3);

}

- (void)setInstallPhase:(unint64_t)a3
{
  id WeakRetained;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__IPPublishedIdentityProgress_setInstallPhase___block_invoke;
  v5[3] = &unk_250FA3D28;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  IPDoWithLock(&self->_lock, v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "identityProgress:didChangeProgressData:", self, v7[5]);

  _Block_object_dispose(&v6, 8);
}

void __47__IPPublishedIdentityProgress_setInstallPhase___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "setInstallPhase:", IPProgressPhaseForLSInstallPhase(a1[6]));
  v2 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)installPhase
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__IPPublishedIdentityProgress_installPhase__block_invoke;
  v4[3] = &unk_250FA3B78;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  v2 = LSInstallPhaseForIPProgressPhase(v6[3]);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__IPPublishedIdentityProgress_installPhase__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "installPhase");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setFinalPhase:(unint64_t)a3
{
  id WeakRetained;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__IPPublishedIdentityProgress_setFinalPhase___block_invoke;
  v5[3] = &unk_250FA3D28;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  IPDoWithLock(&self->_lock, v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "identityProgress:didChangeProgressData:", self, v7[5]);

  _Block_object_dispose(&v6, 8);
}

void __45__IPPublishedIdentityProgress_setFinalPhase___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "setFinalPhase:", IPProgressPhaseForLSInstallPhase(a1[6]));
  v2 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)finalPhase
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__IPPublishedIdentityProgress_finalPhase__block_invoke;
  v4[3] = &unk_250FA3B78;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  v2 = LSInstallPhaseForIPProgressPhase(v6[3]);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__IPPublishedIdentityProgress_finalPhase__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "finalPhase");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_lsIdentity, 0);
  objc_storeStrong((id *)&self->_miIdentity, 0);
  objc_storeStrong((id *)&self->_progressData, 0);
}

- (void)initWithAppIdentity:(os_log_t)log observer:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_23F108000, log, OS_LOG_TYPE_FAULT, "could not get LS identity from MI identity %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
