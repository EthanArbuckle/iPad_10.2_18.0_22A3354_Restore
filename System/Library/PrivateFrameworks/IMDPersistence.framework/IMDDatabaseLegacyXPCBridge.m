@implementation IMDDatabaseLegacyXPCBridge

- (id)_xpcDictionaryWithCodableObjects:(id)a3
{
  id v3;
  xpc_object_t empty;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  empty = xpc_dictionary_create_empty();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABBBD858;
  v7[3] = &unk_1E5AB7A48;
  v5 = empty;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)_xpcArrayWithChatRecords:(id)a3
{
  const __CFArray *v3;
  xpc_object_t empty;

  v3 = (const __CFArray *)a3;
  empty = xpc_array_create_empty();
  _IMDChatRecordCopyChatsToXPCArray(v3, empty, 0, 0, 1, 1);

  return empty;
}

- (id)_codableDictionaryCopiedFromXPCDictionary:(id)a3 objectClass:(Class)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD applier[4];
  id v11;
  id v12;
  Class v13;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", xpc_dictionary_get_count(v5));
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = sub_1ABBBDB0C;
    applier[3] = &unk_1E5AB7AC0;
    v11 = v6;
    v12 = v5;
    v13 = a4;
    v7 = v6;
    xpc_dictionary_apply(v12, applier);
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (id)_chatRecordsCopiedFromXPCArray:(id)a3
{
  if (a3)
    return _IMDChatRecordCopyChatsFromXPCArray(a3);
  else
    return MEMORY[0x1E0C9AA60];
}

- (id)_xpcArrayWithMessageRecords:(id)a3
{
  id v3;
  xpc_object_t empty;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  empty = xpc_array_create_empty();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = xpc_dictionary_create_empty();
        _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
        xpc_array_append_value(empty, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return empty;
}

- (id)_xpcArrayWithAttachmentRecords:(id)a3
{
  id v3;
  xpc_object_t empty;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  empty = xpc_array_create_empty();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = xpc_dictionary_create_empty();
        _IMDAttachmentRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1);
        xpc_array_append_value(empty, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return empty;
}

- (id)_xpcArrayWithHandleRecords:(id)a3
{
  id v3;
  xpc_object_t empty;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  empty = xpc_array_create_empty();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = xpc_dictionary_create_empty();
        _IMDHandleRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1);
        xpc_array_append_value(empty, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return empty;
}

- (id)_xpcArrayWithCodableObjects:(id)a3
{
  id v3;
  xpc_object_t empty;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  xpc_object_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  empty = xpc_array_create_empty();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = xpc_dictionary_create_empty();
        IMInsertKeyedCodableObjectsToXPCDictionary();
        xpc_array_append_value(empty, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v10, 0);
    }
    while (v7);
  }

  return empty;
}

- (id)_handleRecordsCopiedFromXPCArray:(id)a3
{
  if (a3)
    return _IMDHandleRecordCopyHandlesFromXPCArray(a3);
  else
    return MEMORY[0x1E0C9AA60];
}

- (id)_messageRecordsCopiedFromXPCArray:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD applier[4];
  id v10;

  if (!a3)
    return MEMORY[0x1E0C9AA60];
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", xpc_array_get_count(v4));
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = sub_1ABBBD9B0;
  applier[3] = &unk_1E5AB7A70;
  v10 = v5;
  v6 = v5;
  xpc_array_apply(v4, applier);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (id)_codableObjectsCopiedFromXPCArray:(id)a3 objectClass:(Class)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  Class v16;

  if (!a3)
    return MEMORY[0x1E0C9AA60];
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", xpc_array_get_count(v6));
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_1ABBBDABC;
  v14 = &unk_1E5AB7A98;
  v15 = v7;
  v16 = a4;
  v8 = v7;
  xpc_array_apply(v6, &v11);

  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);
  return v9;
}

- (id)_attachmentRecordsCopiedFromXPCArray:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD applier[4];
  id v10;

  if (!a3)
    return MEMORY[0x1E0C9AA60];
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", xpc_array_get_count(v4));
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = sub_1ABBBDC48;
  applier[3] = &unk_1E5AB7A70;
  v10 = v5;
  v6 = v5;
  xpc_array_apply(v4, applier);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

@end
