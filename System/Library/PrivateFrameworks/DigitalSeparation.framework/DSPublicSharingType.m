@implementation DSPublicSharingType

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSLogPublicSharingType");
    v3 = (void *)DSLogPublicSharing;
    DSLogPublicSharing = (uint64_t)v2;

  }
}

- (DSPublicSharingType)initWithSource:(id)a3
{
  id v4;
  DSPublicSharingType *v5;
  DSPublicSharingType *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSPublicSharingType;
  v5 = -[DSPublicSharingType init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DSPublicSharingType setSource:](v5, "setSource:", v4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPublicSharingType setPublicResources:](v6, "setPublicResources:", v7);

  }
  return v6;
}

- (void)addPublicResource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DSPublicSharingType publicResources](self, "publicResources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removePublicResource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DSPublicSharingType publicResources](self, "publicResources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSArray)allPublicResources
{
  void *v2;
  void *v3;

  -[DSPublicSharingType publicResources](self, "publicResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)score
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[DSPublicSharingType source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "priority");

  return v5;
}

- (NSString)displayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[DSPublicSharingType source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)localizedDetailText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DSPublicSharingType source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedPublicSharingDetailTextByType:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DSPublicSharingType source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  DSPublicSharingType *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (DSPublicSharingType *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DSPublicSharingType source](self, "source");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSPublicSharingType source](v4, "source");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)stopSharingResource:(id)a3 onQueue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  -[DSPublicSharingType source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "visibility");
  if (v10 == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = objc_msgSend(v7, "participationAccess");
      if ((v17 & 2) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_14;
          v25[3] = &unk_24F081E90;
          v26 = v9;
          v27 = v7;
          v28 = v8;
          objc_msgSend(v26, "updateParticipantAccessLevelTo:onResource:withCompletion:", 1, v27, v25);

          v16 = v26;
LABEL_18:

          goto LABEL_19;
        }
        v22 = (void *)DSLogPublicSharing;
        if (os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_ERROR))
          -[DSPublicSharingType stopSharingResource:onQueue:completion:].cold.1(v22, v9);
LABEL_17:
        objc_msgSend(v9, "name");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        +[DSError errorWithCode:sourceName:](DSError, "errorWithCode:sourceName:", 2, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v8 + 2))(v8, v21);

        goto LABEL_18;
      }
    }
    else
    {
      v17 = 0;
    }
    v20 = (void *)DSLogPublicSharing;
    if (os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_FAULT))
    {
      v23 = v20;
      objc_msgSend(v9, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v24;
      v35 = 2050;
      v36 = objc_msgSend(v7, "visibility");
      v37 = 2050;
      v38 = v17;
      _os_log_fault_impl(&dword_227D24000, v23, OS_LOG_TYPE_FAULT, "[%{public}@] Resource classified as public but visibility is %{public}ld and participation access is %{public}ld", buf, 0x20u);

    }
    goto LABEL_17;
  }
  if (v10 == 2)
  {
    v11 = objc_opt_respondsToSelector();
    v12 = (void *)DSLogPublicSharing;
    v13 = os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_INFO);
    if ((v11 & 1) != 0)
    {
      if (v13)
      {
        v14 = v12;
        objc_msgSend(v9, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v15;
        v35 = 2114;
        v36 = (uint64_t)v7;
        _os_log_impl(&dword_227D24000, v14, OS_LOG_TYPE_INFO, "[%{public}@] Resource %{public}@ is publicly visible, attempting to change visibility to private", buf, 0x16u);

      }
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke;
      v31[3] = &unk_24F081E40;
      v32 = v8;
      objc_msgSend(v9, "updateVisibilityTo:onResource:withCompletion:", 1, v7, v31);
      v16 = v32;
    }
    else
    {
      if (v13)
      {
        v18 = v12;
        objc_msgSend(v9, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v19;
        v35 = 2114;
        v36 = (uint64_t)v7;
        _os_log_impl(&dword_227D24000, v18, OS_LOG_TYPE_INFO, "[%{public}@] Resource %{public}@ is publicly visible, attempting to stop sharing entirely", buf, 0x16u);

      }
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_7;
      v29[3] = &unk_24F081E68;
      v30 = v8;
      objc_msgSend(v9, "stopSharing:withCompletion:", v7, v29);
      v16 = v30;
    }
    goto LABEL_18;
  }
LABEL_19:

}

uint64_t __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)DSLogPublicSharing;
    if (os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_ERROR))
      __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_14_cold_1(a1, v7, (uint64_t)v6);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 2, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id obj;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v19 = a4;
  v7 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPublicSharingType source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[DSPublicSharingType publicResources](self, "publicResources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  obj = v11;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15);
        dispatch_group_enter(v7);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __56__DSPublicSharingType_stopAllSharingOnQueue_completion___block_invoke;
        v24[3] = &unk_24F081EB8;
        v25 = v9;
        v26 = v16;
        v27 = v8;
        v28 = v7;
        -[DSPublicSharingType stopSharingResource:onQueue:completion:](self, "stopSharingResource:onQueue:completion:", v16, v6, v24);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DSPublicSharingType_stopAllSharingOnQueue_completion___block_invoke_18;
  block[3] = &unk_24F081658;
  v22 = v8;
  v23 = v19;
  v17 = v19;
  v18 = v8;
  dispatch_group_notify(v7, v6, block);

}

void __56__DSPublicSharingType_stopAllSharingOnQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ds_errorFromIgnorableError:sourceName:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)DSLogPublicSharing;
    if (os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = v8;
      objc_msgSend(v12, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_227D24000, v14, OS_LOG_TYPE_ERROR, "Failed to stop public sharing on %{public}@ from %{public}@ because %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 2, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __56__DSPublicSharingType_stopAllSharingOnQueue_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[DSError errorWithCode:underlyingErrors:](DSError, "errorWithCode:underlyingErrors:", 2, *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (DSSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSMutableSet)publicResources
{
  return self->_publicResources;
}

- (void)setPublicResources:(id)a3
{
  objc_storeStrong((id *)&self->_publicResources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicResources, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)stopSharingResource:(void *)a1 onQueue:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_227D24000, v3, OS_LOG_TYPE_ERROR, "%{public}@ is unable to update participation access", (uint8_t *)&v5, 0xCu);

}

void __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_14_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = 138543874;
  v10 = v7;
  v11 = 2114;
  v12 = v8;
  v13 = 2114;
  v14 = a3;
  _os_log_error_impl(&dword_227D24000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ Failed to update participation access on %{public}@ because %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
