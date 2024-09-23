@implementation HUMediaSystemEditorHelper

- (HUMediaSystemEditorHelper)initWithDelegate:(id)a3
{
  id v4;
  HUMediaSystemEditorHelper *v5;
  HUMediaSystemEditorHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUMediaSystemEditorHelper;
  v5 = -[HUMediaSystemEditorHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  void *v2;
  void *v3;

  -[HUMediaSystemEditorHelper delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaSystemBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFMediaSystemBuilder *)v3;
}

- (id)createMediaSystemWithAccessory:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUMediaSystemEditorHelper inFlightCommitFuture](self, "inFlightCommitFuture");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[HUMediaSystemEditorHelper inFlightCommitFuture](self, "inFlightCommitFuture"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isFinished"),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_INFO, "Skipping '%@'; createNewMediaSystem already in progress.",
        buf,
        0xCu);

    }
    v21 = 0;
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
          -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstSetupSourceAccessory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 != v18)
          {
            -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeAccessory:", v16);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAccessory:", v5);

    -[HUMediaSystemEditorHelper createMediaSystem](self, "createMediaSystem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)createMediaSystem
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id location[2];

  -[HUMediaSystemEditorHelper inFlightCommitFuture](self, "inFlightCommitFuture");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HUMediaSystemEditorHelper inFlightCommitFuture](self, "inFlightCommitFuture"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isFinished"),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    -[HUMediaSystemEditorHelper inFlightCommitFuture](self, "inFlightCommitFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUMediaSystemEditorHelper delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaSystemEditorHelperDidBeginCommitting:", self);

    -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    -[HUMediaSystemEditorHelper _checkIfAccessoriesNeedSoftwareUpdateToSupportPairing](self, "_checkIfAccessoriesNeedSoftwareUpdateToSupportPairing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke;
    v33[3] = &unk_1E6F568D0;
    v33[4] = self;
    objc_msgSend(v9, "flatMap:", v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v10;
    v31[1] = 3221225472;
    v31[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_2;
    v31[3] = &unk_1E6F55A00;
    v31[4] = self;
    v12 = v8;
    v32 = v12;
    objc_msgSend(v11, "flatMap:", v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_3;
    v30[3] = &unk_1E6F514A0;
    v30[4] = self;
    objc_msgSend(v13, "flatMap:", v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_4;
    v28[3] = &unk_1E6F55A00;
    v28[4] = self;
    v15 = v12;
    v29 = v15;
    objc_msgSend(v14, "flatMap:", v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_5;
    v26[3] = &unk_1E6F514A0;
    v17 = v15;
    v27 = v17;
    objc_msgSend(v16, "flatMap:", v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v10;
    v22 = 3221225472;
    v23 = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_6;
    v24 = &unk_1E6F4E380;
    objc_copyWeak(&v25, location);
    v19 = (id)objc_msgSend(v18, "addCompletionBlock:", &v21);
    -[HUMediaSystemEditorHelper setInFlightCommitFuture:](self, "setInFlightCommitFuture:", v18, v21, v22, v23, v24);
    objc_destroyWeak(&v25);

    objc_destroyWeak(location);
  }
  return v18;
}

uint64_t __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promptForRoomChange");
}

uint64_t __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeAppleMusicAccountReconcilationForMediaSystemBuilder:", *(_QWORD *)(a1 + 40));
}

id __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "accountArbitrationFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "accountArbitrationFuture");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executePreferredMediaUserReconcilationForMediaSystemBuilder:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitItem");
}

void __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setInFlightCommitFuture:", 0);
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_7;
  v10[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v11, v7);
  objc_msgSend(v9, "performBlock:", v10);

  objc_destroyWeak(&v11);
}

void __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_7(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mediaSystemEditorHelperDidEndCommitting:", WeakRetained);

}

- (id)_promptForRoomChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id location;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = (id)objc_opt_new();
  -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_138);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count") == 1)
  {
    objc_msgSend(v22, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "finishWithResult:", v4);

  }
  else
  {
    objc_initWeak(&location, self);
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSystemEditorGridViewControllerRoomChangeAlertTitle"), CFSTR("HUMediaSystemEditorGridViewControllerRoomChangeAlertTitle"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1E0CEA2E0];
          objc_msgSend(v11, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_3;
          v27[3] = &unk_1E6F51FB8;
          objc_copyWeak(&v29, &location);
          v27[4] = v11;
          v28 = v24;
          objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v27);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addAction:", v14);

          objc_destroyWeak(&v29);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }

    v15 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_4;
    v25[3] = &unk_1E6F4C6E0;
    v26 = v24;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v17);

    -[HUMediaSystemEditorHelper delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mediaSystemEditorHelper:needsToPresentViewController:animated:completion:", self, v5, 1, 0);

    objc_destroyWeak(&location);
  }

  return v24;
}

