@implementation NICarKeyEventNotifier

- (NICarKeyEventNotifier)initWithParentSession:(id)a3
{
  id v4;
  NICarKeyEventNotifier *v5;
  NICarKeyEventNotifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NICarKeyEventNotifier;
  v5 = -[NICarKeyEventNotifier init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->parentSession, v4);

  return v6;
}

- (void)notifyVehicleUnlockedWithReason:(int64_t)a3
{
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1E43702E8;
    v15[0] = CFSTR("CarKeyEventType");
    v15[1] = CFSTR("CarKeyEventReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__NICarKeyEventNotifier_notifyVehicleUnlockedWithReason___block_invoke;
    block[3] = &unk_1E43622A8;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2062, CFSTR("Parent session is nil"));

  }
}

void __57__NICarKeyEventNotifier_notifyVehicleUnlockedWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processCarKeyEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_0);

}

- (void)notifyVehicleLockedWithReason:(int64_t)a3
{
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1E4370300;
    v15[0] = CFSTR("CarKeyEventType");
    v15[1] = CFSTR("CarKeyEventReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__NICarKeyEventNotifier_notifyVehicleLockedWithReason___block_invoke;
    block[3] = &unk_1E43622A8;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2076, CFSTR("Parent session is nil"));

  }
}

void __55__NICarKeyEventNotifier_notifyVehicleLockedWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processCarKeyEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1035);

}

- (void)notifyVehicleReadyToDriveWithReason:(int64_t)a3
{
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1E4370318;
    v15[0] = CFSTR("CarKeyEventType");
    v15[1] = CFSTR("CarKeyEventReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__NICarKeyEventNotifier_notifyVehicleReadyToDriveWithReason___block_invoke;
    block[3] = &unk_1E43622A8;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2090, CFSTR("Parent session is nil"));

  }
}

void __61__NICarKeyEventNotifier_notifyVehicleReadyToDriveWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processCarKeyEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1037);

}

- (void)notifyRangingIntentSentToVehicleWithReason:(int64_t)a3
{
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1E4370330;
    v15[0] = CFSTR("CarKeyEventType");
    v15[1] = CFSTR("CarKeyEventReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__NICarKeyEventNotifier_notifyRangingIntentSentToVehicleWithReason___block_invoke;
    block[3] = &unk_1E43622A8;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2104, CFSTR("Parent session is nil"));

  }
}

void __68__NICarKeyEventNotifier_notifyRangingIntentSentToVehicleWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processCarKeyEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1039);

}

- (void)notifyVehicleTerminatedRangingSession
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v12 = CFSTR("CarKeyEventType");
    v13[0] = &unk_1E4370348;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__NICarKeyEventNotifier_notifyVehicleTerminatedRangingSession__block_invoke;
    block[3] = &unk_1E43622A8;
    v10 = WeakRetained;
    v11 = v5;
    v7 = v5;
    dispatch_sync(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2118, CFSTR("Parent session is nil"));

  }
}

void __62__NICarKeyEventNotifier_notifyVehicleTerminatedRangingSession__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processCarKeyEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1041);

}

- (void)notifyVehicleSentRangingSuspendedSubEvent
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v12 = CFSTR("CarKeyEventType");
    v13[0] = &unk_1E4370360;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__NICarKeyEventNotifier_notifyVehicleSentRangingSuspendedSubEvent__block_invoke;
    block[3] = &unk_1E43622A8;
    v10 = WeakRetained;
    v11 = v5;
    v7 = v5;
    dispatch_sync(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2132, CFSTR("Parent session is nil"));

  }
}

void __66__NICarKeyEventNotifier_notifyVehicleSentRangingSuspendedSubEvent__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processCarKeyEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1043);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->parentSession);
}

@end
