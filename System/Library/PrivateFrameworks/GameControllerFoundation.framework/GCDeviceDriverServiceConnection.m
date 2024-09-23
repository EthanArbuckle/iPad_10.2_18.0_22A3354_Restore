@implementation GCDeviceDriverServiceConnection

id __75___GCDeviceDriverServiceConnection_connectionToServiceInDriver_withClient___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = *(objc_class **)(a1 + 40);
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDriverConnection:serviceVendor:", *(_QWORD *)(a1 + 32), v4);

  return v5;
}

void __75___GCDeviceDriverServiceConnection_initWithDriverConnection_serviceVendor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  unsigned __int8 v6;
  id Property;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  _gc_log_ipc();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v36 = v3;
    _os_log_impl(&dword_1DC79E000, v2, OS_LOG_TYPE_INFO, "%@: Invalidating", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v6 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  if ((v6 & 1) != 0)
  {
    objc_sync_exit(v4);
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
    Property = *(id *)(a1 + 40);
    if (Property)
      Property = objc_getProperty(Property, v5, 48, 1);
    v8 = Property;
    v10 = *(_QWORD *)(a1 + 32);
    v9 = a1 + 32;
    v11 = *(void **)(v10 + 16);
    *(_QWORD *)(v10 + 16) = 0;

    v12 = *(void **)(*(_QWORD *)v9 + 24);
    *(_QWORD *)(*(_QWORD *)v9 + 24) = 0;

    objc_sync_exit(v4);
    v13 = *MEMORY[0x1E0CB2D68];
    v33[0] = *MEMORY[0x1E0CB2D50];
    v33[1] = v13;
    v34[0] = CFSTR("Request failed.");
    v34[1] = CFSTR("Service connection invalidated.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v28;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(0);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18++), "failWithError:", v15);
        }
        while (v16 != v18);
        v16 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v8, "reverseObjectEnumerator", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v19);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++) + 16))();
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v20);
    }

    v4 = v8;
  }

}

void __59___GCDeviceDriverServiceConnection_addInvalidationHandler___block_invoke(uint64_t a1)
{
  const char *v2;
  id Property;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v2, 48, 1);
  v4 = Property;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v5, "removeObject:", v6);

  v8 = *(void **)(a1 + 32);
  if (v8)
    objc_setProperty_atomic_copy(v8, v7, v5, 48);

  objc_sync_exit(obj);
}

id __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  v6 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  if ((v6 & 1) != 0)
  {
    v15 = *MEMORY[0x1E0CB2D68];
    v34[0] = *MEMORY[0x1E0CB2D50];
    v34[1] = v15;
    v35[0] = CFSTR("Request failed.");
    v35[1] = CFSTR("Service connection is invalid.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutorelease(v17);
    *a3 = v18;

    objc_sync_exit(v5);
    v14 = 0;
  }
  else
  {
    objc_sync_exit(v5);

    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__3;
    v32 = __Block_byref_object_dispose__3;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    v27 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_19;
    v21[3] = &unk_1EA4D3430;
    v21[4] = &v22;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_2;
    v20[3] = &unk_1EA4D3458;
    v20[4] = &v28;
    v20[5] = &v22;
    (*(void (**)(uint64_t, void *, _QWORD *, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v9, v20, v11, v12, v13);
    *a3 = objc_retainAutorelease((id)v23[5]);
    v14 = (id)v29[5];

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

  }
  return v14;
}

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_19(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("The request failed, but an error was not provided.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 0, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = a2;
  }
  else
  {
    if (!v7)
    {
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("The request did not return a result, but an error was not provided.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 0, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      goto LABEL_6;
    }
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a3;
  }
  objc_storeStrong(v9, v10);
LABEL_6:

}

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  if ((v5 & 1) != 0)
  {
    v11 = *MEMORY[0x1E0CB2D68];
    v18[0] = *MEMORY[0x1E0CB2D50];
    v18[1] = v11;
    v19[0] = CFSTR("Request failed.");
    v19[1] = CFSTR("Service connection is invalid.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "failWithError:", v13);
    objc_sync_exit(v4);
  }
  else
  {
    objc_sync_exit(v4);

    v6 = MEMORY[0x1E0C809B0];
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_4;
    v16[3] = &unk_1EA4D34A8;
    v8 = v3;
    v17 = v8;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_5;
    v14[3] = &unk_1EA4D34D0;
    v15 = v8;
    (*(void (**)(uint64_t, void *, _QWORD *))(v10 + 16))(v10, v9, v14);

    v4 = v17;
  }

}

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v5 = *MEMORY[0x1E0CB2D50];
    v6[0] = CFSTR("The request failed, but an error was not provided.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 0, v4);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "failWithError:", v3);

}

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "succeedWithResult:", v5);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v8, "failWithError:", v6);
    }
    else
    {
      v11 = *MEMORY[0x1E0CB2D50];
      v12[0] = CFSTR("The request did not return a result, but an error was not provided.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_IPCError:userInfo:](&off_1F03A6B68, "gc_IPCError:userInfo:", 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "failWithError:", v10);

    }
  }

}

@end
