@implementation MRUListeningModeController

- (NSArray)availableSecondaryListeningModes
{
  return self->_availableSecondaryListeningModes;
}

- (NSArray)availablePrimaryListeningModes
{
  return self->_availablePrimaryListeningModes;
}

- (MRUListeningModeController)initWithOutputDeviceRouteController:(id)a3
{
  id v5;
  MRUListeningModeController *v6;
  MRUListeningModeController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUListeningModeController;
  v6 = -[MRUListeningModeController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    -[MRUSystemOutputDeviceRouteController addObserver:](v7->_outputDeviceRouteController, "addObserver:", v7);
    -[MRUListeningModeController updatePrimaryListeningMode](v7, "updatePrimaryListeningMode");
    -[MRUListeningModeController updateSecondaryListeningMode](v7, "updateSecondaryListeningMode");
  }

  return v7;
}

- (void)setPrimaryListeningMode:(id)a3 completion:(id)a4
{
  id v6;
  MRUSystemOutputDeviceRouteController *outputDeviceRouteController;
  id v8;
  void *v9;
  NSString *primaryListeningMode;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  outputDeviceRouteController = self->_outputDeviceRouteController;
  v8 = a3;
  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](outputDeviceRouteController, "primaryOutputDeviceRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  primaryListeningMode = self->_primaryListeningMode;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__MRUListeningModeController_setPrimaryListeningMode_completion___block_invoke;
  v12[3] = &unk_1E5819E68;
  v13 = v6;
  v11 = v6;
  -[MRUListeningModeController setListeningMode:forOutputDeviceRoute:previousListeningMode:completion:](self, "setListeningMode:forOutputDeviceRoute:previousListeningMode:completion:", v8, v9, primaryListeningMode, v12);

}

uint64_t __65__MRUListeningModeController_setPrimaryListeningMode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSecondaryListeningMode:(id)a3 completion:(id)a4
{
  id v6;
  MRUSystemOutputDeviceRouteController *outputDeviceRouteController;
  id v8;
  void *v9;
  NSString *secondaryListeningMode;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  outputDeviceRouteController = self->_outputDeviceRouteController;
  v8 = a3;
  -[MRUSystemOutputDeviceRouteController secondaryOutputDeviceRoute](outputDeviceRouteController, "secondaryOutputDeviceRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  secondaryListeningMode = self->_secondaryListeningMode;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__MRUListeningModeController_setSecondaryListeningMode_completion___block_invoke;
  v12[3] = &unk_1E5819E68;
  v13 = v6;
  v11 = v6;
  -[MRUListeningModeController setListeningMode:forOutputDeviceRoute:previousListeningMode:completion:](self, "setListeningMode:forOutputDeviceRoute:previousListeningMode:completion:", v8, v9, secondaryListeningMode, v12);

}

uint64_t __67__MRUListeningModeController_setSecondaryListeningMode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a3
{
  -[MRUListeningModeController updatePrimaryListeningMode](self, "updatePrimaryListeningMode", a3);
  -[MRUListeningModeController updateSecondaryListeningMode](self, "updateSecondaryListeningMode");
}

- (void)setListeningMode:(id)a3 forOutputDeviceRoute:(id)a4 previousListeningMode:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "logicalLeaderOutputDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MCLogCategoryVolume();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v29 = objc_opt_class();
    v30 = 2114;
    v31 = v10;
    v32 = 2114;
    v33 = v12;
    v34 = 2114;
    v35 = v14;
    _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ set bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", buf, 0x2Au);
  }

  -[MRUSystemOutputDeviceRouteController systemRoute](self->_outputDeviceRouteController, "systemRoute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endpoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "routeUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __101__MRUListeningModeController_setListeningMode_forOutputDeviceRoute_previousListeningMode_completion___block_invoke;
  v23[3] = &unk_1E5819E90;
  v23[4] = self;
  v24 = v11;
  v26 = v10;
  v27 = v13;
  v25 = v12;
  v19 = v10;
  v20 = v12;
  v21 = v13;
  v22 = v11;
  objc_msgSend(v17, "setListeningMode:outputDeviceUID:queue:completion:", v19, v18, MEMORY[0x1E0C80D38], v23);

}

void __101__MRUListeningModeController_setListeningMode_forOutputDeviceRoute_previousListeningMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "code") == -11910)
  {
    objc_msgSend(*(id *)(a1 + 32), "listeningModeErrorMessageForOutputDevice:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v8 = v7;
  if (*(_QWORD *)(a1 + 48))
    v9 = *(const __CFString **)(a1 + 48);
  else
    v9 = CFSTR("nil");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D4C6D8]);
  if (*(_QWORD *)(a1 + 56))
    v10 = *(const __CFString **)(a1 + 56);
  else
    v10 = CFSTR("nil");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D4C6C8]);
  +[MRUSystemOutputDeviceRouteController outputContextDescription](MRUSystemOutputDeviceRouteController, "outputContextDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D4C6D0]);

  v13 = v8;
  v12 = v8;
  MRAnalyticsSendEvent();

}

