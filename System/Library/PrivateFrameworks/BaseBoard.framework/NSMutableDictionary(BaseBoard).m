@implementation NSMutableDictionary(BaseBoard)

- (void)bs_setSafeObject:()BaseBoard forKey:
{
  if (a3)
  {
    if (a4)
      return (void *)objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (id)bs_takeObjectForKey:()BaseBoard
{
  void *v5;
  id v6;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "removeObjectForKey:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)bs_addObject:()BaseBoard toCollectionClass:forKey:
{
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((objc_class *)objc_opt_class() != a4
    && (objc_class *)objc_opt_class() != a4
    && (objc_class *)objc_opt_class() != a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' must be NSMutableSet, NSMutableOrderedSet, or NSMutableArray, not (%@)"), a5, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v16 = v11;
      v17 = 2114;
      v18 = v13;
      v19 = 2048;
      v20 = a1;
      v21 = 2114;
      v22 = CFSTR("NSDictionary+BaseBoard.m");
      v23 = 1024;
      v24 = 107;
      v25 = 2114;
      v26 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1D6FD4);
  }
  objc_msgSend(a1, "objectForKey:", a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(a4);
    objc_msgSend(a1, "setObject:forKey:", v14, a5);
  }
  objc_msgSend(v14, "addObject:", a3);

}

- (void)bs_removeObject:()BaseBoard fromCollectionForKey:
{
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKey:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0 && (_NSIsNSArray() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' must be NSMutableSet, NSMutableOrderedSet, or NSMutableArray, not (%@)"), a4, objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        v17 = 2048;
        v18 = a1;
        v19 = 2114;
        v20 = CFSTR("NSDictionary+BaseBoard.m");
        v21 = 1024;
        v22 = 120;
        v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1D71DCLL);
    }
    objc_msgSend(v12, "removeObject:", a3);
    if (!objc_msgSend(v12, "count"))
      objc_msgSend(a1, "removeObjectForKey:", a4);
  }

}

@end
