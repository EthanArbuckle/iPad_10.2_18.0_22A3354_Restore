@implementation AVTAvatarRecordRendering

+ (id)memojiDescriptorForRecord:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v11;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BE0B430];
    objc_msgSend(a3, "avatarData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v3, "descriptorWithDataRepresentation:error:", v4, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;

    if (!v5)
    {
      v7 = (void *)MEMORY[0x24BDBCE88];
      v8 = *MEMORY[0x24BDBCAB0];
      objc_msgSend(v6, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("Can't decode Memoji descriptor! Error: %@"), v9);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)avatarDescriptorForRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__1;
    v13 = __Block_byref_object_dispose__1;
    v14 = 0;
    v7[4] = &v9;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__AVTAvatarRecordRendering_avatarDescriptorForRecord___block_invoke;
    v8[3] = &unk_24DD31B78;
    v8[4] = &v9;
    v8[5] = a1;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__AVTAvatarRecordRendering_avatarDescriptorForRecord___block_invoke_2;
    v7[3] = &unk_24DD31BA0;
    objc_msgSend(a1, "_castRecord:andDoRecordHandlingBlock:puppetHandlingBlock:", v4, v8, v7);
    v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __54__AVTAvatarRecordRendering_avatarDescriptorForRecord___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 40), "memojiDescriptorForRecord:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __54__AVTAvatarRecordRendering_avatarDescriptorForRecord___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BE0B3F8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "puppetName");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "initWithName:", v9);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

+ (id)avatarForRecord:(id)a3
{
  return (id)objc_msgSend(a1, "avatarForRecord:usageIntent:", a3, 0);
}

+ (id)avatarForRecord:(id)a3 usageIntent:(unint64_t)a4
{
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a1, "avatarDescriptorForRecord:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0B408], "avatarWithDescriptor:usageIntent:error:", v5, a4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)memojiForRecord:(id)a3
{
  return (id)objc_msgSend(a1, "memojiForRecord:usageIntent:", a3, 0);
}

+ (id)memojiForRecord:(id)a3 usageIntent:(unint64_t)a4
{
  void *v4;

  objc_msgSend(a1, "avatarForRecord:usageIntent:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v4);
  return v4;
}

+ (void)_castRecord:(id)a3 andDoRecordHandlingBlock:(id)a4 puppetHandlingBlock:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void (**v9)(id, id);
  void (**v10)(id, id);
  id v11;

  v7 = a3;
  v8 = (void (**)(id, id))a4;
  v9 = (void (**)(id, id))a5;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_255105858) & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v7);
  v11 = v7;
  if (objc_msgSend(v11, "isPuppet"))
  {
    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
LABEL_7:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v11);
LABEL_8:
  v10[2](v10, v11);

}

+ (void)preloadAvatarsWithIdentifiers:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[AVTCoreEnvironment defaultEnvironment](AVTCoreEnvironment, "defaultEnvironment");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preloadAvatarsWithIdentifiers:store:environment:completionHandler:", v10, v9, v11, v8);

}

+ (void)preloadAllAvatarsWithStore:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[AVTCoreEnvironment defaultEnvironment](AVTCoreEnvironment, "defaultEnvironment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preloadAllAvatarsWithStore:environment:completionHandler:", v7, v8, v6);

}

+ (void)preloadAvatarsWithIdentifiers:(id)a3 store:(id)a4 environment:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        +[AVTAvatarFetchRequest requestForAvatarWithIdentifier:](AVTAvatarFetchRequest, "requestForAvatarWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  objc_msgSend(a1, "preloadAvatarsWithFetchRequests:store:environment:completionHandler:", v13, v10, v11, v12);
}

+ (void)preloadAllAvatarsWithStore:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[AVTAvatarFetchRequest requestForAllAvatars](AVTAvatarFetchRequest, "requestForAllAvatars");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preloadAvatarsWithFetchRequests:store:environment:completionHandler:", v12, v10, v9, v8);

}

+ (void)preloadAvatarsWithFetchRequests:(id)a3 store:(id)a4 environment:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "backgroundQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __96__AVTAvatarRecordRendering_preloadAvatarsWithFetchRequests_store_environment_completionHandler___block_invoke;
  v21[3] = &unk_24DD31BC8;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v15;
  v26 = v13;
  v27 = a1;
  v16 = v13;
  v17 = v15;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_async(v14, v21);

}

uint64_t __96__AVTAvatarRecordRendering_preloadAvatarsWithFetchRequests_store_environment_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  id obj;
  id v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v34;
    v22 = *(_QWORD *)v34;
    do
    {
      v5 = 0;
      v23 = v3;
      do
      {
        if (*(_QWORD *)v34 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v5);
        v7 = *(void **)(a1 + 40);
        v32 = 0;
        objc_msgSend(v7, "avatarsForFetchRequest:error:", v6, &v32, v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v32;
        if (v8)
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          if (v11)
          {
            v12 = v11;
            v25 = v9;
            v26 = v8;
            v27 = v5;
            v13 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v29 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                v16 = (void *)MEMORY[0x22074B080]();
                objc_msgSend(*(id *)(a1 + 72), "avatarForRecord:", v15);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = *(void **)(a1 + 56);
                objc_msgSend(v15, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "logAvatarPreloadBeginForIdentifier:", v19);

                objc_msgSend(MEMORY[0x24BE0B408], "preloadAvatar:", v17);
                objc_msgSend(*(id *)(a1 + 56), "logAvatarPreloadEnd");

                objc_autoreleasePoolPop(v16);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            }
            while (v12);
            v4 = v22;
            v3 = v23;
            v8 = v26;
            v5 = v27;
            v9 = v25;
          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "logger");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "logErrorFetchingRecords:", v20);

        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v3);
  }

  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
