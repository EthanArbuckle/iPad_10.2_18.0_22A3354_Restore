@implementation DMTConfigurationPayloadBase

+ (id)concretePayloadWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CFTypeID v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v13 = &unk_24E5A9B88;
    v14 = 70;
LABEL_8:
    DMTErrorWithCodeAndUserInfo(v14, v13);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = CFGetTypeID(v6);
  if (v8 != CFDictionaryGetTypeID())
  {
    v13 = &unk_24E5A9BB0;
    v14 = 71;
    goto LABEL_8;
  }
  DMTValidateProfileString(v7, CFSTR("PayloadType"), 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "payloadSubclassesByPayloadType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  if (!v11)
    v11 = (objc_class *)objc_opt_class();

  v12 = (void *)objc_msgSend([v11 alloc], "initWithDictionary:error:", v7, a4);
LABEL_9:

  return v12;
}

+ (NSDictionary)payloadSubclassesByPayloadType
{
  if (payloadSubclassesByPayloadType_onceToken != -1)
    dispatch_once(&payloadSubclassesByPayloadType_onceToken, &__block_literal_global_5);
  return (NSDictionary *)(id)payloadSubclassesByPayloadType_payloadClassesByPayloadType;
}

void __61__DMTConfigurationPayloadBase_payloadSubclassesByPayloadType__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _QWORD v35[8];

  v35[5] = *MEMORY[0x24BDAC8D0];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  v35[3] = objc_opt_class();
  v35[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v0;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v18 = v2;
        v3 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v2);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v3, "supportedPayloadTypes");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v20;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v20 != v7)
                objc_enumerationMutation(v4);
              v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
              if (objc_msgSend(v1, "objectForKeyedSubscript:", v9))
              {
                if (_DMTLogGeneral_onceToken_4 != -1)
                  dispatch_once(&_DMTLogGeneral_onceToken_4, &__block_literal_global_20);
                v10 = (void *)_DMTLogGeneral_logObj_4;
                if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_4, OS_LOG_TYPE_ERROR))
                {
                  v11 = v10;
                  v12 = objc_msgSend(v1, "objectForKeyedSubscript:", v9);
                  *(_DWORD *)buf = 138543874;
                  v28 = v9;
                  v29 = 2114;
                  v30 = v3;
                  v31 = 2114;
                  v32 = v12;
                  _os_log_error_impl(&dword_21FD69000, v11, OS_LOG_TYPE_ERROR, "Multiple validators found for payload type “%{public}@”! (%{public}@ and %{public}@)", buf, 0x20u);

                }
              }
              else
              {
                objc_msgSend(v1, "setObject:forKeyedSubscript:", v3, v9);
              }
              ++v8;
            }
            while (v6 != v8);
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
          }
          while (v6);
        }

        v2 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v17);
  }

  v13 = objc_msgSend(v1, "copy");
  v14 = (void *)payloadSubclassesByPayloadType_payloadClassesByPayloadType;
  payloadSubclassesByPayloadType_payloadClassesByPayloadType = v13;

}

@end