id __101__MRUListeningModeController_setListeningMode_forOutputDeviceRoute_previousListeningMode_completion___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updatePrimaryListeningMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  NSArray *availablePrimaryListeningModes;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  NSString *primaryListeningMode;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  NSArray *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logicalLeaderOutputDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentBluetoothListeningMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableBluetoothListeningModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUListeningModeController sortedListeningModes:excludeModes:](self, "sortedListeningModes:excludeModes:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NSArray isEqualToArray:](self->_availablePrimaryListeningModes, "isEqualToArray:", v7);
  if (!v8)
  {
    MCLogCategoryVolume();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      availablePrimaryListeningModes = self->_availablePrimaryListeningModes;
      v17 = 138544130;
      v18 = v10;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = availablePrimaryListeningModes;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update available primary bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", (uint8_t *)&v17, 0x2Au);
    }

    objc_storeStrong((id *)&self->_availablePrimaryListeningModes, v7);
  }
  v12 = -[NSString isEqualToString:](self->_primaryListeningMode, "isEqualToString:", v5);
  if (!v12)
  {
    MCLogCategoryVolume();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      primaryListeningMode = self->_primaryListeningMode;
      v17 = 138544130;
      v18 = v14;
      v19 = 2114;
      v20 = v5;
      v21 = 2114;
      v22 = (NSArray *)primaryListeningMode;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ update primary bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", (uint8_t *)&v17, 0x2Au);
    }

    objc_storeStrong((id *)&self->_primaryListeningMode, v5);
  }
  -[MRUListeningModeController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "listeningModeController:didChangeAvailablePrimaryListeningMode:", self, v7);
  if (!v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "listeningModeController:didChangePrimaryListeningMode:", self, v5);

}

- (void)updateSecondaryListeningMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  NSArray *availableSecondaryListeningModes;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  NSString *secondaryListeningMode;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  NSArray *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MRUSystemOutputDeviceRouteController secondaryOutputDeviceRoute](self->_outputDeviceRouteController, "secondaryOutputDeviceRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logicalLeaderOutputDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentBluetoothListeningMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableBluetoothListeningModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUListeningModeController sortedListeningModes:excludeModes:](self, "sortedListeningModes:excludeModes:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NSArray isEqualToArray:](self->_availableSecondaryListeningModes, "isEqualToArray:", v7);
  if (!v8)
  {
    MCLogCategoryVolume();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      availableSecondaryListeningModes = self->_availableSecondaryListeningModes;
      v17 = 138544130;
      v18 = v10;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = availableSecondaryListeningModes;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update available secondary bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", (uint8_t *)&v17, 0x2Au);
    }

    objc_storeStrong((id *)&self->_availableSecondaryListeningModes, v7);
  }
  v12 = -[NSString isEqualToString:](self->_secondaryListeningMode, "isEqualToString:", v5);
  if (!v12)
  {
    MCLogCategoryVolume();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      secondaryListeningMode = self->_secondaryListeningMode;
      v17 = 138544130;
      v18 = v14;
      v19 = 2114;
      v20 = v5;
      v21 = 2114;
      v22 = (NSArray *)secondaryListeningMode;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ update secondary bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", (uint8_t *)&v17, 0x2Au);
    }

    objc_storeStrong((id *)&self->_secondaryListeningMode, v5);
  }
  -[MRUListeningModeController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "listeningModeController:didChangeAvailableSecondaryListeningModes:", self, v7);
  if (!v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "listeningModeController:didChangeSecondaryListeningMode:", self, v5);

}

- (id)sortedListeningModes:(id)a3 excludeModes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v8 = *MEMORY[0x1E0C8AB78];
  if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C8AB78])
    && (objc_msgSend(v5, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v8);
  }
  v9 = *MEMORY[0x1E0C8AB68];
  if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C8AB68])
    && (objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v9);
  }
  v10 = *MEMORY[0x1E0C8AB70];
  if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C8AB70])
    && (objc_msgSend(v5, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v10);
  }
  v11 = *MEMORY[0x1E0C8AB60];
  if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C8AB60])
    && (objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v11);
  }

  return v7;
}

- (id)listeningModeErrorMessageForOutputDevice:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isB515Route"))
  {
    +[MRUStringsProvider listeningModeErrorMessageB515](MRUStringsProvider, "listeningModeErrorMessageB515");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isB507Route"))
  {
    +[MRUStringsProvider listeningModeErrorMessageB507](MRUStringsProvider, "listeningModeErrorMessageB507");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isB494Route"))
  {
    +[MRUStringsProvider listeningModeErrorMessageB494](MRUStringsProvider, "listeningModeErrorMessageB494");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "isB607Route"))
  {
    +[MRUStringsProvider listeningModeErrorMessageB607](MRUStringsProvider, "listeningModeErrorMessageB607");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MRUStringsProvider listeningModeErrorMessage](MRUStringsProvider, "listeningModeErrorMessage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUListeningModeControllerDelegate)delegate
{
  return (MRUListeningModeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)primaryListeningMode
{
  return self->_primaryListeningMode;
}

- (NSString)secondaryListeningMode
{
  return self->_secondaryListeningMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryListeningMode, 0);
  objc_storeStrong((id *)&self->_availableSecondaryListeningModes, 0);
  objc_storeStrong((id *)&self->_primaryListeningMode, 0);
  objc_storeStrong((id *)&self->_availablePrimaryListeningModes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end
