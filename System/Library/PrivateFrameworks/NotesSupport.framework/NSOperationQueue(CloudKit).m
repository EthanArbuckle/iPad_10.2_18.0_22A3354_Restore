@implementation NSOperationQueue(CloudKit)

- (id)existingOperationToDeleteRecordID:()CloudKit
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__NSOperationQueue_CloudKit__existingOperationToDeleteRecordID___block_invoke;
  v9[3] = &unk_1EA824CF8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ic_objectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsOperationToDeleteRecordID:()CloudKit
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "existingOperationToDeleteRecordID:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)existingOperationToFetchRecordID:()CloudKit
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__NSOperationQueue_CloudKit__existingOperationToFetchRecordID___block_invoke;
  v9[3] = &unk_1EA824CF8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ic_objectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsOperationToFetchRecordID:()CloudKit
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "existingOperationToFetchRecordID:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)existingOperationToSaveRecordID:()CloudKit
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NSOperationQueue_CloudKit__existingOperationToSaveRecordID___block_invoke;
  v9[3] = &unk_1EA824CF8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ic_objectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsOperationToSaveRecordID:()CloudKit
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "existingOperationToSaveRecordID:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)iterativelyCancelDependentOperations:()CloudKit
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  os_log_t v17;
  char v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  objc_msgSend(v5, "lastObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v26 = v7;
    while (1)
    {
      if (!objc_msgSend(v7, "count", v26))
        goto LABEL_23;
      objc_msgSend(v29, "removeLastObject");
      objc_msgSend(v29, "lastObject");
      v27 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (!v12)
        goto LABEL_22;
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
          objc_msgSend(v16, "dependencies");
          v17 = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (!-[NSObject containsObject:](v17, "containsObject:", v4))
            goto LABEL_15;
          v18 = objc_msgSend(v16, "isCancelled");

          if ((v18 & 1) != 0)
            goto LABEL_16;
          v19 = objc_msgSend(v16, "ic_resistsCancellation");
          v17 = os_log_create("com.apple.notes", "Cloud");
          v20 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
          if (v19)
          {
            if (v20)
            {
              objc_msgSend(v16, "ic_loggingDescription");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v35 = v21;
              _os_log_impl(&dword_1DDAA5000, v17, OS_LOG_TYPE_INFO, "Operation resisted cancellation: %@", buf, 0xCu);

            }
LABEL_15:

            goto LABEL_16;
          }
          if (v20)
          {
            objc_msgSend(v16, "ic_loggingDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v22;
            _os_log_impl(&dword_1DDAA5000, v17, OS_LOG_TYPE_INFO, "Canceling operation: %@", buf, 0xCu);

          }
          objc_msgSend(v16, "cancel");
          objc_msgSend(v29, "addObject:", v16);
          objc_msgSend(v10, "addObject:", v16);
          objc_msgSend(v28, "addObject:", v16);
LABEL_16:
          ++v15;
        }
        while (v13 != v15);
        v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        v13 = v23;
      }
      while (v23);
LABEL_22:

      objc_msgSend(v11, "removeObjectsInArray:", v10);
      v7 = v26;
      v9 = (void *)v27;
      if (!v27)
      {
LABEL_23:

        break;
      }
    }
  }
  v24 = (void *)objc_msgSend(v28, "copy");

  return v24;
}

@end
