@implementation NSProxy(AXSideStorage)

- (id)_axDictionaryQueue
{
  if (_axDictionaryQueue_onceToken != -1)
    dispatch_once(&_axDictionaryQueue_onceToken, &__block_literal_global_11);
  return (id)_axDictionaryQueue__sDictionaryQueue;
}

- (id)_accessibilityValueForKey:()AXSideStorage
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2;
    v17 = __Block_byref_object_dispose__2;
    v18 = 0;
    objc_msgSend(a1, "_axDictionaryQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__NSProxy_AXSideStorage___accessibilityValueForKey___block_invoke;
    v12[3] = &unk_1E28C32B8;
    v12[4] = a1;
    v12[5] = &v13;
    dispatch_sync(v5, v12);

    v6 = (id)v14[5];
    objc_sync_enter(v6);
    objc_msgSend((id)v14[5], "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v6);

    if (objc_msgSend(v7, "_axIsWrappedPointer"))
    {
      objc_msgSend(v7, "nonretainedObjectValue");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v7;
    }
    v10 = v8;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    AXLogValidations();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NSProxy(AXSideStorage) _accessibilityValueForKey:].cold.1((uint64_t)a1, v9);

    v10 = 0;
  }

  return v10;
}

- (uint64_t)_accessibilityBoolValueForKey:()AXSideStorage
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accessibilityValueForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)_accessibilityIntegerValueForKey:()AXSideStorage
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accessibilityValueForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (uint64_t)_accessibilityUnsignedIntegerValueForKey:()AXSideStorage
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accessibilityValueForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)_accessibilitySetValue:()AXSideStorage forKey:storageMode:
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    v27 = 0;
    objc_msgSend(a1, "_axDictionaryQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__NSProxy_AXSideStorage___accessibilitySetValue_forKey_storageMode___block_invoke;
    block[3] = &unk_1E28C2DB0;
    v21 = &v22;
    block[4] = a1;
    v11 = v8;
    v20 = v11;
    dispatch_sync(v10, block);

    v12 = (void *)v23[5];
    if (v11)
    {
      v13 = v12;
      objc_sync_enter(v13);
      switch(a5)
      {
        case 0:
LABEL_8:
          objc_msgSend((id)v23[5], "setObject:forKeyedSubscript:", v11, v9);
          break;
        case 1:
          v18 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend((id)v23[5], "setObject:forKeyedSubscript:", v18, v9);

          break;
        case 2:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/Swizzling/AXSideStorage_Implementation.m", (void *)0x6F, (uint64_t)"-[NSProxy(AXSideStorage) _accessibilitySetValue:forKey:storageMode:]", CFSTR("value is not a wrapper class: %@"), v14, v15, v16, (uint64_t)v11);
          goto LABEL_8;
      }
    }
    else
    {
      if (!v12)
      {
LABEL_16:

        _Block_object_dispose(&v22, 8);
        goto LABEL_17;
      }
      v13 = v12;
      objc_sync_enter(v13);
      objc_msgSend((id)v23[5], "removeObjectForKey:", v9);
    }
    objc_sync_exit(v13);

    goto LABEL_16;
  }
  AXLogValidations();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[NSProxy(AXSideStorage) _accessibilitySetValue:forKey:storageMode:].cold.1((uint64_t)v8, (uint64_t)a1, v17);

LABEL_17:
}

- (uint64_t)_accessibilitySetRetainedValue:()AXSideStorage forKey:
{
  return objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", a3, a4, 0);
}

- (void)_accessibilitySetBoolValue:()AXSideStorage forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v8, v7);

}

- (void)_accessibilitySetIntegerValue:()AXSideStorage forKey:
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = (id)objc_msgSend([v6 alloc], "initWithInteger:", a3);
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v8, v7);

}

- (void)_accessibilitySetUnsignedIntegerValue:()AXSideStorage forKey:
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = (id)objc_msgSend([v6 alloc], "initWithUnsignedInteger:", a3);
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v8, v7);

}

- (uint64_t)_accessibilityRemoveValueForKey:()AXSideStorage
{
  return objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", 0, a3, 1);
}

- (void)_accessibilitySetAssignedValue:()AXSideStorage forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3B18];
  v7 = a4;
  objc_msgSend(v6, "valueWithNonretainedObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_axSetIsWrappedPointer:", 1);
  objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", v8, v7, 2);

}

- (void)_accessibilityValueForKey:()AXSideStorage .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = a1;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_18EBEC000, a2, OS_LOG_TYPE_ERROR, "AX Storage Error: Attempting to access a value with a nil key. Self:%{public}@.\nBacktrace:\n%{public}@.", (uint8_t *)&v5, 0x16u);

}

- (void)_accessibilitySetValue:()AXSideStorage forKey:storageMode:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = a1;
  v9 = 2114;
  v10 = a2;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_18EBEC000, a3, OS_LOG_TYPE_ERROR, "AX Storage Error: Attempting to store a value with a nil key. Value:%p.\nSelf:%{public}@.\nBacktrace:\n%{public}@.", (uint8_t *)&v7, 0x20u);

}

@end
