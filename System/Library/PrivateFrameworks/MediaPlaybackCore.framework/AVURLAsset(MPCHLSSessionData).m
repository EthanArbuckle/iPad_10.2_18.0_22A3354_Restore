@implementation AVURLAsset(MPCHLSSessionData)

- (id)mpc_synchronousHLSSessionDataWithTimeout:()MPCHLSSessionData error:
{
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  intptr_t (*v21)(uint64_t);
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("metadata"), 0) != 2)
  {
    v9 = dispatch_semaphore_create(0);
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__11182;
    v31 = __Block_byref_object_dispose__11183;
    v32 = 0;
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __80__AVURLAsset_MPCHLSSessionData__mpc_synchronousHLSSessionDataWithTimeout_error___block_invoke;
    v22 = &unk_24CAB9770;
    v25 = &v33;
    v26 = &v27;
    v23 = a1;
    v10 = v9;
    v24 = v10;
    objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24CB173C8, &v19);
    v11 = dispatch_time(0, 1000000000 * a3);
    if (dispatch_semaphore_wait(v10, v11))
    {
      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v38 = a1;
        v13 = "[AL] Time-out while retrieving HLS session metadata - Asset:%{public}@";
        v14 = v12;
        v15 = 12;
LABEL_6:
        _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }
    else
    {
      v17 = v34[3];
      if (v17 != 3)
      {
        if (v17 != 2)
        {
          v8 = 0;
          goto LABEL_9;
        }
        objc_msgSend(a1, "metadataForFormat:", *MEMORY[0x24BDB1DB0], v19, v20, v21, v22, v23);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "mpc_HLSAVMetadataItemInMetadata:", v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
        _Block_object_dispose(&v27, 8);

        _Block_object_dispose(&v33, 8);
        return v8;
      }
      if (a4)
        *a4 = objc_retainAutorelease((id)v28[5]);
      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = v28[5];
        *(_DWORD *)buf = 138543618;
        v38 = a1;
        v39 = 2114;
        v40 = v18;
        v13 = "[AL] Error retrieving HLS session metadata - Asset:%{public}@ - Error:%{public}@";
        v14 = v12;
        v15 = 22;
        goto LABEL_6;
      }
    }
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "metadataForFormat:", *MEMORY[0x24BDB1DB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mpc_HLSAVMetadataItemInMetadata:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mpc_HLSAVMetadataItemInMetadata:()MPCHLSSessionData
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "key", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.hls.audioAssetMetadata"));

        if (v10)
        {
          v11 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

@end
