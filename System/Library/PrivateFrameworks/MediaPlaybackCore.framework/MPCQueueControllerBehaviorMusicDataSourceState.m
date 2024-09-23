@implementation MPCQueueControllerBehaviorMusicDataSourceState

void __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_2;
  v5[3] = &unk_24CAB54A8;
  v5[4] = v2;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "loadPlaybackContext:completion:", v3, v5);

}

void __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  id v37;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_rtcSourceServiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v10 + 88));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v38[0] = CFSTR("queue-section-id");
    v38[1] = CFSTR("queue-load-error");
    v39[0] = v12;
    v39[1] = v8;
    v38[2] = CFSTR("queue-rtc-service-id");
    v13 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "emitEventType:payload:", CFSTR("queue-load-end"), v14);

    if (!v9)
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(v15 + 56);
    *(_QWORD *)(v15 + 56) = 4;
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 24);
    *(_QWORD *)(v17 + 24) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      if (v16 >= 5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown[%ld]"), v16);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_24CAB54C8[v16];
      }
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2114;
      v35 = v21;
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | changing state [failed reloadSection] oldState=%{public}@ newState=Error", buf, 0x16u);

    }
    v25 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(_QWORD *)(v26 + 64);
      v28 = *(__CFString **)(v26 + 32);
      *(_DWORD *)buf = 138543874;
      v33 = v27;
      v34 = 2048;
      v35 = v28;
      v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | load playback context failed [dataSource %p] error=%{public}@ ", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(v10 + 72), a2);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(void **)(v22 + 32);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_55;
    v29[3] = &unk_24CAB9CA8;
    v29[4] = v22;
    v30 = v9;
    v31 = *(id *)(a1 + 48);
    objc_msgSend(v24, "reloadSection:completion:", v23, v29);

  }
}

void __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_55(_QWORD *a1, void *a2)
{
  __CFString *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 88));
  v34[0] = *(_QWORD *)(a1[4] + 64);
  v33[0] = CFSTR("queue-section-id");
  v33[1] = CFSTR("queue-load-error");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[1] = v5;
  v33[2] = CFSTR("queue-rtc-service-id");
  v6 = (void *)a1[5];
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "emitEventType:payload:", CFSTR("queue-load-end"), v8);

  if (v6)
  {
    if (v3)
    {
LABEL_7:

      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = a1[4];
        v11 = *(_QWORD *)(v10 + 64);
        v12 = *(__CFString **)(v10 + 32);
        *(_DWORD *)buf = 138543874;
        v28 = v11;
        v29 = 2048;
        v30 = v12;
        v31 = 2114;
        v32 = v3;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "[DASOS:%{public}@] reloadSection:… | reload section failed [dataSource %p] error=%{public}@ ", buf, 0x20u);
      }
      v13 = 4;
      goto LABEL_14;
    }
  }
  else
  {

    if (v3)
      goto LABEL_7;
  }

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = a1[4];
    v15 = *(_QWORD *)(v14 + 64);
    v16 = *(__CFString **)(v14 + 32);
    *(_DWORD *)buf = 138543618;
    v28 = v15;
    v29 = 2048;
    v30 = v16;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | reload section succeeded [dataSource %p]", buf, 0x16u);
  }
  v13 = 3;
LABEL_14:

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_56;
  block[3] = &unk_24CABA2D0;
  block[4] = a1[4];
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
  v17 = a1[4];
  v18 = *(_QWORD *)(v17 + 56);
  *(_QWORD *)(v17 + 56) = v13;
  v19 = a1[4];
  v20 = *(void **)(v19 + 24);
  *(_QWORD *)(v19 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v21 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1[4] + 64);
    if (v18 >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown[%ld]"), v18);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_24CAB54C8[v18];
    }
    v24 = v23;
    if (v13 == 3)
      v25 = CFSTR("Ready");
    else
      v25 = CFSTR("Error");
    *(_DWORD *)buf = 138543874;
    v28 = v22;
    v29 = 2114;
    v30 = v24;
    v31 = 2114;
    v32 = v25;
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | changing state [finished reloadSection] oldState=%{public}@ newState=%{public}@", buf, 0x20u);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePlaybackContext");
}

void __99___MPCQueueControllerBehaviorMusicDataSourceState_loadAdditionalItemsIfNeededWithCount_completion___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_rtcSourceServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  v32[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  v31[0] = CFSTR("queue-section-id");
  v31[1] = CFSTR("queue-load-error");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[1] = v6;
  v31[2] = CFSTR("queue-rtc-service-id");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "emitEventType:payload:", CFSTR("queue-load-end"), v8);

  if (v4)
  {
    if (v3)
    {
LABEL_7:

      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
        v11 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v24 = v10;
        v25 = 2048;
        v26 = v11;
        v27 = 2114;
        v28 = v3;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | additional loading completed [error] error=%{public}@", buf, 0x20u);
      }
      v12 = 4;
      goto LABEL_14;
    }
  }
  else
  {

    if (v3)
      goto LABEL_7;
  }

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v14 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v24 = v13;
    v25 = 2048;
    v26 = v14;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | additional loading completed [success]", buf, 0x16u);
  }
  v12 = 3;
LABEL_14:

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(v15 + 56);
  *(_QWORD *)(v15 + 56) = v12;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v19 = *(_QWORD *)(a1 + 48);
    if (v16 >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown[%ld]"), v16);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_24CAB54C8[v16];
    }
    v21 = v20;
    if (v12 == 3)
      v22 = CFSTR("Ready");
    else
      v22 = CFSTR("Error");
    *(_DWORD *)buf = 138544130;
    v24 = v18;
    v25 = 2048;
    v26 = v19;
    v27 = 2114;
    v28 = v21;
    v29 = 2114;
    v30 = v22;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | changing state [finished loading additional] oldState=%{public}@ newState=%{public}@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __67___MPCQueueControllerBehaviorMusicDataSourceState_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

@end
