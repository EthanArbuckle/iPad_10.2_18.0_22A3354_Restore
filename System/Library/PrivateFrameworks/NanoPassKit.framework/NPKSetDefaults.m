@implementation NPKSetDefaults

void __NPKSetDefaults_block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  unint64_t v6;
  unint64_t v7;
  const void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  const void *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (unint64_t)CFPreferencesCopyAppValue(v5, *(CFStringRef *)(a1 + 48));
  v8 = (const void *)v7;
  if (v6 | v7 && ((v6 != 0) != (v7 != 0) || !CFEqual((CFTypeRef)v6, (CFTypeRef)v7)))
  {
    CFPreferencesSetAppValue(v5, (CFPropertyListRef)v6, *(CFStringRef *)(a1 + 48));
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (!v11)
  {
    if ((v9 & 1) != 0)
      goto LABEL_8;
LABEL_16:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (!v8)
      goto LABEL_10;
    goto LABEL_9;
  }
  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("set");
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138413314;
    if (v9)
      v13 = CFSTR("did not set");
    v16 = v14;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: \t%@ %@: old %@ new %@ (%@)", (uint8_t *)&v15, 0x34u);
  }

  if ((v9 & 1) == 0)
    goto LABEL_16;
LABEL_8:
  if (v8)
LABEL_9:
    CFRelease(v8);
LABEL_10:

}

@end
