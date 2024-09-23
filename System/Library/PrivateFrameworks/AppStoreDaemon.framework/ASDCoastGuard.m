@implementation ASDCoastGuard

- (BOOL)isUnrepairableAppWithItemID:(unint64_t)a3 externalVersionID:(unint64_t)a4
{
  int v6;
  NSData *deadlistItemIDs;
  void *v9;
  void *v10;
  void *v11;
  NSData *v12;
  NSData *v13;
  NSObject *v14;
  uint64_t v15;
  int __key;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 > 0x52E12BCD || a4 > 0x31E2A03E)
    return 0;
  v6 = a3;
  deadlistItemIDs = self->_deadlistItemIDs;
  if (!deadlistItemIDs)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AppStoreDaemon.framework"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resourceURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("DeadlistItemIDs.bin"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v12 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v11, 10, &v15);
    v13 = self->_deadlistItemIDs;
    self->_deadlistItemIDs = v12;

    if (self->_deadlistItemIDs)
    {

      deadlistItemIDs = self->_deadlistItemIDs;
      goto LABEL_10;
    }
    ASDLogHandleForCategory(12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      __key = 138543362;
      v17 = v15;
      _os_log_fault_impl(&dword_19A03B000, v14, OS_LOG_TYPE_FAULT, "Unable to load deadlist: %{public}@", (uint8_t *)&__key, 0xCu);
    }

    return 0;
  }
LABEL_10:
  __key = v6;
  return bsearch_b(&__key, -[NSData bytes](deadlistItemIDs, "bytes"), -[NSData length](self->_deadlistItemIDs, "length") >> 2, 4uLL, &__block_literal_global_27) != 0;
}

uint64_t __63__ASDCoastGuard_isUnrepairableAppWithItemID_externalVersionID___block_invoke(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  return (*a2 - *a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deadlistItemIDs, 0);
}

@end
