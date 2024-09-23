@implementation CNMutableGroup(UIAdditions)

- (uint64_t)addGroupInStore:()UIAdditions toContainerWithIdentifier:saveRequest:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNGroup+UIAdditions.m"), 15, CFSTR("A store is needed here"));

  }
  CNUILogAccountsAndGroupsList();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = a1;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEFAULT, "[CNGroup+UIAdditions] adding group %@ to container %@ in store %@", buf, 0x20u);
  }

  if (!v11)
    v11 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v11, "addGroup:toContainerWithIdentifier:", a1, v10);
  v19 = 0;
  v13 = objc_msgSend(v9, "executeSaveRequest:error:", v11, &v19);
  v14 = v19;
  if ((v13 & 1) == 0)
  {
    CNUILogAccountsAndGroupsList();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v21 = v17;
      v22 = 2114;
      v23 = v10;
      v24 = 2114;
      v25 = v14;
      v26 = 2114;
      v27 = v9;
      v28 = 2112;
      v29 = a1;
      _os_log_error_impl(&dword_18AC56000, v15, OS_LOG_TYPE_ERROR, "[CNGroup+UIAdditions] Could not add group with identifer %{public}@ to container %{public}@, error %{public}@, store %{public}@, full group %@", buf, 0x34u);

    }
  }

  return v13;
}

- (uint64_t)deleteGroupInStore:()UIAdditions saveRequest:
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNGroup+UIAdditions.m"), 35, CFSTR("A store is needed here"));

  }
  CNUILogAccountsAndGroupsList();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = a1;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "[CNGroup+UIAdditions] deleting group %@ in store %@", buf, 0x16u);
  }

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v8, "deleteGroup:", a1);
  v16 = 0;
  v10 = objc_msgSend(v7, "executeSaveRequest:error:", v8, &v16);
  v11 = v16;
  if ((v10 & 1) == 0)
  {
    CNUILogAccountsAndGroupsList();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v18 = v14;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v7;
      v23 = 2112;
      v24 = a1;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "[CNGroup+UIAdditions] Could not delete group with identifer %{public}@, error %{public}@, store %{public}@, full group %@", buf, 0x2Au);

    }
  }

  return v10;
}

- (uint64_t)updateGroupInStore:()UIAdditions saveRequest:
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNGroup+UIAdditions.m"), 55, CFSTR("A store is needed here"));

  }
  CNUILogAccountsAndGroupsList();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = a1;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "[CNGroup+UIAdditions] updating group %@ in store %@", buf, 0x16u);
  }

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v8, "updateGroup:", a1);
  v16 = 0;
  v10 = objc_msgSend(v7, "executeSaveRequest:error:", v8, &v16);
  v11 = v16;
  if ((v10 & 1) == 0)
  {
    CNUILogAccountsAndGroupsList();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v18 = v14;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v7;
      v23 = 2112;
      v24 = a1;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "[CNGroup+UIAdditions] Could not update group with identifer %{public}@, error %{public}@, store %{public}@, full group %@", buf, 0x2Au);

    }
  }

  return v10;
}

@end
