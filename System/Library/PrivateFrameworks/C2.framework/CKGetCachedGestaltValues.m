@implementation CKGetCachedGestaltValues

void ___CKGetCachedGestaltValues_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  __int128 buf;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v1 = (void *)_CKCachedGestaltValues;
  _CKCachedGestaltValues = v0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_QWORD *)&buf = CFSTR("UniqueDeviceID");
  *((_QWORD *)&buf + 1) = CFSTR("BuildVersion");
  v16 = CFSTR("ProductName");
  v17 = CFSTR("ProductType");
  v18 = CFSTR("ProductVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MGCopyAnswer();
        if (v8)
        {
          objc_msgSend((id)_CKCachedGestaltValues, "setObject:forKeyedSubscript:", v8, v7);
        }
        else
        {
          if (C2_DEFAULT_LOG_BLOCK_2 != -1)
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_2, &__block_literal_global_33);
          v9 = C2_DEFAULT_LOG_INTERNAL_2;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1D4DC3000, v9, OS_LOG_TYPE_ERROR, "Error getting %@ from MobileGestalt", (uint8_t *)&buf, 0xCu);
          }
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void ___CKGetCachedGestaltValues_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_2;
  C2_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

@end
