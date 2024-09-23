@implementation SOSBackupSliceKeyBagCopyWrappedKeys

void __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  const void *v5;
  const __CFData *v6;
  const __CFData *v7;
  __CFData *v8;
  _QWORD *v9;
  const __CFAllocator *v10;
  CFIndex Length;
  __CFString *Mutable;
  const UInt8 *BytePtr;
  CFIndex v14;
  CFIndex v15;
  unsigned int v16;
  NSObject *v17;
  _QWORD *v18;
  const __CFAllocator *v19;
  CFIndex v20;
  __CFString *v21;
  const UInt8 *v22;
  CFIndex v23;
  CFIndex v24;
  unsigned int v25;
  _QWORD *v26;
  _QWORD v27[2];
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  const void *v30;
  uint64_t v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, uint64_t);
  void *v34;
  __CFData *v35;
  const void *v36;
  _BYTE buf[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == SOSPeerInfoGetTypeID())
    {
      v5 = (const void *)*((_QWORD *)cf + 5);
      v6 = SOSPeerInfoV2DictionaryCopyData((uint64_t)cf, (const void *)sBackupKeyKey);
      if (v6)
      {
        v7 = v6;
        *(_QWORD *)buf = 0;
        v8 = SOSCopyECWrapped(v6, *(const __CFData **)(a1 + 40), (CFTypeRef *)buf);
        if (v8)
        {
          CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), v5, v8);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v33 = __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_2;
          v34 = &__block_descriptor_48_e21_v16__0____CFString__8l;
          v35 = v8;
          v36 = v5;
          v9 = v32;
          v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          Length = CFDataGetLength(v7);
          Mutable = CFStringCreateMutable(v10, 2 * Length);
          BytePtr = CFDataGetBytePtr(v7);
          v14 = CFDataGetLength(v7);
          if (v14 >= 1)
          {
            v15 = v14;
            do
            {
              v16 = *BytePtr++;
              CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v16);
              --v15;
            }
            while (v15);
          }
          v33((uint64_t)v9, (uint64_t)Mutable);
          CFRelease(Mutable);

          CFRelease(v8);
        }
        else
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v28 = __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_53;
          v29 = &__block_descriptor_48_e21_v16__0____CFString__8l;
          v30 = v5;
          v31 = *(_QWORD *)buf;
          v18 = v27;
          v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v20 = CFDataGetLength(v7);
          v21 = CFStringCreateMutable(v19, 2 * v20);
          v22 = CFDataGetBytePtr(v7);
          v23 = CFDataGetLength(v7);
          if (v23 >= 1)
          {
            v24 = v23;
            do
            {
              v25 = *v22++;
              CFStringAppendFormat(v21, 0, CFSTR("%02X"), v25);
              --v24;
            }
            while (v24);
          }
          v28((uint64_t)v18, (uint64_t)v21);
          CFRelease(v21);

          if (*(_QWORD *)buf)
          {
            v26 = *(_QWORD **)(a1 + 56);
            if (v26 && !*v26)
              *v26 = *(_QWORD *)buf;
            else
              CFRelease(*(CFTypeRef *)buf);
          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        }
        CFRelease(v7);
      }
      else
      {
        secLogObjForScope("bskb");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v5;
          _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "Skipping id %@, no backup key.", buf, 0xCu);
        }

      }
    }
  }
}

