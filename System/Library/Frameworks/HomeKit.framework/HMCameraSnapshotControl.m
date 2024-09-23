@implementation HMCameraSnapshotControl

- (void)takeSnapshot
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc(MEMORY[0x1E0D28540]);
  v5 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1A1AC1500](self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@, %s:%ld"), v6, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Camera/Source/Snapshot/HMCameraSnapshotControl.m", 64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithName:", v7);

  -[HMCameraSnapshotControl snapshotControl](self, "snapshotControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "takeSnapshot");

  __HMFActivityScopeLeave();
}

- (HMCameraSnapshot)mostRecentSnapshot
{
  void *v2;
  void *v3;

  -[HMCameraSnapshotControl snapshotControl](self, "snapshotControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostRecentSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraSnapshot *)v3;
}

- (_HMCameraSnapshotControl)snapshotControl
{
  return (_HMCameraSnapshotControl *)objc_getProperty(self, a2, 24, 1);
}

- (HMCameraSnapshotControl)initWithSnapshotControl:(id)a3
{
  id v5;
  HMCameraSnapshotControl *v6;
  HMCameraSnapshotControl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCameraSnapshotControl;
  v6 = -[HMCameraControl init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_snapshotControl, a3);
    -[_HMCameraSnapshotControl setDelegate:](v7->_snapshotControl, "setDelegate:", v7);
  }

  return v7;
}

uint64_t __40___HMCameraSnapshotControl_takeSnapshot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_takeSnapshot");
}

void __41___HMCameraSnapshotControl__takeSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138543874;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response for snapshot request with session ID %@: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v9, "_handleSnapshot:error:isMostRecent:", v6, v5, 0);

}

void __67___HMCameraSnapshotControl__notifyDelegateOfDidTakeSnapshot_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "hmPublicError");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cameraSnapshotControl:didTakeSnapshot:error:", v2, v3, v4);

}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[HMCameraSnapshotControl delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "cameraSnapshotControl:didTakeSnapshot:error:", self, v9, v7);

}

- (id)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return WeakRetained;
}

void __39___HMCameraSnapshotControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21;
  logCategory__hmf_once_v21 = v0;

}

- (void)setDelegate:(id)delegate
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __70___HMCameraSnapshotControl__notifyDelegateOfMostRecentSnapshotUpdated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cameraSnapshotControlDidUpdateMostRecentSnapshot:", *(_QWORD *)(a1 + 40));
}

uint64_t __85___HMCameraSnapshotControl__fetchCameraSnapshotForBulletinContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCreateSnapshotWithBulletinContext:error:completionHandler:", a3, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __52___HMCameraSnapshotControl_mergeNewSnapshotControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfMostRecentSnapshotUpdated");
}

uint64_t __84___HMCameraSnapshotControl_fetchCameraSnapshotForBulletinContext_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCameraSnapshotForBulletinContext:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (HMCameraSnapshotControl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraSnapshotControl;
  return -[HMCameraControl init](&v3, sel_init);
}

- (void)fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMCameraSnapshotControl snapshotControl](self, "snapshotControl");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchCameraSnapshotForBulletinContext:completionHandler:", v7, v6);

}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HMCameraSnapshotControl delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE459B30))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "cameraSnapshotControlDidUpdateMostRecentSnapshot:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
