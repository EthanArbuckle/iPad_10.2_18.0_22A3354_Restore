@implementation MPCAssistantSetVolume

- (void)setVolume:(float)a3 withUIDs:(id)a4 completion:(id)a5
{
  -[MPCAssistantSetVolume executeWithUIDs:action:volumeValue:completion:](self, "executeWithUIDs:action:volumeValue:completion:", a4, 0, a5);
}

- (void)increaseVolumeBy:(float)a3 withUIDs:(id)a4 completion:(id)a5
{
  -[MPCAssistantSetVolume executeWithUIDs:action:volumeValue:completion:](self, "executeWithUIDs:action:volumeValue:completion:", a4, 1, a5);
}

- (void)decreaseVolumeBy:(float)a3 withUIDs:(id)a4 completion:(id)a5
{
  -[MPCAssistantSetVolume executeWithUIDs:action:volumeValue:completion:](self, "executeWithUIDs:action:volumeValue:completion:", a4, 2, a5);
}

- (void)executeWithUIDs:(id)a3 action:(unint64_t)a4 volumeValue:(float)a5 completion:(id)a6
{
  id v9;
  id v10;
  dispatch_group_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  MPCAssistantDiscovery *v37;
  _QWORD v38[4];
  id v39;
  NSObject *v40;
  id v41;
  _QWORD *v42;
  unint64_t v43;
  float v44;
  _QWORD aBlock[4];
  NSObject *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD v49[3];
  char v50;
  _QWORD v51[5];
  id v52;

  v9 = a3;
  v10 = a6;
  v11 = dispatch_group_create();
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__1170;
  v51[4] = __Block_byref_object_dispose__1171;
  v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 0;
  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke;
  aBlock[3] = &unk_24CAB1AA8;
  v13 = v11;
  v46 = v13;
  v47 = v49;
  v48 = v51;
  v14 = _Block_copy(aBlock);
  v38[0] = v12;
  v38[1] = 3221225472;
  v38[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_2;
  v38[3] = &unk_24CAB1AF8;
  v44 = a5;
  v15 = v9;
  v39 = v15;
  v43 = a4;
  v16 = v14;
  v41 = v16;
  v17 = v13;
  v40 = v17;
  v42 = v51;
  v18 = _Block_copy(v38);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1170;
  v36 = __Block_byref_object_dispose__1171;
  v37 = objc_alloc_init(MPCAssistantDiscovery);
  dispatch_group_enter(v17);
  v19 = (void *)v33[5];
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_7;
  v28[3] = &unk_24CAB1B48;
  v31 = v51;
  v20 = v17;
  v29 = v20;
  v21 = v18;
  v30 = v21;
  objc_msgSend(v19, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v15, v28);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_3;
  v23[3] = &unk_24CAB1B70;
  v24 = v10;
  v25 = &v32;
  v26 = v51;
  v27 = v49;
  v22 = v10;
  dispatch_group_notify(v20, MEMORY[0x24BDAC9B8], v23);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke(uint64_t a1, const void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v5 = a3;
  CFRetain(a2);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v7 = v5;
  MRAVEndpointSetOutputDeviceUIDVolume();

}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v4;
  double v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  NSObject *v19;
  double v20;
  NSObject *v21;
  double v22;
  void *v23;
  NSObject *v24;
  double v25;
  __int128 v26;
  CFTypeRef cf;
  id obj;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  double v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(float *)(a1 + 72);
    *(_DWORD *)buf = 134218242;
    v46 = v5;
    v47 = 2114;
    v48 = a2;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] volume: %f endpoint %{public}@", buf, 0x16u);
  }

  cf = a2;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)MRAVEndpointCopyOutputDevices();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v40;
    *(_QWORD *)&v7 = 134218242;
    v26 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v11, "uid", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v13 = *(id *)(a1 + 32);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (!v14)
          goto LABEL_16;
        v15 = v14;
        v16 = *(_QWORD *)v36;
        while (2)
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v36 != v16)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(v11, "containsUID:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j)) & 1) != 0)
            {

              v18 = *(_QWORD *)(a1 + 64);
              if (v18 == 2)
              {
                v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  v25 = *(float *)(a1 + 72);
                  *(_DWORD *)buf = v26;
                  v46 = v25;
                  v47 = 2114;
                  v48 = v12;
                  _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] decrease volume: %f outputDeviceUID %{public}@", buf, 0x16u);
                }

                dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
                CFRetain(cf);
                v31 = *(id *)(a1 + 48);
                v29 = v12;
                v30 = *(id *)(a1 + 40);
                MRAVEndpointGetOutputDeviceUIDVolume();

                v23 = v31;
              }
              else
              {
                if (v18 != 1)
                {
                  if (!v18)
                  {
                    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                    {
                      v20 = *(float *)(a1 + 72);
                      *(_DWORD *)buf = v26;
                      v46 = v20;
                      v47 = 2114;
                      v48 = v12;
                      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] set volume: %f outputDeviceUID %{public}@", buf, 0x16u);
                    }

                    (*(void (**)(float))(*(_QWORD *)(a1 + 48) + 16))(*(float *)(a1 + 72));
                  }
                  goto LABEL_30;
                }
                v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = *(float *)(a1 + 72);
                  *(_DWORD *)buf = v26;
                  v46 = v22;
                  v47 = 2114;
                  v48 = v12;
                  _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] increase volume: %f outputDeviceUID %{public}@", buf, 0x16u);
                }

                dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
                CFRetain(cf);
                v34 = *(id *)(a1 + 48);
                v32 = v12;
                v33 = *(id *)(a1 + 40);
                MRAVEndpointGetOutputDeviceUIDVolume();

                v23 = v34;
              }

              goto LABEL_30;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v15)
            continue;
          break;
        }
