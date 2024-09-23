@implementation EKVirtualConferenceRoomType

- (EKVirtualConferenceRoomType)initWithTitle:(id)a3 identifier:(id)a4 extensionBundleIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  EKVirtualConferenceRoomType *v12;
  EKVirtualConferenceRoomType *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EKVirtualConferenceRoomType;
  v12 = -[EKVirtualConferenceRoomType init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    objc_storeStrong((id *)&v13->_extensionBundleIdentifier, a5);
  }

  return v13;
}

+ (void)virtualConferenceRoomTypesWithCompletion:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  dispatch_group_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__20;
  v19[4] = __Block_byref_object_dispose__20;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = dispatch_group_create();
  v8 = *MEMORY[0x1E0CB2A28];
  v21[0] = CFSTR("LS:ExtensionPlatforms");
  v21[1] = v8;
  v22[0] = &unk_1E47B5C20;
  v22[1] = CFSTR("com.apple.calendar.virtualconference");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB35D8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke;
  v14[3] = &unk_1E4787BA8;
  v18 = v19;
  v11 = v7;
  v15 = v11;
  v12 = v6;
  v16 = v12;
  v13 = v5;
  v17 = v13;
  objc_msgSend(v10, "extensionsWithMatchingAttributes:completion:", v9, v14);

  _Block_object_dispose(v19, 8);
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  _QWORD block[4];
  id v23;
  id v24;
  __int128 v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  const __CFString *v38;
  const __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_cold_1();
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    v8 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v9 = v7;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = v8;
          v29[1] = 3221225472;
          v29[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_89;
          v29[3] = &unk_1E4787AE8;
          v13 = *(_QWORD *)(a1 + 56);
          v30 = v12;
          v32 = v13;
          v31 = *(id *)(a1 + 32);
          v14 = v12;
          objc_msgSend(v11, "setRequestCompletionBlock:", v29);
          objc_msgSend(v11, "setRequestCancellationBlock:", &__block_literal_global_66);
          v27[0] = v8;
          v27[1] = 3221225472;
          v27[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_95;
          v27[3] = &unk_1E4787B30;
          v28 = 0;
          objc_msgSend(v11, "setRequestInterruptionBlock:", v27);
          v15 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
          v38 = CFSTR("_EKVirtualConferenceRequestTypeKey");
          v39 = CFSTR("_EKVirtualConferenceRequestTypeRoomTypes");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setUserInfo:", v16);

          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          v37 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v8;
          v26[1] = 3221225472;
          v26[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_97;
          v26[3] = &unk_1E4787B58;
          v26[4] = v11;
          objc_msgSend(v11, "beginExtensionRequestWithOptions:inputItems:completion:", 1, v17, v26);

        }
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v9);
    }
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_98;
    block[3] = &unk_1E4787B80;
    v23 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v21 = *(_OWORD *)(a1 + 48);
    v19 = (id)v21;
    v25 = v21;
    dispatch_async(v18, block);

    v6 = 0;
  }

}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  BOOL v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  EKVirtualConferenceRoomType *v21;
  id v22;
  id v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v5)
  {
    v25 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("_EKVirtualConferenceRoomTypeTitleKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("_EKVirtualConferenceRoomTypeIdentifierKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v9;
        else
          v12 = 0;
        v13 = v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v11;
        else
          v14 = 0;
        v15 = v14;
        v16 = v15;
        if (v13)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (v17)
        {
          v18 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            v19 = CFSTR("(nil)");
            if (v16)
              v20 = v16;
            else
              v20 = CFSTR("(nil)");
            *(_DWORD *)buf = 138412802;
            v31 = v7;
            if (v13)
              v19 = v13;
            v32 = 2112;
            v33 = v20;
            v34 = 2112;
            v35 = v19;
            _os_log_error_impl(&dword_1A2318000, v18, OS_LOG_TYPE_ERROR, "Skipping extension room type %@ because it has insufficient information. Identifier = %@ title = %@", buf, 0x20u);
          }
        }
        else
        {
          v21 = -[EKVirtualConferenceRoomType initWithTitle:identifier:extensionBundleIdentifier:]([EKVirtualConferenceRoomType alloc], "initWithTitle:identifier:extensionBundleIdentifier:", v13, v15, *(_QWORD *)(a1 + 32));
          v22 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_sync_enter(v22);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v21);
          objc_sync_exit(v22);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_93_cold_1();

}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_95(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_95_cold_1();

}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1A2318000, v7, OS_LOG_TYPE_ERROR, "Request for virtual conference room types failed, extension = %@ request = %@ error = %@", (uint8_t *)&v9, 0x20u);
    }
  }

}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_98(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  __int128 v9;

  v2 = *(NSObject **)(a1 + 32);
  v3 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v2, v3))
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_98_cold_1(v4);
  }
  v5 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_99;
  block[3] = &unk_1E4787AC0;
  v7 = *(_OWORD *)(a1 + 48);
  v6 = (id)v7;
  v9 = v7;
  dispatch_async(v5, block);

}

uint64_t __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_99(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  else
    v2 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v2);
}

- (BOOL)isEqual:(id)a3
{
  EKVirtualConferenceRoomType *v4;
  EKVirtualConferenceRoomType *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (EKVirtualConferenceRoomType *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[EKVirtualConferenceRoomType title](v5, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKVirtualConferenceRoomType title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (CalEqualStrings())
      {
        -[EKVirtualConferenceRoomType identifier](v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKVirtualConferenceRoomType identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (CalEqualStrings())
        {
          -[EKVirtualConferenceRoomType extensionBundleIdentifier](v5, "extensionBundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKVirtualConferenceRoomType extensionBundleIdentifier](self, "extensionBundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = CalEqualStrings();

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EKVirtualConferenceRoomType title: %@, identifier: %@, extensionBundleIdentifier: %@"), self->_title, self->_identifier, self->_extensionBundleIdentifier);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)originatingExtensionIdentifier
{
  return self->_originatingExtensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to find virtual conference extensions. Error = %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_93_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v0, v1, "Request for virtual conference room type cancelled, request = %@ error = %@");
  OUTLINED_FUNCTION_1_0();
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_95_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v0, v1, "Request for virtual conference room interrupted, request = %@ error = %@");
  OUTLINED_FUNCTION_1_0();
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_98_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Request for virtual conference room types failed,timed out", v1, 2u);
}

@end