uint64_t __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "room");
}

uint64_t __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

void __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_configureMediaSystemBuilderToMoveHomePodsToRoom:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(a1 + 32));

}

void __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (void)_configureMediaSystemBuilderToMoveHomePodsToRoom:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0D31700];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithExistingObject:inHome:", v5, v7);

  -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRoom:", v8);

  -[HUMediaSystemEditorHelper delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaSystemEditorHelper:didModifyMediaSystemBuilder:", self, v10);

}

- (id)_executePreferredMediaUserReconcilationForMediaSystemBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v42;
  HUMediaSystemEditorHelper *v43;
  void *v44;
  id obj;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "preferredMediaUser");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "na_safeAddObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "hmf_isEmpty"))
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
LABEL_22:
    objc_msgSend(v14, "futureWithNoResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    v15 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(v7, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithResult:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_msgSend(v7, "count");
    v19 = objc_msgSend(v8, "count");
    v14 = (void *)MEMORY[0x1E0D519C0];
    if (v18 != v19)
      goto LABEL_22;
    v43 = self;
    v44 = v4;
    v20 = (void *)objc_opt_new();
    v42 = (void *)objc_opt_new();
    v21 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSystemEditorViewControllerPrimaryUserSelectionAlertTitle"), CFSTR("HUMediaSystemEditorViewControllerPrimaryUserSelectionAlertTitle"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "alertControllerWithTitle:message:preferredStyle:", v22, 0, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v7;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v58 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          v29 = (void *)MEMORY[0x1E0CEA2E0];
          objc_msgSend(v28, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke;
          v54[3] = &unk_1E6F526C8;
          v55 = v20;
          v56 = v28;
          objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 0, v54);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addAction:", v31);

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v25);
    }

    v32 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_2;
    v52[3] = &unk_1E6F4C6E0;
    v35 = v20;
    v53 = v35;
    objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 1, v52);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    objc_msgSend(v23, "addAction:", v36);

    -[HUMediaSystemEditorHelper delegate](v43, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v34;
    v50[1] = 3221225472;
    v50[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_3;
    v50[3] = &unk_1E6F4D988;
    v38 = v42;
    v51 = v38;
    objc_msgSend(v37, "mediaSystemEditorHelper:needsToPresentViewController:animated:completion:", v43, v23, 1, v50);

    v46[0] = v34;
    v46[1] = 3221225472;
    v46[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_4;
    v46[3] = &unk_1E6F56960;
    v4 = v44;
    v47 = v44;
    v48 = v35;
    v49 = v38;
    v39 = v38;
    v40 = v35;
    objc_msgSend(v40, "flatMap:", v46);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_23:

  return v17;
}

uint64_t __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

void __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

uint64_t __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

id __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setPreferredMediaUser:", a2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_5;
  v6[3] = &unk_1E6F56938;
  v3 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_executeAppleMusicAccountReconcilationForMediaSystemBuilder:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  id obj;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id location;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v38, "na_all:", &__block_literal_global_21_1);
  objc_msgSend(v38, "na_map:", &__block_literal_global_22_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v11, "username");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v8);
  }

  v13 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v39, "count"))
  {
    if (objc_msgSend(v39, "count") == 1)
      v15 = v4;
    else
      v15 = 0;
    v16 = (void *)MEMORY[0x1E0D519C0];
    if (v15 == 1)
    {
      objc_msgSend(v39, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "futureWithResult:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v41 = (void *)objc_opt_new();
      v35 = (void *)objc_opt_new();
      if (v4)
      {
        v19 = (void *)MEMORY[0x1E0CEA2E8];
        _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSystemEditorViewControllerAccountSelectionAlertTitle"), CFSTR("HUMediaSystemEditorViewControllerAccountSelectionAlertTitle"), 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v20, 0, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        obj = v39;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v58 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
              v25 = (void *)MEMORY[0x1E0CEA2E0];
              objc_msgSend(v24, "username", v35);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v54[0] = MEMORY[0x1E0C809B0];
              v54[1] = 3221225472;
              v54[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_3;
              v54[3] = &unk_1E6F526C8;
              v55 = v41;
              v56 = v24;
              objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 0, v54);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addAction:", v27);

            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          }
          while (v21);
        }

        v28 = (void *)MEMORY[0x1E0CEA2E0];
        _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_4;
        v52[3] = &unk_1E6F4C6E0;
        v53 = v41;
        objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 1, v52);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addAction:", v30);

        -[HUMediaSystemEditorHelper delegate](self, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_5;
        v50[3] = &unk_1E6F4D988;
        v51 = v35;
        objc_msgSend(v31, "mediaSystemEditorHelper:needsToPresentViewController:animated:completion:", self, v42, 1, v50);

      }
      else
      {
        objc_msgSend(v35, "finishWithNoResult");
        objc_msgSend(v39, "anyObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "finishWithResult:", v42);
      }

      objc_initWeak(&location, self);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_6;
      v43[3] = &unk_1E6F569F0;
      objc_copyWeak(&v48, &location);
      v44 = v38;
      v45 = v37;
      v32 = v41;
      v46 = v32;
      v33 = v35;
      v47 = v33;
      objc_msgSend(v32, "flatMap:", v43);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

BOOL __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "remoteLoginHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggedInAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

id __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "remoteLoginHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggedInAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

void __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

uint64_t __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

id __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_6(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = (id *)(a1 + 64);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_alloc(MEMORY[0x1E0D31180]);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "_authKitContextGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithAccessories:account:contextGenerator:", v7, v4, v8);

  objc_msgSend(*(id *)(a1 + 40), "setAccountArbitrator:", v9);
  objc_msgSend(v9, "pendingArbitrationExecutionFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAccountArbitrationFuture:", v10);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_7;
  v14[3] = &unk_1E6F569C8;
  v11 = *(void **)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v11, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_7(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_authKitContextGenerator
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HUMediaSystemEditorHelper__authKitContextGenerator__block_invoke;
  aBlock[3] = &unk_1E6F56A40;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __53__HUMediaSystemEditorHelper__authKitContextGenerator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v5 = a3;
  objc_msgSend(a2, "remoteLoginHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_appleMusicInAppAuthenticationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reschedule:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__HUMediaSystemEditorHelper__authKitContextGenerator__block_invoke_2;
  v14[3] = &unk_1E6F56A18;
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v5;
  v16 = v10;
  v11 = v5;
  objc_msgSend(v9, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __53__HUMediaSystemEditorHelper__authKitContextGenerator__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicPromptTitle"), CFSTR("HUAppleMusicPromptTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUsername:", v6);

    objc_msgSend(v3, "setIsUsernameEditable:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicPromptReason"), CFSTR("HUAppleMusicPromptReason"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\n\n%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setReason:", v9);

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicPromptReason"), CFSTR("HUAppleMusicPromptReason"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setReason:", v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaSystemHelperPresentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", v11);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_checkIfAccessoriesNeedSoftwareUpdateToSupportPairing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  HUMediaSystemEditorHelper *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;

  -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_37_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstSetupSourceAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUMediaSystemEditorHelper mediaSystemBuilder](self, "mediaSystemBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem"))
      v13 = v7;
    else
      v13 = v12;
    v32 = v13;
    v14 = (void *)objc_opt_new();
    v15 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredTitle"), CFSTR("HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredMessage"), CFSTR("HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredMessage"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredUpdateButton"), CFSTR("HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredUpdateButton"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_2;
    v38[3] = &unk_1E6F4C6E0;
    v22 = v14;
    v39 = v22;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v23);

    v24 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredCancelButton"), CFSTR("HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredCancelButton"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v21;
    v36[1] = 3221225472;
    v36[2] = __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_3;
    v36[3] = &unk_1E6F4C6E0;
    v37 = v22;
    v26 = v22;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v27);

    -[HUMediaSystemEditorHelper delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "mediaSystemEditorHelper:needsToPresentViewController:animated:completion:", self, v18, 1, 0);

    v33[0] = v21;
    v33[1] = 3221225472;
    v33[2] = __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_4;
    v33[3] = &unk_1E6F54A58;
    v34 = v32;
    v35 = self;
    v29 = v32;
    objc_msgSend(v26, "flatMap:", v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

uint64_t __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem");
}

uint64_t __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

void __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

id __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(a2, "BOOLValue") & 1) != 0)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaSystemEditorHelper:didAbortForAccessoryNeedingUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  v4 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithError:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HUMediaSystemEditorHelperDelegate)delegate
{
  return (HUMediaSystemEditorHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NAFuture)inFlightCommitFuture
{
  return self->_inFlightCommitFuture;
}

- (void)setInFlightCommitFuture:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightCommitFuture, a3);
}

- (NAFuture)accountArbitrationFuture
{
  return self->_accountArbitrationFuture;
}

- (void)setAccountArbitrationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_accountArbitrationFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountArbitrationFuture, 0);
  objc_storeStrong((id *)&self->_inFlightCommitFuture, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
