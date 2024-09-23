@implementation HIDPreferencesLocal

- (void)set:(id)a3 value:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  __CFString *v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  _IOHIDLogCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138413314;
    v18 = v11;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_21B143000, v16, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Set Key:%@ Value:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v17, 0x34u);
  }

  CFPreferencesSetValue(v11, v12, v15, v13, v14);
}

- (void)copy:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void (**v15)(id, void *);
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (void (**)(id, void *))a7;
  _IOHIDLogCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138413058;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_21B143000, v16, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Copy Key:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v19, 0x2Au);
  }

  v17 = (void *)CFPreferencesCopyValue(v11, v14, v12, v13);
  _IOHIDLogCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesLocal copy:user:host:domain:reply:].cold.1();

  if (v15)
    v15[2](v15, v17);

}

- (void)synchronize:(id)a3 host:(id)a4 domain:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a5;
  _IOHIDLogCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_21B143000, v10, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Synchronize User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v11, 0x20u);
  }

  CFPreferencesSynchronize(v9, v7, v8);
}

- (void)copyMultiple:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  const __CFArray *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void (**v15)(id, CFDictionaryRef);
  NSObject *v16;
  CFDictionaryRef v17;
  NSObject *v18;
  int v19;
  const __CFArray *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = (const __CFArray *)a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (void (**)(id, CFDictionaryRef))a7;
  _IOHIDLogCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138413058;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_21B143000, v16, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Copy Multiple Keys:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v19, 0x2Au);
  }

  v17 = CFPreferencesCopyMultiple(v11, v14, v12, v13);
  _IOHIDLogCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesLocal copy:user:host:domain:reply:].cold.1();

  if (v15)
    v15[2](v15, v17);

}

- (void)setMultiple:(id)a3 keysToRemove:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  const __CFDictionary *v11;
  const __CFArray *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  const __CFDictionary *v18;
  __int16 v19;
  const __CFArray *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = (const __CFDictionary *)a3;
  v12 = (const __CFArray *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  _IOHIDLogCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138413314;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_21B143000, v16, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Set Multiple KeysToSet:%@ KeysToRemove:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v17, 0x34u);
  }

  CFPreferencesSetMultiple(v11, v12, v15, v13, v14);
}

- (void)copyDomain:(id)a3 domain:(id)a4 reply:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  NSObject *v12;

  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = (void (**)(id, void *))a5;
  _IOHIDLogCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesLocal copyDomain:domain:reply:].cold.2();

  v11 = (void *)CFPreferencesCopyAppValue(v7, v8);
  _IOHIDLogCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesLocal copy:user:host:domain:reply:].cold.1();

  if (v9)
    v9[2](v9, v11);

}

- (void)setDomain:(id)a3 value:(id)a4 domain:(id)a5
{
  __CFString *v7;
  id v8;
  __CFString *v9;
  NSObject *v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  _IOHIDLogCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v8;
    _os_log_debug_impl(&dword_21B143000, v10, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Set Domain Value Key:%@ Domain:%@ Value : %@\n", (uint8_t *)&v11, 0x20u);
  }

  CFPreferencesSetAppValue(v7, v8, v9);
}

- (void)copy:user:host:domain:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_21B143000, v0, v1, "HIDPReferencesLocal CFPreference value %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)copyDomain:domain:reply:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_21B143000, v1, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Copy Domain Value Key:%@ Domain:%@\n", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end
