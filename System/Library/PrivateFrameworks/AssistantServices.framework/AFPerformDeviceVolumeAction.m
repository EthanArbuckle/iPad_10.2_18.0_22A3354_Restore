@implementation AFPerformDeviceVolumeAction

void __AFPerformDeviceVolumeAction_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  id v7;
  void (*v8)(uint64_t, uint64_t, __int128 *, float);
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  __int128 v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v16) = 136315138;
      *(_QWORD *)((char *)&v16 + 4) = "AFPerformDeviceVolumeAction_block_invoke";
      _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, "%s Media Remote reported that the picked route does NOT have volume control", (uint8_t *)&v16, 0xCu);
    }
    if (*(_QWORD *)(a1 + 40))
    {
      v14 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v12 = (id)objc_msgSend(v14, "initWithErrorCode:", *MEMORY[0x1E0D88F50]);
      (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v12, 0);
      goto LABEL_21;
    }
  }
  v3 = *(_QWORD *)(a1 + 48);
  if ((unint64_t)(v3 - 2) < 3)
  {
    v4 = *(unsigned int *)(a1 + 56);
    v5 = *(float *)(a1 + 60);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    if (v3 == 4)
      v5 = -v5;
    if (v3 == 2)
      v8 = (void (*)(uint64_t, uint64_t, __int128 *, float))MEMORY[0x1E0D4C120];
    else
      v8 = (void (*)(uint64_t, uint64_t, __int128 *, float))MEMORY[0x1E0D4BDE8];
    *(_QWORD *)&v16 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v16 + 1) = 3221225472;
    v17 = ___AFLocalSetVolumeActionNoCheck_block_invoke;
    v18 = &unk_1E3A34BA8;
    v19 = v7;
    v9 = v7;
    v8(v4, v6, &v16, v5);
    goto LABEL_9;
  }
  if (v3 == 1)
  {
    v15 = *(id *)(a1 + 40);
    v9 = v15;
    if (!v15)
      goto LABEL_10;
    *(_QWORD *)&v16 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v16 + 1) = 3221225472;
    v17 = ___AFLocalGetMediaPlaybackVolumeNoCheck_block_invoke;
    v18 = &unk_1E3A34B80;
    v19 = v15;
    MRMediaRemoteGetMediaPlaybackVolume();
LABEL_9:

LABEL_10:
    return;
  }
  if (!v3)
  {
    v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v16) = 136315138;
      *(_QWORD *)((char *)&v16 + 4) = "AFPerformDeviceVolumeAction_block_invoke";
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s Unknown volume action", (uint8_t *)&v16, 0xCu);
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
      (*(void (**)(uint64_t, id, _QWORD))(v11 + 16))(v11, v12, 0);
LABEL_21:

    }
  }
}

@end