void __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_54(uint64_t a1, const __CFString *cf, const void *a3)
{
  const __CFString *v5;
  CFTypeID v6;
  CFTypeID v7;
  __CFString *v8;
  __CFData *v9;
  _QWORD *v10;
  const __CFAllocator *v11;
  CFIndex Length;
  __CFString *Mutable;
  const UInt8 *BytePtr;
  CFIndex v15;
  CFIndex v16;
  unsigned int v17;
  _QWORD *v18;
  NSObject *v19;
  _QWORD *v20;
  const __CFAllocator *v21;
  CFIndex v22;
  __CFString *v23;
  const UInt8 *v24;
  CFIndex v25;
  CFIndex v26;
  unsigned int v27;
  _QWORD v28[2];
  void (*v29)(uint64_t, uint64_t);
  void *v30;
  uint64_t v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, uint64_t);
  void *v34;
  __CFData *v35;
  _BYTE cfa[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!cf || (v5 = cf, v6 = CFGetTypeID(cf), v6 != CFStringGetTypeID()))
    v5 = 0;
  if (a3)
  {
    v7 = CFGetTypeID(a3);
    if (v7 == CFDataGetTypeID())
    {
      *(_QWORD *)cfa = 0;
      v8 = SOSKeyedPubKeyIdentifierCreateWithData(v5, (const __CFData *)a3);
      if (v8)
      {
        v9 = SOSCopyECWrapped((const __CFData *)a3, *(const __CFData **)(a1 + 40), (CFTypeRef *)cfa);
        if (v9)
          CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), v8, v9);
        if (*(_QWORD *)cfa)
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v29 = __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_58;
          v30 = &__block_descriptor_40_e21_v16__0____CFString__8l;
          v31 = *(_QWORD *)cfa;
          v10 = v28;
          v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          Length = CFDataGetLength((CFDataRef)a3);
          Mutable = CFStringCreateMutable(v11, 2 * Length);
          BytePtr = CFDataGetBytePtr((CFDataRef)a3);
          v15 = CFDataGetLength((CFDataRef)a3);
          if (v15 >= 1)
          {
            v16 = v15;
            do
            {
              v17 = *BytePtr++;
              CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v17);
              --v16;
            }
            while (v16);
          }
          v29((uint64_t)v10, (uint64_t)Mutable);
          CFRelease(Mutable);

          if (*(_QWORD *)cfa)
          {
            v18 = *(_QWORD **)(a1 + 56);
            if (v18 && !*v18)
              *v18 = *(_QWORD *)cfa;
            else
              CFRelease(*(CFTypeRef *)cfa);
          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
          if (!v9)
            goto LABEL_23;
          goto LABEL_22;
        }
      }
      else
      {
        v9 = 0;
      }
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v33 = __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_2_55;
      v34 = &__block_descriptor_40_e21_v16__0____CFString__8l;
      v35 = v9;
      v20 = v32;
      v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v22 = CFDataGetLength((CFDataRef)a3);
      v23 = CFStringCreateMutable(v21, 2 * v22);
      v24 = CFDataGetBytePtr((CFDataRef)a3);
      v25 = CFDataGetLength((CFDataRef)a3);
      if (v25 >= 1)
      {
        v26 = v25;
        do
        {
          v27 = *v24++;
          CFStringAppendFormat(v23, 0, CFSTR("%02X"), v27);
          --v26;
        }
        while (v26);
      }
      v33((uint64_t)v20, (uint64_t)v23);
      CFRelease(v23);

      if (!v9)
        goto LABEL_23;
LABEL_22:
      CFRelease(v9);
LABEL_23:
      if (v8)
        CFRelease(v8);
      return;
    }
  }
  secLogObjForScope("bskb");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)cfa = 138412290;
    *(_QWORD *)&cfa[4] = a3;
    _os_log_impl(&dword_18A900000, v19, OS_LOG_TYPE_DEFAULT, "Skipping %@, not data.", cfa, 0xCu);
  }

}

void __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_2_55(uint64_t a1, uint64_t a2)
{
  const __CFData *v2;
  _QWORD v3[5];

  v2 = *(const __CFData **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_3_56;
  v3[3] = &__block_descriptor_40_e21_v16__0____CFString__8l;
  v3[4] = a2;
  CFDataPerformWithHexString(v2, v3);
}

void __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_58(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("bskb");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "Failed at bk: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_3_56(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("bskb");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = a2;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "Add for bk: %@, wrapped: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const __CFData *v2;
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_3;
  v3[3] = &__block_descriptor_48_e21_v16__0____CFString__8l;
  v2 = *(const __CFData **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v3[5] = a2;
  CFDataPerformWithHexString(v2, v3);
}

void __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_53(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("bskb");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = a2;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "Failed at id: %@, bk: %@ error: %@", (uint8_t *)&v7, 0x20u);
  }

}

void __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("bskb");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "Add for id: %@, bk: %@, wrapped: %@", (uint8_t *)&v7, 0x20u);
  }

}

@end