LABEL_16:

LABEL_30:
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v8);
  }

}

{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v11 = 138543362;
      v12 = a2;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] volume set failed with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v6 = objc_msgSend(a2, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    if (v5)
    {
      v9 = *(void **)(a1 + 32);
      v10 = *(float *)(a1 + 72);
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = v10;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] new volume for uid: %{public}@: %f", (uint8_t *)&v11, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MPCAssistantConnection *v13;
  MPCAssistantConnection *v14;
  id obj;
  _QWORD v16[4];
  MPCAssistantConnection *v17;
  id v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    MPCAssistantCreateError(1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = objc_alloc_init(MPCAssistantConnection);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_2_9;
        v16[3] = &unk_24CAB1B20;
        v17 = v13;
        v19 = *(id *)(a1 + 40);
        v20 = v12;
        v18 = *(id *)(a1 + 32);
        v14 = v13;
        -[MPCAssistantConnection connectToEndpoint:completion:](v14, "connectToEndpoint:completion:", v12, v16);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[MPCAssistantSetVolume] completion %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    v6 = 0;
  else
    v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  return (*(uint64_t (**)(_QWORD, uint64_t))(a1[4] + 16))(a1[4], v6);
}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_2_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  v5 = *(id *)(a1 + 32);
  v4(v2, v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_3(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __n128 v12;
  int v13;
  double v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218242;
      v14 = a3;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "volume: %f error=%{public}@", (uint8_t *)&v13, 0x16u);

    }
    v9 = objc_msgSend(v5, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = a3;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "volume: %f", (uint8_t *)&v13, 0xCu);
    }

    v12.n128_f32[0] = *(float *)(a1 + 72) + a3;
    if (v12.n128_f32[0] > 1.0)
      v12.n128_f32[0] = 1.0;
    (*(void (**)(__n128))(*(_QWORD *)(a1 + 48) + 16))(v12);
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __71__MPCAssistantSetVolume_executeWithUIDs_action_volumeValue_completion___block_invoke_5(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = a3;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "volume: %f error=%{public}@", (uint8_t *)&v12, 0x16u);

    }
    v9 = objc_msgSend(v5, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a3;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "volume: %f", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(float))(*(_QWORD *)(a1 + 48) + 16))(fmaxf(a3 - *(float *)(a1 + 72), 0.0));
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

@end
