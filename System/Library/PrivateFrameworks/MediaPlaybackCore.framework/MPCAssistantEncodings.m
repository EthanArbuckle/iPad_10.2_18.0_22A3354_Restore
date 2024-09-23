@implementation MPCAssistantEncodings

- (id)encodeURLData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)decodeURLData:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByRemovingPercentEncoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 0);

  return v4;
}

- (void)encodeHashedRouteUIDs:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init((Class)getAFSecurityConnectionClass());
  v8 = dispatch_group_create();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("EncodeSerialQueue", v9);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(v16, "dataUsingEncoding:", 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v8);
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke;
          v25[3] = &unk_24CAB9808;
          v18 = v7;
          v26 = v18;
          v27 = v10;
          v28 = v6;
          v29 = v8;
          objc_msgSend(v18, "processData:usingProcedure:completion:", v17, 1, v25);

        }
        else
        {
          objc_msgSend(v6, "addObject:", &stru_24CABB5D0);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke_6;
  block[3] = &unk_24CAB9830;
  v23 = v6;
  v24 = v21;
  v19 = v6;
  v20 = v21;
  dispatch_group_notify(v8, v10, block);

}

- (void)decodeHashedRouteUIDs:(id)a3 completion:(id)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id obj;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  uint8_t *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v22 = a4;
  v5 = (void *)objc_msgSend(v21, "mutableCopy");
  if (objc_msgSend(v5, "containsObject:", CFSTR("LOCAL_DEVICE")))
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "Unexpected LOCAL_DEVICE identifier.", buf, 2u);
    }

    objc_msgSend(v5, "removeObject:", CFSTR("LOCAL_DEVICE"));
  }
  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x2020000000;
  v42 = 0;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = objc_alloc_init((Class)getAFSecurityConnectionClass());
  v9 = dispatch_group_create();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("DecodeSerialQueue", v10);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v36;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v14);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v15, 0);
        dispatch_group_enter(v9);
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke;
        v28[3] = &unk_24CAB9858;
        v17 = v8;
        v29 = v17;
        v30 = v11;
        v34 = buf;
        v31 = v7;
        v32 = v15;
        v33 = v9;
        objc_msgSend(v17, "processData:usingProcedure:completion:", v16, 2, v28);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v12);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_12;
  block[3] = &unk_24CAB98A8;
  v25 = obj;
  v26 = v7;
  v27 = v22;
  v18 = v22;
  v19 = v7;
  v20 = obj;
  dispatch_group_notify(v9, v11, block);

  _Block_object_dispose(buf, 8);
}

void __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "Error decoding route UID: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v9 = *(NSObject **)(a1 + 40);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_2;
    v14[3] = &unk_24CABAA78;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 72);
    v15 = v10;
    v18 = v11;
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v16 = v12;
    v17 = v13;
    dispatch_sync(v9, v14);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_12(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_INFO, "MPCAssistantEncodings (decode): route UID decoding table", buf, 2u);
  }

  v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_13;
  v7[3] = &unk_24CAB9880;
  v5 = v2;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (objc_msgSend(v5, "count"))
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "MPCAssistantEncodings (decode): could not decrypt: %{public}@", buf, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_INFO, "MPCAssistantEncodings (decode): hashed %{public}@ = decoded %{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
}

void __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", *(_QWORD *)(a1 + 32), 4);
  if (v2)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v2);
    v2 = v3;
  }

}

void __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "Error encoding route UID: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v9 = *(NSObject **)(a1 + 40);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke_2;
    v10[3] = &unk_24CABA1D0;
    v11 = v5;
    v12 = *(id *)(a1 + 48);
    dispatch_sync(v9, v10);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "base64EncodedStringWithOptions:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);

}

@end
