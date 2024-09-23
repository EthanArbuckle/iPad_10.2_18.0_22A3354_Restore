uint64_t GSSItemGetTypeID()
{
  if (gss_init_once != -1)
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
  return gssitemid;
}

const __CFURL *GSSItemAdd(const __CFDictionary *a1, CFErrorRef *a2)
{
  const __CFDictionary *v4;
  __CFDictionary *v5;
  CFMutableArrayRef v6;
  CFStringRef v7;
  CFMutableDictionaryRef *v8;
  const __CFUUID *v10;
  const __CFUUID *v11;
  int v12;
  CFErrorRef *v13;

  if (gss_init_once == -1)
  {
    if (a1)
      goto LABEL_3;
  }
  else
  {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
    if (a1)
    {
LABEL_3:
      if (a2)
        *a2 = 0;
      v4 = copyConfiguration(1, a2);
      if (!v4)
        return 0;
      v5 = v4;
      v6 = searchCopyResult(v4, (uint64_t)a1);
      if (v6)
      {
        v7 = (CFStringRef)v6;
      }
      else
      {
        v8 = (CFMutableDictionaryRef *)GSSCreateItem(0);
        if (!v8)
          goto LABEL_10;
        v10 = CFUUIDCreate(0);
        if (v10 && (v11 = v10, v7 = CFUUIDCreateString(0, v10), CFRelease(v11), v7))
        {
          CFDictionarySetValue(v8[2], CFSTR("kGSSAttrUUID"), v7);
          if ((modifyItem((uint64_t)v8, a1, (CFTypeRef *)a2) & 1) != 0
            && (applyClassItems((uint64_t)v8, v8[2], (void (__cdecl *)(const void *, const void *, void *))validateAttributes, (CFTypeRef *)a2) & 1) != 0)
          {
            updateTransientValues((uint64_t)v8);
            CFDictionarySetValue(v5, v7, v8);
            storeConfiguration(v5);
            goto LABEL_9;
          }
          CFRelease(v8);
        }
        else
        {
          v7 = (CFStringRef)v8;
        }
      }
      v8 = 0;
LABEL_9:
      CFRelease(v7);
LABEL_10:
      CFRelease(v5);
      return (const __CFURL *)v8;
    }
  }
  v12 = heim_abort();
  return copyConfiguration(v12, v13);
}

const __CFURL *copyConfiguration(int a1, CFErrorRef *a2)
{
  const __CFURL *result;
  const __CFURL *v5;
  const __CFAllocator *v6;
  __CFReadStream *v7;
  const __CFDictionary *v8;
  CFTypeID v9;
  const __CFDictionary *Value;
  CFTypeRef v11;
  CFTypeRef v12;
  CFTypeRef cf;
  _QWORD useriter[5];
  OM_uint32 min_stat;

  v12 = 0;
  cf = 0;
  result = copyConfigurationURL();
  if (!result)
    return result;
  v5 = result;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x24BDBD240], result);
  CFRelease(v5);
  if (v7)
  {
    if (CFReadStreamOpen(v7))
    {
      v8 = (const __CFDictionary *)CFPropertyListCreateWithStream(v6, v7, 0, 0, 0, a2);
      CFRelease(v7);
      if (v8 && (v9 = CFGetTypeID(v8), v9 == CFDictionaryGetTypeID()))
      {
        initCreateContext((CFMutableDictionaryRef *)&v12);
        Value = (const __CFDictionary *)CFDictionaryGetValue(v8, CFSTR("kGSSConfKeys"));
        if (Value)
        {
          CFDictionaryApplyFunction(Value, (CFDictionaryApplierFunction)createItem, &v12);
          v11 = v12;
          if (!a1)
            goto LABEL_15;
        }
        else
        {
          CFRelease(v12);
          v11 = 0;
          v12 = 0;
          if (!a1)
            goto LABEL_15;
        }
      }
      else
      {
        v11 = 0;
        if (!a1)
          goto LABEL_15;
      }
LABEL_13:
      if (!v11)
      {
        initCreateContext((CFMutableDictionaryRef *)&v12);
        v11 = v12;
      }
      goto LABEL_15;
    }
    CFRelease(v7);
  }
  v11 = 0;
  v8 = 0;
  if (a1)
    goto LABEL_13;
LABEL_15:
  if (v11)
  {
    min_stat = 0;
    useriter[0] = MEMORY[0x24BDAC760];
    useriter[1] = 0x40000000;
    useriter[2] = __addTransientKeys_block_invoke;
    useriter[3] = &__block_descriptor_tmp_64;
    useriter[4] = &v12;
    gss_iter_creds(&min_stat, 0, &__gss_krb5_mechanism_oid_desc, useriter);
  }
  if (cf)
    CFRelease(cf);
  if (v8)
    CFRelease(v8);
  return (const __CFURL *)v12;
}

CFMutableArrayRef searchCopyResult(const __CFDictionary *a1, uint64_t a2)
{
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v5;
  _QWORD v7[2];

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v5 = Mutable;
  if (Mutable)
  {
    v7[0] = a2;
    v7[1] = Mutable;
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)searchFunction, v7);
    if (!CFArrayGetCount(v5))
    {
      CFRelease(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t GSSCreateItem(const __CFDictionary *a1)
{
  uint64_t Instance;
  CFMutableDictionaryRef MutableCopy;

  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1)
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a1);
    else
      MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(Instance + 16) = MutableCopy;
    *(_QWORD *)(Instance + 24) = 0;
  }
  return Instance;
}

const __CFDictionary *modifyItem(uint64_t a1, const __CFDictionary *a2, CFTypeRef *a3)
{
  const __CFDictionary *v4;
  const void *Value;
  CFTypeID v6;
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  CFTypeID v9;

  v4 = applyClassItems(a1, a2, (void (__cdecl *)(const void *, const void *, void *))modifyAttributes, a3);
  if ((_DWORD)v4)
  {
    Value = CFDictionaryGetValue(a2, CFSTR("kGSSAttrCredentialPassword"));
    if (Value)
    {
      v6 = CFGetTypeID(Value);
      if (v6 == CFStringGetTypeID())
      {
        v7 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("kGSSAttrCredentialStore"));
        if (v7)
        {
          v8 = v7;
          v9 = CFGetTypeID(v7);
          if (v9 == CFBooleanGetTypeID())
            CFBooleanGetValue(v8);
        }
      }
    }
  }
  return v4;
}

gss_buffer_set_desc_struct *updateTransientValues(uint64_t a1)
{
  gss_cred_id_t_desc_struct *v2;
  __CFDictionary *v3;
  const void *v4;
  CFDataRef v5;
  CFDataRef v6;
  double v7;
  CFDateRef v8;
  gss_buffer_set_desc_struct *result;
  CFStringRef v10;
  gss_buffer_set_t data_set;
  gss_buffer_desc_struct buffer;
  OM_uint32 v13;
  OM_uint32 minor_status;

  minor_status = 0;
  v13 = 0;
  v2 = itemToGSSCred(a1, &v13, 0);
  buffer.length = 0;
  buffer.value = 0;
  v3 = *(__CFDictionary **)(a1 + 16);
  if (v2)
  {
    v4 = (const void *)*MEMORY[0x24BDBD270];
    CFDictionarySetValue(v3, CFSTR("kGSSAttrCredentialExists"), (const void *)*MEMORY[0x24BDBD270]);
    if (!__ApplePrivate_gss_cred_label_get(&minor_status, (uint64_t)v2, (uint64_t)"kcm-status", &buffer))
    {
      v5 = CFDataCreate(0, (const UInt8 *)buffer.value, buffer.length);
      if (v5)
      {
        v6 = v5;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrStatusAutoAcquireStatus"), v5);
        CFRelease(v6);
      }
      gss_release_buffer(&minor_status, &buffer);
    }
    if (v13)
      v7 = (double)time(0) + -978307200.0 + (double)(v13 | 0xC1CD27E400000000);
    else
      v7 = 0.0;
    v8 = CFDateCreate(0, v7);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrTransientExpire"), v8);
    CFRelease(v8);
    data_set = 0;
    LODWORD(v8) = gss_inquire_cred_by_oid(&minor_status, v2, &__gss_c_cred_get_default_oid_desc, &data_set);
    gss_release_buffer_set(&minor_status, &data_set);
    if (!(_DWORD)v8)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrTransientDefaultInClass"), v4);
    CFRelease(v2);
  }
  else
  {
    CFDictionaryRemoveValue(v3, CFSTR("kGSSAttrTransientExpire"));
  }
  result = (gss_buffer_set_desc_struct *)itemCopyGSSName(a1);
  data_set = result;
  if (result)
  {
    if (!gss_display_name(&minor_status, (gss_name_t)result, &buffer, 0))
    {
      v10 = CFStringCreateWithFormat(0, 0, CFSTR("%.*s"), buffer.length, buffer.value, data_set);
      gss_release_buffer(&minor_status, &buffer);
      if (v10)
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrNameDisplay"), v10);
        CFRelease(v10);
      }
    }
    return (gss_buffer_set_desc_struct *)gss_release_name(&minor_status, (gss_name_t *)&data_set);
  }
  return result;
}

void storeConfiguration(const __CFDictionary *a1)
{
  const __CFURL *v2;
  const __CFURL *v3;
  __CFWriteStream *v4;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v6;
  __CFDictionary *v7;
  __CFDictionary *v8;

  v2 = copyConfigurationURL();
  if (v2)
  {
    v3 = v2;
    v4 = CFWriteStreamCreateWithFile(0, v2);
    CFRelease(v3);
    if (v4)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        v6 = Mutable;
        CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)storeItem, Mutable);
        v7 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (v7)
        {
          v8 = v7;
          CFDictionarySetValue(v7, CFSTR("kGSSConfKeys"), v6);
          CFRelease(v6);
          if (CFWriteStreamOpen(v4))
          {
            CFPropertyListWrite(v8, v4, kCFPropertyListBinaryFormat_v1_0, 0, 0);
            CFWriteStreamClose(v4);
          }
          v6 = v4;
        }
        else
        {
          v8 = v4;
        }
        CFRelease(v6);
        v4 = v8;
      }
      CFRelease(v4);
    }
  }
}

uint64_t GSSItemUpdate(uint64_t a1, const __CFDictionary *a2, CFErrorRef *a3)
{
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const void *ValueAtIndex;
  uint64_t v14;
  uint64_t v16;

  if (gss_init_once != -1)
  {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
    if (a1)
      goto LABEL_3;
LABEL_18:
    v16 = heim_abort();
    return GSSItemDeleteItem(v16);
  }
  if (!a1)
    goto LABEL_18;
LABEL_3:
  if (a3)
    *a3 = 0;
  v6 = copyConfiguration(1, a3);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = searchCopyResult(v6, a1);
  if (v8)
  {
    v9 = v8;
    Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      v11 = Count;
      v12 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, v12);
        if ((modifyItem((uint64_t)ValueAtIndex, a2, (CFTypeRef *)a3) & 1) != 0)
          break;
        if (v11 == ++v12)
        {
          CFRelease(v9);
          goto LABEL_12;
        }
      }
    }
    CFRelease(v9);
    storeConfiguration(v7);
    v14 = 1;
  }
  else
  {
LABEL_12:
    v14 = 0;
  }
  CFRelease(v7);
  return v14;
}

uint64_t GSSItemDeleteItem(uint64_t a1, CFErrorRef *a2)
{
  __CFDictionary *v3;
  const __CFDictionary *v4;
  uint64_t v5;

  v3 = copyConfiguration(0, a2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = ItemDeleteItem(v3, a1);
  if ((_DWORD)v5)
    storeConfiguration(v4);
  CFRelease(v4);
  return v5;
}

uint64_t ItemDeleteItem(__CFDictionary *a1, uint64_t a2)
{
  uint64_t result;
  const void *v5;
  OM_uint32 min_stat;
  gss_cred_id_t cred_handle;

  result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), CFSTR("kGSSAttrUUID"));
  if (result)
  {
    v5 = (const void *)result;
    cred_handle = itemToGSSCred(a2, 0, 0);
    if (cred_handle)
    {
      min_stat = 0;
      gss_destroy_cred(&min_stat, &cred_handle);
    }
    CFDictionaryRemoveValue(a1, v5);
    return 1;
  }
  return result;
}

uint64_t GSSItemDelete(uint64_t a1, CFErrorRef *a2)
{
  const __CFDictionary *v4;
  __CFDictionary *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  int v10;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v14;

  if (gss_init_once == -1)
  {
    if (a1)
      goto LABEL_3;
  }
  else
  {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
    if (a1)
    {
LABEL_3:
      if (a2)
        *a2 = 0;
      v4 = copyConfiguration(0, a2);
      if (!v4)
      {
        LOBYTE(v10) = 0;
        return v10;
      }
      v5 = v4;
      v6 = searchCopyResult(v4, a1);
      if (v6)
      {
        v7 = v6;
        Count = CFArrayGetCount(v6);
        if (Count >= 1)
        {
          v9 = Count;
          v10 = 0;
          for (i = 0; i != v9; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
            if (ItemDeleteItem(v5, (uint64_t)ValueAtIndex))
              v10 = 1;
          }
          CFRelease(v7);
          if (v10)
            storeConfiguration(v5);
          goto LABEL_17;
        }
        CFRelease(v7);
      }
      LOBYTE(v10) = 0;
LABEL_17:
      CFRelease(v5);
      return v10;
    }
  }
  v14 = heim_abort();
  return GSSItemCopyMatching(v14);
}

const __CFArray *GSSItemCopyMatching(uint64_t a1, CFErrorRef *a2)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  const void *ValueAtIndex;

  if (gss_init_once == -1)
  {
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
  if (a2)
LABEL_3:
    *a2 = 0;
LABEL_4:
  v4 = copyConfiguration(1, a2);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = searchCopyResult(v4, a1);
  CFRelease(v5);
  if (v6)
  {
    Count = CFArrayGetCount(v6);
    if (Count >= 1)
    {
      v8 = Count;
      for (i = 0; i != v8; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, i);
        updateTransientValues((uint64_t)ValueAtIndex);
      }
    }
  }
  return v6;
}

void itemAcquire(uint64_t a1, const __CFDictionary *a2, NSObject *a3, uint64_t a4)
{
  gss_name_t_desc_struct *v8;
  gss_name_t_desc_struct *v9;
  gss_OID_desc *v10;
  const gss_OID_desc *v11;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v13;
  const void *Value;
  const void *v15;
  const __CFString *v16;
  const void *v17;
  const void *v18;
  CFStringRef v19;
  CFStringRef v20;
  const void *v21;
  _QWORD block[7];
  OM_uint32 minor_status;
  CFErrorRef error;
  gss_name_t input_name;
  gss_cred_id_t output_cred_handle;

  output_cred_handle = 0;
  error = 0;
  minor_status = 0;
  v8 = itemCopyGSSName(a1);
  input_name = v8;
  if (v8)
  {
    v9 = v8;
    v10 = itemToMechOID(a1);
    if (!v10)
      goto LABEL_19;
    v11 = v10;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!Mutable)
      goto LABEL_19;
    v13 = Mutable;
    if (a2)
    {
      Value = CFDictionaryGetValue(a2, CFSTR("kGSSAttrCredentialPassword"));
      if (Value)
      {
        v15 = Value;
        v16 = CFSTR("kGSSICPassword");
      }
      else
      {
        v17 = CFDictionaryGetValue(a2, CFSTR("kGSSAttrCredentialSecIdentity"));
        if (!v17)
          goto LABEL_10;
        v15 = v17;
        v16 = CFSTR("kGSSICCertificate");
      }
      CFDictionarySetValue(v13, v16, v15);
    }
LABEL_10:
    v18 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrUUID"));
    if (v18)
    {
      v19 = CFStringCreateWithFormat(0, 0, CFSTR("API:%@"), v18);
      if (!v19)
      {
LABEL_18:
        CFRelease(v13);
LABEL_19:
        gss_release_name(&minor_status, &input_name);
        goto LABEL_20;
      }
      v20 = v19;
      CFDictionarySetValue(v13, CFSTR("kGSSICKerberosCacheName"), v19);
      CFRelease(v20);
    }
    gss_aapl_initial_cred(v9, v11, v13, &output_cred_handle, &error);
    v21 = *(const void **)(a1 + 24);
    if (v21)
    {
      CFRelease(v21);
      *(_QWORD *)(a1 + 24) = 0;
    }
    if (output_cred_handle)
      *(_QWORD *)(a1 + 24) = GSSCredentialCopyUUID(output_cred_handle);
    updateTransientValues(a1);
    goto LABEL_18;
  }
LABEL_20:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __itemAcquire_block_invoke;
  block[3] = &unk_24C20E060;
  block[4] = a4;
  block[5] = output_cred_handle;
  block[6] = error;
  dispatch_async(a3, block);
}

void itemDestroyTransient(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t v7;
  _QWORD v8[7];
  OM_uint32 min_stat;
  gss_cred_id_t cred_handle;
  CFErrorRef v11;

  v11 = 0;
  min_stat = 0;
  cred_handle = itemToGSSCred(a1, 0, &v11);
  if (cred_handle)
  {
    gss_destroy_cred(&min_stat, &cred_handle);
    v6 = (uint64_t *)MEMORY[0x24BDBD270];
  }
  else
  {
    v6 = (uint64_t *)MEMORY[0x24BDBD268];
  }
  v7 = *v6;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __itemDestroyTransient_block_invoke;
  v8[3] = &unk_24C20E088;
  v8[4] = a4;
  v8[5] = v7;
  v8[6] = v11;
  dispatch_async(a3, v8);
}

void itemGetGSSCredential(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  gss_cred_id_t v6;
  _QWORD v7[7];
  CFErrorRef v8;

  v8 = 0;
  v6 = itemToGSSCred(a1, 0, &v8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 0x40000000;
  v7[2] = __itemGetGSSCredential_block_invoke;
  v7[3] = &unk_24C20E0B0;
  v7[4] = a4;
  v7[5] = v6;
  v7[6] = v8;
  dispatch_async(a3, v7);
}

void itemCredentialDiagnostics(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  gss_cred_id_t_desc_struct *v6;
  gss_cred_id_t_desc_struct *v7;
  __CFArray *Mutable;
  gss_buffer_set_t v9;
  uint64_t v10;
  unsigned int v11;
  CFDataRef v12;
  CFDataRef v13;
  _QWORD v15[7];
  gss_buffer_set_t data_set;
  OM_uint32 minor_status;
  CFErrorRef v18;

  v18 = 0;
  minor_status = 0;
  v6 = itemToGSSCred(a1, 0, &v18);
  if (!v6)
    goto LABEL_11;
  v7 = v6;
  data_set = 0;
  Mutable = 0;
  if (gss_inquire_cred_by_oid(&minor_status, v6, &__gss_c_cred_diag_oid_desc, &data_set))
    goto LABEL_12;
  if (!data_set->count)
  {
LABEL_11:
    Mutable = 0;
    goto LABEL_12;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v9 = data_set;
    if (data_set->count)
    {
      v10 = 0;
      v11 = 1;
      do
      {
        v12 = CFDataCreate(0, (const UInt8 *)v9->elements[v10].value, v9->elements[v10].length);
        if (v12)
        {
          v13 = v12;
          CFArrayAppendValue(Mutable, v12);
          CFRelease(v13);
        }
        v10 = v11;
        v9 = data_set;
      }
      while (data_set->count > v11++);
    }
    gss_release_buffer_set(&minor_status, &data_set);
    CFRelease(v7);
  }
LABEL_12:
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 0x40000000;
  v15[2] = __itemCredentialDiagnostics_block_invoke;
  v15[3] = &unk_24C20E0D8;
  v15[4] = a4;
  v15[5] = Mutable;
  v15[6] = v18;
  dispatch_async(a3, v15);
}

void itemChangePassword(uint64_t a1, CFDictionaryRef theDict, NSObject *a3, uint64_t a4)
{
  const void *Value;
  const void *v9;
  CFErrorRef v10;
  BOOL v11;
  const void *v12;
  gss_OID_desc *v13;
  const gss_OID_desc *v14;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v16;
  gss_name_t v17;
  gss_name_t_desc_struct *v18;
  _QWORD block[6];
  CFErrorRef error;

  error = 0;
  Value = CFDictionaryGetValue(theDict, CFSTR("kGSSOperationChangePasswordOldPassword"));
  v9 = CFDictionaryGetValue(theDict, CFSTR("kGSSOperationChangePasswordNewPassword"));
  v10 = 0;
  if (Value)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = v9;
    v13 = itemToMechOID(a1);
    if (v13
      && (v14 = v13, (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0)
      && (v16 = Mutable, (v17 = itemCopyGSSName(a1)) != 0))
    {
      v18 = v17;
      CFDictionaryAddValue(v16, CFSTR("kGSSChangePasswordOldPassword"), Value);
      CFDictionaryAddValue(v16, CFSTR("kGSSChangePasswordNewPassword"), v12);
      gss_aapl_change_password(v18, v14, v16, &error);
      CFRelease(v18);
      v10 = error;
    }
    else
    {
      v10 = 0;
    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __itemChangePassword_block_invoke;
  block[3] = &unk_24C20E100;
  block[4] = a4;
  block[5] = v10;
  dispatch_async(a3, block);
}

void itemSetDefault(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  gss_cred_id_t_desc_struct *v6;
  gss_cred_id_t_desc_struct *v7;
  OM_uint32 v8;
  _QWORD block[6];
  OM_uint32 v10;
  OM_uint32 minor_status;
  gss_buffer_set_t data_set;
  CFErrorRef cferror;

  cferror = 0;
  v6 = itemToGSSCred(a1, 0, &cferror);
  if (v6)
  {
    v7 = v6;
    data_set = 0;
    minor_status = 0;
    v10 = 0;
    v8 = gss_inquire_cred_by_oid(&minor_status, v6, &__gss_c_cred_set_default_oid_desc, &data_set);
    gss_release_buffer_set(&v10, &data_set);
    CFRelease(v7);
    if (v8)
      cferror = _gss_mg_create_cferror(v8, minor_status, 0);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __itemSetDefault_block_invoke;
  block[3] = &unk_24C20E128;
  block[4] = a4;
  block[5] = cferror;
  dispatch_async(a3, block);
}

void itemRenewCredential(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  gss_cred_id_t_desc_struct *v6;
  gss_cred_id_t_desc_struct *v7;
  OM_uint32 v8;
  _QWORD block[6];
  gss_buffer_set_t data_set;
  OM_uint32 minor_status;
  CFErrorRef cferror;

  cferror = 0;
  minor_status = 0;
  v6 = itemToGSSCred(a1, 0, &cferror);
  if (v6)
  {
    v7 = v6;
    data_set = 0;
    v8 = gss_inquire_cred_by_oid(&minor_status, v6, &__gss_c_cred_renew_oid_desc, &data_set);
    gss_release_buffer_set(&minor_status, &data_set);
    CFRelease(v7);
    if (v8)
      cferror = _gss_mg_create_cferror(v8, minor_status, 0);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __itemRenewCredential_block_invoke;
  block[3] = &unk_24C20E150;
  block[4] = a4;
  block[5] = cferror;
  dispatch_async(a3, block);
}

void itemRemoveBackingCredential(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  const void *Value;
  const void *v7;
  CFTypeID v8;
  __CFDictionary *Mutable;
  __CFDictionary *v10;
  _QWORD v11[6];

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrUUID"));
  if (Value)
  {
    v7 = Value;
    v8 = CFGetTypeID(Value);
    if (v8 == CFStringGetTypeID())
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        v10 = Mutable;
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
        CFDictionaryAddValue(v10, (const void *)*MEMORY[0x24BDE9188], (const void *)kGSSSecPasswordType);
        CFDictionaryAddValue(v10, (const void *)*MEMORY[0x24BDE8FA8], v7);
        CFDictionaryAddValue(v10, (const void *)*MEMORY[0x24BDE9128], CFSTR("GSS"));
        SecItemDelete(v10);
        CFRelease(v10);
      }
    }
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = __itemRemoveBackingCredential_block_invoke;
  v11[3] = &unk_24C20E178;
  v11[4] = a4;
  v11[5] = 0;
  dispatch_async(a3, v11);
}

uint64_t GSSItemOperation(const void *a1, uint64_t a2, const void *a3, uint64_t a4, void *aBlock)
{
  void *v10;
  _QWORD block[9];

  if (gss_init_once != -1)
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
  v10 = _Block_copy(aBlock);
  CFRetain(a1);
  if (a3)
    CFRetain(a3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __GSSItemOperation_block_invoke;
  block[3] = &unk_24C20E018;
  block[6] = a1;
  block[7] = a3;
  block[8] = a4;
  block[4] = v10;
  block[5] = a2;
  dispatch_async((dispatch_queue_t)bgq, block);
  return 1;
}

const void *GSSItemGetValue(uint64_t a1, const void *a2)
{
  BOOL v4;
  int check;

  check = 0;
  if (CFDictionaryGetValue((CFDictionaryRef)transient_types, a2))
  {
    if (notify_check(notify_token, &check))
      v4 = 1;
    else
      v4 = check == 0;
    if (!v4)
      updateTransientValues(a1);
  }
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
}

uint64_t create_tables()
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v1;
  __CFDictionary *v2;
  const void *v3;
  const void *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  uint64_t result;
  uint64_t v8;
  int valuePtr;

  bgq = (uint64_t)dispatch_queue_create("org.h5l.gss.item", MEMORY[0x24BDAC9C0]);
  if (bgq)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v1 = Mutable;
      v2 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v3 = (const void *)*MEMORY[0x24BDBD270];
      CFDictionarySetValue(v2, CFSTR("kGSSAttrClass"), (const void *)*MEMORY[0x24BDBD270]);
      CFDictionarySetValue(v2, CFSTR("kGSSAttrNameType"), v3);
      CFDictionarySetValue(v2, CFSTR("kGSSAttrName"), v3);
      CFDictionarySetValue(v2, CFSTR("kGSSAttrUUID"), v3);
      v4 = (const void *)*MEMORY[0x24BDBD268];
      CFDictionarySetValue(v2, CFSTR("kGSSAttrCredentialPassword"), (const void *)*MEMORY[0x24BDBD268]);
      CFDictionarySetValue(v2, CFSTR("kGSSAttrCredentialSecIdentity"), v4);
      CFDictionarySetValue(v2, CFSTR("kGSSAttrStatusPersistant"), v4);
      CFDictionarySetValue(v2, CFSTR("kGSSAttrStatusAutoAcquire"), v4);
      CFDictionarySetValue(v2, CFSTR("kGSSAttrStatusTransient"), v4);
      CFDictionarySetValue(v1, CFSTR("kGSSAttrClassKerberos"), v2);
      CFRelease(v2);
      v5 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(v5, CFSTR("kGSSAttrClass"), v3);
      CFDictionarySetValue(v5, CFSTR("kGSSAttrNameType"), v3);
      CFDictionarySetValue(v5, CFSTR("kGSSAttrName"), v3);
      CFDictionarySetValue(v5, CFSTR("kGSSAttrUUID"), v3);
      CFDictionarySetValue(v5, CFSTR("kGSSAttrCredentialPassword"), v4);
      CFDictionarySetValue(v5, CFSTR("kGSSAttrStatusPersistant"), v4);
      CFDictionarySetValue(v5, CFSTR("kGSSAttrStatusAutoAcquire"), v4);
      CFDictionarySetValue(v5, CFSTR("kGSSAttrStatusTransient"), v4);
      CFDictionarySetValue(v1, CFSTR("kGSSAttrClassNTLM"), v5);
      CFRelease(v5);
      valid_set_types = (uint64_t)v1;
      v6 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(v6, CFSTR("kGSSAttrTransientExpire"), v3);
      transient_types = (uint64_t)v6;
      valuePtr = 1196643152;
      kGSSSecPasswordType = (uint64_t)CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      notify_register_check("com.apple.Kerberos.cache.changed", &notify_token);
      result = _CFRuntimeRegisterClass();
      gssitemid = result;
      return result;
    }
  }
  else
  {
    heim_abort();
  }
  v8 = heim_abort();
  return _gssitem_release(v8);
}

void _gssitem_release(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v3 = *(const void **)(a1 + 24);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

const __CFURL *copyConfigurationURL()
{
  const __CFURL *result;
  const __CFURL *v1;
  CFURLRef v2;

  result = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (result)
  {
    v1 = result;
    v2 = CFURLCreateCopyAppendingPathComponent(0, result, CFSTR("Library/Preferences/com.apple.GSS.items.plist"), 0);
    CFRelease(v1);
    return v2;
  }
  return result;
}

CFMutableDictionaryRef initCreateContext(CFMutableDictionaryRef *a1)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef result;
  uint64_t v4;

  if (*a1)
  {
    heim_abort();
    goto LABEL_6;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *a1 = Mutable;
  if (!Mutable)
  {
LABEL_6:
    heim_abort();
    goto LABEL_7;
  }
  result = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  a1[1] = result;
  if (!result)
  {
LABEL_7:
    v4 = heim_abort();
    return (CFMutableDictionaryRef)createItem(v4);
  }
  return result;
}

void createItem(const void *a1, const __CFDictionary *a2, CFMutableDictionaryRef *a3)
{
  uint64_t v5;
  const void *v6;
  gss_cred_id_t_desc_struct *v7;
  const __CFUUID *v8;
  const __CFUUID *v9;

  v5 = GSSCreateItem(a2);
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = itemToGSSCred(v5, 0, 0);
    if (v7)
    {
      v8 = CopyTransientUUID(v7);
      if (v8)
      {
        v9 = v8;
        CFDictionarySetValue(a3[1], v8, (const void *)*MEMORY[0x24BDBD270]);
        CFRelease(v9);
      }
    }
    CFDictionarySetValue(*a3, a1, v6);
    CFRelease(v6);
  }
}

gss_cred_id_t itemToGSSCred(uint64_t a1, OM_uint32 *a2, CFErrorRef *a3)
{
  const __CFUUID *v5;
  gss_cred_id_t_desc_struct *v6;
  gss_cred_id_t_desc_struct *v7;
  gss_OID_desc *v9;
  gss_OID_desc *v10;
  OM_uint32 v11;
  OM_uint32 v12;
  OM_uint32 v14;
  gss_name_t desired_name;
  gss_cred_id_t output_cred_handle;
  OM_uint32 minor_status;
  gss_OID_set oid_set;

  oid_set = 0;
  minor_status = 0;
  output_cred_handle = 0;
  v5 = *(const __CFUUID **)(a1 + 24);
  if (!v5)
  {
    v9 = itemToMechOID(a1);
    if (v9)
    {
      v10 = v9;
      desired_name = itemCopyGSSName(a1);
      if (desired_name)
      {
        v11 = gss_create_empty_oid_set(&minor_status, &oid_set);
        if (v11)
        {
          if (a3)
            *a3 = _gss_mg_create_cferror(v11, minor_status, 0);
        }
        else
        {
          v12 = gss_add_oid_set_member(&minor_status, v10, &oid_set);
          if (!v12)
          {
            v14 = gss_acquire_cred(&minor_status, desired_name, 0xFFFFFFFF, oid_set, 1, &output_cred_handle, 0, a2);
            gss_release_oid_set(&minor_status, &oid_set);
            gss_release_name(&minor_status, &desired_name);
            if (!v14)
            {
              *(_QWORD *)(a1 + 24) = GSSCredentialCopyUUID(output_cred_handle);
              return output_cred_handle;
            }
            if (a3)
            {
              v7 = 0;
              *a3 = _gss_mg_create_cferror(v14, minor_status, v10);
              return v7;
            }
            return 0;
          }
          if (a3)
            *a3 = _gss_mg_create_cferror(v12, minor_status, 0);
          gss_release_oid_set(&minor_status, &oid_set);
        }
        gss_release_name(&minor_status, &desired_name);
      }
    }
    return 0;
  }
  v6 = GSSCreateCredentialFromUUID(v5);
  v7 = v6;
  if (a2 && v6)
    gss_inquire_cred(&minor_status, v6, 0, a2, 0, 0);
  return v7;
}

const __CFUUID *CopyTransientUUID(gss_cred_id_t_desc_struct *a1)
{
  const __CFUUID *result;
  const __CFUUID *v2;
  CFStringRef v3;

  result = GSSCredentialCopyUUID(a1);
  if (result)
  {
    v2 = result;
    v3 = CFUUIDCreateString(0, result);
    CFRelease(v2);
    return (const __CFUUID *)v3;
  }
  return result;
}

gss_OID_desc *itemToMechOID(uint64_t a1)
{
  gss_OID_desc *result;
  gss_OID_desc *v2;

  result = (gss_OID_desc *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrClass"));
  if (result)
  {
    v2 = result;
    if (CFEqual(result, CFSTR("kGSSAttrClassKerberos")))
    {
      return &__gss_krb5_mechanism_oid_desc;
    }
    else if (CFEqual(v2, CFSTR("kGSSAttrClassNTLM")))
    {
      return &__gss_ntlm_mechanism_oid_desc;
    }
    else if (CFEqual(v2, CFSTR("kGSSAttrClassIAKerb")))
    {
      return &__gss_iakerb_mechanism_oid_desc;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

gss_name_t itemCopyGSSName(uint64_t a1)
{
  gss_name_t result;
  gss_name_t v3;
  gss_OID_desc *v4;
  const __CFData *v5;
  CFTypeID v6;
  size_t v7;
  CFIndex Length;
  gss_name_t v9;
  const UInt8 *BytePtr;
  CFIndex v11;
  OM_uint32 minor_status;
  gss_buffer_desc_struct input_name_buffer;
  gss_name_t output_name;

  output_name = 0;
  result = (gss_name_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrNameType"));
  if (result)
  {
    v3 = result;
    if (CFEqual(result, CFSTR("kGSSAttrNameTypeGSSUsername")))
    {
      v4 = &__gss_c_nt_user_name_oid_desc;
    }
    else if (CFEqual(v3, CFSTR("kGSSAttrNameTypeGSSHostBasedService")))
    {
      v4 = &__gss_c_nt_hostbased_service_oid_desc;
    }
    else
    {
      if (!CFEqual(v3, CFSTR("kGSSAttrNameTypeGSSExportedName")))
        return 0;
      v4 = &__gss_c_nt_export_name_oid_desc;
    }
    result = (gss_name_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrName"));
    if (!result)
      return result;
    v5 = result;
    input_name_buffer.length = 0;
    input_name_buffer.value = 0;
    v6 = CFGetTypeID(result);
    if (v6 == CFStringGetTypeID())
    {
      result = (gss_name_t)rk_cfstring2cstring();
      input_name_buffer.value = result;
      if (!result)
        return result;
      v7 = strlen((const char *)result);
LABEL_15:
      minor_status = 0;
      input_name_buffer.length = v7;
      gss_import_name(&minor_status, &input_name_buffer, v4, &output_name);
      return output_name;
    }
    if (v6 == CFDataGetTypeID())
    {
      Length = CFDataGetLength(v5);
      result = (gss_name_t)malloc_type_malloc(Length, 0x4517E9A0uLL);
      input_name_buffer.value = result;
      if (!result)
        return result;
      v9 = result;
      BytePtr = CFDataGetBytePtr(v5);
      v11 = CFDataGetLength(v5);
      memcpy(v9, BytePtr, v11);
      v7 = CFDataGetLength(v5);
      goto LABEL_15;
    }
    return 0;
  }
  return result;
}

void __addTransientKeys_block_invoke(uint64_t a1, uint64_t a2, gss_cred_id_t_desc_struct *a3)
{
  const __CFUUID *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  gss_buffer_desc_struct *v9;
  OM_uint32 v10;
  const void *v11;
  const void *v12;
  CFDataRef v13;
  gss_buffer_desc_struct v14;
  gss_name_t input_name;
  OM_uint32 minor_status;

  v5 = CopyTransientUUID(a3);
  if (v5)
  {
    v6 = v5;
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), v5) || (v7 = GSSCreateItem(0)) == 0)
    {
      CFRelease(v6);
    }
    else
    {
      v8 = v7;
      minor_status = 0;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v7 + 16), CFSTR("kGSSAttrUUID"), v6);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 16), CFSTR("kGSSAttrClass"), CFSTR("kGSSAttrClassKerberos"));
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 16), CFSTR("kGSSAttrNameType"), CFSTR("kGSSAttrNameTypeGSSExportedName"));
      v9 = _gss_cred_copy_name((uint64_t)&minor_status, (uint64_t)a3, 0);
      input_name = (gss_name_t)v9;
      if (v9)
      {
        v14.length = 0;
        v14.value = 0;
        v10 = gss_export_name(&minor_status, (gss_name_t)v9, &v14);
        gss_release_name(&minor_status, &input_name);
        if (v10)
        {
          v11 = v6;
          v6 = (const void *)v8;
        }
        else
        {
          v13 = CFDataCreate(0, (const UInt8 *)v14.value, v14.length);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 16), CFSTR("kGSSAttrName"), v13);
          CFRelease(v13);
          updateTransientValues(v8);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 16), CFSTR("kGSSAttrStatusTransient"), (const void *)*MEMORY[0x24BDBD270]);
          CFDictionarySetValue(**(CFMutableDictionaryRef **)(a1 + 32), v6, (const void *)v8);
          *(_QWORD *)(v8 + 24) = GSSCredentialCopyUUID(a3);
          v11 = (const void *)v8;
        }
        CFRelease(v11);
        v12 = v6;
      }
      else
      {
        CFRelease(v6);
        v12 = (const void *)v8;
      }
      CFRelease(v12);
    }
  }
}

void searchFunction(int a1, const void *a2, CFDictionaryRef *a3)
{
  if (applyClassItems((uint64_t)a2, *a3, (void (__cdecl *)(const void *, const void *, void *))matchAttr, 0))CFArrayAppendValue(a3[1], a2);
}

const __CFDictionary *applyClassItems(uint64_t a1, CFDictionaryRef theDict, void (__cdecl *a3)(const void *, const void *, void *), CFTypeRef *a4)
{
  const void *Value;
  const __CFDictionary *result;
  _QWORD v10[2];
  CFTypeRef cf;
  uint64_t v12;

  if (a4)
    *a4 = 0;
  Value = CFDictionaryGetValue(theDict, CFSTR("kGSSAttrClass"));
  if (Value
    || (result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("kGSSAttrClass")),
        (Value = result) != 0))
  {
    result = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)valid_set_types, Value);
    if (result)
    {
      v10[0] = a1;
      v10[1] = theDict;
      cf = 0;
      v12 = 1;
      CFDictionaryApplyFunction(result, a3, v10);
      if (cf)
      {
        if (a4)
        {
          result = 0;
          *a4 = cf;
        }
        else
        {
          CFRelease(cf);
          return 0;
        }
      }
      else
      {
        return (const __CFDictionary *)((_BYTE)v12 != 0);
      }
    }
  }
  return result;
}

uint64_t matchAttr(uint64_t key, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *Value;
  BOOL v6;

  if (*(_BYTE *)(a3 + 24))
  {
    v4 = (const void *)key;
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), (const void *)key);
    key = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)a3 + 16), v4);
    if (Value)
      v6 = key == 0;
    else
      v6 = 1;
    if (!v6)
    {
      key = CFEqual(Value, (CFTypeRef)key);
      if (!(_DWORD)key)
        *(_BYTE *)(a3 + 24) = 0;
    }
  }
  return key;
}

void modifyAttributes(void *key, const __CFBoolean *a2, CFDictionaryRef *a3)
{
  const void *Value;

  Value = CFDictionaryGetValue(a3[1], key);
  if (CFBooleanGetValue(a2))
  {
    if (Value)
      CFDictionarySetValue(*((CFMutableDictionaryRef *)*a3 + 2), key, Value);
  }
}

uint64_t validateAttributes(uint64_t result, CFBooleanRef BOOLean, uint64_t a3)
{
  const void *v4;

  if (!*(_QWORD *)(a3 + 16))
  {
    v4 = (const void *)result;
    result = CFBooleanGetValue(BOOLean);
    if ((_DWORD)result)
    {
      result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), v4);
      if (!result)
      {
        result = (uint64_t)CFErrorCreate(0, CFSTR("com.apple.GSS"), 22, 0);
        *(_QWORD *)(a3 + 16) = result;
      }
    }
  }
  return result;
}

void storeItem(const void *a1, const void **cf, __CFDictionary *a3)
{
  CFTypeID v6;
  uint64_t v7;

  v6 = CFGetTypeID(cf);
  if (gss_init_once != -1)
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
  if (v6 == gssitemid)
  {
    if (!CFDictionaryGetValue((CFDictionaryRef)cf[2], CFSTR("kGSSAttrStatusTransient")))
      CFDictionarySetValue(a3, a1, cf[2]);
  }
  else
  {
    v7 = heim_abort();
    __itemAcquire_block_invoke(v7);
  }
}

void __itemAcquire_block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(void))(a1[4] + 16))();
  v2 = (const void *)a1[6];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[5];
  if (v3)
    CFRelease(v3);
}

void __itemDestroyTransient_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

void __itemGetGSSCredential_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

void __itemCredentialDiagnostics_block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(void))(a1[4] + 16))();
  v2 = (const void *)a1[5];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[6];
  if (v3)
    CFRelease(v3);
}

void __itemChangePassword_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __itemSetDefault_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __itemRenewCredential_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __itemRemoveBackingCredential_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

OM_uint32 gss_aapl_initial_cred(gss_name_t desired_name, gss_const_OID desired_mech, CFDictionaryRef attributes, gss_cred_id_t *output_cred_handle, CFErrorRef *error)
{
  unint64_t Value;
  unint64_t v11;
  unsigned int v12;
  const void *v14;
  const __CFString *v15;
  const __CFString *v16;
  CFTypeID v17;
  unsigned int v18;
  gss_OID_desc *v19;
  CFTypeID v20;
  void *v21;
  CFTypeID v22;
  CFIndex Length;
  void *v24;
  void *v25;
  const UInt8 *BytePtr;
  CFIndex v27;
  CFTypeID v28;
  CFTypeID v29;
  size_t v30;
  void *v31;
  OM_uint32 v32;

  v30 = 0;
  v31 = 0;
  heim_warn_blocking();
  if (error)
    *error = 0;
  if (!desired_mech)
    return 0x10000;
  if (!desired_name)
    return 0x20000;
  if (!output_cred_handle)
    return 0x1000000;
  *output_cred_handle = 0;
  Value = (unint64_t)CFDictionaryGetValue(attributes, CFSTR("kGSSICPassword"));
  v11 = (unint64_t)CFDictionaryGetValue(attributes, CFSTR("kGSSICCertificate"));
  if (!(Value | v11))
    return 0x1000000;
  v14 = (const void *)v11;
  v15 = (const __CFString *)CFDictionaryGetValue(attributes, CFSTR("kGSSCredentialUsage"));
  if (v15
    && (v16 = v15, v17 = CFGetTypeID(v15), v17 == CFStringGetTypeID())
    && CFStringCompare(v16, CFSTR("kGSS_C_INITIATE"), 0))
  {
    if (CFStringCompare(v16, CFSTR("kGSS_C_ACCEPT"), 0))
    {
      if (CFStringCompare(v16, CFSTR("kGSS_C_BOTH"), 0))
        return 851968;
      v18 = 0;
    }
    else
    {
      v18 = 2;
    }
  }
  else
  {
    v18 = 1;
  }
  if (!gss_oid_equal(desired_mech, &__gss_krb5_mechanism_oid_desc))
  {
    if (Value)
    {
      v20 = CFGetTypeID((CFTypeRef)Value);
      if (v20 == CFStringGetTypeID())
      {
        v21 = (void *)rk_cfstring2cstring();
        if (v21)
        {
          v31 = v21;
          v30 = strlen((const char *)v21);
LABEL_32:
          attributes = (CFDictionaryRef)&v30;
          v19 = &__gss_c_cred_password_oid_desc;
          goto LABEL_20;
        }
        return 851968;
      }
      v22 = CFGetTypeID((CFTypeRef)Value);
      if (v22 == CFDataGetTypeID())
      {
        Length = CFDataGetLength((CFDataRef)Value);
        v24 = malloc_type_malloc(Length, 0xE94C9BE7uLL);
        v31 = v24;
        if (v24)
        {
          v25 = v24;
          v30 = CFDataGetLength((CFDataRef)Value);
          BytePtr = CFDataGetBytePtr((CFDataRef)Value);
          v27 = CFDataGetLength((CFDataRef)Value);
          memcpy(v25, BytePtr, v27);
          goto LABEL_32;
        }
        return 851968;
      }
    }
    if (v14)
    {
      v28 = CFGetTypeID(v14);
      if (v28 == SecIdentityGetTypeID() || (v29 = CFGetTypeID(v14), v29 == SecCertificateGetTypeID()))
      {
        v19 = &__gss_c_cred_secidentity_oid_desc;
        attributes = (CFDictionaryRef)v14;
        goto LABEL_20;
      }
    }
    return 851968;
  }
  v19 = &__gss_c_cred_heimbase_oid_desc;
LABEL_20:
  v32 = 0;
  v12 = __ApplePrivate_gss_acquire_cred_ext(&v32, (uint64_t)desired_name, v19, (uint64_t)attributes, 0xFFFFFFFF, desired_mech, v18, output_cred_handle);
  if (v30)
  {
    bzero(v31, v30);
    free(v31);
  }
  if (error && v12)
    *error = _gss_mg_create_cferror(v12, v32, (gss_OID_desc *)desired_mech);
  return v12;
}

OM_uint32 gss_aapl_change_password(gss_name_t name, gss_const_OID mech, CFDictionaryRef attributes, CFErrorRef *error)
{
  uint64_t *mechanism;
  uint64_t v9;
  unsigned int mn;
  unsigned int v11;
  char *v12;
  char *v13;
  const void *Value;
  const void *v15;
  uint64_t v16;
  size_t v17;
  size_t v18;
  gss_cred_id_t_desc_struct *v20;
  unsigned int v21;
  gss_OID_desc *v22;

  v22 = 0;
  v21 = 0;
  _gss_load_mech();
  mechanism = __gss_get_mechanism(mech);
  if (!mechanism)
  {
    v12 = 0;
    v13 = 0;
    v21 = 0;
    v11 = 0x10000;
    goto LABEL_14;
  }
  v9 = (uint64_t)mechanism;
  if (!mechanism[63])
  {
    v12 = 0;
    v13 = 0;
    v21 = 0;
    v11 = 0x100000;
    goto LABEL_14;
  }
  mn = _gss_find_mn(&v21, (uint64_t)name, mech, &v22);
  if (mn)
  {
    v11 = mn;
    v12 = 0;
    v13 = 0;
    goto LABEL_14;
  }
  Value = CFDictionaryGetValue(attributes, CFSTR("kGSSChangePasswordOldPassword"));
  v15 = CFDictionaryGetValue(attributes, CFSTR("kGSSChangePasswordNewPassword"));
  if (!Value)
  {
    heim_abort();
    goto LABEL_22;
  }
  if (!v15)
  {
LABEL_22:
    v20 = (gss_cred_id_t_desc_struct *)heim_abort();
    return GSSCredentialCopyUUID(v20);
  }
  v12 = (char *)rk_cfstring2cstring();
  v16 = rk_cfstring2cstring();
  v13 = (char *)v16;
  if (!v12 || !v16)
  {
    v21 = 0;
    v11 = 851968;
LABEL_14:
    if (error)
      *error = _gss_mg_create_cferror(v11, v21, (gss_OID_desc *)mech);
    if (!v12)
      goto LABEL_18;
    goto LABEL_17;
  }
  v11 = (*(uint64_t (**)(unsigned int *, void *, char *, uint64_t))(v9 + 504))(&v21, v22[1].elements, v12, v16);
  if (v11)
  {
    _gss_mg_error(v9, v21);
    goto LABEL_14;
  }
LABEL_17:
  v17 = strlen(v12);
  bzero(v12, v17);
  free(v12);
LABEL_18:
  if (v13)
  {
    v18 = strlen(v13);
    bzero(v13, v18);
    free(v13);
  }
  return v11;
}

CFUUIDRef GSSCredentialCopyUUID(gss_cred_id_t credential)
{
  int v1;
  gss_buffer_set_t data_set;
  OM_uint32 minor_status;
  CFUUIDBytes v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  minor_status = 0;
  data_set = 0;
  *(_QWORD *)&v5.byte0 = 0;
  *(_QWORD *)&v5.byte8 = 0;
  if (!gss_inquire_cred_by_oid(&minor_status, credential, &__gss_c_nt_uuid_oid_desc, &data_set)
    && data_set->count == 1
    && data_set->elements->length == 36)
  {
    v1 = krb5_string_to_uuid();
    gss_release_buffer_set(&minor_status, &data_set);
    if (!v1)
      return CFUUIDCreateFromUUIDBytes(0, v5);
  }
  else
  {
    gss_release_buffer_set(&minor_status, &data_set);
  }
  return 0;
}

gss_cred_id_t GSSCreateCredentialFromUUID(CFUUIDRef uuid)
{
  gss_cred_id_t result;
  gss_cred_id_t v2;
  gss_name_t_desc_struct *v3;
  OM_uint32 v4;
  gss_name_t input_name;
  gss_cred_id_t output_cred_handle;
  OM_uint32 minor_status;

  result = (gss_cred_id_t)CFUUIDCreateString(0, uuid);
  if (result)
  {
    v2 = result;
    v3 = GSSCreateName(result, &__gss_c_nt_uuid_oid_desc, 0);
    input_name = v3;
    CFRelease(v2);
    if (v3)
    {
      minor_status = 0;
      output_cred_handle = 0;
      v4 = gss_acquire_cred(&minor_status, v3, 0xFFFFFFFF, 0, 1, &output_cred_handle, 0, 0);
      gss_release_name(&minor_status, &input_name);
      if (v4)
        return 0;
      else
        return output_cred_handle;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

gss_name_t GSSCreateName(CFTypeRef name, gss_const_OID name_type, CFErrorRef *error)
{
  CFTypeID v5;
  void *v6;
  OM_uint32 v7;
  CFTypeID v8;
  gss_name_t v10;
  gss_buffer_desc_struct input_name_buffer;
  OM_uint32 minor_status;

  if (error)
    *error = 0;
  minor_status = 0;
  input_name_buffer.length = 0;
  input_name_buffer.value = 0;
  v10 = 0;
  v5 = CFGetTypeID(name);
  if (v5 == CFStringGetTypeID())
  {
    v6 = (void *)rk_cfstring2cstring();
    input_name_buffer.value = v6;
    if (!v6)
      return (gss_name_t)851968;
    input_name_buffer.length = strlen((const char *)v6);
    v7 = gss_import_name(&minor_status, &input_name_buffer, name_type, &v10);
    free(input_name_buffer.value);
  }
  else
  {
    v8 = CFGetTypeID(name);
    if (v8 != CFDataGetTypeID())
      return 0;
    input_name_buffer.value = (void *)CFDataGetBytePtr((CFDataRef)name);
    LODWORD(input_name_buffer.length) = CFDataGetLength((CFDataRef)name);
    input_name_buffer.length = LODWORD(input_name_buffer.length);
    v7 = gss_import_name(&minor_status, &input_name_buffer, name_type, &v10);
  }
  if (v7)
    return 0;
  else
    return v10;
}

void GSSRuleAddMatch(const __CFDictionary *a1, const __CFString *a2, const void *a3)
{
  __CFDictionary *Mutable;
  const __CFString *v6;
  __CFDictionary *v7;
  const __CFString *v8;
  void *v9;
  const __CFArray *v10;
  const __CFArray *MutableCopy;
  __CFArray *v12;
  CFIndex Count;
  CFIndex v14;
  CFIndex v15;
  const __CFDictionary *ValueAtIndex;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  __CFDictionary *v20;
  void *v21;
  void *key;
  void *value;

  key = 0;
  value = 0;
  v21 = 0;
  if (FoldedHostName(a2, (CFTypeRef *)&value, (__CFString **)&key, (CFTypeRef *)&v21))
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v6 = (const __CFString *)value;
    if (Mutable)
    {
      v7 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("scheme"), value);
      v8 = (const __CFString *)v21;
      CFDictionarySetValue(v7, CFSTR("path"), v21);
      CFDictionarySetValue(v7, CFSTR("value"), a3);
      v9 = key;
      v10 = (const __CFArray *)CFDictionaryGetValue(a1, key);
      if (v10)
        MutableCopy = CFArrayCreateMutableCopy(0, 0, v10);
      else
        MutableCopy = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      v12 = MutableCopy;
      if (MutableCopy)
      {
        v19 = v9;
        v20 = a1;
        Count = CFArrayGetCount(MutableCopy);
        if (Count < 1)
        {
LABEL_14:
          CFArrayAppendValue(v12, v7);
        }
        else
        {
          v14 = Count;
          v15 = 0;
          while (1)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v12, v15);
            v17 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("path"));
            v18 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("scheme"));
            if (CFStringCompare(v18, v6, 1uLL) != kCFCompareLessThan)
            {
              if (CFStringHasPrefix(v8, v17))
                break;
            }
            if (v14 == ++v15)
              goto LABEL_14;
          }
          CFArrayInsertValueAtIndex(v12, v15, v7);
        }
        v9 = v19;
        CFDictionarySetValue(v20, v19, v12);
        CFRelease(v12);
      }
      CFRelease(v6);
      CFRelease(v9);
      CFRelease(v8);
      CFRelease(v7);
    }
    else
    {
      CFRelease(value);
      CFRelease(key);
      CFRelease(v21);
    }
  }
}

uint64_t FoldedHostName(const __CFString *a1, CFTypeRef *a2, __CFString **a3, CFTypeRef *a4)
{
  const __CFURL *v8;
  const __CFURL *v9;
  const __CFString *v10;
  const __CFString *v11;
  CFStringRef v13;
  const __CFString *v14;
  const __CFString *v15;

  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  if (CFStringFind(a1, CFSTR(":"), 0).location == -1)
    goto LABEL_16;
  v8 = CFURLCreateWithString(0, a1, 0);
  if (!v8)
    goto LABEL_16;
  v9 = v8;
  v10 = CFURLCopyHostName(v8);
  if (v10)
  {
    v11 = v10;
    *a3 = CopyFoldString(v10);
    CFRelease(v11);
    if (!*a3)
    {
      CFRelease(v9);
      return 0;
    }
  }
  else
  {
    *a3 = &stru_24C20F848;
  }
  v13 = CFURLCopyScheme(v9);
  if (v13)
    v14 = v13;
  else
    v14 = &stru_24C20F848;
  *a2 = v14;
  v15 = CFURLCopyPath(v9);
  *a4 = v15;
  if (!v15)
    goto LABEL_14;
  if (CFStringCompare(v15, &stru_24C20F848, 0) == kCFCompareEqualTo)
  {
    if (*a4)
      CFRelease(*a4);
LABEL_14:
    *a4 = CFSTR("/");
  }
  CFRelease(v9);
LABEL_16:
  if (!*a3)
  {
    *a3 = CopyFoldString(a1);
    if (*a2)
      CFRelease(*a2);
    *a2 = CFSTR("any");
    *a4 = CFSTR("/");
  }
  return 1;
}

const void *GSSRuleGetMatch(const __CFDictionary *a1, const __CFString *a2)
{
  const void *v2;
  __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  CFStringRef v7;
  const __CFArray *Value;
  CFIndex Count;
  CFIndex v10;
  uint64_t v11;
  const __CFDictionary *ValueAtIndex;
  const __CFString *v13;
  const __CFString *v14;
  char *v15;
  void *v17;
  const __CFString *v19;
  __CFString *v20;
  CFTypeRef cf;

  v19 = 0;
  v20 = 0;
  cf = 0;
  v2 = 0;
  if (FoldedHostName(a2, &cf, &v20, (CFTypeRef *)&v19))
  {
    v3 = v20;
    v4 = rk_cfstring2cstring();
    CFRelease(v3);
    if (v4)
    {
      v5 = (const __CFString *)cf;
      if (*(_BYTE *)v4)
      {
        v6 = v19;
        v17 = (void *)v4;
        do
        {
          v7 = CFStringCreateWithCString(0, (const char *)v4, 0x8000100u);
          Value = (const __CFArray *)CFDictionaryGetValue(a1, v7);
          CFRelease(v7);
          if (Value && (Count = CFArrayGetCount(Value), Count >= 1))
          {
            v10 = Count;
            v11 = 1;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v11 - 1);
              v13 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("scheme"));
              if (CFStringCompare(v5, v13, 1uLL) && CFStringCompare(CFSTR("any"), v13, 1uLL)
                || (v14 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("path")),
                    !CFStringHasPrefix(v6, v14)))
              {
                v2 = 0;
              }
              else
              {
                v2 = CFDictionaryGetValue(ValueAtIndex, CFSTR("value"));
              }
              if (v11 >= v10)
                break;
              ++v11;
            }
            while (!v2);
          }
          else
          {
            v2 = 0;
          }
          v15 = strchr((char *)(v4 + 1), 46);
          if (!v15)
            break;
          v4 = (uint64_t)v15;
        }
        while (!v2);
        CFRelease(v5);
        free(v17);
        goto LABEL_22;
      }
      CFRelease(cf);
      free((void *)v4);
    }
    v2 = 0;
    v6 = v19;
LABEL_22:
    CFRelease(v6);
  }
  return v2;
}

gss_name_t GSSCredentialCopyName(gss_cred_id_t cred)
{
  gss_name_t v2;
  OM_uint32 minor_status;

  minor_status = 0;
  v2 = 0;
  if (gss_inquire_cred(&minor_status, cred, &v2, 0, 0, 0))
    return 0;
  else
    return v2;
}

OM_uint32 GSSCredentialGetLifetime(gss_cred_id_t cred)
{
  OM_uint32 lifetime;
  OM_uint32 minor_status;

  minor_status = 0;
  lifetime = 0;
  if (gss_inquire_cred(&minor_status, cred, 0, &lifetime, 0, 0))
    return 0;
  else
    return lifetime;
}

CFStringRef GSSNameCreateDisplayString(gss_name_t name)
{
  const __CFString *v1;
  gss_buffer_desc_struct output_name_buffer;
  OM_uint32 minor_status;

  minor_status = 0;
  output_name_buffer.length = 0;
  output_name_buffer.value = 0;
  v1 = 0;
  if (!gss_display_name(&minor_status, name, &output_name_buffer, 0))
  {
    v1 = CFStringCreateWithBytes(0, (const UInt8 *)output_name_buffer.value, output_name_buffer.length, 0x8000100u, 0);
    gss_release_buffer(&minor_status, &output_name_buffer);
  }
  return v1;
}

CFErrorRef GSSCreateError(gss_const_OID mech, OM_uint32 major_status, OM_uint32 minor_status)
{
  return _gss_mg_create_cferror(major_status, minor_status, (gss_OID_desc *)mech);
}

uint64_t GSSCredGetLifetime(gss_cred_id_t cred_handle)
{
  OM_uint32 lifetime;
  OM_uint32 minor_status;

  minor_status = 0;
  lifetime = 0;
  if (gss_inquire_cred(&minor_status, cred_handle, 0, &lifetime, 0, 0))
    return 0;
  else
    return lifetime;
}

gss_name_t GSSCredCopyName(gss_cred_id_t cred_handle)
{
  gss_name_t v2;
  OM_uint32 minor_status;

  minor_status = 0;
  v2 = 0;
  if (gss_inquire_cred(&minor_status, cred_handle, &v2, 0, 0, 0))
    return 0;
  else
    return v2;
}

__CFString *CopyFoldString(CFStringRef theString)
{
  __CFString *MutableCopy;

  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (CopyFoldString_once != -1)
    dispatch_once(&CopyFoldString_once, &__block_literal_global);
  CFStringFold(MutableCopy, 1uLL, (CFLocaleRef)CopyFoldString_locale);
  return MutableCopy;
}

uint64_t decode_GSSAPIContextToken()
{
  return _asn1_decode_top();
}

uint64_t encode_GSSAPIContextToken()
{
  return _asn1_encode();
}

uint64_t length_GSSAPIContextToken()
{
  return _asn1_length();
}

uint64_t free_GSSAPIContextToken()
{
  return _asn1_free_top();
}

uint64_t decode_IAKERB_HEADER()
{
  return _asn1_decode_top();
}

uint64_t encode_IAKERB_HEADER()
{
  return _asn1_encode();
}

uint64_t length_IAKERB_HEADER()
{
  return _asn1_length();
}

uint64_t free_IAKERB_HEADER()
{
  return _asn1_free_top();
}

uint64_t decode_Realm()
{
  return _asn1_decode_top();
}

uint64_t encode_Realm()
{
  return _asn1_encode();
}

uint64_t length_Realm()
{
  return _asn1_length();
}

uint64_t free_Realm()
{
  return _asn1_free_top();
}

uint64_t copy_Realm()
{
  return _asn1_copy_top();
}

uint64_t decode_PrincipalName()
{
  return _asn1_decode_top();
}

uint64_t encode_PrincipalName()
{
  return _asn1_encode();
}

uint64_t length_PrincipalName()
{
  return _asn1_length();
}

uint64_t free_PrincipalName()
{
  return _asn1_free_top();
}

uint64_t copy_PrincipalName()
{
  return _asn1_copy_top();
}

uint64_t TicketFlags2int(uint64_t result)
{
  return (unsigned __int16)result;
}

uint64_t KDCOptions2int(int a1)
{
  if (a1 >= 0)
    return a1 & 0x5C01817F;
  else
    return a1 & 0x5C01817F | 0x80000000;
}

uint64_t decode_Checksum()
{
  return _asn1_decode_top();
}

uint64_t encode_Checksum()
{
  return _asn1_encode();
}

uint64_t length_Checksum()
{
  return _asn1_length();
}

uint64_t free_Checksum()
{
  return _asn1_free_top();
}

uint64_t copy_Checksum()
{
  return _asn1_copy_top();
}

uint64_t free_AP_REQ()
{
  return _asn1_free_top();
}

uint64_t free_KRB_ERROR()
{
  return _asn1_free_top();
}

uint64_t decode_KERB_ERROR_DATA()
{
  return _asn1_decode_top();
}

uint64_t free_KERB_ERROR_DATA()
{
  return _asn1_free_top();
}

uint64_t decode_KRB5PrincipalName()
{
  return _asn1_decode_top();
}

uint64_t free_KRB5PrincipalName()
{
  return _asn1_free_top();
}

uint64_t free_MechType()
{
  return _asn1_free_top();
}

uint64_t encode_MechTypeList()
{
  return _asn1_encode();
}

uint64_t length_MechTypeList()
{
  return _asn1_length();
}

uint64_t add_MechTypeList(unsigned int *a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_realloc(*((void **)a1 + 1), 16 * *a1 + 16, 0xCCADDF85uLL);
  if (!v2)
    return 12;
  *((_QWORD *)a1 + 1) = v2;
  result = _asn1_copy_top();
  if (!(_DWORD)result)
    ++*a1;
  return result;
}

uint64_t decode_NegotiationToken()
{
  return _asn1_decode_top();
}

uint64_t encode_NegotiationToken()
{
  return _asn1_encode();
}

uint64_t length_NegotiationToken()
{
  return _asn1_length();
}

uint64_t free_NegotiationToken()
{
  return _asn1_free_top();
}

uint64_t encode_NegotiationTokenWin()
{
  return _asn1_encode();
}

uint64_t length_NegotiationTokenWin()
{
  return _asn1_length();
}

uint64_t free_NegotiationTokenWin()
{
  return _asn1_free_top();
}

uint64_t decode_GSS_KRB5_FINISHED()
{
  return _asn1_decode_top();
}

uint64_t encode_GSS_KRB5_FINISHED()
{
  return _asn1_encode();
}

uint64_t length_GSS_KRB5_FINISHED()
{
  return _asn1_length();
}

uint64_t free_GSS_KRB5_FINISHED()
{
  return _asn1_free_top();
}

uint64_t encode_InitiatorNameAssertion()
{
  return _asn1_encode();
}

uint64_t length_InitiatorNameAssertion()
{
  return _asn1_length();
}

uint64_t free_InitiatorNameAssertion()
{
  return _asn1_free_top();
}

uint64_t _gsskrb5_create_8003_checksum(int *a1, uint64_t a2, uint64_t a3, _QWORD *a4, char a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v15;
  uint64_t v16;
  int checksum;
  size_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD v26[5];
  OM_uint32 minor_status;
  gss_buffer_desc_struct buffer;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  minor_status = 0;
  buffer.length = 0;
  buffer.value = 0;
  v15 = krb5_storage_emem();
  if (v15)
  {
    v16 = v15;
    krb5_storage_set_byteorder();
    checksum = krb5_store_int32();
    if (checksum)
      goto LABEL_3;
    if (a4)
    {
      if (gss_mg_gen_cb(a1, a4, (uint64_t)v29, &buffer))
      {
        checksum = *a1;
        goto LABEL_3;
      }
    }
    else
    {
      v29[0] = 0;
      v29[1] = 0;
    }
    if (krb5_storage_write() == 16)
    {
      checksum = krb5_store_int32();
      if (checksum
        || (a5 & 1) != 0 && (checksum = store_ext(v16, 1, a6)) != 0
        || *a7 && (checksum = store_ext(v16, 2, a7)) != 0)
      {
LABEL_3:
        gss_release_buffer(&minor_status, &buffer);
        krb5_storage_free();
        if (!checksum)
          return 0;
        goto LABEL_6;
      }
      if (!a3 || !a4 || !buffer.length)
      {
LABEL_28:
        *a8 = 32771;
        checksum = krb5_storage_to_data();
        goto LABEL_3;
      }
      memset(&v26[2], 0, 24);
      checksum = krb5_create_checksum();
      if (checksum)
        goto LABEL_3;
      v19 = length_Checksum();
      v26[0] = v19;
      v20 = malloc_type_malloc(v19, 0x1BEF2547uLL);
      v26[1] = v20;
      if (v20)
      {
        v21 = v20;
        v22 = encode_Checksum();
        if (v22)
        {
          checksum = v22;
          free(v21);
          goto LABEL_3;
        }
        if (v19)
        {
          v23 = krb5_abortx();
          return store_ext(v23, v24, v25);
        }
        checksum = store_ext(v16, 0, v26);
        krb5_data_free();
        if (checksum)
          goto LABEL_3;
        goto LABEL_28;
      }
    }
    checksum = 12;
    goto LABEL_3;
  }
  gss_release_buffer(&minor_status, &buffer);
  checksum = 12;
LABEL_6:
  *a1 = checksum;
  return 851968;
}

uint64_t store_ext(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = krb5_store_uint16();
  if (!(_DWORD)result)
  {
    result = krb5_store_uint16();
    if (!(_DWORD)result)
    {
      v5 = krb5_storage_write();
      result = 12;
      if ((v5 & 0x8000000000000000) == 0)
      {
        if (v5 == *a3)
          return 0;
        else
          return 12;
      }
    }
  }
  return result;
}

uint64_t _gsskrb5_verify_8003_checksum(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v7;
  uint64_t result;
  gss_buffer_desc_struct buffer;
  OM_uint32 minor_status;
  __int16 v11;
  __int128 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v12 = 0uLL;
  v11 = 0;
  minor_status = 0;
  buffer.length = 0;
  buffer.value = 0;
  krb5_data_zero();
  if (*(_DWORD *)a5 == 32771 && *(_QWORD *)(a5 + 8) >= 0x18uLL)
  {
    if (!krb5_storage_from_readonly_mem())
    {
      result = 851968;
      v7 = 12;
      goto LABEL_5;
    }
    krb5_storage_set_byteorder();
    v7 = krb5_ret_uint32();
    if (!v7)
      v7 = 12;
    gss_release_buffer(&minor_status, &buffer);
    krb5_data_free();
    krb5_storage_free();
  }
  else
  {
    v7 = 0;
  }
  result = 0x40000;
LABEL_5:
  *a1 = v7;
  return result;
}

uint64_t read_ext(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = krb5_ret_uint16();
  if (!(_DWORD)result)
  {
    result = krb5_ret_uint16();
    if (!(_DWORD)result)
    {
      result = krb5_data_alloc();
      if (!(_DWORD)result)
      {
        v5 = krb5_storage_read();
        if (v5 < 0 || v5 != *a3)
        {
          krb5_data_free();
          return 2314790661;
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t _gsskrb5_register_acceptor_identity(_DWORD *a1, const char *a2)
{
  int v5;
  char *v6;
  krb5_context context;

  context = 0;
  *a1 = 0;
  if (__ApplePrivate__gsskrb5_init(&context))
    return 851968;
  pthread_mutex_lock(&gssapi_keytab_mutex);
  if (_gsskrb5_keytab)
  {
    krb5_kt_close(context, (krb5_keytab)_gsskrb5_keytab);
    _gsskrb5_keytab = 0;
  }
  if (a2)
  {
    if (!validate_keytab(context, a2))
    {
      pthread_mutex_unlock(&gssapi_keytab_mutex);
      return 0;
    }
    v6 = 0;
    if (asprintf(&v6, "FILE:%s", a2) < 0 || !v6)
    {
      pthread_mutex_unlock(&gssapi_keytab_mutex);
      return 851968;
    }
    v5 = validate_keytab(context, v6);
    free(v6);
  }
  else
  {
    v5 = krb5_kt_default(context, (krb5_keytab *)&_gsskrb5_keytab);
  }
  pthread_mutex_unlock(&gssapi_keytab_mutex);
  if (!v5)
    return 0;
  *a1 = v5;
  return 851968;
}

uint64_t validate_keytab(_krb5_context *a1, const char *a2)
{
  uint64_t have_content;

  have_content = krb5_kt_resolve(a1, a2, (krb5_keytab *)&_gsskrb5_keytab);
  if (!(_DWORD)have_content)
  {
    have_content = krb5_kt_have_content();
    if ((_DWORD)have_content)
    {
      krb5_kt_close(a1, (krb5_keytab)_gsskrb5_keytab);
      _gsskrb5_keytab = 0;
    }
  }
  return have_content;
}

uint64_t _gsskrb5i_is_cfx(_krb5_context *a1, uint64_t a2, int a3)
{
  uint64_t result;
  _QWORD *v6;
  _DWORD *v7;
  _DWORD **v8;
  unsigned int v10;
  int v11;
  int v12;

  result = krb5_auth_con_getlocalseqnumber(a1, *(krb5_auth_context *)(a2 + 40), (krb5_int32 *)(a2 + 12));
  *(_DWORD *)(a2 + 16) = 0;
  v6 = *(_QWORD **)(a2 + 40);
  if (a3)
  {
    v7 = (_DWORD *)v6[5];
    if (v7)
      goto LABEL_8;
    v8 = (_DWORD **)(v6 + 6);
  }
  else
  {
    v7 = (_DWORD *)v6[6];
    if (v7)
      goto LABEL_8;
    v8 = (_DWORD **)(v6 + 5);
  }
  v7 = *v8;
  if (!*v8)
  {
    v7 = (_DWORD *)v6[4];
    if (!v7)
      return result;
  }
LABEL_8:
  if (*v7 > 0x18u || ((1 << *v7) & 0x18100AE) == 0)
  {
    *(_DWORD *)(a2 + 76) |= 0x40u;
    v10 = *(_DWORD *)(a2 + 8) & 0xFFFFFDFB;
    *(_DWORD *)(a2 + 8) = v10;
    if (a3)
    {
      v11 = v10 | 1;
      *(_DWORD *)(a2 + 8) = v10 | 1;
      if (!v6[5])
        goto LABEL_22;
      v12 = 5;
    }
    else
    {
      if (!v6[6])
      {
        v11 = v10;
LABEL_22:
        if ((*(_BYTE *)(a2 + 73) & 0x10) != 0)
          *(_DWORD *)(a2 + 8) = v11 | 0x200;
        goto LABEL_12;
      }
      v12 = 4;
    }
    v11 = v10 | v12;
    *(_DWORD *)(a2 + 8) = v10 | v12;
    goto LABEL_22;
  }
LABEL_12:
  if (*(_QWORD *)a2)
    krb5_crypto_destroy();
  return krb5_crypto_init();
}

uint64_t _gsskrb5_error_token(krb5_error_code *a1, const void **a2, krb5_context a3, krb5_error *a4, uint64_t a5, uint64_t a6, size_t *a7)
{
  krb5_error_code v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[0] = 0;
  v13[1] = 0;
  v10 = krb5_mk_error(a3, a4, 0);
  if (v10)
  {
    v11 = 851968;
  }
  else
  {
    v11 = _gsskrb5_encapsulate(a1, (uint64_t)v13, a7, &word_209772BF8, a2);
    krb5_data_free();
    if ((_DWORD)v11)
      return v11;
    v10 = 0;
  }
  *a1 = v10;
  return v11;
}

uint64_t _gsspku2u_accept_sec_context(krb5_error_code *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t *a7, _QWORD *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return accept_sec_context(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (uint64_t)&__gss_pku2u_mechanism_oid_desc, (uint64_t)pku2u_acceptor_start);
}

uint64_t accept_sec_context(krb5_error_code *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t *a7, _QWORD *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  krb5_error_code v21;
  uint64_t ctx;
  char *v24;
  uint64_t (*v25)();
  uint64_t v26;
  uint64_t v28;
  uint64_t *v29;
  pthread_mutex_t *v30;
  int v31;
  krb5_context v32;

  v32 = 0;
  v21 = __ApplePrivate__gsskrb5_init(&v32);
  if (v21)
  {
    *a1 = v21;
    return 851968;
  }
  else
  {
    *a8 = 0;
    a8[1] = 0;
    if (a6)
      *a6 = 0;
    if (a7)
      *a7 = a12;
    v24 = (char *)*a2;
    if (!*a2)
    {
      v28 = a3;
      v29 = a7;
      ctx = _gsskrb5_create_ctx(a1, a2, v32, a5, a12);
      if ((_DWORD)ctx)
        return ctx;
      v24 = (char *)*a2;
      *((_DWORD *)v24 + 2) = *((_DWORD *)*a2 + 2) | 1;
      *((_QWORD *)v24 + 10) = a13;
      a7 = v29;
      a3 = v28;
    }
    v30 = (pthread_mutex_t *)(v24 + 128);
    pthread_mutex_lock((pthread_mutex_t *)v24 + 2);
    v25 = (uint64_t (*)())*((_QWORD *)v24 + 10);
    while (1)
    {
      v26 = ((uint64_t (*)(krb5_error_code *, char *, krb5_context, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t *, _QWORD *, uint64_t, uint64_t, uint64_t))v25)(a1, v24, v32, a3, a4, a5, a6, a7, a8, a9, a10, a11);
      if (*a8 || (_DWORD)v26 != 0)
        break;
      v25 = (uint64_t (*)())*((_QWORD *)v24 + 10);
      if (v25 == step_acceptor_completed)
      {
        pthread_mutex_unlock(v30);
        return 0;
      }
    }
    ctx = v26;
    pthread_mutex_unlock(v30);
    if (ctx >= 0x10000)
    {
      v31 = 0;
      _gsskrb5_delete_sec_context(&v31, a2, 0);
    }
  }
  return ctx;
}

uint64_t pku2u_acceptor_start(_DWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, size_t *a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int inited;
  _QWORD v17[2];
  _QWORD v18[2];

  if (!a2[28])
  {
    v12 = krb5_storage_emem();
    a2[28] = v12;
    if (!v12)
    {
      *a1 = 12;
      return 851968;
    }
  }
  v18[0] = 0;
  v18[1] = 0;
  v17[0] = 0;
  v17[1] = 0;
  v13 = _gsskrb5_decapsulate(a1, a5, v18, (unsigned __int16 *)"\x05\x01", a2[4]);
  if (!(_DWORD)v13)
  {
    krb5_storage_write();
    inited = heim_ipc_init_context();
    if (inited)
    {
      *a1 = inited;
    }
    else
    {
      v14 = _gsskrb5_encapsulate(a1, (uint64_t)v17, a9, &word_209772BFB, (const void **)a2[4]);
      heim_ipc_free_data();
      if ((_DWORD)v14)
        return v14;
      krb5_storage_write();
      *a1 = 0;
    }
    return 851968;
  }
  v14 = v13;
  if ((_DWORD)v13 == 589824)
  {
    v14 = 0;
    a2[10] = (uint64_t)gsskrb5_acceptor_start;
  }
  return v14;
}

uint64_t _gsskrb5_accept_sec_context(krb5_error_code *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t *a7, _QWORD *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return accept_sec_context(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (uint64_t)&__gss_krb5_mechanism_oid_desc, (uint64_t)gsskrb5_acceptor_start);
}

uint64_t gsskrb5_acceptor_start(int *a1, uint64_t a2, _krb5_context *a3, const krb5_principal_data **a4, unint64_t *a5, uint64_t a6, krb5_principal *a7, _QWORD *a8, size_t *a9, unsigned int *a10, int *a11, _QWORD *a12)
{
  krb5_error_code v19;
  unint64_t v20;
  const krb5_principal_data *v21;
  int v22;
  int ap_req_options;
  uint64_t mic_compat;
  size_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *error_message;
  char *v35;
  const void **v36;
  krb5_error_code *v37;
  _krb5_context *v38;
  uint64_t v39;
  krb5_principal_data *v40;
  krb5_checksum **p_checksum;
  size_t *v42;
  uint64_t v43;
  const krb5_principal_data *v44;
  const char *v45;
  const char *v46;
  int v47;
  _DWORD *v48;
  int v49;
  size_t v50;
  int v51;
  int v52;
  size_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  uint64_t v62;
  int v63;
  char *data;
  krb5_auth_context *v65;
  uint64_t v67;
  char *v68;
  krb5_const_pointer v69;
  krb5_data ctype;
  uint64_t v71;
  krb5_cksumtype v72[2];
  krb5_keyblock *v73[2];
  krb5_authenticator v74;

  memset((char *)&v74.client + 4, 0, 20);
  v19 = _gsskrb5_decapsulate(a1, a5, &v74.checksum, &word_209772BFE, *(_QWORD *)(a2 + 32));
  if (v19)
  {
    v20 = a5[1];
    v74.checksum = (krb5_checksum *)*a5;
    *(_QWORD *)&v74.cusec = v20;
  }
  v67 = a6;
  if (!a4)
  {
    v22 = 0;
    v21 = 0;
    *(_QWORD *)&ctype.magic = 0;
    v73[0] = 0;
    goto LABEL_10;
  }
  if (!*a4)
  {
    *(_QWORD *)&ctype.magic = 0;
    v73[0] = 0;
    goto LABEL_9;
  }
  *(_QWORD *)&ctype.magic = 0;
  v73[0] = 0;
  if (!krb5_principal_is_gss_hostbased_service())
  {
LABEL_9:
    v22 = 0;
    v21 = *a4;
    goto LABEL_10;
  }
  v21 = 0;
  v22 = 1;
LABEL_10:
  ap_req_options = krb5_rd_req_in_ctx_alloc();
  if (ap_req_options)
    goto LABEL_12;
  ap_req_options = krb5_rd_req_in_set_keytab();
  if (ap_req_options)
    goto LABEL_12;
  v26 = a9;
  v65 = (krb5_auth_context *)(a2 + 40);
  v27 = krb5_rd_req_ctx();
  krb5_rd_req_in_ctx_free();
  if (v19 && _gss_mg_log_level(5))
  {
    error_message = krb5_get_error_message(a3, v19);
    v68 = 0;
    if (v21)
    {
      krb5_unparse_name(a3, v21, &v68);
      v35 = v68;
    }
    else
    {
      v35 = 0;
    }
    if (!v35)
      v35 = "<not specified>";
    _gss_mg_log(5, "gss-asc: rd_req (server: %s) failed with: %d: %s", v28, v29, v30, v31, v32, v33, (char)v35);
    krb5_free_error_message(a3, error_message);
    if (v68)
      krb5_xfree();
    v26 = a9;
  }
  if ((int)v27 <= -1765328204)
  {
    if ((_DWORD)v27 == -1765328351 || (_DWORD)v27 == -1765328347)
    {
      v36 = *(const void ***)(a2 + 32);
      p_checksum = &v74.checksum;
      v37 = a1;
      v38 = a3;
      v39 = v27;
      v40 = (krb5_principal_data *)v21;
      return send_error_token(v37, v38, (krb5_error *)v39, v40, (uint64_t)p_checksum, v36, v26);
    }
    if ((_DWORD)v27 != -1765328343)
      goto LABEL_44;
LABEL_31:
    v36 = *(const void ***)(a2 + 32);
    v37 = a1;
    v38 = a3;
    v39 = 2529638953;
    v40 = (krb5_principal_data *)v21;
    p_checksum = 0;
    return send_error_token(v37, v38, (krb5_error *)v39, v40, (uint64_t)p_checksum, v36, v26);
  }
  if ((v27 + 1765328203) < 2)
    goto LABEL_31;
  if ((_DWORD)v27)
  {
LABEL_44:
    *a1 = v27;
    return 851968;
  }
  v42 = v26;
  ap_req_options = krb5_rd_req_out_get_ap_req_options();
  if (!ap_req_options)
  {
    ap_req_options = krb5_rd_req_out_get_ticket();
    if (!ap_req_options)
    {
      ap_req_options = krb5_rd_req_out_get_keyblock();
      if (!ap_req_options)
      {
        if ((krb5_rd_req_out_get_flags() & 1) != 0)
          *(_DWORD *)(a2 + 76) |= 0x80u;
        if (!v22)
          goto LABEL_43;
        v43 = *(_QWORD *)(*(_QWORD *)(a2 + 112) + 144);
        v44 = *a4;
        if (*(_DWORD *)(v43 + 8))
        {
          v45 = **(const char ***)(v43 + 16);
          v46 = *(const char **)v44->realm.data;
          if (!strcmp(v45, v46))
          {
LABEL_43:
            ap_req_options = 0;
            goto LABEL_47;
          }
        }
        else
        {
          v46 = *(const char **)v44->realm.data;
          v45 = **(const char ***)(v43 + 16);
        }
        krb5_set_error_message(a3, v19, "Expecting service %s but got %s", v46, v45);
        ap_req_options = -1765328240;
      }
    }
  }
LABEL_47:
  *(_QWORD *)(a2 + 120) = *(_QWORD *)(*(_QWORD *)(a2 + 112) + 104);
  krb5_rd_req_out_ctx_free();
  if (ap_req_options)
  {
LABEL_12:
    *a1 = ap_req_options;
    return 851968;
  }
  v47 = krb5_copy_principal(a3, *(krb5_const_principal *)(*(_QWORD *)(a2 + 112) + 136), (krb5_principal *)(a2 + 56));
  if (v47)
    goto LABEL_50;
  v47 = krb5_copy_principal(a3, *(krb5_const_principal *)(*(_QWORD *)(a2 + 112) + 144), (krb5_principal *)(a2 + 64));
  if (v47)
    goto LABEL_50;
  mic_compat = _gss_DES3_get_mic_compat(a1, a2, a3);
  if ((_DWORD)mic_compat)
    return mic_compat;
  if (a7)
  {
    v47 = krb5_copy_principal(a3, *(krb5_const_principal *)(*(_QWORD *)(a2 + 112) + 136), a7);
    if (v47)
      goto LABEL_50;
  }
  *(_QWORD *)&v74.magic = 0;
  v47 = krb5_auth_con_getauthenticator(a3, *v65, (krb5_authenticator **)&v74);
  if (v47)
    goto LABEL_50;
  v48 = *(_DWORD **)(*(_QWORD *)&v74.magic + 40);
  if (!v48)
  {
    krb5_free_authenticator(a3, &v74);
    *a1 = 0;
    return 0x40000;
  }
  if (*v48 != 32771)
  {
    *(_QWORD *)&ctype.magic = 0;
    v49 = krb5_crypto_init();
    if (v49)
    {
      v51 = v49;
      krb5_free_authenticator(a3, &v74);
LABEL_64:
      mic_compat = 851968;
LABEL_75:
      *a1 = v51;
      return mic_compat;
    }
    v51 = krb5_verify_checksum(a3, ctype.magic, (const krb5_checksum *)0xA, 0, 0, *(krb5_const_pointer *)(*(_QWORD *)&v74.magic + 40), v50);
    krb5_free_authenticator(a3, &v74);
    krb5_crypto_destroy();
    if (!v51)
    {
      *(_DWORD *)(a2 + 72) = BYTE4(v74.client) & 2 | 0xC;
      goto LABEL_83;
    }
LABEL_74:
    mic_compat = 393216;
    goto LABEL_75;
  }
  v73[0] = 0;
  v73[1] = 0;
  *(_QWORD *)v72 = 0;
  if (*((_QWORD *)*v65 + 6))
  {
    v47 = krb5_crypto_init();
    if (v47)
      goto LABEL_50;
  }
  krb5_data_zero();
  mic_compat = _gsskrb5_verify_8003_checksum(a1, (uint64_t)a3, *(uint64_t *)v72, v67, *(_QWORD *)(*(_QWORD *)&v74.magic + 40));
  krb5_free_authenticator(a3, &v74);
  if ((_DWORD)mic_compat)
  {
    krb5_crypto_destroy();
    return mic_compat;
  }
  if (!v73[0])
    goto LABEL_82;
  v68 = 0;
  v69 = 0;
  ctype.data = 0;
  v71 = 0;
  *(_QWORD *)&ctype.magic = 0;
  if (!*(_QWORD *)(a2 + 224))
  {
    krb5_crypto_destroy();
LABEL_73:
    krb5_data_free();
    v51 = 0;
    goto LABEL_74;
  }
  v52 = krb5_storage_to_data();
  if (v52)
  {
    v51 = v52;
    krb5_crypto_destroy();
LABEL_71:
    krb5_data_free();
    goto LABEL_64;
  }
  if (!*((_QWORD *)*v65 + 6))
  {
    krb5_crypto_destroy();
    krb5_data_free();
    goto LABEL_73;
  }
  v51 = decode_GSS_KRB5_FINISHED();
  krb5_data_free();
  if (v51)
  {
    krb5_crypto_destroy();
    goto LABEL_71;
  }
  v51 = krb5_verify_checksum(a3, v72[0], (const krb5_checksum *)0x29, v69, (size_t)v68, &ctype, v53);
  free_GSS_KRB5_FINISHED();
  krb5_data_free();
  if (v51)
  {
    krb5_crypto_destroy();
    goto LABEL_64;
  }
LABEL_82:
  krb5_crypto_destroy();
LABEL_83:
  if (*(_QWORD *)(a2 + 200))
  {
    v47 = krb5_auth_con_init(a3, (krb5_auth_context *)(a2 + 48));
    if (v47)
      goto LABEL_50;
    krb5_auth_con_setkey();
    krb5_auth_con_setremotesubkey();
  }
  if (_gss_mg_log_level(10))
  {
    *(_QWORD *)&ctype.magic = 0;
    v73[0] = 0;
    krb5_unparse_name(a3, *(krb5_const_principal *)(a2 + 64), (char **)&ctype);
    krb5_unparse_name(a3, *(krb5_const_principal *)(a2 + 56), (char **)v73);
    _gss_mg_log(10, "gss-asc: krb5 (server: %s client: %s) using session enctype: %d", v54, v55, v56, v57, v58, v59, ctype.magic);
    if (v73[0])
      krb5_xfree();
    if (*(_QWORD *)&ctype.magic)
      krb5_xfree();
  }
  v60 = *(_DWORD *)(a2 + 72);
  if ((v60 & 2) != 0)
  {
    *(_QWORD *)&ctype.magic = 0;
    ctype.data = 0;
    _gsskrb5i_is_cfx(a3, a2, 1);
    if ((*(_BYTE *)(a2 + 76) & 0x40) != 0
      || (BYTE4(v74.client) & 4) != 0
      || (v73[0] = 0, !krb5_auth_con_getremotesubkey())
      && (v63 = krb5_auth_con_setlocalsubkey(), krb5_free_keyblock(a3, v73[0]), !v63))
    {
      *(_DWORD *)(a2 + 8) |= 4u;
      krb5_auth_con_addflags();
    }
    v47 = krb5_mk_rep(a3, *v65, &ctype);
    if (!v47)
    {
      v60 = *(_DWORD *)(a2 + 72);
      if ((v60 & 0x1000) != 0)
      {
        data = ctype.data;
        *v42 = *(_QWORD *)&ctype.magic;
        v42[1] = (size_t)data;
      }
      else
      {
        mic_compat = _gsskrb5_encapsulate(a1, (uint64_t)&ctype, v42, word_209772C01, *(const void ***)(a2 + 32));
        krb5_data_free();
        if ((_DWORD)mic_compat)
          return mic_compat;
        v60 = *(_DWORD *)(a2 + 72);
      }
      goto LABEL_92;
    }
LABEL_50:
    *a1 = v47;
    return 851968;
  }
LABEL_92:
  v61 = v60 | 0x100;
  *(_DWORD *)(a2 + 72) = v61;
  v62 = *(_QWORD *)(*(_QWORD *)(a2 + 112) + 104);
  *(_QWORD *)(a2 + 120) = v62;
  *(_DWORD *)(a2 + 76) |= 2u;
  if (a8)
    *a8 = *(_QWORD *)(a2 + 32);
  if (a11)
  {
    mic_compat = _gsskrb5_lifetime_left(a1, a3, v62, a11);
    if ((_DWORD)mic_compat)
      return mic_compat;
    v61 = *(_DWORD *)(a2 + 72);
  }
  if ((v61 & 0x1000) != 0)
  {
    if (a10)
      *a10 = v61 & 0xFFFFFFFE;
    *(_QWORD *)(a2 + 80) = acceptor_wait_for_dcestyle;
    return 1;
  }
  else
  {
    mic_compat = gsskrb5_acceptor_ready(a1, a2, a3, a12);
    if (a10)
      *a10 = *(_DWORD *)(a2 + 72);
  }
  return mic_compat;
}

uint64_t _gssiakerb_accept_sec_context(krb5_error_code *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t *a7, _QWORD *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return accept_sec_context(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (uint64_t)&__gss_iakerb_mechanism_oid_desc, (uint64_t)iakerb_acceptor_start);
}

uint64_t iakerb_acceptor_start(int *a1, uint64_t a2, _krb5_context *a3, uint64_t a4, unint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, size_t *a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t header;
  int inited;
  int v17;
  krb5_error *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  if (!*(_QWORD *)(a2 + 224))
  {
    v13 = krb5_storage_emem();
    *(_QWORD *)(a2 + 224) = v13;
    if (!v13)
    {
      v17 = 12;
      goto LABEL_12;
    }
  }
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  v14 = _gsskrb5_iakerb_parse_header(a1, (uint64_t)a3, a2, a5, v21);
  if ((_DWORD)v14)
  {
    header = v14;
    if ((_DWORD)v14 == 589824)
    {
      header = 0;
      *(_QWORD *)(a2 + 80) = gsskrb5_acceptor_start;
    }
    return header;
  }
  krb5_storage_write();
  if (*(_QWORD *)(a2 + 272))
  {
    if (krb5_realm_is_lkdc())
    {
      inited = heim_ipc_init_context();
      if (inited)
      {
        *a1 = inited;
      }
      else
      {
        v19 = (krb5_error *)heim_ipc_call();
        heim_ipc_free_context();
        if (!(_DWORD)v19)
        {
          header = _gsskrb5_iakerb_make_header(a1, a3, a2, *(_QWORD *)(a2 + 272), (uint64_t)v20, a9);
          heim_ipc_free_data();
          if (!(_DWORD)header)
          {
            krb5_storage_write();
            return 1;
          }
          return header;
        }
        _gsskrb5_error_token(a1, *(const void ***)(a2 + 32), a3, v19, 0, 0, a9);
        *a1 = (int)v19;
      }
      return 851968;
    }
    v17 = 22;
LABEL_12:
    *a1 = v17;
    return 851968;
  }
  heim_abort();
  return step_acceptor_completed();
}

uint64_t step_acceptor_completed()
{
  return 327680;
}

uint64_t send_error_token(krb5_error_code *a1, krb5_context a2, krb5_error *a3, krb5_principal_data *a4, uint64_t a5, const void **a6, size_t *a7)
{
  krb5_principal v9;
  krb5_error_code v13;
  int v14;
  __int128 v16;
  krb5_principal v17;

  v9 = a4;
  v17 = 0;
  v16 = xmmword_24C20F078;
  if (!a4 && a5)
  {
    v13 = krb5_decode_ap_req();
    if (v13 || (v13 = _krb5_principalname2krb5_principal(), free_AP_REQ(), v13))
    {
      *a1 = v13;
      return 851968;
    }
    v9 = v17;
  }
  v14 = _gsskrb5_error_token(a1, a6, a2, a3, (uint64_t)&v16, (uint64_t)v9, a7);
  if (v17)
    krb5_free_principal(a2, v17);
  if (v14)
    return 851968;
  *a1 = 0;
  return 1;
}

uint64_t acceptor_wait_for_dcestyle(int *a1, uint64_t a2, krb5_context a3, int a4, uint64_t *a5, int a6, krb5_principal *a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _QWORD *a12)
{
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t result;
  krb5_int32 v20;
  krb5_int32 v21[2];
  krb5_int32 v22[2];
  krb5_data v23;

  v16 = *a5;
  v17 = (char *)a5[1];
  *(_QWORD *)v22 = 0;
  *(_QWORD *)&v23.magic = v16;
  v23.data = v17;
  v18 = krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), v22);
  if (v18
    || (v18 = krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v22[1])) != 0
    || (v18 = krb5_auth_con_setremoteseqnumber()) != 0
    || (*(_QWORD *)v21 = 0,
        v20 = 0,
        krb5_auth_con_removeflags(),
        (v18 = krb5_rd_rep(a3, *(krb5_auth_context *)(a2 + 40), &v23, (krb5_ap_rep_enc_part **)v21)) != 0))
  {
LABEL_5:
    *a1 = v18;
    return 851968;
  }
  krb5_free_ap_rep_enc_part(a3, *(krb5_ap_rep_enc_part **)v21);
  krb5_auth_con_setflags(a3, *(krb5_auth_context *)(a2 + 40), v20);
  v21[0] = 0;
  result = _gsskrb5_lifetime_left(a1, a3, *(_QWORD *)(a2 + 120), v21);
  if (!(_DWORD)result)
  {
    if (!v21[0])
      return 786432;
    if (a11)
      *a11 = v21[0];
    if (a10)
      *a10 = *(_DWORD *)(a2 + 72);
    if (!a7 || (v18 = krb5_copy_principal(a3, *(krb5_const_principal *)(a2 + 56), a7)) == 0)
    {
      v20 = 0;
      v21[0] = 0;
      v18 = krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), v21);
      if (!v18)
      {
        v18 = krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v20);
        if (!v18)
        {
          if (v21[0] != v20)
            return 8;
          v18 = krb5_auth_con_setremoteseqnumber();
          if (!v18)
            return gsskrb5_acceptor_ready(a1, a2, a3, a12);
        }
      }
    }
    goto LABEL_5;
  }
  return result;
}

uint64_t gsskrb5_acceptor_ready(int *a1, uint64_t a2, krb5_context a3, _QWORD *a4)
{
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  _krb5_ccache *v12;
  int v13;
  uint64_t v14;
  krb5_int32 v16;
  krb5_ccache id;

  v16 = 0;
  krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v16);
  _gsskrb5i_is_cfx(a3, a2, 1);
  v8 = _gssapi_msg_order_f(*(_DWORD *)(a2 + 72));
  v9 = _gssapi_msg_order_create(a1, (_QWORD *)(a2 + 24), v8, v16, 0);
  if ((_DWORD)v9)
    return v9;
  v10 = *(_DWORD *)(a2 + 72);
  if ((v10 & 2) == 0 && _gssapi_msg_order_f(v10))
    krb5_auth_con_setlocalseqnumber();
  v11 = *(_DWORD *)(a2 + 72);
  if (!*(_QWORD *)(a2 + 200) || (v11 & 1) == 0)
  {
    *(_DWORD *)(a2 + 72) = v11 & 0xFFFFFFFE;
    goto LABEL_27;
  }
  id = 0;
  *a1 = 0;
  if (!a4)
  {
    if (!krb5_cc_default(a3, &id))
      goto LABEL_12;
LABEL_13:
    v9 = 0;
    *(_DWORD *)(a2 + 72) &= ~1u;
    goto LABEL_14;
  }
  *a4 = 0;
  if (krb5_cc_new_unique(a3, (const char *)*MEMORY[0x24BE4C598], 0, &id))
    goto LABEL_13;
LABEL_12:
  if (krb5_cc_initialize(a3, id, *(krb5_principal *)(a2 + 56)))
    goto LABEL_13;
  v13 = krb5_rd_cred2();
  if (!v13)
  {
    v12 = id;
    if (a4)
    {
      v14 = _gsskrb5_krb5_import_cred(a1, id, 0, 0, a4);
      if (!(_DWORD)v14)
      {
        *(_DWORD *)(*a4 + 8) |= 1u;
        krb5_cc_close(a3, id);
        goto LABEL_27;
      }
      v9 = v14;
      v12 = id;
      if (!id)
        return v9;
LABEL_16:
      krb5_cc_destroy(a3, v12);
      goto LABEL_26;
    }
    if (id)
    {
      v9 = 0;
      goto LABEL_25;
    }
LABEL_27:
    v9 = 0;
    *(_QWORD *)(a2 + 80) = step_acceptor_completed;
    *(_DWORD *)(a2 + 76) |= 2u;
    return v9;
  }
  *(_DWORD *)(a2 + 72) &= ~1u;
  *a1 = v13;
  v9 = 851968;
LABEL_14:
  v12 = id;
  if (!id)
    goto LABEL_26;
  if (a4)
    goto LABEL_16;
LABEL_25:
  krb5_cc_close(a3, v12);
LABEL_26:
  if (!(_DWORD)v9)
    goto LABEL_27;
  return v9;
}

uint64_t __gsskrb5_ccache_lifetime(_DWORD *a1, _krb5_context *a2, _krb5_ccache *a3, uint64_t a4, _QWORD *a5)
{
  int principal;
  uint64_t result;
  krb5_error_code v11;
  _BYTE creds[128];
  __int128 v13;
  krb5_creds mcreds;
  __int128 v15;
  uint64_t v16;

  memset(&mcreds.client, 0, 112);
  v15 = 0u;
  v16 = 0;
  *(_QWORD *)&mcreds.magic = a4;
  if (!krb5_principal_get_realm())
  {
    _gsskrb5_clear_status();
    *a1 = -1765328238;
    return 851968;
  }
  v13 = 0u;
  memset(creds, 0, sizeof(creds));
  principal = krb5_make_principal();
  if (principal)
  {
    *a1 = principal;
    return 851968;
  }
  v11 = krb5_cc_retrieve_cred(a2, a3, 0, &mcreds, (krb5_creds *)creds);
  krb5_free_principal(a2, mcreds.client);
  if (v11)
  {
    result = 0;
    *a1 = 0;
    *a5 = 0;
  }
  else
  {
    *a5 = *(_QWORD *)&creds[56];
    krb5_free_cred_contents(a2, (krb5_creds *)creds);
    return 0;
  }
  return result;
}

uint64_t _gsskrb5_acquire_cred(krb5_error_code *a1, const krb5_principal_data *a2, uint64_t a3, uint64_t a4, unsigned __int16 a5, uint64_t *a6)
{
  unsigned int v7;
  int v8;
  krb5_error_code v12;
  uint64_t v13;
  char *v15;
  uint64_t v16;
  krb5_error_code v17;
  krb5_error_code v18;
  _krb5_context *v19;
  _DWORD *v20;
  _krb5_ccache *v21;
  krb5_error_code default_principal;
  krb5_error_code init_creds_keytab;
  krb5_error_code v24;
  _krb5_ccache *v25;
  uint64_t *v26;
  uint64_t v27;
  krb5_error_code v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  krb5_context v33;
  krb5_ccache id;
  krb5_get_init_creds_opt *opt;
  krb5_principal principal;
  _BYTE creds[128];
  __int128 v38;

  v7 = a5;
  if (a5 < 3u)
  {
    v32 = 0;
    v33 = 0;
    v31 = 0;
    v12 = __ApplePrivate__gsskrb5_init(&v33);
    if (v12)
    {
      *a1 = v12;
      return 851968;
    }
    *a6 = 0;
    v15 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
    v32 = v15;
    if (!v15)
    {
      v8 = 12;
      goto LABEL_3;
    }
    pthread_mutex_init((pthread_mutex_t *)(v15 + 48), 0);
    if (a2)
    {
      if (a2->magic == -1203)
      {
        *(_DWORD *)creds = 0;
        v16 = _acquire_uuid_name(a1, v33, (uint64_t)a2, creds, (uint64_t)v32);
        if (*(_DWORD *)creds)
        {
          *a1 = 0;
          v13 = 0x20000;
LABEL_33:
          v26 = (uint64_t *)&v32;
          goto LABEL_61;
        }
        v13 = v16;
        if ((_DWORD)v16)
          goto LABEL_33;
LABEL_59:
        v29 = v32;
        *((_DWORD *)v32 + 8) = v7;
        *a1 = 0;
        *a6 = (uint64_t)v29;
        v13 = _gsskrb5_inquire_cred(a1);
        if (!(_DWORD)v13)
          return v13;
        v26 = a6;
LABEL_61:
        _gsskrb5_release_cred(&v31, v26);
        return v13;
      }
      v17 = krb5_copy_principal(v33, a2, (krb5_principal *)v32);
      if (v17)
      {
        v18 = v17;
        _gsskrb5_release_cred(&v31, (uint64_t *)&v32);
        *a1 = v18;
        return 851968;
      }
    }
    if (v7 > 1)
      goto LABEL_58;
    v20 = v32;
    v19 = v33;
    opt = 0;
    principal = 0;
    id = 0;
    memset(creds, 0, sizeof(creds));
    v38 = 0u;
    if (!*(_QWORD *)v32)
      goto LABEL_20;
    if (!krb5_cc_cache_match(v33, *(krb5_principal *)v32, &id))
      goto LABEL_43;
    v21 = id;
    if (!id)
    {
LABEL_20:
      default_principal = krb5_cc_default(v19, &id);
      if (default_principal)
        goto LABEL_40;
      v21 = id;
    }
    if (krb5_cc_get_principal(v19, v21, &principal))
    {
      krb5_cc_close(v19, id);
      principal = 0;
    }
    else
    {
      if (*(_QWORD *)v32)
      {
        if (!krb5_principal_compare(v19, *(krb5_const_principal *)v32, principal))
        {
          krb5_free_principal(v19, principal);
          principal = 0;
          krb5_cc_close(v19, id);
          id = 0;
        }
      }
      else
      {
        default_principal = krb5_copy_principal(v19, principal, (krb5_principal *)v32);
        if (default_principal)
          goto LABEL_40;
      }
      if (principal)
        goto LABEL_43;
    }
    if (!*(_QWORD *)v32)
    {
      default_principal = krb5_get_default_principal();
      if (default_principal)
        goto LABEL_40;
    }
    default_principal = get_keytab(v19, (krb5_keytab *)v32, 0);
    if (default_principal)
      goto LABEL_40;
    if (krb5_cc_cache_match(v19, *(krb5_principal *)v32, &id))
    {
      default_principal = krb5_get_init_creds_opt_alloc(v19, &opt);
      if (!default_principal)
      {
        init_creds_keytab = krb5_get_init_creds_keytab(v19, (krb5_creds *)creds, *(krb5_principal *)v32, *((krb5_keytab *)v32 + 2), 0, 0, opt);
        krb5_get_init_creds_opt_free(v19, opt);
        if (init_creds_keytab)
        {
LABEL_41:
          v13 = 851968;
LABEL_50:
          if (*(_QWORD *)creds)
            krb5_free_cred_contents(v19, (krb5_creds *)creds);
          if (principal)
            krb5_free_principal(v19, principal);
          if ((_DWORD)v13 && init_creds_keytab)
          {
            *a1 = init_creds_keytab;
            goto LABEL_64;
          }
          if ((_DWORD)v13)
            goto LABEL_64;
LABEL_58:
          if ((a5 & 0xFFFD) != 0)
            goto LABEL_59;
          v30 = acquire_acceptor_cred(a1, v33, (uint64_t)v32);
          if (!(_DWORD)v30)
            goto LABEL_59;
          v13 = v30;
LABEL_64:
          pthread_mutex_destroy((pthread_mutex_t *)((char *)v32 + 48));
          krb5_free_principal(v33, *(krb5_principal *)v32);
          free(v32);
          return v13;
        }
        default_principal = krb5_cc_new_unique(v19, (const char *)*MEMORY[0x24BE4C598], 0, &id);
        if (!default_principal)
        {
          v24 = krb5_cc_initialize(v19, id, *(krb5_principal *)creds);
          v25 = id;
          if (v24)
          {
            init_creds_keytab = v24;
LABEL_47:
            krb5_cc_destroy(v19, v25);
            goto LABEL_41;
          }
          v28 = krb5_cc_store_cred(v19, id, (krb5_creds *)creds);
          if (v28)
          {
            init_creds_keytab = v28;
            v25 = id;
            goto LABEL_47;
          }
          *((_QWORD *)v32 + 3) = *(_QWORD *)&creds[56];
          v20[2] |= 1u;
LABEL_49:
          v13 = 0;
          init_creds_keytab = 0;
          *((_QWORD *)v20 + 5) = id;
          goto LABEL_50;
        }
      }
LABEL_40:
      init_creds_keytab = default_principal;
      goto LABEL_41;
    }
LABEL_43:
    v27 = __gsskrb5_ccache_lifetime(a1, v19, id, *(_QWORD *)v32, (_QWORD *)v32 + 3);
    if ((_DWORD)v27)
    {
      v13 = v27;
      krb5_cc_close(v19, id);
      init_creds_keytab = 0;
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  v8 = 35224071;
LABEL_3:
  *a1 = v8;
  return 851968;
}

uint64_t _acquire_uuid_name(_DWORD *a1, _krb5_context *a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  int principal;
  krb5_data v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  if (*(_DWORD *)a3 != -1203)
    return 196608;
  if (*(_DWORD *)(a3 + 8) != 1)
    return 0x20000;
  if (strcmp(*(const char **)(a3 + 24), "UUID"))
    return 0x20000;
  v12 = 0;
  v13 = 0;
  if (krb5_string_to_uuid())
    return 0x20000;
  principal = krb5_cc_resolve_by_uuid();
  if (principal || (principal = krb5_cc_get_principal(a2, *(krb5_ccache *)(a5 + 40), (krb5_principal *)a5)) != 0)
  {
    *a1 = principal;
    return 851968;
  }
  else
  {
    *(_QWORD *)&v11.magic = 0;
    v11.data = 0;
    if (krb5_cc_get_config(a2, *(krb5_ccache *)(a5 + 40), 0, "iakerb", &v11))
    {
      return __gsskrb5_ccache_lifetime(a1, a2, *(_krb5_ccache **)(a5 + 40), *(_QWORD *)a5, (_QWORD *)(a5 + 24));
    }
    else
    {
      *a4 = 1;
      *(_QWORD *)(a5 + 24) = 0x7FFFFFFFLL;
      krb5_data_free();
      return 0;
    }
  }
}

uint64_t acquire_acceptor_cred(_DWORD *a1, _krb5_context *a2, uint64_t a3)
{
  uint64_t result;
  int v7;
  _krb5_kt *v8;

  result = get_keytab(a2, (krb5_keytab *)a3, 0);
  if ((_DWORD)result)
  {
    v7 = result;
    v8 = *(_krb5_kt **)(a3 + 16);
    if (v8)
    {
      krb5_kt_close(a2, v8);
      *(_QWORD *)(a3 + 16) = 0;
    }
    *a1 = v7;
    return 851968;
  }
  else
  {
    *(_QWORD *)(a3 + 24) = 0x7FFFFFFFLL;
  }
  return result;
}

uint64_t _gssiakerb_acquire_cred(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t *a6)
{
  int v10;
  uint64_t v11;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int alloc;
  int cert;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  krb5_data v27;
  char *v28;
  krb5_context v29;
  int v30;

  v30 = 0;
  v29 = 0;
  *(_QWORD *)&v27.magic = 0;
  v27.data = 0;
  v26 = 0;
  v10 = __ApplePrivate__gsskrb5_init(&v29);
  if (v10)
  {
    *a1 = v10;
    return 851968;
  }
  *a1 = 0;
  *a6 = 0;
  v11 = 851968;
  if (a2)
  {
    if (a5 <= 1)
    {
      v13 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
      v28 = v13;
      if (v13)
      {
        v14 = (uint64_t)v13;
        pthread_mutex_init((pthread_mutex_t *)(v13 + 48), 0);
        v15 = _acquire_uuid_name(a1, v29, a2, &v26, v14);
        if ((_DWORD)v15)
        {
          v11 = v15;
          _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
          return v11;
        }
        if (!v26)
        {
          _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
          return 0x20000;
        }
        if (!krb5_cc_get_config(v29, *(krb5_ccache *)(v14 + 40), 0, "password", &v27))
        {
          v16 = asprintf((char **)v28 + 16, "%.*s", v27.magic, v27.data);
          bzero(v27.data, *(size_t *)&v27.magic);
          krb5_data_free();
          if (v16 < 1 || !*((_QWORD *)v28 + 16))
          {
            _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
            *a1 = 12;
            return v11;
          }
          goto LABEL_23;
        }
        if (krb5_cc_get_config(v29, *((krb5_ccache *)v28 + 5), 0, "certificate-ref", &v27))
        {
          if (krb5_cc_get_config(v29, *((krb5_ccache *)v28 + 5), 0, "iakerb", &v27))
          {
            _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
LABEL_24:
            *a1 = 0;
            return v11;
          }
          *((_DWORD *)v28 + 2) |= 4u;
          krb5_data_free();
LABEL_23:
          v11 = 0;
          v19 = (uint64_t)v28;
          *((_DWORD *)v28 + 8) = 1;
          *(_QWORD *)(v19 + 24) = 0x7FFFFFFFLL;
          *a6 = v19;
          goto LABEL_24;
        }
        alloc = hx509_certs_init();
        if (alloc || (alloc = hx509_query_alloc()) != 0)
        {
          cert = alloc;
          krb5_data_free();
          hx509_certs_free();
        }
        else
        {
          hx509_query_match_option();
          hx509_query_match_option();
          hx509_query_match_persistent();
          cert = _krb5_pk_find_cert();
          krb5_data_free();
          hx509_certs_free();
          hx509_query_free();
          if (!cert)
            goto LABEL_23;
          _gss_mg_log(1, "gss-krb5: failed to find certificate ref %d", v20, v21, v22, v23, v24, v25, cert);
        }
        _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
        *a1 = cert;
      }
    }
  }
  return v11;
}

uint64_t _gss_iakerb_acquire_cred_ext(int *a1, const krb5_principal_data *a2, const gss_OID_desc *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, _QWORD *a8)
{
  uint64_t result;
  char *v14;
  char *v15;
  pthread_mutex_t *v16;
  krb5_error_code v17;
  int persistent;
  int inited;
  void *v20;
  krb5_ccache *v21;
  void *v22;
  size_t v23;
  const char *v24;
  krb5_data v25;
  uint64_t v26;
  krb5_context context;

  v26 = 0;
  if (a7 > 1)
    return 851968;
  context = 0;
  if (__ApplePrivate__gsskrb5_init(&context))
    return 851968;
  if (gss_oid_equal(a3, &__gss_c_cred_password_oid_desc))
  {
    if (*(_QWORD *)a4 == -1 || !a2)
      return 851968;
LABEL_11:
    v14 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
    if (v14)
    {
      v15 = v14;
      v16 = (pthread_mutex_t *)(v14 + 48);
      pthread_mutex_init((pthread_mutex_t *)(v14 + 48), 0);
      *((_DWORD *)v15 + 8) = 1;
      v17 = krb5_copy_principal(context, a2, (krb5_principal *)v15);
      if (v17)
      {
        persistent = v17;
      }
      else
      {
        if (a4)
        {
          v20 = malloc_type_malloc(*(_QWORD *)a4 + 1, 0x403DB1D6uLL);
          *((_QWORD *)v15 + 16) = v20;
          if (!v20)
          {
            krb5_free_principal(context, *(krb5_principal *)v15);
            pthread_mutex_destroy(v16);
            free(v15);
            result = 851968;
            persistent = 12;
            goto LABEL_33;
          }
          memcpy(v20, *(const void **)(a4 + 8), *(_QWORD *)a4);
          *(_BYTE *)(*((_QWORD *)v15 + 16) + *(_QWORD *)a4) = 0;
        }
        if (v26)
          *((_QWORD *)v15 + 15) = heim_retain();
        *((_QWORD *)v15 + 5) = 0;
        v21 = (krb5_ccache *)(v15 + 40);
        *((_QWORD *)v15 + 2) = 0;
        *((_QWORD *)v15 + 3) = 0x7FFFFFFFLL;
        if (!krb5_cc_cache_match(context, *(krb5_principal *)v15, (krb5_ccache *)v15 + 5)
          || (persistent = krb5_cc_new_unique(context, (const char *)*MEMORY[0x24BE4C590], 0, (krb5_ccache *)v15 + 5)) == 0)
        {
          persistent = krb5_cc_initialize(context, *((krb5_ccache *)v15 + 5), *(krb5_principal *)v15);
          if (!persistent)
          {
            *(_QWORD *)&v25.magic = 0;
            v25.data = 0;
            krb5_data_zero();
            krb5_cc_set_config(context, *((krb5_ccache *)v15 + 5), 0, "iakerb", &v25);
            v24 = (const char *)*((_QWORD *)v15 + 16);
            if (!v24
              || (v25.data = (char *)*((_QWORD *)v15 + 16),
                  *(_QWORD *)&v25.magic = strlen(v24),
                  (persistent = krb5_cc_set_config(context, *v21, 0, "password", &v25)) == 0))
            {
              if (!*((_QWORD *)v15 + 15)
                || (*(_QWORD *)&v25.magic = 0, v25.data = 0, (persistent = hx509_cert_get_persistent()) == 0)
                && (persistent = krb5_cc_set_config(context, *v21, 0, "certificate-ref", &v25),
                    der_free_octet_string(),
                    !persistent))
              {
                persistent = 0;
                result = 0;
                *a8 = v15;
                goto LABEL_33;
              }
            }
          }
        }
        krb5_free_principal(context, *(krb5_principal *)v15);
        v22 = (void *)*((_QWORD *)v15 + 16);
        if (v22)
        {
          v23 = strlen(*((const char **)v15 + 16));
          bzero(v22, v23);
          free(*((void **)v15 + 16));
        }
        if (*((_QWORD *)v15 + 15))
          heim_release();
        if (*v21)
          krb5_cc_destroy(context, *v21);
      }
      pthread_mutex_destroy(v16);
      free(v15);
      goto LABEL_32;
    }
    return 851968;
  }
  if (gss_oid_equal(a3, &__gss_c_cred_certificate_oid_desc))
  {
    v26 = a4;
    goto LABEL_10;
  }
  if (!gss_oid_equal(a3, &__gss_c_cred_secidentity_oid_desc))
  {
    result = 851968;
    persistent = -1765328181;
    goto LABEL_33;
  }
  inited = hx509_cert_init_SecFramework();
  if (!inited)
  {
LABEL_10:
    a4 = 0;
    if (!a2)
      return 851968;
    goto LABEL_11;
  }
  persistent = inited;
LABEL_32:
  result = 851968;
LABEL_33:
  *a1 = persistent;
  return result;
}

uint64_t _gss_krb5_acquire_cred_ext(int *a1, const krb5_principal_data *a2, const gss_OID_desc *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int16 a7, _QWORD *a8)
{
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  const __CFData *v18;
  int tid;
  _BYTE *v20;
  _BYTE *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  int v25;
  CFIndex Length;
  const UInt8 *BytePtr;
  CFIndex v28;
  void *v29;
  char *v30;
  int v31;
  uint64_t v32;
  int inited;
  uint64_t v34;
  char *v35;
  int init_creds_opt_alloc;
  uint64_t prefix_ops;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  size_t v42;
  size_t v44;
  int v45;
  int v46;
  const __CFData *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _krb5_context *v54;
  const char *v55;
  int v56;
  const krb5_principal_data *cred_client;
  const krb5_principal_data *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  char v63;
  uint64_t ops;
  _krb5_ccache *v65;
  int v66;
  const UInt8 *v67;
  __int128 v68;
  pid_t v69;
  void *v70;
  const char *v71;
  const __CFData *theData;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  krb5_ccache cache;
  krb5_ccache id;
  krb5_context v81;
  krb5_get_init_creds_opt *opt;
  uint64_t v83;
  audit_token_t atoken;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  opt = 0;
  v83 = 0;
  v81 = 0;
  cache = 0;
  id = 0;
  v14 = __ApplePrivate__gsskrb5_init(&v81);
  if (v14)
  {
    *a1 = v14;
    return 851968;
  }
  v15 = a7;
  if (a7 >= 2u)
  {
    v16 = 35224071;
LABEL_5:
    *a1 = v16;
    return 851968;
  }
  if (!a2)
    return 851968;
  if (!gss_oid_equal(a3, &__gss_c_cred_heimbase_oid_desc))
  {
    if (!gss_oid_equal(a3, &__gss_c_cred_password_oid_desc))
      goto LABEL_36;
    v21 = malloc_type_malloc(*(_QWORD *)a4 + 1, 0xB8F40D19uLL);
    v20 = v21;
    if (v21)
    {
      memcpy(v21, *(const void **)(a4 + 8), *(_QWORD *)a4);
      v22 = 0;
      v74 = 0;
      v75 = 0;
      v23 = 0;
      v76 = 0;
      v77 = 0;
      v78 = 0;
      v24 = 0;
      v20[*(_QWORD *)a4] = 0;
      goto LABEL_38;
    }
    goto LABEL_19;
  }
  v17 = heim_dict_copy_value();
  if (v17)
  {
    v18 = (const __CFData *)v17;
    tid = heim_get_tid();
    if (tid == heim_string_get_type_id())
    {
      v20 = (_BYTE *)heim_string_copy_utf8();
      if (!v20)
        goto LABEL_19;
      goto LABEL_21;
    }
    v25 = heim_get_tid();
    if (v25 != heim_data_get_type_id())
    {
      v20 = 0;
      goto LABEL_21;
    }
    Length = CFDataGetLength(v18);
    v20 = malloc_type_malloc(Length + 1, 0xE570A1E9uLL);
    if (v20)
    {
      BytePtr = CFDataGetBytePtr(v18);
      v28 = CFDataGetLength(v18);
      memcpy(v20, BytePtr, v28);
      v20[CFDataGetLength(v18)] = 0;
LABEL_21:
      heim_release();
      goto LABEL_22;
    }
LABEL_19:
    v24 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 12;
LABEL_53:
    if (opt)
      krb5_get_init_creds_opt_free(v81, opt);
    if (v83)
      krb5_init_creds_free();
    if (v24)
      free(v24);
    if (v29)
      free(v29);
    if (v20)
    {
      v42 = strlen(v20);
      bzero(v20, v42);
      free(v20);
    }
    if (cache)
      krb5_cc_close(v81, cache);
    if (id)
      krb5_cc_destroy(v81, id);
    if (v30)
    {
      if (*(_QWORD *)v30)
        krb5_free_principal(v81, *(krb5_principal *)v30);
      pthread_mutex_destroy((pthread_mutex_t *)(v30 + 48));
      free(v30);
    }
    *a1 = v31;
    return 851968;
  }
  v20 = 0;
LABEL_22:
  if (heim_dict_copy_value())
  {
    v29 = (void *)heim_string_copy_utf8();
    heim_release();
  }
  else
  {
    v29 = 0;
  }
  if (heim_dict_copy_value())
  {
    v78 = (void *)heim_string_copy_utf8();
    heim_release();
  }
  else
  {
    v78 = 0;
  }
  v76 = heim_dict_copy_value();
  v77 = heim_dict_copy_value();
  v32 = heim_dict_copy_value();
  heim_dict_copy_value();
  if (v32)
  {
    inited = hx509_cert_init_SecFrameworkAuth();
    if (inited)
    {
      v31 = inited;
      v30 = 0;
      v24 = 0;
      goto LABEL_47;
    }
    heim_release();
    heim_release();
  }
  v75 = (char *)v29;
  if (heim_dict_copy_value())
  {
    v24 = (void *)heim_string_copy_utf8();
    heim_release();
  }
  else
  {
    v24 = 0;
  }
  v23 = heim_dict_copy_value();
  v34 = heim_dict_copy_value();
  v22 = v20 == 0;
  if (!v20)
  {
LABEL_36:
    v16 = -1765328181;
    goto LABEL_5;
  }
  v74 = v34;
LABEL_38:
  *a8 = 0;
  v35 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
  v30 = v35;
  if (!v35)
  {
    init_creds_opt_alloc = krb5_enomem();
LABEL_45:
    v31 = init_creds_opt_alloc;
LABEL_46:
    v29 = v75;
LABEL_47:
    v39 = v76;
    v40 = v77;
    v41 = v78;
    if (!v78)
    {
LABEL_49:
      if (v39)
        heim_release();
      if (v40)
        heim_release();
      goto LABEL_53;
    }
LABEL_48:
    free(v41);
    goto LABEL_49;
  }
  v73 = v23;
  pthread_mutex_init((pthread_mutex_t *)(v35 + 48), 0);
  init_creds_opt_alloc = krb5_copy_principal(v81, a2, (krb5_principal *)v30);
  if (init_creds_opt_alloc)
    goto LABEL_45;
  prefix_ops = krb5_cc_get_prefix_ops();
  if (prefix_ops == MEMORY[0x24BE4CBF0] || prefix_ops == MEMORY[0x24BE4CBE0] || prefix_ops == MEMORY[0x24BE4CBE8])
    v38 = "XCTEMP";
  else
    v38 = v75;
  v31 = krb5_cc_new_unique(v81, v38, 0, &id);
  if (v31)
    goto LABEL_46;
  init_creds_opt_alloc = krb5_get_init_creds_opt_alloc(v81, &opt);
  if (init_creds_opt_alloc)
    goto LABEL_45;
  krb5_principal_get_realm();
  krb5_get_init_creds_opt_set_default_flags();
  krb5_get_init_creds_opt_set_forwardable(opt, 1);
  krb5_get_init_creds_opt_set_proxiable(opt, 1);
  krb5_get_init_creds_opt_set_renew_life(opt, 2592000);
  krb5_get_init_creds_opt_set_canonicalize((krb5_get_init_creds_opt *)v81, (int)opt);
  krb5_get_init_creds_opt_set_win2k();
  init_creds_opt_alloc = krb5_init_creds_init();
  if (init_creds_opt_alloc)
    goto LABEL_45;
  if (!v22)
  {
    v31 = krb5_init_creds_set_password();
    v44 = strlen(v20);
    bzero(v20, v44);
    free(v20);
    if (v31)
    {
      v20 = 0;
      goto LABEL_46;
    }
  }
  if (v24)
  {
    v31 = krb5_init_creds_set_kdc_hostname();
    free(v24);
    if (v31)
    {
LABEL_150:
      v20 = 0;
      v24 = 0;
      goto LABEL_46;
    }
  }
  if (v78)
  {
    v45 = krb5_init_creds_set_sitename();
    if (v45)
    {
      v31 = v45;
      v24 = 0;
      v20 = 0;
      v29 = v75;
      v39 = v76;
      v40 = v77;
      v41 = v78;
      goto LABEL_48;
    }
  }
  if (!v77 || (v46 = heim_get_tid(), v46 != heim_dict_get_type_id()))
  {
    theData = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    goto LABEL_95;
  }
  v89 = 0uLL;
  v47 = (const __CFData *)heim_dict_copy_value();
  theData = (const __CFData *)heim_dict_copy_value();
  v48 = heim_dict_copy_value();
  if (v48)
  {
    v49 = (void *)heim_string_copy_utf8();
    if (!v47)
    {
      v50 = NEHelperCacheCopyAppUUIDMapping();
      if (v50)
      {
        v53 = (void *)v50;
        if (MEMORY[0x20BD146CC](v50, v51, v52) == MEMORY[0x24BDACF78] && xpc_array_get_count(v53))
        {
          v89 = *(_OWORD *)xpc_array_get_uuid(v53, 0);
          xpc_release(v53);
          v62 = "NEHelperCacheCopyAppUUIDMapping";
          goto LABEL_107;
        }
        xpc_release(v53);
      }
      v54 = v81;
      v70 = v49;
      v55 = "Failed getting app uuid for signing identity: %s";
LABEL_110:
      v31 = 22;
      krb5_set_error_message(v54, 22, v55, v70);
      goto LABEL_142;
    }
  }
  else
  {
    if (!v47)
    {
      if (!theData)
      {
        v31 = 22;
        krb5_set_error_message(v81, 22, "No useful app source identity");
        v49 = 0;
        goto LABEL_142;
      }
      v63 = 0;
      v49 = 0;
      v71 = "unknown";
      goto LABEL_130;
    }
    v49 = 0;
  }
  v59 = heim_get_tid();
  if (v59 != heim_data_get_type_id() || CFDataGetLength(v47) != 16)
  {
    v54 = v81;
    v55 = "Failed getting app uuid";
    goto LABEL_110;
  }
  v89 = *(_OWORD *)CFDataGetBytePtr(v47);
  v62 = "passed-in";
LABEL_107:
  LOBYTE(v71) = (_BYTE)v62;
  if (!theData)
    goto LABEL_137;
  v63 = 1;
LABEL_130:
  v66 = heim_get_tid();
  if (v66 != heim_data_get_type_id() || CFDataGetLength(theData) != 32)
  {
    krb5_set_error_message(v81, 22, "Failed getting audittoken");
LABEL_136:
    v31 = 22;
    goto LABEL_142;
  }
  v67 = CFDataGetBytePtr(theData);
  v68 = *((_OWORD *)v67 + 1);
  v87 = *(_OWORD *)v67;
  v88 = v68;
  *(_OWORD *)atoken.val = v87;
  *(_OWORD *)&atoken.val[4] = v68;
  v69 = audit_token_to_pid(&atoken);
  if ((v63 & 1) != 0)
    goto LABEL_137;
  v86 = 0;
  v85 = 0u;
  memset(&atoken, 0, sizeof(atoken));
  if (proc_pidinfo(v69, 17, 1uLL, &atoken, 56) != 56)
  {
    krb5_set_error_message(v81, 22, "Failed getting PROC_PIDUNIQIDENTIFIERINFO");
    goto LABEL_136;
  }
  v89 = *(_OWORD *)atoken.val;
  v71 = "audit-token";
LABEL_137:
  _gss_mg_log(1, "gss-krb5: setting source app: %s - %s, %d uuid: %02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", BYTE12(v89), BYTE13(v89), BYTE14(v89), HIBYTE(v89), v60, v61, (char)v71);
  v56 = krb5_init_creds_set_source_process();
  if (v56)
    goto LABEL_96;
LABEL_95:
  v56 = krb5_init_creds_get();
  if (v56)
    goto LABEL_96;
  *((_QWORD *)v30 + 3) = _krb5_init_creds_get_cred_endtime();
  cred_client = (const krb5_principal_data *)_krb5_init_creds_get_cred_client();
  if (cred_client)
  {
    v58 = cred_client;
    if (!krb5_principal_compare(v81, cred_client, *(krb5_const_principal *)v30))
    {
      krb5_free_principal(v81, *(krb5_principal *)v30);
      v56 = krb5_copy_principal(v81, v58, (krb5_principal *)v30);
      if (v56)
        goto LABEL_96;
    }
  }
  if (v75)
  {
    v56 = krb5_cc_resolve(v81, v75, &cache);
    if (v56)
      goto LABEL_96;
  }
  else if (!v74)
  {
    krb5_cc_cache_match(v81, *(krb5_principal *)v30, &cache);
  }
  v56 = krb5_init_creds_store();
  if (v56)
    goto LABEL_96;
  v56 = krb5_init_creds_store_config();
  if (v56)
    goto LABEL_96;
  if (v76)
    krb5_cc_set_acl();
  if (v73)
  {
    v56 = check_credential(v81, v83, *(_QWORD *)v30, id);
    if (v56)
      goto LABEL_96;
  }
  krb5_init_creds_free();
  v83 = 0;
  krb5_get_init_creds_opt_free(v81, opt);
  opt = 0;
  ops = krb5_cc_get_ops();
  v65 = cache;
  if (ops == MEMORY[0x24BE4CBF0] && !cache)
  {
    v56 = krb5_cc_new_unique(v81, "XCACHE", 0, &cache);
    if (!v56)
    {
      v65 = cache;
      goto LABEL_123;
    }
LABEL_96:
    v31 = v56;
LABEL_142:
    if (v47)
      heim_release();
    if (theData)
      heim_release();
    if (v48)
      heim_release();
    if (v49)
      free(v49);
    goto LABEL_150;
  }
LABEL_123:
  if (!v65)
  {
    *((_QWORD *)v30 + 5) = id;
    goto LABEL_153;
  }
  v56 = krb5_cc_move(v81, id, v65);
  if (v56)
    goto LABEL_96;
  *((_QWORD *)v30 + 5) = cache;
  cache = 0;
  id = 0;
LABEL_153:
  *((_DWORD *)v30 + 8) = v15;
  *a1 = 0;
  *a8 = v30;
  if (v75)
    free(v75);
  if (v78)
    free(v78);
  if (v77)
    heim_release();
  if (v47)
    heim_release();
  if (theData)
    heim_release();
  if (v48)
    heim_release();
  if (v49)
    free(v49);
  heim_release();
  return 0;
}

uint64_t check_credential(_krb5_context *a1, uint64_t a2, uint64_t a3, _krb5_ccache *a4)
{
  int type_id;
  uint64_t v8;
  uint64_t *underlaying_mech_name;
  uint64_t v10;
  krb5_principal v11;
  uint64_t credentials;
  uint64_t v13;
  _QWORD v15[2];
  krb5_data v16;
  krb5_principal v17;
  krb5_principal v18;
  krb5_auth_context v19;
  krb5_creds *v20;
  _BYTE v21[144];
  krb5_keyblock v22;
  uint64_t v23;
  uint64_t v24;

  v23 = 0;
  v24 = 0;
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  *(_QWORD *)&v16.magic = 0;
  v16.data = 0;
  memset(v21, 0, sizeof(v21));
  memset(&v22, 0, sizeof(v22));
  krb5_data_zero();
  type_id = heim_dict_get_type_id();
  if (type_id != heim_get_tid() || (v8 = heim_dict_copy_value()) == 0)
  {
LABEL_10:
    credentials = krb5_sname_to_principal(a1, 0, "host", 3, &v17);
    if ((_DWORD)credentials)
    {
LABEL_13:
      v10 = credentials;
      goto LABEL_14;
    }
    v11 = v17;
    v18 = v17;
LABEL_12:
    *(_QWORD *)v21 = a3;
    *(_QWORD *)&v21[8] = v11;
    credentials = krb5_get_credentials(a1, 0, a4, (krb5_creds *)v21, &v20);
    if (!(_DWORD)credentials)
    {
      v10 = krb5_mk_req_extended(a1, &v19, 0, 0, v20, &v16);
      krb5_auth_con_free(a1, v19);
      v19 = 0;
      if ((_DWORD)v10)
        goto LABEL_14;
      v10 = krb5_rd_req_in_ctx_alloc();
      if ((_DWORD)v10)
        return v10;
      credentials = krb5_rd_req_in_set_pac_check();
      if (!(_DWORD)credentials)
      {
        if (krb5_init_creds_get_as_reply_key()
          || (credentials = krb5_rd_req_in_set_as_reply_key(), !(_DWORD)credentials))
        {
          credentials = krb5_rd_req_ctx();
          if (!(_DWORD)credentials)
          {
            v13 = krb5_rd_req_out_copy_pac();
            if (v13)
            {
              v15[0] = 0;
              v15[1] = 0;
              if (!krb5_pac_copy_credential_package())
                krb5_data_free();
            }
            v10 = 0;
            goto LABEL_15;
          }
        }
      }
    }
    goto LABEL_13;
  }
  LODWORD(v15[0]) = 0;
  underlaying_mech_name = _gss_mg_get_underlaying_mech_name(v8, &__gss_krb5_mechanism_oid_desc);
  if (underlaying_mech_name)
  {
    if (_gsskrb5_canon_name(v15, a1, 0, 0, (const krb5_principal_data *)underlaying_mech_name, &v18))
    {
      if (LODWORD(v15[0]))
        v10 = LODWORD(v15[0]);
      else
        v10 = 22;
      goto LABEL_14;
    }
    v11 = v18;
    if (v18)
      goto LABEL_12;
    goto LABEL_10;
  }
  v10 = 22;
LABEL_14:
  v13 = 0;
LABEL_15:
  if (v20)
    krb5_free_creds(a1, v20);
  if (v17)
    krb5_free_principal(a1, v17);
  if (v23)
    krb5_rd_req_in_ctx_free();
  if (v24)
    krb5_rd_req_out_ctx_free();
  if (v13)
    krb5_pac_free();
  krb5_free_keyblock_contents(a1, &v22);
  krb5_auth_con_free(a1, v19);
  return v10;
}

uint64_t _gsspku2u_principal(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int principal;
  uint64_t result;
  int v6;

  *a3 = 0;
  if (!hx509_cert_find_subjectAltName_otherName())
    hx509_free_octet_string_list();
  if (hx509_cert_get_appleid()
    || (principal = krb5_make_principal(), MEMORY[0x20BD13994](0), principal))
  {
    result = krb5_make_principal();
    if ((_DWORD)result)
      return result;
    v6 = 11;
  }
  else
  {
    v6 = 10;
  }
  result = 0;
  *(_DWORD *)*a3 = v6;
  return result;
}

uint64_t _gsspku2u_acquire_cred(_DWORD *a1, const krb5_principal_data *a2, uint64_t a3, uint64_t a4, unsigned __int16 a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  unsigned int v9;
  int v15;
  uint64_t result;
  char *v17;
  _QWORD *v18;
  pthread_mutex_t *v19;
  int alloc;
  int v21;
  _krb5_kt *v22;
  int keytab;
  krb5_context context;

  v9 = a5;
  if (a5 >= 3u)
  {
    *a1 = 35224071;
    return 851968;
  }
  context = 0;
  v15 = __ApplePrivate__gsskrb5_init(&context);
  if (v15)
  {
    *a1 = v15;
    return 851968;
  }
  *a6 = 0;
  if (a8)
    *a8 = -1;
  if (a7)
    *a7 = 0;
  if (a2 && !krb5_principal_is_pku2u())
  {
    *a1 = 0;
    return 0x20000;
  }
  else
  {
    v17 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
    if (!v17)
      return 851968;
    v18 = v17;
    v19 = (pthread_mutex_t *)(v17 + 48);
    pthread_mutex_init((pthread_mutex_t *)(v17 + 48), 0);
    *((_DWORD *)v18 + 8) = v9;
    if (v9 <= 1)
    {
      alloc = hx509_certs_init();
      if (alloc)
        goto LABEL_24;
      alloc = hx509_query_alloc();
      if (alloc)
        goto LABEL_24;
      hx509_query_match_option();
      hx509_query_match_option();
      if (a2)
        hx509_query_match_cmp_func();
      alloc = _krb5_pk_find_cert();
      hx509_query_free();
      if (alloc
        || (!a2
          ? (v21 = _gsspku2u_principal((uint64_t)context, v18[15], v18))
          : (v21 = krb5_copy_principal(context, a2, (krb5_principal *)v18)),
            (alloc = v21) != 0))
      {
LABEL_24:
        *a1 = alloc;
LABEL_25:
        v22 = (_krb5_kt *)v18[2];
        if (v22)
          krb5_kt_close(context, v22);
        pthread_mutex_destroy(v19);
        free(v18);
        return 851968;
      }
    }
    if ((a5 & 0xFFFD) == 0)
    {
      keytab = get_keytab(context, (krb5_keytab *)v18, 1);
      if (keytab)
      {
        *a1 = keytab;
        goto LABEL_25;
      }
    }
    result = 0;
    *a6 = v18;
  }
  return result;
}

uint64_t match_pkinit_san()
{
  return _krb5_pk_match_cert();
}

uint64_t get_keytab(_krb5_context *a1, krb5_keytab *a2, int a3)
{
  uint64_t full_name;
  _krb5_kt *v7;
  const char *v8;
  krb5_keytab_entry entry;
  uint64_t v11;

  pthread_mutex_lock(&gssapi_keytab_mutex);
  if (_gsskrb5_keytab)
  {
    *(_QWORD *)&entry.magic = 0;
    full_name = krb5_kt_get_full_name();
    if (!(_DWORD)full_name)
    {
      full_name = krb5_kt_resolve(a1, *(const char **)&entry.magic, a2 + 2);
      krb5_xfree();
    }
    if ((_DWORD)full_name)
      goto LABEL_7;
  }
  else
  {
    full_name = krb5_kt_default(a1, a2 + 2);
    if ((_DWORD)full_name)
      goto LABEL_7;
  }
  if (*a2)
  {
    v11 = 0;
    memset(&entry, 0, sizeof(entry));
    if (krb5_principal_is_gss_hostbased_service())
    {
      v8 = (const char *)**((_QWORD **)*a2 + 2);
      if (!check_keytab(a1, (uint64_t)a2, v8, a3))
      {
        full_name = 2529639093;
        krb5_set_error_message(a1, -1765328203, "Didn't find service %s in keytab", v8);
        goto LABEL_7;
      }
LABEL_14:
      full_name = 0;
      goto LABEL_15;
    }
    full_name = krb5_kt_get_entry(a1, a2[2], (krb5_const_principal)*a2, 0, 0, &entry);
    if (!(_DWORD)full_name)
    {
      krb5_free_principal(a1, (krb5_principal)*a2);
      full_name = krb5_copy_principal(a1, *(krb5_const_principal *)&entry.magic, (krb5_principal *)a2);
      krb5_kt_free_entry();
      if (!(_DWORD)full_name)
        goto LABEL_14;
    }
  }
  else
  {
    if (check_keytab(a1, (uint64_t)a2, 0, a3))
      goto LABEL_14;
    full_name = 2529639093;
  }
LABEL_7:
  v7 = a2[2];
  if (v7)
  {
    krb5_kt_close(a1, v7);
    a2[2] = 0;
  }
LABEL_15:
  pthread_mutex_unlock(&gssapi_keytab_mutex);
  return full_name;
}

uint64_t check_keytab(_krb5_context *a1, uint64_t a2, const char *a3, int a4)
{
  uint64_t v8;
  int v9;
  BOOL v10;
  int v11;
  int is_lkdc;
  int v13;
  krb5_kt_cursor cursor[3];
  krb5_keytab_entry entry;
  uint64_t v17;

  v17 = 0;
  memset(&entry, 0, sizeof(entry));
  memset(cursor, 0, sizeof(cursor));
  if (krb5_kt_start_seq_get(a1, *(krb5_keytab *)(a2 + 16), cursor))
    return 0;
  while (1)
  {
    while (1)
    {
      if (krb5_kt_next_entry(a1, *(krb5_keytab *)(a2 + 16), &entry, cursor))
      {
        v8 = 0;
        goto LABEL_20;
      }
      if (!a3)
        break;
      if (*(_DWORD *)(*(_QWORD *)&entry.magic + 8))
      {
        v9 = strcmp(**(const char ***)(*(_QWORD *)&entry.magic + 16), a3);
        if (v9)
          v10 = 1;
        else
          v10 = a4 == 0;
        if (!v10)
          goto LABEL_13;
        v11 = v9;
        krb5_kt_free_entry();
        if (!v11)
          goto LABEL_19;
      }
      else
      {
        krb5_kt_free_entry();
      }
    }
    if (!a4)
      break;
LABEL_13:
    is_lkdc = krb5_principal_is_lkdc();
    v13 = krb5_principal_is_pku2u() | is_lkdc;
    krb5_kt_free_entry();
    if (v13)
      goto LABEL_19;
  }
  krb5_kt_free_entry();
LABEL_19:
  v8 = 1;
LABEL_20:
  krb5_kt_end_seq_get(a1, *(krb5_keytab *)(a2 + 16), cursor);
  return v8;
}

uint64_t _gsskrb5_add_cred(krb5_error_code *a1, uint64_t a2, const krb5_principal_data *a3, const gss_OID_desc *a4, int a5, uint64_t a6, uint64_t a7, unint64_t a8, gss_OID_set *a9, _DWORD *a10, _DWORD *a11)
{
  krb5_error_code v17;
  uint64_t v18;
  int v20;
  int v21;
  char *v22;
  char *v23;
  krb5_keytab *v24;
  krb5_ccache *v25;
  krb5_error_code v26;
  krb5_error_code v27;
  uint64_t v28;
  krb5_error_code full_name;
  _krb5_ccache *v30;
  const char *type;
  const char *v32;
  const char *name;
  int v34;
  uint64_t v35;
  krb5_error_code v36;
  _krb5_kt *v37;
  _krb5_ccache *v38;
  char *v39;
  int v40;
  krb5_context context;

  context = 0;
  v40 = 0;
  v17 = __ApplePrivate__gsskrb5_init(&context);
  if (v17)
  {
    *a1 = v17;
    return 851968;
  }
  if (!gss_oid_equal(a4, &__gss_krb5_mechanism_oid_desc))
  {
    *a1 = 0;
    return 0x10000;
  }
  if (!(a2 | a8) || !a2)
  {
    *a1 = 0;
    return 458752;
  }
  if (a8)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
    v20 = *(_DWORD *)(a2 + 32);
    if (v20 != a5)
    {
      if (v20)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
        v21 = 35224071;
LABEL_28:
        *a1 = v21;
        return 851968;
      }
    }
  }
  if (a3 && krb5_principal_compare(context, a3, *(krb5_const_principal *)a2))
  {
    if (a8)
      pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    *a1 = 0;
    return 0x20000;
  }
  if (!a8)
  {
    v23 = 0;
    goto LABEL_24;
  }
  v22 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
  if (!v22)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    v21 = 12;
    goto LABEL_28;
  }
  v23 = v22;
  *((_DWORD *)v22 + 8) = a5;
  *((_QWORD *)v22 + 3) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)v22 = 0;
  *((_QWORD *)v22 + 2) = 0;
  v24 = (krb5_keytab *)(v22 + 16);
  *((_QWORD *)v22 + 5) = 0;
  v25 = (krb5_ccache *)(v22 + 40);
  pthread_mutex_init((pthread_mutex_t *)(v22 + 48), 0);
  v26 = krb5_copy_principal(context, *(krb5_const_principal *)a2, (krb5_principal *)v23);
  if (v26)
  {
    v27 = v26;
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    free(v23);
    *a1 = v27;
    return 851968;
  }
  if (*(_QWORD *)(a2 + 16))
  {
    v39 = 0;
    full_name = krb5_kt_get_full_name();
    if (full_name || (full_name = krb5_kt_resolve(context, v39, v24), krb5_xfree(), full_name))
    {
      *a1 = full_name;
      v18 = 851968;
      goto LABEL_52;
    }
  }
  v30 = *(_krb5_ccache **)(a2 + 40);
  if (v30)
  {
    v39 = 0;
    type = krb5_cc_get_type(context, v30);
    if (!type)
      goto LABEL_48;
    v32 = type;
    if (!strcmp(type, "MEMORY"))
    {
      v35 = krb5_cc_new_unique(context, v32, 0, v25);
      v18 = v35;
      if ((_DWORD)v35)
        goto LABEL_51;
      v35 = krb5_cc_copy_cache();
      v18 = v35;
      if ((_DWORD)v35)
        goto LABEL_51;
      goto LABEL_24;
    }
    name = krb5_cc_get_name(context, *(krb5_ccache *)(a2 + 40));
    if (!name)
    {
LABEL_48:
      v18 = 851968;
      LODWORD(v35) = 12;
      goto LABEL_51;
    }
    v34 = asprintf(&v39, "%s:%s", v32, name);
    v18 = 851968;
    LODWORD(v35) = 12;
    if (v34 < 0 || !v39)
      goto LABEL_51;
    v36 = krb5_cc_resolve(context, v39, v25);
    free(v39);
    if (v36)
    {
      LODWORD(v35) = v36;
      v18 = 851968;
LABEL_51:
      *a1 = v35;
      goto LABEL_52;
    }
  }
LABEL_24:
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
  v28 = _gsskrb5_inquire_cred(a1, a2, 0, &v40, 0, a9);
  if ((_DWORD)v28)
  {
    v18 = v28;
    if (!v23)
    {
LABEL_59:
      if (a8)
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
      return v18;
    }
LABEL_52:
    if (*(_QWORD *)v23)
      krb5_free_principal(context, *(krb5_principal *)v23);
    v37 = (_krb5_kt *)*((_QWORD *)v23 + 2);
    if (v37)
      krb5_kt_close(context, v37);
    v38 = (_krb5_ccache *)*((_QWORD *)v23 + 5);
    if (v38)
      krb5_cc_destroy(context, v38);
    free(v23);
    goto LABEL_59;
  }
  if (a10)
    *a10 = v40;
  if (a11)
    *a11 = v40;
  if (a8)
    *(_QWORD *)a8 = v23;
  v18 = 0;
  *a1 = 0;
  return v18;
}

uint64_t _gsskrb5i_address_to_krb5addr(uint64_t a1, int a2, uint64_t a3)
{
  if (a3 && (a2 == 24 || a2 == 2) && !krb5_h_addr2sockaddr())
    return krb5_sockaddr2address();
  else
    return 851968;
}

uint64_t _gk_wrap_iov(int *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  int v13;
  uint64_t v15;

  v15 = 0;
  v13 = __ApplePrivate__gsskrb5_init((krb5_context *)&v15);
  if (v13)
  {
    *a1 = v13;
    return 851968;
  }
  if ((*(_BYTE *)(a2 + 76) & 0x40) == 0)
    return 851968;
  return _gssapi_wrap_cfx_iov(a1, a2, v15, a3, a5, a6, a7);
}

uint64_t _gk_unwrap_iov(_DWORD *a1, uint64_t a2, int *a3, _DWORD *a4, unsigned __int16 *a5, int a6)
{
  int v12;
  uint64_t v14;

  v14 = 0;
  v12 = __ApplePrivate__gsskrb5_init((krb5_context *)&v14);
  if (v12)
  {
    *a1 = v12;
    return 851968;
  }
  if ((*(_BYTE *)(a2 + 76) & 0x40) == 0)
    return 851968;
  return _gssapi_unwrap_cfx_iov(a1, a2, v14, a3, a4, a5, a6);
}

uint64_t _gk_wrap_iov_length(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  int v14;
  krb5_context v16;

  v16 = 0;
  v14 = __ApplePrivate__gsskrb5_init(&v16);
  if (v14)
  {
    *a1 = v14;
    return 851968;
  }
  if ((*(_BYTE *)(a2 + 76) & 0x40) == 0)
    return 851968;
  return _gssapi_wrap_iov_length_cfx(a1, a2, v16, a3, a4, a5, a6, a7);
}

uint64_t _gssapi_get_mic_arcfour(int *a1, uint64_t a2, _krb5_context *a3, uint64_t a4, uint64_t a5, size_t *a6, _DWORD *a7)
{
  size_t v13;
  _BYTE *v14;
  char *mech_header;
  int v16;
  int v17;
  uint64_t result;
  size_t size;
  uint64_t v20;
  krb5_int32 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  size = 0;
  v20 = 0;
  v32 = 0;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  _gsskrb5_encap_length(22, &v20, &size, &__gss_krb5_mechanism_oid_desc);
  v13 = size;
  *a6 = size;
  v14 = malloc_type_malloc(v13, 0xC46D5FDDuLL);
  a6[1] = (size_t)v14;
  if (v14)
  {
    mech_header = _gssapi_make_mech_header(v14, v20, (const void **)&__gss_krb5_mechanism_oid_desc);
    *(_DWORD *)mech_header = 1114369;
    *((_DWORD *)mech_header + 1) = -1;
    v16 = arcfour_mic_cksum((uint64_t)a3, (uint64_t)a7, 23, (_QWORD *)mech_header + 2, mech_header, *(const void **)(a5 + 8), *(_QWORD *)a5, 0, 0);
    if (v16)
    {
      v17 = v16;
    }
    else
    {
      v17 = arcfour_mic_key((uint64_t)a3, a7);
      if (!v17)
      {
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
        krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v21);
        _gss_mg_encode_be_uint32(v21++, (_DWORD *)mech_header + 2);
        krb5_auth_con_setlocalseqnumber();
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        *((_DWORD *)mech_header + 3) = 16843009 * ((*(_BYTE *)(a2 + 76) & 1) - 1);
        hc_EVP_CIPHER_CTX_init();
        hc_EVP_rc4();
        hc_EVP_CipherInit_ex();
        hc_EVP_Cipher();
        hc_EVP_CIPHER_CTX_cleanup();
        result = 0;
        goto LABEL_7;
      }
    }
    _gsskrb5_release_buffer(a1, (uint64_t)a6);
    result = 851968;
  }
  else
  {
    result = 851968;
    v17 = 12;
  }
LABEL_7:
  *a1 = v17;
  return result;
}

uint64_t arcfour_mic_cksum(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5, const void *a6, size_t a7, const void *a8, size_t a9)
{
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t checksum;

  v13 = malloc_type_malloc(a7 + a9 + 8, 0xE8E82A6CuLL);
  if (!v13)
    return 12;
  v14 = v13;
  *v13 = *a5;
  v15 = v13 + 1;
  memcpy(v13 + 1, a6, a7);
  memcpy((char *)v15 + a7, a8, a9);
  v16 = krb5_crypto_init();
  if ((_DWORD)v16)
  {
    checksum = v16;
    free(v14);
  }
  else
  {
    checksum = krb5_create_checksum();
    free(v14);
    if (!(_DWORD)checksum)
    {
      *a4 = MEMORY[0];
      free_Checksum();
    }
    krb5_crypto_destroy();
  }
  return checksum;
}

uint64_t arcfour_mic_key(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  if (*a2 == 24)
  {
    result = krb5_hmac();
    if ((_DWORD)result)
      return result;
  }
  else
  {
    result = krb5_hmac();
    if ((_DWORD)result)
      return result;
  }
  return krb5_hmac();
}

uint64_t _gssapi_verify_mic_arcfour(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, _DWORD *a6, _DWORD *a7, unsigned __int16 *a8)
{
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  int v17;
  int v18;
  _BYTE *v19;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  if (a6)
    *a6 = 0;
  v20 = 0;
  v13 = *a5;
  v19 = (_BYTE *)a5[1];
  v14 = _gsskrb5_verify_header(&v19, v13, a8, (uint64_t)&__gss_krb5_mechanism_oid_desc);
  if (!(_DWORD)v14)
  {
    v15 = v19;
    if (*(_WORD *)v19 != 17)
      return 393216;
    v19 += 2;
    if (*(_DWORD *)(v15 + 2) != -1)
      return 393216;
    v19 = v15 + 6;
    v17 = arcfour_mic_cksum(a3, (uint64_t)a7, 23, &v34, v15 - 2, *(const void **)(a4 + 8), *(_QWORD *)a4, 0, 0);
    if (v17 || (v17 = arcfour_mic_key(a3, a7)) != 0)
    {
      v14 = 851968;
    }
    else
    {
      v17 = ct_memcmp();
      if (v17)
      {
        v31 = 0;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        hc_EVP_CIPHER_CTX_init();
        hc_EVP_rc4();
        hc_EVP_CipherInit_ex();
        hc_EVP_Cipher();
        hc_EVP_CIPHER_CTX_cleanup();
        v32 = 0;
        v33 = 0;
        _gss_mg_decode_be_uint32((unsigned int *)v35, &v20);
        v18 = ct_memcmp();
        v35[0] = 0;
        if (!v18)
        {
          pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
          v14 = _gssapi_msg_order_check(*(_QWORD *)(a2 + 24), v20);
          pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
          if ((_DWORD)v14)
            return v14;
          v17 = 0;
          goto LABEL_11;
        }
        v17 = 0;
      }
      v14 = 393216;
    }
LABEL_11:
    *a1 = v17;
  }
  return v14;
}

uint64_t _gssapi_wrap_arcfour(_DWORD *a1, uint64_t a2, _krb5_context *a3, int a4, uint64_t a5, uint64_t a6, _DWORD *a7, size_t *a8, uint64_t a9)
{
  size_t v16;
  size_t v17;
  _BYTE *v18;
  char *mech_header;
  char *v20;
  char v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t result;
  krb5_int32 v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  size_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[5];

  v48[2] = *MEMORY[0x24BDAC8D0];
  if (a7)
    *a7 = 0;
  v32 = 0;
  v33 = 0;
  v30 = 0;
  v31 = 0;
  v29 = 0;
  v16 = *(_QWORD *)a6;
  if ((*(_BYTE *)(a2 + 73) & 0x10) != 0)
  {
    v34 = 32;
    _gssapi_encap_length(32, &v34, &v33, &__gss_krb5_mechanism_oid_desc);
    v17 = v33 + v16;
    v33 += v16;
  }
  else
  {
    v34 = v16 + 33;
    _gssapi_encap_length(v16 + 33, &v34, &v33, &__gss_krb5_mechanism_oid_desc);
    v17 = v33;
    ++v16;
  }
  *a8 = v17;
  v18 = malloc_type_malloc(v17, 0x34A28917uLL);
  a8[1] = (size_t)v18;
  if (!v18)
  {
    *a1 = 12;
    return 851968;
  }
  mech_header = _gssapi_make_mech_header(v18, v34, (const void **)&__gss_krb5_mechanism_oid_desc);
  v20 = mech_header;
  *(_DWORD *)mech_header = 1114370;
  if (a4)
    v21 = 16;
  else
    v21 = -1;
  if (a4)
    v22 = 0;
  else
    v22 = -1;
  mech_header[4] = v21;
  mech_header[5] = v22;
  *((_WORD *)mech_header + 3) = -1;
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v29);
  _gss_mg_encode_be_uint32(v29++, (_DWORD *)v20 + 2);
  krb5_auth_con_setlocalseqnumber();
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
  *((_DWORD *)v20 + 3) = 16843009 * ((*(_BYTE *)(a2 + 76) & 1) - 1);
  krb5_generate_random_block();
  memcpy(v20 + 32, *(const void **)(a6 + 8), *(_QWORD *)a6);
  if ((*(_BYTE *)(a2 + 73) & 0x10) == 0)
    v20[*(_QWORD *)a6 + 32] = 1;
  v23 = arcfour_mic_cksum((uint64_t)a3, a9, 22, (_QWORD *)v20 + 2, v20, v20 + 24, 8uLL, v20 + 32, v16);
  if (v23)
  {
    *a1 = v23;
    _gsskrb5_release_buffer(a1, (uint64_t)a8);
    return 851968;
  }
  v24 = 0;
  LODWORD(v30) = *(_DWORD *)a9;
  v31 = 16;
  v32 = v48;
  v25 = *(_QWORD *)(a9 + 16);
  do
  {
    *((_BYTE *)v48 + v24) = *(_BYTE *)(v25 + v24) ^ 0xF0;
    ++v24;
  }
  while (v24 != 16);
  v26 = arcfour_mic_key((uint64_t)a3, &v30);
  v48[0] = 0;
  v48[1] = 0;
  if (v26)
    goto LABEL_24;
  if (a4)
  {
    v45 = 0;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    hc_EVP_CIPHER_CTX_init();
    hc_EVP_rc4();
    hc_EVP_CipherInit_ex();
    hc_EVP_Cipher();
    hc_EVP_CIPHER_CTX_cleanup();
  }
  v46 = 0;
  v47 = 0;
  v26 = arcfour_mic_key((uint64_t)a3, (_DWORD *)a9);
  if (v26)
  {
LABEL_24:
    v27 = v26;
    _gsskrb5_release_buffer(a1, (uint64_t)a8);
    *a1 = v27;
    return 851968;
  }
  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  hc_EVP_CIPHER_CTX_init();
  hc_EVP_rc4();
  hc_EVP_CipherInit_ex();
  hc_EVP_Cipher();
  hc_EVP_CIPHER_CTX_cleanup();
  if (a7)
    *a7 = a4;
  result = 0;
  *a1 = 0;
  return result;
}

uint64_t _gssapi_unwrap_arcfour(int *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int *a6, _DWORD *a7, uint64_t a8)
{
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  size_t v18;
  int v20;
  _BOOL4 v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  _BYTE *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[4];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  v15 = *a4;
  v33 = (_BYTE *)a4[1];
  if ((*(_BYTE *)(a2 + 73) & 0x10) != 0)
  {
    if (v15 < 0x2D)
      return 0x10000;
    v15 = 45;
  }
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v34 = 0;
  v16 = _gssapi_verify_mech_header(&v33, v15, (uint64_t)&__gss_krb5_mechanism_oid_desc);
  if (!(_DWORD)v16)
  {
    v17 = &v33[-a4[1] + 32];
    v18 = *a4 - (_QWORD)v17;
    if (*a4 < (unint64_t)v17)
      return 0x10000;
    if (*(_WORD *)v33 != 258 || *((_WORD *)v33 + 1) != 17)
      return 393216;
    v20 = *((unsigned __int16 *)v33 + 2);
    v21 = v20 != 16;
    if (v20 == 16)
    {
      v22 = 1;
    }
    else
    {
      if (*((__int16 *)v33 + 2) != -1)
        return 393216;
      v22 = 0;
    }
    if (*((__int16 *)v33 + 3) != -1)
      return 393216;
    v23 = arcfour_mic_key(a3, (_DWORD *)a8);
    if (v23)
      goto LABEL_21;
    v48 = 0;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    hc_EVP_CIPHER_CTX_init();
    hc_EVP_rc4();
    hc_EVP_CipherInit_ex();
    hc_EVP_Cipher();
    hc_EVP_CIPHER_CTX_cleanup();
    v51 = 0;
    v52 = 0;
    _gss_mg_decode_be_uint32(&v50, &v34);
    if (!ct_memcmp())
    {
      v24 = 0;
      LODWORD(v35) = *(_DWORD *)a8;
      v36 = 16;
      v37 = v53;
      v25 = *(_QWORD *)(a8 + 16);
      do
      {
        *((_BYTE *)v53 + v24) = *(_BYTE *)(v25 + v24) ^ 0xF0;
        ++v24;
      }
      while (v24 != 16);
      v23 = arcfour_mic_key(a3, &v35);
      v53[0] = 0;
      v53[1] = 0;
      if (v23)
      {
LABEL_21:
        v16 = 851968;
LABEL_24:
        *a1 = v23;
        return v16;
      }
      v26 = malloc_type_malloc(v18, 0x32122FFEuLL);
      *(_QWORD *)(a5 + 8) = v26;
      if (!v26)
      {
        v16 = 851968;
        v23 = 12;
        goto LABEL_24;
      }
      *(_QWORD *)a5 = v18;
      if (v21)
      {
        v49 = *((_QWORD *)v33 + 3);
        memcpy(v26, v33 + 32, v18);
      }
      else
      {
        v48 = 0;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        hc_EVP_CIPHER_CTX_init();
        hc_EVP_rc4();
        hc_EVP_CipherInit_ex();
        hc_EVP_Cipher();
        hc_EVP_Cipher();
        hc_EVP_CIPHER_CTX_cleanup();
      }
      v51 = 0;
      v52 = 0;
      if ((*(_BYTE *)(a2 + 73) & 0x10) != 0)
      {
        v28 = 0;
        v29 = *(_QWORD *)a5;
      }
      else
      {
        v27 = _gssapi_verify_pad((_QWORD *)a5, v18, &v32);
        if ((_DWORD)v27)
        {
          v16 = v27;
          _gsskrb5_release_buffer(a1, a5);
          v23 = 0;
          goto LABEL_24;
        }
        v28 = v32;
        v29 = *(_QWORD *)a5 - v32;
        *(_QWORD *)a5 = v29;
      }
      v30 = arcfour_mic_cksum(a3, a8, 22, &v38, v33, &v49, 8uLL, *(const void **)(a5 + 8), v28 + v29);
      if (v30)
      {
        v31 = v30;
        _gsskrb5_release_buffer(a1, a5);
        v16 = 851968;
        v23 = v31;
        goto LABEL_24;
      }
      if (ct_memcmp())
      {
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
        v16 = _gssapi_msg_order_check(*(_QWORD *)(a2 + 24), v34);
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        if ((_DWORD)v16)
          return v16;
        v23 = 0;
        v16 = 0;
        if (a6)
          *a6 = v22;
        goto LABEL_24;
      }
      _gsskrb5_release_buffer(a1, a5);
    }
    v23 = 0;
    v16 = 393216;
    goto LABEL_24;
  }
  return v16;
}

uint64_t _gssapi_wrap_size_arcfour(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, _DWORD *a7)
{
  int v11;
  int v13;
  uint64_t v14;
  unint64_t v15;

  v11 = krb5_crypto_init();
  if (v11)
  {
    *a1 = v11;
    return 851968;
  }
  else
  {
    if ((*(_BYTE *)(a2 + 73) & 0x10) != 0)
    {
      v14 = 0;
      v15 = 32;
      _gssapi_encap_length(32, &v15, &v14, &__gss_krb5_mechanism_oid_desc);
      if (v15 <= a6)
        v13 = a6 - v15;
      else
        v13 = 0;
    }
    else
    {
      v14 = 0;
      v15 = a6 + 48;
      _gsskrb5_encap_length(v15, &v15, &v14, &__gss_krb5_mechanism_oid_desc);
      if (v14 - (unint64_t)a6 >= a6)
        v13 = 0;
      else
        v13 = (a6 - (v14 - a6)) & 0xFFFFFFF8;
    }
    *a7 = v13;
    krb5_crypto_destroy();
    return 0;
  }
}

uint64_t _gsskrb5_canonicalize_name(_DWORD *a1, const krb5_principal_data *a2, uint64_t a3, _QWORD *a4)
{
  int v7;
  uint64_t result;
  krb5_principal v9;
  krb5_context v10;

  v9 = 0;
  v10 = 0;
  *a4 = 0;
  v7 = __ApplePrivate__gsskrb5_init(&v10);
  if (v7)
  {
    *a1 = v7;
    return 851968;
  }
  else
  {
    result = _gsskrb5_canon_name(a1, v10, 1, 0, a2, &v9);
    if (!(_DWORD)result)
      *a4 = v9;
  }
  return result;
}

uint64_t _gsskrb5cfx_wrap_length_cfx(uint64_t a1, uint64_t a2, int a3, unint64_t a4, unint64_t *a5, _QWORD *a6, _WORD *a7)
{
  uint64_t result;
  unint64_t v13;

  *a5 = 16;
  *a7 = 0;
  result = krb5_crypto_get_checksum_type();
  if (!(_DWORD)result)
  {
    result = krb5_checksumsize();
    if (!(_DWORD)result)
    {
      if (a3)
      {
        if ((*(_BYTE *)(a2 + 9) & 2) != 0)
        {
          result = krb5_crypto_getblocksize();
          if ((_DWORD)result)
            return result;
        }
        else
        {
          result = krb5_crypto_getpadsize();
          if ((_DWORD)result)
            return result;
        }
        a4 += 16;
        v13 = *a5 + krb5_get_wrapped_length();
      }
      else
      {
        v13 = *a6 + a4 + *a5;
      }
      *a5 = v13;
      if (v13 <= a4)
        _gsskrb5cfx_wrap_length_cfx_cold_1();
      return 0;
    }
  }
  return result;
}

uint64_t _gssapi_wrap_size_cfx(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, unsigned int *a7)
{
  uint64_t result;
  unint64_t v8;
  unsigned int v10;
  uint64_t v11;
  unint64_t wrapped_length;
  BOOL v13;

  result = 0;
  *a7 = 0;
  v8 = a6 - 16;
  if (a6 >= 0x10)
  {
    if (a4)
    {
      v10 = a6 - 31;
      v11 = a6 - 15 - 1;
      do
      {
        wrapped_length = krb5_get_wrapped_length();
        --v10;
        v13 = v11-- != 0;
      }
      while (v13 && wrapped_length > v8);
      result = 0;
      if ((unint64_t)(v11 + 1) >= 0x10)
        *a7 = v10;
    }
    else
    {
      result = krb5_crypto_get_checksum_type();
      if (!(_DWORD)result)
      {
        result = krb5_checksumsize();
        if (!(_DWORD)result)
        {
          result = 0;
          *a7 = v8;
        }
      }
    }
  }
  return result;
}

uint64_t _gssapi_wrap_cfx_iov(int *a1, uint64_t a2, uint64_t a3, int a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  unsigned __int16 *buffer;
  uint64_t v14;
  unsigned __int16 *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int v22;
  size_t v23;
  size_t v24;
  size_t v25;
  uint64_t v26;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  int v36;
  _QWORD *v37;
  char *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unsigned __int16 *v43;
  int v44;
  int v45;
  int v46;
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  unsigned int v56;
  char *v57;
  char *v58;
  int checksum_iov;
  char v60;
  _BYTE *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _BYTE *v66;
  uint64_t v67;
  size_t v68;
  int v69;

  buffer = _gss_mg_find_buffer(a6, a7, 2);
  if (!buffer)
    goto LABEL_21;
  v14 = (uint64_t)buffer;
  v15 = _gss_mg_find_buffer(a6, a7, 9);
  v16 = v15;
  if (v15)
    *((_QWORD *)v15 + 1) = 0;
  v17 = (uint64_t)_gss_mg_find_buffer(a6, a7, 7);
  v18 = v17;
  if ((*(_BYTE *)(a2 + 9) & 2) != 0)
  {
    if ((unint64_t)v16 | v17)
      goto LABEL_21;
  }
  else if (!v16)
  {
    goto LABEL_21;
  }
  v69 = 0;
  *a1 = 0;
  if (!a4)
  {
    if ((*(_BYTE *)(a2 + 9) & 2) == 0)
    {
      v22 = krb5_crypto_length();
      *a1 = v22;
      if (v22)
        return 851968;
      v23 = 0;
      v24 = 16;
      if (!v18)
        goto LABEL_33;
      goto LABEL_18;
    }
LABEL_21:
    *a1 = 22;
    return 851968;
  }
  if (a7 >= 1)
  {
    v19 = 0;
    v20 = a7;
    v21 = a6 + 4;
    do
    {
      if (*((_WORD *)v21 - 4) == 1)
        v19 += *v21;
      v21 += 3;
      --v20;
    }
    while (v20);
  }
  v28 = krb5_crypto_length();
  *a1 = v28;
  if (v28)
    return 851968;
  v29 = krb5_crypto_length();
  *a1 = v29;
  if (v29)
    return 851968;
  v30 = krb5_crypto_length();
  *a1 = v30;
  if (v30)
    return 851968;
  if ((*(_BYTE *)(a2 + 9) & 2) != 0)
  {
    v31 = krb5_crypto_getblocksize();
    *a1 = v31;
    if (v31)
      return 851968;
  }
  v24 = 16;
  v23 = 16;
  if (!v18)
  {
LABEL_33:
    v25 = v23;
    v24 = v23 + 16;
    goto LABEL_34;
  }
LABEL_18:
  if ((*(_BYTE *)(v18 + 2) & 1) != 0)
  {
    v26 = _gk_allocate_buffer(a1, v18, v23);
    if ((_DWORD)v26)
      goto LABEL_82;
    v25 = 0;
    v24 = 16;
  }
  else
  {
    if (*(_QWORD *)(v18 + 8) < v23)
    {
LABEL_36:
      v32 = -1765328194;
LABEL_60:
      *a1 = v32;
LABEL_81:
      v26 = 851968;
      goto LABEL_82;
    }
    v25 = 0;
    *(_QWORD *)(v18 + 8) = v23;
  }
LABEL_34:
  if ((*(_BYTE *)(v14 + 2) & 1) != 0)
  {
    v68 = v25;
    v26 = _gk_allocate_buffer(a1, v14, v24);
    if (!(_DWORD)v26)
      goto LABEL_40;
LABEL_82:
    __ApplePrivate_gss_release_iov_buffer(&v69, (uint64_t)a6, a7);
    return v26;
  }
  if (*(_QWORD *)(v14 + 8) < v24)
    goto LABEL_36;
  v68 = v25;
  *(_QWORD *)(v14 + 8) = v24;
LABEL_40:
  v33 = *(_QWORD *)(v14 + 16);
  *(_DWORD *)v33 = -16776187;
  v34 = *(_DWORD *)(a2 + 8) & 5;
  if (v34)
    *(_BYTE *)(v33 + 2) = v34;
  if (a4)
    *(_BYTE *)(v33 + 2) = v34 | 2;
  v67 = v33;
  *(_BYTE *)(v33 + 5) = 0;
  v35 = v33 + 5;
  *(_BYTE *)(v33 + 4) = 0;
  *(_WORD *)(v33 + 6) = 0;
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 16), (_DWORD *)(v33 + 8));
  v66 = (_BYTE *)v35;
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 12), (_DWORD *)(v35 + 7));
  v36 = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = v36 + 1;
  if (v36 == -1)
    ++*(_DWORD *)(a2 + 16);
  v37 = malloc_type_calloc(a7 + 3, 0x18uLL, 0x10800404ACF7207uLL);
  if (!v37)
  {
    v32 = 12;
    goto LABEL_60;
  }
  v38 = (char *)v37;
  if (!a4)
  {
    if (a7 < 1)
    {
      v56 = 0;
    }
    else
    {
      v49 = v37 + 2;
      v50 = (uint64_t *)(a6 + 8);
      v51 = a7;
      do
      {
        v52 = *((unsigned __int16 *)v50 - 8);
        if (v52 == 11)
          v53 = 3;
        else
          v53 = 0;
        if (v52 == 1)
          v54 = 2;
        else
          v54 = v53;
        *((_DWORD *)v49 - 4) = v54;
        *(v49 - 1) = *(v50 - 1);
        v55 = *v50;
        v50 += 3;
        *v49 = v55;
        v49 += 3;
        --v51;
      }
      while (v51);
      v56 = a7;
    }
    v62 = (char *)&v37[3 * v56];
    *(_DWORD *)v62 = 2;
    v63 = *(_QWORD *)(v14 + 16);
    *((_QWORD *)v62 + 1) = 16;
    *((_QWORD *)v62 + 2) = v63;
    LODWORD(v37[3 * v56 + 3]) = 6;
    if (v18)
      v64 = *(_QWORD *)(v18 + 16);
    else
      v64 = v63 + 16;
    v65 = (char *)&v37[3 * v56 + 3];
    *((_QWORD *)v65 + 2) = v64;
    *((_QWORD *)v65 + 1) = 0;
    checksum_iov = krb5_create_checksum_iov();
    if (!checksum_iov)
    {
      if (v68)
        *(_WORD *)(v67 + 6) = bswap32(v68) >> 16;
      *(_BYTE *)(v67 + 4) = 0;
      v60 = 0;
      v61 = v66;
      goto LABEL_86;
    }
LABEL_80:
    *a1 = checksum_iov;
    free(v38);
    goto LABEL_81;
  }
  v39 = 1;
  *(_DWORD *)v37 = 1;
  v40 = *(_QWORD *)(v14 + 16);
  v41 = v40 + *(_QWORD *)(v14 + 8);
  v37[1] = 0;
  v37[2] = v41;
  if (a7 >= 1)
  {
    v42 = 0;
    v39 = a7 + 1;
    do
    {
      v43 = &a6[v42 / 2];
      v44 = a6[v42 / 2];
      if (v44 == 11)
        v45 = 3;
      else
        v45 = 0;
      if (v44 == 1)
        v46 = 2;
      else
        v46 = v45;
      v47 = (char *)&v37[v42 / 8];
      *((_DWORD *)v47 + 6) = v46;
      *((_QWORD *)v47 + 4) = *((_QWORD *)v43 + 1);
      *((_QWORD *)v47 + 5) = *((_QWORD *)v43 + 2);
      v42 += 24;
    }
    while (24 * (a7 + 1) - 24 != v42);
  }
  LODWORD(v37[3 * v39]) = 2;
  if (v18)
    v48 = *(_QWORD *)(v18 + 16);
  else
    v48 = v40 + 16;
  v57 = &v38[24 * v39];
  *((_QWORD *)v57 + 1) = 16;
  *((_QWORD *)v57 + 2) = v48;
  *(_OWORD *)*((_QWORD *)v57 + 2) = *(_OWORD *)v67;
  v58 = &v38[24 * v39 + 24];
  *(_DWORD *)v58 = 5;
  *((_QWORD *)v58 + 2) = *((_QWORD *)v57 + 2) + 16;
  *((_QWORD *)v58 + 1) = 0;
  checksum_iov = krb5_encrypt_iov_ivec();
  if (checksum_iov)
    goto LABEL_80;
  v60 = v68;
  if (v68)
  {
    v61 = v66 + 2;
    *(_BYTE *)(v67 + 6) = BYTE1(v68);
LABEL_86:
    *v61 = v60;
  }
  if (a5)
    *a5 = a4;
  free(v38);
  v26 = 0;
  *a1 = 0;
  return v26;
}

uint64_t _gk_allocate_buffer(_DWORD *a1, uint64_t a2, size_t size)
{
  uint64_t result;
  void *v7;

  if ((*(_BYTE *)(a2 + 2) & 2) != 0)
  {
    if (*(_QWORD *)(a2 + 8) == size)
      return 0;
    free(*(void **)(a2 + 16));
  }
  v7 = malloc_type_malloc(size, 0x4F581A3BuLL);
  *(_QWORD *)(a2 + 8) = size;
  *(_QWORD *)(a2 + 16) = v7;
  if (v7)
  {
    result = 0;
    *(_DWORD *)a2 |= 0x20000u;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return result;
}

uint64_t _gssapi_unwrap_cfx_iov(_DWORD *a1, uint64_t a2, uint64_t a3, int *a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  unsigned __int16 *buffer;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 *v20;
  uint64_t v21;
  unsigned __int16 *v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  size_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int16 *v52;
  int v53;
  int v54;
  int v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  int v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  unsigned __int16 *v67;
  unsigned int v68;
  int v69;
  uint64_t v70;

  *a1 = 0;
  buffer = _gss_mg_find_buffer(a6, a7, 2);
  if (!buffer)
    goto LABEL_18;
  v20 = buffer;
  if (*((_QWORD *)buffer + 1) <= 0xFuLL)
  {
    _gss_mg_log(5, "cfxunwrap-iov token too short: %ld", v14, v15, v16, v17, v18, v19, *((_QWORD *)buffer + 1));
    return 589824;
  }
  v22 = _gss_mg_find_buffer(a6, a7, 9);
  v23 = v22;
  if (v22)
  {
    if (*((_QWORD *)v22 + 1))
      goto LABEL_18;
  }
  v24 = _gss_mg_find_buffer(a6, a7, 7);
  if ((*(_BYTE *)(a2 + 9) & 2) == 0)
  {
    if (v23)
      goto LABEL_9;
LABEL_18:
    *a1 = 22;
    return 851968;
  }
  if ((unint64_t)v23 | (unint64_t)v24)
    goto LABEL_18;
LABEL_9:
  v70 = 0;
  v69 = 0;
  *a1 = 0;
  v30 = *((_QWORD *)v20 + 2);
  if (*(_BYTE *)v30 == 5 && *(_BYTE *)(v30 + 1) == 4)
  {
    v67 = v24;
    v68 = *(unsigned __int8 *)(v30 + 2);
    v21 = verify_flags(a2, v68 & 7, (uint64_t)"unwrap-iov", v25, v26, v27, v28, v29);
    if ((_DWORD)v21)
      return v21;
    if (*(unsigned __int8 *)(v30 + 3) == 255)
    {
      if (a4)
        *a4 = (v68 >> 1) & 1;
      v31 = *(unsigned __int16 *)(v30 + 4);
      v32 = *(unsigned __int16 *)(v30 + 6);
      _gss_mg_decode_be_uint32((unsigned int *)(v30 + 8), &v70);
      _gss_mg_decode_be_uint32((unsigned int *)(v30 + 12), (_DWORD *)&v70 + 1);
      if ((_DWORD)v70)
      {
        *a1 = 34;
        return 8;
      }
      v34 = _gssapi_msg_order_check(*(_QWORD *)(a2 + 24), HIDWORD(v70));
      if ((_DWORD)v34)
      {
        v21 = v34;
LABEL_22:
        *a1 = 0;
        return v21;
      }
      v35 = malloc_type_calloc(a7 + 3, 0x18uLL, 0x10800404ACF7207uLL);
      if (!v35)
      {
        *a1 = 12;
        v21 = 851968;
LABEL_81:
        __ApplePrivate_gss_release_iov_buffer(&v69, (uint64_t)a6, a7);
        return v21;
      }
      v36 = __rev16(v31);
      v37 = __rev16(v32);
      v66 = (char *)v35;
      if ((v68 & 2) == 0)
      {
        if (!v67)
        {
          if ((_DWORD)v37 == (_DWORD)v36)
          {
            v38 = v36 + 16;
LABEL_38:
            if (*((_QWORD *)v20 + 1) == v38)
            {
              if (a7 < 1)
              {
                v47 = 0;
              }
              else
              {
                v40 = v35 + 2;
                v41 = (uint64_t *)(a6 + 8);
                v42 = a7;
                do
                {
                  v43 = *((unsigned __int16 *)v41 - 8);
                  if (v43 == 11)
                    v44 = 3;
                  else
                    v44 = 0;
                  if (v43 == 1)
                    v45 = 2;
                  else
                    v45 = v44;
                  *((_DWORD *)v40 - 4) = v45;
                  *(v40 - 1) = *(v41 - 1);
                  v46 = *v41;
                  v41 += 3;
                  *v40 = v46;
                  v40 += 3;
                  --v42;
                }
                while (v42);
                v47 = a7;
              }
              v62 = (char *)&v35[3 * v47];
              *(_DWORD *)v62 = 2;
              v63 = *((_QWORD *)v20 + 2);
              *((_QWORD *)v62 + 1) = 16;
              *((_QWORD *)v62 + 2) = v63;
              LODWORD(v35[3 * v47 + 3]) = 6;
              if (v67)
                v64 = *((_QWORD *)v67 + 2);
              else
                v64 = v63 + 16;
              v65 = (char *)&v35[3 * v47 + 3];
              *((_QWORD *)v65 + 1) = v36;
              *((_QWORD *)v65 + 2) = v64;
              *(_DWORD *)(v63 + 4) = 0;
              v61 = krb5_verify_checksum_iov();
              if (v61)
              {
LABEL_77:
                *a1 = v61;
                goto LABEL_78;
              }
              goto LABEL_82;
            }
            goto LABEL_66;
          }
LABEL_49:
          *a1 = 22;
LABEL_78:
          v21 = 851968;
          goto LABEL_79;
        }
        if (*((_QWORD *)v67 + 1) == v36)
        {
          if (!(_DWORD)v37)
          {
            v38 = 16;
            goto LABEL_38;
          }
          goto LABEL_49;
        }
        v21 = 589824;
LABEL_80:
        free(v35);
        goto LABEL_81;
      }
      krb5_crypto_length();
      krb5_crypto_length();
      if (v67)
      {
        if (*((_QWORD *)v67 + 1) == 16)
        {
          v39 = *((_QWORD *)v20 + 1);
          if (v39 == 16)
          {
            if ((_DWORD)v37)
            {
              v21 = unrotate_iov(a1, v37, (uint64_t)a6, a7);
              v35 = v66;
              if ((_DWORD)v21)
                goto LABEL_80;
              v39 = *((_QWORD *)v20 + 1);
            }
LABEL_55:
            v49 = 1;
            *(_DWORD *)v66 = 1;
            v50 = *((_QWORD *)v20 + 2) + v39;
            *((_QWORD *)v66 + 1) = 0;
            *((_QWORD *)v66 + 2) = v50;
            if (a7 >= 1)
            {
              v51 = 0;
              v49 = a7 + 1;
              do
              {
                v52 = &a6[v51];
                v53 = a6[v51];
                if (v53 == 11)
                  v54 = 3;
                else
                  v54 = 0;
                if (v53 == 1)
                  v55 = 2;
                else
                  v55 = v54;
                v56 = &v66[v51 * 2];
                *((_DWORD *)v56 + 6) = v55;
                *((_QWORD *)v56 + 4) = *((_QWORD *)v52 + 1);
                *((_QWORD *)v56 + 5) = *((_QWORD *)v52 + 2);
                v51 += 12;
              }
              while (12 * a7 != v51);
            }
            *(_DWORD *)&v66[24 * v49] = 2;
            if (v67)
              v57 = *((_QWORD *)v67 + 2);
            else
              v57 = v50 - v36 - 16;
            v58 = &v66[24 * v49];
            *((_QWORD *)v58 + 1) = v36 + 16;
            *((_QWORD *)v58 + 2) = v57;
            v59 = &v66[24 * v49 + 24];
            *(_DWORD *)v59 = 5;
            v60 = v57 + v36;
            *((_QWORD *)v59 + 1) = 0;
            *((_QWORD *)v59 + 2) = v57 + v36 + 16;
            v61 = krb5_decrypt_iov_ivec();
            if (v61)
              goto LABEL_77;
            *(_BYTE *)(v60 + 6) = *(_BYTE *)(v30 + 6);
            *(_BYTE *)(v60 + 7) = *(_BYTE *)(v30 + 7);
            if (!ct_memcmp())
            {
LABEL_82:
              if (a5)
                *a5 = 0;
              free(v66);
              v21 = 0;
              goto LABEL_22;
            }
            v21 = 393216;
LABEL_79:
            v35 = v66;
            goto LABEL_80;
          }
        }
      }
      else if (v37 == 16)
      {
        v48 = (*(_BYTE *)(a2 + 9) & 2) != 0 ? v36 : 0;
        v39 = v48 + 32;
        if (*((_QWORD *)v20 + 1) == v48 + 32)
          goto LABEL_55;
      }
LABEL_66:
      v21 = 589824;
      goto LABEL_79;
    }
  }
  return 589824;
}

uint64_t verify_flags(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;

  v8 = *(_DWORD *)(a1 + 8);
  if ((a2 & 1) != 0)
  {
    if ((v8 & 1) != 0)
    {
      _gss_mg_log(5, "cfx%s acceptor token set by initiator", a3, a4, a5, a6, a7, a8, a3);
      return 589824;
    }
  }
  else if ((v8 & 1) == 0)
  {
    _gss_mg_log(5, "cfx%s !acceptor token set by acceptor", a3, a4, a5, a6, a7, a8, a3);
    return 589824;
  }
  if ((v8 & 4) != 0)
  {
    if ((a2 & 4) == 0)
    {
      _gss_mg_log(5, "cfx%s no subkey", a3, a4, a5, a6, a7, a8, a3);
      return 589824;
    }
  }
  else if ((a2 & 4) != 0)
  {
    heim_base_once_f();
  }
  return 0;
}

uint64_t unrotate_iov(_DWORD *a1, size_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  size_t v9;
  _QWORD *v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  char *v23;
  char *v24;
  char *v25;
  _QWORD *v26;
  uint64_t v27;
  size_t v28;
  unsigned int v29;
  int v30;
  size_t v32;
  uint64_t v33;
  char *v34;
  unsigned int v35;
  int v36;
  size_t v38;
  BOOL v39;
  char *__dst;

  v8 = a4;
  if (a4 >= 1)
  {
    v9 = 0;
    v10 = (_QWORD *)(a3 + 8);
    v11 = a4;
    do
    {
      v12 = *((unsigned __int16 *)v10 - 4);
      v13 = v12 > 9;
      v14 = (1 << v12) & 0x282;
      if (!v13 && v14 != 0)
        v9 += *v10;
      v10 += 3;
      --v11;
    }
    while (v11);
    v16 = (char *)malloc_type_malloc(v9, 0x11D9F028uLL);
    if (v16)
    {
      v17 = a3 + 8;
      v18 = v16;
      v19 = v8;
      __dst = v16;
      do
      {
        v20 = *(unsigned __int16 *)(v17 - 8);
        v13 = v20 > 9;
        v21 = (1 << v20) & 0x282;
        if (!v13 && v21 != 0)
        {
          memcpy(v18, *(const void **)(v17 + 8), *(_QWORD *)v17);
          v18 += *(_QWORD *)v17;
        }
        v17 += 24;
        --v19;
      }
      while (v19);
      v23 = __dst;
      goto LABEL_20;
    }
LABEL_44:
    *a1 = 12;
    return 851968;
  }
  v24 = (char *)malloc_type_malloc(0, 0x11D9F028uLL);
  if (!v24)
    goto LABEL_44;
  v23 = v24;
  v9 = 0;
  v18 = v24;
LABEL_20:
  if (v18 - v23 != v9)
    unrotate_iov_cold_1();
  if (a4 >= 1)
  {
    v25 = &v23[a2];
    v26 = (_QWORD *)(a3 + 8);
    v27 = v8;
    v28 = a2;
    do
    {
      v29 = *((unsigned __int16 *)v26 - 4);
      v13 = v29 > 9;
      v30 = (1 << v29) & 0x282;
      if (!v13 && v30 != 0)
      {
        if (*v26 <= v28)
        {
          v28 -= *v26;
        }
        else
        {
          memcpy((void *)(v26[1] + v28), v25, *v26 - v28);
          v32 = *v26 - v28;
          v28 = 0;
          v25 += v32;
        }
      }
      v26 += 3;
      --v27;
    }
    while (v27);
    v33 = a3 + 8;
    v34 = v23;
    do
    {
      v35 = *(unsigned __int16 *)(v33 - 8);
      v13 = v35 > 9;
      v36 = (1 << v35) & 0x282;
      if (!v13 && v36 != 0)
      {
        if (*(_QWORD *)v33 >= a2)
          v38 = a2;
        else
          v38 = *(_QWORD *)v33;
        memcpy(v34, *(const void **)(v33 + 8), v38);
        v39 = a2 >= *(_QWORD *)v33;
        a2 -= *(_QWORD *)v33;
        if (!v39)
          break;
        v34 += *(_QWORD *)v33;
      }
      v33 += 24;
      --v8;
    }
    while (v8);
  }
  free(v23);
  return 0;
}

uint64_t _gssapi_wrap_iov_length_cfx(_DWORD *a1, uint64_t a2, _krb5_context *a3, int a4, uint64_t a5, _DWORD *a6, uint64_t a7, int a8)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t result;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  krb5_context v31;

  v31 = a3;
  v14 = __ApplePrivate__gsskrb5_init(&v31);
  if (v14)
  {
    *a1 = v14;
    return 851968;
  }
  *a1 = 0;
  if (a8 < 1)
    goto LABEL_23;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = a8;
  do
  {
    v20 = v17;
    v21 = v16;
    v22 = v15;
    switch(*(_WORD *)a7)
    {
      case 0:
      case 0xB:
        break;
      case 1:
        v18 += *(_QWORD *)(a7 + 8);
        break;
      case 2:
        v17 = a7;
        if (v20)
          return 851968;
        break;
      case 7:
        v15 = a7;
        if (v22)
          return 851968;
        break;
      case 9:
        v16 = a7;
        if (v21)
          return 851968;
        break;
      default:
        goto LABEL_23;
    }
    a7 += 24;
    --v19;
  }
  while (v19);
  if (!v17)
    goto LABEL_23;
  if ((*(_BYTE *)(a2 + 9) & 2) == 0)
  {
    if (v16)
      goto LABEL_16;
LABEL_23:
    *a1 = 22;
    return 851968;
  }
  if (v16 | v15)
    goto LABEL_23;
LABEL_16:
  if (a4)
  {
    v23 = krb5_crypto_length();
    *a1 = v23;
    if (v23)
      return 851968;
    v24 = krb5_crypto_length();
    *a1 = v24;
    if (v24)
      return 851968;
    v25 = krb5_crypto_length();
    *a1 = v25;
    if (v25)
      return 851968;
    if ((*(_BYTE *)(a2 + 9) & 2) != 0)
    {
      v30 = krb5_crypto_getblocksize();
      *a1 = v30;
      if (v30)
        return 851968;
    }
    v29 = 16;
    v28 = 16;
    if (!v15)
    {
LABEL_31:
      v29 = v28 + 16;
      goto LABEL_32;
    }
  }
  else
  {
    v27 = krb5_crypto_length();
    *a1 = v27;
    if (v27)
      return 851968;
    v28 = 0;
    v29 = 16;
    if (!v15)
      goto LABEL_31;
  }
  *(_QWORD *)(v15 + 8) = v28;
LABEL_32:
  *(_QWORD *)(v17 + 8) = v29;
  if (v16)
    *(_QWORD *)(v16 + 8) = 0;
  result = 0;
  if (a6)
    *a6 = a4;
  return result;
}

uint64_t _gssapi_wrap_cfx(_DWORD *a1, uint64_t a2, _krb5_context *a3, int a4, uint64_t a5, int *a6, size_t *a7)
{
  int v14;
  int v15;
  int v16;
  size_t v17;
  _BYTE *v18;
  _BYTE *v19;
  int v20;
  char v21;
  char v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  char *v32;
  char *v33;
  int checksum;
  uint64_t result;
  int v36;
  unsigned int v37;
  int *v38;
  uint64_t v39;
  _WORD __len[5];
  size_t size;
  size_t ivec;
  void *v43;

  ivec = 0;
  v43 = 0;
  size = 0;
  memset(__len, 0, sizeof(__len));
  v14 = _gsskrb5cfx_wrap_length_cfx((uint64_t)a3, a2, a4, *(_QWORD *)a5, &size, &__len[1], __len);
  if (v14)
  {
    *a1 = v14;
    return 851968;
  }
  v38 = a6;
  v15 = *(_DWORD *)(a2 + 8);
  v16 = *(_DWORD *)&__len[1];
  v17 = size;
  *a7 = size;
  v18 = malloc_type_malloc(v17, 0xFB90309DuLL);
  v39 = (uint64_t)a7;
  a7[1] = (size_t)v18;
  if (!v18)
  {
    *a1 = 12;
    return 851968;
  }
  v19 = v18;
  *(_DWORD *)v18 = -16776187;
  v20 = *(_DWORD *)(a2 + 8) & 5;
  if (v20)
    v18[2] = v20;
  if (a4)
  {
    v18[2] = v20 | 2;
    v21 = __len[0];
    v22 = HIBYTE(__len[0]);
  }
  else
  {
    v22 = 0;
    v21 = 0;
  }
  v23 = v15 << 22;
  v24 = v16 + 16 * (a4 != 0);
  v18[4] = v22;
  v18[5] = v21;
  *((_WORD *)v18 + 3) = 0;
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 16), (_DWORD *)v18 + 2);
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 12), (_DWORD *)v19 + 3);
  v25 = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = v25 + 1;
  if (v25 == -1)
    ++*(_DWORD *)(a2 + 16);
  v26 = v24 & (v23 >> 31);
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    v27 = 22;
  else
    v27 = 24;
  if (a4)
  {
    v37 = v26;
    memcpy(v19 + 16, *(const void **)(a5 + 8), *(_QWORD *)a5);
    v28 = (void *)v27;
    v29 = __len[0];
    memset(&v19[*(_QWORD *)a5 + 16], 255, __len[0]);
    *(_OWORD *)&v19[*(_QWORD *)a5 + 16 + v29] = *(_OWORD *)v19;
    v30 = krb5_encrypt(a3, *(krb5_const_pointer *)a2, v28, (size_t)(v19 + 16), (krb5_encrypt_block *)(v29 + *(_QWORD *)a5 + 16), &ivec);
    if (v30)
      goto LABEL_19;
    v31 = ivec;
    if (ivec + 16 != v17)
      _gssapi_wrap_cfx_cold_2();
    *((_WORD *)v19 + 3) = bswap32(v37) >> 16;
    v30 = rrc_rotate((char *)v43, v31, (unsigned __int16)(v37 + (v29 & ((__int16)(*(_WORD *)(a2 + 8) << 6) >> 15))), 0);
    if (v30)
    {
LABEL_19:
      *a1 = v30;
LABEL_24:
      _gsskrb5_release_buffer(a1, v39);
      return 851968;
    }
    memcpy(v19 + 16, v43, ivec);
    krb5_data_free();
  }
  else
  {
    v32 = (char *)malloc_type_malloc(*(_QWORD *)a5 + 16, 0xB8CB1627uLL);
    if (!v32)
    {
      *a1 = 12;
      goto LABEL_24;
    }
    v33 = v32;
    memcpy(v32, *(const void **)(a5 + 8), *(_QWORD *)a5);
    *(_OWORD *)&v33[*(_QWORD *)a5] = *(_OWORD *)v19;
    checksum = krb5_create_checksum();
    if (checksum)
    {
      *a1 = checksum;
      _gsskrb5_release_buffer(a1, v39);
      free(v33);
      return 851968;
    }
    free(v33);
    if (*(_QWORD *)&__len[1])
      _gssapi_wrap_cfx_cold_1();
    v19[4] = 0;
    v19[5] = 0;
    v19[6] = BYTE1(v26);
    v19[7] = v26;
    memcpy(v19 + 16, *(const void **)(a5 + 8), *(_QWORD *)a5);
    v36 = rrc_rotate(v19 + 16, *(_QWORD *)a5, (unsigned __int16)v26, 0);
    if (v36)
    {
      *a1 = v36;
      _gsskrb5_release_buffer(a1, v39);
      free_Checksum();
      return 851968;
    }
    free_Checksum();
  }
  if (v38)
    *v38 = a4;
  result = 0;
  *a1 = 0;
  return result;
}

uint64_t rrc_rotate(char *__src, unint64_t a2, unsigned int a3, int a4)
{
  size_t v5;
  char *p_dst;
  size_t v9;
  char __dst;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v5 = a3 % a2;
    if (v5)
    {
      if (v5 >= 0x101)
      {
        p_dst = (char *)malloc_type_malloc(a3 % a2, 0x4AFBF41CuLL);
        if (!p_dst)
          return 12;
      }
      else
      {
        p_dst = &__dst;
      }
      v9 = a2 - v5;
      if (a4)
      {
        memcpy(p_dst, __src, v5);
        memmove(__src, &__src[v5], v9);
        __src += v9;
      }
      else
      {
        memcpy(p_dst, &__src[v9], v5);
        memmove(&__src[v5], __src, v9);
      }
      memcpy(__src, p_dst, v5);
      if (v5 >= 0x101)
        free(p_dst);
    }
  }
  return 0;
}

uint64_t _gssapi_unwrap_cfx(krb5_error_code *a1, uint64_t a2, _krb5_context *a3, unint64_t *a4, uint64_t a5, int *a6, _DWORD *a7, uint64_t a8)
{
  _OWORD *v9;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  krb5_encrypt_block *v31;
  uint64_t v32;
  unsigned int v33;
  krb5_error_code v34;
  krb5_error_code checksum_type;
  krb5_error_code v36;
  krb5_error_code v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  void *v45;
  size_t v46;
  krb5_error_code v47;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t seed;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t ivec;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  if (*a4 <= 0xF)
  {
    _gss_mg_log(5, "cfxunwrap token too short: %ld", (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, a8, *a4);
    return 589824;
  }
  v57 = 0uLL;
  ivec = 0;
  v56 = 0;
  v9 = (_OWORD *)a4[1];
  v57 = *v9;
  if (v57 != 5 || BYTE1(v57) != 4)
  {
    _gss_mg_log(5, "cfxunwrap not a WRAP token: 0x%02x%02x", (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, a8, v57);
    return 589824;
  }
  v16 = BYTE2(v57);
  v23 = verify_flags(a2, BYTE2(v57) & 7, (uint64_t)"unwrap", (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, a8);
  if (!(_DWORD)v23)
  {
    if (BYTE3(v57) != 255)
    {
      _gss_mg_log(5, "cfxunwrap filler bad: 0x%02x", v17, v18, v19, v20, v21, v22, SBYTE3(v57));
      return 589824;
    }
    if (a6)
      *a6 = (BYTE2(v57) >> 1) & 1;
    v54 = 0;
    v50 = WORD2(v57);
    v25 = WORD3(v57);
    _gss_mg_decode_be_uint32((unsigned int *)&v57 + 2, &v54);
    _gss_mg_decode_be_uint32((unsigned int *)((unint64_t)&v57 | 0xC), (_DWORD *)&v54 + 1);
    if ((_DWORD)v54)
    {
      *a1 = 34;
      return 8;
    }
    v49 = v25;
    v26 = _gssapi_msg_order_check(*(_QWORD *)(a2 + 24), HIDWORD(v54));
    if ((_DWORD)v26)
    {
      v23 = v26;
      *a1 = 0;
      _gsskrb5_release_buffer(a1, a5);
      return v23;
    }
    v27 = *(_DWORD *)(a2 + 8);
    if ((v27 & 1) != 0)
      v28 = 24;
    else
      v28 = 22;
    v29 = (char *)(v9 + 1);
    v30 = *a4;
    v31 = (krb5_encrypt_block *)(a4[1] - (_QWORD)v29 + *a4);
    if ((unint64_t)v31 > v30)
      return 589824;
    v32 = __rev16(v50);
    v33 = bswap32(v49) >> 16;
    if ((v16 & 2) != 0)
    {
      v36 = rrc_rotate(v29, (unint64_t)v31, (unsigned __int16)(v33 + (v32 & ((__int16)((_WORD)v27 << 6) >> 15))), 1);
      *a1 = v36;
      if (v36)
        return 851968;
      v37 = krb5_decrypt(a3, *(krb5_const_pointer *)a2, (krb5_pointer)v28, (size_t)v29, v31, &ivec);
      if (v37)
      {
        *a1 = v37;
        return 393216;
      }
      if (ivec < v32 + 16)
      {
        krb5_data_free();
        _gss_mg_log(5, "cfxunwrap pad and token not fitting: %lu", v38, v39, v40, v41, v42, v43, ivec);
        return 589824;
      }
      WORD3(v57) = *(_WORD *)(ivec + v56 - 10);
      if (ct_memcmp())
      {
        krb5_data_free();
        return 393216;
      }
      v48 = v56;
      *(_QWORD *)a5 = ivec - v32 - 16;
      *(_QWORD *)(a5 + 8) = v48;
    }
    else
    {
      seed = 0;
      v52 = 0;
      v53 = 0;
      v34 = rrc_rotate(v29, (unint64_t)v31, v33, 1);
      *a1 = v34;
      if (v34)
        return 851968;
      checksum_type = krb5_crypto_get_checksum_type();
      if (checksum_type)
      {
        *a1 = checksum_type;
        return 851968;
      }
      v52 = v32;
      if ((unint64_t)v31 < v32)
      {
        *a1 = 34;
        return 393216;
      }
      v44 = (size_t)v31 - v32;
      v53 = &v29[v44];
      *(_QWORD *)a5 = v44;
      v45 = malloc_type_malloc(v44 + 16, 0xFC1C525DuLL);
      *(_QWORD *)(a5 + 8) = v45;
      if (!v45)
      {
        *a1 = 12;
        return 851968;
      }
      memcpy(v45, v29, v44);
      *(_OWORD *)(*(_QWORD *)(a5 + 8) + v44) = v57;
      *(_DWORD *)(*(_QWORD *)(a5 + 8) + v44 + 4) = 0;
      v47 = krb5_verify_checksum(a3, *(_QWORD *)a2, (const krb5_checksum *)v28, *(krb5_const_pointer *)(a5 + 8), v44 + 16, &seed, v46);
      if (v47)
      {
        *a1 = v47;
        _gsskrb5_release_buffer(a1, a5);
        return 393216;
      }
    }
    if (a7)
      *a7 = 0;
    v23 = 0;
    *a1 = 0;
  }
  return v23;
}

uint64_t _gssapi_mic_cfx(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  char *v10;
  char *v11;
  int v12;
  int checksum;
  uint64_t result;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = (char *)malloc_type_malloc(*(_QWORD *)a5 + 16, 0xCEFC56F3uLL);
  if (!v10)
  {
    *a1 = 12;
    return 851968;
  }
  v11 = v10;
  *((_QWORD *)&v16 + 1) = 0;
  LOWORD(v16) = 1028;
  BYTE2(v16) = *(_BYTE *)(a2 + 8) & 5;
  *(_DWORD *)((char *)&v16 + 3) = -1;
  BYTE7(v16) = -1;
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 16), (_DWORD *)&v16 + 2);
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 12), (_DWORD *)&v16 + 3);
  memcpy(v11, *(const void **)(a5 + 8), *(_QWORD *)a5);
  *(_OWORD *)&v11[*(_QWORD *)a5] = v16;
  v12 = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = v12 + 1;
  if (v12 == -1)
    ++*(_DWORD *)(a2 + 16);
  checksum = krb5_create_checksum();
  if (checksum)
  {
    *a1 = checksum;
LABEL_6:
    free(v11);
    return 851968;
  }
  *a6 = 16;
  v15 = malloc_type_malloc(0x10uLL, 0x385913F1uLL);
  a6[1] = v15;
  if (!v15)
  {
    *a1 = 12;
    free_Checksum();
    goto LABEL_6;
  }
  *v15 = v16;
  free_Checksum();
  free(v11);
  result = 0;
  *a1 = 0;
  return result;
}

uint64_t _gssapi_verify_mic_cfx(krb5_error_code *a1, uint64_t a2, _krb5_context *a3, uint64_t a4, _QWORD *a5, _DWORD *a6, uint64_t a7, uint64_t a8)
{
  __int128 *v10;
  uint64_t result;
  const char *v16;
  krb5_error_code checksum_type;
  int v18;
  char *v19;
  char *v20;
  uint64_t v21;
  size_t v22;
  krb5_error_code v23;
  char v24;
  uint64_t seed;
  uint64_t v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  if (*a5 <= 0xFuLL)
  {
    _gss_mg_log(5, "cfxverifymic token too short: %ld", (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, *(_QWORD *)a4);
    return 589824;
  }
  seed = 0;
  v26 = 0;
  v27 = 0;
  v10 = (__int128 *)a5[1];
  v29 = *v10;
  if (v29 != 4 || BYTE1(v29) != 4)
  {
    v24 = v29;
    v16 = "cfxverifymic not a MIC token: 0x%02x%02x";
    goto LABEL_9;
  }
  result = verify_flags(a2, BYTE2(v29) & 5, (uint64_t)"mic", a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  if ((_DWORD)result)
    return result;
  v28 = 0;
  if (ct_memcmp())
  {
    v16 = "cfxmic filler bad";
LABEL_9:
    _gss_mg_log(5, v16, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, v24);
    return 589824;
  }
  _gss_mg_decode_be_uint32((unsigned int *)&v29 + 2, &v28);
  _gss_mg_decode_be_uint32((unsigned int *)((unint64_t)&v29 | 0xC), (_DWORD *)&v28 + 1);
  if ((_DWORD)v28)
  {
    *a1 = 34;
    return 8;
  }
  result = _gssapi_msg_order_check(*(_QWORD *)(a2 + 24), HIDWORD(v28));
  if ((_DWORD)result)
  {
    *a1 = 0;
    return result;
  }
  checksum_type = krb5_crypto_get_checksum_type();
  if (checksum_type)
  {
    *a1 = checksum_type;
    return 851968;
  }
  v26 = *a5 - 16;
  v27 = v10 + 1;
  v18 = *(_DWORD *)(a2 + 8);
  v19 = (char *)malloc_type_malloc(*(_QWORD *)a4 + 16, 0x229963E4uLL);
  if (!v19)
  {
    *a1 = 12;
    return 851968;
  }
  v20 = v19;
  if ((v18 & 1) != 0)
    v21 = 25;
  else
    v21 = 23;
  memcpy(v19, *(const void **)(a4 + 8), *(_QWORD *)a4);
  *(_OWORD *)&v20[*(_QWORD *)a4] = v29;
  v23 = krb5_verify_checksum(a3, *(_QWORD *)a2, (const krb5_checksum *)v21, v20, *(_QWORD *)a4 + 16, &seed, v22);
  if (v23)
  {
    *a1 = v23;
    free(v20);
    return 393216;
  }
  else
  {
    free(v20);
    result = 0;
    if (a6)
      *a6 = 0;
  }
  return result;
}

void log_broken_acceptor_server(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _gss_mg_log(5, "cfx%s subkey when not expecting one", a3, a4, a5, a6, a7, a8, a1);
}

uint64_t _gsskrb5_compare_name(_DWORD *a1, const krb5_principal_data *a2, const krb5_principal_data *a3, krb5_BOOLean *a4)
{
  int v8;
  uint64_t result;
  krb5_BOOLean v10;
  krb5_context v11;

  v11 = 0;
  v8 = __ApplePrivate__gsskrb5_init(&v11);
  if (v8)
  {
    result = 851968;
  }
  else
  {
    v10 = krb5_principal_compare(v11, a2, a3);
    result = 0;
    *a4 = v10;
  }
  *a1 = v8;
  return result;
}

uint64_t _gss_DES3_get_mic_compat(krb5_error_code *a1, uint64_t a2, _krb5_context *a3)
{
  uint64_t result;
  int v7;
  int v8;

  result = 0;
  v8 = 0;
  if ((*(_BYTE *)(a2 + 76) & 8) == 0)
  {
    result = check_compat(a1, a3, *(_QWORD *)(a2 + 64), (uint64_t)"broken_des3_mic", &v8, 1);
    if (!(_DWORD)result)
    {
      result = check_compat(a1, a3, *(_QWORD *)(a2 + 64), (uint64_t)"correct_des3_mic", &v8, 0);
      if (!(_DWORD)result)
      {
        if (v8)
          v7 = *(_DWORD *)(a2 + 76) | 4;
        else
          v7 = *(_DWORD *)(a2 + 76);
        *(_DWORD *)(a2 + 76) = v7 | 8;
      }
    }
  }
  return result;
}

uint64_t check_compat(krb5_error_code *a1, _krb5_context *a2, uint64_t a3, uint64_t a4, _DWORD *a5, int a6)
{
  uint64_t result;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  krb5_error_code v14;
  krb5_principal v15;

  result = krb5_config_get_strings();
  if (!result)
    return result;
  v11 = result;
  v15 = 0;
  v12 = *(const char **)result;
  if (!*(_QWORD *)result)
  {
LABEL_7:
    krb5_config_free_strings();
    return 0;
  }
  v13 = 8;
  while (1)
  {
    v14 = krb5_parse_name(a2, v12, &v15);
    if (v14)
      break;
    if (krb5_principal_match())
    {
      *a5 = a6;
      break;
    }
    krb5_free_principal(a2, v15);
    v15 = 0;
    v12 = *(const char **)(v11 + v13);
    v13 += 8;
    if (!v12)
      goto LABEL_7;
  }
  if (v15)
    krb5_free_principal(a2, v15);
  krb5_config_free_strings();
  if (!v14)
    return 0;
  if (a1)
    *a1 = v14;
  return 851968;
}

uint64_t _gsskrb5_lifetime_left(_DWORD *a1, krb5_context a2, uint64_t a3, int *a4)
{
  uint64_t result;
  int v6;
  krb5_timestamp v9[2];

  if (a3 == 0x7FFFFFFF)
  {
    result = 0;
    v6 = -1;
  }
  else
  {
    *(_QWORD *)v9 = 0;
    result = krb5_timeofday(a2, v9);
    if ((_DWORD)result)
    {
      *a1 = result;
      return 851968;
    }
    if (a3 >= *(uint64_t *)v9)
      v6 = a3 - v9[0];
    else
      v6 = 0;
  }
  *a4 = v6;
  return result;
}

uint64_t _gsskrb5_context_time(_DWORD *a1, uint64_t a2, int *a3)
{
  int v6;
  uint64_t result;
  pthread_mutex_t *v8;
  uint64_t v9;
  krb5_context v10;

  v10 = 0;
  v6 = __ApplePrivate__gsskrb5_init(&v10);
  if (v6)
  {
    *a1 = v6;
    return 851968;
  }
  else
  {
    v8 = (pthread_mutex_t *)(a2 + 128);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    v9 = *(_QWORD *)(a2 + 120);
    pthread_mutex_unlock(v8);
    result = _gsskrb5_lifetime_left(a1, v10, v9, a3);
    if (!(_DWORD)result)
    {
      *a1 = 0;
      if (*a3)
        return 0;
      else
        return 786432;
    }
  }
  return result;
}

uint64_t _gsskrb5_krb5_import_cred(int *a1, _krb5_ccache *a2, const krb5_principal_data *a3, uint64_t a4, _QWORD *a5)
{
  int v10;
  uint64_t v11;
  char *v13;
  char *v14;
  pthread_mutex_t *v15;
  krb5_error_code principal;
  krb5_error_code v17;
  int v18;
  int full_name;
  _krb5_ccache *v20;
  _krb5_kt *v21;
  krb5_context context;

  context = 0;
  *a5 = 0;
  v10 = __ApplePrivate__gsskrb5_init(&context);
  if (!v10)
  {
    v13 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
    if (v13)
    {
      v14 = v13;
      v15 = (pthread_mutex_t *)(v13 + 48);
      pthread_mutex_init((pthread_mutex_t *)(v13 + 48), 0);
      *((_DWORD *)v14 + 8) = 0;
      if (!a2)
      {
LABEL_17:
        if (!a4
          || ((*((_DWORD *)v14 + 8) |= 2u, !a3)
           || *(_QWORD *)v14
           || (full_name = krb5_copy_principal(context, a3, (krb5_principal *)v14)) == 0)
          && (full_name = krb5_kt_get_full_name()) == 0
          && (full_name = krb5_kt_resolve(context, 0, (krb5_keytab *)v14 + 2), free(0), !full_name))
        {
          v11 = 0;
          *a1 = 0;
          *a5 = v14;
          return v11;
        }
LABEL_25:
        v20 = (_krb5_ccache *)*((_QWORD *)v14 + 5);
        if (v20)
          krb5_cc_close(context, v20);
        v21 = (_krb5_kt *)*((_QWORD *)v14 + 2);
        if (v21)
          krb5_kt_close(context, v21);
        if (*(_QWORD *)v14)
          krb5_free_principal(context, *(krb5_principal *)v14);
        pthread_mutex_destroy(v15);
        free(v14);
        *a1 = full_name;
        return 851968;
      }
      *((_DWORD *)v14 + 8) = 1;
      principal = krb5_cc_get_principal(context, a2, (krb5_principal *)v14);
      if (principal)
      {
        v17 = principal;
        free(v14);
        *a1 = v17;
        return 851968;
      }
      if (!a3 || krb5_principal_compare(context, *(krb5_const_principal *)v14, a3))
      {
        v11 = __gsskrb5_ccache_lifetime(a1, context, a2, *(_QWORD *)v14, (_QWORD *)v14 + 3);
        if ((_DWORD)v11)
        {
          krb5_free_principal(context, *(krb5_principal *)v14);
          free(v14);
          return v11;
        }
        full_name = krb5_cc_get_full_name();
        if (full_name)
          goto LABEL_25;
        full_name = krb5_cc_resolve(context, 0, (krb5_ccache *)v14 + 5);
        free(0);
        if (full_name)
          goto LABEL_25;
        goto LABEL_17;
      }
      krb5_free_principal(context, *(krb5_principal *)v14);
      free(v14);
      _gsskrb5_clear_status();
      v18 = 22;
    }
    else
    {
      _gsskrb5_clear_status();
      v18 = 12;
    }
    *a1 = v18;
    return 851968;
  }
  *a1 = v10;
  return 851968;
}

uint64_t _gsskrb5_get_mech(_BYTE *a1, uint64_t a2)
{
  if (!a2)
    return -1;
  if (*a1 == 96 && !der_get_length())
    return -1;
  return -1;
}

uint64_t _gssapi_verify_mech_header(_BYTE **a1, unint64_t a2, uint64_t a3)
{
  size_t mech;
  _BYTE *v7;
  uint64_t result;

  mech = _gsskrb5_get_mech(*a1, a2);
  if ((mech & 0x8000000000000000) != 0)
    return 589824;
  v7 = (_BYTE *)mech;
  if (a2 < mech || mech != *(_DWORD *)a3)
    return 0x10000;
  if (-(uint64_t)*a1 > a2 - mech)
    return 0x10000;
  result = memcmp(0, *(const void **)(a3 + 8), mech);
  if ((_DWORD)result)
    return 0x10000;
  *a1 = v7;
  return result;
}

uint64_t _gsskrb5_verify_header(_BYTE **a1, unint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  _BYTE *v7;
  uint64_t result;
  _BYTE *v9;

  v7 = *a1;
  result = _gssapi_verify_mech_header(a1, a2, a4);
  if (!(_DWORD)result)
  {
    v9 = *a1;
    if ((unint64_t)(&v7[a2] - *a1) >= 2 && *(unsigned __int16 *)v9 == *a3)
    {
      result = 0;
      *a1 = v9 + 2;
    }
    else
    {
      return 589824;
    }
  }
  return result;
}

uint64_t _gssapi_decapsulate(_DWORD *a1, unint64_t *a2, _WORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t result;
  unint64_t v12;
  _BYTE *v13;
  _BYTE *v14;

  v9 = *a2;
  v14 = (_BYTE *)a2[1];
  result = _gssapi_verify_mech_header(&v14, v9, a5);
  if ((_DWORD)result)
  {
    *a1 = 0;
  }
  else
  {
    v12 = a2[1] - (_QWORD)v14 + *a2;
    if (v12 > 1)
    {
      result = 0;
      v13 = v14 + 2;
      *a3 = *(_WORD *)v14;
      *a4 = v12 - 2;
      a4[1] = v13;
    }
    else
    {
      *a1 = 0;
      return 589824;
    }
  }
  return result;
}

uint64_t _gsskrb5_decapsulate(_DWORD *a1, unint64_t *a2, _QWORD *a3, unsigned __int16 *a4, uint64_t a5)
{
  unint64_t v8;
  uint64_t result;
  _BYTE *v11;
  _BYTE *v12;

  v8 = *a2;
  v12 = (_BYTE *)a2[1];
  result = _gsskrb5_verify_header(&v12, v8, a4, a5);
  if ((_DWORD)result)
  {
    *a1 = 0;
  }
  else
  {
    v11 = v12;
    *a3 = *a2 - (_QWORD)v12 + a2[1];
    a3[1] = v11;
  }
  return result;
}

uint64_t _gssapi_verify_pad(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t result;
  uint64_t v8;
  int v9;

  v3 = a1[1] + *a1;
  v6 = *(unsigned __int8 *)(v3 - 1);
  v4 = (unsigned __int8 *)(v3 - 1);
  v5 = v6;
  if (v6 > a2)
    return 0x10000;
  if ((_DWORD)v5)
  {
    v8 = v5;
    while (1)
    {
      v9 = *v4--;
      if (v9 != (_DWORD)v5)
        return 393216;
      if (!--v8)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    result = 0;
    *a3 = v5;
  }
  return result;
}

uint64_t _gsskrb5_delete_sec_context(_DWORD *a1, void **a2, _QWORD *a3)
{
  int v6;
  void *v8;
  _krb5_ccache *v9;
  int v10;
  krb5_creds *v11;
  krb5_principal_data *v12;
  krb5_principal_data *v13;
  krb5_ticket *v14;
  krb5_keyblock *v15;
  krb5_get_init_creds_opt *v16;
  void *v17;
  size_t v18;
  krb5_data *v19;
  void *v20;
  krb5_context context;

  context = 0;
  v6 = __ApplePrivate__gsskrb5_init(&context);
  if (v6)
  {
    *a1 = v6;
    return 851968;
  }
  else
  {
    *a1 = 0;
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
    v8 = *a2;
    if (*a2)
    {
      *a2 = 0;
      pthread_mutex_lock((pthread_mutex_t *)v8 + 2);
      v9 = (_krb5_ccache *)*((_QWORD *)v8 + 13);
      if (v9)
      {
        v10 = *((_DWORD *)v8 + 19);
        if ((v10 & 0x10) != 0)
        {
          krb5_cc_close(context, v9);
        }
        else if ((v10 & 0x20) != 0)
        {
          krb5_cc_destroy(context, v9);
        }
      }
      krb5_auth_con_free(context, *((krb5_auth_context *)v8 + 5));
      krb5_auth_con_free(context, *((krb5_auth_context *)v8 + 6));
      v11 = (krb5_creds *)*((_QWORD *)v8 + 12);
      if (v11)
        krb5_free_creds(context, v11);
      v12 = (krb5_principal_data *)*((_QWORD *)v8 + 7);
      if (v12)
        krb5_free_principal(context, v12);
      v13 = (krb5_principal_data *)*((_QWORD *)v8 + 8);
      if (v13)
        krb5_free_principal(context, v13);
      v14 = (krb5_ticket *)*((_QWORD *)v8 + 14);
      if (v14)
        krb5_free_ticket(context, v14);
      if (*((_QWORD *)v8 + 3))
        _gssapi_msg_order_destroy((void **)v8 + 3);
      v15 = (krb5_keyblock *)*((_QWORD *)v8 + 24);
      if (v15)
        krb5_free_keyblock(context, v15);
      krb5_data_free();
      if (*(_QWORD *)v8)
        krb5_crypto_destroy();
      if (*((_QWORD *)v8 + 31))
        krb5_tkt_creds_free();
      if (*((_QWORD *)v8 + 27))
        heim_release();
      v16 = (krb5_get_init_creds_opt *)*((_QWORD *)v8 + 29);
      if (v16)
        krb5_get_init_creds_opt_free(context, v16);
      if (*((_QWORD *)v8 + 30))
        krb5_init_creds_free();
      v17 = (void *)*((_QWORD *)v8 + 33);
      if (v17)
      {
        v18 = strlen(*((const char **)v8 + 33));
        bzero(v17, v18);
        free(*((void **)v8 + 33));
      }
      v19 = (krb5_data *)*((_QWORD *)v8 + 32);
      if (v19)
        krb5_free_data(context, v19);
      v20 = (void *)*((_QWORD *)v8 + 34);
      if (v20)
        free(v20);
      if (*((_QWORD *)v8 + 28))
        krb5_storage_free();
      if (*((_QWORD *)v8 + 35))
        krb5_data_free();
      if (*((_QWORD *)v8 + 37))
        krb5_data_free();
      pthread_mutex_unlock((pthread_mutex_t *)v8 + 2);
      pthread_mutex_destroy((pthread_mutex_t *)v8 + 2);
      *(_OWORD *)v8 = 0u;
      *((_OWORD *)v8 + 1) = 0u;
      *((_OWORD *)v8 + 2) = 0u;
      *((_OWORD *)v8 + 3) = 0u;
      *((_OWORD *)v8 + 4) = 0u;
      *((_OWORD *)v8 + 5) = 0u;
      *((_OWORD *)v8 + 6) = 0u;
      *((_OWORD *)v8 + 7) = 0u;
      *((_OWORD *)v8 + 8) = 0u;
      *((_OWORD *)v8 + 9) = 0u;
      *((_OWORD *)v8 + 10) = 0u;
      *((_OWORD *)v8 + 11) = 0u;
      *((_OWORD *)v8 + 12) = 0u;
      *((_OWORD *)v8 + 13) = 0u;
      *((_OWORD *)v8 + 14) = 0u;
      *((_OWORD *)v8 + 15) = 0u;
      *((_OWORD *)v8 + 16) = 0u;
      *((_OWORD *)v8 + 17) = 0u;
      *((_OWORD *)v8 + 18) = 0u;
      *((_QWORD *)v8 + 38) = 0;
      free(v8);
    }
    return 0;
  }
}

uint64_t _gsskrb5_display_name(_DWORD *a1, const krb5_principal_data *a2, size_t *a3, gss_OID_desc **a4)
{
  int v8;
  uint64_t v9;
  char *v11;
  char *__s;
  krb5_context v13;

  __s = 0;
  v13 = 0;
  v8 = __ApplePrivate__gsskrb5_init(&v13);
  if (v8 || (v8 = krb5_unparse_name_flags(v13, a2, 4, &__s)) != 0)
  {
    v9 = 851968;
  }
  else
  {
    v11 = __s;
    *a3 = strlen(__s);
    a3[1] = (size_t)v11;
    v8 = 0;
    v9 = 0;
    if (a4)
      *a4 = &__gss_krb5_nt_principal_name_oid_desc;
  }
  *a1 = v8;
  return v9;
}

void _gsskrb5_clear_status()
{
  krb5_context v0;

  v0 = 0;
  if (!__ApplePrivate__gsskrb5_init(&v0))
    krb5_clear_error_message(v0);
}

void _gsskrb5_set_status(krb5_error_code a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v11;
  char *v12;
  krb5_context v13;

  v12 = 0;
  v13 = 0;
  v11 = 0;
  if (!__ApplePrivate__gsskrb5_init(&v13))
  {
    v12 = &a9;
    if ((vasprintf(&v11, a2, &a9) & 0x80000000) == 0)
    {
      if (v11)
      {
        krb5_set_error_message(v13, a1, "%s", v11);
        free(v11);
      }
    }
  }
}

uint64_t _gsskrb5_display_status(_DWORD *a1, krb5_error_code a2, int a3, const gss_OID_desc *a4, _DWORD *a5, size_t *a6)
{
  int v12;
  uint64_t result;
  const char *error_message;
  const char *v15;
  int v16;
  char *v17;
  size_t v18;
  char *__s;
  krb5_context v20;

  __s = 0;
  v20 = 0;
  v12 = __ApplePrivate__gsskrb5_init(&v20);
  if (v12)
  {
    *a1 = v12;
    return 851968;
  }
  *a6 = 0;
  a6[1] = 0;
  if (!gss_oid_equal(a4, 0) && !gss_oid_equal(a4, &__gss_krb5_mechanism_oid_desc))
  {
    *a1 = 0;
    return 1;
  }
  if (a3 == 2)
  {
    error_message = krb5_get_error_message(v20, a2);
    if (error_message)
    {
      v15 = error_message;
      __s = strdup(error_message);
      krb5_free_error_message(v20, v15);
      goto LABEL_17;
    }
    v16 = asprintf(&__s, "unknown mech error-code %u");
  }
  else
  {
    if (a3 != 1)
    {
      *a1 = 22;
      return 327680;
    }
    if ((_WORD)a2)
      v16 = asprintf(&__s, "%s");
    else
      v16 = asprintf(&__s, "%s %s");
  }
  if (v16 < 0)
  {
LABEL_19:
    *a1 = 12;
    return 851968;
  }
LABEL_17:
  v17 = __s;
  if (!__s)
    goto LABEL_19;
  *a5 = 0;
  *a1 = 0;
  v18 = strlen(v17);
  result = 0;
  *a6 = v18;
  a6[1] = (size_t)v17;
  return result;
}

uint64_t _gsskrb5_duplicate_name(_DWORD *a1, const krb5_principal_data *a2, _QWORD *a3)
{
  int v6;
  uint64_t v7;
  krb5_principal v9;
  krb5_context v10;

  v9 = 0;
  v10 = 0;
  v6 = __ApplePrivate__gsskrb5_init(&v10);
  if (v6 || (v6 = krb5_copy_principal(v10, a2, &v9)) != 0)
  {
    v7 = 851968;
  }
  else
  {
    v7 = 0;
    *a3 = v9;
  }
  *a1 = v6;
  return v7;
}

uint64_t _gssapi_encap_length(uint64_t a1, _QWORD *a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t result;

  *a2 = (*a4 + 2) + a1;
  result = der_length_len();
  *a3 = result + *a2 + 1;
  return result;
}

uint64_t _gsskrb5_encap_length(uint64_t a1, _QWORD *a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t result;

  *a2 = a1 + (*a4 + 2) + 2;
  result = der_length_len();
  *a3 = result + *a2 + 1;
  return result;
}

char *_gsskrb5_make_header(_BYTE *a1, uint64_t a2, _WORD *a3, const void **a4)
{
  char *mech_header;

  mech_header = _gssapi_make_mech_header(a1, a2, a4);
  *(_WORD *)mech_header = *a3;
  return mech_header + 2;
}

char *_gssapi_make_mech_header(_BYTE *a1, uint64_t a2, const void **a3)
{
  uint64_t v5;
  _BYTE *v6;
  BOOL v7;
  _BYTE *v8;
  char *v9;

  *a1 = 96;
  v5 = der_length_len();
  v6 = &a1[v5];
  if (der_put_length())
    v7 = 0;
  else
    v7 = v5 == 0;
  if (!v7)
    abort();
  v8 = v6 + 1;
  v6[1] = 6;
  v9 = v6 + 3;
  v8[1] = *(_DWORD *)a3;
  memcpy(v9, a3[1], *(unsigned int *)a3);
  return &v9[*(unsigned int *)a3];
}

uint64_t _gsskrb5_encapsulate(_DWORD *a1, uint64_t a2, size_t *a3, _WORD *a4, const void **a5)
{
  uint64_t v10;
  size_t v11;
  _BYTE *v12;
  char *mech_header;

  v10 = *(_QWORD *)a2 + (*(_DWORD *)a5 + 2) + 2;
  v11 = der_length_len() + v10 + 1;
  *a3 = v11;
  v12 = malloc_type_malloc(v11, 0xBCEA057CuLL);
  a3[1] = (size_t)v12;
  if (v12)
  {
    mech_header = _gssapi_make_mech_header(v12, v10, a5);
    *(_WORD *)mech_header = *a4;
    memcpy(mech_header + 2, *(const void **)(a2 + 8), *(_QWORD *)a2);
    return 0;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
}

uint64_t _gsskrb5_export_name(int *a1, const krb5_principal_data *a2, size_t *a3)
{
  return export_name_common(a1, (const void **)&__gss_krb5_mechanism_oid_desc, a2, a3);
}

uint64_t export_name_common(int *a1, const void **a2, const krb5_principal_data *a3, size_t *a4)
{
  int v8;
  uint64_t v9;
  size_t v11;
  char *__s;
  krb5_context v13;

  __s = 0;
  v13 = 0;
  v8 = __ApplePrivate__gsskrb5_init(&v13);
  if (v8 || (v8 = krb5_unparse_name(v13, a3, &__s)) != 0)
  {
    *a1 = v8;
    return 851968;
  }
  else
  {
    v11 = strlen(__s);
    v9 = gss_mg_export_name(a1, a2, __s, v11, a4);
    krb5_xfree();
  }
  return v9;
}

uint64_t _gsspku2u_export_name(int *a1, const krb5_principal_data *a2, size_t *a3)
{
  return export_name_common(a1, (const void **)&__gss_pku2u_mechanism_oid_desc, a2, a3);
}

uint64_t _gssiakerb_export_name(int *a1, const krb5_principal_data *a2, size_t *a3)
{
  return export_name_common(a1, (const void **)&__gss_krb5_mechanism_oid_desc, a2, a3);
}

uint64_t _gsskrb5_export_sec_context(int *a1, void **a2, size_t *a3)
{
  char *v6;
  int v7;
  uint64_t v8;
  pthread_mutex_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  int v15;
  int v16;
  int v17;
  size_t v18;
  char *v19;
  int v20;
  size_t v21;
  size_t v22;
  size_t v23;
  size_t v24;
  krb5_context v25;

  v25 = 0;
  v6 = (char *)*a2;
  v23 = 0;
  v24 = 0;
  v21 = 0;
  v22 = 0;
  v20 = 0;
  v7 = __ApplePrivate__gsskrb5_init(&v25);
  if (v7)
  {
    *a1 = v7;
    return 851968;
  }
  v9 = (pthread_mutex_t *)(v6 + 128);
  pthread_mutex_lock((pthread_mutex_t *)v6 + 2);
  if ((v6[73] & 1) == 0)
  {
    pthread_mutex_unlock((pthread_mutex_t *)v6 + 2);
    *a1 = 0;
    return 0x100000;
  }
  v10 = krb5_storage_emem();
  if (!v10)
  {
    pthread_mutex_unlock((pthread_mutex_t *)v6 + 2);
    *a1 = 12;
    return 851968;
  }
  v11 = v10;
  v12 = (_QWORD *)*((_QWORD *)v6 + 5);
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_9;
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_9;
  if (v12[1])
  {
    v13 = krb5_store_address();
    if (v13)
      goto LABEL_9;
  }
  if (v12[2])
  {
    v13 = krb5_store_address();
    if (v13)
      goto LABEL_9;
  }
  v13 = krb5_store_int16();
  if (v13)
    goto LABEL_9;
  v13 = krb5_store_int16();
  if (v13)
    goto LABEL_9;
  if (v12[4])
  {
    v13 = krb5_store_keyblock();
    if (v13)
      goto LABEL_9;
  }
  if (v12[5])
  {
    v13 = krb5_store_keyblock();
    if (v13)
      goto LABEL_9;
  }
  if (v12[6])
  {
    v13 = krb5_store_keyblock();
    if (v13)
      goto LABEL_9;
  }
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_9;
  v19 = v6;
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_9;
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_9;
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_9;
  v8 = _gsskrb5_export_name(a1, *((const krb5_principal_data **)v6 + 7), &v21);
  if ((_DWORD)v8)
    goto LABEL_11;
  v15 = krb5_store_data();
  _gsskrb5_release_buffer(&v20, (uint64_t)&v21);
  if (v15)
  {
    v13 = v15;
LABEL_9:
    v8 = 0;
LABEL_10:
    *a1 = v13;
LABEL_11:
    pthread_mutex_unlock(v9);
    krb5_storage_free();
    return v8;
  }
  v8 = _gsskrb5_export_name(a1, *((const krb5_principal_data **)v19 + 8), &v21);
  if ((_DWORD)v8)
    goto LABEL_11;
  v23 = v21;
  v24 = v22;
  v16 = krb5_store_data();
  _gsskrb5_release_buffer(&v20, (uint64_t)&v21);
  if (v16)
  {
    v13 = v16;
LABEL_41:
    v8 = 851968;
    goto LABEL_10;
  }
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_41;
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_41;
  v13 = krb5_store_int32();
  if (v13)
    goto LABEL_41;
  v13 = _gssapi_msg_order_export(v11, *((_QWORD *)v19 + 3));
  if (v13)
    goto LABEL_41;
  v17 = krb5_storage_to_data();
  krb5_storage_free();
  if (v17)
  {
    pthread_mutex_unlock(v9);
    *a1 = v17;
    return 851968;
  }
  v18 = v24;
  *a3 = v23;
  a3[1] = v18;
  pthread_mutex_unlock(v9);
  v8 = _gsskrb5_delete_sec_context(a1, a2, 0);
  if ((_DWORD)v8)
    _gsskrb5_release_buffer(0, (uint64_t)a3);
  *a1 = 0;
  return v8;
}

void *__gss_krb5_initialize()
{
  return &krb5_mech;
}

void *__gss_pku2u_initialize()
{
  return &iakerb_mech;
}

void *__gss_iakerb_initialize()
{
  return &pku2u_mech;
}

uint64_t _gsskrb5_get_mic(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v10;
  uint64_t mic_arcfour;
  int token_key;
  krb5_magic magic;
  _krb5_context *v15;
  size_t v16;
  _BYTE *v17;
  char *header;
  _QWORD *v19;
  void *v20;
  int v21;
  int checksum;
  int v23;
  int v24;
  uint64_t v25;
  krb5_keyblock *v27;
  krb5_context v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  size_t size;
  uint64_t v33;
  krb5_int32 v34;
  uint64_t v35;
  size_t v36;
  const void *v37;
  uint64_t v38;
  krb5_int32 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = 0;
  v10 = __ApplePrivate__gsskrb5_init(&v28);
  if (!v10)
  {
    if ((*(_BYTE *)(a2 + 76) & 0x40) != 0)
      return _gssapi_mic_cfx(a1, a2, (uint64_t)v28, a3, a4, (_QWORD *)a5);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    token_key = _gsskrb5i_get_token_key(a2, v28, &v27);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (token_key)
    {
      *a1 = token_key;
      return 851968;
    }
    magic = v27->magic;
    if ((v27->magic - 23) < 2)
    {
      mic_arcfour = _gssapi_get_mic_arcfour(a1, a2, v28, a3, a4, (size_t *)a5, v27);
      goto LABEL_31;
    }
    if (magic != 16 && magic != 5)
    {
      mic_arcfour = 851968;
LABEL_31:
      krb5_free_keyblock(v28, v27);
      return mic_arcfour;
    }
    v15 = v28;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v34 = 0;
    size = 0;
    v33 = 0;
    v30 = 0;
    v31 = 0;
    v29 = 0;
    _gsskrb5_encap_length(36, &v33, &size, &__gss_krb5_mechanism_oid_desc);
    v16 = size;
    *(_QWORD *)a5 = size;
    v17 = malloc_type_malloc(v16, 0x4E0FEA83uLL);
    *(_QWORD *)(a5 + 8) = v17;
    if (v17)
    {
      header = _gsskrb5_make_header(v17, v33, "\x01\x01", (const void **)&__gss_krb5_mechanism_oid_desc);
      *(_WORD *)header = 4;
      *(_DWORD *)(header + 2) = -1;
      v19 = malloc_type_malloc(*(_QWORD *)a4 + 8, 0xE1AF8775uLL);
      if (v19)
      {
        v20 = v19;
        *v19 = *(_QWORD *)(header - 2);
        memcpy(v19 + 1, *(const void **)(a4 + 8), *(_QWORD *)a4);
        v21 = krb5_crypto_init();
        if (v21)
        {
          checksum = v21;
          free(*(void **)(a5 + 8));
          *(_QWORD *)a5 = 0;
          *(_QWORD *)(a5 + 8) = 0;
          free(v20);
        }
        else
        {
          checksum = krb5_create_checksum();
          free(v20);
          krb5_crypto_destroy();
          if (!checksum)
          {
            memcpy(header + 14, v37, v36);
            pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
            krb5_auth_con_getlocalseqnumber(v15, *(krb5_auth_context *)(a2 + 40), &v34);
            v23 = 16843009 * ((*(_BYTE *)(a2 + 76) & 1) - 1);
            v39 = v34;
            v40 = v23;
            v24 = krb5_crypto_init();
            if (v24)
            {
              checksum = v24;
            }
            else
            {
              if ((*(_BYTE *)(a2 + 76) & 4) != 0)
                v25 = 0;
              else
                v25 = *(_QWORD *)(header + 14);
              v38 = v25;
              checksum = krb5_encrypt_ivec();
              krb5_crypto_destroy();
              if (!checksum)
              {
                if (v29 != 8)
                  _gsskrb5_get_mic_cold_1();
                *(_QWORD *)(header + 6) = *v30;
                krb5_data_free();
                ++v34;
                krb5_auth_con_setlocalseqnumber();
                pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
                free_Checksum();
                checksum = 0;
                mic_arcfour = 0;
                goto LABEL_30;
              }
            }
          }
          free(*(void **)(a5 + 8));
          *(_QWORD *)a5 = 0;
          *(_QWORD *)(a5 + 8) = 0;
        }
        mic_arcfour = 851968;
LABEL_30:
        *a1 = checksum;
        goto LABEL_31;
      }
      free(*(void **)(a5 + 8));
      *(_QWORD *)(a5 + 8) = 0;
    }
    *(_QWORD *)a5 = 0;
    mic_arcfour = 851968;
    checksum = 12;
    goto LABEL_30;
  }
  *a1 = v10;
  return 851968;
}

uint64_t _gsskrb5_canon_name(_DWORD *a1, _krb5_context *a2, int a3, uint64_t a4, const krb5_principal_data *a5, krb5_principal *a6)
{
  krb5_magic magic;
  const char *v13;
  const char **data;
  uint64_t result;

  *a1 = 0;
  if (krb5_principal_get_type() != -1202)
  {
    result = krb5_copy_principal(a2, a5, a6);
    goto LABEL_13;
  }
  if (a3)
  {
    magic = a5->realm.magic;
    if (!magic)
      return 0x20000;
    if (magic == 1)
    {
      v13 = 0;
      data = (const char **)a5->realm.data;
    }
    else
    {
      data = (const char **)a5->realm.data;
      v13 = data[1];
    }
    result = krb5_sname_to_principal(a2, v13, *data, 3, a6);
    goto LABEL_13;
  }
  LODWORD(result) = krb5_copy_principal(a2, a5, a6);
  if (!(_DWORD)result)
  {
    krb5_principal_set_type();
    if (!a4)
      return 0;
    result = krb5_principal_set_realm();
LABEL_13:
    if (!(_DWORD)result)
      return result;
  }
  *a1 = result;
  return 851968;
}

uint64_t _gsskrb5_import_name(_DWORD *a1, unint64_t *a2, gss_const_OID a, _QWORD *a4)
{
  return _gss_mech_import_name(a1, (const void **)&__gss_krb5_mechanism_oid_desc, (uint64_t)&krb5_names, a2, a, a4);
}

uint64_t _gsspku2u_import_name(_DWORD *a1, unint64_t *a2, gss_const_OID a, _QWORD *a4)
{
  return _gss_mech_import_name(a1, (const void **)&__gss_pku2u_mechanism_oid_desc, (uint64_t)&pku2u_names, a2, a, a4);
}

uint64_t _gssiakerb_import_name(_DWORD *a1, unint64_t *a2, gss_const_OID a, _QWORD *a4)
{
  return _gss_mech_import_name(a1, (const void **)&__gss_iakerb_mechanism_oid_desc, (uint64_t)&iakerb_names, a2, a, a4);
}

uint64_t _gsskrb5_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *a3)
{
  return _gss_mech_inquire_names_for_mech(a1, (uint64_t)&krb5_names, a3);
}

uint64_t _gsspku2u_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *a3)
{
  return _gss_mech_inquire_names_for_mech(a1, (uint64_t)&pku2u_names, a3);
}

uint64_t _gssiakerb_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *a3)
{
  return _gss_mech_inquire_names_for_mech(a1, (uint64_t)&iakerb_names, a3);
}

uint64_t import_hostbased_name(_DWORD *a1, gss_const_OID a, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  int v8;
  uint64_t result;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  size_t v14;
  int principal;
  krb5_context v16;

  v16 = 0;
  gss_oid_equal(a, &__gss_pku2u_mechanism_oid_desc);
  v8 = __ApplePrivate__gsskrb5_init(&v16);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  v10 = (char *)malloc_type_malloc(*(_QWORD *)a3 + 1, 0x28DDAD19uLL);
  if (!v10)
  {
    *a1 = 12;
    return 851968;
  }
  v11 = v10;
  memcpy(v10, *(const void **)(a3 + 8), *(_QWORD *)a3);
  v11[*(_QWORD *)a3] = 0;
  v12 = strchr(v11, 64);
  if (v12)
  {
    v13 = v12;
    if (v12[1])
    {
      *v12 = 0;
      v14 = strlen(v12 + 1);
      if (v14)
      {
        if (v13[v14] == 46)
          v13[v14] = 0;
      }
    }
  }
  principal = krb5_make_principal();
  free(v11);
  *a1 = principal;
  if ((principal + 1765328251) < 2)
    return 0x20000;
  if (principal)
    return 851968;
  krb5_principal_set_type();
  result = 0;
  *a5 = 0;
  return result;
}

uint64_t import_krb5_principal(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  krb5_principal v9;
  krb5_context v10;

  v9 = 0;
  v10 = 0;
  LODWORD(result) = __ApplePrivate__gsskrb5_init(&v10);
  if ((_DWORD)result || (result = krb5_copy_principal(v10, **(krb5_const_principal **)(a3 + 8), &v9), (_DWORD)result))
  {
    *a1 = result;
    return 851968;
  }
  else
  {
    *a5 = v9;
  }
  return result;
}

uint64_t import_krb5_name(krb5_error_code *a1, const gss_OID_desc *a2, uint64_t a3, const gss_OID_desc *a4, krb5_principal *a5)
{
  krb5_error_code v10;
  char *v11;
  char *v12;
  krb5_principal_data *v13;
  krb5_principal_data *v14;
  char *v15;
  krb5_error_code v16;
  krb5_error_code v17;
  uint64_t result;
  krb5_principal v19;
  int v20;
  krb5_principal v21;
  krb5_context v22;

  v21 = 0;
  v22 = 0;
  v10 = __ApplePrivate__gsskrb5_init(&v22);
  if (v10)
  {
    *a1 = v10;
    return 851968;
  }
  v11 = (char *)malloc_type_malloc(*(_QWORD *)a3 + 1, 0xEC1F776AuLL);
  if (!v11)
    goto LABEL_21;
  v12 = v11;
  memcpy(v11, *(const void **)(a3 + 8), *(_QWORD *)a3);
  v12[*(_QWORD *)a3] = 0;
  if (*v12 == 64)
  {
    v13 = (krb5_principal_data *)malloc_type_calloc(1uLL, 0x20uLL, 0x10900408A8AD7E9uLL);
    v21 = v13;
    if (v13)
    {
      v14 = v13;
      v15 = strdup(v12 + 1);
      v14->data = (krb5_data *)v15;
      if (!v15)
      {
        free(v12);
        free(v14);
        return 851968;
      }
      goto LABEL_12;
    }
    free(v12);
LABEL_21:
    *a1 = 12;
    return 851968;
  }
  v16 = krb5_parse_name(v22, v12, &v21);
  if (v16)
  {
    v17 = v16;
    free(v12);
    *a1 = v17;
    if ((v17 + 1765328251) >= 2)
      return 851968;
    else
      return 0x20000;
  }
LABEL_12:
  if (a2 && gss_oid_equal(a2, &__gss_pku2u_mechanism_oid_desc) && !strchr(v12, 64))
    krb5_principal_set_realm();
  free(v12);
  v19 = v21;
  if (v21->realm.magic == 2)
  {
    v20 = gss_oid_equal(a4, &__gss_krb5_nt_principal_name_referral_oid_desc);
    v19 = v21;
    if (v20)
    {
      krb5_principal_set_type();
      v19 = v21;
    }
  }
  result = 0;
  *a5 = v19;
  return result;
}

uint64_t import_uuid_name(_DWORD *a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5)
{
  int principal;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  krb5_context v14;
  char __s[16];
  __int128 v16;
  int v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  principal = __ApplePrivate__gsskrb5_init(&v14);
  if (principal)
    goto LABEL_2;
  if (*a3 < 0x24uLL
    || (v10 = a3[1],
        v11 = *(_DWORD *)(v10 + 32),
        v12 = *(_OWORD *)(v10 + 16),
        *(_OWORD *)__s = *(_OWORD *)v10,
        v16 = v12,
        v17 = v11,
        v18 = 0,
        strspn(__s, "0123456789abcdefABCDEF-") != 36))
  {
    principal = 0;
    v9 = 0x20000;
    goto LABEL_8;
  }
  principal = krb5_make_principal();
  if (principal)
  {
LABEL_2:
    v9 = 851968;
  }
  else
  {
    krb5_principal_set_type();
    principal = 0;
    v9 = 0;
    *a5 = 0;
  }
LABEL_8:
  *a1 = principal;
  return v9;
}

uint64_t import_dn_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  *a1 = 0;
  return 851968;
}

uint64_t import_pku2u_export_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  *a1 = 0;
  return 851968;
}

uint64_t _gsskrb5_import_sec_context(int *a1, uint64_t a2, uint64_t *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  pthread_mutex_t *v10;
  uint64_t v11;
  pthread_mutex_t *v12;
  krb5_error_code v13;
  krb5_address *v14;
  krb5_address *v15;
  _krb5_auth_context *v16;
  krb5_principal_data *v17;
  krb5_principal_data *v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  krb5_keyblock v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  _QWORD v31[3];
  krb5_context v32;

  v32 = 0;
  memset(v31, 0, sizeof(v31));
  memset(v30, 0, sizeof(v30));
  v28 = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  memset(&v25, 0, sizeof(v25));
  v23 = 0;
  v24 = 0;
  v5 = __ApplePrivate__gsskrb5_init(&v32);
  if (v5)
  {
    *a1 = v5;
    return 851968;
  }
  *a3 = 0;
  v8 = krb5_storage_from_mem();
  if (!v8)
  {
    *a1 = 12;
    return 851968;
  }
  v9 = v8;
  v10 = (pthread_mutex_t *)malloc_type_calloc(1uLL, 0x138uLL, 0x10B00402E3E967EuLL);
  if (!v10)
  {
    *a1 = 12;
    krb5_storage_free();
    return 851968;
  }
  v11 = (uint64_t)v10;
  v12 = v10 + 2;
  pthread_mutex_init(v10 + 2, 0);
  v13 = krb5_auth_con_init(v32, (krb5_auth_context *)(v11 + 40));
  if (!v13)
  {
    *a1 = 0;
    if (!krb5_ret_int32())
    {
      v16 = *(_krb5_auth_context **)(v11 + 40);
      if (!krb5_ret_int32())
      {
        *(_DWORD *)v16 = v24;
        v19 = BYTE4(v24);
        if ((v24 & 0x100000000) != 0)
        {
          v14 = (krb5_address *)v31;
          if (krb5_ret_address())
            goto LABEL_14;
          v14 = (krb5_address *)v31;
          v19 = BYTE4(v24);
        }
        else
        {
          v14 = 0;
        }
        if ((v19 & 2) != 0)
        {
          v15 = (krb5_address *)v30;
          if (krb5_ret_address())
            goto LABEL_15;
        }
        else
        {
          v15 = 0;
        }
        krb5_auth_con_setaddrs(v32, v16, v14, v15);
        if (v14)
          krb5_free_address();
        if (v15)
          krb5_free_address();
        if (!krb5_ret_int16() && !krb5_ret_int16())
        {
          v20 = BYTE4(v24);
          if ((v24 & 0x400000000) != 0)
          {
            if (krb5_ret_keyblock())
              goto LABEL_13;
            krb5_auth_con_setkey();
            krb5_free_keyblock_contents(v32, &v25);
            v20 = BYTE4(v24);
          }
          if ((v20 & 8) != 0)
          {
            if (krb5_ret_keyblock())
              goto LABEL_13;
            krb5_auth_con_setlocalsubkey();
            krb5_free_keyblock_contents(v32, &v25);
            v20 = BYTE4(v24);
          }
          if ((v20 & 0x10) != 0)
          {
            if (krb5_ret_keyblock())
              goto LABEL_13;
            krb5_auth_con_setremotesubkey();
            krb5_free_keyblock_contents(v32, &v25);
          }
          if (!krb5_ret_uint32() && !krb5_ret_uint32() && !krb5_ret_int32())
          {
            *((_DWORD *)v16 + 22) = v24;
            if (!krb5_ret_int32())
            {
              *((_DWORD *)v16 + 23) = v24;
              if (!krb5_ret_data())
              {
                v26 = v28;
                v27 = v29;
                if (_gsskrb5_import_name(a1, &v26, &__gss_c_nt_export_name_oid_desc, &v23))
                {
                  v21 = _gsskrb5_import_name(a1, &v26, 0, &v23);
                  if ((_DWORD)v21)
                    goto LABEL_56;
                }
                *(_QWORD *)(v11 + 56) = v23;
                krb5_data_free();
                if (krb5_ret_data())
                  goto LABEL_58;
                v26 = v28;
                v27 = v29;
                if (_gsskrb5_import_name(a1, &v26, &__gss_c_nt_export_name_oid_desc, &v23))
                {
                  v21 = _gsskrb5_import_name(a1, &v26, 0, &v23);
                  if ((_DWORD)v21)
                  {
LABEL_56:
                    v22 = v21;
                    krb5_data_free();
                    v14 = 0;
                    v15 = 0;
                    v6 = v22;
                    goto LABEL_16;
                  }
                }
                *(_QWORD *)(v11 + 64) = v23;
                krb5_data_free();
                if (krb5_ret_int32()
                  || (*(_DWORD *)(v11 + 72) = v24, krb5_ret_int32())
                  || (*(_DWORD *)(v11 + 76) = v24, krb5_ret_int32()))
                {
LABEL_58:
                  v6 = 0;
                }
                else
                {
                  *(_QWORD *)(v11 + 120) = (int)v24;
                  v6 = _gssapi_msg_order_import(a1, v9, (void **)(v11 + 24));
                  if (!(_DWORD)v6)
                  {
                    krb5_storage_free();
                    _gsskrb5i_is_cfx(v32, v11, (*(_DWORD *)(v11 + 76) & 1) == 0);
                    *a3 = v11;
                    return v6;
                  }
                }
                v14 = 0;
                v15 = 0;
                goto LABEL_16;
              }
            }
          }
        }
      }
    }
LABEL_13:
    v14 = 0;
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  v14 = 0;
  v15 = 0;
  *a1 = v13;
LABEL_15:
  v6 = 851968;
LABEL_16:
  krb5_auth_con_free(v32, *(krb5_auth_context *)(v11 + 40));
  v17 = *(krb5_principal_data **)(v11 + 56);
  if (v17)
    krb5_free_principal(v32, v17);
  v18 = *(krb5_principal_data **)(v11 + 64);
  if (v18)
    krb5_free_principal(v32, v18);
  if (v14)
    krb5_free_address();
  if (v15)
    krb5_free_address();
  if (*(_QWORD *)(v11 + 24))
    _gssapi_msg_order_destroy((void **)(v11 + 24));
  pthread_mutex_destroy(v12);
  krb5_storage_free();
  free((void *)v11);
  *a3 = 0;
  return v6;
}

uint64_t _gsskrb5_create_ctx(krb5_error_code *a1, _QWORD *a2, _krb5_context *a3, uint64_t a4, uint64_t a5)
{
  char *v10;
  char *v11;
  char *v12;
  krb5_error_code v13;
  krb5_auth_context *v14;
  krb5_error_code v15;
  uint64_t result;
  krb5_error_code v17;

  *a2 = 0;
  v10 = (char *)malloc_type_calloc(1uLL, 0x138uLL, 0x10B00402E3E967EuLL);
  if (!v10)
  {
    *a1 = 12;
    return 851968;
  }
  v11 = v10;
  *(_OWORD *)(v10 + 40) = 0u;
  v12 = v10 + 40;
  *((_QWORD *)v10 + 4) = a5;
  *((_QWORD *)v10 + 24) = 0;
  *(_OWORD *)(v10 + 56) = 0u;
  *((_QWORD *)v10 + 9) = 0;
  *((_QWORD *)v10 + 13) = 0;
  *((_QWORD *)v10 + 14) = 0;
  *((_QWORD *)v10 + 12) = 0;
  krb5_data_zero();
  pthread_mutex_init((pthread_mutex_t *)(v12 + 88), 0);
  v13 = krb5_auth_con_init(a3, (krb5_auth_context *)v12);
  if (v13)
  {
    *a1 = v13;
LABEL_7:
    pthread_mutex_destroy((pthread_mutex_t *)(v12 + 88));
    return 851968;
  }
  v14 = (krb5_auth_context *)(v12 + 8);
  v15 = krb5_auth_con_init(a3, (krb5_auth_context *)v12 + 1);
  if (v15)
  {
    *a1 = v15;
    krb5_auth_con_free(a3, *(krb5_auth_context *)v12);
    goto LABEL_7;
  }
  v17 = set_addresses(a3, *(_krb5_auth_context **)v12, a4);
  if (v17 || (v17 = set_addresses(a3, *v14, a4)) != 0)
  {
    *a1 = v17;
    krb5_auth_con_free(a3, *(krb5_auth_context *)v12);
    krb5_auth_con_free(a3, *v14);
    pthread_mutex_destroy((pthread_mutex_t *)(v12 + 88));
    return 0x40000;
  }
  else
  {
    krb5_auth_con_addflags();
    krb5_auth_con_addflags();
    result = 0;
    *a2 = v11;
  }
  return result;
}

uint64_t set_addresses(_krb5_context *a1, _krb5_auth_context *a2, uint64_t a3)
{
  _WORD *v6;
  uint64_t v7;
  krb5_address v9;
  krb5_address v10;

  if (!a3 || *(_QWORD *)(a3 + 48) != 4)
    return 0;
  memset(&v10, 0, sizeof(v10));
  memset(&v9, 0, sizeof(v9));
  v6 = *(_WORD **)(a3 + 56);
  *((_WORD *)a2 + 12) = *v6;
  *((_WORD *)a2 + 13) = v6[1];
  v7 = _gsskrb5i_address_to_krb5addr((uint64_t)a1, *(_DWORD *)(a3 + 24), a3 + 32);
  if (!(_DWORD)v7)
  {
    v7 = _gsskrb5i_address_to_krb5addr((uint64_t)a1, *(_DWORD *)a3, a3 + 8);
    if (!(_DWORD)v7)
    {
      v7 = krb5_auth_con_setaddrs(a1, a2, &v10, &v9);
      krb5_free_address();
    }
    krb5_free_address();
  }
  return v7;
}

uint64_t _gsskrb5_iakerb_parse_header(_DWORD *a1, uint64_t a2, uint64_t a3, unint64_t *a4, _QWORD *a5)
{
  uint64_t result;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  unsigned __int16 v13;

  result = _gssapi_decapsulate(a1, a4, &v13, a5, (uint64_t)&__gss_iakerb_mechanism_oid_desc);
  if (!(_DWORD)result)
  {
    if (v13 == 261)
    {
      v10 = decode_IAKERB_HEADER();
      if (v10)
      {
        *a1 = v10;
        return 851968;
      }
      else
      {
        v11 = a5[1];
        *a5 = *a5;
        a5[1] = v11;
        v12 = *(void **)(a3 + 272);
        if (v12)
          free(v12);
        *(_QWORD *)(a3 + 272) = strdup(0);
        free_IAKERB_HEADER();
        return 0;
      }
    }
    else
    {
      v9 = v13;
      *a1 = 0;
      if (v9 == 3)
        return 851968;
      else
        return 589824;
    }
  }
  return result;
}

uint64_t _gsskrb5_iakerb_make_header(int *a1, _krb5_context *a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t *a6)
{
  size_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  krb5_data *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  size_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = 0;
  v25 = a4;
  v26 = *(_QWORD *)(a3 + 256);
  v11 = length_IAKERB_HEADER();
  v12 = malloc_type_malloc(v11, 0x23B8F8D0uLL);
  if (!v12)
  {
    v15 = 12;
    goto LABEL_5;
  }
  v13 = v12;
  v14 = encode_IAKERB_HEADER();
  if (v14)
  {
    v15 = v14;
    free(v13);
LABEL_5:
    *a1 = v15;
    return 851968;
  }
  if (v11 == v24)
  {
    v18 = *(krb5_data **)(a3 + 256);
    if (v18)
    {
      krb5_free_data(a2, v18);
      *(_QWORD *)(a3 + 256) = 0;
    }
    v22 = *(_QWORD *)a5 + v11;
    v19 = (char *)malloc_type_malloc(v22, 0xFE310CE9uLL);
    v23 = v19;
    if (v19)
    {
      v20 = v19;
      memcpy(v19, v13, v11);
      memcpy(&v20[v11], *(const void **)(a5 + 8), *(_QWORD *)a5);
      free(v13);
      v16 = _gsskrb5_encapsulate(a1, (uint64_t)&v22, a6, "\x05\x01", *(const void ***)(a3 + 32));
      free(v23);
      return v16;
    }
    free(v13);
    *a1 = 12;
    return 851968;
  }
  v21 = heim_abort();
  return _gsskrb5_init_sec_context(v21);
}

uint64_t _gsskrb5_init_sec_context(krb5_error_code *a1, uint64_t a2, void **a3, const krb5_principal_data *a4, const gss_OID_desc *a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9, _QWORD *a10, _QWORD *a11, _DWORD *a12, _DWORD *a13)
{
  krb5_error_code v21;
  uint64_t ctx;
  _DWORD *v23;
  void *v24;
  char *v25;
  _krb5_context *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _DWORD *v35;
  uint64_t (*v36)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  const krb5_principal_data *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const krb5_principal_data *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _krb5_ccache *v53;
  int *v54;
  char v55;
  void *v56;
  void **v57;
  unsigned int v58;
  pthread_mutex_t *v59;
  gss_OID_desc *b;
  krb5_context context;
  int check[3];

  context = 0;
  v21 = __ApplePrivate__gsskrb5_init(&context);
  if (v21)
  {
    *a1 = v21;
    return 851968;
  }
  *a11 = 0;
  a11[1] = 0;
  if (!a3)
  {
LABEL_33:
    *a1 = 0;
    return 51183616;
  }
  v23 = a13;
  if (a12)
    *a12 = 0;
  if (a13)
    *a13 = 0;
  if (!a4)
  {
    if (a10)
      *a10 = 0;
    *a1 = 0;
    return 0x20000;
  }
  if (a2 && *(_DWORD *)(a2 + 32) >= 2u)
  {
    krb5_set_error_message(context, 35224071, "ISC: Credentials not of usage type initiator or both");
    *a1 = 35224071;
    return 655360;
  }
  b = &__gss_krb5_mechanism_oid_desc;
  if (gss_oid_equal(a5, &__gss_krb5_mechanism_oid_desc))
  {
    v24 = init_krb5_auth;
  }
  else
  {
    b = &__gss_iakerb_mechanism_oid_desc;
    if (gss_oid_equal(a5, &__gss_iakerb_mechanism_oid_desc))
    {
      v24 = init_iakerb_auth;
    }
    else
    {
      b = &__gss_pku2u_mechanism_oid_desc;
      if (!gss_oid_equal(a5, &__gss_pku2u_mechanism_oid_desc))
        return 0x10000;
      v24 = init_pku2u_auth;
    }
  }
  if (a9 && *a9)
  {
    v25 = (char *)*a3;
    if (!*a3)
      goto LABEL_33;
LABEL_37:
    v57 = a3;
    v35 = v23;
    v59 = (pthread_mutex_t *)(v25 + 128);
    pthread_mutex_lock((pthread_mutex_t *)v25 + 2);
    if (a10)
      *a10 = *((_QWORD *)v25 + 4);
    v36 = (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v25 + 11);
    while (1)
    {
      v37 = ((uint64_t (*)(krb5_error_code *, uint64_t, char *, krb5_context, const krb5_principal_data *, gss_OID_desc *, uint64_t, uint64_t, uint64_t, _QWORD *, _QWORD *, _DWORD *, _DWORD *))v36)(a1, a2, v25, context, a4, b, a6, a7, a8, a9, a11, a12, v35);
      ctx = v37;
      if ((_DWORD)v37)
        break;
      v36 = (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v25 + 11);
      if (v36 == step_completed || *a11)
        goto LABEL_45;
    }
    if (v37 < 0x10000)
    {
LABEL_45:
      pthread_mutex_unlock(v59);
      return ctx;
    }
    v53 = (_krb5_ccache *)*((_QWORD *)v25 + 13);
    if (v53 && (v25[76] & 0x10) != 0)
      krb5_cc_close(context, v53);
    *((_QWORD *)v25 + 13) = 0;
    pthread_mutex_unlock(v59);
    check[0] = 0;
    _gsskrb5_delete_sec_context(check, v57, 0);
    return ctx;
  }
  v56 = v24;
  v58 = a6;
  v26 = context;
  check[0] = 0;
  pthread_mutex_lock(&nc_mutex);
  if (!nc[0])
  {
    notify_register_check("com.apple.Kerberos.cache.changed", &dword_2545AA14C);
    notify_register_check("com.apple.system.clock_set", &dword_2545AA150);
    nc[0] = 1;
  }
  notify_check(dword_2545AA14C, check);
  if (check[0] || (notify_check(dword_2545AA150, check), check[0]))
  {
    v27 = 6u;
    do
    {
      free_entry(v26, &nc[v27]);
      v27 += 10;
    }
    while (v27 != 76);
    _gss_mg_log(1, "krb5-isc: got a notification, drop negative cache", v28, v29, v30, v31, v32, v33, v55);
    pthread_mutex_unlock(&nc_mutex);
LABEL_32:
    if (*a3)
      goto LABEL_33;
    ctx = _gsskrb5_create_ctx(a1, a3, context, a8, (uint64_t)b);
    if ((_DWORD)ctx)
      return ctx;
    v25 = (char *)*a3;
    v23 = a13;
    *((_QWORD *)*a3 + 11) = v56;
    a6 = v58;
    goto LABEL_37;
  }
  v38 = 0;
  while (1)
  {
    if (!gss_oid_equal(*(gss_const_OID *)&nc[v38 + 6], b))
      goto LABEL_56;
    v39 = *(const krb5_principal_data **)&nc[v38 + 10];
    if (!v39 || !krb5_principal_compare(v26, a4, v39))
      goto LABEL_56;
    if (a2 && *(_QWORD *)a2)
      break;
    if (!*(_QWORD *)&nc[v38 + 8])
      goto LABEL_63;
LABEL_56:
    v38 += 10;
    if (v38 == 70)
    {
      pthread_mutex_unlock(&nc_mutex);
      _gss_mg_log(1, "gss-isc: not negative cache", v47, v48, v49, v50, v51, v52, v55);
      a7 = a7;
      goto LABEL_32;
    }
  }
  v46 = *(const krb5_principal_data **)&nc[v38 + 8];
  if (!v46 || !krb5_principal_compare(v26, *(krb5_const_principal *)a2, v46))
    goto LABEL_56;
LABEL_63:
  v54 = &nc[v38];
  *a1 = v54[13];
  ctx = v54[12];
  _gss_mg_log(1, "gss-isc: negative cache %d/%d - %s", v40, v41, v42, v43, v44, v45, v54[12]);
  krb5_set_error_message(v26, *a1, "%s (negative cache)", *((const char **)v54 + 7));
  pthread_mutex_unlock(&nc_mutex);
  a7 = a7;
  if (!(_DWORD)ctx)
    goto LABEL_32;
  return ctx;
}

uint64_t init_krb5_auth(krb5_error_code *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, const krb5_principal_data *a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  krb5_ccache *v19;
  _krb5_ccache *v20;
  krb5_error_code principal;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ImpersonateBundle;
  const char *v30;
  uint64_t full_name;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  krb5_error_code v38;
  uint64_t creds;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  krb5_principal_data *v46;
  krb5_principal *v47;
  char *v48;
  const char *error_message;
  uint64_t v50;
  char v52;
  char v53;
  char *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  krb5_data v58;

  *(_QWORD *)&v58.magic = 0;
  v58.data = 0;
  v56 = 0;
  v57 = 0;
  v55 = 0;
  krb5_data_zero();
  krb5_data_zero();
  *a1 = 0;
  v19 = (krb5_ccache *)(a3 + 104);
  if (!*(_QWORD *)(a3 + 104))
  {
    if (a2)
    {
      v20 = *(_krb5_ccache **)(a2 + 40);
      *v19 = v20;
    }
    else
    {
      principal = krb5_cc_default(a4, (krb5_ccache *)(a3 + 104));
      if (principal)
        goto LABEL_20;
      *(_DWORD *)(a3 + 76) |= 0x10u;
      v20 = *(_krb5_ccache **)(a3 + 104);
    }
    principal = krb5_cc_get_principal(a4, v20, (krb5_principal *)(a3 + 56));
    if (!principal)
      goto LABEL_5;
LABEL_20:
    v38 = principal;
    *a1 = principal;
    full_name = 851968;
    goto LABEL_31;
  }
LABEL_5:
  krb5_set_default_in_tkt_etypes();
  if (krb5_cc_get_config(a4, *v19, 0, "realm-config", &v58))
  {
    v22 = 1;
  }
  else
  {
    v22 = *(_QWORD *)&v58.magic && (*v58.data & 2) == 0;
    krb5_data_free();
  }
  ImpersonateBundle = HeimCredGetImpersonateBundle();
  if (ImpersonateBundle)
    v30 = "gss-krb5: ISC disabled kerberos DNS canonalization";
  else
    v30 = "gss-krb5: ISC no AppVPN";
  _gss_mg_log(1, v30, v23, v24, v25, v26, v27, v28, v52);
  if (!_gss_mg_log_level(1))
    goto LABEL_22;
  v54 = 0;
  full_name = krb5_unparse_name(a4, *(krb5_const_principal *)(a3 + 56), &v54);
  if (!(_DWORD)full_name)
  {
    full_name = krb5_cc_get_full_name();
    if ((_DWORD)full_name)
    {
      krb5_xfree();
      goto LABEL_29;
    }
    _gss_mg_log(1, "gss-krb5: ISC client: %s cache: %s", v32, v33, v34, v35, v36, v37, (char)v54);
    krb5_xfree();
    krb5_xfree();
LABEL_22:
    creds = gsskrb5_get_creds(a1, a4, *(_krb5_ccache **)(a3 + 104), a3, a5, 0, a8, a13);
    full_name = creds;
    if (v22 && (_DWORD)creds && !ImpersonateBundle)
      full_name = gsskrb5_get_creds(a1, a4, *(_krb5_ccache **)(a3 + 104), a3, a5, 1, a8, a13);
    if (!(_DWORD)full_name)
    {
      *(_QWORD *)(a3 + 120) = *(_QWORD *)(*(_QWORD *)(a3 + 96) + 56);
      full_name = _gss_DES3_get_mic_compat(a1, a3, a4);
      if (!(_DWORD)full_name)
      {
        full_name = _gsskrb5_lifetime_left(a1, a4, *(_QWORD *)(a3 + 120), &v55);
        if (!(_DWORD)full_name)
        {
          if (v55)
          {
            full_name = 0;
            *(_QWORD *)(a3 + 88) = step_setup_keys;
            return full_name;
          }
          _gss_mg_log(1, "gss-krb5: credentials expired", v40, v41, v42, v43, v44, v45, v53);
          v38 = 0;
          *a1 = 0;
          full_name = 786432;
          goto LABEL_31;
        }
      }
    }
  }
LABEL_29:
  if (full_name < 0x10000)
    return full_name;
  v38 = *a1;
LABEL_31:
  v46 = *(krb5_principal_data **)(a3 + 32);
  pthread_mutex_lock(&nc_mutex);
  free_entry(a4, &qword_2545AA160[5 * qword_2545AA158]);
  v47 = (krb5_principal *)&qword_2545AA160[5 * qword_2545AA158];
  *v47 = v46;
  krb5_copy_principal(a4, a5, v47 + 2);
  if (a2 && *(_QWORD *)a2)
    krb5_copy_principal(a4, *(krb5_const_principal *)a2, (krb5_principal *)&nc[10 * qword_2545AA158 + 8]);
  v48 = (char *)&qword_2545AA160[5 * qword_2545AA158];
  *((_DWORD *)v48 + 6) = full_name;
  *((_DWORD *)v48 + 7) = v38;
  error_message = krb5_get_error_message(a4, v38);
  v50 = qword_2545AA158;
  qword_2545AA160[5 * qword_2545AA158 + 4] = error_message;
  qword_2545AA158 = (v50 + 1) % 7uLL;
  pthread_mutex_unlock(&nc_mutex);
  return full_name;
}

uint64_t init_iakerb_auth(int *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, const krb5_principal_data *a5)
{
  uint64_t v10;
  krb5_error_code v11;
  int v12;
  uint64_t result;
  const char *v14;
  char *v15;
  _krb5_ccache *v16;
  uint64_t (*v17)(krb5_error_code *, uint64_t, uint64_t, _krb5_context *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, size_t *);

  v10 = krb5_storage_emem();
  *(_QWORD *)(a3 + 224) = v10;
  if (!v10)
    goto LABEL_9;
  if (!a2)
    return 851968;
  v11 = krb5_copy_principal(a4, *(krb5_const_principal *)a2, (krb5_principal *)(a3 + 56));
  if (!v11)
  {
    v11 = krb5_copy_principal(a4, a5, (krb5_principal *)(a3 + 64));
    if (!v11)
    {
      krb5_principal_set_realm();
      v14 = *(const char **)(a2 + 128);
      if (v14)
      {
        v15 = strdup(v14);
        *(_QWORD *)(a3 + 264) = v15;
        if (!v15)
        {
LABEL_9:
          result = 851968;
          v12 = 12;
          goto LABEL_10;
        }
      }
      else if (*(_QWORD *)(a2 + 120))
      {
        *(_QWORD *)(a3 + 216) = heim_retain();
      }
      else if ((*(_BYTE *)(a2 + 8) & 4) == 0)
      {
        result = 851968;
        v12 = 22;
        goto LABEL_10;
      }
      v16 = *(_krb5_ccache **)(a2 + 40);
      *(_QWORD *)(a3 + 104) = v16;
      krb5_cc_get_config(a4, v16, 0, "FriendlyName", (krb5_data *)(a3 + 280));
      krb5_cc_get_config(a4, *(krb5_ccache *)(a3 + 104), 0, "lkdc-hostname", (krb5_data *)(a3 + 296));
      v12 = 0;
      result = 0;
      v17 = step_iakerb_auth_tgs;
      if ((*(_DWORD *)(a2 + 8) & 4) == 0)
        v17 = step_iakerb_auth_as;
      *(_QWORD *)(a3 + 88) = v17;
      goto LABEL_10;
    }
  }
  v12 = v11;
  result = 851968;
LABEL_10:
  *a1 = v12;
  return result;
}

uint64_t init_pku2u_auth(krb5_error_code *a1, uint64_t a2, _QWORD *a3, _krb5_context *a4)
{
  uint64_t v8;
  krb5_error_code v9;
  int v10;
  uint64_t v11;
  krb5_error_code v12;
  krb5_error_code v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  krb5_error_code inited;
  int subject;
  _DWORD *v22;
  size_t v23;
  void *v24;
  void *v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  size_t v38;
  void *v39;
  uint64_t v40;
  _DWORD *v41;
  uint64_t v42;
  krb5_principal v43;

  v43 = 0;
  *a1 = 0;
  v8 = krb5_storage_emem();
  a3[28] = v8;
  if (!v8)
  {
    v10 = 12;
    goto LABEL_11;
  }
  if (a2)
  {
    if (*(_QWORD *)(a2 + 120))
    {
      v9 = krb5_copy_principal(a4, *(krb5_const_principal *)a2, &v43);
      if (v9)
      {
        *a1 = v9;
        return 851968;
      }
      a3[27] = heim_retain();
      goto LABEL_16;
    }
    v10 = 22;
LABEL_11:
    *a1 = v10;
    return 851968;
  }
  *(_QWORD *)&v34 = 0;
  v11 = _gsspku2u_acquire_cred(a1, 0, 0xFFFFFFFFLL, 0, 1u, &v34, 0, 0);
  if ((_DWORD)v11)
    return v11;
  v12 = krb5_copy_principal(a4, *(krb5_const_principal *)v34, &v43);
  if (v12)
  {
    v13 = v12;
    _gsskrb5_release_cred(a1, (uint64_t *)&v34);
    *a1 = v13;
    return 851968;
  }
  a3[27] = heim_retain();
  _gsskrb5_release_cred(a1, (uint64_t *)&v34);
LABEL_16:
  inited = setup_icc(a4, a3, (uint64_t)v43, v15, v16, v17, v18, v19);
  if (inited || (inited = krb5_init_creds_set_service()) != 0)
  {
    *a1 = inited;
LABEL_19:
    v11 = 851968;
    goto LABEL_20;
  }
  if (!krb5_principal_is_null())
  {
    v11 = _krb5_init_creds_set_pku2u();
    if ((_DWORD)v11)
    {
LABEL_31:
      *a1 = v11;
      goto LABEL_19;
    }
LABEL_27:
    a3[11] = step_pku2u_auth;
LABEL_20:
    if (v43)
      krb5_free_principal(a4, v43);
    return v11;
  }
  v40 = 0;
  v36 = 0;
  v37 = 0;
  v42 = 0;
  v34 = 0u;
  v35 = 0u;
  v41 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B204088662708uLL);
  if (!v41)
  {
    *a1 = 12;
    goto LABEL_19;
  }
  subject = hx509_cert_get_subject();
  if (subject)
  {
    LODWORD(v11) = subject;
LABEL_30:
    free_InitiatorNameAssertion();
    goto LABEL_31;
  }
  LODWORD(v11) = MEMORY[0x20BD1394C](v40, &v34);
  hx509_name_free();
  if ((_DWORD)v11)
    goto LABEL_30;
  v22 = v41;
  *v41 = 2;
  v22[2] = 4;
  v22[4] = 1;
  v22[6] = DWORD2(v35);
  *((_QWORD *)v22 + 4) = v36;
  v23 = length_InitiatorNameAssertion();
  v38 = v23;
  v24 = malloc_type_malloc(v23, 0x40862202uLL);
  v39 = v24;
  if (!v24)
  {
LABEL_35:
    free_InitiatorNameAssertion();
    goto LABEL_19;
  }
  v25 = v24;
  if (encode_InitiatorNameAssertion())
  {
    free(v25);
    v39 = 0;
    goto LABEL_35;
  }
  free_InitiatorNameAssertion();
  if (v37 == v23)
  {
    v11 = _krb5_init_creds_set_pku2u();
    krb5_data_free();
    if ((_DWORD)v11)
      goto LABEL_31;
    goto LABEL_27;
  }
  v26 = (_DWORD *)krb5_abortx();
  return step_completed(v26, v27, v28, v29, v30, v31, v32, v33);
}

uint64_t step_completed(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v10;

  _gsskrb5_set_status(22, "init_sec_context called one time too many", a3, a4, a5, a6, a7, a8, v10);
  *a1 = 22;
  return 327680;
}

uint64_t gsskrb5_get_creds(krb5_error_code *a1, krb5_context a2, _krb5_ccache *a3, uint64_t a4, const krb5_principal_data *a5, int a6, unsigned int a7, _DWORD *a8)
{
  krb5_principal_data *v16;
  krb5_principal *v17;
  krb5_creds *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  krb5_error_code credentials;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  krb5_error_code v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  krb5_timestamp v49[2];
  int v50;
  _BYTE v51[128];
  __int128 v52;

  v17 = (krb5_principal *)(a4 + 64);
  v16 = *(krb5_principal_data **)(a4 + 64);
  if (v16)
  {
    krb5_free_principal(a2, v16);
    *v17 = 0;
  }
  v19 = a4 + 96;
  v18 = *(krb5_creds **)(a4 + 96);
  if (v18)
  {
    krb5_free_creds(a2, v18);
    *(_QWORD *)v19 = 0;
  }
  result = _gsskrb5_canon_name(a1, a2, a6, *(_QWORD *)(a4 + 56), a5, v17);
  if (!(_DWORD)result)
  {
    v50 = 0;
    if (_krb5_have_debug())
    {
      *(_QWORD *)v51 = 0;
      if (!krb5_unparse_name(a2, *v17, (char **)v51))
      {
        _gss_mg_log(1, "gss-krb5: ISC server %s %s", v21, v22, v23, v24, v25, v26, v51[0]);
        krb5_xfree();
      }
    }
    v52 = 0u;
    memset(&v51[16], 0, 112);
    *(_OWORD *)v51 = *(_OWORD *)(a4 + 56);
    if (a7 - 1 <= 0xFFFFFFFD)
    {
      *(_QWORD *)v49 = 0;
      krb5_timeofday(a2, v49);
      *(_QWORD *)&v51[56] = *(_QWORD *)v49 + a7;
    }
    credentials = krb5_get_credentials(a2, 0x200000, a3, (krb5_creds *)v51, (krb5_creds **)(a4 + 96));
    if (credentials)
    {
      v34 = credentials;
      _gss_mg_log(1, "gss-krb5: ISC get cred failed with %d %s", v28, v29, v30, v31, v32, v33, credentials);
      *a1 = v34;
      return 851968;
    }
    else
    {
      if (_krb5_have_debug())
      {
        *(_QWORD *)v49 = 0;
        if (!krb5_unparse_name(a2, *(krb5_const_principal *)(*(_QWORD *)v19 + 8), (char **)v49))
        {
          _gss_mg_log(1, "gss-krb5: ISC will use %s", v35, v36, v37, v38, v39, v40, v49[0]);
          krb5_xfree();
        }
      }
      v41 = *(_QWORD *)(*(_QWORD *)(a4 + 96) + 56);
      *(_QWORD *)(a4 + 120) = v41;
      result = _gsskrb5_lifetime_left(a1, a2, v41, &v50);
      if (!(_DWORD)result)
      {
        if (v50)
        {
          result = 0;
          if (a8)
            *a8 = v50;
        }
        else
        {
          _gss_mg_log(1, "gss-krb5: credentials expired", v42, v43, v44, v45, v46, v47, v48);
          *a1 = 0;
          return 786432;
        }
      }
    }
  }
  return result;
}

uint64_t step_setup_keys(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9, unint64_t *a10, size_t *a11, _DWORD *a12, int *a13)
{
  uint64_t result;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  _krb5_context *v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;

  if (*(_QWORD *)(a3 + 96))
  {
    krb5_auth_con_setkey();
    krb5_auth_con_setkey();
    result = krb5_auth_con_generatelocalsubkey();
    if ((_DWORD)result)
    {
      *a1 = result;
      return 851968;
    }
    else
    {
      *(_QWORD *)(a3 + 88) = init_auth_step;
    }
  }
  else
  {
    v16 = (int *)heim_abort();
    return init_auth_step(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10, a11, a12, a13);
  }
  return result;
}

uint64_t init_auth_step(int *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, uint64_t a5, uint64_t a6, __int16 a7, uint64_t a8, _QWORD *a9, unint64_t *a10, size_t *a11, _DWORD *a12, int *a13)
{
  _krb5_ccache *v18;
  unsigned int v19;
  _krb5_ccache *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int principal;
  int v29;
  const char *v30;
  int v31;
  int v32;
  int v33;
  uint64_t checksum;
  uint64_t v36;
  _krb5_ccache *v37;
  unsigned int v38;
  int *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  size_t v44;
  int *v45;
  int v46;
  uint64_t v47;
  krb5_context v48;
  int v49;
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;
  size_t v54;
  void *v55;
  krb5_data v56;
  _QWORD v57[2];
  _QWORD v58[5];
  size_t v59;
  size_t v60;
  uint64_t v61;
  krb5_data v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;

  v60 = 0;
  v61 = 0;
  v59 = 0;
  v57[0] = 0;
  v57[1] = 0;
  *(_QWORD *)&v56.magic = 0;
  v56.data = 0;
  v54 = 0;
  v55 = 0;
  krb5_data_zero();
  krb5_data_zero();
  krb5_data_zero();
  memset(v58, 0, sizeof(v58));
  *a1 = 0;
  if ((*(_BYTE *)(*(_QWORD *)(a3 + 96) + 137) & 0x20) != 0
    || (v18 = *(_krb5_ccache **)(a3 + 104)) == 0
    || (*(_QWORD *)&v62.magic = 0, v62.data = 0, krb5_cc_get_config(a4, v18, 0, "realm-config", &v62)))
  {
    if ((a7 & 0x8000) == 0)
    {
LABEL_5:
      v19 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    if (!*(_QWORD *)&v62.magic || (*v62.data & 1) == 0)
      a7 &= 0x7FFEu;
    krb5_data_free();
    if ((a7 & 0x8000) == 0)
      goto LABEL_5;
  }
  v19 = (*(unsigned __int8 *)(*(_QWORD *)(a3 + 96) + 137) << 26 >> 31) & 0x8001;
LABEL_11:
  if (v19 & 1 | a7 & 1 && (v20 = *(_krb5_ccache **)(a3 + 104)) != 0)
  {
    v21 = *(_QWORD *)(a3 + 64);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v62 = (krb5_data)0;
    krb5_data_zero();
    principal = krb5_cc_get_principal(a4, v20, (krb5_principal *)&v62);
    if (!principal)
    {
      v53 = *(_QWORD *)(*(_QWORD *)&v62.magic + 24);
      principal = krb5_make_principal();
      if (!principal)
      {
        *((_QWORD *)&v65 + 1) = 0;
        if (*(_DWORD *)(v21 + 8) > 1u)
        {
          KDCOptions2int(6);
          principal = krb5_get_forwarded_creds();
        }
        else
        {
          principal = 35224071;
          krb5_set_error_message(a4, 35224071, "ISC: only support forwarding to services", "krbtgt", v53, 0);
        }
      }
    }
    v30 = "ok-as-delegate";
    if (v19 < 0x8000)
      v30 = "delegate";
    _gss_mg_log(1, "gss-krb5: delegation %s -> %s", v22, v23, v24, v25, v26, v27, (char)v30);
    if (principal)
      v29 = 0;
    else
      v29 = v19 | a7 & 1;
    if (*(_QWORD *)&v62.magic)
      krb5_free_principal(a4, *(krb5_principal *)&v62.magic);
    if (v62.data)
      krb5_free_principal(a4, (krb5_principal)v62.data);
  }
  else
  {
    v29 = 0;
  }
  v31 = a7 & 2;
  if ((a7 & 0x1000) != 0)
    v31 = 4098;
  v32 = a7 & 0x603C | v31 | v29;
  if (!a2 || (*(_BYTE *)(a2 + 8) & 2) == 0)
    v32 |= 0x30u;
  v33 = *(_DWORD *)(a3 + 76) | 1;
  *(_DWORD *)(a3 + 72) = v32 | 0x100;
  *(_DWORD *)(a3 + 76) = v33;
  checksum = krb5_crypto_init();
  if ((_DWORD)checksum)
    goto LABEL_34;
  if (!*(_QWORD *)(a3 + 224))
    goto LABEL_47;
  v62.data = 0;
  *(_QWORD *)&v63 = 0;
  *(_QWORD *)&v62.magic = 0;
  checksum = krb5_storage_to_data();
  krb5_storage_free();
  *(_QWORD *)(a3 + 224) = 0;
  if ((_DWORD)checksum || (checksum = krb5_create_checksum(), krb5_data_free(), (_DWORD)checksum))
  {
LABEL_34:
    if (v61)
      krb5_crypto_destroy();
    free_Checksum();
    krb5_data_free();
    krb5_data_free();
    return checksum;
  }
  v54 = length_GSS_KRB5_FINISHED();
  v55 = malloc_type_malloc(v54, 0xC5A132BFuLL);
  if (!v55)
  {
    checksum = 12;
    goto LABEL_45;
  }
  v36 = encode_GSS_KRB5_FINISHED();
  if ((_DWORD)v36)
  {
    checksum = v36;
    free(v55);
    v55 = 0;
LABEL_45:
    free_GSS_KRB5_FINISHED();
    goto LABEL_34;
  }
  free_GSS_KRB5_FINISHED();
  if (!v54)
  {
LABEL_47:
    checksum = _gsskrb5_create_8003_checksum(a1, (uint64_t)a4, v61, a9, v32, v57, &v54, v58);
    if ((_DWORD)checksum)
      goto LABEL_34;
    v37 = *(_krb5_ccache **)(a3 + 104);
    if (v37 && !krb5_cc_get_config(a4, v37, *(krb5_const_principal *)(a3 + 64), "time-offset", &v56))
    {
      if (*(_QWORD *)&v56.magic == 4)
      {
        v38 = bswap32(*(_DWORD *)v56.data);
        krb5_data_free();
        if (v38)
        {
          krb5_get_kdc_sec_offset();
          krb5_set_kdc_sec_offset();
        }
LABEL_55:
        if ((v32 & 2) != 0)
        {
          v40 = _krb5_auth_con_setup_pfs();
          if (v40)
          {
            *a1 = v40;
LABEL_68:
            checksum = 851968;
            goto LABEL_34;
          }
          v39 = a1;
        }
        else
        {
          v39 = a1;
        }
        v41 = _krb5_build_authenticator();
        if (v41)
        {
          v42 = v41;
          if (v38)
            krb5_set_kdc_sec_offset();
          *v39 = v42;
        }
        else
        {
          v43 = krb5_build_ap_req();
          if (v38)
            krb5_set_kdc_sec_offset();
          if (!v43)
          {
            if ((v32 & 0x1000) != 0)
            {
              v44 = v60;
              *a11 = v59;
              a11[1] = v44;
            }
            else
            {
              checksum = _gsskrb5_encapsulate(v39, (uint64_t)&v59, a11, &word_209772C5F, *(const void ***)(a3 + 32));
              krb5_data_free();
              if ((_DWORD)checksum)
                goto LABEL_34;
            }
            if (v61)
              krb5_crypto_destroy();
            free_Checksum();
            krb5_data_free();
            krb5_data_free();
            if ((v32 & 2) == 0)
              return initiator_ready(v39, a3, a4, a12);
            *(_QWORD *)(a3 + 88) = wait_repl_mutual;
            return 1;
          }
          *v39 = v43;
        }
        goto LABEL_68;
      }
      krb5_data_free();
    }
    v38 = 0;
    goto LABEL_55;
  }
  v45 = (int *)krb5_abortx();
  return wait_repl_mutual(v45, v46, v47, v48, v49, v50, v51, v52, (uint64_t)a9, a10, a11, a12, a13);
}

uint64_t wait_repl_mutual(int *a1, int a2, uint64_t a3, krb5_context a4, int a5, int a6, __int16 a7, int a8, uint64_t a9, unint64_t *a10, _QWORD *a11, _DWORD *a12, int *a13)
{
  uint64_t result;
  char *v18;
  krb5_error_code v19;
  krb5_error_code v20;
  krb5_error_code v21;
  char *data;
  krb5_data v23;
  krb5_int32 v24[2];
  krb5_ap_rep_enc_part *v25;
  krb5_data v26;

  *(_QWORD *)&v26.magic = 0;
  v26.data = 0;
  v25 = 0;
  *a11 = 0;
  a11[1] = 0;
  if ((*(_BYTE *)(a3 + 73) & 0x10) != 0)
  {
    v18 = (char *)a10[1];
    *(_QWORD *)&v26.magic = *a10;
    v26.data = v18;
    v19 = krb5_rd_rep(a4, *(krb5_auth_context *)(a3 + 40), &v26, &v25);
    if (v19)
    {
      v20 = v19;
      if (!_gsskrb5_decapsulate(a1, a10, &v26, &word_209772C5C, (uint64_t)&__gss_krb5_mechanism_oid_desc))
        return handle_error_packet(a1, a4, a3, *(uint64_t *)&v26.magic, v26.data);
      *a1 = v20;
      return 851968;
    }
    goto LABEL_11;
  }
  result = _gsskrb5_decapsulate(a1, a10, &v26, &word_209772C62, *(_QWORD *)(a3 + 32));
  if (!(_DWORD)result)
  {
    v21 = krb5_rd_rep(a4, *(krb5_auth_context *)(a3 + 40), &v26, &v25);
    if (v21)
    {
LABEL_15:
      *a1 = v21;
      return 851968;
    }
LABEL_11:
    krb5_free_ap_rep_enc_part(a4, v25);
    *a1 = 0;
    if (a13)
    {
      result = _gsskrb5_lifetime_left(a1, a4, *(_QWORD *)(a3 + 120), a13);
      if ((_DWORD)result)
        return result;
    }
    if ((a7 & 0x1000) != 0)
    {
      v23.data = 0;
      *(_QWORD *)v24 = 0;
      *(_QWORD *)&v23.magic = 0;
      krb5_auth_con_getremoteseqnumber(a4, *(krb5_auth_context *)(a3 + 40), v24);
      krb5_auth_con_getlocalseqnumber(a4, *(krb5_auth_context *)(a3 + 40), &v24[1]);
      krb5_auth_con_setlocalseqnumber();
      v21 = krb5_mk_rep(a4, *(krb5_auth_context *)(a3 + 40), &v23);
      if (v21)
        goto LABEL_15;
      krb5_auth_con_setlocalseqnumber();
      data = v23.data;
      *a11 = *(_QWORD *)&v23.magic;
      a11[1] = data;
    }
    return initiator_ready(a1, a3, a4, a12);
  }
  if ((_DWORD)result == 589824)
  {
    result = _gsskrb5_decapsulate(a1, a10, &v26, &word_209772C5C, *(_QWORD *)(a3 + 32));
    if (!(_DWORD)result)
      return handle_error_packet(a1, a4, a3, *(uint64_t *)&v26.magic, v26.data);
  }
  return result;
}

uint64_t initiator_ready(int *a1, uint64_t a2, krb5_context a3, _DWORD *a4)
{
  krb5_creds *v8;
  int v9;
  uint64_t result;
  krb5_int32 v11;

  v8 = *(krb5_creds **)(a2 + 96);
  if (v8)
  {
    krb5_free_creds(a3, v8);
    *(_QWORD *)(a2 + 96) = 0;
  }
  if ((*(_BYTE *)(a2 + 76) & 0x10) != 0)
    krb5_cc_close(a3, *(krb5_ccache *)(a2 + 104));
  v11 = 0;
  *(_QWORD *)(a2 + 104) = 0;
  krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v11);
  _gsskrb5i_is_cfx(a3, a2, 0);
  v9 = _gssapi_msg_order_f(*(_DWORD *)(a2 + 72));
  result = _gssapi_msg_order_create(a1, (_QWORD *)(a2 + 24), v9, v11, 0);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 88) = step_completed;
    *(_DWORD *)(a2 + 76) |= 2u;
    if (a4)
      *a4 = *(_DWORD *)(a2 + 72);
  }
  return result;
}

uint64_t handle_error_packet(int *a1, krb5_context a2, uint64_t a3, uint64_t a4, char *a5)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _krb5_context *v39;
  char v40;
  int v41;
  _BYTE creds[144];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  krb5_data v50;

  *(_QWORD *)&v50.magic = a4;
  v50.data = a5;
  if (*(uint64_t (**)(int, int, int, krb5_context, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 88) == wait_repl_mutual)
  {
    v49 = 0;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v8 = krb5_rd_error(a2, &v50, (krb5_error **)&v43);
    if (v8)
      goto LABEL_15;
    v8 = krb5_error_from_rd_error();
    _gss_mg_log(1, "gss-krb5: server return KRB-ERROR with error code %d", v9, v10, v11, v12, v13, v14, v8);
    if (v8 == -1765328347)
    {
      if (*(_QWORD *)(a3 + 104))
      {
        v23 = *(_DWORD *)(a3 + 76);
        if ((v23 & 0x100) == 0)
        {
          v24 = *((_QWORD *)&v44 + 1);
          v25 = v24 - time(0);
          _gss_mg_encode_be_uint32(v25, &v41);
          *(_QWORD *)creds = 4;
          *(_QWORD *)&creds[8] = &v41;
          krb5_cc_set_config(a2, *(krb5_ccache *)(a3 + 104), *(krb5_const_principal *)(a3 + 64), "time-offset", (krb5_data *)creds);
          _gss_mg_log(1, "gss-krb5: time skew of %d", v26, v27, v28, v29, v30, v31, v25);
          *(_QWORD *)(a3 + 88) = init_auth_step;
          v23 = *(_DWORD *)(a3 + 76);
        }
        v22 = v23 | 0x100;
        goto LABEL_13;
      }
    }
    else
    {
      if (v8 != -1765328343)
      {
        if (v8 == -1765328324 && v49)
        {
          *(_QWORD *)creds = 0;
          *(_QWORD *)&creds[8] = 0;
          _gss_mg_log(1, "gss-krb5: trying to decode a KRB5KRB_ERR_GENERIC", v15, v16, v17, v18, v19, v20, v40);
          if (decode_KERB_ERROR_DATA())
          {
            v8 = -1765328324;
LABEL_21:
            *a1 = v8;
            return 851968;
          }
          _gss_mg_log(1, "gss-krb5: got an KERB_ERROR_DATA of type %d", v33, v34, v35, v36, v37, v38, creds[0]);
          free_KERB_ERROR_DATA();
        }
        goto LABEL_14;
      }
      if (*(_QWORD *)(a3 + 104))
      {
        v21 = *(_DWORD *)(a3 + 76);
        if ((v21 & 0x200) == 0)
        {
          memset(creds, 0, sizeof(creds));
          _gss_mg_log(1, "gss-krb5: trying to renew ticket", v15, v16, v17, v18, v19, v20, v40);
          krb5_cc_clear_mcred();
          *(_OWORD *)creds = *(_OWORD *)(a3 + 56);
          krb5_cc_remove_cred(a2, *(krb5_ccache *)(a3 + 104), 0, (krb5_creds *)creds);
          *(_QWORD *)(a3 + 88) = init_krb5_auth;
          v21 = *(_DWORD *)(a3 + 76);
        }
        v22 = v21 | 0x200;
LABEL_13:
        *(_DWORD *)(a3 + 76) = v22;
      }
    }
LABEL_14:
    free_KRB_ERROR();
LABEL_15:
    if (*(uint64_t (**)(int, int, int, krb5_context, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 88) != wait_repl_mutual)
      return 0;
    goto LABEL_21;
  }
  v39 = (_krb5_context *)heim_abort();
  return free_entry(v39);
}

void free_entry(krb5_context a1, _QWORD *a2)
{
  krb5_principal_data *v4;
  krb5_principal_data *v5;
  const char *v6;

  v4 = (krb5_principal_data *)a2[2];
  if (v4)
    krb5_free_principal(a1, v4);
  v5 = (krb5_principal_data *)a2[1];
  if (v5)
    krb5_free_principal(a1, v5);
  v6 = (const char *)a2[4];
  if (v6)
    krb5_free_error_message(a1, v6);
  a2[4] = 0;
  a2[1] = 0;
  a2[2] = 0;
}

uint64_t step_iakerb_auth_tgs(krb5_error_code *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t *a10, size_t *a11)
{
  uint64_t v14;
  krb5_error *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  krb5_error *v23;
  uint64_t creds;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];

  v35 = 0;
  memset(v36, 0, sizeof(v36));
  v34 = 0;
  *a1 = 0;
  krb5_data_zero();
  if (*(_QWORD *)(a3 + 248))
  {
    krb5_storage_write();
    v14 = _gsskrb5_iakerb_parse_header(a1, (uint64_t)a4, a3, a10, v36);
    if ((_DWORD)v14)
      return v14;
  }
  else
  {
    v15 = (krb5_error *)krb5_tkt_creds_init();
    if ((_DWORD)v15)
    {
      *a1 = (int)v15;
      _gsskrb5_error_token(a1, *(const void ***)(a3 + 32), a4, v15, 0, 0, a11);
      return 851968;
    }
  }
  v16 = krb5_tkt_creds_step();
  if ((_DWORD)v16)
  {
    v23 = (krb5_error *)v16;
    _gss_mg_log(1, "gss-iakerb: tkt_creds_step: %d", v17, v18, v19, v20, v21, v22, v16);
LABEL_8:
    _gsskrb5_error_token(a1, *(const void ***)(a3 + 32), a4, v23, 0, 0, a11);
    *a1 = (int)v23;
    return 851968;
  }
  if (!v34)
  {
    _gss_mg_log(1, "gss-iakerb: going to state setup-keys", v17, v18, v19, v20, v21, v22, v33);
    creds = krb5_tkt_creds_get_creds();
    if (!(_DWORD)creds)
    {
      krb5_tkt_creds_free();
      v14 = 0;
      *(_QWORD *)(a3 + 248) = 0;
      *(_QWORD *)(a3 + 120) = *(_QWORD *)(*(_QWORD *)(a3 + 96) + 56);
      *(_QWORD *)(a3 + 88) = step_setup_keys;
      return v14;
    }
    v23 = (krb5_error *)creds;
    _gss_mg_log(1, "gss-iakerb: tkt_get_creds: %d", v26, v27, v28, v29, v30, v31, creds);
    goto LABEL_8;
  }
  v32 = heim_abort();
  return step_iakerb_auth_as(v32);
}

uint64_t step_iakerb_auth_as(krb5_error_code *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t *a10, size_t *a11)
{
  uint64_t result;
  krb5_error_code persistent;
  uint64_t inited;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  krb5_error *v23;
  krb5_error *creds;
  const char *v25;
  uint64_t v26;
  krb5_principal_data *v27;
  char v28;
  krb5_data v29;
  krb5_principal principal[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[0] = 0;
  v43[1] = 0;
  v41 = 0;
  v42 = 0;
  v40 = 0;
  v39 = 0;
  if (*(_QWORD *)(a3 + 240))
  {
    krb5_storage_write();
    result = _gsskrb5_iakerb_parse_header(a1, (uint64_t)a4, a3, a10, v43);
    if ((_DWORD)result)
      return result;
  }
  else
  {
    persistent = setup_icc(a4, (_QWORD *)a3, *(_QWORD *)(a3 + 56), (uint64_t)a4, a5, a6, a7, a8);
    if (persistent)
      goto LABEL_5;
    krb5_data_zero();
  }
  inited = krb5_init_creds_step();
  if ((_DWORD)inited)
  {
    v23 = (krb5_error *)inited;
    _gss_mg_log(1, "gss-iakerb: init_creds_step: %d", v17, v18, v19, v20, v21, v22, inited);
    _gsskrb5_error_token(a1, *(const void ***)(a3 + 32), a4, v23, 0, 0, a11);
    *a1 = (int)v23;
    return 851968;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  *(_OWORD *)principal = 0u;
  _gss_mg_log(1, "gss-iakerb: going to state auth-tgs", v17, v18, v19, v20, v21, v22, v28);
  creds = (krb5_error *)krb5_init_creds_get_creds();
  if ((_DWORD)creds)
  {
    *a1 = (int)creds;
    _gsskrb5_error_token(a1, *(const void ***)(a3 + 32), a4, creds, 0, 0, a11);
    return 851968;
  }
  krb5_cc_initialize(a4, *(krb5_ccache *)(a3 + 104), principal[0]);
  krb5_cc_store_cred(a4, *(krb5_ccache *)(a3 + 104), (krb5_creds *)principal);
  v25 = *(const char **)(a3 + 264);
  if (v25)
  {
    v29.data = *(char **)(a3 + 264);
    *(_QWORD *)&v29.magic = strlen(v25);
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "password", &v29);
  }
  if (*(_QWORD *)(a3 + 216))
  {
    *(_QWORD *)&v29.magic = 0;
    v29.data = 0;
    persistent = hx509_cert_get_persistent();
    if (!persistent)
    {
      krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "certificate-ref", &v29);
      der_free_octet_string();
      goto LABEL_18;
    }
LABEL_5:
    *a1 = persistent;
    return 851968;
  }
LABEL_18:
  if (*(_QWORD *)(a3 + 280))
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "FriendlyName", (krb5_data *)(a3 + 280));
  if (*(_QWORD *)(a3 + 296))
  {
    v29 = (krb5_data)xmmword_24C20F180;
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "lkdc-hostname", (krb5_data *)(a3 + 296));
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "nah-created", &v29);
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "iakerb", &v29);
  }
  v27 = *(krb5_principal_data **)(a3 + 56);
  v26 = a3 + 56;
  krb5_free_principal(a4, v27);
  krb5_copy_principal(a4, principal[0], (krb5_principal *)v26);
  krb5_free_cred_contents(a4, (krb5_creds *)principal);
  result = 0;
  *(_QWORD *)(v26 + 32) = step_iakerb_auth_tgs;
  return result;
}

uint64_t setup_icc(_krb5_context *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  krb5_get_init_creds_opt **v8;
  const char *v11;
  uint64_t result;
  uint64_t v13;

  v8 = (krb5_get_init_creds_opt **)(a2 + 29);
  if (a2[29])
  {
    heim_abort();
    goto LABEL_19;
  }
  if (a2[27])
    v11 = "yes";
  else
    v11 = "no";
  _gss_mg_log(1, "gss-iakerb: setup_icc: cert: %s passwd: %s", a3, a4, a5, a6, a7, a8, (char)v11);
  result = krb5_get_init_creds_opt_alloc(a1, v8);
  if ((_DWORD)result)
    return result;
  krb5_get_init_creds_opt_set_canonicalize((krb5_get_init_creds_opt *)a1, a2[29]);
  if (a2[27])
  {
    result = krb5_get_init_creds_opt_set_pkinit();
    if ((_DWORD)result)
      return result;
  }
  result = krb5_init_creds_init();
  if ((_DWORD)result)
    return result;
  v13 = a2[27];
  if (!a2[33])
  {
    if (v13)
      goto LABEL_14;
LABEL_19:
    heim_abort();
  }
  if (v13)
  {
LABEL_14:
    result = krb5_init_creds_set_pkinit_client_cert();
    if ((_DWORD)result)
      return result;
    if (!a2[33])
      return 0;
  }
  result = krb5_init_creds_set_password();
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t step_pku2u_auth(int *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t *a10, size_t *a11)
{
  uint64_t result;
  int inited;
  int creds;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  int v20;

  v20 = 0;
  v19[0] = 0;
  v19[1] = 0;
  v18[0] = 0;
  v18[1] = 0;
  krb5_data_zero();
  if (a10 && *a10)
  {
    krb5_storage_write();
    result = _gsskrb5_decapsulate(a1, a10, v19, &word_209772C65, *(_QWORD *)(a3 + 32));
    if ((_DWORD)result)
      return result;
  }
  else
  {
    krb5_data_zero();
  }
  inited = krb5_init_creds_step();
  if (inited)
    goto LABEL_7;
  if ((v20 & 1) != 0)
  {
    creds = _gsskrb5_encapsulate(a1, (uint64_t)v18, a11, &word_209772C68, *(const void ***)(a3 + 32));
    if (!creds)
    {
      krb5_storage_write();
      result = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v17 = malloc_type_calloc(1uLL, 0x90uLL, 0x10A0040AAA52FDDuLL);
  *(_QWORD *)(a3 + 96) = v17;
  if (!v17)
  {
    creds = 12;
    goto LABEL_8;
  }
  creds = krb5_init_creds_get_creds();
  krb5_init_creds_free();
  *(_QWORD *)(a3 + 240) = 0;
  if (!creds)
  {
    inited = krb5_copy_principal(a4, **(krb5_const_principal **)(a3 + 96), (krb5_principal *)(a3 + 56));
    if (inited)
    {
LABEL_7:
      creds = inited;
      goto LABEL_8;
    }
    result = krb5_copy_principal(a4, *(krb5_const_principal *)(*(_QWORD *)(a3 + 96) + 8), (krb5_principal *)(a3 + 64));
    creds = result;
    if (!(_DWORD)result)
    {
      *(_QWORD *)(a3 + 88) = step_setup_keys;
      goto LABEL_9;
    }
  }
LABEL_8:
  result = 851968;
LABEL_9:
  *a1 = creds;
  return result;
}

uint64_t __ApplePrivate__gsskrb5_init(krb5_context *a1)
{
  _krb5_context *v2;
  uint64_t inited;

  heim_base_once_f();
  v2 = (_krb5_context *)pthread_getspecific(context_key);
  *a1 = v2;
  if (v2)
  {
    krb5_reload_config();
    return 0;
  }
  else
  {
    inited = krb5_init_context(a1);
    if (!(_DWORD)inited)
    {
      inited = pthread_setspecific(context_key, *a1);
      if ((_DWORD)inited)
      {
        heim_release();
        *a1 = 0;
      }
    }
  }
  return inited;
}

uint64_t once_func()
{
  _gsskrb5_kGSSICPassword = heim_string_create();
  _gsskrb5_kGSSICCertificate = heim_string_create();
  _gsskrb5_kGSSICSiteName = heim_string_create();
  _gsskrb5_kGSSICKerberosCacheName = heim_string_create();
  _gsskrb5_kGSSICLKDCHostname = heim_string_create();
  _gsskrb5_kGSSICAppIdentifierACL = heim_string_create();
  _gsskrb5_kGSSICAppleSourceApp = heim_string_create();
  _gsskrb5_kGSSICAppleSourceAppAuditToken = heim_string_create();
  _gsskrb5_kGSSICAppleSourceAppPID = heim_string_create();
  _gsskrb5_kGSSICAppleSourceAppUUID = heim_string_create();
  _gsskrb5_kGSSICAppleSourceAppSigningIdentity = heim_string_create();
  _gsskrb5_kGSSICVerifyCredential = heim_string_create();
  _gsskrb5_kGSSICVerifyCredentialAcceptorName = heim_string_create();
  _gsskrb5_kGSSICCreateNewCredential = heim_string_create();
  _gsskrb5_kGSSICAuthenticationContext = heim_string_create();
  return pthread_key_create((pthread_key_t *)&context_key, (void (__cdecl *)(void *))destroy_context);
}

uint64_t destroy_context(uint64_t result)
{
  if (result)
    return heim_release();
  return result;
}

uint64_t _gsskrb5_inquire_context(_DWORD *a1, uint64_t a2, krb5_principal_data **a3, krb5_principal_data **a4, int *a5, _QWORD *a6, _DWORD *a7, int *a8, int *a9)
{
  int v17;
  uint64_t v18;
  const krb5_principal_data *v19;
  const krb5_principal_data *v20;
  krb5_context v22;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v22 = 0;
  v17 = __ApplePrivate__gsskrb5_init(&v22);
  if (v17)
  {
    *a1 = v17;
    return 851968;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  if (a3)
  {
    v19 = *(const krb5_principal_data **)(a2 + 56);
    if (v19)
    {
      v18 = _gsskrb5_duplicate_name(a1, v19, a3);
      if (!(_DWORD)v18)
        goto LABEL_10;
    }
    else
    {
      v18 = 2529638933;
    }
LABEL_27:
    _gsskrb5_release_name(0, a3);
    goto LABEL_28;
  }
LABEL_10:
  if (a4)
  {
    v20 = *(const krb5_principal_data **)(a2 + 64);
    if (!v20)
    {
      v18 = 2529638934;
      goto LABEL_26;
    }
    v18 = _gsskrb5_duplicate_name(a1, v20, a4);
    if ((_DWORD)v18)
      goto LABEL_26;
  }
  if (!a5 || (v18 = _gsskrb5_lifetime_left(a1, v22, *(_QWORD *)(a2 + 120), a5), !(_DWORD)v18))
  {
    if (a6)
      *a6 = *(_QWORD *)(a2 + 32);
    if (a7)
      *a7 = *(_DWORD *)(a2 + 72);
    if (a8)
      *a8 = *(_DWORD *)(a2 + 76) & 1;
    if (a9)
      *a9 = *(_DWORD *)(a2 + 76) & 2;
    *a1 = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    return 0;
  }
LABEL_26:
  if (a3)
    goto LABEL_27;
LABEL_28:
  if (a4)
    _gsskrb5_release_name(0, a4);
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
  return v18;
}

uint64_t _gsskrb5_inquire_cred_by_mech(krb5_error_code *a1, uint64_t a2, uint64_t a3, krb5_ccache *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t result;
  int v11;
  int v12;
  uint64_t v13;

  v13 = 0;
  result = _gsskrb5_inquire_cred(a1, a2, a4, (int *)&v13, (int *)&v13 + 1, 0);
  if (!(_DWORD)result)
  {
    if (a5)
    {
      if (HIDWORD(v13) >= 2)
        v11 = 0;
      else
        v11 = v13;
      *a5 = v11;
    }
    if (a6)
    {
      if ((v13 & 0xFFFFFFFD00000000) != 0)
        v12 = 0;
      else
        v12 = v13;
      *a6 = v12;
    }
    if (a7)
      *a7 = HIDWORD(v13);
  }
  return result;
}

uint64_t _gsskrb5_inquire_cred_by_oid(OM_uint32 *a1, uint64_t a2, const gss_OID_desc *a3, gss_buffer_set_t *a4)
{
  OM_uint32 v8;
  uint64_t result;
  pthread_mutex_t *v10;
  int v11;
  pthread_mutex_t *v12;
  int krbtgt;
  int inited;
  pthread_mutex_t *v15;
  void *v16;
  void *v17;
  OM_uint32 v18;
  int full_name;
  pthread_mutex_t *v20;
  OM_uint32 v21;
  krb5_error_code v22;
  void *v23;
  OM_uint32 v24;
  int v25;
  pthread_mutex_t *v26;
  char *v27;
  pthread_mutex_t *v28;
  const char *v29;
  void *v30;
  krb5_error_code principal;
  OM_uint32 kdc_cred;
  OM_uint32 credentials;
  uint64_t realm;
  char *__s;
  krb5_cc_cursor cursor;
  gss_buffer_desc_struct member_buffer;
  krb5_context context;
  krb5_verify_init_creds_opt k5_vic_options[2];
  char *v40[2];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  member_buffer.value = 0;
  context = 0;
  member_buffer.length = 0;
  v8 = __ApplePrivate__gsskrb5_init(&context);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  if (!gss_oid_equal(a3, &__gss_krb5_copy_ccache_x_oid_desc))
  {
    if (gss_oid_equal(a3, &__gss_c_cred_validate_oid_desc))
    {
      k5_vic_options[0] = 0;
      k5_vic_options[1] = 0;
      cursor = 0;
      if (!*(_QWORD *)(a2 + 40) || !*(_QWORD *)a2)
        return 851968;
      krb5_verify_init_creds_opt_init(k5_vic_options);
      krb5_verify_init_creds_opt_set_ap_req_nofail(k5_vic_options, 1);
      v12 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
      krbtgt = _krb5_get_krbtgt();
      if (krbtgt)
      {
        inited = krbtgt;
        pthread_mutex_unlock(v12);
        goto LABEL_47;
      }
      inited = krb5_verify_init_creds(context, (krb5_creds *)cursor, 0, 0, (krb5_ccache *)(a2 + 40), k5_vic_options);
      krb5_free_creds(context, (krb5_creds *)cursor);
      pthread_mutex_unlock(v12);
      if (inited)
        goto LABEL_47;
      return 0;
    }
    if (gss_oid_equal(a3, &__gss_c_nt_uuid_oid_desc))
    {
      k5_vic_options[0] = 0;
      k5_vic_options[1] = 0;
      v15 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
      if (*(_QWORD *)(a2 + 40))
      {
        inited = krb5_cc_get_uuid();
        pthread_mutex_unlock(v15);
        if (inited)
          goto LABEL_47;
        v16 = (void *)krb5_uuid_to_string();
        if (v16)
        {
          v17 = v16;
          member_buffer.value = v16;
          member_buffer.length = strlen((const char *)v16);
          v18 = gss_add_buffer_set_member(a1, &member_buffer, a4);
          free(v17);
          if (v18)
            _gsskrb5_clear_status();
          return 0;
        }
        v25 = 12;
LABEL_50:
        *a1 = v25;
        return 851968;
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
LABEL_49:
      v25 = 22;
      goto LABEL_50;
    }
    if (gss_oid_equal(a3, &__gss_c_cred_diag_oid_desc))
    {
      __s = 0;
      cursor = 0;
      v46 = 0u;
      v47 = 0u;
      v45 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      *(_OWORD *)&k5_vic_options[0].flags = 0u;
      *(_OWORD *)v40 = 0u;
      if (!*(_QWORD *)(a2 + 40))
      {
        full_name = 22;
        goto LABEL_66;
      }
      full_name = krb5_cc_get_full_name();
      v20 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
      if (full_name)
      {
LABEL_66:
        *a1 = full_name;
        return 851968;
      }
      member_buffer.value = __s;
      member_buffer.length = strlen(__s);
      v21 = gss_add_buffer_set_member(a1, &member_buffer, a4);
      free(__s);
      if (v21)
        _gsskrb5_clear_status();
      if (rtbl_create())
      {
        rtbl_add_column();
        rtbl_add_column();
        rtbl_add_column();
        rtbl_add_column();
        rtbl_set_separator();
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
        full_name = krb5_cc_start_seq_get(context, *(krb5_ccache *)(a2 + 40), &cursor);
        if (full_name)
          goto LABEL_44;
        full_name = krb5_cc_next_cred(context, *(krb5_ccache *)(a2 + 40), &cursor, (krb5_creds *)k5_vic_options);
        if (!full_name)
        {
          do
          {
            if (!krb5_unparse_name(context, *(krb5_const_principal *)&k5_vic_options[1], &__s))
            {
              rtbl_add_column_entry();
              free(__s);
              printable_time(v42);
              rtbl_add_column_entry();
              if (time(0) < *((uint64_t *)&v42 + 1))
                printable_time(*((time_t *)&v42 + 1));
              rtbl_add_column_entry();
              if (!krb5_enctype_to_string((krb5_enctype)context, (char *)LODWORD(v40[0]), (size_t)&__s))
              {
                rtbl_add_column_entry();
                free(__s);
              }
            }
            krb5_free_cred_contents(context, (krb5_creds *)k5_vic_options);
            v22 = krb5_cc_next_cred(context, *(krb5_ccache *)(a2 + 40), &cursor, (krb5_creds *)k5_vic_options);
          }
          while (!v22);
          full_name = v22;
        }
        krb5_cc_end_seq_get(context, *(krb5_ccache *)(a2 + 40), &cursor);
        if (full_name != -1765328242)
        {
LABEL_44:
          pthread_mutex_unlock(v20);
          rtbl_destroy();
          if (!full_name)
            return 0;
          goto LABEL_66;
        }
        v23 = (void *)rtbl_format_str();
        member_buffer.value = v23;
        if (v23)
        {
          member_buffer.length = strlen((const char *)v23);
          v24 = gss_add_buffer_set_member(a1, &member_buffer, a4);
          free(member_buffer.value);
          if (v24)
            _gsskrb5_clear_status();
          member_buffer.length = 0;
          member_buffer.value = 0;
          gss_add_buffer_set_member(a1, &member_buffer, a4);
          full_name = 0;
          goto LABEL_44;
        }
      }
      full_name = 12;
      goto LABEL_66;
    }
    if (gss_oid_equal(a3, &__gss_c_cred_set_default_oid_desc))
    {
      v26 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
      if (!*(_QWORD *)(a2 + 40))
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
        inited = 22;
        goto LABEL_47;
      }
      inited = krb5_cc_switch();
      pthread_mutex_unlock(v26);
      if (inited)
      {
LABEL_47:
        *a1 = inited;
        return 851968;
      }
    }
    else
    {
      if (!gss_oid_equal(a3, &__gss_c_cred_get_default_oid_desc))
      {
        if (!gss_oid_equal(a3, &__gss_c_cred_renew_oid_desc))
          goto LABEL_49;
        cursor = 0;
        *(_OWORD *)&k5_vic_options[0].flags = 0u;
        *(_OWORD *)v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
        principal = krb5_cc_get_principal(context, *(krb5_ccache *)(a2 + 40), (krb5_principal *)k5_vic_options);
        if (principal)
        {
          kdc_cred = principal;
          pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
        }
        else
        {
          realm = krb5_principal_get_realm();
          credentials = krb5_make_principal();
          if (credentials
            || (credentials = krb5_get_credentials(context, 1, *(krb5_ccache *)(a2 + 40), (krb5_creds *)k5_vic_options, (krb5_creds **)&cursor)) != 0)
          {
            kdc_cred = credentials;
            pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
            krb5_free_cred_contents(context, (krb5_creds *)k5_vic_options);
          }
          else
          {
            if ((*((_DWORD *)cursor + 34) & 0x100) == 0)
            {
              pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
              krb5_free_cred_contents(context, (krb5_creds *)k5_vic_options);
              krb5_free_creds(context, (krb5_creds *)cursor);
              krb5_set_error_message(context, 35224071, "Credential is not renewable", "krbtgt", realm, 0);
              *a1 = 35224071;
              return 851968;
            }
            krb5_free_creds(context, (krb5_creds *)cursor);
            cursor = 0;
            kdc_cred = krb5_get_kdc_cred();
            if (!kdc_cred)
            {
              krb5_cc_remove_cred(context, *(krb5_ccache *)(a2 + 40), 0, (krb5_creds *)k5_vic_options);
              kdc_cred = krb5_cc_store_cred(context, *(krb5_ccache *)(a2 + 40), (krb5_creds *)cursor);
              krb5_free_creds(context, (krb5_creds *)cursor);
            }
            krb5_free_cred_contents(context, (krb5_creds *)k5_vic_options);
            pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
            if (!kdc_cred)
            {
              v27 = "renewed";
              goto LABEL_56;
            }
          }
        }
        *a1 = kdc_cred;
        return 851968;
      }
      k5_vic_options[0] = 0;
      v28 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
      inited = krb5_cc_get_full_name();
      pthread_mutex_unlock(v28);
      if (inited)
        goto LABEL_47;
      v29 = krb5_cc_default_name(context);
      v30 = (void *)k5_vic_options[0];
      if (!v29 || strcmp(*(const char **)k5_vic_options, v29))
      {
        free(v30);
        goto LABEL_49;
      }
      free(v30);
    }
    v27 = "default";
LABEL_56:
    member_buffer.length = 7;
    member_buffer.value = v27;
    return gss_add_buffer_set_member(a1, &member_buffer, a4);
  }
  k5_vic_options[0] = 0;
  v10 = (pthread_mutex_t *)(a2 + 48);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
  if (*(_QWORD *)(a2 + 40))
  {
    v11 = krb5_cc_get_full_name();
    pthread_mutex_unlock(v10);
    if (v11)
    {
      result = 851968;
    }
    else
    {
      member_buffer.value = (void *)k5_vic_options[0];
      member_buffer.length = strlen(*(const char **)k5_vic_options);
      if (gss_add_buffer_set_member(a1, &member_buffer, a4))
        _gsskrb5_clear_status();
      free(*(void **)k5_vic_options);
      v11 = 0;
      result = 0;
    }
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    result = 851968;
    v11 = 22;
  }
  *a1 = v11;
  return result;
}

uint64_t printable_time(time_t a1)
{
  uint64_t result;
  time_t v2;

  v2 = a1;
  ctime(&v2);
  result = __strlcpy_chk();
  byte_2545AA29C = 0;
  return result;
}

uint64_t _gsskrb5_inquire_cred(krb5_error_code *a1, uint64_t a2, krb5_ccache *a3, int *a4, int *a5, gss_OID_set *a6)
{
  krb5_error_code v12;
  uint64_t empty_oid_set;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  krb5_principal_data *v17;
  krb5_error_code v18;
  const krb5_principal_data *v19;
  krb5_error_code v20;
  krb5_error_code default_principal;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  int v26;
  krb5_ccache cache;
  uint64_t v29;
  uint64_t v30;
  krb5_context context;

  v29 = 0;
  v30 = 0;
  *a1 = 0;
  if (a3)
    *a3 = 0;
  if (a6)
    *a6 = 0;
  context = 0;
  v12 = __ApplePrivate__gsskrb5_init(&context);
  if (v12)
  {
    *a1 = v12;
    return 851968;
  }
  if (a2)
  {
    v14 = *(_QWORD *)(a2 + 16);
    if (v14)
      v15 = a2;
    else
      v15 = 0;
    if (v14)
      v16 = 0;
    else
      v16 = a2;
    if (*(_DWORD *)(a2 + 32) == 1)
    {
      v17 = *(krb5_principal_data **)a2;
      if (*(_QWORD *)a2)
      {
        cache = 0;
        v18 = krb5_cc_cache_match(context, v17, &cache);
        if (v18)
        {
          *a1 = v18;
          return 655360;
        }
        krb5_cc_close(context, cache);
      }
    }
  }
  else
  {
    if (_gsskrb5_acquire_cred(a1, 0, 0xFFFFFFFFLL, 0, 2u, &v29))
      v15 = 0;
    else
      v15 = v29;
    if (_gsskrb5_acquire_cred(a1, 0, 0xFFFFFFFFLL, 0, 1u, &v30))
      v16 = 0;
    else
      v16 = v30;
    if (!(v16 | v15))
    {
      *a1 = 0;
      return 458752;
    }
  }
  if (v15)
    pthread_mutex_lock((pthread_mutex_t *)(v15 + 48));
  if (!v16)
  {
    if (!a3)
      goto LABEL_45;
    goto LABEL_38;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v16 + 48));
  if (!a3)
    goto LABEL_45;
  if (!*(_QWORD *)v16)
  {
LABEL_38:
    if (v15 && *(_DWORD *)(v15 + 32) == 2)
    {
      cache = 0;
      v20 = krb5_sname_to_principal(context, 0, 0, 3, (krb5_principal *)&cache);
      *a1 = v20;
      if (v20)
      {
        empty_oid_set = 851968;
LABEL_71:
        pthread_mutex_unlock((pthread_mutex_t *)(v15 + 48));
        goto LABEL_72;
      }
      *a3 = cache;
      if (a4)
        goto LABEL_47;
      goto LABEL_55;
    }
    cache = 0;
    default_principal = krb5_get_default_principal();
    *a1 = default_principal;
    if (default_principal)
    {
      empty_oid_set = 851968;
      goto LABEL_70;
    }
    *a3 = cache;
LABEL_45:
    if (a4)
    {
      if (!v15)
      {
        v22 = 0x7FFFFFFFLL;
        if (v16)
          goto LABEL_48;
        goto LABEL_50;
      }
LABEL_47:
      v22 = *(_QWORD *)(v15 + 24);
      if (v16)
      {
LABEL_48:
        v23 = *(_QWORD *)(v16 + 24);
        goto LABEL_51;
      }
LABEL_50:
      v23 = 0x7FFFFFFFLL;
LABEL_51:
      if (v22 >= v23)
        v24 = v23;
      else
        v24 = v22;
      empty_oid_set = _gsskrb5_lifetime_left(a1, context, v24, a4);
      if ((_DWORD)empty_oid_set)
        goto LABEL_70;
    }
LABEL_55:
    if (a5)
    {
      if (!(v15 | v16))
        abort();
      if (v16)
        v25 = v15 == 0;
      else
        v25 = 1;
      if (v25)
        v26 = 2;
      else
        v26 = 0;
      if (!v15)
        v26 = 1;
      *a5 = v26;
    }
    if (!a6
      || (empty_oid_set = gss_create_empty_oid_set((OM_uint32 *)a1, a6), !(_DWORD)empty_oid_set)
      && (empty_oid_set = gss_add_oid_set_member((OM_uint32 *)a1, &__gss_krb5_mechanism_oid_desc, a6),
          !(_DWORD)empty_oid_set))
    {
      empty_oid_set = 0;
    }
    goto LABEL_70;
  }
  if (!v15 || (v19 = *(const krb5_principal_data **)v15) == 0)
    v19 = *(const krb5_principal_data **)v16;
  empty_oid_set = _gsskrb5_duplicate_name(a1, v19, a3);
  if (!(_DWORD)empty_oid_set)
    goto LABEL_45;
LABEL_70:
  if (v15)
    goto LABEL_71;
LABEL_72:
  if (v16)
    pthread_mutex_unlock((pthread_mutex_t *)(v16 + 48));
  if (v30)
    empty_oid_set = _gsskrb5_release_cred(a1, &v30);
  if (v29)
    return _gsskrb5_release_cred(a1, &v29);
  return empty_oid_set;
}

uint64_t _gsskrb5_inquire_mechs_for_name(OM_uint32 *a1, int a2, gss_OID_set *oid_set)
{
  uint64_t empty_oid_set;
  OM_uint32 minor_status;

  empty_oid_set = gss_create_empty_oid_set(a1, oid_set);
  if (!(_DWORD)empty_oid_set)
  {
    empty_oid_set = gss_add_oid_set_member(a1, &__gss_krb5_mechanism_oid_desc, oid_set);
    if ((_DWORD)empty_oid_set)
    {
      minor_status = 0;
      gss_release_oid_set(&minor_status, oid_set);
    }
  }
  return empty_oid_set;
}

uint64_t _gsskrb5_inquire_sec_context_by_oid(OM_uint32 *a1, uint64_t a2, const gss_OID_desc *a3, gss_buffer_set_t *a4)
{
  OM_uint32 v8;
  pthread_mutex_t *v10;
  unsigned int *v11;
  uint64_t v12;
  pthread_mutex_t *v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _krb5_context *v25;
  OM_uint32 *v26;
  pthread_mutex_t *v27;
  int v28;
  krb5_context v29;
  gss_buffer_desc_struct member_buffer;
  int v31;

  if (a2)
  {
    v29 = 0;
    v8 = __ApplePrivate__gsskrb5_init(&v29);
    if (v8)
    {
      *a1 = v8;
      return 851968;
    }
    if (gss_oid_equal(a3, &__gss_krb5_get_tkt_flags_x_oid_desc))
    {
      v10 = (pthread_mutex_t *)(a2 + 128);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
      v11 = *(unsigned int **)(a2 + 112);
      if (v11)
      {
        v12 = TicketFlags2int(*v11);
        pthread_mutex_unlock(v10);
        _gss_mg_encode_le_uint32(v12, &v31);
        member_buffer.length = 4;
        member_buffer.value = &v31;
        return gss_add_buffer_set_member(a1, &member_buffer, a4);
      }
      else
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        _gsskrb5_set_status(22, "No ticket from which to obtain flags", v19, v20, v21, v22, v23, v24, (char)v29);
        *a1 = 22;
        return 0x10000;
      }
    }
    else
    {
      if (!gss_oid_equal(a3, &__gss_c_peer_has_updated_spnego_oid_desc))
      {
        if (gss_oid_equal(a3, &__gss_krb5_get_subkey_x_oid_desc))
        {
          v25 = v29;
          v26 = a1;
          v27 = (pthread_mutex_t *)a2;
          v28 = 2;
        }
        else if (gss_oid_equal(a3, &__gss_krb5_get_initiator_subkey_x_oid_desc))
        {
          v25 = v29;
          v26 = a1;
          v27 = (pthread_mutex_t *)a2;
          v28 = 1;
        }
        else
        {
          if (!gss_oid_equal(a3, &__gss_krb5_get_acceptor_subkey_x_oid_desc))
          {
            if (gss_oid_equal(a3, &__gss_c_inq_sspi_session_key_oid_desc))
              return inquire_sec_context_get_sspi_session_key(a1, (pthread_mutex_t *)a2, v29, a4);
            if (gss_oid_equal(a3, &__gss_krb5_get_authtime_x_oid_desc))
              return get_authtime(a1, a2, a4);
            if (gss_oid_equal(a3, &__gss_c_ctx_pfs_x_oid_desc))
              return get_pfs_status(a1, a2, a4);
            LODWORD(member_buffer.length) = 0;
            if (oid_prefix_equal((uint64_t)a3, (uint64_t)&__gss_krb5_extract_authz_data_from_sec_context_x_oid_desc, &member_buffer))return inquire_sec_context_authz_data(a1, a2, (uint64_t)v29, member_buffer.length, a4);
            if (oid_prefix_equal((uint64_t)a3, (uint64_t)&__gss_krb5_export_lucid_context_x_oid_desc, &member_buffer))
            {
              if (LODWORD(member_buffer.length) == 1)
                return export_lucid_sec_context_v1(a1, a2, v29, a4);
            }
            else if (gss_oid_equal(a3, &__gss_krb5_get_service_keyblock_x_oid_desc))
            {
              return get_service_keyblock(a1, (pthread_mutex_t *)a2, a4);
            }
            *a1 = 0;
            return 851968;
          }
          v25 = v29;
          v26 = a1;
          v27 = (pthread_mutex_t *)a2;
          v28 = 0;
        }
        return inquire_sec_context_get_subkey(v26, v27, v25, v28, a4);
      }
      *a1 = 0;
      *a4 = 0;
      v13 = (pthread_mutex_t *)(a2 + 128);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
      if ((*(_DWORD *)(a2 + 76) & 0x40) != 0)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
      }
      else
      {
        v14 = *(_QWORD *)(a2 + 40);
        v15 = 48;
        if ((*(_DWORD *)(a2 + 76) & 1) == 0)
          v15 = 40;
        v16 = *(int **)(v14 + v15);
        if (!v16)
        {
          pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
          return 851968;
        }
        v17 = *v16;
        v18 = **(_DWORD **)(v14 + 32);
        pthread_mutex_unlock(v13);
        if (v17 == v18)
          return 851968;
      }
      return 0;
    }
  }
  else
  {
    *a1 = 22;
    return 0x80000;
  }
}

uint64_t inquire_sec_context_get_subkey(OM_uint32 *a1, pthread_mutex_t *a2, _krb5_context *a3, int a4, gss_buffer_set_t *a5)
{
  pthread_mutex_t *v10;
  int acceptor_subkey;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  gss_buffer_desc_struct v19;
  uint64_t v20;
  gss_buffer_desc_struct member_buffer;
  krb5_octet *contents;
  gss_buffer_desc_struct v24;
  krb5_keyblock *v25;

  v24.value = 0;
  v25 = 0;
  v24.length = 0;
  krb5_data_zero();
  if (!krb5_storage_emem())
  {
    _gsskrb5_clear_status();
    krb5_data_free();
    v12 = 12;
LABEL_19:
    *a1 = v12;
    return 851968;
  }
  v10 = a2 + 2;
  pthread_mutex_lock(a2 + 2);
  switch(a4)
  {
    case 0:
      acceptor_subkey = _gsskrb5i_get_acceptor_subkey((uint64_t)a2, a3, &v25);
      goto LABEL_9;
    case 1:
      acceptor_subkey = _gsskrb5i_get_initiator_subkey((uint64_t)a2, a3, &v25);
LABEL_9:
      v12 = acceptor_subkey;
      pthread_mutex_unlock(v10);
      if (v12)
        goto LABEL_17;
      goto LABEL_12;
    case 2:
      acceptor_subkey = _gsskrb5i_get_token_key((uint64_t)a2, a3, &v25);
      goto LABEL_9;
  }
  pthread_mutex_unlock(a2 + 2);
LABEL_12:
  if (v25)
  {
    v19 = *(gss_buffer_desc_struct *)&v25->magic;
    contents = v25->contents;
    member_buffer = v19;
    v12 = krb5_store_keyblock();
    krb5_free_keyblock(a3, v25);
    if (!v12)
    {
      v12 = krb5_storage_to_data();
      if (!v12)
      {
        member_buffer = v24;
        v20 = gss_add_buffer_set_member(a1, &member_buffer, a5);
        goto LABEL_18;
      }
    }
  }
  else
  {
    v12 = 22;
    _gsskrb5_set_status(22, "have no subkey of type %d", v13, v14, v15, v16, v17, v18, a4);
  }
LABEL_17:
  v20 = 0;
LABEL_18:
  krb5_data_free();
  krb5_storage_free();
  if (v12)
    goto LABEL_19;
  return v20;
}

uint64_t inquire_sec_context_get_sspi_session_key(OM_uint32 *a1, pthread_mutex_t *a2, _krb5_context *a3, gss_buffer_set_t *a4)
{
  pthread_mutex_t *v8;
  int token_key;
  uint64_t v10;
  krb5_octet *contents;
  gss_buffer_desc_struct member_buffer;
  krb5_keyblock *v14;

  v14 = 0;
  v8 = a2 + 2;
  pthread_mutex_lock(a2 + 2);
  token_key = _gsskrb5i_get_token_key((uint64_t)a2, a3, &v14);
  pthread_mutex_unlock(v8);
  if (!token_key)
  {
    if (v14)
    {
      contents = v14->contents;
      member_buffer.length = *(_QWORD *)&v14->length;
      member_buffer.value = contents;
      v10 = gss_add_buffer_set_member(a1, &member_buffer, a4);
      krb5_free_keyblock(a3, v14);
      return v10;
    }
    token_key = 22;
  }
  *a1 = token_key;
  return 851968;
}

uint64_t get_authtime(OM_uint32 *a1, uint64_t a2, gss_buffer_set_t *a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  gss_buffer_desc_struct member_buffer;

  v6 = (pthread_mutex_t *)(a2 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  v7 = *(_QWORD *)(a2 + 112);
  if (v7)
  {
    v8 = *(unsigned int *)(v7 + 88);
    pthread_mutex_unlock(v6);
    _gss_mg_encode_le_uint32(v8, &v17);
    member_buffer.length = 4;
    member_buffer.value = &v17;
    return gss_add_buffer_set_member(a1, &member_buffer, a3);
  }
  else
  {
    pthread_mutex_unlock(v6);
    _gsskrb5_set_status(22, "No ticket to obtain auth time from", v10, v11, v12, v13, v14, v15, v16);
    *a1 = 22;
    return 851968;
  }
}

uint64_t get_pfs_status(OM_uint32 *a1, uint64_t a2, gss_buffer_set_t *a3)
{
  pthread_mutex_t *v6;
  int *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  int v17;
  gss_buffer_desc_struct member_buffer;

  v6 = (pthread_mutex_t *)(a2 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  v7 = *(int **)(a2 + 40);
  if (v7)
  {
    v8 = *v7;
    pthread_mutex_unlock(v6);
    if ((v8 & 0x100) != 0)
    {
      _gss_mg_encode_le_uint32(1, &v17);
      member_buffer.length = 4;
      member_buffer.value = &v17;
      return gss_add_buffer_set_member(a1, &member_buffer, a3);
    }
  }
  else
  {
    pthread_mutex_unlock(v6);
  }
  _gsskrb5_set_status(22, "No auth_context or PFS", v9, v10, v11, v12, v13, v14, v16);
  *a1 = 22;
  return 851968;
}

uint64_t oid_prefix_equal(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  if (!der_get_oid())
  {
    if (!der_get_oid())
      der_free_oid();
    der_free_oid();
  }
  return 0;
}

uint64_t inquire_sec_context_authz_data(OM_uint32 *a1, uint64_t a2, uint64_t a3, int a4, gss_buffer_set_t *a5)
{
  pthread_mutex_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  krb5_error_code v17;
  OM_uint32 authorization_data_type;
  uint64_t v19;
  gss_buffer_desc_struct v21;
  gss_buffer_desc_struct v22;

  *a1 = 0;
  *a5 = 0;
  v9 = (pthread_mutex_t *)(a2 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  if (!*(_QWORD *)(a2 + 112))
  {
    pthread_mutex_unlock(v9);
    *a1 = 22;
    v16 = "No ticket to obtain authz data from";
    v17 = 22;
    goto LABEL_8;
  }
  if (a4 == 128 && (*(_BYTE *)(a2 + 76) & 0x80) == 0)
  {
    pthread_mutex_unlock(v9);
    *a1 = 22;
    v16 = "pac not valid";
    v17 = -1980176556;
LABEL_8:
    _gsskrb5_set_status(v17, v16, v10, v11, v12, v13, v14, v15, v21.length);
    return 0x80000;
  }
  v22.length = 0;
  v22.value = 0;
  authorization_data_type = krb5_ticket_get_authorization_data_type();
  pthread_mutex_unlock(v9);
  if (authorization_data_type)
  {
    *a1 = authorization_data_type;
    return 851968;
  }
  else
  {
    v21 = v22;
    v19 = gss_add_buffer_set_member(a1, &v21, a5);
    krb5_data_free();
  }
  return v19;
}

uint64_t export_lucid_sec_context_v1(OM_uint32 *a1, uint64_t a2, _krb5_context *a3, gss_buffer_set_t *a4)
{
  pthread_mutex_t *v8;
  int v9;
  uint64_t v10;
  int token_key;
  int v12;
  uint64_t v13;
  int v15;
  gss_buffer_desc_struct v16;
  gss_buffer_desc_struct v17;
  gss_buffer_desc_struct v18;
  krb5_octet *contents;
  gss_buffer_desc_struct v20;
  krb5_int32 v21;
  krb5_keyblock *v22;

  v22 = 0;
  v21 = 0;
  v20 = (gss_buffer_desc_struct)0;
  v8 = (pthread_mutex_t *)(a2 + 128);
  *a1 = 0;
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  v9 = *(_DWORD *)(a2 + 76);
  v10 = krb5_storage_emem();
  if (!v10)
  {
    _gsskrb5_clear_status();
    token_key = 12;
    goto LABEL_14;
  }
  token_key = krb5_store_int32();
  if (!token_key)
  {
    token_key = krb5_store_int32();
    if (!token_key)
    {
      token_key = krb5_store_int32();
      if (!token_key)
      {
        krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v21);
        token_key = krb5_store_int32();
        if (!token_key)
        {
          token_key = krb5_store_int32();
          if (!token_key)
          {
            krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v21);
            token_key = krb5_store_int32();
            if (!token_key)
            {
              token_key = krb5_store_int32();
              if (!token_key)
              {
                v12 = v9 & 0x40;
                token_key = krb5_store_int32();
                if (!token_key)
                {
                  token_key = _gsskrb5i_get_token_key(a2, a3, &v22);
                  if (!token_key)
                  {
                    if (v12)
                    {
                      v15 = *(_DWORD *)(a2 + 8);
                      token_key = krb5_store_int32();
                      if (token_key)
                        goto LABEL_14;
                      v16 = *(gss_buffer_desc_struct *)&v22->magic;
                      contents = v22->contents;
                      v18 = v16;
                      token_key = krb5_store_keyblock();
                      if (token_key)
                        goto LABEL_14;
                      if ((v15 & 4) == 0)
                        goto LABEL_29;
                    }
                    else
                    {
                      token_key = krb5_store_int32();
                      if (token_key)
                        goto LABEL_14;
                      token_key = krb5_store_int32();
                      if (token_key)
                        goto LABEL_14;
                    }
                    v17 = *(gss_buffer_desc_struct *)&v22->magic;
                    contents = v22->contents;
                    v18 = v17;
                    token_key = krb5_store_keyblock();
                    if (token_key)
                      goto LABEL_14;
LABEL_29:
                    token_key = krb5_storage_to_data();
                    if (!token_key)
                    {
                      v18 = v20;
                      token_key = gss_add_buffer_set_member(a1, &v18, a4);
                      krb5_data_free();
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_14:
  if (v22)
    krb5_free_keyblock(a3, v22);
  if (v10)
    krb5_storage_free();
  if (token_key)
  {
    *a1 = token_key;
    v13 = 851968;
  }
  else
  {
    v13 = 0;
  }
  pthread_mutex_unlock(v8);
  return v13;
}

uint64_t get_service_keyblock(OM_uint32 *a1, pthread_mutex_t *a2, gss_buffer_set_t *a3)
{
  pthread_mutex_t *v6;
  gss_buffer_desc_struct *sig;
  gss_buffer_desc_struct v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  gss_buffer_desc_struct v18;
  size_t length;
  gss_buffer_desc_struct v20;

  if (!krb5_storage_emem())
  {
    _gsskrb5_clear_status();
    v9 = 12;
LABEL_10:
    *a1 = v9;
    return 851968;
  }
  v6 = a2 + 2;
  pthread_mutex_lock(a2 + 2);
  if (!a2[3].__sig)
  {
    pthread_mutex_unlock(a2 + 2);
    krb5_storage_free();
    v9 = 22;
    _gsskrb5_set_status(22, "No service keyblock on gssapi context", v11, v12, v13, v14, v15, v16, v18.length);
    goto LABEL_10;
  }
  v20 = (gss_buffer_desc_struct)0;
  krb5_data_zero();
  sig = (gss_buffer_desc_struct *)a2[3].__sig;
  v8 = *sig;
  length = sig[1].length;
  v18 = v8;
  v9 = krb5_store_keyblock();
  pthread_mutex_unlock(v6);
  if (v9 || (v9 = krb5_storage_to_data()) != 0)
  {
    v10 = 0;
  }
  else
  {
    v18 = v20;
    v10 = gss_add_buffer_set_member(a1, &v18, a3);
  }
  krb5_data_free();
  krb5_storage_free();
  if (v9)
    goto LABEL_10;
  return v10;
}

uint64_t _gsskrb5_pseudo_random(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, gss_buffer_desc_struct *a6)
{
  size_t v7;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  pthread_mutex_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *value;
  int v39;
  size_t v40;
  krb5_keyblock *v41;
  OM_uint32 minor_status;
  size_t v43;
  const void *v44;
  size_t v45;
  void *v46;
  uint64_t v47;
  krb5_context v48;

  v41 = 0;
  if (!a2)
  {
    *a1 = 0;
    return 0x80000;
  }
  v7 = a5;
  if (a5 >= 1 && *(_QWORD *)a4 < 0xFFFFFFFFFFFFFFFCLL)
  {
    v47 = 0;
    v48 = 0;
    v43 = 0;
    v44 = 0;
    minor_status = 0;
    v13 = __ApplePrivate__gsskrb5_init(&v48);
    if (v13)
    {
      *a1 = v13;
      return 851968;
    }
    if (a3 == 1)
    {
      _gsskrb5i_get_initiator_subkey(a2, v48, &v41);
    }
    else
    {
      if (a3)
      {
        v21 = "unknown kerberos prf_key";
LABEL_17:
        _gsskrb5_set_status(22, v21, v14, v15, v16, v17, v18, v19, (char)v41);
        *a1 = 22;
        return 851968;
      }
      _gsskrb5i_get_acceptor_subkey(a2, v48, &v41);
    }
    if (v41)
    {
      v20 = krb5_crypto_init();
      krb5_free_keyblock(v48, v41);
      if (v20)
      {
        *a1 = v20;
      }
      else
      {
        v22 = malloc_type_malloc(v7, 0x5B52FBAFuLL);
        a6->value = v22;
        if (v22)
        {
          a6->length = v7;
          v29 = (pthread_mutex_t *)(a2 + 128);
          pthread_mutex_lock(v29);
          v45 = *(_QWORD *)a4 + 4;
          v30 = (char *)malloc_type_malloc(v45, 0xB59FB0BEuLL);
          v46 = v30;
          if (v30)
          {
            memcpy(v30 + 4, *(const void **)(a4 + 8), *(_QWORD *)a4);
            v37 = 0;
            value = (char *)a6->value;
            while (1)
            {
              _gss_mg_encode_be_uint32(v37, v46);
              v39 = krb5_crypto_prf();
              if (v39)
                break;
              if (v7 >= v43)
                v40 = v43;
              else
                v40 = v7;
              memcpy(value, v44, v40);
              value += v40;
              v7 -= v40;
              krb5_data_free();
              v37 = (v37 + 1);
              if (!v7)
              {
                free(v46);
                krb5_crypto_destroy();
                pthread_mutex_unlock(v29);
                return 0;
              }
            }
            *a1 = v39;
            free(v46);
          }
          else
          {
            _gsskrb5_set_status(35224200, "Out of memory", v31, v32, v33, v34, v35, v36, (char)v41);
            *a1 = 35224200;
          }
          gss_release_buffer(&minor_status, a6);
          krb5_crypto_destroy();
          pthread_mutex_unlock(v29);
        }
        else
        {
          _gsskrb5_set_status(35224200, "Out of memory", v23, v24, v25, v26, v27, v28, (char)v41);
          *a1 = 35224200;
          krb5_crypto_destroy();
        }
      }
      return 851968;
    }
    v21 = "no prf_key found";
    goto LABEL_17;
  }
  *a1 = 0;
  return 851968;
}

uint64_t _gsskrb5_process_context_token(_DWORD *a1)
{
  *a1 = 0;
  return 0x100000;
}

uint64_t _gsskrb5_release_buffer(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  free(*(void **)(a2 + 8));
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  return 0;
}

uint64_t _gsskrb5_release_cred(_DWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  int v4;
  _krb5_kt *v6;
  _krb5_ccache *v7;
  void *v8;
  void *v9;
  size_t v10;
  krb5_context context;

  *a1 = 0;
  v2 = *a2;
  if (*a2)
  {
    context = 0;
    *a2 = 0;
    v4 = __ApplePrivate__gsskrb5_init(&context);
    if (v4)
    {
      *a1 = v4;
      return 851968;
    }
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 48));
    if (*(_QWORD *)v2)
      krb5_free_principal(context, *(krb5_principal *)v2);
    v6 = *(_krb5_kt **)(v2 + 16);
    if (v6)
      krb5_kt_close(context, v6);
    v7 = *(_krb5_ccache **)(v2 + 40);
    if (v7)
    {
      if ((*(_BYTE *)(v2 + 8) & 1) != 0)
        krb5_cc_destroy(context, v7);
      else
        krb5_cc_close(context, v7);
    }
    v8 = *(void **)(v2 + 112);
    if (v8)
      free(v8);
    if (*(_QWORD *)(v2 + 120))
      heim_release();
    v9 = *(void **)(v2 + 128);
    if (v9)
    {
      v10 = strlen(*(const char **)(v2 + 128));
      bzero(v9, v10);
      free(*(void **)(v2 + 128));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48));
    pthread_mutex_destroy((pthread_mutex_t *)(v2 + 48));
    *(_OWORD *)v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 80) = 0u;
    *(_OWORD *)(v2 + 96) = 0u;
    *(_OWORD *)(v2 + 112) = 0u;
    *(_QWORD *)(v2 + 128) = 0;
    free((void *)v2);
  }
  return 0;
}

uint64_t _gsskrb5_release_name(_DWORD *a1, krb5_principal_data **a2)
{
  krb5_principal_data *v4;
  int v5;
  krb5_context v7;

  v7 = 0;
  v4 = *a2;
  *a1 = 0;
  v5 = __ApplePrivate__gsskrb5_init(&v7);
  if (v5)
  {
    *a1 = v5;
    return 851968;
  }
  else
  {
    *a2 = 0;
    krb5_free_principal(v7, v4);
    return 0;
  }
}

uint64_t _gssapi_msg_order_create(int *a1, _QWORD *a2, int a3, int a4, unsigned int a5)
{
  unsigned int v9;
  _DWORD *v10;
  int v11;
  _DWORD *v12;
  uint64_t result;

  if (a5)
    v9 = a5;
  else
    v9 = 20;
  v10 = malloc_type_calloc(1uLL, 4 * v9 + 20, 0xCA1ABE58uLL);
  *a2 = v10;
  if (v10)
    v11 = 0;
  else
    v11 = 12;
  *a1 = v11;
  if (!v10)
    return 851968;
  v12 = v10;
  result = 0;
  *v12 = a3;
  v12[2] = 0;
  v12[3] = v9;
  v12[4] = a4;
  v12[5] = a4 - 1;
  *a1 = 0;
  return result;
}

uint64_t _gssapi_msg_order_destroy(void **a1)
{
  free(*a1);
  *a1 = 0;
  return 0;
}

uint64_t _gssapi_msg_order_check(uint64_t result, unsigned int a2)
{
  int v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  _BOOL4 v13;

  if (result)
  {
    v2 = *(_DWORD *)result & 0xC;
    if (!v2)
      return 0;
    v3 = *(_DWORD *)(result + 20);
    if (v3 == a2 - 1)
    {
      elem_insert((unsigned int *)result, 0, a2);
      return 0;
    }
    if (v3 >= a2 && *(_DWORD *)(result + 16) <= a2 && (v4 = *(_DWORD *)(result + 8)) != 0)
    {
      v5 = (v4 - 1);
      v6 = *(_DWORD *)(result + 4 * v5 + 20);
      if (v6 <= a2)
      {
        if (v6 == a2)
        {
          return 2;
        }
        else
        {
          v8 = 0;
          while (v5 != v8)
          {
            v9 = result + 4 * v8;
            v10 = *(_DWORD *)(v9 + 20);
            if (v10 == a2)
              return 2;
            ++v8;
            v11 = *(_DWORD *)(v9 + 24);
            if (v10 < a2 && v11 < a2)
            {
              v13 = v2 != 4;
              elem_insert((unsigned int *)result, v8 - 1, a2);
              return (8 * v13);
            }
          }
          return 851968;
        }
      }
      else if (v2 == 4)
      {
        return 4;
      }
      else
      {
        return 8;
      }
    }
    else
    {
      v7 = v2 != 4;
      elem_insert((unsigned int *)result, 0, a2);
      return (16 * v7);
    }
  }
  return result;
}

unsigned int *elem_insert(unsigned int *result, unint64_t a2, unsigned int a3)
{
  unint64_t v3;
  unsigned int *v6;
  unint64_t v7;

  v3 = result[3];
  if (v3 <= a2)
    elem_insert_cold_1();
  v6 = result;
  v7 = result[2];
  if (v7 > a2)
  {
    result = (unsigned int *)memmove(&result[a2 + 6], &result[a2 + 5], 4 * (v7 + ~a2));
    LODWORD(v7) = v6[2];
    v3 = v6[3];
  }
  v6[a2 % v3 + 5] = a3;
  if (v7 < v3)
    v6[2] = v7 + 1;
  return result;
}

uint64_t _gssapi_msg_order_f(char a1)
{
  return a1 & 0xC;
}

uint64_t _gssapi_msg_order_export(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;

  result = krb5_store_int32();
  if (!(_DWORD)result)
  {
    result = krb5_store_int32();
    if (!(_DWORD)result)
    {
      result = krb5_store_int32();
      if (!(_DWORD)result)
      {
        result = krb5_store_int32();
        if (!(_DWORD)result)
        {
          result = krb5_store_int32();
          if (!(_DWORD)result)
          {
            if (*(_DWORD *)(a2 + 12))
            {
              v4 = 0;
              do
              {
                result = krb5_store_int32();
                if ((_DWORD)result)
                  break;
                ++v4;
              }
              while (v4 < *(unsigned int *)(a2 + 12));
            }
            else
            {
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _gssapi_msg_order_import(int *a1, uint64_t a2, void **a3)
{
  int v5;
  uint64_t result;
  _DWORD *v7;
  int v8;

  v5 = krb5_ret_int32();
  if (v5
    || (v5 = krb5_ret_int32()) != 0
    || (v5 = krb5_ret_int32()) != 0
    || (v5 = krb5_ret_int32()) != 0
    || (v5 = krb5_ret_int32()) != 0)
  {
    free(*a3);
    *a3 = 0;
    result = 851968;
    if (!a1)
      return result;
  }
  else
  {
    v7 = malloc_type_calloc(1uLL, 0x14uLL, 0xCA1ABE58uLL);
    *a3 = v7;
    if (v7)
      v8 = 0;
    else
      v8 = 12;
    *a1 = v8;
    if (!v7)
      return 851968;
    *v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v5 = 0;
    result = 0;
  }
  *a1 = v5;
  return result;
}

uint64_t _gsskrb5_set_cred_option(int *a1, uint64_t *a2, const gss_OID_desc *a3, unint64_t *a4)
{
  int v8;
  _krb5_context *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  char *v17;
  char *v18;
  char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  krb5_context v26;
  char *v27;
  krb5_ccache cache;
  krb5_keytab keytab;
  krb5_principal v30;

  v26 = 0;
  v8 = __ApplePrivate__gsskrb5_init(&v26);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  if (!a4)
  {
LABEL_28:
    v15 = 22;
LABEL_29:
    *a1 = v15;
    return 851968;
  }
  if (gss_oid_equal(a3, &__gss_krb5_import_cred_x_oid_desc))
  {
    v9 = v26;
    keytab = 0;
    v30 = 0;
    cache = 0;
    if (a2 && !*a2 && krb5_storage_from_mem())
    {
      v27 = 0;
      v10 = krb5_ret_string();
      if (!v10)
      {
        v17 = v27;
        if (*v27)
        {
          v10 = krb5_cc_resolve(v9, v27, &cache);
          if (v10)
            goto LABEL_9;
          v17 = v27;
        }
        free(v17);
        v27 = 0;
        v10 = krb5_ret_string();
        if (!v10)
        {
          v18 = v27;
          if (*v27)
          {
            v10 = krb5_parse_name(v9, v27, &v30);
            if (v10)
              goto LABEL_9;
            v18 = v27;
          }
          free(v18);
          v27 = 0;
          v10 = krb5_ret_string();
          if (!v10)
          {
            v19 = v27;
            if (*v27)
            {
              v10 = krb5_kt_resolve(v9, v27, &keytab);
              if (v10)
                goto LABEL_9;
              v19 = v27;
            }
            free(v19);
            v27 = 0;
            v11 = _gsskrb5_krb5_import_cred(a1, cache, v30, (uint64_t)keytab, a2);
            goto LABEL_10;
          }
        }
      }
LABEL_9:
      *a1 = v10;
      v11 = 851968;
LABEL_10:
      if (cache)
        krb5_cc_close(v9, cache);
      if (v30)
        krb5_free_principal(v9, v30);
      if (keytab)
        krb5_kt_close(v9, keytab);
      if (v27)
        free(v27);
      krb5_storage_free();
      return v11;
    }
LABEL_23:
    *a1 = 0;
    return 851968;
  }
  if (!gss_oid_equal(a3, &__gss_krb5_set_allowable_enctypes_x_oid_desc))
  {
    if (gss_oid_equal(a3, &__gss_krb5_cred_no_ci_flags_x_oid_desc))
    {
      if (a2 && (v14 = *a2) != 0)
      {
        v11 = 0;
        *(_DWORD *)(v14 + 8) |= 2u;
      }
      else
      {
        v11 = 851968;
      }
      *a1 = 0;
      return v11;
    }
    goto LABEL_28;
  }
  if (!a2)
    goto LABEL_23;
  v12 = *a2;
  if (!*a2)
    goto LABEL_23;
  v13 = *a4;
  if ((*a4 & 3) != 0)
    goto LABEL_23;
  v20 = malloc_type_malloc((v13 & 0xFFFFFFFFFFFFFFFCLL) + 4, 0x29E6E4uLL);
  if (!v20)
  {
    v15 = 12;
    goto LABEL_29;
  }
  v21 = v20;
  if (!krb5_storage_from_mem())
  {
    *a1 = 12;
LABEL_63:
    free(v21);
    return 851968;
  }
  if (v13 >= 4)
  {
    v22 = 0;
    if (v13 >> 2 <= 1)
      v23 = 1;
    else
      v23 = v13 >> 2;
    while (1)
    {
      LODWORD(v30) = 0;
      v24 = krb5_ret_uint32();
      if (v24)
        break;
      if (!krb5_enctype_valid())
        *((_DWORD *)v21 + v22++) = (_DWORD)v30;
      if (!--v23)
        goto LABEL_59;
    }
    *a1 = v24;
    krb5_storage_free();
    goto LABEL_63;
  }
  v22 = 0;
LABEL_59:
  *((_DWORD *)v21 + v22) = 0;
  v25 = *(void **)(v12 + 112);
  if (v25)
    free(v25);
  *(_QWORD *)(v12 + 112) = v21;
  krb5_storage_free();
  return 0;
}

uint64_t _gsskrb5_set_sec_context_option(krb5_error_code *a1, uint64_t *a2, const gss_OID_desc *a3, _QWORD *a4)
{
  krb5_error_code v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _BOOL4 v11;
  uint64_t string;
  char *v13;
  char *v14;
  char *v15;
  krb5_error_code v16;
  int v17;
  int v18;
  krb5_timestamp v19;
  int v20;
  krb5_int32 v22;
  krb5_timestamp v23[2];
  krb5_context v24;

  v24 = 0;
  v8 = __ApplePrivate__gsskrb5_init(&v24);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  if (!a4)
    goto LABEL_40;
  if (gss_oid_equal(a3, &__gss_krb5_compat_des3_mic_x_oid_desc))
  {
    v9 = *a2;
    if (!*a2)
    {
      *a1 = 22;
      return 0x80000;
    }
    v10 = (unsigned __int8 *)a4[1];
    if (v10 && *a4 == 1)
    {
      v11 = *v10 != 0;
      pthread_mutex_lock((pthread_mutex_t *)(v9 + 128));
      *(_DWORD *)(v9 + 76) = *(_DWORD *)(v9 + 76) & 0xFFFFFFF3 | (4 * v11) | 8;
      pthread_mutex_unlock((pthread_mutex_t *)(v9 + 128));
      return 0;
    }
    goto LABEL_40;
  }
  if (gss_oid_equal(a3, &__gss_krb5_set_dns_canonicalize_x_oid_desc))
  {
    if (a4[1] && *a4 == 1)
    {
      krb5_set_dns_canonicalize_hostname();
      return 0;
    }
LABEL_40:
    *a1 = 22;
    return 851968;
  }
  if (gss_oid_equal(a3, &__gss_krb5_register_acceptor_identity_x_oid_desc))
  {
    *(_QWORD *)v23 = 0;
    string = get_string(a1, (uint64_t)a4, v23);
    if (!(_DWORD)string)
    {
      v13 = *(char **)v23;
      string = _gsskrb5_register_acceptor_identity(a1, *(const char **)v23);
      free(v13);
    }
    return string;
  }
  if (gss_oid_equal(a3, &__gss_krb5_set_default_realm_x_oid_desc))
  {
    *(_QWORD *)v23 = 0;
    string = get_string(a1, (uint64_t)a4, v23);
    if ((_DWORD)string)
      return string;
    v14 = *(char **)v23;
    if (*(_QWORD *)v23)
    {
      krb5_set_default_realm(v24, *(const char **)v23);
      free(v14);
      string = 0;
    }
    else
    {
      string = 0x1000000;
    }
LABEL_33:
    *a1 = 0;
    return string;
  }
  if (gss_oid_equal(a3, &__gss_krb5_ccache_name_x_oid_desc))
  {
    *(_QWORD *)v23 = 0;
    string = get_string(a1, (uint64_t)a4, v23);
    if (!(_DWORD)string)
    {
      v15 = *(char **)v23;
      v16 = krb5_cc_set_default_name(v24, *(const char **)v23);
      *a1 = v16;
      if (v15)
      {
        free(v15);
        v16 = *a1;
      }
      if (v16)
        return 851968;
      else
        return 0;
    }
  }
  else
  {
    if (gss_oid_equal(a3, &__gss_krb5_set_time_offset_x_oid_desc))
    {
      v23[0] = 0;
      string = get_int32(a1, (uint64_t)a4, v23);
      if ((_DWORD)string)
        return string;
      v17 = time(0);
      krb5_set_real_time(v24, v17 + v23[0], 0);
      goto LABEL_33;
    }
    if (gss_oid_equal(a3, &__gss_krb5_get_time_offset_x_oid_desc))
    {
      *(_QWORD *)v23 = 0;
      v22 = 0;
      v18 = time(0);
      krb5_us_timeofday(v24, v23, &v22);
      v19 = v23[0];
      *a1 = 0;
      if (*a4 != 4)
        return 0x100000;
      string = 0;
      *(_DWORD *)a4[1] = v19 - v18;
      goto LABEL_33;
    }
    if (!gss_oid_equal(a3, &__gss_krb5_plugin_register_x_oid_desc))
      goto LABEL_40;
    if (*a4 == 24)
    {
      krb5_plugin_register_module();
      v20 = 0;
      string = 0;
    }
    else
    {
      string = 851968;
      v20 = 22;
    }
    *a1 = v20;
  }
  return string;
}

uint64_t get_string(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v6;
  uint64_t result;

  if (*(_QWORD *)a2)
  {
    v6 = malloc_type_malloc(*(_QWORD *)a2 + 1, 0x3696FD13uLL);
    *a3 = v6;
    if (v6)
    {
      memcpy(v6, *(const void **)(a2 + 8), *(_QWORD *)a2);
      result = 0;
      *(_BYTE *)(*a3 + *(_QWORD *)a2) = 0;
    }
    else
    {
      *a1 = 0;
      return 0x100000;
    }
  }
  else
  {
    result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t get_int32(_DWORD *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;

  *a1 = 0;
  if (*(_QWORD *)a2 == 4)
  {
    result = 0;
    *a3 = **(_DWORD **)(a2 + 8);
  }
  else if (*(_QWORD *)a2)
  {
    return 0x100000;
  }
  else
  {
    result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t _gsskrb5_unwrap(krb5_error_code *a1, uint64_t a2, unint64_t *a3, size_t *a4, int *a5, _DWORD *a6)
{
  krb5_error_code v12;
  uint64_t v13;
  uint64_t v14;
  krb5_error_code token_key;
  krb5_magic magic;
  _krb5_context *v18;
  unint64_t v19;
  int v20;
  int v21;
  size_t v22;
  size_t v23;
  krb5_error_code v24;
  krb5_error_code v25;
  krb5_error_code v26;
  int v28;
  uint64_t v29;
  __int128 v30;
  krb5_error_code v31;
  size_t v32;
  krb5_error_code v33;
  size_t v34;
  void *v35;
  BOOL v36;
  size_t v37;
  krb5_context v38;
  krb5_keyblock *v39;
  uint64_t seed;
  uint64_t v41;
  __int128 *p_ivec;
  krb5_const_pointer inptr;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  _DWORD *v47;
  size_t size;
  __int128 ivec;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  a4[1] = 0;
  if (a6)
    *a6 = 0;
  v38 = 0;
  v39 = 0;
  v12 = __ApplePrivate__gsskrb5_init(&v38);
  if (!v12)
  {
    if ((*(_BYTE *)(a2 + 76) & 0x40) != 0)
      return _gssapi_unwrap_cfx(a1, a2, v38, a3, (uint64_t)a4, a5, a6, v13);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    token_key = _gsskrb5i_get_token_key(a2, v38, &v39);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (token_key)
    {
      *a1 = token_key;
      return 851968;
    }
    *a1 = 0;
    magic = v39->magic;
    if ((v39->magic - 23) < 2)
    {
      v14 = _gssapi_unwrap_arcfour(a1, a2, (uint64_t)v38, a3, (uint64_t)a4, a5, a6, (uint64_t)v39);
      goto LABEL_48;
    }
    if (magic != 16 && magic != 5)
      goto LABEL_47;
    v18 = v38;
    v19 = *a3;
    if ((*(_BYTE *)(a2 + 73) & 0x10) != 0)
    {
      if (v19 < 0x39)
        goto LABEL_21;
      v19 = 57;
    }
    v46 = 0;
    v47 = 0;
    v45 = 0;
    inptr = 0;
    v44 = 0;
    v41 = 0;
    p_ivec = 0;
    seed = 0;
    size = a3[1];
    v14 = _gsskrb5_verify_header((_BYTE **)&size, v19, (unsigned __int16 *)"\x02\x01", (uint64_t)&__gss_krb5_mechanism_oid_desc);
    if ((_DWORD)v14)
    {
LABEL_48:
      krb5_free_keyblock(v38, v39);
      return v14;
    }
    if (size - a3[1] + 42 > *a3)
    {
LABEL_21:
      v14 = 0x10000;
      goto LABEL_48;
    }
    if (ct_memcmp())
    {
LABEL_24:
      v14 = 393216;
      goto LABEL_48;
    }
    size += 2;
    v20 = ct_memcmp();
    if (v20)
    {
      if (ct_memcmp())
        goto LABEL_24;
      v21 = 0;
    }
    else
    {
      v21 = 1;
    }
    size += 2;
    if (a5)
      *a5 = v21;
    if (ct_memcmp() || (size += 30, v22 = size - a3[1], v22 > *a3))
    {
      v14 = 589824;
      goto LABEL_48;
    }
    if (!v20)
    {
      v23 = size - a3[1];
      ivec = 0uLL;
      v24 = krb5_crypto_init();
      if (v24
        || (v24 = krb5_decrypt(v18, inptr, (krb5_pointer)0x16, size, (krb5_encrypt_block *)(*a3 - v23), &ivec),
            krb5_crypto_destroy(),
            v24))
      {
        *a1 = v24;
        goto LABEL_47;
      }
      if ((_QWORD)ivec != *a3 - v23)
        _gsskrb5_unwrap_cold_1();
      memcpy((void *)size, *((const void **)&ivec + 1), ivec);
      krb5_data_free();
      v22 = v23;
    }
    v37 = v22;
    if ((*(_BYTE *)(a2 + 73) & 0x10) != 0)
    {
      v44 = 0;
    }
    else
    {
      v14 = _gssapi_verify_pad(a3, *a3 - v22 - 8, &v44);
      if ((_DWORD)v14)
        goto LABEL_48;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    size -= 28;
    v25 = krb5_crypto_init();
    if (v25)
    {
      *a1 = v25;
    }
    else
    {
      *(_QWORD *)&ivec = *(_QWORD *)(size + 8);
      v26 = krb5_decrypt_ivec();
      krb5_crypto_destroy();
      if (!v26)
      {
        if (v46 == 8)
        {
          _gss_mg_decode_le_uint32(v47, &v45);
          v28 = ct_memcmp();
          krb5_data_free();
          if (!v28)
          {
            v29 = _gssapi_msg_order_check(*(_QWORD *)(a2 + 24), v45);
            if ((_DWORD)v29)
            {
              v14 = v29;
              *a1 = 0;
              pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
              goto LABEL_48;
            }
            pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
            v30 = *(_OWORD *)(size + 8);
            v50 = *(_DWORD *)(size + 24);
            ivec = v30;
            *(_QWORD *)(size + 20) = *(_QWORD *)(size - 8);
            LODWORD(seed) = 12;
            v41 = 20;
            p_ivec = &ivec;
            v31 = krb5_crypto_init();
            if (v31)
            {
              *a1 = v31;
            }
            else
            {
              v33 = krb5_verify_checksum(v18, (krb5_cksumtype)inptr, (const krb5_checksum *)0x17, (krb5_const_pointer)(size + 20), *a3 - v37 + 8, &seed, v32);
              krb5_crypto_destroy();
              if (!v33)
              {
                v34 = *a3 - v44 - v37 - 8;
                *a4 = v34;
                v35 = malloc_type_malloc(v34, 0x7FB4FE03uLL);
                a4[1] = (size_t)v35;
                if (*a4)
                  v36 = v35 == 0;
                else
                  v36 = 0;
                if (v36)
                  v14 = 851968;
                else
                  v14 = 0;
                if (v35)
                {
                  memcpy(v35, (const void *)(size + 36), *a4);
                  v14 = 0;
                }
                goto LABEL_48;
              }
              *a1 = v33;
            }
            goto LABEL_47;
          }
        }
        else
        {
          krb5_data_free();
        }
        *a1 = 0;
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        goto LABEL_24;
      }
      *a1 = v26;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
LABEL_47:
    v14 = 851968;
    goto LABEL_48;
  }
  *a1 = v12;
  return 851968;
}

uint64_t _gsskrb5_verify_mic_internal(krb5_error_code *a1, uint64_t a2, _krb5_context *a3, uint64_t a4, uint64_t a5, _DWORD *a6, unsigned __int16 *a7, uint64_t a8)
{
  pthread_mutex_t *v15;
  krb5_error_code token_key;
  uint64_t v17;
  krb5_magic magic;
  unint64_t v21;
  _BYTE *v22;
  krb5_error_code v23;
  char v24;
  char v25;
  _BYTE *v26;
  krb5_error_code v27;
  krb5_error_code v28;
  int v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  krb5_error_code v33;
  size_t v34;
  krb5_error_code v35;
  krb5_error_code v36;
  krb5_keyblock *v37;
  uint64_t seed;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  _DWORD *v42;
  krb5_cksumtype ctype[3];
  unsigned int v44;
  _BYTE *v45[3];

  v45[2] = *(_BYTE **)MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a2 + 76) & 0x40) != 0)
    return _gssapi_verify_mic_cfx(a1, a2, a3, a4, (_QWORD *)a5, a6, (uint64_t)a7, a8);
  v37 = 0;
  v15 = (pthread_mutex_t *)(a2 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  token_key = _gsskrb5i_get_token_key(a2, a3, &v37);
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
  if (!token_key)
  {
    *a1 = 0;
    magic = v37->magic;
    if ((v37->magic - 23) < 2)
    {
      v17 = _gssapi_verify_mic_arcfour(a1, a2, (uint64_t)a3, a4, (unint64_t *)a5, a6, v37, a7);
      goto LABEL_29;
    }
    if (magic != 16 && magic != 5)
      goto LABEL_28;
    v44 = 0;
    v42 = 0;
    *(_QWORD *)ctype = 0;
    v40 = 0;
    v41 = 0;
    seed = 0;
    v39 = 0;
    v21 = *(_QWORD *)a5;
    v45[0] = *(_BYTE **)(a5 + 8);
    v17 = _gsskrb5_verify_header(v45, v21, a7, (uint64_t)&__gss_krb5_mechanism_oid_desc);
    if ((_DWORD)v17)
    {
LABEL_29:
      krb5_free_keyblock(a3, v37);
      return v17;
    }
    v22 = v45[0];
    if (*(_WORD *)v45[0] != 4 || (v45[0] += 2, *(_DWORD *)(v22 + 2) != -1))
    {
LABEL_14:
      v17 = 393216;
      goto LABEL_29;
    }
    v45[0] = v22 + 6;
    v23 = krb5_crypto_init();
    if (v23)
    {
      *a1 = v23;
LABEL_28:
      v17 = 851968;
      goto LABEL_29;
    }
    v24 = 1;
    while (1)
    {
      while (1)
      {
        v25 = v24;
        v26 = (v24 & 1) != 0 ? (_BYTE *)*((_QWORD *)v45[0] + 1) : 0;
        v45[1] = v26;
        v27 = krb5_decrypt_ivec();
        if (!v27)
          break;
        v24 = 0;
        if ((v25 & 1) == 0)
        {
          v28 = v27;
          krb5_crypto_destroy();
          *a1 = v28;
          goto LABEL_28;
        }
      }
      if (v41 == 8)
        break;
      krb5_data_free();
      v24 = 0;
      if ((v25 & 1) == 0)
      {
        krb5_crypto_destroy();
        goto LABEL_14;
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    _gss_mg_decode_le_uint32(v42, &v44);
    v29 = ct_memcmp();
    krb5_data_free();
    if (v29)
    {
      krb5_crypto_destroy();
      *a1 = 0;
    }
    else
    {
      v30 = _gssapi_msg_order_check(*(_QWORD *)(a2 + 24), v44);
      if ((_DWORD)v30)
      {
        v17 = v30;
        krb5_crypto_destroy();
        *a1 = 0;
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        goto LABEL_29;
      }
      v31 = malloc_type_malloc(*(_QWORD *)a4 + 8, 0x7EF428DFuLL);
      if (!v31)
      {
        krb5_crypto_destroy();
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        *a1 = 12;
        goto LABEL_28;
      }
      v32 = v31;
      *v31 = *((_QWORD *)v45[0] - 1);
      memcpy(v31 + 1, *(const void **)(a4 + 8), *(_QWORD *)a4);
      krb5_crypto_destroy();
      v33 = krb5_crypto_init();
      if (v33)
      {
        v35 = v33;
        free(v32);
        *a1 = v35;
      }
      else
      {
        LODWORD(seed) = 12;
        v39 = 20;
        v40 = v45[0] + 8;
        v36 = krb5_verify_checksum(a3, ctype[0], (const krb5_checksum *)0x17, v32, *(_QWORD *)a4 + 8, &seed, v34);
        free(v32);
        if (!v36)
        {
          pthread_mutex_unlock(v15);
          krb5_crypto_destroy();
          v17 = 0;
          goto LABEL_29;
        }
        krb5_crypto_destroy();
        *a1 = v36;
      }
    }
    pthread_mutex_unlock(v15);
    goto LABEL_14;
  }
  *a1 = token_key;
  return 851968;
}

uint64_t _gsskrb5_verify_mic(krb5_error_code *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  krb5_error_code v10;
  uint64_t v11;
  krb5_context v13;

  v13 = 0;
  v10 = __ApplePrivate__gsskrb5_init(&v13);
  if (v10)
  {
    *a1 = v10;
    return 851968;
  }
  else
  {
    if (a5)
      *a5 = 0;
    return _gsskrb5_verify_mic_internal(a1, a2, v13, a3, a4, a5, (unsigned __int16 *)"\x01\x01", v11);
  }
}

uint64_t _gsskrb5i_get_initiator_subkey(uint64_t a1, _krb5_context *a2, krb5_keyblock **a3)
{
  uint64_t result;

  *a3 = 0;
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    result = krb5_auth_con_getlocalsubkey();
    if ((_DWORD)result)
      return result;
  }
  else
  {
    result = krb5_auth_con_getremotesubkey();
    if ((_DWORD)result)
      return result;
  }
  if (*a3)
    return 0;
  result = krb5_auth_con_getkey(a2, *(krb5_auth_context *)(a1 + 40), a3);
  if (!(_DWORD)result)
  {
    if (*a3)
      return 0;
    krb5_set_error_message(a2, 0, "No initiator subkey available");
    return 35224195;
  }
  return result;
}

uint64_t _gsskrb5i_get_acceptor_subkey(uint64_t a1, _krb5_context *a2, _QWORD *a3)
{
  uint64_t result;

  *a3 = 0;
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    result = krb5_auth_con_getremotesubkey();
    if ((_DWORD)result)
      return result;
  }
  else
  {
    result = krb5_auth_con_getlocalsubkey();
    if ((_DWORD)result)
      return result;
  }
  if (*a3)
    return 0;
  krb5_set_error_message(a2, 0, "No acceptor subkey available");
  return 35224195;
}

uint64_t _gsskrb5i_get_token_key(uint64_t a1, _krb5_context *a2, krb5_keyblock **a3)
{
  _gsskrb5i_get_acceptor_subkey(a1, a2, a3);
  if (*a3)
    return 0;
  if ((*(_BYTE *)(a1 + 8) & 4) == 0)
  {
    _gsskrb5i_get_initiator_subkey(a1, a2, a3);
    if (*a3)
      return 0;
  }
  krb5_set_error_message(a2, 0, "No token key available");
  return 35224195;
}

uint64_t _gsskrb5_wrap_size_limit(_DWORD *a1, pthread_mutex_t *a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int *a6)
{
  int v12;
  uint64_t v13;
  int token_key;
  krb5_magic magic;
  unint64_t v17;
  unsigned int v18;
  krb5_keyblock *v20;
  krb5_context v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = 0;
  v12 = __ApplePrivate__gsskrb5_init(&v21);
  if (v12)
  {
    *a1 = v12;
    return 851968;
  }
  if ((a2[1].__opaque[4] & 0x40) != 0)
    return _gssapi_wrap_size_cfx((uint64_t)a1, (uint64_t)a2, (uint64_t)v21, a3, a4, a5, a6);
  pthread_mutex_lock(a2 + 2);
  token_key = _gsskrb5i_get_token_key((uint64_t)a2, v21, &v20);
  pthread_mutex_unlock(a2 + 2);
  if (token_key)
  {
    *a1 = token_key;
    return 851968;
  }
  magic = v20->magic;
  if ((v20->magic - 23) < 2)
  {
    v13 = _gssapi_wrap_size_arcfour(a1, (uint64_t)a2, (uint64_t)v21, a3, a4, a5, a6);
  }
  else if (magic == 16 || magic == 5)
  {
    v22 = 0;
    v23 = a5 + 50;
    _gsskrb5_encap_length(v23, &v23, &v22, &__gss_krb5_mechanism_oid_desc);
    v13 = 0;
    v17 = v22 - a5;
    if (v17 >= a5)
      v18 = 0;
    else
      v18 = (a5 - v17) & 0xFFFFFFF8;
    *a6 = v18;
  }
  else
  {
    v13 = 851968;
  }
  krb5_free_keyblock(v21, v20);
  *a1 = 0;
  return v13;
}

uint64_t _gsskrb5_wrap(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int *a6, uint64_t a7)
{
  int v14;
  uint64_t v15;
  int token_key;
  krb5_magic magic;
  size_t v19;
  uint64_t v20;
  size_t v21;
  _BYTE *v22;
  char *header;
  char *v24;
  __int16 v25;
  int v26;
  int v27;
  int checksum;
  _QWORD *v30;
  uint64_t *v31;
  int v32;
  int v33;
  int v34;
  size_t v35;
  void *__dst;
  size_t v37;
  _krb5_context *v38;
  krb5_keyblock *v39;
  krb5_context v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  size_t v44;
  const void *v45;
  krb5_const_pointer inptr;
  size_t v47;
  size_t v48;
  krb5_int32 v49;
  uint64_t ivec;
  const void *v51;
  krb5_int32 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v39 = 0;
  v40 = 0;
  *(_QWORD *)a7 = 0;
  *(_QWORD *)(a7 + 8) = 0;
  v14 = __ApplePrivate__gsskrb5_init(&v40);
  if (!v14)
  {
    if ((*(_BYTE *)(a2 + 76) & 0x40) != 0)
      return _gssapi_wrap_cfx(a1, a2, v40, a3, a5, a6, (size_t *)a7);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    token_key = _gsskrb5i_get_token_key(a2, v40, &v39);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (token_key)
    {
      *a1 = token_key;
      return 851968;
    }
    magic = v39->magic;
    if ((v39->magic - 23) < 2)
    {
      v15 = _gssapi_wrap_arcfour(a1, a2, v40, a3, a4, a5, a6, (size_t *)a7, (uint64_t)v39);
LABEL_26:
      krb5_free_keyblock(v40, v39);
      return v15;
    }
    if (magic != 16 && magic != 5)
      goto LABEL_25;
    v38 = v40;
    v49 = 0;
    inptr = 0;
    v47 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v41 = 0;
    v42 = 0;
    v19 = *(_QWORD *)a5;
    if ((*(_BYTE *)(a2 + 73) & 0x10) != 0)
    {
      v48 = 42;
      _gsskrb5_encap_length(42, &v48, &v47, &__gss_krb5_mechanism_oid_desc);
      v20 = 0;
      v21 = v47 + v19;
      v47 += v19;
    }
    else
    {
      v20 = 8 - (*(_QWORD *)a5 & 7);
      v19 += v20;
      v48 = v19 + 42;
      _gsskrb5_encap_length(v19 + 42, &v48, &v47, &__gss_krb5_mechanism_oid_desc);
      v21 = v47;
    }
    *(_QWORD *)a7 = v21;
    v22 = malloc_type_malloc(v21, 0xAC28D850uLL);
    *(_QWORD *)(a7 + 8) = v22;
    if (!v22)
    {
      *(_QWORD *)a7 = 0;
      *a1 = 12;
LABEL_25:
      v15 = 851968;
      goto LABEL_26;
    }
    v37 = v19;
    header = _gsskrb5_make_header(v22, v48, "\x02\x01", (const void **)&__gss_krb5_mechanism_oid_desc);
    v24 = header;
    *(_WORD *)header = 4;
    if (a3)
      v25 = 2;
    else
      v25 = -1;
    *((_WORD *)header + 1) = v25;
    *((_WORD *)header + 2) = -1;
    *(_QWORD *)(header + 26) = *(_QWORD *)(header - 2);
    __dst = header + 34;
    krb5_generate_random_block();
    memcpy(v24 + 42, *(const void **)(a5 + 8), *(_QWORD *)a5);
    memset(&v24[*(_QWORD *)a5 + 42], v20, v20);
    v26 = krb5_crypto_init();
    if (v26)
    {
      v27 = v26;
      free(*(void **)(a7 + 8));
      *(_QWORD *)a7 = 0;
      *(_QWORD *)(a7 + 8) = 0;
      v15 = 851968;
      *a1 = v27;
      goto LABEL_26;
    }
    checksum = krb5_create_checksum();
    krb5_crypto_destroy();
    if (checksum)
    {
LABEL_31:
      free(*(void **)(a7 + 8));
      *(_QWORD *)a7 = 0;
      *(_QWORD *)(a7 + 8) = 0;
      v15 = 851968;
      *a1 = checksum;
      goto LABEL_26;
    }
    v30 = v24 + 6;
    *(_QWORD *)(v24 + 6) = 0;
    *(_QWORD *)(v24 + 14) = 0;
    *(_QWORD *)(v24 + 22) = 0;
    *(_DWORD *)(v24 + 30) = 0;
    v31 = (uint64_t *)(v24 + 14);
    memcpy(v31, v45, v44);
    free_Checksum();
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    krb5_auth_con_getlocalseqnumber(v38, *(krb5_auth_context *)(a2 + 40), &v49);
    v32 = 16843009 * ((*(_BYTE *)(a2 + 76) & 1) - 1);
    v52 = v49;
    v53 = v32;
    v33 = krb5_crypto_init();
    if (v33)
    {
      checksum = v33;
      goto LABEL_31;
    }
    ivec = *v31;
    v34 = krb5_encrypt_ivec();
    krb5_crypto_destroy();
    if (v34)
    {
LABEL_33:
      free(*(void **)(a7 + 8));
      *(_QWORD *)a7 = 0;
      *(_QWORD *)(a7 + 8) = 0;
      v15 = 851968;
      *a1 = v34;
      goto LABEL_26;
    }
    if (v41 != 8)
      _gsskrb5_wrap_cold_2();
    *v30 = *v42;
    krb5_data_free();
    ++v49;
    krb5_auth_con_setlocalseqnumber();
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (a3)
    {
      ivec = 0;
      v51 = 0;
      v34 = krb5_crypto_init();
      if (v34)
        goto LABEL_33;
      v35 = v37 + 8;
      v34 = krb5_encrypt(v38, inptr, (krb5_pointer)0x16, (size_t)__dst, (krb5_encrypt_block *)(v37 + 8), &ivec);
      krb5_crypto_destroy();
      if (v34)
        goto LABEL_33;
      if (ivec != v35)
        _gsskrb5_wrap_cold_1();
      memcpy(__dst, v51, v35);
      krb5_data_free();
    }
    if (a6)
      *a6 = a3;
    v15 = 0;
    *a1 = 0;
    goto LABEL_26;
  }
  *a1 = v14;
  return 851968;
}

uint64_t _gsskrb5_store_cred(int *a1, uint64_t a2, int a3, gss_const_OID a, uint64_t a5, int a6)
{
  int matched;
  int v10;
  uint64_t v11;
  krb5_error_code v13;
  krb5_error_code v14;
  krb5_ccache v15;
  krb5_context context;

  matched = 35224071;
  *a1 = 0;
  if (a3 != 1)
  {
    v11 = 851968;
    goto LABEL_7;
  }
  if (!gss_oid_equal(a, &__gss_krb5_mechanism_oid_desc))
    return 0x10000;
  if (!a2)
    return 458752;
  v15 = 0;
  context = 0;
  v10 = __ApplePrivate__gsskrb5_init(&context);
  if (!v10)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
    if (*(_DWORD *)(a2 + 32) <= 1u)
    {
      if (*(_QWORD *)a2)
      {
        v13 = krb5_cc_cache_match(context, *(krb5_principal *)a2, &v15);
        if (v13 && (v14 = krb5_cc_new_unique(context, 0, 0, &v15)) != 0)
        {
          matched = v14;
        }
        else
        {
          matched = krb5_cc_initialize(context, v15, *(krb5_principal *)a2);
          if (!matched)
          {
            matched = krb5_cc_copy_match_f();
            if (!matched)
            {
              if (a6)
                krb5_cc_switch();
              krb5_cc_close(context, v15);
              matched = 0;
              v11 = 0;
              goto LABEL_23;
            }
          }
          if (v13)
            krb5_cc_destroy(context, v15);
          else
            krb5_cc_close(context, v15);
        }
      }
      else
      {
        matched = 35224194;
      }
    }
    v11 = 851968;
LABEL_23:
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    goto LABEL_7;
  }
  v11 = 851968;
  matched = v10;
LABEL_7:
  *a1 = matched;
  return v11;
}

uint64_t _gss_pku2u_iter_creds_f(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, const gss_OID_desc *, char *))
{
  return iter_creds_f(&__gss_pku2u_mechanism_oid_desc, a2, a3);
}

uint64_t iter_creds_f(const gss_OID_desc *a1, uint64_t a2, uint64_t (*a3)(uint64_t, const gss_OID_desc *, char *))
{
  _krb5_ccache *v6;
  krb5_error_code v7;
  _krb5_context *v8;
  int is_pku2u;
  gss_OID_desc *v10;
  krb5_error_code config;
  char *v12;
  char *v13;
  krb5_principal v14;
  krb5_error_code v15;
  BOOL v16;
  krb5_data v18;
  krb5_principal principal;
  int v20;
  krb5_ccache ccache;
  krb5_cccol_cursor cursor;
  krb5_context context;

  cursor = 0;
  context = 0;
  ccache = 0;
  if (!__ApplePrivate__gsskrb5_init(&context) && !krb5_cccol_cursor_new(context, &cursor))
  {
    if (!krb5_cccol_cursor_next(context, cursor, &ccache))
    {
      v6 = ccache;
      if (ccache)
      {
        while (1)
        {
          v20 = 0;
          v18.data = 0;
          principal = 0;
          *(_QWORD *)&v18.magic = 0;
          v7 = krb5_cc_get_principal(context, v6, &principal);
          v8 = context;
          if (v7)
            goto LABEL_6;
          is_pku2u = krb5_principal_is_pku2u();
          v10 = &__gss_pku2u_mechanism_oid_desc;
          if (!is_pku2u)
          {
            config = krb5_cc_get_config(context, ccache, 0, "iakerb", &v18);
            v10 = &__gss_krb5_mechanism_oid_desc;
            if (!config)
            {
              krb5_data_free();
              v10 = &__gss_iakerb_mechanism_oid_desc;
            }
          }
          if (!gss_oid_equal(a1, v10))
            break;
          v12 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
          if (!v12)
          {
            krb5_cc_close(context, ccache);
            return a3(a2, 0, 0);
          }
          v13 = v12;
          pthread_mutex_init((pthread_mutex_t *)(v12 + 48), 0);
          *((_DWORD *)v13 + 8) = 1;
          v14 = principal;
          *(_QWORD *)v13 = principal;
          __gsskrb5_ccache_lifetime(&v20, context, ccache, (uint64_t)v14, (_QWORD *)v13 + 3);
          *((_QWORD *)v13 + 2) = 0;
          *((_QWORD *)v13 + 5) = ccache;
          a3(a2, a1, v13);
LABEL_13:
          v15 = krb5_cccol_cursor_next(context, cursor, &ccache);
          v6 = ccache;
          if (v15)
            v16 = 1;
          else
            v16 = ccache == 0;
          if (v16)
            goto LABEL_20;
        }
        krb5_free_principal(context, principal);
        v8 = context;
LABEL_6:
        krb5_cc_close(v8, ccache);
        goto LABEL_13;
      }
    }
LABEL_20:
    krb5_cccol_cursor_free(context, &cursor);
  }
  return a3(a2, 0, 0);
}

uint64_t _gss_krb5_iter_creds_f(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, const gss_OID_desc *, char *))
{
  return iter_creds_f(&__gss_krb5_mechanism_oid_desc, a2, a3);
}

uint64_t _gss_iakerb_iter_creds_f(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, const gss_OID_desc *, char *))
{
  return iter_creds_f(&__gss_iakerb_mechanism_oid_desc, a2, a3);
}

uint64_t _gsskrb5_export_cred(int *a1, uint64_t a2, _QWORD *a3)
{
  int v6;
  int krbtgt;
  int v8;
  int v9;
  int v10;
  uint64_t result;
  krb5_context v12;

  v12 = 0;
  krb5_data_zero();
  v6 = __ApplePrivate__gsskrb5_init(&v12);
  if (!v6)
  {
    if (*(_DWORD *)(a2 + 32) >= 2u)
    {
      v8 = 35224071;
    }
    else
    {
      if (krb5_storage_emem())
      {
        if (!*(_QWORD *)(a2 + 40))
          goto LABEL_24;
        krbtgt = krb5_store_int32();
        if (krbtgt
          || (krbtgt = _krb5_get_krbtgt()) != 0
          || (krbtgt = krb5_store_creds(), krb5_free_creds(v12, 0), krbtgt))
        {
          krb5_storage_free();
          *a1 = krbtgt;
          return 851968;
        }
        v9 = krb5_storage_to_data();
        krb5_storage_free();
        if (v9)
        {
LABEL_22:
          *a1 = v9;
          return 851968;
        }
        if (krb5_storage_emem())
        {
          v10 = krb5_store_data();
          if (v10)
          {
            v9 = v10;
            krb5_data_free();
LABEL_21:
            krb5_storage_free();
            goto LABEL_22;
          }
          v9 = krb5_store_data();
          krb5_data_free();
          if (v9)
            goto LABEL_21;
          v9 = krb5_storage_to_data();
          krb5_storage_free();
          if (v9)
            goto LABEL_22;
LABEL_24:
          result = 0;
          *a3 = 0;
          a3[1] = 0;
          return result;
        }
        krb5_data_free();
      }
      v8 = 12;
    }
    *a1 = v8;
    return 851968;
  }
  *a1 = v6;
  return 851968;
}

uint64_t _gsskrb5_import_cred(krb5_error_code *a1, uint64_t a2, _QWORD *a3)
{
  krb5_error_code v5;
  krb5_error_code v6;
  krb5_error_code v7;
  _krb5_context *v8;
  _krb5_ccache *v9;
  krb5_error_code v10;
  uint64_t result;
  int v12;
  _DWORD *v13;
  _DWORD *v14;
  _krb5_ccache *v15;
  krb5_principal principal[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int v25;
  const char *v26;
  krb5_ccache id;
  krb5_context v28;

  id = 0;
  v28 = 0;
  v26 = 0;
  v25 = 0;
  *a3 = 0;
  v5 = __ApplePrivate__gsskrb5_init(&v28);
  if (v5)
  {
    *a1 = v5;
    return 851968;
  }
  if (!krb5_storage_from_mem())
  {
LABEL_25:
    *a1 = 12;
    return 851968;
  }
  v6 = krb5_ret_uint32();
  if (v6)
  {
    v7 = v6;
    krb5_storage_free();
LABEL_6:
    *a1 = v7;
    return 851968;
  }
  if (v25 == 1)
  {
    v7 = krb5_ret_string();
    krb5_storage_free();
    if (v7)
      goto LABEL_6;
    v10 = krb5_cc_resolve(v28, v26, &id);
    krb5_xfree();
    if (v10)
    {
      *a1 = v10;
      return 851968;
    }
    v12 = 0;
  }
  else
  {
    if (v25)
    {
      krb5_storage_free();
      *a1 = 0;
      return 458752;
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    *(_OWORD *)principal = 0u;
    v7 = krb5_ret_creds();
    krb5_storage_free();
    if (v7)
      goto LABEL_6;
    v7 = krb5_cc_new_unique(v28, "API", 0, &id);
    if (v7)
      goto LABEL_6;
    v7 = krb5_cc_initialize(v28, id, principal[0]);
    v9 = id;
    v8 = v28;
    if (v7)
      goto LABEL_14;
    v7 = krb5_cc_store_cred(v28, id, (krb5_creds *)principal);
    krb5_free_cred_contents(v28, (krb5_creds *)principal);
    if (v7)
    {
      v9 = id;
      v8 = v28;
LABEL_14:
      krb5_cc_destroy(v8, v9);
      goto LABEL_6;
    }
    v12 = 1;
  }
  v13 = malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
  if (!v13)
  {
    krb5_cc_close(v28, id);
    goto LABEL_25;
  }
  v14 = v13;
  v13[8] = 1;
  krb5_cc_get_principal(v28, id, (krb5_principal *)v13);
  v15 = id;
  *((_QWORD *)v14 + 5) = id;
  v14[2] = v12;
  if (*(_QWORD *)v14)
    __gsskrb5_ccache_lifetime(a1, v28, v15, *(_QWORD *)v14, (_QWORD *)v14 + 3);
  result = 0;
  *a3 = v14;
  return result;
}

uint64_t _gsskrb5_destroy_cred(_DWORD *a1, uint64_t *a2)
{
  *(_DWORD *)(*a2 + 8) |= 1u;
  return _gsskrb5_release_cred(a1, a2);
}

uint64_t _gsskrb5_cred_hold(_DWORD *a1, uint64_t a2)
{
  return change_hold(a1, a2, MEMORY[0x24BE4C518]);
}

uint64_t change_hold(_DWORD *a1, uint64_t a2, uint64_t (*a3)(krb5_context, _QWORD))
{
  uint64_t result;
  krb5_data v7;
  krb5_context v8;

  v7.data = 0;
  v8 = 0;
  *(_QWORD *)&v7.magic = 0;
  *a1 = 0;
  krb5_data_zero();
  LODWORD(result) = __ApplePrivate__gsskrb5_init(&v8);
  if ((_DWORD)result)
    goto LABEL_2;
  if (!a2)
    return 0;
  if (*(_DWORD *)(a2 + 32) > 1u)
  {
    LODWORD(result) = 35224071;
LABEL_2:
    *a1 = result;
    return 851968;
  }
  LODWORD(result) = krb5_cc_get_config(v8, *(krb5_ccache *)(a2 + 40), 0, "nah-created", &v7);
  if ((_DWORD)result)
    goto LABEL_2;
  krb5_data_free();
  result = a3(v8, *(_QWORD *)(a2 + 40));
  if ((_DWORD)result)
    goto LABEL_2;
  return result;
}

uint64_t _gsskrb5_cred_unhold(_DWORD *a1, uint64_t a2)
{
  return change_hold(a1, a2, MEMORY[0x24BE4C5A0]);
}

uint64_t _gsskrb5_cred_label_get(_DWORD *a1, uint64_t a2, const char *a3, _QWORD *a4)
{
  uint64_t result;
  _krb5_ccache *v9;
  char *data;
  krb5_data v11;
  krb5_context v12;

  v11.data = 0;
  v12 = 0;
  *(_QWORD *)&v11.magic = 0;
  LODWORD(result) = __ApplePrivate__gsskrb5_init(&v12);
  if (!(_DWORD)result)
  {
    if (!a2)
      return 0;
    v9 = *(_krb5_ccache **)(a2 + 40);
    if (!v9)
    {
      *a1 = 35224071;
      return 851968;
    }
    result = krb5_cc_get_config(v12, v9, 0, a3, &v11);
    if (!(_DWORD)result)
    {
      data = v11.data;
      *a4 = *(_QWORD *)&v11.magic;
      a4[1] = data;
      return result;
    }
  }
  *a1 = result;
  return 851968;
}

uint64_t _gsskrb5_cred_label_set(_DWORD *a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t result;
  _krb5_ccache *v9;
  uint64_t v10;
  krb5_data *v11;
  uint64_t v12;
  uint64_t v13;
  krb5_context v14;

  v13 = 0;
  v14 = 0;
  v12 = 0;
  LODWORD(result) = __ApplePrivate__gsskrb5_init(&v14);
  if ((_DWORD)result)
    goto LABEL_2;
  if (!a2)
    return 0;
  v9 = *(_krb5_ccache **)(a2 + 40);
  if (!v9)
  {
    LODWORD(result) = 35224071;
LABEL_2:
    *a1 = result;
    return 851968;
  }
  if (a4)
  {
    v10 = a4[1];
    v12 = *a4;
    v13 = v10;
    v11 = (krb5_data *)&v12;
  }
  else
  {
    v11 = 0;
  }
  result = krb5_cc_set_config(v14, v9, 0, a3, v11);
  if ((_DWORD)result)
    goto LABEL_2;
  return result;
}

uint64_t _gsskrb5_appl_change_password(krb5_error_code *a1, krb5_principal_data *a2, char *a3, char *a4)
{
  krb5_error_code v8;
  krb5_error_code init_creds_opt_alloc;
  int result_code;
  _BYTE creds[144];
  krb5_context v13;
  krb5_get_init_creds_opt *opt;
  krb5_data result_string;
  krb5_data result_code_string;

  *(_QWORD *)&result_code_string.magic = 0;
  result_code_string.data = 0;
  *(_QWORD *)&result_string.magic = 0;
  result_string.data = 0;
  v13 = 0;
  opt = 0;
  result_code = 0;
  v8 = __ApplePrivate__gsskrb5_init(&v13);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  else
  {
    memset(creds, 0, sizeof(creds));
    init_creds_opt_alloc = krb5_get_init_creds_opt_alloc(v13, &opt);
    if (!init_creds_opt_alloc)
    {
      krb5_get_init_creds_opt_set_tkt_life(opt, 300);
      krb5_get_init_creds_opt_set_forwardable(opt, 0);
      krb5_get_init_creds_opt_set_proxiable(opt, 0);
      init_creds_opt_alloc = krb5_get_init_creds_password(v13, (krb5_creds *)creds, a2, a3, 0, 0, 0, "kadmin/changepw", opt);
      if (!init_creds_opt_alloc)
      {
        init_creds_opt_alloc = krb5_set_password(v13, (krb5_creds *)creds, a4, 0, &result_code, &result_code_string, &result_string);
        if (!init_creds_opt_alloc)
        {
          krb5_data_free();
          krb5_data_free();
          if (result_code)
          {
            init_creds_opt_alloc = -1765328353;
            krb5_set_error_message(v13, -1765328353, "Failed to change invalid password: %d", result_code);
          }
          else
          {
            init_creds_opt_alloc = 0;
          }
        }
      }
    }
    if (opt)
      krb5_get_init_creds_opt_free(v13, opt);
    krb5_free_cred_contents(v13, (krb5_creds *)creds);
    *a1 = init_creds_opt_alloc;
    if (init_creds_opt_alloc)
      return 851968;
    else
      return 0;
  }
}

uint64_t _gsskrb5_authorize_localname(_DWORD *a1, krb5_principal_data *a2, uint64_t a3, gss_const_OID a)
{
  int v7;
  char *v9;
  char *v10;
  krb5_BOOLean v11;
  krb5_context v12;

  if (!gss_oid_equal(a, &__gss_c_nt_user_name_oid_desc))
    return 196608;
  v12 = 0;
  v7 = __ApplePrivate__gsskrb5_init(&v12);
  if (v7)
  {
    *a1 = v7;
    return 851968;
  }
  v9 = (char *)malloc_type_malloc(*(_QWORD *)a3 + 1, 0x86DB4D11uLL);
  if (!v9)
  {
    *a1 = 12;
    return 851968;
  }
  v10 = v9;
  memcpy(v9, *(const void **)(a3 + 8), *(_QWORD *)a3);
  v10[*(_QWORD *)a3] = 0;
  *a1 = 0;
  v11 = krb5_kuserok(v12, a2, v10);
  free(v10);
  if (v11)
    return 0;
  else
    return 983040;
}

uint64_t _gsskrb5_pname_to_uid(_DWORD *a1, const krb5_principal_data *a2, uint64_t a3, uid_t *a4)
{
  int v7;
  uint64_t result;
  passwd *v9;
  passwd *v10;
  krb5_context v11;
  char v12[256];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v7 = __ApplePrivate__gsskrb5_init(&v11);
  if (v7 || (*a1 = 0, (v7 = krb5_aname_to_localname(v11, a2, 256, v12)) != 0))
  {
    *a1 = v7;
  }
  else
  {
    v9 = getpwnam(v12);
    if (v9)
    {
      v10 = v9;
      result = 0;
      *a4 = v10->pw_uid;
      return result;
    }
    *a1 = -1765328227;
  }
  return 851968;
}

uint64_t __ApplePrivate_gss_acquire_cred_ex(gss_name_t_desc_struct *a1, int a2, unsigned int a3, const gss_OID_desc *a4, unsigned int a5, uint64_t a6, void *aBlock)
{
  void *v12;
  int v13;
  uint64_t v14;

  v12 = _Block_copy(aBlock);
  v14 = __ApplePrivate_gss_acquire_cred_ex_f(0, a1, v13, a3, a4, a5, a6, (uint64_t)v12, (void (*)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, uint64_t))complete_block);
  if ((_DWORD)v14)
    _Block_release(v12);
  return v14;
}

uint64_t __ApplePrivate_gss_acquire_cred_ex_f(uint64_t a1, gss_name_t_desc_struct *a2, int a3, unsigned int a4, gss_const_OID member, unsigned int a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, uint64_t))
{
  gss_name_t v14;
  uint64_t v16;
  const char *v17;
  const char *v18;
  char *v19;
  gss_buffer_desc_struct input_name_buffer;
  OM_uint32 minor_status;
  int present[2];
  gss_name_t input_name;
  OM_uint32 v25;

  input_name = 0;
  if (!a9)
    return 0x1000000;
  v14 = a2;
  v25 = 0;
  minor_status = 0;
  input_name_buffer.length = 0;
  input_name_buffer.value = 0;
  if (a2)
  {
    if (!member)
    {
LABEL_5:
      input_name_buffer.value = *(void **)(a7 + 24);
      input_name_buffer.length = strlen((const char *)input_name_buffer.value);
      *(_QWORD *)present = 0;
      v16 = __ApplePrivate_gss_acquire_cred_ext(&v25, (uint64_t)v14, &__gss_c_cred_password_oid_desc, (uint64_t)&input_name_buffer, a4, member, a6, present);
      if (input_name)
        gss_release_name(&minor_status, &input_name);
      if (!(_DWORD)v16)
        a9(a8, 0, a1, *(_QWORD *)present, 0, 0xFFFFFFFFLL);
      return v16;
    }
  }
  else
  {
    *(_QWORD *)present = 0;
    v17 = *(const char **)(a7 + 8);
    if (!v17)
      return 851968;
    v18 = *(const char **)(a7 + 16);
    if (v18)
    {
      asprintf((char **)present, "%s@%s", *(const char **)(a7 + 8), v18);
      v19 = *(char **)present;
    }
    else
    {
      v19 = strdup(v17);
      *(_QWORD *)present = v19;
    }
    input_name_buffer.value = v19;
    input_name_buffer.length = strlen(v19);
    v16 = gss_import_name(&v25, &input_name_buffer, &__gss_c_nt_user_name_oid_desc, &input_name);
    free(*(void **)present);
    if ((_DWORD)v16)
      return v16;
    v14 = input_name;
    if (!member)
      goto LABEL_5;
  }
  present[0] = 0;
  gss_test_oid_set_member(&minor_status, member, (gss_OID_set)_gss_mech_oids, present);
  if (present[0])
    goto LABEL_5;
  if (input_name)
    gss_release_name(&minor_status, &input_name);
  return 0x10000;
}

void complete_block(void (**a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  a1[2](a1, a3, a4, a5, a6);
  _Block_release(a1);
}

uint64_t _gss_mg_get_error(uint64_t a1, int a2, _QWORD *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  size_t v7;
  void *v8;
  const void *v9;

  v5 = _gss_mechglue_thread();
  if (!v5)
    return 327680;
  v6 = v5;
  if (*((_DWORD *)v5 + 2) != a2 || (v7 = v5[2]) == 0)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
    return 327680;
  }
  v8 = malloc_type_malloc(v7, 0x5698119EuLL);
  a3[1] = v8;
  if (v8)
  {
    v9 = (const void *)v6[3];
    *a3 = v6[2];
    memcpy(v8, v9, v6[2]);
    return 0;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    return 851968;
  }
}

_QWORD *_gss_mechglue_thread()
{
  _QWORD *v0;

  pthread_mutex_lock(&context_mutex);
  if ((created_key & 1) == 0)
  {
    if (pthread_key_create((pthread_key_t *)&context_key_0, (void (__cdecl *)(void *))destroy_context_0))
    {
      pthread_mutex_unlock(&context_mutex);
      return 0;
    }
    created_key = 1;
  }
  pthread_mutex_unlock(&context_mutex);
  v0 = pthread_getspecific(context_key_0);
  if (!v0)
  {
    v0 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A0040A9FF75A4uLL);
    if (v0)
    {
      if (!pthread_setspecific(context_key_0, v0))
      {
        v0[4] = os_log_create("org.h5l.gss", "gss");
        return v0;
      }
      free(v0);
      return 0;
    }
  }
  return v0;
}

void _gss_mg_error(uint64_t a1, uint64_t a2)
{
  gss_buffer_desc_struct *v4;
  gss_buffer_desc_struct *v5;
  gss_buffer_desc_struct *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  OM_uint32 minor_status;

  if (*(_QWORD *)(a1 + 128))
  {
    v4 = (gss_buffer_desc_struct *)_gss_mechglue_thread();
    if (v4)
    {
      v5 = v4;
      minor_status = 0;
      v6 = v4 + 1;
      gss_release_buffer(&minor_status, v4 + 1);
      v5->length = a1 + 16;
      LODWORD(v5->value) = a2;
      if ((*(unsigned int (**)(OM_uint32 *, uint64_t, uint64_t))(a1 + 128))(&minor_status, a2, 2))
      {
        v6->length = 0;
        v6->value = 0;
      }
      else
      {
        _gss_mg_log(5, "_gss_mg_error: captured %.*s (%d) from underlaying mech %s", v7, v8, v9, v10, v11, v12, v5[1].length);
      }
    }
  }
}

void _gss_mg_log(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD *v11;
  _QWORD *v12;
  NSObject *v13;
  char *v14;
  uint8_t buf[4];
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  if (_gss_mg_log_level(a1))
  {
    v11 = _gss_mechglue_thread();
    if (v11)
    {
      v12 = v11;
      vasprintf(&v14, a2, &a9);
      v13 = v12[4];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v16 = v14;
        _os_log_impl(&dword_209749000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      free(v14);
      if (log_func)
        log_func(log_ctx, a1, a2, &a9);
    }
  }
}

void gss_mg_collect_error(const gss_OID_desc *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *mechanism;

  mechanism = __gss_get_mechanism(a1);
  if (mechanism)
    _gss_mg_error((uint64_t)mechanism, a3);
}

uint64_t gss_mg_set_error_string(size_t a1, uint64_t a2, int a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  gss_buffer_desc_struct *v13;
  gss_buffer_desc_struct *v14;
  char *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  OM_uint32 minor_status;
  char *__s;

  __s = 0;
  v13 = (gss_buffer_desc_struct *)_gss_mechglue_thread();
  if (v13)
  {
    v14 = v13;
    minor_status = 0;
    vasprintf(&__s, a4, &a9);
    if (__s)
    {
      gss_release_buffer(&minor_status, v14 + 1);
      v14->length = a1;
      LODWORD(v14->value) = a3;
      v15 = __s;
      v14[1].value = __s;
      v16 = strlen(v15);
      v14[1].length = v16;
      _gss_mg_log(5, "gss_mg_set_error_string: %.*s (%d/%d)", v17, v18, v19, v20, v21, v22, v16);
    }
  }
  return a2;
}

CFErrorRef _gss_mg_create_cferror(unsigned int a1, unsigned int a2, gss_OID_desc *a3)
{
  uint64_t v4;
  CFStringRef v5;
  _QWORD *v6;
  CFStringRef v7;
  CFErrorRef v8;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  OM_uint32 minor_status;
  gss_buffer_desc_struct oid_str;
  unsigned int v15;
  unsigned int valuePtr;
  void *userInfoValues[2];
  CFStringRef v18;
  CFStringRef v19;
  CFStringRef v20;
  void *userInfoKeys[6];

  userInfoKeys[5] = *(void **)MEMORY[0x24BDAC8D0];
  v15 = a2;
  valuePtr = a1;
  userInfoKeys[0] = CFSTR("kGSSMajorErrorCode");
  userInfoKeys[1] = CFSTR("kGSSMinorErrorCode");
  userInfoKeys[2] = CFSTR("kGSSMechanismOID");
  userInfoKeys[3] = CFSTR("kGSSMechanism");
  userInfoKeys[4] = *(void **)MEMORY[0x24BDBD378];
  v18 = 0;
  v19 = 0;
  v20 = 0;
  oid_str.length = 0;
  oid_str.value = 0;
  minor_status = 0;
  userInfoValues[0] = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  userInfoValues[1] = CFNumberCreate(0, kCFNumberSInt32Type, &v15);
  if (!a3)
  {
    v18 = CFStringCreateWithFormat(0, 0, CFSTR("no-mech"));
LABEL_8:
    v5 = CFStringCreateWithFormat(0, 0, CFSTR("no mech given"), v11);
    goto LABEL_9;
  }
  if (gss_oid_to_str(&minor_status, a3, &oid_str))
  {
    v18 = CFStringCreateWithFormat(0, 0, CFSTR("no-mech"));
  }
  else
  {
    v18 = CFStringCreateWithFormat(0, 0, CFSTR("%.*s"), oid_str.length, oid_str.value);
    gss_release_buffer(&minor_status, &oid_str);
  }
  v4 = __ApplePrivate_gss_oid_to_name(a3);
  if (!v4)
    goto LABEL_8;
  v5 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), v4);
LABEL_9:
  v19 = v5;
  v6 = _gss_mechglue_thread();
  if (v6 && v15 == *((_DWORD *)v6 + 2) && v6[2])
    v7 = CFStringCreateWithFormat(0, 0, CFSTR("%.*s"), v6[2], v6[3]);
  else
    v7 = CFStringCreateWithFormat(0, 0, CFSTR("Unknown minor status: %d"), v15, v12);
  v20 = v7;
  v8 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("org.h5l.GSS"), valuePtr, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, 5);
  for (i = 0; i != 5; ++i)
    CFRelease(userInfoValues[i]);
  return v8;
}

CFPropertyListRef _gss_mg_copy_key(const __CFString *a1, const __CFString *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  CFPropertyListRef v6;

  v4 = CFStringCreateWithFormat(0, 0, CFSTR("/Library/Preferences/%@.plist"), a1);
  if (!v4 || (v5 = v4, v6 = CopyKeyFromFile(v4, a2), CFRelease(v5), !v6))
  {
    if (krb5_homedir_access())
    {
      v6 = CFPreferencesCopyAppValue(a2, a1);
      if (!v6)
        return CFPreferencesCopyValue(a2, a1, (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t gss_set_log_function(uint64_t result, void *a2)
{
  if (!log_func)
  {
    log_func = a2;
    log_ctx = result;
  }
  return result;
}

BOOL _gss_mg_log_level(int a1)
{
  BOOL v2;
  int check;

  heim_base_once_f();
  if (config_token != -1)
  {
    check = 0;
    if (notify_check(config_token, &check))
      v2 = 1;
    else
      v2 = check == 0;
    if (!v2)
      init_log();
  }
  return log_level >= a1;
}

uint64_t setup_logging()
{
  init_log();
  return notify_register_check("com.apple.ManagedConfiguration.profileListChanged", &config_token);
}

const void *init_log()
{
  CFPropertyListRef v0;
  const void *result;
  CFTypeID v2;
  CFTypeID v3;

  v0 = _gss_mg_copy_key(CFSTR("com.apple.GSS"), CFSTR("DebugLevel"));
  if (v0
    || (!geteuid() || !krb5_homedir_access()
      ? (result = CopyKeyFromFile(CFSTR("/Library/Managed Preferences/mobile/.GlobalPreferences.plist"), CFSTR("GSSDebugLevel"))): (result = CFPreferencesCopyAppValue(CFSTR("GSSDebugLevel"), CFSTR(".GlobalPreferences"))), (v0 = result) != 0))
  {
    pthread_mutex_lock(&log_mutex);
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
    {
      log_level = CFBooleanGetValue((CFBooleanRef)v0) != 0;
    }
    else
    {
      v3 = CFGetTypeID(v0);
      if (v3 == CFNumberGetTypeID())
        CFNumberGetValue((CFNumberRef)v0, kCFNumberIntType, &log_level);
    }
    CFRelease(v0);
    return (const void *)pthread_mutex_unlock(&log_mutex);
  }
  return result;
}

void _gss_mg_log_name(uint64_t a1, uint64_t a2, const gss_OID_desc *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t *mechanism;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  gss_buffer_desc_struct buffer;
  OM_uint32 minor_status;
  gss_OID_desc *v25;

  v25 = 0;
  if (_gss_mg_log_level(a1))
  {
    mechanism = __gss_get_mechanism(a3);
    if (mechanism)
    {
      v14 = mechanism;
      minor_status = 0;
      if (!_gss_find_mn(&minor_status, a2, a3, &v25))
      {
        buffer.length = 0;
        buffer.value = 0;
        if (v25)
        {
          if (((unsigned int (*)(OM_uint32 *, void *, gss_buffer_desc_struct *, _QWORD))v14[19])(&minor_status, v25[1].elements, &buffer, 0))
          {
            return;
          }
        }
        else
        {
          buffer.length = 7;
          buffer.value = "no name";
        }
        v22 = 0;
        vasprintf(&v22, a4, &a9);
        if (v22)
        {
          _gss_mg_log(a1, "%s %.*s", v15, v16, v17, v18, v19, v20, (char)v22);
          v21 = v22;
        }
        else
        {
          v21 = 0;
        }
        free(v21);
        if (v25)
          gss_release_buffer(&minor_status, &buffer);
      }
    }
  }
}

void _gss_mg_log_cred(int a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *i;
  char *v18;

  if (_gss_mg_log_level(a1))
  {
    v18 = 0;
    vasprintf(&v18, a3, &a9);
    if (a2)
    {
      for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
        _gss_mg_log(1, "%s: %s", v11, v12, v13, v14, v15, v16, (char)v18);
    }
    else
    {
      _gss_mg_log(1, "%s: GSS_C_NO_CREDENTIAL", v11, v12, v13, v14, v15, v16, (char)v18);
    }
    free(v18);
  }
}

uint64_t _gss_load_plugins()
{
  return heim_base_once_f();
}

uint64_t load_plugins()
{
  uint64_t result;
  krb5_context v1;

  v1 = 0;
  result = krb5_init_context(&v1);
  if (!(_DWORD)result)
  {
    krb5_load_plugins();
    return heim_release();
  }
  return result;
}

void destroy_context_0(gss_buffer_desc_struct *a1)
{
  void *length;
  OM_uint32 minor_status;

  if (a1)
  {
    minor_status = 0;
    gss_release_buffer(&minor_status, a1 + 1);
    length = (void *)a1[2].length;
    if (length)
      os_release(length);
    free(a1);
  }
}

const void *CopyKeyFromFile(CFStringRef filePath, const void *a2)
{
  const __CFAllocator *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  __CFReadStream *v6;
  void *v7;
  CFTypeID v8;
  const void *Value;
  const void *v10;
  __CFReadStream *v11;
  CFErrorRef error;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], filePath, kCFURLPOSIXPathStyle, 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFReadStreamCreateWithFile(v3, v4);
  CFRelease(v5);
  if (!v6)
    return 0;
  if (!CFReadStreamOpen(v6))
  {
    v11 = v6;
LABEL_11:
    CFRelease(v11);
    return 0;
  }
  error = 0;
  v7 = (void *)CFPropertyListCreateWithStream(v3, v6, 0, 0, 0, &error);
  CFRelease(v6);
  if (!v7)
    return 0;
  v8 = CFGetTypeID(v7);
  if (v8 != CFDictionaryGetTypeID())
  {
    v11 = (__CFReadStream *)v7;
    goto LABEL_11;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)v7, a2);
  v10 = Value;
  if (Value)
    CFRetain(Value);
  CFRelease(v7);
  return v10;
}

OM_uint32 gss_accept_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_cred_id_t acceptor_cred_handle, gss_buffer_t input_token, gss_channel_bindings_t input_chan_bindings, gss_name_t *src_name, gss_OID *mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec, gss_cred_id_t *delegated_cred_handle)
{
  gss_cred_id_t v15;
  gss_ctx_id_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  OM_uint32 v34;
  size_t length;
  _BYTE *value;
  gss_name_t_desc_struct *name;
  int v38;
  gss_cred_id_t *v39;
  int v40;
  gss_cred_id_t v41;
  uint64_t v42;
  gss_cred_id_t_desc_struct *v43;
  _QWORD *v44;
  unint64_t v45;
  unint64_t v46;
  unsigned __int8 *v47;
  uint64_t *v48;
  gss_OID_desc *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  unint64_t v63;
  unint64_t v64;
  gss_ctx_id_t_desc_struct *v65;
  uint64_t *mechanism;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unsigned int v74;
  char v76;
  gss_const_OID a;
  uint64_t v79;
  gss_cred_id_t cred_handle;
  OM_uint32 minor_statusa[2];
  gss_OID_desc v82;

  v15 = acceptor_cred_handle;
  v18 = *context_handle;
  a = 0;
  *minor_status = 0;
  if (src_name)
    *src_name = 0;
  if (mech_type)
    *mech_type = 0;
  if (ret_flags)
    *ret_flags = 0;
  if (time_rec)
    *time_rec = 0;
  if (delegated_cred_handle)
    *delegated_cred_handle = 0;
  if (output_token)
  {
    output_token->length = 0;
    output_token->value = 0;
  }
  cred_handle = 0;
  *(_QWORD *)minor_statusa = 0;
  v79 = 0;
  _gss_mg_check_credential(acceptor_cred_handle);
  if (*context_handle)
  {
    v25 = *(_QWORD *)v18;
    goto LABEL_15;
  }
  length = input_token->length;
  if (!input_token->length)
  {
LABEL_67:
    v49 = &__gss_spnego_mechanism_oid_desc;
    goto LABEL_68;
  }
  value = input_token->value;
  if (length == 1)
  {
    v34 = 589824;
LABEL_65:
    if (*value != 110)
    {
      _gss_mg_log(10, "Don't have client request mech", v19, v20, v21, v22, v23, v24, v76);
      return v34;
    }
    v49 = &__gss_krb5_mechanism_oid_desc;
    goto LABEL_68;
  }
  *(_QWORD *)&v82.length = 0;
  v45 = value[1];
  v46 = length - 2;
  if ((char)value[1] < 0)
  {
    v63 = v45 & 0x7F;
    v64 = v46 - v63;
    if (v46 < v63)
      goto LABEL_59;
    v47 = value + 2;
    v45 = 0;
    if ((_DWORD)v63)
    {
      v73 = v63;
      do
      {
        v74 = *v47++;
        v45 = v74 | (v45 << 8);
        --v73;
      }
      while (v73);
      v47 = &value[v63 + 2];
      v46 = v64;
    }
  }
  else
  {
    v47 = value + 2;
  }
  v34 = 589824;
  if (v46 < 2 || v45 != v46)
    goto LABEL_60;
  if (*v47 != 6)
  {
LABEL_59:
    v34 = 589824;
    goto LABEL_60;
  }
  v34 = 589824;
  if (((char)v47[1] & 0x80000000) == 0 && v46 - 2 >= v47[1])
  {
    v82.length = v47[1];
    v82.elements = v47 + 2;
    v48 = _gss_mg_support_mechanism(&v82);
    if (v48)
    {
      v49 = (gss_OID_desc *)v48;
      goto LABEL_68;
    }
    length = input_token->length;
    v34 = 0x10000;
  }
LABEL_60:
  if (length < 9)
  {
    if (length)
    {
      value = input_token->value;
      goto LABEL_65;
    }
    goto LABEL_67;
  }
  value = input_token->value;
  if (*(_QWORD *)value != 0x5053534D4C544ELL)
    goto LABEL_65;
  v49 = &__gss_ntlm_mechanism_oid_desc;
LABEL_68:
  v65 = (gss_ctx_id_t_desc_struct *)malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
  if (!v65)
  {
    *minor_status = 12;
    return 589824;
  }
  v18 = v65;
  *(_QWORD *)v65 = 0;
  *((_QWORD *)v65 + 1) = 0;
  *((_QWORD *)v65 + 2) = 0;
  mechanism = __gss_get_mechanism(v49);
  *(_QWORD *)v18 = mechanism;
  if (!mechanism)
  {
    free(v18);
    _gss_mg_log(10, "mechanism client used is unknown", v67, v68, v69, v70, v71, v72, v76);
    return 0x10000;
  }
  v25 = (uint64_t)mechanism;
  *context_handle = v18;
LABEL_15:
  if ((*(_BYTE *)(v25 + 32) & 1) == 0 && v15)
  {
    v26 = (_QWORD *)((char *)v15 + 16);
    v27 = v26;
    while (1)
    {
      v27 = (_QWORD *)*v27;
      if (!v27)
        break;
      if (v27[1] == v25)
      {
        v15 = (gss_cred_id_t)v27[3];
        goto LABEL_21;
      }
    }
    gss_delete_sec_context(minor_statusa, context_handle, 0);
    _gss_mg_log(10, "gss-asc: client sent mech %s but no credential was matching", v50, v51, v52, v53, v54, v55, *(_QWORD *)(v25 + 8));
    v62 = (_QWORD *)*v26;
    if (*v26)
    {
      do
      {
        _gss_mg_log(10, "gss-asc: available creds where %s", v56, v57, v58, v59, v60, v61, *(_QWORD *)(v62[1] + 8));
        v62 = (_QWORD *)*v62;
      }
      while (v62);
    }
    return 0x10000;
  }
LABEL_21:
  cred_handle = 0;
  minor_statusa[1] = 0;
  v34 = (*(uint64_t (**)(OM_uint32 *, uint64_t, gss_cred_id_t, gss_buffer_t, gss_channel_bindings_t, uint64_t *, gss_const_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *, gss_cred_id_t *))(v25 + 64))(minor_status, (uint64_t)v18 + 8, v15, input_token, input_chan_bindings, &v79, &a, output_token, &minor_statusa[1], time_rec, &cred_handle);
  if (v34 >= 2)
  {
    _gss_mg_error(v25, *minor_status);
    gss_delete_sec_context(minor_statusa, context_handle, 0);
    return v34;
  }
  if (mech_type)
    *mech_type = (gss_OID)a;
  if (src_name && v79)
  {
    name = (gss_name_t_desc_struct *)_gss_create_name(v79, v25);
    if (!name)
    {
      (*(void (**)(OM_uint32 *, uint64_t *))(v25 + 176))(minor_status, &v79);
      goto LABEL_55;
    }
    *src_name = name;
  }
  else if (v79)
  {
    (*(void (**)(OM_uint32 *, uint64_t *))(v25 + 176))(minor_status, &v79);
  }
  if ((minor_statusa[1] & 1) == 0)
    goto LABEL_84;
  v38 = *(_DWORD *)(v25 + 32);
  v39 = delegated_cred_handle;
  if (!delegated_cred_handle)
  {
    if ((v38 & 1) != 0)
      gss_release_cred(minor_status, &cred_handle);
    else
      (*(void (**)(OM_uint32 *, gss_cred_id_t *))(v25 + 48))(minor_status, &cred_handle);
    minor_statusa[1] &= 0xFFFF7FFE;
    goto LABEL_84;
  }
  if ((v38 & 1) != 0)
  {
    v41 = cred_handle;
  }
  else
  {
    v40 = gss_oid_equal(a, (gss_const_OID)(v25 + 16));
    v41 = cred_handle;
    if (v40)
    {
      if (!cred_handle)
        goto LABEL_84;
      v42 = _gss_mg_alloc_cred();
      if (v42)
      {
        v43 = (gss_cred_id_t_desc_struct *)v42;
        v44 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        if (v44)
        {
          v44[1] = v25;
          v44[2] = v25 + 16;
          v44[3] = cred_handle;
          *v44 = *((_QWORD *)v43 + 2);
          *((_QWORD *)v43 + 2) = v44;
          *delegated_cred_handle = v43;
          goto LABEL_84;
        }
        free(v43);
      }
      *minor_status = 12;
LABEL_55:
      gss_delete_sec_context(minor_statusa, context_handle, 0);
      return 851968;
    }
    v39 = delegated_cred_handle;
  }
  *v39 = v41;
LABEL_84:
  _gss_mg_log(10, "gss-asc: return %d/%d", v28, v29, v30, v31, v32, v33, v34);
  if (ret_flags)
    *ret_flags = minor_statusa[1];
  return v34;
}

OM_uint32 gss_acquire_cred(OM_uint32 *minor_status, gss_name_t desired_name, OM_uint32 time_req, gss_OID_set desired_mechs, gss_cred_usage_t cred_usage, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *time_rec)
{
  OM_uint32 *v8;
  uint64_t v11;
  size_t count;
  uint64_t v17;
  size_t v18;
  size_t v19;
  BOOL v20;
  OM_uint32 result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  gss_OID_set v28;
  uint64_t v29;
  size_t v30;
  uint64_t *mechanism;
  uint64_t *v32;
  gss_const_OID *v33;
  gss_const_OID *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  char v42;
  gss_cred_id_t *cred_handle;
  uint64_t v44;
  unsigned int v45;
  OM_uint32 *v46;
  unsigned int v47;
  OM_uint32 v48;
  OM_uint32 v49;
  int present[2];
  unsigned int v51;
  uint64_t v52;
  gss_OID_desc_struct *v53;
  OM_uint32 minor_statusa;

  *minor_status = 0;
  if (!output_cred_handle)
    return 0x1000000;
  v8 = time_rec;
  v11 = *(_QWORD *)&cred_usage;
  if (actual_mechs)
    *actual_mechs = 0;
  if (time_rec)
    *time_rec = 0;
  minor_statusa = 0;
  v52 = 0;
  v53 = 0;
  v51 = 0;
  _gss_load_mech();
  if (!desired_mechs)
    goto LABEL_16;
  count = desired_mechs->count;
  if (desired_mechs->count)
  {
    v48 = time_req;
    v17 = 0;
    v18 = 0;
    do
    {
      present[0] = 0;
      gss_test_oid_set_member(minor_status, &desired_mechs->elements[v17], (gss_OID_set)_gss_mech_oids, present);
      v19 = desired_mechs->count;
      if (present[0])
        break;
      ++v18;
      ++v17;
    }
    while (v18 < v19);
    v20 = v18 == v19;
    time_req = v48;
    if (!v20)
    {
LABEL_16:
      if (actual_mechs)
      {
        result = gss_create_empty_oid_set(minor_status, actual_mechs);
        if (result)
          return result;
        v22 = _gss_mg_alloc_cred();
        if (!v22)
        {
          gss_release_oid_set(minor_status, actual_mechs);
LABEL_45:
          result = 851968;
          LODWORD(count) = 12;
          goto LABEL_54;
        }
      }
      else
      {
        v22 = _gss_mg_alloc_cred();
        if (!v22)
          goto LABEL_45;
      }
      cred_handle = output_cred_handle;
      v44 = v22;
      if (desired_mechs)
        v28 = desired_mechs;
      else
        v28 = (gss_OID_set)_gss_mech_oids;
      v52 = 1;
      if (!v28->count)
      {
        v47 = -1;
LABEL_47:
        if (*(_QWORD *)(v44 + 16))
        {
          _gss_mg_log_cred(10, v44, "gss_acquire_cred", v23, v24, v25, v26, v27, v42);
          if (v8)
            *v8 = v47;
          LODWORD(count) = 0;
          result = 0;
          *cred_handle = (gss_cred_id_t)v44;
        }
        else
        {
          *cred_handle = (gss_cred_id_t)v44;
          gss_release_cred(&minor_statusa, cred_handle);
          if (actual_mechs)
            gss_release_oid_set(&minor_statusa, actual_mechs);
          LODWORD(count) = 0;
          result = 458752;
        }
        goto LABEL_54;
      }
      v49 = time_req;
      v29 = 0;
      v30 = 0;
      v47 = -1;
      v46 = v8;
      v45 = v11;
      while (1)
      {
        *(_QWORD *)present = 0;
        mechanism = __gss_get_mechanism(&v28->elements[v29]);
        if (!mechanism)
          goto LABEL_43;
        v32 = mechanism;
        if ((mechanism[4] & 1) != 0
          || desired_name
          && _gss_find_mn(minor_status, (uint64_t)desired_name, &v28->elements[v29], (gss_OID_desc **)present))
        {
          goto LABEL_43;
        }
        v33 = (gss_const_OID *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        if (!v33)
          goto LABEL_43;
        v34 = v33;
        v33[1] = (gss_const_OID)v32;
        v33[2] = (gss_const_OID)(v32 + 2);
        v53 = &v28->elements[v29];
        if (*(_QWORD *)present)
          v35 = *(_QWORD *)(*(_QWORD *)present + 24);
        else
          v35 = 0;
        v36 = ((uint64_t (*)(OM_uint32 *, uint64_t, _QWORD, uint64_t *, uint64_t, gss_const_OID *, _QWORD, unsigned int *))v32[5])(minor_status, v35, v49, &v52, v11, v33 + 3, 0, &v51);
        _gss_mg_log_name(10, (uint64_t)desired_name, &v28->elements[v29], "gss_acquire_cred %s name: %ld/%ld", v37, v38, v39, v40, v32[1]);
        if (!v36)
        {
          v41 = v47;
          if (v51 < v47)
            v41 = v51;
          v47 = v41;
          if (!actual_mechs || !gss_add_oid_set_member(minor_status, v34[2], actual_mechs))
          {
            *v34 = *(gss_const_OID *)(v44 + 16);
            *(_QWORD *)(v44 + 16) = v34;
            goto LABEL_42;
          }
          ((void (*)(OM_uint32 *, gss_const_OID *))v32[6])(minor_status, v34 + 3);
        }
        free(v34);
LABEL_42:
        v8 = v46;
        v11 = v45;
LABEL_43:
        ++v30;
        ++v29;
        if (v30 >= v28->count)
          goto LABEL_47;
      }
    }
    LODWORD(count) = 0;
  }
  result = 0x10000;
LABEL_54:
  *minor_status = count;
  return result;
}

_QWORD *_gss_copy_cred(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  _QWORD *result;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  v9 = 0;
  v8 = 0;
  v6 = 0;
  v7 = 0;
  v5 = 0;
  v2 = a1[1];
  if ((*(unsigned int (**)(unsigned int *, _QWORD, _QWORD, uint64_t *, char *, uint64_t *, unsigned int *))(v2 + 216))(&v9, a1[3], a1[2], &v8, (char *)&v6 + 4, &v6, &v5)|| (v3 = (*(uint64_t (**)(unsigned int *, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t *, _QWORD, _QWORD, _QWORD))(v2 + 208))(&v9, 0, v8, a1[2], v5, HIDWORD(v6), v6, &v7, 0, 0, 0),
        (*(void (**)(unsigned int *, uint64_t *))(v2 + 176))(&v9, &v8),
        v3))
  {
    _gss_mg_error(v2, v9);
  }
  else
  {
    result = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
    if (result)
    {
      result[1] = v2;
      result[2] = v2 + 16;
      result[3] = v7;
      return result;
    }
    (*(void (**)(unsigned int *, uint64_t *))(v2 + 48))(&v9, &v7);
  }
  return 0;
}

OM_uint32 gss_add_cred(OM_uint32 *minor_status, gss_cred_id_t input_cred_handle, gss_name_t desired_name, gss_OID desired_mech, gss_cred_usage_t cred_usage, OM_uint32 initiator_time_req, OM_uint32 acceptor_time_req, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *initiator_time_rec, OM_uint32 *acceptor_time_rec)
{
  uint64_t v17;
  gss_cred_id_t_desc_struct *v18;
  uint64_t **i;
  _QWORD *v20;
  OM_uint32 mn;
  OM_uint32 v22;
  gss_cred_id_t_desc_struct *v23;
  uint64_t *mechanism;
  uint64_t v25;
  gss_cred_id_t_desc_struct *v26;
  uint64_t *v27;
  void *elements;
  gss_cred_id_t_desc_struct *v30;
  gss_cred_id_t *v31;
  OM_uint32 v32;
  OM_uint32 minor_statusa;
  gss_OID_desc *v36;
  gss_cred_id_t cred_handle;

  *minor_status = 0;
  *output_cred_handle = 0;
  if (initiator_time_rec)
    *initiator_time_rec = 0;
  if (acceptor_time_rec)
    *acceptor_time_rec = 0;
  if (actual_mechs)
    *actual_mechs = 0;
  v17 = _gss_mg_alloc_cred();
  if (!v17)
    goto LABEL_27;
  v18 = (gss_cred_id_t_desc_struct *)v17;
  v36 = 0;
  cred_handle = 0;
  minor_statusa = 0;
  v32 = acceptor_time_req;
  if (input_cred_handle)
  {
    for (i = (uint64_t **)*((_QWORD *)input_cred_handle + 2); i; i = (uint64_t **)*i)
    {
      if (gss_oid_equal((gss_const_OID)i[2], desired_mech))
        break;
      v20 = _gss_copy_cred(i);
      if (!v20)
        goto LABEL_26;
      *v20 = *((_QWORD *)v18 + 2);
      *((_QWORD *)v18 + 2) = v20;
    }
  }
  else
  {
    i = 0;
  }
  if (!desired_name)
  {
    v36 = 0;
LABEL_20:
    v31 = output_cred_handle;
    mechanism = __gss_get_mechanism(desired_mech);
    if (!mechanism || (v25 = (uint64_t)mechanism, (mechanism[4] & 1) != 0))
    {
      cred_handle = v18;
      gss_release_cred(&minor_statusa, &cred_handle);
      *minor_status = 0;
      return 851968;
    }
    v26 = (gss_cred_id_t_desc_struct *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
    if (v26)
    {
      *((_QWORD *)v26 + 1) = v25;
      *((_QWORD *)v26 + 2) = v25 + 16;
      if (i)
        v27 = i[3];
      else
        v27 = 0;
      if (desired_name)
        elements = v36[1].elements;
      else
        elements = 0;
      v30 = v26;
      v22 = (*(uint64_t (**)(OM_uint32 *, uint64_t *, void *, gss_OID, _QWORD, _QWORD, _QWORD, _QWORD *, gss_OID_set *, OM_uint32 *, OM_uint32 *))(v25 + 208))(minor_status, v27, elements, desired_mech, cred_usage, initiator_time_req, v32, (_QWORD *)v26 + 3, actual_mechs, initiator_time_rec, acceptor_time_rec);
      if (!v22)
      {
        *(_QWORD *)v30 = *((_QWORD *)v18 + 2);
        *((_QWORD *)v18 + 2) = v30;
        *v31 = v18;
        return v22;
      }
      _gss_mg_error(v25, *minor_status);
      cred_handle = v18;
      gss_release_cred(&minor_statusa, &cred_handle);
      v23 = v30;
      goto LABEL_18;
    }
LABEL_26:
    cred_handle = v18;
    gss_release_cred(&minor_statusa, &cred_handle);
LABEL_27:
    *minor_status = 12;
    return 851968;
  }
  mn = _gss_find_mn(minor_status, (uint64_t)desired_name, desired_mech, &v36);
  if (!mn)
    goto LABEL_20;
  v22 = mn;
  v23 = v18;
LABEL_18:
  free(v23);
  return v22;
}

OM_uint32 gss_add_oid_set_member(OM_uint32 *minor_status, gss_const_OID member_oid, gss_OID_set *oid_set)
{
  OM_uint32 result;
  OM_uint32 v7;
  size_t count;
  gss_OID_desc_struct *v9;
  gss_OID_desc_struct *v10;
  gss_OID_set v11;
  int present;

  present = 0;
  result = gss_test_oid_set_member(minor_status, member_oid, *oid_set, &present);
  if (!result)
  {
    if (present)
    {
      v7 = 0;
      result = 0;
    }
    else
    {
      count = (*oid_set)->count;
      v9 = (gss_OID_desc_struct *)malloc_type_realloc((*oid_set)->elements, 16 * (count + 1), 0x10800407411B482uLL);
      if (v9)
      {
        v10 = v9;
        v7 = 0;
        result = 0;
        (*oid_set)->elements = v10;
        v11 = *oid_set;
        v11->count = count + 1;
        v11->elements[count] = *member_oid;
      }
      else
      {
        result = 851968;
        v7 = 12;
      }
    }
    *minor_status = v7;
  }
  return result;
}

uint64_t __ApplePrivate_gss_wrap_iov(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  uint64_t (*v8)(void);

  if (a1)
    *a1 = 0;
  if (a5)
    *a5 = 0;
  if (!a2)
    return 0x80000;
  if (!a6 && a7)
    return 0x1000000;
  v8 = *(uint64_t (**)(void))(*(_QWORD *)a2 + 312);
  if (v8)
    return v8();
  else
    return 0x100000;
}

uint64_t __ApplePrivate_gss_unwrap_iov(_DWORD *a1, uint64_t a2, _DWORD *a3, _DWORD *a4, uint64_t a5, int a6)
{
  uint64_t (*v7)(void);

  if (a1)
    *a1 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (!a2)
    return 0x80000;
  if (!a5 && a6)
    return 0x1000000;
  v7 = *(uint64_t (**)(void))(*(_QWORD *)a2 + 320);
  if (v7)
    return v7();
  else
    return 0x100000;
}

uint64_t __ApplePrivate_gss_wrap_iov_length(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  uint64_t (*v8)(void);

  if (a1)
    *a1 = 0;
  if (a5)
    *a5 = 0;
  if (!a2)
    return 0x80000;
  if (!a6 && a7)
    return 0x1000000;
  v8 = *(uint64_t (**)(void))(*(_QWORD *)a2 + 328);
  if (v8)
    return v8();
  else
    return 0x100000;
}

uint64_t __ApplePrivate_gss_release_iov_buffer(_DWORD *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  gss_buffer_desc_struct *v5;
  OM_uint32 minor_status;

  if (a1)
    *a1 = 0;
  if (!a2 && a3)
    return 0x1000000;
  if (a3 >= 1)
  {
    minor_status = 0;
    v4 = a3;
    v5 = (gss_buffer_desc_struct *)(a2 + 8);
    do
    {
      if ((BYTE2(v5[-1].value) & 2) != 0)
      {
        gss_release_buffer(&minor_status, v5);
        LODWORD(v5[-1].value) &= ~0x20000u;
      }
      v5 = (gss_buffer_desc_struct *)((char *)v5 + 24);
      --v4;
    }
    while (v4);
  }
  return 0;
}

unsigned __int16 *_gss_mg_find_buffer(unsigned __int16 *result, int a2, int a3)
{
  uint64_t v3;

  if (a2 < 1)
    return 0;
  v3 = a2;
  while (*result != a3)
  {
    result += 12;
    if (!--v3)
      return 0;
  }
  return result;
}

uint64_t _gss_mg_allocate_buffer(_DWORD *a1, uint64_t a2, size_t size)
{
  uint64_t result;
  void *v7;

  if ((*(_BYTE *)(a2 + 2) & 2) != 0)
  {
    if (*(_QWORD *)(a2 + 8) == size)
      return 0;
    free(*(void **)(a2 + 16));
  }
  v7 = malloc_type_malloc(size, 0x18EC9FAEuLL);
  *(_QWORD *)(a2 + 8) = size;
  *(_QWORD *)(a2 + 16) = v7;
  if (v7)
  {
    result = 0;
    *(_DWORD *)a2 |= 0x20000u;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return result;
}

uint64_t __ApplePrivate_gss_context_query_attributes(_DWORD *a1, int a2, gss_const_OID b, void *a4, size_t a5)
{
  if (a1)
    *a1 = 0;
  if (!gss_oid_equal(&__gss_c_attr_stream_sizes_oid_desc, b))
    return 851968;
  bzero(a4, a5);
  return 0;
}

OM_uint32 gss_create_empty_buffer_set(OM_uint32 *minor_status, gss_buffer_set_t *buffer_set)
{
  gss_buffer_set_desc_struct *v4;
  gss_buffer_set_desc_struct *v5;
  OM_uint32 v6;
  OM_uint32 result;

  v4 = (gss_buffer_set_desc_struct *)malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    result = 0;
    v5->count = 0;
    v5->elements = 0;
    *buffer_set = v5;
  }
  else
  {
    result = 851968;
    v6 = 12;
  }
  *minor_status = v6;
  return result;
}

OM_uint32 gss_add_buffer_set_member(OM_uint32 *minor_status, gss_buffer_t member_buffer, gss_buffer_set_t *buffer_set)
{
  gss_buffer_set_t v5;
  size_t v6;
  gss_buffer_set_desc_struct *v8;
  gss_buffer_desc *v9;
  gss_buffer_desc *v10;
  size_t count;
  void *v12;
  OM_uint32 v13;
  OM_uint32 result;

  v5 = *buffer_set;
  if (*buffer_set)
  {
    v6 = 16 * v5->count + 16;
  }
  else
  {
    v8 = (gss_buffer_set_desc_struct *)malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
    if (!v8)
    {
LABEL_8:
      result = 851968;
      v13 = 12;
      goto LABEL_9;
    }
    v5 = v8;
    v8->count = 0;
    v8->elements = 0;
    *buffer_set = v8;
    v6 = 16;
    *minor_status = 0;
  }
  v9 = (gss_buffer_desc *)malloc_type_realloc(v5->elements, v6, 0x108004057E67DB5uLL);
  v5->elements = v9;
  if (!v9)
    goto LABEL_8;
  v10 = v9;
  count = v5->count;
  v12 = malloc_type_malloc(member_buffer->length, 0xCA4073C5uLL);
  v10[count].value = v12;
  if (!v12)
    goto LABEL_8;
  memcpy(v12, member_buffer->value, member_buffer->length);
  v13 = 0;
  result = 0;
  v10[count].length = member_buffer->length;
  ++v5->count;
LABEL_9:
  *minor_status = v13;
  return result;
}

OM_uint32 gss_release_buffer_set(OM_uint32 *minor_status, gss_buffer_set_t *buffer_set)
{
  gss_buffer_set_t v2;
  uint64_t v4;
  size_t v5;
  OM_uint32 minor_statusa;

  *minor_status = 0;
  v2 = *buffer_set;
  if (*buffer_set)
  {
    minor_statusa = 0;
    if (v2->count)
    {
      v4 = 0;
      v5 = 0;
      do
      {
        gss_release_buffer(&minor_statusa, &v2->elements[v4]);
        ++v5;
        v2 = *buffer_set;
        ++v4;
      }
      while (v5 < (*buffer_set)->count);
    }
    free(v2->elements);
    (*buffer_set)->elements = 0;
    free(*buffer_set);
    *buffer_set = 0;
  }
  return 0;
}

OM_uint32 gss_canonicalize_name(OM_uint32 *minor_status, gss_name_t input_name, gss_OID mech_type, gss_name_t *output_name)
{
  OM_uint32 mn;
  uint64_t (**elements)(OM_uint32 *, void *, gss_OID, uint64_t *);
  OM_uint32 v10;
  gss_name_t_desc_struct *name;
  uint64_t v12;
  gss_OID_desc *v13;

  v12 = 0;
  v13 = 0;
  *minor_status = 0;
  *output_name = 0;
  mn = _gss_find_mn(minor_status, (uint64_t)input_name, mech_type, &v13);
  if (!mn)
  {
    if (v13)
    {
      elements = (uint64_t (**)(OM_uint32 *, void *, gss_OID, uint64_t *))v13->elements;
      v10 = elements[32](minor_status, v13[1].elements, mech_type, &v12);
      if (v10)
      {
        mn = v10;
        _gss_mg_error((uint64_t)elements, *minor_status);
      }
      else
      {
        *minor_status = 0;
        name = (gss_name_t_desc_struct *)_gss_create_name(v12, (uint64_t)elements);
        if (name)
        {
          mn = 0;
          *output_name = name;
        }
        else
        {
          ((void (*)(OM_uint32 *, uint64_t *))elements[22])(minor_status, &v12);
          *minor_status = 12;
          return 851968;
        }
      }
    }
    else
    {
      return 0x20000;
    }
  }
  return mn;
}

OM_uint32 gss_compare_name(OM_uint32 *minor_status, gss_name_t name1_arg, gss_name_t name2_arg, int *name_equal)
{
  OM_uint32 result;
  gss_const_OID *v9;
  BOOL v10;
  gss_OID_desc *v11;

  if (*((_QWORD *)name1_arg + 5) && *((_QWORD *)name2_arg + 5))
  {
    *name_equal = 1;
    if (gss_oid_equal((gss_const_OID)name1_arg + 1, (gss_const_OID)name2_arg + 1)
      && *((_QWORD *)name1_arg + 4) == *((_QWORD *)name2_arg + 4))
    {
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    v9 = (gss_const_OID *)((char *)name1_arg + 48);
    while (1)
    {
      v9 = (gss_const_OID *)*v9;
      if (!v9)
        break;
      if (_gss_find_mn(minor_status, (uint64_t)name2_arg, v9[2], &v11))
        v10 = 1;
      else
        v10 = v11 == 0;
      if (!v10)
        return (*(uint64_t (**)(OM_uint32 *, gss_const_OID, void *, int *))&v9[1][9].length)(minor_status, v9[3], v11[1].elements, name_equal);
    }
  }
  *name_equal = 0;
LABEL_6:
  result = 0;
  *minor_status = 0;
  return result;
}

OM_uint32 gss_context_time(OM_uint32 *minor_status, gss_ctx_id_t context_handle, OM_uint32 *time_rec)
{
  return (*(uint64_t (**)(OM_uint32 *, _QWORD, OM_uint32 *))(*(_QWORD *)context_handle + 88))(minor_status, *((_QWORD *)context_handle + 1), time_rec);
}

OM_uint32 gss_create_empty_oid_set(OM_uint32 *minor_status, gss_OID_set *oid_set)
{
  gss_OID_set_desc_struct *v4;
  gss_OID_set_desc_struct *v5;
  OM_uint32 result;

  *minor_status = 0;
  *oid_set = 0;
  v4 = (gss_OID_set_desc_struct *)malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
  if (v4)
  {
    v5 = v4;
    result = 0;
    v5->count = 0;
    v5->elements = 0;
    *oid_set = v5;
  }
  else
  {
    *minor_status = 12;
    return 851968;
  }
  return result;
}

OM_uint32 gss_decapsulate_token(gss_const_buffer_t input_token, gss_const_OID oid, gss_buffer_t output_token)
{
  OM_uint32 v4;

  if (output_token)
  {
    output_token->length = 0;
    output_token->value = 0;
  }
  if (!der_get_oid())
  {
    if (!decode_GSSAPIContextToken())
    {
      if (!der_heim_oid_cmp())
      {
        *output_token = 0u;
        der_free_oid();
        v4 = 0;
        goto LABEL_9;
      }
      free_GSSAPIContextToken();
    }
    v4 = 851968;
LABEL_9:
    der_free_oid();
    return v4;
  }
  return 851968;
}

OM_uint32 gss_delete_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t output_token)
{
  gss_ctx_id_t v6;
  OM_uint32 v7;
  OM_uint32 minor_statusa;

  v6 = *context_handle;
  if (output_token)
  {
    output_token->length = 0;
    output_token->value = 0;
  }
  *minor_status = 0;
  if (!v6)
    return 0;
  minor_statusa = 0;
  if (*((_QWORD *)v6 + 2))
    gss_release_cred(&minor_statusa, (gss_cred_id_t *)v6 + 2);
  if (*((_QWORD *)v6 + 1))
    v7 = (*(uint64_t (**)(OM_uint32 *, uint64_t, gss_buffer_t))(*(_QWORD *)v6 + 80))(minor_status, (uint64_t)v6 + 8, output_token);
  else
    v7 = 0;
  free(v6);
  *context_handle = 0;
  return v7;
}

OM_uint32 gss_display_name(OM_uint32 *minor_status, gss_name_t input_name, gss_buffer_t output_name_buffer, gss_OID *output_name_type)
{
  void *v8;
  const void *v9;
  size_t v10;
  OM_uint32 v11;
  OM_uint32 result;
  _QWORD *v13;

  if (output_name_buffer)
  {
    output_name_buffer->length = 0;
    output_name_buffer->value = 0;
  }
  if (output_name_type)
    *output_name_type = 0;
  if (input_name)
  {
    if (*((_QWORD *)input_name + 5))
    {
      v8 = malloc_type_malloc(*((_QWORD *)input_name + 4), 0x53EBEDF8uLL);
      output_name_buffer->value = v8;
      if (v8)
      {
        v10 = *((_QWORD *)input_name + 4);
        v9 = (const void *)*((_QWORD *)input_name + 5);
        output_name_buffer->length = v10;
        memcpy(v8, v9, v10);
        v11 = 0;
        result = 0;
        if (output_name_type)
          *output_name_type = (gss_OID)((char *)input_name + 16);
      }
      else
      {
        result = 851968;
        v11 = 12;
      }
    }
    else
    {
      v13 = (_QWORD *)((char *)input_name + 48);
      while (1)
      {
        v13 = (_QWORD *)*v13;
        if (!v13)
          break;
        result = (*(uint64_t (**)(OM_uint32 *, _QWORD, gss_buffer_t, gss_OID *))(v13[1] + 152))(minor_status, v13[3], output_name_buffer, output_name_type);
        if (!result)
          return result;
      }
      v11 = 0;
      result = 851968;
    }
  }
  else
  {
    v11 = 0;
    result = 0x20000;
  }
  *minor_status = v11;
  return result;
}

OM_uint32 gss_display_status(OM_uint32 *minor_status, OM_uint32 status_value, int status_type, gss_OID mech_type, OM_uint32 *message_content, gss_buffer_t status_string)
{
  int v11;
  int v12;
  char *v13;
  OM_uint32 result;
  void *length;
  size_t v16;
  char *__s;
  gss_buffer_desc_struct oid_str;
  OM_uint32 minor_statusa;

  if (status_string)
  {
    status_string->length = 0;
    status_string->value = 0;
  }
  *message_content = 0;
  *minor_status = 0;
  if (status_type == 2)
  {
    minor_statusa = 0;
    oid_str.length = 0;
    oid_str.value = 0;
    __s = 0;
    if (_gss_mg_get_error((uint64_t)mech_type, status_value, status_string))
    {
      if (gss_oid_to_str(&minor_statusa, mech_type, &oid_str))
      {
        oid_str.length = 7;
        oid_str.value = "unknown";
        if (asprintf(&__s, "unknown mech-code %lu for mech %.*s", status_value, 7, "unknown") < 0)
          goto LABEL_20;
      }
      else
      {
        v12 = asprintf(&__s, "unknown mech-code %lu for mech %.*s", status_value, SLODWORD(oid_str.length), (const char *)oid_str.value);
        gss_release_buffer(&minor_statusa, &oid_str);
        if (v12 < 0)
          goto LABEL_20;
      }
      v13 = __s;
      if (!__s)
        goto LABEL_20;
      status_string->length = strlen(__s);
      status_string->value = v13;
    }
    else
    {
      *message_content = 0;
      *minor_status = 0;
    }
    return 0;
  }
  if (status_type == 1)
  {
    oid_str.length = 0;
    v11 = (_WORD)status_value ? asprintf((char **)&oid_str, "%s") : asprintf((char **)&oid_str, "%s %s");
    if ((v11 & 0x80000000) == 0)
    {
      length = (void *)oid_str.length;
      if (oid_str.length)
      {
        v16 = strlen((const char *)oid_str.length);
        result = 0;
        status_string->length = v16;
        status_string->value = length;
        return result;
      }
    }
  }
LABEL_20:
  if (status_string)
  {
    status_string->length = 0;
    status_string->value = 0;
  }
  return 327680;
}

OM_uint32 gss_duplicate_name(OM_uint32 *minor_status, gss_name_t src_name, gss_name_t *dest_name)
{
  OM_uint32 result;
  uint64_t **v7;
  gss_name_t v8;
  gss_name_t_desc_struct *name;
  gss_name_t_desc_struct *v10;
  uint64_t *v11;
  char *v12;
  _QWORD *v13;
  gss_OID_desc *v14;

  _gss_mg_check_name(src_name);
  *minor_status = 0;
  *dest_name = 0;
  if (*((_QWORD *)src_name + 5))
  {
    result = gss_import_name(minor_status, (gss_buffer_t)src_name + 2, (gss_const_OID)src_name + 1, dest_name);
    if (result)
      return result;
    v7 = (uint64_t **)*((_QWORD *)src_name + 6);
    if (v7)
    {
      v8 = *dest_name;
      do
      {
        v14 = 0;
        _gss_find_mn(minor_status, (uint64_t)v8, (gss_const_OID)v7[2], &v14);
        v7 = (uint64_t **)*v7;
      }
      while (v7);
    }
    return 0;
  }
  name = (gss_name_t_desc_struct *)_gss_create_name(0, 0);
  if (name)
  {
    v10 = name;
    *dest_name = name;
    v11 = (uint64_t *)*((_QWORD *)src_name + 6);
    if (!v11)
      return 0;
    while (1)
    {
      v12 = (char *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
      if (!v12)
        break;
      v13 = v12;
      *(_OWORD *)(v12 + 8) = *(_OWORD *)(v11 + 1);
      if ((*(unsigned int (**)(OM_uint32 *, uint64_t, char *))(v11[1] + 264))(minor_status, v11[3], v12 + 24))
      {
        free(v13);
      }
      else
      {
        *v13 = *((_QWORD *)v10 + 6);
        *((_QWORD *)v10 + 6) = v13;
      }
      v11 = (uint64_t *)*v11;
      if (!v11)
        return 0;
    }
  }
  *minor_status = 12;
  return 851968;
}

OM_uint32 gss_duplicate_oid(OM_uint32 *minor_status, gss_OID src_oid, gss_OID *dest_oid)
{
  gss_OID_desc_struct *v6;
  void *elements;
  OM_uint32 result;

  *minor_status = 0;
  if (src_oid)
  {
    v6 = (gss_OID_desc_struct *)malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
    *dest_oid = v6;
    if (v6)
    {
      (*dest_oid)->elements = malloc_type_malloc(src_oid->length, 0x46A2689AuLL);
      elements = (*dest_oid)->elements;
      if (elements)
      {
        memcpy(elements, src_oid->elements, src_oid->length);
        result = 0;
        (*dest_oid)->length = src_oid->length;
        *minor_status = 0;
        return result;
      }
      free(*dest_oid);
      *dest_oid = 0;
    }
    *minor_status = 12;
    return 851968;
  }
  else
  {
    result = 0;
    *dest_oid = 0;
  }
  return result;
}

OM_uint32 gss_encapsulate_token(gss_const_buffer_t input_token, gss_const_OID oid, gss_buffer_t output_token)
{
  size_t v4;
  void *v5;

  if (der_get_oid())
  {
    if (!output_token)
      return 851968;
    goto LABEL_8;
  }
  v4 = length_GSSAPIContextToken();
  output_token->length = v4;
  v5 = malloc_type_malloc(v4, 0xF5D94972uLL);
  output_token->value = v5;
  if (!v5)
  {
LABEL_7:
    der_free_oid();
LABEL_8:
    output_token->length = 0;
    output_token->value = 0;
    return 851968;
  }
  if (encode_GSSAPIContextToken())
  {
    free(output_token->value);
    output_token->value = 0;
    goto LABEL_7;
  }
  der_free_oid();
  if (output_token->length)
    abort();
  return 0;
}

OM_uint32 gss_export_name(OM_uint32 *minor_status, gss_name_t input_name, gss_buffer_t exported_name)
{
  uint64_t v6;

  _gss_mg_check_name(input_name);
  if (exported_name)
  {
    exported_name->length = 0;
    exported_name->value = 0;
  }
  v6 = *((_QWORD *)input_name + 6);
  if (v6)
    return (*(uint64_t (**)(OM_uint32 *, _QWORD, gss_buffer_t))(*(_QWORD *)(v6 + 8) + 168))(minor_status, *(_QWORD *)(v6 + 24), exported_name);
  *minor_status = 0;
  return 1179648;
}

uint64_t gss_mg_export_name(int *a1, const void **a2, const void *a3, size_t a4, size_t *a5)
{
  size_t v10;
  char *v11;
  char *v12;
  char *v13;
  int v14;
  uint64_t result;

  v10 = a4 + *(unsigned int *)a2 + 10;
  *a5 = v10;
  v11 = (char *)malloc_type_malloc(v10, 0x6CD68632uLL);
  a5[1] = (size_t)v11;
  if (v11)
  {
    *(_WORD *)v11 = 260;
    v11[2] = (unsigned __int16)(*(_WORD *)a2 + 2) >> 8;
    v11[3] = *(_BYTE *)a2 + 2;
    v11[4] = 6;
    v11[5] = *(_DWORD *)a2;
    v12 = v11 + 6;
    memcpy(v11 + 6, a2[1], *(unsigned int *)a2);
    v13 = &v12[*(unsigned int *)a2];
    *(_DWORD *)v13 = bswap32(a4);
    memcpy(v13 + 4, a3, a4);
    v14 = 0;
    result = 0;
  }
  else
  {
    result = 851968;
    v14 = 12;
  }
  *a1 = v14;
  return result;
}

OM_uint32 gss_export_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t interprocess_token)
{
  gss_ctx_id_t v6;
  uint64_t v7;
  OM_uint32 v8;
  OM_uint32 v9;
  size_t v11;
  _BYTE *v12;
  _BYTE *v13;
  gss_buffer_desc_struct v14;

  *minor_status = 0;
  if (!interprocess_token)
    return 0x1000000;
  interprocess_token->length = 0;
  interprocess_token->value = 0;
  if (!context_handle)
    return 0x80000;
  v6 = *context_handle;
  if (!*context_handle || (v14.length = 0, v14.value = 0, !*((_QWORD *)v6 + 1)))
  {
    *minor_status = 0;
    return 0x80000;
  }
  v7 = *(_QWORD *)v6;
  v8 = (*(uint64_t (**)(OM_uint32 *, uint64_t, gss_buffer_desc_struct *))(*(_QWORD *)v6 + 224))(minor_status, (uint64_t)v6 + 8, &v14);
  if (v8)
  {
    v9 = v8;
    _gss_mg_error(v7, *minor_status);
  }
  else
  {
    free(v6);
    *context_handle = 0;
    v11 = v14.length + *(unsigned int *)(v7 + 16) + 2;
    interprocess_token->length = v11;
    v12 = malloc_type_malloc(v11, 0x15E2DDD5uLL);
    interprocess_token->value = v12;
    if (v12)
    {
      *v12 = BYTE1(*(_DWORD *)(v7 + 16));
      v12[1] = *(_DWORD *)(v7 + 16);
      v13 = v12 + 2;
      memcpy(v12 + 2, *(const void **)(v7 + 24), *(unsigned int *)(v7 + 16));
      memcpy(&v13[*(unsigned int *)(v7 + 16)], v14.value, v14.length);
      gss_release_buffer(minor_status, &v14);
      return 0;
    }
    else
    {
      interprocess_token->length = 0;
      interprocess_token->value = 0;
      *minor_status = 12;
      return 851968;
    }
  }
  return v9;
}

OM_uint32 gss_get_mic(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_qop_t qop_req, gss_buffer_t message_buffer, gss_buffer_t message_token)
{
  if (message_token)
  {
    message_token->length = 0;
    message_token->value = 0;
  }
  if (context_handle)
    return (*(uint64_t (**)(OM_uint32 *, _QWORD, _QWORD, gss_buffer_t))(*(_QWORD *)context_handle + 96))(minor_status, *((_QWORD *)context_handle + 1), *(_QWORD *)&qop_req, message_buffer);
  *minor_status = 0;
  return 0x80000;
}

OM_uint32 gss_import_name(OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  gss_OID_desc *v8;
  size_t length;
  unsigned __int8 *value;
  int v11;
  uint64_t v12;
  OM_uint32 v13;
  unsigned __int8 *v14;
  unint64_t v15;
  uint64_t v16;
  size_t *v17;
  size_t *v18;
  _QWORD *v19;
  OM_uint32 v20;
  uint64_t i;
  BOOL v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  OM_uint32 v26;
  OM_uint32 v27;
  int v28;
  uint64_t *mechanism;
  uint64_t v31;
  OM_uint32 v32;
  gss_name_t_desc_struct *name;
  gss_name_t input_name;
  OM_uint32 minor_statusa;
  uint64_t v36;
  gss_OID_desc present;

  minor_statusa = 0;
  input_name = 0;
  *output_name = 0;
  _gss_load_mech();
  if (input_name_type)
    v8 = (gss_OID_desc *)input_name_type;
  else
    v8 = &__gss_c_nt_user_name_oid_desc;
  if (gss_oid_equal(v8, &__gss_c_nt_export_name_oid_desc))
  {
    length = input_name_buffer->length;
    value = (unsigned __int8 *)input_name_buffer->value;
    *minor_status = 0;
    *output_name = 0;
    if (length < 2)
      return 0x20000;
    v36 = 0;
    *(_QWORD *)&present.length = 0;
    if (*value != 4)
      return 0x20000;
    v11 = value[1];
    if (v11 != 1)
    {
      if (v11 != 2)
        return 0x20000;
      v11 = 0;
    }
    if ((length & 0xFFFFFFFFFFFFFFFELL) != 2 && value[4] == 6)
    {
      v12 = __rev16(*((unsigned __int16 *)value + 1));
      v13 = value[5];
      if ((char)value[5] < 0)
      {
        v26 = 0;
        v14 = value + 6;
        v16 = v12 - 2;
        v27 = v13 - 1;
        do
        {
          v28 = *v14++;
          v26 = v28 | (v26 << 8);
          present.length = v26;
          --v16;
          --v13;
        }
        while (v13);
        v15 = length - v27 - 7;
        v13 = v26;
      }
      else
      {
        present.length = value[5];
        v14 = value + 6;
        v15 = length - 6;
        v16 = v12 - 2;
      }
      if (v16 == v13)
      {
        present.elements = v14;
        if (v15 >= v16 + 4
          && (!v11
           || v15 - v16 - 4 == ((v14[v16] << 24) | ((unint64_t)v14[v16 + 1] << 16) | ((unint64_t)v14[v16 + 2] << 8) | v14[v16 + 3])))
        {
          mechanism = __gss_get_mechanism(&present);
          if (!mechanism)
            return 0x10000;
          v31 = (uint64_t)mechanism;
          v32 = ((uint64_t (*)(OM_uint32 *, gss_buffer_t, gss_OID_desc *, uint64_t *))mechanism[20])(minor_status, input_name_buffer, &__gss_c_nt_export_name_oid_desc, &v36);
          if (v32)
          {
            v20 = v32;
            _gss_mg_error(v31, *minor_status);
            return v20;
          }
          name = (gss_name_t_desc_struct *)_gss_create_name(v36, v31);
          if (name)
          {
            v20 = 0;
            *output_name = name;
            *minor_status = 0;
            return v20;
          }
          (*(void (**)(OM_uint32 *, uint64_t *))(v31 + 176))(minor_status, &v36);
          return 851968;
        }
      }
    }
    return 0x20000;
  }
  *minor_status = 0;
  v17 = _gss_create_name(0, 0);
  if (!v17)
  {
    *minor_status = 12;
    return 851968;
  }
  v18 = v17;
  v17[6] = 0;
  v19 = v17 + 2;
  if (_gss_copy_oid(minor_status, (const void **)v8, (uint64_t)(v17 + 2)))
  {
    input_name = (gss_name_t)v18;
    gss_release_name(&minor_statusa, &input_name);
    return 851968;
  }
  v20 = _gss_copy_buffer(minor_status, (uint64_t)input_name_buffer, v18 + 4);
  if (v20)
    goto LABEL_20;
  for (i = _gss_mechs; i; i = *(_QWORD *)i)
  {
    present.length = 0;
    if (gss_test_oid_set_member(minor_status, v8, *(gss_OID_set *)(i + 24), (int *)&present))
      v22 = 1;
    else
      v22 = present.length == 0;
    if (!v22)
    {
      v23 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
      if (!v23)
      {
        *minor_status = 12;
        v20 = 851968;
LABEL_20:
        input_name = (gss_name_t)v18;
        gss_release_name(&minor_statusa, &input_name);
        return v20;
      }
      v24 = v23;
      if (v18[3])
        v25 = v19;
      else
        v25 = 0;
      if ((*(unsigned int (**)(OM_uint32 *, size_t *, _QWORD *, _QWORD *))(i + 200))(minor_status, v18 + 4, v25, v23 + 3))
      {
        _gss_mg_error(i + 40, *minor_status);
        free(v24);
      }
      else
      {
        v24[1] = i + 40;
        v24[2] = i + 8;
        *v24 = v18[6];
        v18[6] = (size_t)v24;
      }
    }
  }
  if (!v18[6])
  {
    *minor_status = 0;
    v20 = 1179648;
    goto LABEL_20;
  }
  v20 = 0;
  *output_name = (gss_name_t)v18;
  return v20;
}

OM_uint32 gss_import_sec_context(OM_uint32 *minor_status, gss_buffer_t interprocess_token, gss_ctx_id_t *context_handle)
{
  size_t length;
  unsigned __int16 *value;
  OM_uint32 v5;
  uint64_t *mechanism;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  OM_uint32 v12;
  _QWORD v14[2];
  gss_OID_desc v15;

  *minor_status = 0;
  *context_handle = 0;
  length = interprocess_token->length;
  if (interprocess_token->length < 2)
    return 589824;
  value = (unsigned __int16 *)interprocess_token->value;
  *(_QWORD *)&v15.length = 0;
  v5 = __rev16(*value);
  v15.length = v5;
  if (length < v5 + 2)
    return 589824;
  v15.elements = value + 1;
  v14[0] = length - v5 - 2;
  v14[1] = (char *)value + v5 + 2;
  mechanism = __gss_get_mechanism(&v15);
  if (!mechanism)
    return 589824;
  v9 = (uint64_t)mechanism;
  v10 = malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
  if (v10)
  {
    v11 = v10;
    v10[2] = 0;
    v10[1] = 0;
    *v10 = v9;
    v12 = (*(uint64_t (**)(OM_uint32 *, _QWORD *, _QWORD *))(v9 + 232))(minor_status, v14, v10 + 1);
    if (v12)
    {
      _gss_mg_error(v9, *minor_status);
      free(v11);
    }
    else
    {
      *context_handle = (gss_ctx_id_t)v11;
    }
  }
  else
  {
    *minor_status = 12;
    return 851968;
  }
  return v12;
}

OM_uint32 gss_indicate_mechs(OM_uint32 *minor_status, gss_OID_set *mech_set)
{
  OM_uint32 empty_oid_set;
  uint64_t v5;
  uint64_t (*v6)(OM_uint32 *, gss_OID_set *);
  gss_OID_set v7;
  uint64_t v8;
  size_t v9;
  OM_uint32 v10;
  gss_OID_set v12;
  OM_uint32 minor_statusa;

  _gss_load_mech();
  empty_oid_set = gss_create_empty_oid_set(minor_status, mech_set);
  if (!empty_oid_set)
  {
    v5 = _gss_mechs;
    if (_gss_mechs)
    {
      minor_statusa = 0;
      v12 = 0;
      do
      {
        v6 = *(uint64_t (**)(OM_uint32 *, gss_OID_set *))(v5 + 176);
        if (v6)
        {
          empty_oid_set = v6(minor_status, &v12);
          if (!empty_oid_set)
          {
            v7 = v12;
            if (v12->count)
            {
              v8 = 0;
              v9 = 0;
              while (1)
              {
                v10 = gss_add_oid_set_member(minor_status, &v7->elements[v8], mech_set);
                if (v10)
                  break;
                ++v9;
                v7 = v12;
                ++v8;
                if (v9 >= v12->count)
                  goto LABEL_10;
              }
              empty_oid_set = v10;
            }
            else
            {
LABEL_10:
              empty_oid_set = 0;
            }
            gss_release_oid_set(minor_status, &v12);
            if (empty_oid_set)
              goto LABEL_17;
          }
        }
        else
        {
          empty_oid_set = gss_add_oid_set_member(minor_status, (gss_const_OID)(v5 + 8), mech_set);
          if (empty_oid_set)
            goto LABEL_17;
        }
        v5 = *(_QWORD *)v5;
      }
      while (v5);
      if (!empty_oid_set)
        goto LABEL_19;
LABEL_17:
      gss_release_oid_set(&minor_statusa, mech_set);
    }
    else
    {
      empty_oid_set = 0;
    }
LABEL_19:
    *minor_status = 0;
  }
  return empty_oid_set;
}

OM_uint32 gss_init_sec_context(OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  gss_ctx_id_t v18;
  const gss_OID_desc *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *mechanism;
  const gss_OID_desc *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  gss_cred_id_t *v37;
  gss_cred_id_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  OM_uint32 mn;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  OM_uint32 v52;
  char *v53;
  void *elements;
  OM_uint32 v55;
  const char *v56;
  size_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v66;
  char v67;
  char v68;
  gss_ctx_id_t *v69;
  uint64_t v72;
  gss_OID_desc *v73;
  gss_cred_id_t_desc_struct *v74;
  uint64_t v75;
  uint64_t v76;
  gss_name_t v77;
  const gss_OID_desc *v78;
  gss_cred_id_t v79;
  krb5_context v80;

  v72 = *(_QWORD *)&req_flags;
  v18 = *context_handle;
  *minor_status = 0;
  if (output_token)
  {
    output_token->length = 0;
    output_token->value = 0;
  }
  if (actual_mech_type)
    *actual_mech_type = 0;
  if (ret_flags)
    *ret_flags = 0;
  if (time_rec)
    *time_rec = 0;
  v73 = 0;
  if (input_mech_type)
    v19 = input_mech_type;
  else
    v19 = &__gss_krb5_mechanism_oid_desc;
  heim_warn_blocking();
  _gss_mg_check_name(target_name);
  _gss_mg_check_credential(initiator_cred_handle);
  if (!_gss_mg_log_level(1))
    goto LABEL_23;
  if (v18)
  {
    mechanism = *(uint64_t **)v18;
    if (*(_QWORD *)v18)
      goto LABEL_15;
LABEL_23:
    if (!v18)
      goto LABEL_16;
LABEL_24:
    v69 = context_handle;
    v46 = *(_QWORD *)v18;
    v19 = (const gss_OID_desc *)(*(_QWORD *)v18 + 16);
    v38 = (gss_cred_id_t *)v18;
    goto LABEL_25;
  }
  mechanism = __gss_get_mechanism(input_mech_type);
  if (!mechanism)
    goto LABEL_23;
LABEL_15:
  v27 = (const gss_OID_desc *)(mechanism + 2);
  _gss_mg_log(1, "gss_isc: %s %sfirst flags %08x, %s cred, %stoken", v20, v21, v22, v23, v24, v25, mechanism[1]);
  _gss_mg_log_cred(1, (uint64_t)initiator_cred_handle, "gss_isc cred", v28, v29, v30, v31, v32, v67);
  _gss_mg_log_name(1, (uint64_t)target_name, v27, "gss_isc: target", v33, v34, v35, v36, v68);
  if (v18)
    goto LABEL_24;
LABEL_16:
  v37 = (gss_cred_id_t *)malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
  if (!v37)
  {
    *minor_status = 12;
    return 851968;
  }
  v38 = v37;
  v69 = context_handle;
  *v37 = 0;
  v37[1] = 0;
  v37[2] = 0;
  v39 = __gss_get_mechanism(v19);
  *v38 = (gss_cred_id_t)v39;
  if (!v39)
  {
    free(v38);
    *minor_status = 0;
    v56 = "Asked for mechanism isn'ted supported";
    v52 = 0x10000;
    v57 = (size_t)v19;
    v58 = 0x10000;
    v55 = 0;
LABEL_43:
    gss_mg_set_error_string(v57, v58, v55, v56, v48, v49, v50, v51, v66);
    return v52;
  }
  v46 = (uint64_t)v39;
  _gss_mg_log(1, "gss_isc running replace plugins", v40, v41, v42, v43, v44, v45, v66);
  _gss_load_plugins();
  v74 = 0;
  v75 = 0;
  v76 = 0;
  v77 = target_name;
  v78 = v19;
  v79 = initiator_cred_handle;
  if (!krb5_homedir_access())
  {
    v75 = 1;
    LODWORD(v76) = 1;
  }
  v80 = 0;
  if (krb5_init_context(&v80))
  {
    v38[2] = 0;
  }
  else
  {
    krb5_plugin_run_f();
    heim_release();
    v38[2] = v74;
  }
LABEL_25:
  if (v38[2])
    initiator_cred_handle = v38[2];
  mn = _gss_find_mn(minor_status, (uint64_t)target_name, v19, &v73);
  if (mn)
  {
    v52 = mn;
    if (!v18)
      free(v38);
    return v52;
  }
  if (initiator_cred_handle && (*(_DWORD *)(v46 + 32) & 1) == 0)
  {
    v53 = (char *)initiator_cred_handle + 16;
    while (1)
    {
      v53 = *(char **)v53;
      if (!v53)
        break;
      if (gss_oid_equal(v19, *((gss_const_OID *)v53 + 2)))
      {
        initiator_cred_handle = (gss_cred_id_t)*((_QWORD *)v53 + 3);
        if (initiator_cred_handle)
          goto LABEL_36;
        break;
      }
    }
    v55 = 0;
    *minor_status = 0;
    if (!v18)
    {
      free(v38);
      v55 = *minor_status;
    }
    v56 = "Credential for asked mech-type mech not found in the credential handle";
    v52 = 0x100000;
    v57 = (size_t)v19;
    v58 = 0x100000;
    goto LABEL_43;
  }
LABEL_36:
  if (v73)
    elements = v73[1].elements;
  else
    elements = 0;
  v52 = (*(uint64_t (**)(OM_uint32 *, gss_cred_id_t, gss_cred_id_t *, void *, const gss_OID_desc *, uint64_t, _QWORD, gss_channel_bindings_t, gss_buffer_t, gss_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *))(v46 + 56))(minor_status, initiator_cred_handle, v38 + 1, elements, v19, v72, time_req, input_chan_bindings, input_token, actual_mech_type, output_token, ret_flags, time_rec);
  if (v52 < 2)
  {
    *v69 = (gss_ctx_id_t)v38;
  }
  else
  {
    if (!v18)
      free(v38);
    if (output_token)
    {
      output_token->length = 0;
      output_token->value = 0;
    }
    _gss_mg_error(v46, *minor_status);
  }
  _gss_mg_log(1, "gss_isc: %s maj_stat: %d/%d", v59, v60, v61, v62, v63, v64, *(_QWORD *)(v46 + 8));
  return v52;
}

uint64_t replace_cred_fun(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  OM_uint32 minor_status;
  gss_name_t dest_name;

  v4 = 2529639161;
  dest_name = 0;
  if (!*(_QWORD *)a4)
  {
    if (*(_QWORD *)(a2 + 40))
    {
      if ((*(_QWORD *)(a4 + 8) & ~*(_QWORD *)(a2 + 32)) == 0)
      {
        minor_status = 0;
        if (!gss_duplicate_name(&minor_status, *(gss_name_t *)(a4 + 24), &dest_name))
        {
          _gss_mg_log(1, "gss_isc running plugin %s", v8, v9, v10, v11, v12, v13, *(_QWORD *)(a2 + 24));
          *(_QWORD *)a4 = (*(uint64_t (**)(gss_name_t, _QWORD, _QWORD, _QWORD))(a2 + 40))(dest_name, *(_QWORD *)(a4 + 32), *(_QWORD *)(a4 + 40), *(unsigned int *)(a4 + 16));
          _gss_mg_log(1, "gss_isc plugin %s done (%s replacement)", v14, v15, v16, v17, v18, v19, *(_QWORD *)(a2 + 24));
          gss_release_name(&minor_status, &dest_name);
          if (*(_QWORD *)a4)
          {
            _gss_mg_log_cred(1, *(_QWORD *)a4, "gss_isc %s replace the credential to", v20, v21, v22, v23, v24, *(_QWORD *)(a2 + 24));
            return 0;
          }
        }
      }
    }
  }
  return v4;
}

OM_uint32 gss_inquire_context(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_name_t *src_name, gss_name_t *targ_name, OM_uint32 *lifetime_rec, gss_OID *mech_type, OM_uint32 *ctx_flags, int *locally_initiated, int *xopen)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  OM_uint32 v17;
  OM_uint32 v18;
  gss_name_t_desc_struct *name;
  gss_name_t_desc_struct *v21;
  uint64_t v22;
  uint64_t v23;

  if (locally_initiated)
    *locally_initiated = 0;
  if (xopen)
    *xopen = 0;
  if (lifetime_rec)
    *lifetime_rec = 0;
  if (src_name)
    *src_name = 0;
  if (targ_name)
    *targ_name = 0;
  if (mech_type)
    *mech_type = 0;
  v22 = 0;
  v23 = 0;
  if (!context_handle || (v13 = *((_QWORD *)context_handle + 1)) == 0)
  {
    *minor_status = 0;
    return 0x80000;
  }
  v14 = *(_QWORD *)context_handle;
  if (src_name)
    v15 = &v23;
  else
    v15 = 0;
  if (targ_name)
    v16 = &v22;
  else
    v16 = 0;
  v17 = (*(uint64_t (**)(OM_uint32 *, uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)context_handle + 192))(minor_status, v13, v15, v16);
  if (!v17)
  {
    if (src_name)
    {
      name = (gss_name_t_desc_struct *)_gss_create_name(v23, v14);
      if (!name)
      {
        if (mech_type)
          *mech_type = 0;
        (*(void (**)(OM_uint32 *, uint64_t *))(v14 + 176))(minor_status, &v23);
        goto LABEL_40;
      }
      *src_name = name;
    }
    if (!targ_name)
      return 0;
    v21 = (gss_name_t_desc_struct *)_gss_create_name(v22, v14);
    if (v21)
    {
      v18 = 0;
      *targ_name = v21;
      return v18;
    }
    if (mech_type)
      *mech_type = 0;
    if (src_name)
      gss_release_name(minor_status, src_name);
    (*(void (**)(OM_uint32 *, uint64_t *))(v14 + 176))(minor_status, &v22);
LABEL_40:
    *minor_status = 0;
    return 851968;
  }
  v18 = v17;
  _gss_mg_error(v14, *minor_status);
  return v18;
}

OM_uint32 gss_inquire_cred_by_mech(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_OID mech_type, gss_name_t *cred_name, OM_uint32 *initiator_lifetime, OM_uint32 *acceptor_lifetime, gss_cred_usage_t *cred_usage)
{
  uint64_t *mechanism;
  uint64_t v15;
  uint64_t (*v16)(OM_uint32 *, uint64_t, gss_OID, uint64_t *, OM_uint32 *, OM_uint32 *, gss_cred_usage_t *);
  _QWORD *v17;
  uint64_t v18;
  OM_uint32 v19;
  OM_uint32 v20;
  gss_name_t_desc_struct *name;
  uint64_t v23;

  *minor_status = 0;
  if (cred_name)
    *cred_name = 0;
  if (initiator_lifetime)
    *initiator_lifetime = 0;
  if (acceptor_lifetime)
    *acceptor_lifetime = 0;
  if (cred_usage)
    *cred_usage = 0;
  mechanism = __gss_get_mechanism(mech_type);
  if (!mechanism)
    return 458752;
  v15 = (uint64_t)mechanism;
  v16 = (uint64_t (*)(OM_uint32 *, uint64_t, gss_OID, uint64_t *, OM_uint32 *, OM_uint32 *, gss_cred_usage_t *))mechanism[27];
  if (!v16)
    return 458752;
  v23 = 0;
  if (cred_handle)
  {
    v17 = (_QWORD *)((char *)cred_handle + 16);
    while (1)
    {
      v17 = (_QWORD *)*v17;
      if (!v17)
        return 458752;
      if ((uint64_t *)v17[1] == mechanism)
      {
        v18 = v17[3];
        goto LABEL_17;
      }
    }
  }
  v18 = 0;
LABEL_17:
  v19 = v16(minor_status, v18, mech_type, &v23, initiator_lifetime, acceptor_lifetime, cred_usage);
  if (!v19)
  {
    if (!cred_name)
    {
      (*(void (**)(OM_uint32 *, uint64_t *))(v15 + 176))(minor_status, &v23);
      return 0;
    }
    name = (gss_name_t_desc_struct *)_gss_create_name(v23, v15);
    if (name)
    {
      v20 = 0;
      *cred_name = name;
      return v20;
    }
    (*(void (**)(OM_uint32 *, uint64_t *))(v15 + 176))(minor_status, &v23);
    return 458752;
  }
  v20 = v19;
  _gss_mg_error(v15, *minor_status);
  return v20;
}

OM_uint32 gss_inquire_cred_by_oid(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_OID desired_object, gss_buffer_set_t *data_set)
{
  _QWORD *v4;
  OM_uint32 v8;
  uint64_t v9;
  uint64_t (*v10)(OM_uint32 *, _QWORD, gss_OID, gss_buffer_set_t *);
  OM_uint32 v11;
  gss_buffer_set_t v12;
  uint64_t v13;
  uint64_t v14;
  OM_uint32 v15;
  OM_uint32 result;
  gss_buffer_set_t v17;
  gss_buffer_set_t buffer_set;

  buffer_set = 0;
  *minor_status = 0;
  *data_set = 0;
  if (!cred_handle)
    return 458752;
  v4 = (_QWORD *)*((_QWORD *)cred_handle + 2);
  if (!v4)
    return 851968;
  v8 = 851968;
  do
  {
    v17 = 0;
    v9 = v4[1];
    if (!v9)
    {
      gss_release_buffer_set(minor_status, &buffer_set);
      *minor_status = 0;
      return 0x10000;
    }
    v10 = *(uint64_t (**)(OM_uint32 *, _QWORD, gss_OID, gss_buffer_set_t *))(v9 + 280);
    if (v10)
    {
      v11 = v10(minor_status, v4[3], desired_object, &v17);
      if (v11)
      {
        v8 = v11;
        _gss_mg_error(v9, *minor_status);
      }
      else
      {
        v12 = v17;
        if (v17)
        {
          v13 = 0;
          v14 = -1;
          do
          {
            if (++v14 >= v12->count)
              break;
            v15 = gss_add_buffer_set_member(minor_status, &v12->elements[v13], &buffer_set);
            if (v15)
            {
              v8 = v15;
              goto LABEL_15;
            }
            ++v13;
            v12 = v17;
          }
          while (v17);
        }
        v8 = 0;
LABEL_15:
        gss_release_buffer_set(minor_status, &v17);
      }
    }
    v4 = (_QWORD *)*v4;
  }
  while (v4);
  if (buffer_set)
  {
    result = 0;
    *data_set = buffer_set;
    *minor_status = 0;
  }
  else if (v8)
  {
    return v8;
  }
  else
  {
    return 851968;
  }
  return result;
}

OM_uint32 gss_inquire_cred(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_name_t *name_ret, OM_uint32 *lifetime, gss_cred_usage_t *cred_usage, gss_OID_set *mechanisms)
{
  _QWORD *name;
  OM_uint32 empty_oid_set;
  OM_uint32 v14;
  uint64_t **v15;
  int v16;
  int v17;
  OM_uint32 v18;
  unsigned int v19;
  _QWORD *v20;
  uint64_t *v21;
  gss_name_t v22;
  _BOOL4 v23;
  uint64_t v24;
  unsigned int (*v25)(OM_uint32 *, _QWORD, gss_name_t *, OM_uint32 *, unsigned int *, _QWORD);
  unsigned int v26;
  _QWORD *v27;
  int v29;
  gss_cred_usage_t *v30;
  OM_uint32 v31;
  gss_name_t input_name;
  unsigned int v33;

  _gss_load_mech();
  *minor_status = 0;
  if (name_ret)
    *name_ret = 0;
  if (lifetime)
    *lifetime = 0;
  if (cred_usage)
    *cred_usage = 0;
  if (mechanisms)
    *mechanisms = 0;
  if (name_ret)
  {
    name = _gss_create_name(0, 0);
    if (!name)
    {
      *minor_status = 12;
      return 851968;
    }
    if (!mechanisms)
      goto LABEL_17;
LABEL_14:
    empty_oid_set = gss_create_empty_oid_set(minor_status, mechanisms);
    if (empty_oid_set)
    {
      v14 = empty_oid_set;
      if (name)
        free(name);
      return v14;
    }
    goto LABEL_17;
  }
  name = 0;
  if (mechanisms)
    goto LABEL_14;
LABEL_17:
  v33 = 0;
  if (cred_handle)
  {
    v15 = (uint64_t **)*((_QWORD *)cred_handle + 2);
    if (v15)
    {
      v30 = cred_usage;
      v16 = 0;
      v17 = 0;
      v18 = -1;
      while (1)
      {
        input_name = 0;
        v31 = 0;
        if (!((unsigned int (*)(OM_uint32 *, uint64_t *, gss_name_t *, OM_uint32 *, unsigned int *, _QWORD))v15[1][23])(minor_status, v15[3], &input_name, &v31, &v33, 0))
        {
          v19 = 3 - v33;
          if (v33 > 3)
            v19 = 0;
          v17 |= v19;
          if (!name)
          {
            ((void (*)(OM_uint32 *, gss_name_t *))v15[1][22])(minor_status, &input_name);
            goto LABEL_27;
          }
          v20 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
          v21 = v15[1];
          if (v20)
          {
            v20[1] = v21;
            v22 = input_name;
            v20[2] = v15[2];
            v20[3] = v22;
            *v20 = name[6];
            name[6] = v20;
LABEL_27:
            if (v31 < v18)
              v18 = v31;
            if (mechanisms)
              gss_add_oid_set_member(minor_status, (gss_const_OID)v15[2], mechanisms);
            ++v16;
            goto LABEL_33;
          }
          ((void (*)(OM_uint32 *, gss_name_t *))v21[22])(minor_status, &input_name);
        }
LABEL_33:
        v15 = (uint64_t **)*v15;
        if (!v15)
          goto LABEL_34;
      }
    }
LABEL_64:
    v23 = 0;
    goto LABEL_65;
  }
  v24 = _gss_mechs;
  if (!_gss_mechs)
    goto LABEL_64;
  v30 = cred_usage;
  v16 = 0;
  v17 = 0;
  v18 = -1;
  do
  {
    input_name = 0;
    v31 = 0;
    v25 = *(unsigned int (**)(OM_uint32 *, _QWORD, gss_name_t *, OM_uint32 *, unsigned int *, _QWORD))(v24 + 224);
    if (v25 && !v25(minor_status, 0, &input_name, &v31, &v33, 0))
    {
      v26 = 3 - v33;
      if (v33 > 3)
        v26 = 0;
      v17 |= v26;
      if (name && input_name)
      {
        v27 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        if (!v27)
        {
          (*(void (**)(OM_uint32 *, gss_name_t *))(v24 + 216))(minor_status, &input_name);
          goto LABEL_61;
        }
        v27[1] = v24 + 40;
        v27[2] = v24 + 8;
        v27[3] = input_name;
        *v27 = name[6];
        name[6] = v27;
      }
      else if (input_name)
      {
        (*(void (**)(OM_uint32 *, gss_name_t *))(v24 + 216))(minor_status, &input_name);
      }
      if (v31 < v18)
        v18 = v31;
      if (mechanisms)
        gss_add_oid_set_member(minor_status, (gss_const_OID)(v24 + 8), mechanisms);
      ++v16;
    }
LABEL_61:
    v24 = *(_QWORD *)v24;
  }
  while (v24);
LABEL_34:
  v23 = v18 == 0;
  if (v16 && v18)
  {
    *minor_status = 0;
    if (name_ret)
      *name_ret = (gss_name_t)name;
    if (lifetime)
      *lifetime = v18;
    if (!v30)
      return 0;
    if ((~v17 & 3) == 0)
    {
      v14 = 0;
      *v30 = 0;
      return v14;
    }
    if ((v17 & 2) != 0)
    {
      v14 = 0;
      v29 = 1;
    }
    else
    {
      if ((v17 & 1) == 0)
        return 0;
      v14 = 0;
      v29 = 2;
    }
    *v30 = v29;
    return v14;
  }
LABEL_65:
  input_name = (gss_name_t)name;
  if (name)
    gss_release_name(minor_status, &input_name);
  gss_release_oid_set(minor_status, mechanisms);
  *minor_status = 0;
  if (v23)
    return 720896;
  else
    return 458752;
}

OM_uint32 gss_inquire_mechs_for_name(OM_uint32 *minor_status, gss_name_t input_name, gss_OID_set *mech_types)
{
  OM_uint32 empty_oid_set;
  uint64_t v7;
  const gss_OID_desc *v8;
  OM_uint32 v9;
  int present;
  gss_OID_set name_types;

  *minor_status = 0;
  _gss_load_mech();
  empty_oid_set = gss_create_empty_oid_set(minor_status, mech_types);
  if (!empty_oid_set)
  {
    v7 = _gss_mechs;
    if (_gss_mechs)
    {
      name_types = 0;
      present = 0;
      v8 = (const gss_OID_desc *)((char *)input_name + 16);
      while (1)
      {
        v9 = gss_inquire_names_for_mech(minor_status, (gss_const_OID)(v7 + 8), &name_types);
        if (v9)
          break;
        gss_test_oid_set_member(minor_status, v8, name_types, &present);
        gss_release_oid_set(minor_status, &name_types);
        if (present)
        {
          v9 = gss_add_oid_set_member(minor_status, (gss_const_OID)(v7 + 8), mech_types);
          if (v9)
            break;
        }
        v7 = *(_QWORD *)v7;
        if (!v7)
          return 0;
      }
      empty_oid_set = v9;
      gss_release_oid_set(minor_status, mech_types);
    }
    else
    {
      return 0;
    }
  }
  return empty_oid_set;
}

OM_uint32 gss_inquire_names_for_mech(OM_uint32 *minor_status, gss_const_OID mechanism, gss_OID_set *name_types)
{
  uint64_t *v6;
  uint64_t (*v7)(OM_uint32 *, gss_const_OID, gss_OID_set *);
  OM_uint32 empty_oid_set;
  OM_uint32 v10;
  OM_uint32 *p_minor_statusa;
  OM_uint32 minor_statusa;
  int v13;

  v6 = __gss_get_mechanism(mechanism);
  *minor_status = 0;
  *name_types = 0;
  if (!v6)
    return 0x10000;
  v7 = (uint64_t (*)(OM_uint32 *, gss_const_OID, gss_OID_set *))v6[30];
  if (v7)
    return v7(minor_status, mechanism, name_types);
  empty_oid_set = gss_create_empty_oid_set(minor_status, name_types);
  if (!empty_oid_set)
  {
    v10 = gss_add_oid_set_member(minor_status, &__gss_c_nt_hostbased_service_oid_desc, name_types);
    if (v10)
    {
      empty_oid_set = v10;
      v13 = 0;
      p_minor_statusa = (OM_uint32 *)&v13;
LABEL_10:
      gss_release_oid_set(p_minor_statusa, name_types);
      return empty_oid_set;
    }
    empty_oid_set = gss_add_oid_set_member(minor_status, &__gss_c_nt_user_name_oid_desc, name_types);
    if (empty_oid_set)
    {
      minor_statusa = 0;
      p_minor_statusa = &minor_statusa;
      goto LABEL_10;
    }
  }
  return empty_oid_set;
}

OM_uint32 gss_inquire_sec_context_by_oid(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_OID desired_object, gss_buffer_set_t *data_set)
{
  uint64_t v4;
  uint64_t (*v5)(void);
  OM_uint32 v7;

  *minor_status = 0;
  *data_set = 0;
  if (!context_handle)
    return 0x80000;
  v4 = *(_QWORD *)context_handle;
  if (!*(_QWORD *)context_handle)
    return 0x10000;
  v5 = *(uint64_t (**)(void))(v4 + 272);
  if (!v5)
    return 0x10000;
  v7 = v5();
  if (v7)
    _gss_mg_error(v4, *minor_status);
  return v7;
}

OM_uint32 gss_krb5_copy_ccache(OM_uint32 *minor_status, gss_cred_id_t cred, krb5_ccache_data *out)
{
  OM_uint32 result;
  krb5_error_code inited;
  OM_uint32 v6;
  int v7;
  krb5_error_code v8;
  OM_uint32 v9;
  char *v10;
  krb5_ccache v11;
  krb5_context v12;
  gss_buffer_set_t data_set;

  v12 = 0;
  data_set = 0;
  v10 = 0;
  v11 = 0;
  result = gss_inquire_cred_by_oid(minor_status, cred, &__gss_krb5_copy_ccache_x_oid_desc, &data_set);
  if (!result)
  {
    if (data_set && data_set->count)
    {
      inited = krb5_init_context(&v12);
      if (inited)
      {
        *minor_status = inited;
        gss_release_buffer_set(minor_status, &data_set);
        return 851968;
      }
      v7 = asprintf(&v10, "%.*s", data_set->elements->length, (const char *)data_set->elements->value);
      gss_release_buffer_set(minor_status, &data_set);
      if ((v7 & 0x80000000) == 0 && v10)
      {
        v8 = krb5_cc_resolve(v12, v10, &v11);
        free(v10);
        if (v8)
        {
          *minor_status = v8;
        }
        else
        {
          v9 = krb5_cc_copy_cache();
          krb5_cc_close(v12, v11);
          heim_release();
          if (!v9)
            return 0;
          *minor_status = v9;
        }
        return 851968;
      }
      v6 = 12;
    }
    else
    {
      gss_release_buffer_set(minor_status, &data_set);
      v6 = 22;
    }
    *minor_status = v6;
    return 851968;
  }
  return result;
}

uint64_t __ApplePrivate_gss_krb5_import_cred(OM_uint32 *a1, uint64_t a2, const krb5_principal_data *a3, uint64_t a4, gss_cred_id_t *a5)
{
  krb5_error_code inited;
  uint64_t v11;
  OM_uint32 full_name;
  OM_uint32 v13;
  OM_uint32 v15;
  OM_uint32 v16;
  void *v17;
  gss_buffer_desc_struct v18;
  krb5_context v19;
  gss_buffer_desc_struct value;

  value.length = 0;
  value.value = 0;
  v18.value = 0;
  v19 = 0;
  v17 = 0;
  v18.length = 0;
  *a5 = 0;
  inited = krb5_init_context(&v19);
  if (!inited)
  {
    if (!krb5_storage_emem())
    {
      *a1 = 12;
      v11 = 851968;
LABEL_16:
      heim_release();
      return v11;
    }
    if (a2)
    {
      full_name = krb5_cc_get_full_name();
      if (!full_name)
      {
        full_name = krb5_store_string();
        free(v17);
        if (!full_name)
        {
LABEL_7:
          if (a3)
          {
            v13 = krb5_unparse_name(v19, a3, (char **)&v17);
            if (v13 || (v13 = krb5_store_string(), free(v17), v13))
            {
              *a1 = v13;
              goto LABEL_14;
            }
          }
          else
          {
            krb5_store_string();
          }
          if (a4)
          {
            v15 = krb5_kt_get_full_name();
            if (v15 || (v15 = krb5_store_string(), free(v17), v15))
            {
              *a1 = v15;
              goto LABEL_14;
            }
          }
          else
          {
            krb5_store_string();
          }
          v16 = krb5_storage_to_data();
          if (!v16)
          {
            value = v18;
            v11 = gss_set_cred_option(a1, a5, &__gss_krb5_import_cred_x_oid_desc, &value);
            krb5_data_free();
            goto LABEL_15;
          }
          *a1 = v16;
LABEL_14:
          v11 = 851968;
LABEL_15:
          krb5_storage_free();
          goto LABEL_16;
        }
      }
    }
    else
    {
      full_name = krb5_store_string();
      if (!full_name)
        goto LABEL_7;
    }
    *a1 = full_name;
    goto LABEL_14;
  }
  *a1 = inited;
  return 851968;
}

OM_uint32 gsskrb5_register_acceptor_identity(const char *identity)
{
  uint64_t *mechanism;
  uint64_t (*v3)(int *, _QWORD, gss_OID_desc *, _QWORD *);
  int v5;
  _QWORD v6[2];

  _gss_load_mech();
  v6[1] = identity;
  v6[0] = strlen(identity);
  mechanism = __gss_get_mechanism(&__gss_krb5_mechanism_oid_desc);
  if (!mechanism)
    return 851968;
  v3 = (uint64_t (*)(int *, _QWORD, gss_OID_desc *, _QWORD *))mechanism[36];
  if (!v3)
    return 851968;
  v5 = 0;
  return v3(&v5, 0, &__gss_krb5_register_acceptor_identity_x_oid_desc, v6);
}

uint64_t __ApplePrivate_gsskrb5_set_dns_canonicalize(int a1)
{
  _QWORD *v1;
  void (*v2)(int *, _QWORD, gss_OID_desc *, _QWORD *);
  BOOL v4;
  int v5;
  _QWORD v6[2];

  v4 = a1 != 0;
  _gss_load_mech();
  v6[0] = 1;
  v6[1] = &v4;
  v1 = (_QWORD *)_gss_mechs;
  if (_gss_mechs)
  {
    v5 = 0;
    do
    {
      v2 = (void (*)(int *, _QWORD, gss_OID_desc *, _QWORD *))v1[41];
      if (v2)
        v2(&v5, 0, &__gss_krb5_set_dns_canonicalize_x_oid_desc, v6);
      v1 = (_QWORD *)*v1;
    }
    while (v1);
  }
  return 0;
}

OM_uint32 gss_krb5_export_lucid_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, OM_uint32 version, void **rctx)
{
  gss_ctx_id_t_desc_struct *v5;
  OM_uint32 result;
  krb5_error_code inited;
  OM_uint32 v8;
  void *v9;
  uint64_t v10;
  int v11;
  gss_buffer_set_t data_set;
  krb5_context v13;

  data_set = 0;
  v13 = 0;
  if (context_handle)
  {
    if (version == 1)
    {
      v5 = *context_handle;
      if (v5)
      {
        v11 = 0;
        result = gss_inquire_sec_context_by_oid(minor_status, v5, &__gss_krb5_export_lucid_context_v1_x_oid_desc, &data_set);
        if (result)
          return result;
        if (data_set && data_set->count == 1)
        {
          inited = krb5_init_context(&v13);
          if (inited)
          {
            v8 = inited;
            v9 = 0;
          }
          else
          {
            v9 = malloc_type_calloc(1uLL, 0x68uLL, 0x108004058AB55F0uLL);
            if (v9 && krb5_storage_from_mem())
            {
              v8 = krb5_ret_uint32();
              if (!v8)
                v8 = 22;
              gss_release_buffer_set(minor_status, &data_set);
              krb5_storage_free();
              goto LABEL_19;
            }
            v8 = 12;
          }
          gss_release_buffer_set(minor_status, &data_set);
LABEL_19:
          if (v13)
            heim_release();
          LODWORD(v10) = 0;
          if (v9)
            gss_krb5_free_lucid_sec_context((OM_uint32 *)&v10, v9);
          *minor_status = v8;
          return 851968;
        }
        gss_release_buffer_set(minor_status, &data_set);
      }
    }
  }
  *minor_status = 22;
  return 851968;
}

uint64_t set_key(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  size_t v6;
  BOOL v7;

  v4 = *(_QWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 4) = v4;
  v5 = malloc_type_malloc(v4, 0x1219F407uLL);
  *(_QWORD *)(a2 + 8) = v5;
  v6 = *(unsigned int *)(a2 + 4);
  if (v5)
    v7 = 1;
  else
    v7 = (_DWORD)v6 == 0;
  if (!v7)
    return 12;
  memcpy(v5, *(const void **)(a1 + 16), v6);
  return 0;
}

OM_uint32 gss_krb5_free_lucid_sec_context(OM_uint32 *minor_status, void *c)
{
  int v4;
  char *v5;
  OM_uint32 v6;
  OM_uint32 result;

  if (*(_DWORD *)c != 1)
  {
    v6 = 851968;
    result = 851968;
    if (!minor_status)
      return result;
    goto LABEL_6;
  }
  v4 = *((_DWORD *)c + 8);
  if (v4 == 1)
  {
    free_key((uint64_t)c + 72);
    if (!*((_DWORD *)c + 16))
      goto LABEL_11;
    v5 = (char *)c + 88;
  }
  else
  {
    if (v4)
      goto LABEL_11;
    v5 = (char *)c + 48;
  }
  free_key((uint64_t)v5);
LABEL_11:
  free(c);
  v6 = 0;
  result = 0;
  if (!minor_status)
    return result;
LABEL_6:
  *minor_status = 0;
  return v6;
}

void free_key(uint64_t a1)
{
  bzero(*(void **)(a1 + 8), *(unsigned int *)(a1 + 4));
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

OM_uint32 gss_krb5_set_allowable_enctypes(OM_uint32 *minor_status, gss_cred_id_t cred, OM_uint32 num_enctypes, int32_t *enctypes)
{
  uint64_t v5;
  OM_uint32 v7;
  OM_uint32 v8;
  gss_buffer_desc_struct value;
  gss_cred_id_t cred_handle;

  LODWORD(v5) = num_enctypes;
  cred_handle = cred;
  if (krb5_storage_emem())
  {
    value.length = 0;
    value.value = 0;
    if ((_DWORD)v5)
    {
      v5 = v5;
      while (1)
      {
        ++enctypes;
        v7 = krb5_store_int32();
        if (v7)
          break;
        if (!--v5)
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      v7 = krb5_storage_to_data();
      if (!v7)
      {
        value.length = 0;
        value.value = 0;
        v8 = gss_set_cred_option(minor_status, &cred_handle, &__gss_krb5_set_allowable_enctypes_x_oid_desc, &value);
        krb5_data_free();
        goto LABEL_10;
      }
    }
    *minor_status = v7;
    v8 = 851968;
LABEL_10:
    krb5_storage_free();
    return v8;
  }
  *minor_status = 12;
  return 851968;
}

OM_uint32 gss_krb5_ccache_name(OM_uint32 *minor_status, const char *name, const char **out_name)
{
  size_t v5;
  _QWORD *v6;
  void (*v7)(int *, _QWORD, gss_OID_desc *, _QWORD *);
  int v9;
  _QWORD v10[2];

  _gss_load_mech();
  if (out_name)
    *out_name = 0;
  if (name)
    v5 = strlen(name);
  else
    v5 = 0;
  v10[0] = v5;
  v10[1] = name;
  v6 = (_QWORD *)_gss_mechs;
  if (_gss_mechs)
  {
    v9 = 0;
    do
    {
      v7 = (void (*)(int *, _QWORD, gss_OID_desc *, _QWORD *))v6[41];
      if (v7)
        v7(&v9, 0, &__gss_krb5_ccache_name_x_oid_desc, v10);
      v6 = (_QWORD *)*v6;
    }
    while (v6);
  }
  return 0;
}

uint64_t __ApplePrivate_gsskrb5_extract_authtime_from_sec_context(OM_uint32 *minor_status, gss_ctx_id_t_desc_struct *a2, _QWORD *a3)
{
  uint64_t v5;
  gss_buffer_desc *elements;
  OM_uint32 v7;
  gss_buffer_set_t data_set;

  data_set = 0;
  if (!a2)
  {
    v5 = 851968;
    v7 = 22;
LABEL_10:
    *minor_status = v7;
    return v5;
  }
  v5 = gss_inquire_sec_context_by_oid(minor_status, a2, &__gss_krb5_get_authtime_x_oid_desc, &data_set);
  if (!(_DWORD)v5)
  {
    if (data_set && data_set->count == 1 && (elements = data_set->elements, elements->length == 4))
    {
      v7 = 0;
      v5 = 0;
      *a3 = *(int *)elements->value;
    }
    else
    {
      v5 = 851968;
      v7 = 22;
    }
    gss_release_buffer_set(minor_status, &data_set);
    goto LABEL_10;
  }
  return v5;
}

OM_uint32 gsskrb5_extract_authz_data_from_sec_context(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int ad_type, gss_buffer_t ad_data)
{
  OM_uint32 v8;
  OM_uint32 v9;
  void *v11;
  int *v12;
  void *v13;
  void *v14;
  void *v15;
  gss_buffer_desc *elements;
  size_t length;
  void *v18;
  gss_OID_desc_struct desired_object;
  gss_buffer_set_t data_set;

  data_set = 0;
  if (!context_handle)
    goto LABEL_3;
  *(_QWORD *)&desired_object.length = 0;
  if (der_get_oid())
    goto LABEL_3;
  v11 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  v18 = v11;
  if (!v11)
  {
    der_free_oid();
    goto LABEL_12;
  }
  v12 = (int *)v11;
  der_free_oid();
  *v12 = ad_type;
  desired_object.length = der_length_oid();
  v13 = malloc_type_malloc(desired_object.length, 0x8641AD8DuLL);
  desired_object.elements = v13;
  if (!v13)
  {
    free(v18);
    goto LABEL_12;
  }
  v14 = v13;
  if (der_put_oid())
  {
    free(v18);
    free(v14);
LABEL_3:
    v8 = 851968;
    v9 = 22;
LABEL_4:
    *minor_status = v9;
    return v8;
  }
  if (desired_object.length)
    abort();
  free(v18);
  v8 = gss_inquire_sec_context_by_oid(minor_status, context_handle, &desired_object, &data_set);
  free(desired_object.elements);
  if (!v8)
  {
    if (!data_set || data_set->count != 1)
    {
      gss_release_buffer_set(minor_status, &data_set);
      goto LABEL_3;
    }
    v15 = malloc_type_malloc(data_set->elements->length, 0xECBD9367uLL);
    ad_data->value = v15;
    if (v15)
    {
      elements = data_set->elements;
      length = elements->length;
      ad_data->length = elements->length;
      memcpy(v15, elements->value, length);
      gss_release_buffer_set(minor_status, &data_set);
      v9 = 0;
      v8 = 0;
      goto LABEL_4;
    }
    gss_release_buffer_set(minor_status, &data_set);
LABEL_12:
    v8 = 851968;
    v9 = 12;
    goto LABEL_4;
  }
  return v8;
}

uint64_t __ApplePrivate_gsskrb5_extract_service_keyblock(OM_uint32 *a1, gss_ctx_id_t_desc_struct *a2, krb5_keyblock **a3)
{
  return gsskrb5_extract_key(a1, a2, &__gss_krb5_get_service_keyblock_x_oid_desc, a3);
}

uint64_t gsskrb5_extract_key(OM_uint32 *a1, gss_ctx_id_t_desc_struct *a2, gss_OID_desc_struct *a3, krb5_keyblock **a4)
{
  krb5_error_code inited;
  uint64_t result;
  int v10;
  krb5_context v11;
  gss_buffer_set_t data_set;

  v11 = 0;
  data_set = 0;
  if (!a2)
    goto LABEL_10;
  inited = krb5_init_context(&v11);
  if (inited)
  {
    *a1 = inited;
    return 851968;
  }
  result = gss_inquire_sec_context_by_oid(a1, a2, a3, &data_set);
  if ((_DWORD)result)
    return result;
  if (!data_set || data_set->count != 1)
  {
    gss_release_buffer_set(a1, &data_set);
LABEL_10:
    *a1 = 22;
    return 851968;
  }
  if (krb5_storage_from_mem())
  {
    *a4 = (krb5_keyblock *)malloc_type_calloc(1uLL, 0x18uLL, 0x10800404ACF7207uLL);
    v10 = krb5_ret_keyblock();
    gss_release_buffer_set(a1, &data_set);
    krb5_storage_free();
  }
  else
  {
    gss_release_buffer_set(a1, &data_set);
    v10 = 12;
  }
  if (a4 && v10)
  {
    krb5_free_keyblock(v11, *a4);
    *a4 = 0;
  }
  if (v11)
    heim_release();
  *a1 = v10;
  if (v10)
    return 851968;
  else
    return 0;
}

uint64_t __ApplePrivate_gsskrb5_get_initiator_subkey(OM_uint32 *a1, gss_ctx_id_t_desc_struct *a2, krb5_keyblock **a3)
{
  return gsskrb5_extract_key(a1, a2, &__gss_krb5_get_initiator_subkey_x_oid_desc, a3);
}

uint64_t __ApplePrivate_gsskrb5_get_subkey(OM_uint32 *a1, gss_ctx_id_t_desc_struct *a2, krb5_keyblock **a3)
{
  return gsskrb5_extract_key(a1, a2, &__gss_krb5_get_subkey_x_oid_desc, a3);
}

uint64_t __ApplePrivate_gsskrb5_set_default_realm(const char *a1)
{
  _QWORD *v2;
  void (*v3)(int *, _QWORD, gss_OID_desc *, _QWORD *);
  int v5;
  _QWORD v6[2];

  _gss_load_mech();
  v6[1] = a1;
  v6[0] = strlen(a1);
  v2 = (_QWORD *)_gss_mechs;
  if (_gss_mechs)
  {
    v5 = 0;
    do
    {
      v3 = (void (*)(int *, _QWORD, gss_OID_desc *, _QWORD *))v2[41];
      if (v3)
        v3(&v5, 0, &__gss_krb5_set_default_realm_x_oid_desc, v6);
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t __ApplePrivate_gss_krb5_get_tkt_flags(OM_uint32 *minor_status, gss_ctx_id_t_desc_struct *a2, _DWORD *a3)
{
  uint64_t result;
  gss_buffer_desc *elements;
  gss_buffer_set_t data_set;

  data_set = 0;
  if (a2)
  {
    result = gss_inquire_sec_context_by_oid(minor_status, a2, &__gss_krb5_get_tkt_flags_x_oid_desc, &data_set);
    if ((_DWORD)result)
      return result;
    if (data_set)
    {
      if (data_set->count == 1)
      {
        elements = data_set->elements;
        if (elements->length > 3)
        {
          *a3 = *(_DWORD *)elements->value;
          gss_release_buffer_set(minor_status, &data_set);
          return 0;
        }
      }
    }
    gss_release_buffer_set(minor_status, &data_set);
  }
  *minor_status = 22;
  return 851968;
}

uint64_t __ApplePrivate_gsskrb5_set_time_offset(int a1)
{
  _QWORD *v1;
  void (*v2)(int *, _QWORD, gss_OID_desc *, _QWORD *);
  int v4;
  int v5;
  _QWORD v6[2];

  v4 = a1;
  _gss_load_mech();
  v6[0] = 4;
  v6[1] = &v4;
  v1 = (_QWORD *)_gss_mechs;
  if (_gss_mechs)
  {
    v5 = 0;
    do
    {
      v2 = (void (*)(int *, _QWORD, gss_OID_desc *, _QWORD *))v1[41];
      if (v2)
        v2(&v5, 0, &__gss_krb5_set_time_offset_x_oid_desc, v6);
      v1 = (_QWORD *)*v1;
    }
    while (v1);
  }
  return 0;
}

uint64_t __ApplePrivate_gsskrb5_get_time_offset(_DWORD *a1)
{
  _QWORD *v2;
  uint64_t (*v3)(char *, _QWORD, gss_OID_desc *, _QWORD *);
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  _gss_load_mech();
  v6[0] = 4;
  v6[1] = &v5;
  v2 = (_QWORD *)_gss_mechs;
  if (!_gss_mechs)
    return 0x100000;
  v5 = 0;
  while (1)
  {
    v3 = (uint64_t (*)(char *, _QWORD, gss_OID_desc *, _QWORD *))v2[41];
    if (v3)
    {
      result = v3((char *)&v5 + 4, 0, &__gss_krb5_get_time_offset_x_oid_desc, v6);
      if (!(_DWORD)result)
        break;
    }
    v2 = (_QWORD *)*v2;
    if (!v2)
      return 0x100000;
  }
  *a1 = v5;
  return result;
}

uint64_t _gss_load_mech()
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  FILE *v8;
  FILE *v9;
  uint64_t v10;
  char *v11;
  char *i;
  uint64_t v13;
  char *v14;
  char *j;
  uint64_t v16;
  char *v17;
  char *k;
  uint64_t v19;
  char *v20;
  int v21;
  char *v22;
  char *v23;
  _BYTE *v24;
  char v25;
  size_t v26;
  int v27;
  char v28;
  char *v29;
  char *v30;
  char *v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  BOOL v36;
  int v37;
  _BYTE *v38;
  uint64_t *v39;
  void *v40;
  char *v41;
  _QWORD *v42;
  void *v43;
  OM_uint32 (__cdecl *v44)(OM_uint32 *, gss_name_t, OM_uint32, gss_OID_set, gss_cred_usage_t, gss_cred_id_t *, gss_OID_set *, OM_uint32 *);
  OM_uint32 (__cdecl *v45)(OM_uint32 *, gss_cred_id_t *);
  OM_uint32 (__cdecl *v46)(OM_uint32 *, gss_cred_id_t, gss_ctx_id_t *, gss_name_t, gss_OID, OM_uint32, OM_uint32, gss_channel_bindings_t, gss_buffer_t, gss_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *);
  OM_uint32 (__cdecl *v47)(OM_uint32 *, gss_ctx_id_t *, gss_cred_id_t, gss_buffer_t, gss_channel_bindings_t, gss_name_t *, gss_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *, gss_cred_id_t *);
  OM_uint32 (__cdecl *v48)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t);
  OM_uint32 (__cdecl *v49)(OM_uint32 *, gss_ctx_id_t *, gss_buffer_t);
  OM_uint32 (__cdecl *v50)(OM_uint32 *, gss_ctx_id_t, OM_uint32 *);
  OM_uint32 (__cdecl *v51)(OM_uint32 *, gss_ctx_id_t, gss_qop_t, gss_buffer_t, gss_buffer_t);
  OM_uint32 (__cdecl *v52)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t, gss_buffer_t, gss_qop_t *);
  OM_uint32 (__cdecl *v53)(OM_uint32 *, gss_ctx_id_t, int, gss_qop_t, gss_buffer_t, int *, gss_buffer_t);
  OM_uint32 (__cdecl *v54)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t, gss_buffer_t, int *, gss_qop_t *);
  OM_uint32 (__cdecl *v55)(OM_uint32 *, OM_uint32, int, gss_OID, OM_uint32 *, gss_buffer_t);
  OM_uint32 (__cdecl *v56)(OM_uint32 *, gss_OID_set *);
  OM_uint32 (__cdecl *v57)(OM_uint32 *, gss_name_t, gss_name_t, int *);
  OM_uint32 (__cdecl *v58)(OM_uint32 *, gss_name_t, gss_buffer_t, gss_OID *);
  OM_uint32 (__cdecl *v59)(OM_uint32 *, gss_buffer_t, gss_const_OID, gss_name_t *);
  OM_uint32 (__cdecl *v60)(OM_uint32 *, gss_name_t, gss_buffer_t);
  OM_uint32 (__cdecl *v61)(OM_uint32 *, gss_name_t *);
  OM_uint32 (__cdecl *v62)(OM_uint32 *, gss_cred_id_t, gss_name_t *, OM_uint32 *, gss_cred_usage_t *, gss_OID_set *);
  OM_uint32 (__cdecl *v63)(OM_uint32 *, gss_ctx_id_t, gss_name_t *, gss_name_t *, OM_uint32 *, gss_OID *, OM_uint32 *, int *, int *);
  OM_uint32 (__cdecl *v64)(OM_uint32 *, gss_ctx_id_t, int, gss_qop_t, OM_uint32, OM_uint32 *);
  OM_uint32 (__cdecl *v65)(OM_uint32 *, gss_cred_id_t, gss_name_t, gss_OID, gss_cred_usage_t, OM_uint32, OM_uint32, gss_cred_id_t *, gss_OID_set *, OM_uint32 *, OM_uint32 *);
  OM_uint32 (__cdecl *v66)(OM_uint32 *, gss_cred_id_t, gss_OID, gss_name_t *, OM_uint32 *, OM_uint32 *, gss_cred_usage_t *);
  OM_uint32 (__cdecl *v67)(OM_uint32 *, gss_ctx_id_t *, gss_buffer_t);
  OM_uint32 (__cdecl *v68)(OM_uint32 *, gss_buffer_t, gss_ctx_id_t *);
  OM_uint32 (__cdecl *v69)(OM_uint32 *, gss_const_OID, gss_OID_set *);
  OM_uint32 (__cdecl *v70)(OM_uint32 *, gss_name_t, gss_OID_set *);
  OM_uint32 (__cdecl *v71)(OM_uint32 *, gss_name_t, gss_OID, gss_name_t *);
  OM_uint32 (__cdecl *v72)(OM_uint32 *, gss_name_t, gss_name_t *);
  OM_uint32 (__cdecl *v73)(OM_uint32 *, gss_cred_id_t, gss_OID, gss_buffer_set_t *);
  OM_uint32 (__cdecl *v74)(OM_uint32 *, gss_cred_id_t, gss_OID, gss_buffer_set_t *);
  OM_uint32 (__cdecl *v75)(OM_uint32 *, gss_ctx_id_t, gss_OID, gss_buffer_set_t *);
  OM_uint32 (__cdecl *v76)(OM_uint32 *, gss_ctx_id_t, gss_OID, gss_buffer_set_t *);
  OM_uint32 (__cdecl *v77)(OM_uint32 *, gss_ctx_id_t *, gss_OID, gss_buffer_t);
  OM_uint32 (__cdecl *v78)(OM_uint32 *, gss_ctx_id_t *, gss_OID, gss_buffer_t);
  OM_uint32 (__cdecl *v79)(OM_uint32 *, gss_ctx_id_t, int, gss_buffer_t, ssize_t, gss_buffer_t);
  OM_uint32 (__cdecl *v80)(OM_uint32 *, gss_ctx_id_t, int, gss_buffer_t, ssize_t, gss_buffer_t);
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t (*v87)(OM_uint32 *, uint64_t, uint64_t, gss_const_OID, uint64_t, uint64_t, gss_OID_set *, _DWORD *);
  uint64_t (*v88)(OM_uint32 *, uint64_t, uint64_t, gss_const_OID, uint64_t, uint64_t, gss_OID_set *, _DWORD *);
  OM_uint32 (__cdecl *v89)(OM_uint32 *, gss_cred_id_t, gss_buffer_t);
  OM_uint32 (__cdecl *v90)(OM_uint32 *, gss_cred_id_t, gss_buffer_t);
  OM_uint32 (__cdecl *v91)(OM_uint32 *, gss_buffer_t, gss_cred_id_t *);
  OM_uint32 (__cdecl *v92)(OM_uint32 *, gss_buffer_t, gss_cred_id_t *);
  void *v93;
  void *v94;
  OM_uint32 (__cdecl *v95)(OM_uint32 *, gss_name_t, int *, gss_OID *, gss_buffer_set_t *);
  OM_uint32 (__cdecl *v96)(OM_uint32 *, gss_name_t, int *, gss_OID *, gss_buffer_set_t *);
  void *v97;
  void *v98;
  uint64_t (*v99)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v100)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v101)(_DWORD *, uint64_t, uint64_t);
  uint64_t (*v102)(_DWORD *, uint64_t, uint64_t);
  void *v103;
  void *v104;
  uint64_t (*v105)(unsigned int *, uint64_t, const gss_OID_desc *, uid_t *);
  uint64_t (*v106)(unsigned int *, uint64_t, const gss_OID_desc *, uid_t *);
  void *v107;
  FILE *v108;
  const char *v109;
  size_t v110;
  OM_uint32 (__cdecl *v111)(OM_uint32 *, gss_OID, gss_buffer_t, gss_buffer_t, gss_buffer_t);
  OM_uint32 (__cdecl *v112)(OM_uint32 *, gss_OID, gss_buffer_t, gss_buffer_t, gss_buffer_t);
  OM_uint32 (__cdecl *v113)(OM_uint32 *, gss_buffer_t, gss_OID *);
  OM_uint32 (__cdecl *v114)(OM_uint32 *, gss_buffer_t, gss_OID *);
  OM_uint32 (__cdecl *v115)(OM_uint32 *, gss_const_OID, gss_OID_set *, gss_OID_set *);
  OM_uint32 (__cdecl *v116)(OM_uint32 *, gss_const_OID, gss_OID_set *, gss_OID_set *);
  OM_uint32 (__cdecl *v117)(OM_uint32 *, gss_name_t, gss_buffer_t, OM_uint32, gss_OID_set, gss_cred_usage_t, gss_cred_id_t *, gss_OID_set *, OM_uint32 *);
  OM_uint32 (__cdecl *v118)(OM_uint32 *, gss_name_t, gss_buffer_t, OM_uint32, gss_OID_set, gss_cred_usage_t, gss_cred_id_t *, gss_OID_set *, OM_uint32 *);
  void (*v119)(OM_uint32 *, _QWORD *, _QWORD *);
  FILE *v120;
  OM_uint32 minor_status;
  int v122;
  gss_OID_desc b;
  char *__stringp;
  OM_uint32 v125;
  char v126[256];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  pthread_mutex_lock(&_gss_mech_mutex);
  if (_gss_mechs)
    return pthread_mutex_unlock(&_gss_mech_mutex);
  minor_status = 0;
  if (!gss_create_empty_oid_set(&minor_status, (gss_OID_set *)&_gss_mech_oids))
  {
    v1 = __gss_pku2u_initialize();
    add_builtin((uint64_t)v1);
    v2 = __gss_iakerb_initialize();
    add_builtin((uint64_t)v2);
    v3 = __gss_ntlm_initialize();
    add_builtin((uint64_t)v3);
    v4 = __gss_scram_initialize();
    add_builtin(v4);
    v5 = __gss_netlogon_initialize();
    add_builtin((uint64_t)v5);
    v6 = __gss_spnego_initialize();
    add_builtin((uint64_t)v6);
    v7 = __gss_krb5_initialize();
    add_builtin((uint64_t)v7);
    v125 = 0;
    b.elements = 0;
    __stringp = 0;
    *(_QWORD *)&b.length = 0;
    v122 = 0;
    if (!csops() && (v122 & 0x800) == 0)
    {
      v8 = fopen("/etc/gss/mech", "r");
      if (v8)
      {
        v9 = v8;
        rk_cloexec_file();
        if (fgets(v126, 256, v9))
        {
          v10 = MEMORY[0x24BDAC740];
          v120 = v9;
          do
          {
            if (v126[0] != 35)
            {
              __stringp = v126;
              v11 = strsep(&__stringp, "\t\n ");
              if (__stringp)
              {
                for (i = __stringp + 1; ; ++i)
                {
                  v13 = *(i - 1);
                  if (*(i - 1) < 0)
                  {
                    if (!__maskrune(v13, 0x4000uLL))
                      break;
                  }
                  else if ((*(_DWORD *)(v10 + 4 * v13 + 60) & 0x4000) == 0)
                  {
                    break;
                  }
                  __stringp = i;
                }
              }
              v14 = strsep(&__stringp, "\t\n ");
              if (__stringp)
              {
                for (j = __stringp + 1; ; ++j)
                {
                  v16 = *(j - 1);
                  if (*(j - 1) < 0)
                  {
                    if (!__maskrune(v16, 0x4000uLL))
                      break;
                  }
                  else if ((*(_DWORD *)(v10 + 4 * v16 + 60) & 0x4000) == 0)
                  {
                    break;
                  }
                  __stringp = j;
                }
              }
              v17 = strsep(&__stringp, "\t\n ");
              if (__stringp)
              {
                for (k = __stringp + 1; ; ++k)
                {
                  v19 = *(k - 1);
                  if (*(k - 1) < 0)
                  {
                    if (!__maskrune(v19, 0x4000uLL))
                      break;
                  }
                  else if ((*(_DWORD *)(v10 + 4 * v19 + 60) & 0x4000) == 0)
                  {
                    break;
                  }
                  __stringp = k;
                }
              }
              v20 = strsep(&__stringp, "\t\n ");
              if (v11)
              {
                if (v14)
                {
                  if (v17)
                  {
                    if (v20)
                    {
                      b.length = 0;
                      b.elements = 0;
                      v21 = 1;
                      v22 = v14;
                      do
                      {
                        v23 = strchr(v22, 46);
                        v22 = v23 + 1;
                        --v21;
                      }
                      while (v23);
                      if (v21)
                      {
                        v24 = 0;
                        v25 = 1;
                        do
                        {
                          v26 = 0;
                          v27 = 0;
                          v28 = v25;
                          v29 = v14;
                          do
                          {
                            v30 = v29;
                            v31 = strchr(v29, 46);
                            v32 = 0;
                            v29 = v31 + 1;
                            while (1)
                            {
                              v33 = *v30;
                              if (!*v30 || v33 == 46)
                                break;
                              v32 = (char)v33 + 10 * v32 - 48;
                              ++v30;
                            }
                            if (v27)
                            {
                              if (v27 == 1)
                              {
                                if (v24)
                                  *v24++ += v32;
                                ++v26;
                              }
                              else
                              {
                                v34 = 0;
                                if (v32)
                                {
                                  v35 = v32;
                                  do
                                  {
                                    ++v34;
                                    v36 = v35 > 0x7F;
                                    v35 >>= 7;
                                  }
                                  while (v36);
                                }
                                if (v34 <= 1)
                                  v34 = 1;
                                v37 = 7 * v34 - 7;
                                do
                                {
                                  if (v24)
                                    *v24++ = (v32 >> v37) & 0x7F | ((v37 != 0) << 7);
                                  v37 -= 7;
                                }
                                while (v37 != -7);
                                v26 += v34 - 1 + 1;
                              }
                            }
                            else if (v24)
                            {
                              *v24 = 40 * v32;
                            }
                            ++v27;
                          }
                          while (v31);
                          if (!v26)
                            goto LABEL_10;
                          if (!v24)
                          {
                            v38 = malloc_type_malloc(v26, 0xAC0F32ADuLL);
                            if (!v38)
                              goto LABEL_10;
                            v24 = v38;
                            b.length = v26;
                            b.elements = v38;
                          }
                          v25 = 0;
                        }
                        while ((v28 & 1) != 0);
                        v39 = &_gss_mechs;
                        while (1)
                        {
                          v39 = (uint64_t *)*v39;
                          if (!v39)
                            break;
                          if (gss_oid_equal((gss_const_OID)(v39 + 7), &b))
                          {
                            free(b.elements);
                            goto LABEL_10;
                          }
                        }
                        v40 = dlopen(v17, 5);
                        if (!v40)
                          goto LABEL_194;
                        v41 = (char *)malloc_type_calloc(1uLL, 0x228uLL, 0x10F00406CEBB635uLL);
                        if (!v41)
                          goto LABEL_194;
                        v42 = v41;
                        *((_QWORD *)v41 + 4) = v40;
                        *(gss_OID_desc *)(v41 + 8) = b;
                        *((_QWORD *)v41 + 6) = strdup(v11);
                        *(gss_OID_desc *)(v42 + 7) = b;
                        *((_DWORD *)v42 + 18) = 0;
                        v43 = malloc_type_calloc(1uLL, 0x20uLL, 0x8004018A671A6uLL);
                        v42[67] = v43;
                        if (!v43
                          || gss_add_oid_set_member(&v125, (gss_const_OID)(v42 + 7), (gss_OID_set *)&_gss_mech_oids) >> 16)
                        {
                          goto LABEL_193;
                        }
                        v44 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, OM_uint32, gss_OID_set, gss_cred_usage_t, gss_cred_id_t *, gss_OID_set *, OM_uint32 *))dlsym(v40, "gss_acquire_cred");
                        v42[10] = v44;
                        if (!v44 || v44 == gss_acquire_cred)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_acquire_cred\n";
                          goto LABEL_191;
                        }
                        v45 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t *))dlsym(v40, "gss_release_cred");
                        v42[11] = v45;
                        if (!v45 || v45 == gss_release_cred)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_release_cred\n";
                          goto LABEL_191;
                        }
                        v46 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_ctx_id_t *, gss_name_t, gss_OID, OM_uint32, OM_uint32, gss_channel_bindings_t, gss_buffer_t, gss_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *))dlsym(v40, "gss_init_sec_context");
                        v42[12] = v46;
                        if (!v46 || v46 == gss_init_sec_context)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_init_sec_context\n";
                          v110 = 39;
                          goto LABEL_192;
                        }
                        v47 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t *, gss_cred_id_t, gss_buffer_t, gss_channel_bindings_t, gss_name_t *, gss_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *, gss_cred_id_t *))dlsym(v40, "gss_accept_sec_context");
                        v42[13] = v47;
                        if (!v47 || v47 == gss_accept_sec_context)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_accept_sec_context\n";
                          goto LABEL_197;
                        }
                        v48 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t))dlsym(v40, "gss_process_context_token");
                        v42[14] = v48;
                        if (!v48 || v48 == gss_process_context_token)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_process_context_token\n";
                          v110 = 44;
                          goto LABEL_192;
                        }
                        v49 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t *, gss_buffer_t))dlsym(v40, "gss_delete_sec_context");
                        v42[15] = v49;
                        if (!v49 || v49 == gss_delete_sec_context)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_delete_sec_context\n";
LABEL_197:
                          v110 = 41;
                          goto LABEL_192;
                        }
                        v50 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, OM_uint32 *))dlsym(v40, "gss_context_time");
                        v42[16] = v50;
                        if (!v50 || v50 == gss_context_time)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_context_time\n";
LABEL_191:
                          v110 = 35;
                          goto LABEL_192;
                        }
                        v51 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_qop_t, gss_buffer_t, gss_buffer_t))dlsym(v40, "gss_get_mic");
                        v42[17] = v51;
                        if (!v51 || v51 == gss_get_mic)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_get_mic\n";
                          v110 = 30;
                          goto LABEL_192;
                        }
                        v52 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t, gss_buffer_t, gss_qop_t *))dlsym(v40, "gss_verify_mic");
                        v42[18] = v52;
                        if (!v52 || v52 == gss_verify_mic)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_verify_mic\n";
                          v110 = 33;
                          goto LABEL_192;
                        }
                        v53 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, int, gss_qop_t, gss_buffer_t, int *, gss_buffer_t))dlsym(v40, "gss_wrap");
                        v42[19] = v53;
                        if (!v53 || v53 == gss_wrap)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_wrap\n";
                          v110 = 27;
                          goto LABEL_192;
                        }
                        v54 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t, gss_buffer_t, int *, gss_qop_t *))dlsym(v40, "gss_unwrap");
                        v42[20] = v54;
                        if (!v54 || v54 == gss_unwrap)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_unwrap\n";
                          v110 = 29;
                          goto LABEL_192;
                        }
                        v55 = (OM_uint32 (__cdecl *)(OM_uint32 *, OM_uint32, int, gss_OID, OM_uint32 *, gss_buffer_t))dlsym(v40, "gss_display_status");
                        v42[21] = v55;
                        if (!v55 || v55 == gss_display_status)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_display_status\n";
                          goto LABEL_207;
                        }
                        v56 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_OID_set *))dlsym(v40, "gss_indicate_mechs");
                        v42[22] = v56;
                        if (!v56 || v56 == gss_indicate_mechs)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_indicate_mechs\n";
                          goto LABEL_207;
                        }
                        v57 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_name_t, int *))dlsym(v40, "gss_compare_name");
                        v42[23] = v57;
                        if (!v57 || v57 == gss_compare_name)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_compare_name\n";
                          goto LABEL_191;
                        }
                        v58 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_buffer_t, gss_OID *))dlsym(v40, "gss_display_name");
                        v42[24] = v58;
                        if (!v58 || v58 == gss_display_name)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_display_name\n";
                          goto LABEL_191;
                        }
                        v59 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_buffer_t, gss_const_OID, gss_name_t *))dlsym(v40, "gss_import_name");
                        v42[25] = v59;
                        if (!v59 || v59 == gss_import_name)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_import_name\n";
LABEL_212:
                          v110 = 34;
                          goto LABEL_192;
                        }
                        v60 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_buffer_t))dlsym(v40, "gss_export_name");
                        v42[26] = v60;
                        if (!v60 || v60 == gss_export_name)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_export_name\n";
                          goto LABEL_212;
                        }
                        v61 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t *))dlsym(v40, "gss_release_name");
                        v42[27] = v61;
                        if (!v61 || v61 == gss_release_name)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_release_name\n";
                          goto LABEL_191;
                        }
                        v62 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_name_t *, OM_uint32 *, gss_cred_usage_t *, gss_OID_set *))dlsym(v40, "gss_inquire_cred");
                        v42[28] = v62;
                        if (!v62 || v62 == gss_inquire_cred)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_inquire_cred\n";
                          goto LABEL_191;
                        }
                        v63 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_name_t *, gss_name_t *, OM_uint32 *, gss_OID *, OM_uint32 *, int *, int *))dlsym(v40, "gss_inquire_context");
                        v42[29] = v63;
                        if (!v63 || v63 == gss_inquire_context)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_inquire_context\n";
                          goto LABEL_217;
                        }
                        v64 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, int, gss_qop_t, OM_uint32, OM_uint32 *))dlsym(v40, "gss_wrap_size_limit");
                        v42[30] = v64;
                        if (!v64 || v64 == gss_wrap_size_limit)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_wrap_size_limit\n";
LABEL_217:
                          v110 = 38;
LABEL_192:
                          fwrite(v109, v110, 1uLL, v108);
LABEL_193:
                          free((void *)v42[67]);
                          free((void *)v42[8]);
                          free((void *)v42[6]);
                          free(v42);
LABEL_194:
                          dlclose(v40);
                          goto LABEL_10;
                        }
                        v65 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_name_t, gss_OID, gss_cred_usage_t, OM_uint32, OM_uint32, gss_cred_id_t *, gss_OID_set *, OM_uint32 *, OM_uint32 *))dlsym(v40, "gss_add_cred");
                        v42[31] = v65;
                        if (!v65 || v65 == gss_add_cred)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_add_cred\n";
                          v110 = 31;
                          goto LABEL_192;
                        }
                        v66 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_OID, gss_name_t *, OM_uint32 *, OM_uint32 *, gss_cred_usage_t *))dlsym(v40, "gss_inquire_cred_by_mech");
                        v42[32] = v66;
                        if (!v66 || v66 == gss_inquire_cred_by_mech)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_inquire_cred_by_mech\n";
                          v110 = 43;
                          goto LABEL_192;
                        }
                        v67 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t *, gss_buffer_t))dlsym(v40, "gss_export_sec_context");
                        v42[33] = v67;
                        if (!v67 || v67 == gss_export_sec_context)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_export_sec_context\n";
                          goto LABEL_197;
                        }
                        v68 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_buffer_t, gss_ctx_id_t *))dlsym(v40, "gss_import_sec_context");
                        v42[34] = v68;
                        if (!v68 || v68 == gss_import_sec_context)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_import_sec_context\n";
                          goto LABEL_197;
                        }
                        v69 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_const_OID, gss_OID_set *))dlsym(v40, "gss_inquire_names_for_mech");
                        v42[35] = v69;
                        if (!v69 || v69 == gss_inquire_names_for_mech)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_inquire_names_for_mech\n";
                          goto LABEL_224;
                        }
                        v70 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_OID_set *))dlsym(v40, "gss_inquire_mechs_for_name");
                        v42[36] = v70;
                        if (!v70 || v70 == gss_inquire_mechs_for_name)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_inquire_mechs_for_name\n";
LABEL_224:
                          v110 = 45;
                          goto LABEL_192;
                        }
                        v71 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_OID, gss_name_t *))dlsym(v40, "gss_canonicalize_name");
                        v42[37] = v71;
                        if (!v71 || v71 == gss_canonicalize_name)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_canonicalize_name\n";
                          v110 = 40;
                          goto LABEL_192;
                        }
                        v72 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_name_t *))dlsym(v40, "gss_duplicate_name");
                        v42[38] = v72;
                        if (!v72 || v72 == gss_duplicate_name)
                        {
                          v108 = (FILE *)*MEMORY[0x24BDAC8D8];
                          v109 = "can't find symbol gss_duplicate_name\n";
LABEL_207:
                          v110 = 37;
                          goto LABEL_192;
                        }
                        v73 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_OID, gss_buffer_set_t *))dlsym(v40, "gss_inquire_cred_by_oid");
                        if (v73 == gss_inquire_cred_by_oid)
                          v74 = 0;
                        else
                          v74 = v73;
                        v42[40] = v74;
                        v75 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_OID, gss_buffer_set_t *))dlsym(v40, "gss_inquire_sec_context_by_oid");
                        if (v75 == gss_inquire_sec_context_by_oid)
                          v76 = 0;
                        else
                          v76 = v75;
                        v42[39] = v76;
                        v77 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t *, gss_OID, gss_buffer_t))dlsym(v40, "gss_set_sec_context_option");
                        if (v77 == gss_set_sec_context_option)
                          v78 = 0;
                        else
                          v78 = v77;
                        v42[41] = v78;
                        v42[42] = dlsym(v40, "gssspi_set_cred_option");
                        v79 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, int, gss_buffer_t, ssize_t, gss_buffer_t))dlsym(v40, "gss_pseudo_random");
                        if (v79 == gss_pseudo_random)
                          v80 = 0;
                        else
                          v80 = v79;
                        v42[43] = v80;
                        v81 = dlsym(v40, "gss_wrap_iov");
                        if (v81 == __ApplePrivate_gss_wrap_iov)
                          v82 = 0;
                        else
                          v82 = v81;
                        v42[44] = v82;
                        v83 = dlsym(v40, "gss_unwrap_iov");
                        if (v83 == __ApplePrivate_gss_unwrap_iov)
                          v84 = 0;
                        else
                          v84 = v83;
                        v42[45] = v84;
                        v85 = dlsym(v40, "gss_wrap_iov_length");
                        if (v85 == __ApplePrivate_gss_wrap_iov_length)
                          v86 = 0;
                        else
                          v86 = v85;
                        v42[46] = v86;
                        v87 = (uint64_t (*)(OM_uint32 *, uint64_t, uint64_t, gss_const_OID, uint64_t, uint64_t, gss_OID_set *, _DWORD *))dlsym(v40, "gss_store_cred");
                        if (v87 == gss_store_cred)
                          v88 = 0;
                        else
                          v88 = v87;
                        v42[47] = v88;
                        v89 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_buffer_t))dlsym(v40, "gss_export_cred");
                        if (v89 == gss_export_cred)
                          v90 = 0;
                        else
                          v90 = v89;
                        v42[48] = v90;
                        v91 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_buffer_t, gss_cred_id_t *))dlsym(v40, "gss_import_cred");
                        if (v91 == gss_import_cred)
                          v92 = 0;
                        else
                          v92 = v91;
                        v42[49] = v92;
                        v93 = dlsym(v40, "gss_display_name_ext");
                        if (v93 == gss_display_name_ext)
                          v94 = 0;
                        else
                          v94 = v93;
                        v42[61] = v94;
                        v95 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, int *, gss_OID *, gss_buffer_set_t *))dlsym(v40, "gss_inquire_name");
                        if (v95 == gss_inquire_name)
                          v96 = 0;
                        else
                          v96 = v95;
                        v42[62] = v96;
                        v97 = dlsym(v40, "gss_get_name_attribute");
                        if (v97 == gss_get_name_attribute)
                          v98 = 0;
                        else
                          v98 = v97;
                        v42[63] = v98;
                        v99 = (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t))dlsym(v40, "gss_set_name_attribute");
                        if (v99 == gss_set_name_attribute)
                          v100 = 0;
                        else
                          v100 = v99;
                        v42[64] = v100;
                        v101 = (uint64_t (*)(_DWORD *, uint64_t, uint64_t))dlsym(v40, "gss_delete_name_attribute");
                        if (v101 == gss_delete_name_attribute)
                          v102 = 0;
                        else
                          v102 = v101;
                        v42[65] = v102;
                        v103 = dlsym(v40, "gss_export_name_composite");
                        if (v103 == gss_export_name_composite)
                          v104 = 0;
                        else
                          v104 = v103;
                        v42[66] = v104;
                        v105 = (uint64_t (*)(unsigned int *, uint64_t, const gss_OID_desc *, uid_t *))dlsym(v40, "gss_pname_to_uid");
                        if (v105 == gss_pname_to_uid)
                          v106 = 0;
                        else
                          v106 = v105;
                        v42[59] = v106;
                        v42[60] = dlsym(v40, "gssspi_authorize_localname");
                        v107 = dlsym(v40, "gss_mo_init");
                        if (v107)
                        {
                          if (((unsigned int (*)(OM_uint32 *, gss_OID_desc *, _QWORD *, _QWORD *))v107)(&v125, &b, v42 + 57, v42 + 58) >= 0x10000)goto LABEL_193;
                        }
                        else
                        {
                          v111 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_OID, gss_buffer_t, gss_buffer_t, gss_buffer_t))dlsym(v40, "gss_inquire_saslname_for_mech");
                          if (v111 == gss_inquire_saslname_for_mech)
                            v112 = 0;
                          else
                            v112 = v111;
                          *(_QWORD *)v42[67] = v112;
                          v113 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_buffer_t, gss_OID *))dlsym(v40, "gss_inquire_mech_for_saslname");
                          if (v113 == gss_inquire_mech_for_saslname)
                            v114 = 0;
                          else
                            v114 = v113;
                          *(_QWORD *)(v42[67] + 8) = v114;
                          v115 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_const_OID, gss_OID_set *, gss_OID_set *))dlsym(v40, "gss_inquire_attrs_for_mech");
                          if (v115 == gss_inquire_attrs_for_mech)
                            v116 = 0;
                          else
                            v116 = v115;
                          *(_QWORD *)(v42[67] + 16) = v116;
                          v117 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_buffer_t, OM_uint32, gss_OID_set, gss_cred_usage_t, gss_cred_id_t *, gss_OID_set *, OM_uint32 *))dlsym(v40, "gssspi_acquire_cred_with_password");
                          if (v117 == gss_acquire_cred_with_password)
                            v118 = 0;
                          else
                            v118 = v117;
                          *(_QWORD *)(v42[67] + 24) = v118;
                        }
                        v119 = (void (*)(OM_uint32 *, _QWORD *, _QWORD *))v42[35];
                        if (v119)
                          v119(&v125, v42 + 7, v42 + 3);
                        if (!v42[3])
                          gss_create_empty_oid_set(&v125, (gss_OID_set *)v42 + 3);
                        *v42 = _gss_mechs;
                        _gss_mechs = (uint64_t)v42;
                      }
                    }
                  }
                }
              }
            }
LABEL_10:
            v9 = v120;
          }
          while (fgets(v126, 256, v120));
        }
        fclose(v9);
      }
    }
  }
  return pthread_mutex_unlock(&_gss_mech_mutex);
}

uint64_t add_builtin(uint64_t result)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(OM_uint32 *, uint64_t, uint64_t);
  OM_uint32 minor_status;

  if (result)
  {
    v1 = (_OWORD *)result;
    result = (uint64_t)malloc_type_calloc(1uLL, 0x228uLL, 0x10F00406CEBB635uLL);
    if (result)
    {
      v2 = result;
      minor_status = 0;
      *(_QWORD *)(result + 32) = 0;
      memcpy((void *)(result + 40), v1, 0x200uLL);
      *(_OWORD *)(v2 + 8) = v1[1];
      result = gss_add_oid_set_member(&minor_status, (gss_const_OID)(v2 + 56), (gss_OID_set *)&_gss_mech_oids);
      v3 = *(uint64_t (**)(OM_uint32 *, uint64_t, uint64_t))(v2 + 280);
      if (v3)
        result = v3(&minor_status, v2 + 56, v2 + 24);
      if (!*(_QWORD *)(v2 + 24))
      {
        gss_create_empty_oid_set(&minor_status, (gss_OID_set *)(v2 + 24));
        gss_add_oid_set_member(&minor_status, &__gss_c_nt_user_name_oid_desc, (gss_OID_set *)(v2 + 24));
        result = gss_add_oid_set_member(&minor_status, &__gss_c_nt_hostbased_service_oid_desc, (gss_OID_set *)(v2 + 24));
      }
      *(_QWORD *)v2 = _gss_mechs;
      _gss_mechs = v2;
    }
  }
  return result;
}

uint64_t *__gss_get_mechanism(const gss_OID_desc *a1)
{
  uint64_t *v2;

  _gss_load_mech();
  v2 = &_gss_mechs;
  while (1)
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      break;
    if (gss_oid_equal((gss_const_OID)(v2 + 7), a1))
      return v2 + 5;
  }
  return 0;
}

uint64_t *_gss_mg_support_mechanism(const gss_OID_desc *a1)
{
  uint64_t *v2;

  _gss_load_mech();
  v2 = &_gss_mechs;
  while (1)
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      break;
    if (gss_oid_equal((gss_const_OID)(v2 + 7), a1))
      return v2 + 1;
  }
  return 0;
}

uint64_t *_gss_mg_get_underlaying_mech_name(uint64_t a1, gss_const_OID a)
{
  uint64_t **v3;

  v3 = (uint64_t **)(a1 + 48);
  while (1)
  {
    v3 = (uint64_t **)*v3;
    if (!v3)
      break;
    if (gss_oid_equal(a, (gss_const_OID)v3[2]))
      return v3[3];
  }
  return 0;
}

uint64_t _gss_find_mn(unsigned int *a1, uint64_t a2, gss_const_OID a, gss_OID_desc **a4)
{
  uint64_t v4;
  gss_OID_desc **v8;
  gss_OID_desc *v9;
  uint64_t *mechanism;
  uint64_t v11;
  gss_OID_desc *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2;
  *a4 = 0;
  if (a2)
  {
    v8 = (gss_OID_desc **)(a2 + 48);
    v9 = (gss_OID_desc *)(a2 + 48);
    while (1)
    {
      v9 = *(gss_OID_desc **)&v9->length;
      if (!v9)
        break;
      if (gss_oid_equal(a, *(gss_const_OID *)&v9[1].length))
        goto LABEL_5;
    }
    if (*(_QWORD *)(v4 + 40))
    {
      mechanism = __gss_get_mechanism(a);
      if (mechanism)
      {
        v11 = (uint64_t)mechanism;
        v12 = (gss_OID_desc *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        if (v12)
        {
          v9 = v12;
          if (*(_QWORD *)(v4 + 24))
            v13 = v4 + 16;
          else
            v13 = 0;
          v14 = (*(uint64_t (**)(unsigned int *, uint64_t, uint64_t, void **))(v11 + 160))(a1, v4 + 32, v13, &v12[1].elements);
          if (!(_DWORD)v14)
          {
            *(_QWORD *)&v9[1].length = v11 + 16;
            *(_QWORD *)&v9->length = *v8;
            v9->elements = (void *)v11;
            *v8 = v9;
LABEL_5:
            v4 = 0;
            *a4 = v9;
            return v4;
          }
          v4 = v14;
          _gss_mg_error(v11, *a1);
          free(v9);
        }
        else
        {
          return 851968;
        }
      }
      else
      {
        return 0x10000;
      }
    }
    else
    {
      return 0x20000;
    }
  }
  return v4;
}

_QWORD *_gss_create_name(uint64_t a1, uint64_t a2)
{
  uint64_t Instance;
  _QWORD *v5;
  _QWORD *v6;

  if (getTypeID_inited != -1)
    dispatch_once(&getTypeID_inited, &__block_literal_global_0);
  if (!getTypeID_haid)
    return 0;
  Instance = _CFRuntimeCreateInstance();
  v5 = (_QWORD *)Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 48) = 0;
    if (a1)
    {
      v6 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
      if (v6)
      {
        v6[2] = a2 + 16;
        v6[3] = a1;
        *v6 = v5[6];
        v6[1] = a2;
        v5[6] = v6;
        return v5;
      }
      CFRelease(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t _gss_mg_release_name(gss_buffer_desc_struct *a1)
{
  size_t *length;
  size_t v3;
  OM_uint32 minor_status;

  minor_status = 0;
  _gss_free_oid(&minor_status, (uint64_t)&a1[1]);
  while (1)
  {
    length = (size_t *)a1[3].length;
    if (!length)
      break;
    v3 = length[1];
    a1[3].length = *length;
    (*(void (**)(OM_uint32 *, size_t *))(v3 + 176))(&minor_status, length + 3);
    free(length);
  }
  return gss_release_buffer(&minor_status, a1 + 2);
}

void _gss_mg_check_name(const void *a1)
{
  CFTypeID v1;
  int v2;
  int v3;
  int v4;
  int v5;
  gss_const_OID v6;

  if (a1)
  {
    v1 = CFGetTypeID(a1);
    if (getTypeID_inited != -1)
      dispatch_once(&getTypeID_inited, &__block_literal_global_0);
    if (v1 != getTypeID_haid)
    {
      v2 = heim_abort();
      _gss_mech_import_name(v2, v3, v4, v5, v6);
    }
  }
}

uint64_t _gss_mech_import_name(_DWORD *a1, const void **a2, uint64_t a3, unint64_t *a4, gss_const_OID a, _QWORD *a6)
{
  unint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unint64_t v15;
  uint64_t i;
  unint64_t v19;
  uint64_t v20;

  *a1 = 0;
  if (!a6)
    return 0x2000000;
  v19 = 0;
  v20 = 0;
  *a6 = 0;
  if (gss_oid_equal(a, &__gss_c_nt_export_name_oid_desc))
  {
    v12 = *a4;
    v13 = *(unsigned int *)a2;
    if (*a4 < (v13 + 10))
      return 0x20000;
    v14 = (unsigned __int8 *)a4[1];
    if (*(unsigned __int16 *)v14 ^ 0x104 | v14[2])
      return 0x20000;
    if ((_DWORD)v13 + 2 != v14[3])
      return 0x20000;
    if (__PAIR64__(v13, 6) != __PAIR64__(v14[5], v14[4]))
      return 0x20000;
    if (memcmp(v14 + 6, a2[1], *(unsigned int *)a2))
      return 0x20000;
    v15 = bswap32(*(_DWORD *)&v14[v13 + 6]);
    if (v15 > v12 - v13 - 10)
      return 0x20000;
    v19 = v15;
    v20 = (uint64_t)&v14[v13 + 10];
    a4 = &v19;
  }
  if (!*(_QWORD *)(a3 + 8))
    return 196608;
  for (i = a3 + 8; !gss_oid_equal(a, *(gss_const_OID *)(i - 8)) && (unint64_t)a | *(_QWORD *)(i - 8); i += 16)
  {
    if (!*(_QWORD *)(i + 16))
      return 196608;
  }
  return (*(uint64_t (**)(_DWORD *, const void **, unint64_t *, gss_const_OID, _QWORD *))i)(a1, a2, a4, a, a6);
}

uint64_t _gss_mech_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *oid_set)
{
  uint64_t result;
  uint64_t v7;
  OM_uint32 minor_status;

  result = gss_create_empty_oid_set(a1, oid_set);
  if (!(_DWORD)result)
  {
    if (*(_QWORD *)(a2 + 8))
    {
      while (!*(_QWORD *)a2 || !gss_add_oid_set_member(a1, *(gss_const_OID *)a2, oid_set))
      {
        v7 = *(_QWORD *)(a2 + 24);
        a2 += 16;
        if (!v7)
          return 0;
      }
      minor_status = 0;
      gss_release_oid_set(&minor_status, oid_set);
    }
    return 0;
  }
  return result;
}

uint64_t __getTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  getTypeID_haid = result;
  return result;
}

CFStringRef _gss_mg_copy_format_string(gss_name_t input_name)
{
  CFStringRef v1;
  OM_uint32 minor_status;
  gss_buffer_desc_struct output_name_buffer;

  output_name_buffer.length = 0;
  output_name_buffer.value = 0;
  minor_status = 0;
  v1 = 0;
  if (!gss_display_name(&minor_status, input_name, &output_name_buffer, 0))
  {
    v1 = CFStringCreateWithFormat(0, 0, CFSTR("%.*s"), output_name_buffer.length, output_name_buffer.value);
    gss_release_buffer(&minor_status, &output_name_buffer);
  }
  return v1;
}

__CFString *_gss_mg_copy_debug_name(gss_name_t_desc_struct *a1)
{
  __CFString *Mutable;
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  Mutable = CFStringCreateMutable(0, 0);
  v3 = Mutable;
  if (Mutable)
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("GSSName: %p"), a1);
    v4 = _gss_mg_copy_format_string(a1);
    if (v4)
    {
      v5 = v4;
      CFStringAppend(v3, v4);
      CFRelease(v5);
    }
  }
  return v3;
}

int gss_oid_equal(gss_const_OID a, gss_const_OID b)
{
  int v2;
  size_t length;

  if (a && a == b)
    return 1;
  v2 = 0;
  if (a && b)
  {
    length = a->length;
    return (_DWORD)length == b->length && memcmp(a->elements, b->elements, length) == 0;
  }
  return v2;
}

OM_uint32 gss_oid_to_str(OM_uint32 *minor_status, gss_OID oid, gss_buffer_t oid_str)
{
  OM_uint32 v5;
  OM_uint32 v6;
  OM_uint32 result;
  size_t v8;

  if (oid_str)
  {
    oid_str->length = 0;
    oid_str->value = 0;
  }
  if (!oid)
    return 851968;
  v5 = der_get_oid();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v6 = der_print_heim_oid();
    der_free_oid();
    if (!v6)
    {
      oid_str->value = 0;
      v8 = strlen(0);
      result = 0;
      oid_str->length = v8;
      goto LABEL_9;
    }
  }
  result = 851968;
LABEL_9:
  *minor_status = v6;
  return result;
}

uint64_t __ApplePrivate_gss_oid_to_name(gss_const_OID a)
{
  const gss_OID_desc *v1;
  uint64_t *v3;
  uint64_t result;

  v1 = (const gss_OID_desc *)_gss_ont_mech;
  if (!_gss_ont_mech)
    return 0;
  v3 = (uint64_t *)off_2545A9FC0;
  while (!gss_oid_equal(a, v1))
  {
    v1 = (const gss_OID_desc *)v3[2];
    v3 += 4;
    if (!v1)
      return 0;
  }
  result = *v3;
  if (!*v3)
    return *(v3 - 1);
  return result;
}

uint64_t __ApplePrivate_gss_name_to_oid(const char *a1)
{
  uint64_t v1;
  const char *v3;
  const char **v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  const char *v9;

  v1 = _gss_ont_mech;
  if (_gss_ont_mech)
  {
    v3 = off_2545A9FC0[0];
    if (strcasecmp(a1, off_2545A9FC0[0]))
    {
      v4 = (const char **)off_2545A9FE0;
      v5 = strlen(a1);
      v6 = 0;
      v7 = -1;
      while (1)
      {
        if (!strncasecmp(a1, v3, v5))
        {
          v8 = v7 == -1;
          v7 = v6;
          if (!v8)
            break;
        }
        v1 = (uint64_t)*(v4 - 2);
        if (!v1)
        {
          if (v7 != -1)
            return *((_QWORD *)&_gss_ont_mech + 4 * v7);
          return 0;
        }
        v9 = *v4;
        v4 += 4;
        v3 = v9;
        ++v6;
        if (!strcasecmp(a1, v9))
          return v1;
      }
      return 0;
    }
  }
  return v1;
}

OM_uint32 gss_process_context_token(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t token_buffer)
{
  return (*(uint64_t (**)(OM_uint32 *, _QWORD, gss_buffer_t))(*(_QWORD *)context_handle + 72))(minor_status, *((_QWORD *)context_handle + 1), token_buffer);
}

OM_uint32 gss_pseudo_random(OM_uint32 *minor_status, gss_ctx_id_t context, int prf_key, gss_buffer_t prf_in, ssize_t desired_output_len, gss_buffer_t prf_out)
{
  uint64_t v7;
  uint64_t (*v8)(OM_uint32 *, _QWORD, _QWORD, gss_buffer_t, ssize_t);
  OM_uint32 v9;

  if (prf_out)
  {
    prf_out->length = 0;
    prf_out->value = 0;
  }
  *minor_status = 0;
  if (!context)
    return 0x80000;
  v7 = *(_QWORD *)context;
  v8 = *(uint64_t (**)(OM_uint32 *, _QWORD, _QWORD, gss_buffer_t, ssize_t))(*(_QWORD *)context + 304);
  if (!v8)
    return 0x100000;
  v9 = v8(minor_status, *((_QWORD *)context + 1), *(_QWORD *)&prf_key, prf_in, desired_output_len);
  if (v9)
    _gss_mg_error(v7, *minor_status);
  return v9;
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  void *value;

  *minor_status = 0;
  value = buffer->value;
  if (value)
    free(value);
  buffer->length = 0;
  buffer->value = 0;
  return 0;
}

OM_uint32 gss_release_cred(OM_uint32 *minor_status, gss_cred_id_t *cred_handle)
{
  if (*cred_handle)
  {
    CFRelease(*cred_handle);
    *minor_status = 0;
    *cred_handle = 0;
  }
  return 0;
}

OM_uint32 gss_release_name(OM_uint32 *minor_status, gss_name_t *input_name)
{
  gss_name_t v2;

  *minor_status = 0;
  if (input_name)
  {
    v2 = *input_name;
    if (*input_name)
    {
      *input_name = 0;
      CFRelease(v2);
    }
  }
  return 0;
}

OM_uint32 gss_release_oid_set(OM_uint32 *minor_status, gss_OID_set *set)
{
  gss_OID_set v3;

  *minor_status = 0;
  if (set)
  {
    v3 = *set;
    if (*set)
    {
      if (v3->elements)
      {
        free(v3->elements);
        v3 = *set;
      }
      free(v3);
      *set = 0;
    }
  }
  return 0;
}

OM_uint32 gss_release_oid(OM_uint32 *minor_status, gss_OID *oid)
{
  gss_OID v2;
  gss_OID_desc_struct *v3;
  gss_OID_desc_struct **v4;
  gss_OID_desc_struct *v5;
  gss_OID_desc_struct *v6;
  gss_OID_desc_struct **v7;
  gss_OID_desc_struct *v8;
  uint64_t *v9;
  void *elements;

  v2 = *oid;
  *oid = 0;
  if (minor_status)
    *minor_status = 0;
  if (v2)
  {
    v3 = (gss_OID_desc_struct *)_gss_ont_mech;
    if (_gss_ont_mech)
    {
      v4 = (gss_OID_desc_struct **)&off_2545A9FD0;
      while (v3 != v2)
      {
        v5 = *v4;
        v4 += 4;
        v3 = v5;
        if (!v5)
          goto LABEL_8;
      }
    }
    else
    {
LABEL_8:
      v6 = (gss_OID_desc_struct *)_gss_ont_ma;
      if (_gss_ont_ma)
      {
        v7 = (gss_OID_desc_struct **)&off_2545A9BF0;
        while (v6 != v2)
        {
          v8 = *v7;
          v7 += 4;
          v6 = v8;
          if (!v8)
            goto LABEL_12;
        }
      }
      else
      {
LABEL_12:
        v9 = &_gss_mechs;
        while (1)
        {
          v9 = (uint64_t *)*v9;
          if (!v9)
            break;
          if (v9 + 7 == (uint64_t *)v2)
            return 0;
        }
        elements = v2->elements;
        if (elements)
          free(elements);
        free(v2);
      }
    }
  }
  return 0;
}

OM_uint32 gss_set_cred_option(OM_uint32 *minor_status, gss_cred_id_t *cred_handle, gss_OID object, gss_buffer_t value)
{
  gss_cred_id_t v8;
  _QWORD *v9;
  int v10;
  OM_uint32 v11;
  uint64_t v12;
  uint64_t (*v13)(OM_uint32 *, _QWORD *, gss_OID, gss_buffer_t);
  gss_cred_id_t_desc_struct *v14;
  gss_cred_id_t_desc_struct *v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  _QWORD *v19;
  OM_uint32 minor_statusa;

  v8 = *cred_handle;
  *minor_status = 0;
  _gss_load_mech();
  if (v8)
  {
    v9 = (_QWORD *)*((_QWORD *)v8 + 2);
    if (v9)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = v9[1];
        if (!v12)
          return 0x10000;
        v13 = *(uint64_t (**)(OM_uint32 *, _QWORD *, gss_OID, gss_buffer_t))(v12 + 296);
        if (v13)
        {
          v11 = v13(minor_status, v9 + 3, object, value);
          if (v11)
            _gss_mg_error(v12, *minor_status);
          else
            v10 = 1;
        }
        v9 = (_QWORD *)*v9;
      }
      while (v9);
      if (v10)
        goto LABEL_22;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v14 = (gss_cred_id_t_desc_struct *)_gss_mg_alloc_cred();
    if (v14)
    {
      v15 = v14;
      v16 = _gss_mechs;
      if (_gss_mechs)
      {
        v17 = 0;
        v11 = 0;
        do
        {
          if (*(_QWORD *)(v16 + 336))
          {
            v18 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
            if (!v18)
            {
              *cred_handle = v15;
              gss_release_cred(minor_status, cred_handle);
              *minor_status = 12;
              return 851968;
            }
            v19 = v18;
            v18[3] = 0;
            v18[1] = v16 + 40;
            v18[2] = v16 + 8;
            v11 = (*(uint64_t (**)(OM_uint32 *))(v16 + 336))(minor_status);
            if (v11)
            {
              free(v19);
            }
            else
            {
              *v19 = *((_QWORD *)v15 + 2);
              *((_QWORD *)v15 + 2) = v19;
              v17 = 1;
            }
          }
          v16 = *(_QWORD *)v16;
        }
        while (v16);
        *cred_handle = v15;
        if (!v17)
          goto LABEL_26;
LABEL_22:
        v11 = 0;
        *minor_status = 0;
      }
      else
      {
        v11 = 0;
        *cred_handle = v14;
LABEL_26:
        minor_statusa = 0;
        gss_release_cred(&minor_statusa, cred_handle);
      }
    }
    else
    {
      return 851968;
    }
  }
  return v11;
}

OM_uint32 gss_set_sec_context_option(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_OID object, gss_buffer_t value)
{
  gss_ctx_id_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  OM_uint32 v8;

  *minor_status = 0;
  if (!context_handle)
    return 0x80000;
  v4 = *context_handle;
  if (!*context_handle)
    return 0x80000;
  v5 = *(_QWORD *)v4;
  if (!*(_QWORD *)v4)
    return 0x10000;
  v6 = *(uint64_t (**)(void))(v5 + 288);
  if (!v6)
    return 0x10000;
  v8 = v6();
  if (v8)
    _gss_mg_error(v5, *minor_status);
  return v8;
}

OM_uint32 gss_test_oid_set_member(OM_uint32 *minor_status, gss_const_OID member, gss_OID_set set, int *present)
{
  uint64_t v8;
  size_t v9;

  *present = 0;
  if (set->count)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      if (gss_oid_equal(member, &set->elements[v8]))
        *present = 1;
      ++v9;
      ++v8;
    }
    while (v9 < set->count);
  }
  *minor_status = 0;
  return 0;
}

OM_uint32 gss_unwrap(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t input_message_buffer, gss_buffer_t output_message_buffer, int *conf_state, gss_qop_t *qop_state)
{
  if (conf_state)
    *conf_state = 0;
  if (qop_state)
    *qop_state = 0;
  if (context_handle)
    return (*(uint64_t (**)(OM_uint32 *, _QWORD, gss_buffer_t, gss_buffer_t))(*(_QWORD *)context_handle + 120))(minor_status, *((_QWORD *)context_handle + 1), input_message_buffer, output_message_buffer);
  *minor_status = 0;
  return 0x80000;
}

uint64_t _gss_copy_oid(_DWORD *a1, const void **a2, uint64_t a3)
{
  size_t v6;
  void *v7;

  v6 = *(unsigned int *)a2;
  *a1 = 0;
  v7 = malloc_type_malloc(v6, 0x24B3A5D8uLL);
  *(_QWORD *)(a3 + 8) = v7;
  if (v7)
  {
    *(_DWORD *)a3 = v6;
    memcpy(v7, a2[1], v6);
    return 0;
  }
  else
  {
    *(_DWORD *)a3 = 0;
    *a1 = 12;
    return 851968;
  }
}

uint64_t _gss_free_oid(_DWORD *a1, uint64_t a2)
{
  void *v2;

  *a1 = 0;
  v2 = *(void **)(a2 + 8);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a2 + 8) = 0;
    *(_DWORD *)a2 = 0;
  }
  return 0;
}

uint64_t _gss_copy_buffer(_DWORD *a1, uint64_t a2, size_t *a3)
{
  size_t v6;
  void *v7;

  v6 = *(_QWORD *)a2;
  *a1 = 0;
  v7 = malloc_type_malloc(v6, 0x9BED114uLL);
  a3[1] = (size_t)v7;
  if (v7)
  {
    *a3 = v6;
    memcpy(v7, *(const void **)(a2 + 8), v6);
    return 0;
  }
  else
  {
    *a1 = 12;
    *a3 = 0;
    return 851968;
  }
}

uint64_t _gss_mg_encode_le_uint32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

_DWORD *_gss_mg_decode_le_uint32(_DWORD *result, _DWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t _gss_mg_encode_be_uint32(uint64_t result, _DWORD *a2)
{
  *a2 = bswap32(result);
  return result;
}

unsigned int *_gss_mg_decode_be_uint32(unsigned int *result, _DWORD *a2)
{
  *a2 = bswap32(*result);
  return result;
}

OM_uint32 gss_verify_mic(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t message_buffer, gss_buffer_t token_buffer, gss_qop_t *qop_state)
{
  if (qop_state)
    *qop_state = 0;
  if (context_handle)
    return (*(uint64_t (**)(OM_uint32 *, _QWORD, gss_buffer_t, gss_buffer_t))(*(_QWORD *)context_handle + 104))(minor_status, *((_QWORD *)context_handle + 1), message_buffer, token_buffer);
  *minor_status = 0;
  return 0x80000;
}

OM_uint32 gss_wrap_size_limit(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int conf_req_flag, gss_qop_t qop_req, OM_uint32 req_output_size, OM_uint32 *max_input_size)
{
  *max_input_size = 0;
  if (context_handle)
    return (*(uint64_t (**)(OM_uint32 *, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)context_handle + 200))(minor_status, *((_QWORD *)context_handle + 1), *(_QWORD *)&conf_req_flag, *(_QWORD *)&qop_req, *(_QWORD *)&req_output_size);
  *minor_status = 0;
  return 0x80000;
}

OM_uint32 gss_wrap(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int conf_req_flag, gss_qop_t qop_req, gss_buffer_t input_message_buffer, int *conf_state, gss_buffer_t output_message_buffer)
{
  if (conf_state)
    *conf_state = 0;
  if (output_message_buffer)
  {
    output_message_buffer->length = 0;
    output_message_buffer->value = 0;
  }
  if (context_handle)
    return (*(uint64_t (**)(OM_uint32 *, _QWORD, _QWORD, _QWORD, gss_buffer_t))(*(_QWORD *)context_handle
                                                                                        + 112))(minor_status, *((_QWORD *)context_handle + 1), *(_QWORD *)&conf_req_flag, *(_QWORD *)&qop_req, input_message_buffer);
  *minor_status = 0;
  return 0x80000;
}

uint64_t gss_store_cred(OM_uint32 *minor_status, uint64_t a2, uint64_t a3, gss_const_OID b, uint64_t a5, uint64_t a6, gss_OID_set *oid_set, _DWORD *a8)
{
  uint64_t empty_oid_set;
  _QWORD *v17;
  uint64_t v18;
  uint64_t (*v19)(OM_uint32 *, _QWORD, uint64_t, gss_const_OID, uint64_t, uint64_t, _QWORD, _DWORD *);
  uint64_t v20;
  OM_uint32 minor_statusa;

  if (!minor_status)
    return 851968;
  if (oid_set)
    *oid_set = 0;
  if (a8)
    *a8 = 0;
  if (!a2)
    return 0x80000;
  if (!oid_set || (empty_oid_set = gss_create_empty_oid_set(minor_status, oid_set), !(_DWORD)empty_oid_set))
  {
    v17 = *(_QWORD **)(a2 + 16);
    if (v17)
    {
      minor_statusa = 0;
      do
      {
        v18 = v17[1];
        if (!v18)
          goto LABEL_19;
        v19 = *(uint64_t (**)(OM_uint32 *, _QWORD, uint64_t, gss_const_OID, uint64_t, uint64_t, _QWORD, _DWORD *))(v18 + 336);
        if (!v19)
          goto LABEL_19;
        if (b)
        {
          if (gss_oid_equal((gss_const_OID)(v18 + 16), b))
            goto LABEL_19;
          v19 = *(uint64_t (**)(OM_uint32 *, _QWORD, uint64_t, gss_const_OID, uint64_t, uint64_t, _QWORD, _DWORD *))(v18 + 336);
        }
        v20 = v19(minor_status, v17[3], a3, b, a5, a6, 0, a8);
        if ((_DWORD)v20)
        {
          empty_oid_set = v20;
          gss_release_oid_set(&minor_statusa, oid_set);
          return empty_oid_set;
        }
        if (oid_set)
          gss_add_oid_set_member(&minor_statusa, (gss_const_OID)(v18 + 16), oid_set);
LABEL_19:
        v17 = (_QWORD *)*v17;
      }
      while (v17);
    }
    return 0;
  }
  return empty_oid_set;
}

OM_uint32 gss_iter_creds_f(OM_uint32 *min_stat, OM_uint32 flags, gss_const_OID mech, void *userctx, void (__cdecl *useriter)(void *, gss_OID, gss_cred_id_t))
{
  uint64_t v8;
  unint64_t *v10;
  pthread_mutex_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *mechanism;
  uint64_t *v16;

  if (!useriter)
    return 0x1000000;
  v8 = *(_QWORD *)&flags;
  _gss_load_mech();
  v10 = (unint64_t *)_gss_mech_oids;
  v11 = (pthread_mutex_t *)malloc_type_malloc(0x58uLL, 0x1080040852048A2uLL);
  if (v11)
  {
    v12 = (uint64_t)v11;
    pthread_mutex_init(v11, 0);
    *(_DWORD *)(v12 + 64) = 1;
    *(_QWORD *)(v12 + 72) = userctx;
    *(_QWORD *)(v12 + 80) = useriter;
    if (*v10)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        if (!mech || gss_oid_equal(mech, (gss_const_OID)(v10[1] + v13)))
        {
          mechanism = __gss_get_mechanism((const gss_OID_desc *)(v10[1] + v13));
          if (mechanism)
          {
            v16 = mechanism;
            if (mechanism[46])
            {
              pthread_mutex_lock((pthread_mutex_t *)v12);
              ++*(_DWORD *)(v12 + 64);
              pthread_mutex_unlock((pthread_mutex_t *)v12);
              ((void (*)(uint64_t, uint64_t, _QWORD))v16[46])(v8, v12, iterate);
            }
          }
        }
        ++v14;
        v13 += 16;
      }
      while (v14 < *v10);
    }
    iter_deref(v12);
    return 0;
  }
  else
  {
    if (min_stat)
      *min_stat = 12;
    return 851968;
  }
}

void iterate(uint64_t a1, const gss_OID_desc *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t *mechanism;

  if (a3)
  {
    v6 = _gss_mg_alloc_cred();
    if (v6)
    {
      v7 = (_QWORD *)v6;
      v8 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
      if (v8)
      {
        v9 = v8;
        mechanism = __gss_get_mechanism(a2);
        v9[2] = a2;
        v9[3] = a3;
        *v9 = v7[2];
        v9[1] = mechanism;
        v7[2] = v9;
        (*(void (**)(_QWORD, const gss_OID_desc *, _QWORD *))(a1 + 80))(*(_QWORD *)(a1 + 72), a2, v7);
      }
      else
      {
        free(v7);
      }
    }
  }
  else
  {
    iter_deref(a1);
  }
}

void iter_deref(uint64_t a1)
{
  int v2;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(_DWORD *)(a1 + 64) - 1;
  *(_DWORD *)(a1 + 64) = v2;
  if (v2)
  {
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 80))(*(_QWORD *)(a1 + 72), 0, 0);
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    pthread_mutex_destroy((pthread_mutex_t *)a1);
    free((void *)a1);
  }
}

OM_uint32 gss_iter_creds(OM_uint32 *min_stat, OM_uint32 flags, gss_const_OID mech, void *useriter)
{
  void *v7;

  v7 = _Block_copy(useriter);
  return gss_iter_creds_f(min_stat, flags, mech, v7, (void (__cdecl *)(void *, gss_OID, gss_cred_id_t))useriter_block);
}

void useriter_block(void (**a1)(void), uint64_t a2, uint64_t a3)
{
  a1[2]();
  if (!a3)
    _Block_release(a1);
}

OM_uint32 gss_export_cred(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_buffer_t token)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  size_t v11;
  const char *v12;
  OM_uint32 v13;
  _QWORD *v14;
  OM_uint32 v15;
  uint64_t v16;
  OM_uint32 v17;
  OM_uint32 v18;
  gss_buffer_desc_struct buffer;

  if (token)
  {
    token->length = 0;
    token->value = 0;
  }
  if (cred_handle)
  {
    buffer.length = 0;
    buffer.value = 0;
    v8 = (_QWORD *)((char *)cred_handle + 16);
    v9 = (_QWORD *)((char *)cred_handle + 16);
    while (1)
    {
      v9 = (_QWORD *)*v9;
      if (!v9)
        break;
      v10 = v9[1];
      if (!*(_QWORD *)(v10 + 344))
      {
        *minor_status = 0;
        v11 = v10 + 16;
        v12 = "Credential doesn't support exporting";
        v13 = 458752;
LABEL_8:
        gss_mg_set_error_string(v11, 458752, 0, v12, v3, v4, v5, v6, 0);
        return v13;
      }
    }
    if (krb5_storage_emem())
    {
      v14 = (_QWORD *)*v8;
      if (!*v8)
      {
LABEL_17:
        v17 = krb5_storage_to_data();
        krb5_storage_free();
        if (!v17)
        {
          *minor_status = 0;
          v12 = "Credential was not exportable";
          v13 = 458752;
          v11 = 0;
          goto LABEL_8;
        }
        *minor_status = v17;
        return 851968;
      }
      while (1)
      {
        v15 = (*(uint64_t (**)(OM_uint32 *, _QWORD, gss_buffer_desc_struct *))(v14[1] + 344))(minor_status, v14[3], &buffer);
        if (v15)
        {
          v13 = v15;
          krb5_storage_free();
          return v13;
        }
        if (buffer.length)
        {
          v16 = krb5_storage_write();
          if (v16 < 0 || v16 != buffer.length)
            break;
        }
        gss_release_buffer(minor_status, &buffer);
        v14 = (_QWORD *)*v14;
        if (!v14)
          goto LABEL_17;
      }
      gss_release_buffer(minor_status, &buffer);
      krb5_storage_free();
      v18 = 22;
    }
    else
    {
      v18 = 12;
    }
    *minor_status = v18;
    return 851968;
  }
  *minor_status = 0;
  return 458752;
}

OM_uint32 gss_import_cred(OM_uint32 *minor_status, gss_buffer_t token, gss_cred_id_t *cred_handle)
{
  gss_cred_id_t_desc_struct *v5;
  gss_cred_id_t_desc_struct *v6;
  OM_uint32 v7;
  uint64_t *mechanism;
  OM_uint32 v9;
  _QWORD *v10;
  gss_OID_desc v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  OM_uint32 minor_statusa;

  *cred_handle = 0;
  if (!token->length || !krb5_storage_from_readonly_mem())
    goto LABEL_13;
  v5 = (gss_cred_id_t_desc_struct *)_gss_mg_alloc_cred();
  if (!v5)
  {
    krb5_storage_free();
LABEL_13:
    *minor_status = 12;
    return 851968;
  }
  v6 = v5;
  minor_statusa = 0;
  v16 = 0;
  v17 = 0;
  *cred_handle = v5;
  while (1)
  {
    v14 = 0;
    v15 = 0;
    v12.elements = 0;
    v13 = 0;
    *(_QWORD *)&v12.length = 0;
    v7 = krb5_ret_data();
    if (v7)
      break;
    v12.elements = v17;
    v12.length = v16;
    mechanism = __gss_get_mechanism(&v12);
    krb5_data_free();
    if (!mechanism || !mechanism[44])
    {
      v7 = 0;
      v9 = 0x10000;
LABEL_20:
      *minor_status = v7;
LABEL_21:
      krb5_storage_free();
      goto LABEL_22;
    }
    v7 = krb5_ret_data();
    if (v7)
      goto LABEL_18;
    v14 = v16;
    v15 = v17;
    v9 = ((uint64_t (*)(OM_uint32 *, uint64_t *, uint64_t *))mechanism[44])(minor_status, &v14, &v13);
    krb5_data_free();
    if (v9)
      goto LABEL_21;
    v10 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
    if (!v10)
    {
      v9 = 851968;
      v7 = 22;
      goto LABEL_20;
    }
    v10[1] = mechanism;
    v10[2] = mechanism + 2;
    v10[3] = v13;
    *v10 = *((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v10;
  }
  if (v7 != -1980176635)
  {
LABEL_18:
    v9 = 851968;
    goto LABEL_20;
  }
  krb5_storage_free();
  if (*((_QWORD *)v6 + 2))
    return 0;
  v9 = 458752;
LABEL_22:
  gss_release_cred(&minor_statusa, cred_handle);
  return v9;
}

uint64_t __ApplePrivate_gss_cred_label_get(_DWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v7;
  uint64_t (*v8)(_DWORD *, _QWORD, uint64_t, _QWORD *);
  uint64_t result;

  *a1 = 0;
  if (a4)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  v7 = *(_QWORD **)(a2 + 16);
  if (!v7)
    return 0x100000;
  while (1)
  {
    v8 = *(uint64_t (**)(_DWORD *, _QWORD, uint64_t, _QWORD *))(v7[1] + 400);
    if (v8)
    {
      result = v8(a1, v7[3], a3, a4);
      if (!(_DWORD)result)
        break;
    }
    v7 = (_QWORD *)*v7;
    if (!v7)
      return 0x100000;
  }
  return result;
}

uint64_t __ApplePrivate_gss_cred_label_set(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *i;
  void (*v8)(_DWORD *, _QWORD, uint64_t, uint64_t);

  *a1 = 0;
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
  {
    v8 = *(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(i[1] + 408);
    if (v8)
      v8(a1, i[3], a3, a4);
  }
  return 0;
}

OM_uint32 gss_destroy_cred(OM_uint32 *min_stat, gss_cred_id_t *cred_handle)
{
  gss_cred_id_t v2;
  _QWORD *v3;
  uint64_t v4;
  void (*v5)(int *, _QWORD *);
  int v7;

  if (!cred_handle)
    return 0x1000000;
  v2 = *cred_handle;
  if (*cred_handle)
  {
    v7 = 0;
    *cred_handle = 0;
    while (1)
    {
      v3 = (_QWORD *)*((_QWORD *)v2 + 2);
      if (!v3)
        break;
      v4 = v3[1];
      *((_QWORD *)v2 + 2) = *v3;
      v5 = *(void (**)(int *, _QWORD *))(v4 + 376);
      if (!v5)
        v5 = *(void (**)(int *, _QWORD *))(v4 + 48);
      v5(&v7, v3 + 3);
      free(v3);
    }
    free(v2);
  }
  return 0;
}

uint64_t _gss_mo_get_option_1(gss_const_OID a, uint64_t a2, size_t *a3)
{
  return get_option_def(1, a, a2, a3);
}

uint64_t get_option_def(uint64_t a1, gss_const_OID a, uint64_t a3, size_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  CFStringRef v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  CFPropertyListRef v12;
  CFTypeID v13;
  CFTypeID v14;
  CFTypeID v15;
  const void *Value;
  const void *v17;
  CFTypeID v18;
  CFTypeID v19;
  CFTypeID v20;
  CFIndex Length;
  void *v22;
  void *v23;
  const UInt8 *BytePtr;
  unsigned int valuePtr;

  v6 = a1;
  valuePtr = a1;
  v7 = __ApplePrivate_gss_oid_to_name(a);
  v8 = CFStringCreateWithFormat(0, 0, CFSTR("com.apple.GSS.%s"), v7);
  if (v8)
  {
    v9 = v8;
    v10 = CFStringCreateWithCString(0, *(const char **)(a3 + 16), 0x8000100u);
    if (v10)
    {
      v11 = v10;
      v12 = _gss_mg_copy_key(v9, v10);
      CFRelease(v9);
      CFRelease(v11);
      if (v12)
      {
        v13 = CFGetTypeID(v12);
        if (v13 == CFBooleanGetTypeID())
        {
          valuePtr = CFBooleanGetValue((CFBooleanRef)v12);
        }
        else
        {
          v14 = CFGetTypeID(v12);
          if (v14 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)v12, kCFNumberIntType, &valuePtr);
          }
          else
          {
            v15 = CFGetTypeID(v12);
            if (v15 == CFDictionaryGetTypeID())
            {
              Value = CFDictionaryGetValue((CFDictionaryRef)v12, CFSTR("enable"));
              v17 = CFDictionaryGetValue((CFDictionaryRef)v12, CFSTR("data"));
              if (Value)
              {
                v18 = CFGetTypeID(Value);
                if (v18 == CFBooleanGetTypeID())
                {
                  valuePtr = CFBooleanGetValue((CFBooleanRef)Value);
                }
                else
                {
                  v19 = CFGetTypeID(Value);
                  if (v19 == CFNumberGetTypeID())
                    CFNumberGetValue((CFNumberRef)v12, kCFNumberIntType, &valuePtr);
                }
              }
              if (v17)
              {
                v20 = CFGetTypeID(v17);
                if (v20 == CFDataGetTypeID())
                {
                  Length = CFDataGetLength((CFDataRef)v17);
                  v22 = malloc_type_malloc(Length, 0x6E88AE88uLL);
                  a4[1] = (size_t)v22;
                  if (v22)
                  {
                    v23 = v22;
                    BytePtr = CFDataGetBytePtr((CFDataRef)v17);
                    memcpy(v23, BytePtr, *a4);
                    *a4 = CFDataGetLength((CFDataRef)v17);
                  }
                }
              }
            }
          }
        }
        CFRelease(v12);
        return valuePtr;
      }
    }
    else
    {
      CFRelease(v9);
    }
  }
  return v6;
}

uint64_t _gss_mo_get_option_0(gss_const_OID a, uint64_t a2, size_t *a3)
{
  return get_option_def(0, a, a2, a3);
}

uint64_t _gss_mo_get_ctx_as_string(uint64_t a1, uint64_t a2, size_t *a3)
{
  const char *v4;
  char *v5;
  size_t v6;
  uint64_t result;

  if (!a3)
    return 0;
  v4 = *(const char **)(a2 + 24);
  v5 = strdup(v4);
  a3[1] = (size_t)v5;
  if (!v5)
    return 851968;
  v6 = strlen(v4);
  result = 0;
  *a3 = v6;
  return result;
}

uint64_t __ApplePrivate_gss_mo_set(const gss_OID_desc *a1, const gss_OID_desc *a2)
{
  uint64_t *mechanism;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t (*v8)(const gss_OID_desc *);

  mechanism = __gss_get_mechanism(a1);
  if (!mechanism)
    return 0x10000;
  v5 = mechanism;
  if (!mechanism[53])
    return 0;
  v6 = 0;
  v7 = 0;
  while (1)
  {
    if (gss_oid_equal(a2, *(gss_const_OID *)(v5[52] + v6)))
    {
      v8 = *(uint64_t (**)(const gss_OID_desc *))(v5[52] + v6 + 40);
      if (v8)
        break;
    }
    ++v7;
    v6 += 48;
    if (v7 >= v5[53])
      return 0;
  }
  return v8(a1);
}

uint64_t __ApplePrivate_gss_mo_get(const gss_OID_desc *a1, const gss_OID_desc *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t *mechanism;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t (*v10)(const gss_OID_desc *);

  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  result = (uint64_t)__gss_get_mechanism(a1);
  if (result)
  {
    mechanism = __gss_get_mechanism(a1);
    if (mechanism)
    {
      v7 = mechanism;
      if (mechanism[53])
      {
        v8 = 0;
        v9 = 0;
        while (1)
        {
          if (gss_oid_equal(a2, *(gss_const_OID *)(v7[52] + v8)))
          {
            v10 = *(uint64_t (**)(const gss_OID_desc *))(v7[52] + v8 + 32);
            if (v10)
              break;
          }
          ++v9;
          v8 += 48;
          if (v9 >= v7[53])
            return 0;
        }
        return v10(a1);
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0x10000;
    }
  }
  return result;
}

uint64_t *__ApplePrivate_gss_mo_list(uint64_t *result, gss_OID_set *a2)
{
  uint64_t v3;
  OM_uint32 minor_status;

  if (a2)
  {
    *a2 = 0;
    result = __gss_get_mechanism((const gss_OID_desc *)result);
    if (result)
    {
      v3 = (uint64_t)result;
      minor_status = 0;
      result = (uint64_t *)gss_create_empty_oid_set(&minor_status, a2);
      if (!(_DWORD)result)
        return (uint64_t *)add_all_mo(v3, a2, 0);
    }
  }
  return result;
}

uint64_t add_all_mo(uint64_t result, gss_OID_set *oid_set, int a3)
{
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  OM_uint32 minor_status;

  v3 = *(_QWORD *)(result + 424);
  if (v3)
  {
    v6 = result;
    v7 = 0;
    v8 = 0;
    minor_status = 0;
    do
    {
      v9 = *(_QWORD *)(v6 + 416);
      if ((a3 & ~*(_DWORD *)(v9 + v7 + 8)) == 0)
      {
        result = gss_add_oid_set_member(&minor_status, *(gss_const_OID *)(v9 + v7), oid_set);
        v3 = *(_QWORD *)(v6 + 424);
      }
      ++v8;
      v7 += 48;
    }
    while (v8 < v3);
  }
  return result;
}

uint64_t __ApplePrivate_gss_mo_name(const gss_OID_desc *a1, const gss_OID_desc *a2, gss_buffer_desc_struct *a3)
{
  uint64_t *mechanism;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  const char *v11;
  char *v12;
  size_t v13;
  OM_uint32 minor_status;

  if (!a3)
    return 0x20000;
  mechanism = __gss_get_mechanism(a1);
  if (!mechanism)
    return 0x10000;
  v6 = mechanism;
  if (!mechanism[53])
    return 0x20000;
  v7 = 0;
  v8 = 0;
  while (!gss_oid_equal(a2, *(gss_const_OID *)(v6[52] + v7)))
  {
    ++v8;
    v7 += 48;
    if (v8 >= v6[53])
      return 0x20000;
  }
  v10 = v6[52] + v7;
  v11 = *(const char **)(v10 + 16);
  if (v11)
  {
    v12 = strdup(*(const char **)(v10 + 16));
    a3->value = v12;
    if (v12)
    {
      v13 = strlen(v11);
      result = 0;
      a3->length = v13;
      return result;
    }
    return 0x20000;
  }
  minor_status = 0;
  return gss_display_mech_attr(&minor_status, a2, 0, a3, 0);
}

OM_uint32 gss_display_mech_attr(OM_uint32 *minor_status, gss_const_OID mech_attr, gss_buffer_t name, gss_buffer_t short_desc, gss_buffer_t long_desc)
{
  void **p_elements;
  const gss_OID_desc *v11;
  OM_uint32 result;
  size_t v13;
  const char *v14;

  if (name)
  {
    name->length = 0;
    name->value = 0;
  }
  if (short_desc)
  {
    short_desc->length = 0;
    short_desc->value = 0;
  }
  if (long_desc)
  {
    long_desc->length = 0;
    long_desc->value = 0;
  }
  if (minor_status)
    *minor_status = 0;
  p_elements = &__gss_c_ma_ctx_trans_oid_desc.elements;
  do
  {
    v11 = (const gss_OID_desc *)p_elements[1];
    if (!v11)
      return 1245184;
    p_elements += 4;
  }
  while (!gss_oid_equal(mech_attr, v11));
  if (!name
    || (v14 = (const char *)*(p_elements - 2),
        v13 = strlen(v14),
        (result = _gss_copy_buffer(minor_status, (uint64_t)&v13, &name->length)) == 0))
  {
    if (!short_desc
      || (v14 = (const char *)*(p_elements - 1),
          v13 = strlen(v14),
          (result = _gss_copy_buffer(minor_status, (uint64_t)&v13, &short_desc->length)) == 0))
    {
      if (!long_desc)
        return 0;
      v14 = (const char *)*p_elements;
      v13 = strlen(v14);
      result = _gss_copy_buffer(minor_status, (uint64_t)&v13, &long_desc->length);
      if (!result)
        return 0;
    }
  }
  return result;
}

OM_uint32 gss_inquire_saslname_for_mech(OM_uint32 *minor_status, gss_OID desired_mech, gss_buffer_t sasl_mech_name, gss_buffer_t mech_name, gss_buffer_t mech_description)
{
  OM_uint32 result;
  uint64_t *mechanism;
  uint64_t (**v12)(OM_uint32 *, gss_OID, gss_buffer_t, gss_buffer_t, gss_buffer_t);
  uint64_t (*v13)(OM_uint32 *, gss_OID, gss_buffer_t, gss_buffer_t, gss_buffer_t);
  OM_uint32 v14;
  _QWORD v15[2];
  _BYTE v16[16];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (sasl_mech_name)
  {
    sasl_mech_name->length = 0;
    sasl_mech_name->value = 0;
  }
  if (mech_name)
  {
    mech_name->length = 0;
    mech_name->value = 0;
  }
  if (mech_description)
  {
    mech_description->length = 0;
    mech_description->value = 0;
  }
  if (minor_status)
    *minor_status = 0;
  if (!desired_mech)
    return 0x10000;
  if (!sasl_mech_name
    || (result = __ApplePrivate_gss_mo_get(desired_mech, &__gss_c_ma_sasl_mech_name_oid_desc, sasl_mech_name)) == 0)
  {
    if (mech_name)
    {
      result = __ApplePrivate_gss_mo_get(desired_mech, &__gss_c_ma_mech_name_oid_desc, mech_name);
      v14 = HIWORD(result);
      if (!HIWORD(result))
        result = 0;
      if (!mech_description || v14)
        return result;
    }
    else if (!mech_description)
    {
      return 0;
    }
    return __ApplePrivate_gss_mo_get(desired_mech, &__gss_c_ma_mech_description_oid_desc, mech_description);
  }
  if (result >= 0x10000)
  {
    mechanism = __gss_get_mechanism(desired_mech);
    if (!mechanism
      || (v12 = (uint64_t (**)(OM_uint32 *, gss_OID, gss_buffer_t, gss_buffer_t, gss_buffer_t))mechanism[62]) == 0
      || (v13 = *v12) == 0
      || (result = v13(minor_status, desired_mech, sasl_mech_name, mech_name, mech_description), result >= 0x10000))
    {
      v15[0] = 15;
      v15[1] = v16;
      if (make_sasl_name(desired_mech, (uint64_t)v16) < 0x10000)
        return _gss_copy_buffer(minor_status, (uint64_t)v15, &sasl_mech_name->length);
      return 0x10000;
    }
  }
  return result;
}

uint64_t make_sasl_name(_DWORD *a1, uint64_t a2)
{
  uint64_t result;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  if (*a1 > 0x7Fu)
    return 0x10000;
  CCDigestCreate();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestDestroy();
  result = 0;
  *(_DWORD *)a2 = 758272839;
  *(_BYTE *)(a2 + 4) = basis_32[(unint64_t)v4 >> 3];
  *(_BYTE *)(a2 + 5) = basis_32[((unint64_t)v5 >> 6) & 0xFFFFFFFFFFFFFFE3 | (4 * (v4 & 7))];
  *(_BYTE *)(a2 + 6) = basis_32[((unint64_t)v5 >> 1) & 0x1F];
  *(_BYTE *)(a2 + 7) = basis_32[((unint64_t)v6 >> 4) & 0xFFFFFFFFFFFFFFEFLL | (16 * (v5 & 1))];
  *(_BYTE *)(a2 + 8) = basis_32[((unint64_t)v7 >> 7) & 0xFFFFFFFFFFFFFFE1 | (2 * (v6 & 0xF))];
  *(_BYTE *)(a2 + 9) = basis_32[((unint64_t)v7 >> 2) & 0x1F];
  *(_BYTE *)(a2 + 10) = basis_32[((unint64_t)v8 >> 5) & 0xFFFFFFFFFFFFFFE7 | (8 * (v7 & 3))];
  *(_BYTE *)(a2 + 11) = basis_32[v8 & 0x1F];
  *(_BYTE *)(a2 + 12) = basis_32[(unint64_t)v9 >> 3];
  *(_BYTE *)(a2 + 13) = basis_32[((unint64_t)v10 >> 6) & 0xFFFFFFFFFFFFFFE3 | (4 * (v9 & 7))];
  *(_WORD *)(a2 + 14) = basis_32[((unint64_t)v10 >> 1) & 0x1F];
  return result;
}

OM_uint32 gss_inquire_mech_for_saslname(OM_uint32 *minor_status, gss_buffer_t sasl_mech_name, gss_OID *mech_type)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t (*v10)(OM_uint32 *, gss_buffer_t, gss_OID *);
  OM_uint32 result;
  uint64_t *value;
  uint64_t v13;
  uint64_t v14;
  OM_uint32 minor_statusa;
  gss_buffer_desc_struct buffer;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  _gss_load_mech();
  *mech_type = 0;
  v6 = _gss_mechs;
  if (!_gss_mechs)
    return 0x10000;
  buffer.length = 0;
  buffer.value = 0;
  minor_statusa = 0;
  while (1)
  {
    v7 = __ApplePrivate_gss_mo_get((const gss_OID_desc *)(v6 + 8), &__gss_c_ma_sasl_mech_name_oid_desc, &buffer);
    if (!v7)
      break;
    v8 = v7;
    gss_release_buffer(&minor_statusa, &buffer);
    if (v8 >= 0x10000)
    {
      v9 = *(_QWORD *)(v6 + 536);
      if (!v9)
        goto LABEL_27;
      v10 = *(uint64_t (**)(OM_uint32 *, gss_buffer_t, gss_OID *))(v9 + 8);
      if (!v10)
        goto LABEL_27;
      result = v10(minor_status, sasl_mech_name, mech_type);
      if (!result)
        return result;
      if (result >= 0x10000)
      {
LABEL_27:
        if (sasl_mech_name->length == 16 && !make_sasl_name((_DWORD *)(v6 + 8), (uint64_t)v18))
        {
          value = (uint64_t *)sasl_mech_name->value;
          v14 = *value;
          v13 = value[1];
          if (v18[0] == v14 && v18[1] == v13)
            goto LABEL_24;
        }
      }
    }
LABEL_20:
    v6 = *(_QWORD *)v6;
    if (!v6)
      return 0x10000;
  }
  if (buffer.length != sasl_mech_name->length || memcmp(buffer.value, sasl_mech_name->value, buffer.length))
  {
    gss_release_buffer(&minor_statusa, &buffer);
    goto LABEL_20;
  }
  gss_release_buffer(&minor_statusa, &buffer);
LABEL_24:
  result = 0;
  *mech_type = (gss_OID)(v6 + 8);
  return result;
}

OM_uint32 gss_indicate_mechs_by_attrs(OM_uint32 *minor_status, gss_const_OID_set desired_mech_attrs, gss_const_OID_set except_mech_attrs, gss_const_OID_set critical_mech_attrs, gss_OID_set *mechs)
{
  OM_uint32 empty_oid_set;
  uint64_t i;
  uint64_t v12;
  uint64_t (*v13)(OM_uint32 *, uint64_t, gss_OID_set *, gss_OID_set *);
  OM_uint32 minor_statusa;
  gss_OID_set v16;
  gss_OID_set set;

  v16 = 0;
  set = 0;
  empty_oid_set = gss_create_empty_oid_set(minor_status, mechs);
  if (!HIWORD(empty_oid_set))
  {
    _gss_load_mech();
    for (i = _gss_mechs; i; i = *(_QWORD *)i)
    {
      v12 = *(_QWORD *)(i + 536);
      minor_statusa = 0;
      if (v12)
      {
        v13 = *(uint64_t (**)(OM_uint32 *, uint64_t, gss_OID_set *, gss_OID_set *))(v12 + 16);
        if (v13)
        {
          empty_oid_set = v13(minor_status, i + 56, &set, &v16);
          if (HIWORD(empty_oid_set))
            continue;
        }
      }
      if (test_mech_attrs(i + 40, &set->count, desired_mech_attrs, 0)
        && test_mech_attrs(i + 40, &set->count, except_mech_attrs, 1)
        && test_mech_attrs(i + 40, &v16->count, critical_mech_attrs, 0))
      {
        empty_oid_set = gss_add_oid_set_member(minor_status, (gss_const_OID)(i + 56), mechs);
      }
      gss_release_oid_set(&minor_statusa, &set);
      gss_release_oid_set(&minor_statusa, &v16);
      if (empty_oid_set >= 0x10000)
        break;
    }
  }
  return empty_oid_set;
}

uint64_t test_mech_attrs(uint64_t a1, unint64_t *a2, _QWORD *a3, int a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  if (!a3)
    return 1;
  if (!*a3)
    return 1;
  v8 = 0;
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)(a1 + 424))
    {
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v8 = gss_oid_equal(*(gss_const_OID *)(*(_QWORD *)(a1 + 416) + v10), (gss_const_OID)(a3[1] + 16 * v9));
        if (v8)
          break;
        ++v11;
        v10 += 48;
        if (v11 >= *(_QWORD *)(a1 + 424))
        {
          v8 = 0;
          break;
        }
      }
    }
    if (a2 && *a2)
    {
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v8 = gss_oid_equal((gss_const_OID)(a2[1] + v12), (gss_const_OID)(a3[1] + 16 * v9));
        if (v8)
          break;
        ++v13;
        v12 += 16;
        if (v13 >= *a2)
        {
          v8 = 0;
          break;
        }
      }
    }
    if ((v8 == 0) != a4)
      return 0;
    if ((unint64_t)++v9 >= *a3)
      return 1;
  }
}

OM_uint32 gss_inquire_attrs_for_mech(OM_uint32 *minor_status, gss_const_OID mech, gss_OID_set *mech_attr, gss_OID_set *known_mech_attrs)
{
  uint64_t *mechanism;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(OM_uint32 *, gss_const_OID, gss_OID_set *, gss_OID_set *);
  OM_uint32 empty_oid_set;
  OM_uint32 v13;
  OM_uint32 v14;
  _QWORD *v15;
  OM_uint32 minor_statusa;

  if (known_mech_attrs)
    *known_mech_attrs = 0;
  if (mech && mech_attr)
  {
    mechanism = __gss_get_mechanism(mech);
    if (!mechanism)
    {
      *minor_status = 0;
      return 0x10000;
    }
    v9 = (uint64_t)mechanism;
    v10 = mechanism[62];
    if (v10)
    {
      v11 = *(uint64_t (**)(OM_uint32 *, gss_const_OID, gss_OID_set *, gss_OID_set *))(v10 + 16);
      if (v11)
      {
        empty_oid_set = v11(minor_status, mech, mech_attr, known_mech_attrs);
        goto LABEL_10;
      }
    }
    empty_oid_set = gss_create_empty_oid_set(minor_status, mech_attr);
    if (empty_oid_set)
    {
LABEL_10:
      if (HIWORD(empty_oid_set))
        v13 = empty_oid_set;
      else
        v13 = 0;
      if (!known_mech_attrs || HIWORD(empty_oid_set))
        return v13;
      goto LABEL_19;
    }
    add_all_mo(v9, mech_attr, 1);
  }
  if (!known_mech_attrs)
    return 0;
LABEL_19:
  if (*known_mech_attrs || (v14 = gss_create_empty_oid_set(minor_status, known_mech_attrs), v14 < 0x10000))
  {
    _gss_load_mech();
    v15 = (_QWORD *)_gss_mechs;
    if (_gss_mechs)
    {
      do
      {
        add_all_mo((uint64_t)(v15 + 5), known_mech_attrs, 1);
        v15 = (_QWORD *)*v15;
      }
      while (v15);
    }
    return 0;
  }
  v13 = v14;
  if (mech_attr)
  {
    minor_statusa = 0;
    gss_release_oid_set(&minor_statusa, mech_attr);
  }
  return v13;
}

uint64_t __ApplePrivate_gss_cred_hold(_DWORD *a1, uint64_t a2)
{
  _QWORD *i;
  void (*v4)(_DWORD *, _QWORD);

  *a1 = 0;
  if (!a2)
    return 458752;
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
  {
    v4 = *(void (**)(_DWORD *, _QWORD))(i[1] + 384);
    if (v4)
      v4(a1, i[3]);
  }
  return 0;
}

uint64_t __ApplePrivate_gss_cred_unhold(_DWORD *a1, uint64_t a2)
{
  _QWORD *i;
  void (*v4)(_DWORD *, _QWORD);

  *a1 = 0;
  if (!a2)
    return 458752;
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
  {
    v4 = *(void (**)(_DWORD *, _QWORD))(i[1] + 392);
    if (v4)
      v4(a1, i[3]);
  }
  return 0;
}

uint64_t gss_mg_gen_cb(int *a1, _QWORD *a2, uint64_t a3, _QWORD *a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  krb5_data_zero();
  if (!krb5_storage_emem())
  {
    *a1 = 12;
    return 851968;
  }
  krb5_storage_set_byteorder();
  v7 = krb5_store_int32();
  if (v7)
    goto LABEL_18;
  v7 = krb5_store_int32();
  if (v7)
    goto LABEL_18;
  v8 = krb5_storage_write();
  if (v8 < 0 || v8 != a2[1])
    goto LABEL_17;
  v7 = krb5_store_int32();
  if (v7)
    goto LABEL_18;
  v7 = krb5_store_int32();
  if (v7)
    goto LABEL_18;
  v9 = krb5_storage_write();
  if (v9 < 0 || v9 != a2[4])
    goto LABEL_17;
  v7 = krb5_store_int32();
  if (v7)
  {
LABEL_18:
    *a1 = v7;
    krb5_storage_free();
    return 851968;
  }
  v10 = krb5_storage_write();
  if (v10 < 0 || v10 != a2[6])
  {
LABEL_17:
    v7 = 12;
    goto LABEL_18;
  }
  v7 = krb5_storage_to_data();
  if (v7)
    goto LABEL_18;
  CCDigest();
  if (a4)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  else
  {
    krb5_data_free();
  }
  result = 0;
  *a1 = 0;
  return result;
}

uint64_t gss_mg_validate_cb(int *a1, _QWORD *a2, _QWORD *a3, gss_buffer_desc_struct *a4)
{
  BOOL v5;
  uint64_t result;
  OM_uint32 minor_status;
  _BYTE v9[16];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a2 || (*a3 == gss_mg_validate_cb_zeros ? (v5 = a3[1] == unk_2545AA360) : (v5 = 0), v5))
  {
    result = 0;
    a4->length = 0;
    a4->value = 0;
  }
  else
  {
    minor_status = 0;
    result = gss_mg_gen_cb(a1, a2, (uint64_t)v9, a4);
    if (!(_DWORD)result)
    {
      result = ct_memcmp();
      if ((_DWORD)result)
      {
        gss_release_buffer(&minor_status, a4);
        *a1 = 0;
        return 0x40000;
      }
    }
  }
  return result;
}

uint64_t _gss_acquire_mech_cred(_DWORD *a1, uint64_t a2, uint64_t a3, const gss_OID_desc *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9)
{
  char *v16;
  char *v17;
  uint64_t (*v18)(_DWORD *, uint64_t, const gss_OID_desc *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_DWORD *, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, char *, _QWORD, _QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD v27[2];

  *a9 = 0;
  v16 = (char *)malloc_type_calloc(1uLL, 0x20uLL, 0x20040DC1BFBCFuLL);
  if (v16)
  {
    v17 = v16;
    *((_QWORD *)v16 + 1) = a2;
    *((_QWORD *)v16 + 2) = a2 + 16;
    v27[0] = 1;
    v27[1] = a2 + 16;
    v18 = *(uint64_t (**)(_DWORD *, uint64_t, const gss_OID_desc *, uint64_t, uint64_t))(a2 + 360);
    if (v18)
    {
      if (a3)
        v19 = *(_QWORD *)(a3 + 24);
      else
        v19 = 0;
      v24 = v18(a1, v19, a4, a5, a6);
    }
    else if (gss_oid_equal(a4, &__gss_c_cred_password_oid_desc)
           && (v21 = *(_QWORD *)(a2 + 496)) != 0
           && (v22 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, char *, _QWORD, _QWORD))(v21 + 24)) != 0)
    {
      if (a3)
        v23 = *(_QWORD *)(a3 + 24);
      else
        v23 = 0;
      v24 = v22(a1, v23, a5, a6, v27, a8, v17 + 24, 0, 0);
    }
    else
    {
      if (a4)
      {
        free(v17);
        v17 = 0;
        v20 = 0x100000;
LABEL_17:
        *a9 = v17;
        return v20;
      }
      if (a3)
        v26 = *(_QWORD *)(a3 + 24);
      else
        v26 = 0;
      v24 = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, _QWORD *, uint64_t, char *, _QWORD, _QWORD))(a2 + 40))(a1, v26, a6, v27, a8, v17 + 24, 0, 0);
    }
    v20 = v24;
    if ((_DWORD)v24)
      _gss_mg_error(a2, *a1);
    goto LABEL_17;
  }
  *a1 = 12;
  return 851968;
}

uint64_t __ApplePrivate_gss_acquire_cred_ext(OM_uint32 *a1, uint64_t a2, const gss_OID_desc *a3, uint64_t a4, unsigned int a5, const gss_OID_desc *a6, unsigned int a7, _QWORD *a8)
{
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *mechanism;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v25;
  unsigned int v28;
  _QWORD *v29;
  int present[2];
  uint64_t v31;
  const gss_OID_desc *v32;

  *a1 = 0;
  if (!a8)
    return 0x1000000;
  v31 = 0;
  v32 = 0;
  _gss_load_mech();
  if (a6)
  {
    present[0] = 0;
    gss_test_oid_set_member(a1, a6, (gss_OID_set)_gss_mech_oids, present);
    if (!present[0])
      return 0x10000;
    v31 = 1;
    v32 = a6;
    v14 = &v31;
  }
  else
  {
    v14 = (uint64_t *)_gss_mech_oids;
  }
  v16 = _gss_mg_alloc_cred();
  if (v16)
  {
    v17 = (_QWORD *)v16;
    v25 = a8;
    *a1 = 0;
    if (*v14)
    {
      v18 = 0;
      v19 = 0;
      v15 = 458752;
      do
      {
        v29 = 0;
        *(_QWORD *)present = 0;
        v28 = 0;
        mechanism = __gss_get_mechanism((const gss_OID_desc *)(v14[1] + v18));
        if (mechanism)
        {
          v22 = (uint64_t)mechanism;
          if (!a2 || !_gss_find_mn(&v28, a2, (gss_const_OID)(v14[1] + v18), (gss_OID_desc **)present))
          {
            v15 = _gss_acquire_mech_cred(a1, v22, *(uint64_t *)present, a3, a4, a5, v21, a7, &v29);
            if (!WORD1(v15))
            {
              v23 = v29;
              *v29 = v17[2];
              v17[2] = v23;
            }
          }
        }
        ++v19;
        v18 += 16;
      }
      while (v19 < *v14);
    }
    else
    {
      v15 = 458752;
    }
    if (v17[2])
    {
      v15 = 0;
      *v25 = v17;
      *a1 = 0;
    }
    else
    {
      free(v17);
    }
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return v15;
}

OM_uint32 gss_acquire_cred_with_password(OM_uint32 *minor_status, gss_name_t desired_name, gss_buffer_t password, OM_uint32 time_req, gss_OID_set desired_mechs, gss_cred_usage_t cred_usage, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *time_rec)
{
  gss_cred_id_t *v10;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  size_t v20;
  _QWORD *v21;
  OM_uint32 v22;
  OM_uint32 v23;
  gss_OID_set *v25;
  gss_cred_id_t *v26;
  gss_cred_id_t cred_handle;
  OM_uint32 minor_statusa;

  v10 = output_cred_handle;
  minor_statusa = 0;
  if (desired_mechs)
  {
    v17 = _gss_mg_alloc_cred();
    if (!v17)
    {
      *minor_status = 12;
      return 851968;
    }
    v18 = (_QWORD *)v17;
    *(_QWORD *)(v17 + 16) = 0;
    if (!desired_mechs->count)
      goto LABEL_17;
    v25 = actual_mechs;
    v26 = v10;
    v19 = 0;
    v20 = 0;
    do
    {
      cred_handle = 0;
      if (!(__ApplePrivate_gss_acquire_cred_ext(minor_status, (uint64_t)desired_name, &__gss_c_cred_password_oid_desc, (uint64_t)password, time_req, &desired_mechs->elements[v19], cred_usage, &cred_handle) >> 16))
      {
        v21 = (_QWORD *)*((_QWORD *)cred_handle + 2);
        if (v21)
        {
          *((_QWORD *)cred_handle + 2) = *v21;
          *v21 = v18[2];
          v18[2] = v21;
        }
        gss_release_cred(&minor_statusa, &cred_handle);
      }
      ++v20;
      ++v19;
    }
    while (v20 < desired_mechs->count);
    actual_mechs = v25;
    v10 = v26;
    if (!v18[2])
    {
LABEL_17:
      free(v18);
      *minor_status = 0;
      return 458752;
    }
    *v26 = (gss_cred_id_t)v18;
  }
  else
  {
    v22 = __ApplePrivate_gss_acquire_cred_ext(minor_status, (uint64_t)desired_name, &__gss_c_cred_password_oid_desc, (uint64_t)password, time_req, 0, cred_usage, output_cred_handle);
    if (v22 >= 0x10000)
      return v22;
  }
  if ((unint64_t)actual_mechs | (unint64_t)time_rec
    && (v23 = gss_inquire_cred(minor_status, *v10, 0, time_rec, 0, actual_mechs), v23 >= 0x10000))
  {
    v22 = v23;
    gss_release_cred(&minor_statusa, v10);
  }
  else
  {
    v22 = 0;
    *minor_status = 0;
  }
  return v22;
}

uint64_t gss_authorize_localname(OM_uint32 *a1, gss_name_t_desc_struct *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v8)(OM_uint32 *, _QWORD, uint64_t, uint64_t);
  uint64_t v9;
  int v10;
  uint64_t name_attribute;
  int v12;
  OM_uint32 v13;
  uint64_t v15;
  gss_buffer_desc_struct buffer;
  gss_buffer_desc_struct __n;
  OM_uint32 minor_status;
  int v19;

  *a1 = 0;
  v3 = 0x1000000;
  if (!a2 || !a3)
    return v3;
  v7 = (_QWORD *)*((_QWORD *)a2 + 6);
  if (!v7)
  {
    v10 = 1179648;
    goto LABEL_13;
  }
  while (1)
  {
    v8 = *(uint64_t (**)(OM_uint32 *, _QWORD, uint64_t, uint64_t))(v7[1] + 440);
    if (!v8)
    {
      v10 = 0x100000;
      goto LABEL_8;
    }
    v9 = v8(a1, v7[3], a3 + 32, a3 + 16);
    v10 = v9;
    if ((_DWORD)v9 != 983040)
      break;
LABEL_8:
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_13;
  }
  if (!(_DWORD)v9)
    return v9;
LABEL_13:
  v19 = -1;
  if (!gss_oid_equal((gss_const_OID)(a3 + 16), &__gss_c_nt_user_name_oid_desc))
  {
    v3 = 196608;
    goto LABEL_27;
  }
  while (1)
  {
    minor_status = 0;
    __n.length = 0;
    __n.value = 0;
    buffer.length = 0;
    buffer.value = 0;
    v15 = 0;
    name_attribute = gss_get_name_attribute(a1, a2, (uint64_t)&__gss_c_attr_local_login_user, (_DWORD *)&v15 + 1, &v15, &__n, &buffer, (uint64_t)&v19);
    if (name_attribute >= 0x10000)
      break;
    if (HIDWORD(v15) && __n.length == *(_QWORD *)(a3 + 32) && !memcmp(__n.value, *(const void **)(a3 + 40), __n.length))
    {
      v12 = 0;
      v3 = 0;
    }
    else
    {
      v3 = 983040;
      v12 = 1;
    }
    gss_release_buffer(&minor_status, &__n);
    gss_release_buffer(&minor_status, &buffer);
    if (!v12 || !v19)
      goto LABEL_25;
  }
  v3 = name_attribute;
LABEL_25:
  if ((_DWORD)v3 && (_DWORD)v3 != 983040)
  {
LABEL_27:
    if (v10 == 0x100000)
    {
      LODWORD(__n.length) = 0;
      v13 = gss_compare_name(a1, a2, (gss_name_t)a3, (int *)&__n);
      if (v13 | LODWORD(__n.length))
        return v13;
      else
        return 983040;
    }
  }
  return v3;
}

int gss_userok(gss_name_t name, const char *user)
{
  OM_uint32 v3;
  int result;
  int v5;
  uint64_t v6;
  gss_buffer_desc_struct input_name_buffer;
  OM_uint32 minor_status;

  minor_status = 0;
  v6 = 0;
  input_name_buffer.value = (void *)user;
  input_name_buffer.length = strlen(user);
  v3 = gss_import_name(&minor_status, &input_name_buffer, &__gss_c_nt_user_name_oid_desc, (gss_name_t *)&v6);
  result = 0;
  if (!HIWORD(v3))
  {
    v5 = gss_authorize_localname(&minor_status, name, v6);
    gss_release_name(&minor_status, (gss_name_t *)&v6);
    return v5 == 0;
  }
  return result;
}

uint64_t gss_delete_name_attribute(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_DWORD *, _QWORD, uint64_t);

  *a1 = 0;
  if (!a2)
    return 0x20000;
  v3 = *(_QWORD **)(a2 + 48);
  if (!v3)
    return 0x100000;
  v6 = 0x100000;
  do
  {
    v7 = v3[1];
    v8 = *(uint64_t (**)(_DWORD *, _QWORD, uint64_t))(v7 + 480);
    if (v8)
    {
      v6 = v8(a1, v3[3], a3);
      if (v6 < 0x10000)
        return v6;
      _gss_mg_error(v7, *a1);
    }
    v3 = (_QWORD *)*v3;
  }
  while (v3);
  return v6;
}

uint64_t gss_display_name_ext(_DWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_DWORD *, _QWORD, uint64_t, _QWORD *);

  *a1 = 0;
  if (a4)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  if (!a2)
    return 0x20000;
  v7 = *(_QWORD **)(a2 + 48);
  if (!v7)
    return 0x100000;
  v8 = 0x100000;
  do
  {
    v9 = v7[1];
    v10 = *(uint64_t (**)(_DWORD *, _QWORD, uint64_t, _QWORD *))(v9 + 448);
    if (v10)
    {
      v8 = v10(a1, v7[3], a3, a4);
      if (v8 < 0x10000)
        return v8;
      _gss_mg_error(v9, *a1);
    }
    v7 = (_QWORD *)*v7;
  }
  while (v7);
  return v8;
}

uint64_t gss_export_name_composite(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_DWORD *, _QWORD, _QWORD *);

  *a1 = 0;
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  if (!a2)
    return 0x20000;
  v5 = *(_QWORD **)(a2 + 48);
  if (!v5)
    return 0x100000;
  v6 = 0x100000;
  do
  {
    v7 = v5[1];
    v8 = *(uint64_t (**)(_DWORD *, _QWORD, _QWORD *))(v7 + 488);
    if (v8)
    {
      v6 = v8(a1, v5[3], a3);
      if (v6 < 0x10000)
        return v6;
      _gss_mg_error(v7, *a1);
    }
    v5 = (_QWORD *)*v5;
  }
  while (v5);
  return v6;
}

uint64_t gss_get_name_attribute(_DWORD *a1, _QWORD *a2, uint64_t a3, _DWORD *a4, _DWORD *a5, _QWORD *a6, _QWORD *a7, uint64_t a8)
{
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_DWORD *, _QWORD, uint64_t, _DWORD *, _DWORD *, _QWORD *, _QWORD *, uint64_t);

  *a1 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
  {
    *a6 = 0;
    a6[1] = 0;
  }
  if (a7)
  {
    *a7 = 0;
    a7[1] = 0;
  }
  if (!a2)
    return 0x20000;
  _gss_mg_check_name(a2);
  v16 = (_QWORD *)a2[6];
  if (!v16)
    return 0x100000;
  v17 = 0x100000;
  do
  {
    v18 = v16[1];
    v19 = *(uint64_t (**)(_DWORD *, _QWORD, uint64_t, _DWORD *, _DWORD *, _QWORD *, _QWORD *, uint64_t))(v18 + 464);
    if (v19)
    {
      v17 = v19(a1, v16[3], a3, a4, a5, a6, a7, a8);
      if (v17 < 0x10000)
        return v17;
      _gss_mg_error(v18, *a1);
    }
    v16 = (_QWORD *)*v16;
  }
  while (v16);
  return v17;
}

OM_uint32 gss_inquire_name(OM_uint32 *minor_status, gss_name_t input_name, int *name_is_MN, gss_OID *MN_mech, gss_buffer_set_t *attrs)
{
  _QWORD *v9;
  OM_uint32 v10;
  gss_OID_desc_struct *v11;
  uint64_t (*elements)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  OM_uint32 v13;

  *minor_status = 0;
  if (name_is_MN)
    *name_is_MN = 0;
  if (MN_mech)
    *MN_mech = 0;
  if (attrs)
    *attrs = 0;
  if (!input_name)
    return 0x20000;
  v9 = (_QWORD *)*((_QWORD *)input_name + 6);
  if (!v9)
    return 0x100000;
  v10 = 0x100000;
  while (1)
  {
    v11 = (gss_OID_desc_struct *)v9[1];
    elements = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v11[28].elements;
    if (elements)
      break;
LABEL_13:
    v9 = (_QWORD *)*v9;
    if (!v9)
      return v10;
  }
  v13 = elements(minor_status, v9[3], 0, MN_mech, attrs);
  if (v13)
  {
    v10 = v13;
    _gss_mg_error((uint64_t)v11, *minor_status);
    goto LABEL_13;
  }
  if (name_is_MN)
    *name_is_MN = 1;
  if (!MN_mech || *MN_mech)
    return 0;
  v10 = 0;
  *MN_mech = v11 + 1;
  return v10;
}

uint64_t gss_pname_to_uid(unsigned int *a1, uint64_t a2, const gss_OID_desc *a3, uid_t *a4)
{
  uint64_t mn;
  gss_OID_desc *i;
  uint64_t v8;
  gss_OID_desc *v10;

  v10 = 0;
  *a1 = 0;
  if (a3)
  {
    mn = _gss_find_mn(a1, a2, a3, &v10);
    if (WORD1(mn))
      return mn;
    if (!mech_pname_to_uid(a1, (uint64_t)v10))
      return 0;
    mn = attr_pname_to_uid(a1, (uint64_t)v10, a4);
    i = v10;
    if (!(_DWORD)mn)
      return mn;
    goto LABEL_14;
  }
  for (i = *(gss_OID_desc **)(a2 + 48); ; i = *(gss_OID_desc **)&i->length)
  {
    v10 = i;
    if (!i)
      return 0x100000;
    if (!mech_pname_to_uid(a1, (uint64_t)i))
      return 0;
    v8 = attr_pname_to_uid(a1, (uint64_t)i, a4);
    if ((_DWORD)v8 != 0x100000)
      break;
  }
  mn = v8;
  if ((_DWORD)v8)
  {
LABEL_14:
    if (i)
      _gss_mg_error((uint64_t)i->elements, *a1);
  }
  return mn;
}

uint64_t mech_pname_to_uid(_DWORD *a1, uint64_t a2)
{
  uint64_t (*v2)(void);
  uint64_t v5;

  *a1 = 0;
  v2 = *(uint64_t (**)(void))(*(_QWORD *)(a2 + 8) + 432);
  if (!v2)
    return 0x100000;
  v5 = v2();
  if (v5 >= 0x10000)
    _gss_mg_error(*(_QWORD *)(a2 + 8), *a1);
  return v5;
}

uint64_t attr_pname_to_uid(_DWORD *a1, uint64_t a2, uid_t *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  passwd *v9;
  uint64_t v10;
  uint64_t v12;
  gss_buffer_desc_struct v13;
  gss_buffer_desc_struct buffer;
  int v15;
  OM_uint32 minor_status;

  v15 = -1;
  *a1 = 0;
  if (!*(_QWORD *)(*(_QWORD *)(a2 + 8) + 464))
    return 0x100000;
  minor_status = 0;
  while (1)
  {
    buffer.length = 0;
    buffer.value = 0;
    v13.length = 0;
    v13.value = 0;
    v12 = 0;
    v6 = (*(uint64_t (**)(_DWORD *, _QWORD, gss_buffer_desc *, char *, uint64_t *, gss_buffer_desc_struct *, gss_buffer_desc_struct *, int *))(*(_QWORD *)(a2 + 8) + 464))(a1, *(_QWORD *)(a2 + 24), &__gss_c_attr_local_login_user, (char *)&v12 + 4, &v12, &buffer, &v13, &v15);
    if (v6 >= 0x10000)
    {
      v10 = v6;
      _gss_mg_error(*(_QWORD *)(a2 + 8), *a1);
      return v10;
    }
    v7 = (char *)malloc_type_malloc(buffer.length + 1, 0xF21CBFA9uLL);
    if (!v7)
    {
      *a1 = 12;
      return 851968;
    }
    v8 = v7;
    memcpy(v7, buffer.value, buffer.length);
    v8[buffer.length] = 0;
    v9 = getpwnam(v8);
    free(v8);
    gss_release_buffer(&minor_status, &buffer);
    gss_release_buffer(&minor_status, &v13);
    if (v9)
      break;
    if (!v15)
      return 0x100000;
  }
  v10 = 0;
  *a3 = v9->pw_uid;
  *a1 = 0;
  return v10;
}

uint64_t gss_set_name_attribute(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_DWORD *, _QWORD, uint64_t, uint64_t, uint64_t);

  *a1 = 0;
  if (!a2)
    return 0x20000;
  v5 = *(_QWORD **)(a2 + 48);
  if (!v5)
    return 0x100000;
  v10 = 0x100000;
  do
  {
    v11 = v5[1];
    v12 = *(uint64_t (**)(_DWORD *, _QWORD, uint64_t, uint64_t, uint64_t))(v11 + 472);
    if (v12)
    {
      v10 = v12(a1, v5[3], a3, a4, a5);
      if (v10 < 0x10000)
        return v10;
      _gss_mg_error(v11, *a1);
    }
    v5 = (_QWORD *)*v5;
  }
  while (v5);
  return v10;
}

void _gss_mg_release_cred(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v4 = 0;
    do
    {
      v3 = v1[1];
      *(_QWORD *)(a1 + 16) = *v1;
      (*(void (**)(int *, _QWORD *))(v3 + 48))(&v4, v1 + 3);
      free(v1);
      v1 = *(_QWORD **)(a1 + 16);
    }
    while (v1);
  }
}

uint64_t _gss_mg_alloc_cred()
{
  uint64_t result;

  if (getTypeID_inited_0 != -1)
    dispatch_once(&getTypeID_inited_0, &__block_literal_global_1);
  if (!getTypeID_haid_0)
    return 0;
  result = _CFRuntimeCreateInstance();
  if (result)
    *(_QWORD *)(result + 16) = 0;
  return result;
}

void _gss_mg_check_credential(const void *a1)
{
  CFTypeID v1;
  uint64_t v2;

  if (a1)
  {
    v1 = CFGetTypeID(a1);
    if (getTypeID_inited_0 != -1)
      dispatch_once(&getTypeID_inited_0, &__block_literal_global_1);
    if (v1 != getTypeID_haid_0)
    {
      v2 = heim_abort();
      _gss_cred_copy_name(v2);
    }
  }
}

gss_buffer_desc_struct *_gss_cred_copy_name(uint64_t a1, uint64_t a2, const gss_OID_desc *a3)
{
  gss_buffer_desc_struct *name;
  uint64_t **i;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v12;

  name = (gss_buffer_desc_struct *)_gss_create_name(0, 0);
  if (name)
  {
    for (i = *(uint64_t ***)(a2 + 16); i; i = (uint64_t **)*i)
    {
      v12 = 0;
      if ((!a3 || gss_oid_equal(a3, (gss_const_OID)i[2]))
        && !((unsigned int (*)(uint64_t, uint64_t *, uint64_t *, _QWORD, _QWORD, _QWORD))i[1][23])(a1, i[3], &v12, 0, 0, 0))
      {
        v8 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        v9 = i[1];
        if (v8)
        {
          v10 = v12;
          v8[2] = i[2];
          v8[3] = v10;
          *v8 = name[3].length;
          v8[1] = v9;
          name[3].length = (size_t)v8;
        }
        else
        {
          ((void (*)(uint64_t, uint64_t *))v9[22])(a1, &v12);
        }
      }
    }
    if (!name[3].length)
    {
      _gss_mg_release_name(name);
      return 0;
    }
  }
  return name;
}

uint64_t __getTypeID_block_invoke_0()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  getTypeID_haid_0 = result;
  return result;
}

__CFString *_gss_mg_copy_debug_cred(uint64_t a1)
{
  __CFString *Mutable;
  __CFString *v3;
  uint64_t **i;
  uint64_t v5;
  void *value;
  size_t length;
  uint64_t v9;
  OM_uint32 minor_status;
  gss_buffer_desc_struct buffer;

  Mutable = CFStringCreateMutable(0, 0);
  v3 = Mutable;
  if (Mutable)
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("GSSCred: %p"), a1);
    for (i = *(uint64_t ***)(a1 + 16); i; i = (uint64_t **)*i)
    {
      v5 = __ApplePrivate_gss_oid_to_name((gss_const_OID)i[2]);
      buffer.length = 0;
      buffer.value = 0;
      minor_status = 0;
      v9 = 0;
      if (((unsigned int (*)(OM_uint32 *, uint64_t *, uint64_t *, _QWORD, _QWORD, _QWORD))i[1][23])(&minor_status, i[3], &v9, 0, 0, 0))
      {
        value = 0;
        length = 0;
        buffer.length = 0;
        buffer.value = 0;
      }
      else
      {
        ((void (*)(OM_uint32 *, uint64_t, gss_buffer_desc_struct *, _QWORD))i[1][19])(&minor_status, v9, &buffer, 0);
        length = buffer.length;
        value = buffer.value;
      }
      CFStringAppendFormat(v3, 0, CFSTR(" <MC: %s %.*s>"), v5, length, value);
      ((void (*)(OM_uint32 *, uint64_t *))i[1][22])(&minor_status, &v9);
      gss_release_buffer(&minor_status, &buffer);
    }
  }
  return v3;
}

uint64_t _gss_spnego_accept_sec_context(_DWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _DWORD *a9, _DWORD *a10, _QWORD *a11)
{
  void *v11;

  *a1 = 0;
  *a8 = 0;
  a8[1] = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a9)
    *a9 = 0;
  if (a10)
    *a10 = 0;
  if (a11)
    *a11 = 0;
  if (*a2)
    v11 = acceptor_continue;
  else
    v11 = acceptor_start;
  return ((uint64_t (*)(_DWORD *, _QWORD *, uint64_t))v11)(a1, a2, a3);
}

uint64_t acceptor_start(OM_uint32 *minor_status, uint64_t *a2, gss_cred_id_t_desc_struct *a3, const gss_buffer_desc *a4, gss_channel_bindings_struct *a5, _QWORD *a6, _QWORD *a7, gss_buffer_desc_struct *a8, _DWORD *a9, _DWORD *a10, gss_cred_id_t *a11)
{
  uint64_t v19;
  uint64_t v20;
  OM_uint32 v21;
  char **v22;
  char **v23;
  size_t v24;
  void *v25;
  void *v26;
  OM_uint32 v27;
  OM_uint32 v28;
  size_t v29;
  void *v30;
  OM_uint32 v31;
  OM_uint32 v32;
  _QWORD *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  gss_buffer_desc_struct *v50;
  uint64_t v51;
  char ret_flags;
  char ret_flagsa;
  gss_const_OID *v54;
  const gss_OID_desc **v55;
  uint64_t v56;
  pthread_mutex_t *v57;
  int v58;
  gss_buffer_desc_struct buffer;
  gss_buffer_desc_struct output_token;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  OM_uint32 minor_statusa;
  gss_buffer_desc input_token;
  uint64_t v67;
  gss_buffer_desc_struct v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char ***v72;

  minor_statusa = 0;
  output_token.value = 0;
  v61 = 0;
  buffer.value = 0;
  output_token.length = 0;
  v58 = 0;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  buffer.length = 0;
  if (!a4->length)
  {
    v67 = 0;
    v68.length = 1;
    v68.value = 0;
    v69 = 0;
    v71 = 0;
    v72 = 0;
    v70 = 0;
    v19 = _gss_spnego_indicate_mechtypelist(minor_status, 0, (unsigned int (*)(uint64_t, uint64_t, gss_cred_id_t, gss_OID_desc *))acceptor_approved, 0, 1, 0, (uint64_t)&v68.value, 0);
    if (!(_DWORD)v19)
    {
      v72 = (char ***)malloc_type_calloc(1uLL, 0x10uLL, 0xA0040BD48D6D6uLL);
      if (v72 && (v22 = (char **)malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL), (*v72 = v22) != 0))
      {
        v23 = *v72;
        *v23 = strdup("not_defined_in_RFC4178@please_ignore");
        v72[1] = 0;
        v24 = length_NegotiationTokenWin();
        input_token.length = v24;
        v25 = malloc_type_malloc(v24, 0x5AC0961BuLL);
        input_token.value = v25;
        if (v25)
        {
          v26 = v25;
          v27 = encode_NegotiationTokenWin();
          if (!v27)
          {
            free_NegotiationTokenWin();
            if (v24 != v67)
              abort();
            v19 = gss_encapsulate_token(&input_token, &__gss_spnego_mechanism_oid_desc, a8);
            free(input_token.value);
            if (!(_DWORD)v19)
            {
              *minor_status = 0;
              return 1;
            }
            return v19;
          }
          v28 = v27;
          free(v26);
        }
        else
        {
          v28 = 12;
        }
        free_NegotiationTokenWin();
        *minor_status = v28;
      }
      else
      {
        *minor_status = 12;
        free_NegotiationTokenWin();
      }
      return 851968;
    }
    return v19;
  }
  v19 = _gss_spnego_alloc_sec_context(minor_status, a2);
  if ((_DWORD)v19)
    return v19;
  v56 = (uint64_t)a8;
  v20 = *a2;
  v57 = (pthread_mutex_t *)(*a2 + 72);
  pthread_mutex_lock(v57);
  v19 = gss_decapsulate_token(a4, &__gss_spnego_mechanism_oid_desc, &output_token);
  if ((_DWORD)v19)
  {
LABEL_20:
    if (buffer.value)
      gss_release_buffer(&minor_statusa, &buffer);
    free_NegotiationToken();
    if (!(_DWORD)v19)
    {
      _gss_spnego_fixup_ntlm(v20);
      if (a6)
      {
        if (*(_QWORD *)(v20 + 56))
        {
          v33 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
          if (v33)
          {
            v33[4] = *(_QWORD *)(v20 + 56);
            *(_QWORD *)(v20 + 56) = 0;
            *a6 = v33;
          }
        }
      }
    }
    if (a7)
      *a7 = *(_QWORD *)(v20 + 32);
    if (a9)
      *a9 = *(_DWORD *)(v20 + 48);
    if (a10)
      *a10 = *(_DWORD *)(v20 + 52);
    if (v19 > 1)
      _gss_spnego_internal_delete_sec_context(&minor_statusa, a2, 0);
    else
      pthread_mutex_unlock(v57);
    return v19;
  }
  v21 = decode_NegotiationToken();
  gss_release_buffer(minor_status, &output_token);
  if (v21)
  {
    *minor_status = v21;
LABEL_19:
    v19 = 589824;
    goto LABEL_20;
  }
  if ((_DWORD)v62 != 1 || !DWORD2(v62))
  {
    *minor_status = 0;
    goto LABEL_19;
  }
  v68.length = DWORD2(v62);
  v68.value = (void *)v63;
  v29 = length_MechTypeList();
  *(_QWORD *)v20 = v29;
  v30 = malloc_type_malloc(v29, 0x5460504AuLL);
  *(_QWORD *)(v20 + 8) = v30;
  if (!v30)
  {
    v32 = 12;
    goto LABEL_44;
  }
  v31 = encode_MechTypeList();
  if (v31)
  {
    v32 = v31;
    free(*(void **)(v20 + 8));
    *(_QWORD *)(v20 + 8) = 0;
LABEL_44:
    *minor_status = v32;
    v19 = 851968;
    goto LABEL_20;
  }
  v55 = (const gss_OID_desc **)(v20 + 16);
  if (select_mech(minor_status, v63, 0, (const gss_OID_desc **)(v20 + 24), (int **)(v20 + 16))
    || !(_QWORD)v64)
  {
    *minor_status = 0;
    pthread_mutex_unlock(v57);
    return gss_mg_set_error_string(0, 0x80000, *minor_status, "SPNEGO acceptor didn't find a prefered mechanism", v35, v36, v37, v38, ret_flags);
  }
  v54 = (gss_const_OID *)(v20 + 24);
  v68.value = 0;
  v68.length = 0;
  v39 = *(void **)(v64 + 8);
  v68.length = *(_QWORD *)v64;
  v68.value = v39;
  if (*(_QWORD *)(v20 + 56))
    gss_release_name(&minor_statusa, (gss_name_t *)(v20 + 56));
  v19 = gss_accept_sec_context(minor_status, (gss_ctx_id_t *)(v20 + 40), a3, &v68, a5, (gss_name_t *)(v20 + 56), (gss_OID *)(v20 + 32), &buffer, (OM_uint32 *)(v20 + 48), (OM_uint32 *)(v20 + 52), a11);
  if (v19 <= 1)
  {
    v40 = (_QWORD *)(v20 + 16);
    if (!gss_oid_equal(*(gss_const_OID *)(v20 + 32), *v54))
      _gss_mg_log(1, "client didn't send the mech they said they would", v44, v45, v46, v47, v48, v49, ret_flagsa);
    if ((_DWORD)v19)
    {
      v19 = 1;
    }
    else
    {
      v19 = acceptor_complete(minor_status, v20, &v58, (uint64_t)&v68, &buffer, *((size_t **)&v64 + 1), v56);
      if ((_DWORD)v19)
        goto LABEL_20;
      *(_WORD *)(v20 + 64) |= 1u;
    }
  }
  else
  {
    gss_mg_collect_error(*v54, v19, *minor_status);
    v40 = (_QWORD *)(v20 + 16);
    *v55 = 0;
    if ((_QWORD)v64 && DWORD2(v62) >= 2)
    {
      v41 = 1;
      v42 = 16;
      while (1)
      {
        v43 = select_mech(&minor_statusa, v63 + v42, 1, v55, 0);
        if (!(_DWORD)v43)
          break;
        v19 = v43;
        ++v41;
        v42 += 16;
        if (v41 >= DWORD2(v62))
          goto LABEL_61;
      }
      if (*v55)
      {
        v50 = 0;
LABEL_71:
        v19 = send_accept(minor_status, v20, &buffer, 1, v50, v56);
        goto LABEL_20;
      }
      goto LABEL_73;
    }
  }
LABEL_61:
  if (*v40)
  {
    if (v58)
      v50 = (gss_buffer_desc_struct *)v20;
    else
      v50 = 0;
    goto LABEL_71;
  }
  if ((_DWORD)v19)
  {
    send_reject(minor_status, v56);
    goto LABEL_20;
  }
LABEL_73:
  v51 = heim_abort();
  return acceptor_continue(v51);
}

uint64_t acceptor_continue(OM_uint32 *a1, uint64_t *a2, gss_cred_id_t_desc_struct *a3, uint64_t a4, gss_channel_bindings_struct *a5, _QWORD *a6, _QWORD *a7, uint64_t a8, _DWORD *a9, _DWORD *a10, gss_cred_id_t *a11)
{
  uint64_t v18;
  OM_uint32 v19;
  int v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  gss_buffer_desc_struct *p_output_token;
  gss_buffer_desc_struct *p_input_token;
  uint64_t v27;
  int v28;
  gss_buffer_desc_struct *v29;
  _QWORD *v30;
  int v31;
  gss_buffer_desc_struct output_token;
  gss_buffer_desc_struct input_token;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  OM_uint32 minor_status[3];

  minor_status[0] = 0;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  v34 = 0;
  v18 = *a2;
  v19 = decode_NegotiationToken();
  if (!v19)
  {
    if ((_DWORD)v35 != 2)
    {
      *a1 = 0;
      return 589824;
    }
    if (*((_QWORD *)&v35 + 1))
      v20 = **((_DWORD **)&v35 + 1);
    else
      v20 = 1;
    v38 = 0;
    pthread_mutex_lock((pthread_mutex_t *)(v18 + 72));
    output_token.length = 0;
    output_token.value = 0;
    v31 = 0;
    if (*((_QWORD *)&v36 + 1))
    {
      v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8);
      input_token.length = **((_QWORD **)&v36 + 1);
      input_token.value = v23;
      if (*(_QWORD *)(v18 + 56))
        gss_release_name(minor_status, (gss_name_t *)(v18 + 56));
      v24 = gss_accept_sec_context(a1, (gss_ctx_id_t *)(v18 + 40), a3, &input_token, a5, (gss_name_t *)(v18 + 56), (gss_OID *)(v18 + 32), &output_token, (OM_uint32 *)(v18 + 48), (OM_uint32 *)(v18 + 52), a11);
      v21 = v24;
      if (v24 >= 2)
        p_output_token = 0;
      else
        p_output_token = &output_token;
      if (v24 > 1)
      {
        free_NegotiationToken();
        gss_mg_collect_error(*(const gss_OID_desc **)(v18 + 32), v21, *a1);
        send_reject(&v38, a8);
LABEL_44:
        pthread_mutex_unlock((pthread_mutex_t *)(v18 + 72));
        return v21;
      }
      if ((_DWORD)v24)
      {
        v27 = 1;
        goto LABEL_23;
      }
      *(_WORD *)(v18 + 64) |= 1u;
      p_input_token = &input_token;
    }
    else
    {
      p_input_token = 0;
      p_output_token = 0;
      input_token.length = 0;
      input_token.value = 0;
    }
    v27 = acceptor_complete(a1, v18, &v31, (uint64_t)p_input_token, p_output_token, (size_t *)v37, a8);
LABEL_23:
    if (p_output_token)
    {
      v28 = v31;
      if (p_output_token->length)
      {
LABEL_29:
        if (v28)
          v29 = (gss_buffer_desc_struct *)v18;
        else
          v29 = 0;
        v21 = send_accept(a1, v18, p_output_token, 0, v29, a8);
        if ((_DWORD)v21)
        {
LABEL_34:
          if (p_output_token)
            gss_release_buffer(minor_status, p_output_token);
          free_NegotiationToken();
          if (!(_DWORD)v21)
          {
            _gss_spnego_fixup_ntlm(v18);
            if (a6)
            {
              if (*(_QWORD *)(v18 + 56))
              {
                v30 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
                if (v30)
                {
                  v30[4] = *(_QWORD *)(v18 + 56);
                  *(_QWORD *)(v18 + 56) = 0;
                  *a6 = v30;
                }
              }
            }
          }
          if (a7)
            *a7 = *(_QWORD *)(v18 + 32);
          if (a9)
            *a9 = *(_DWORD *)(v18 + 48);
          if (a10)
            *a10 = *(_DWORD *)(v18 + 52);
          if (v21 > 1)
          {
            _gss_spnego_internal_delete_sec_context(minor_status, a2, 0);
            return v21;
          }
          goto LABEL_44;
        }
LABEL_33:
        v21 = v27;
        goto LABEL_34;
      }
    }
    else
    {
      v28 = v31;
    }
    if (!(*(unsigned __int16 *)(v18 + 64) & (v20 == 1) | (v20 != 0) & (*(unsigned __int8 *)(v18 + 49) >> 4)) && !v28)
      goto LABEL_33;
    goto LABEL_29;
  }
  *a1 = v19;
  return 589824;
}

uint64_t select_mech(OM_uint32 *a1, uint64_t a2, int a3, const gss_OID_desc **a4, int **a5)
{
  uint64_t v9;
  const gss_OID_desc *v11;
  uint64_t *v12;
  int *v13;
  int v14;
  char *v15;
  char *v16;
  uint64_t v17;
  gss_buffer_desc_struct v18;
  gss_name_t output_name;
  OM_uint32 minor_status;
  gss_OID_desc a;
  uint64_t v22;
  _BYTE v23[64];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  *(_QWORD *)&a.length = 0;
  minor_status = 0;
  if (der_put_oid())
    return 589824;
  a.length = v22;
  a.elements = &v23[-v22 + 64];
  if (gss_oid_equal(&a, &__gss_spnego_mechanism_oid_desc))
    return 0x10000;
  *a1 = 0;
  v11 = gss_oid_equal(&a, (gss_const_OID)&_gss_spnego_mskrb_mechanism_oid_desc)
      ? (const gss_OID_desc *)&_gss_spnego_krb5_mechanism_oid_desc
      : &a;
  v12 = _gss_mg_support_mechanism(v11);
  *a4 = (const gss_OID_desc *)v12;
  if (!v12)
    return 0x10000;
  if (a5)
  {
    v13 = &_gss_spnego_mskrb_mechanism_oid_desc;
    if (!gss_oid_equal(&a, (gss_const_OID)&_gss_spnego_mskrb_mechanism_oid_desc))
      v13 = (int *)*a4;
    *a5 = v13;
  }
  if (!a3)
    return 0;
  output_name = 0;
  v14 = MEMORY[0x20BD139A0]();
  v15 = 0;
  if (!v14)
    v15 = getenv("GSSAPI_SPNEGO_NAME");
  if (v15)
    v16 = v15;
  else
    v16 = "host@";
  v18.length = strlen(v16);
  v18.value = v16;
  v17 = gss_import_name(a1, &v18, &__gss_c_nt_hostbased_service_oid_desc, &output_name);
  if ((_DWORD)v17)
    return v17;
  v9 = acceptor_approved(0, (uint64_t)output_name, 0, *a4);
  gss_release_name(&minor_status, &output_name);
  return v9;
}

uint64_t acceptor_complete(OM_uint32 *a1, uint64_t a2, int *a3, uint64_t a4, _QWORD *a5, size_t *a6, uint64_t a7)
{
  char v14;
  int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  int v20;

  v14 = _gss_spnego_require_mechlist_mic(a2);
  v15 = *(unsigned __int16 *)(a2 + 64);
  v16 = v15 | 4;
  v17 = v15 & 0xFFFFFFFB | (4 * (v14 & 1));
  if (a6)
    v17 = v16;
  *(_WORD *)(a2 + 64) = v17;
  if ((~v17 & 5) != 0)
  {
    v18 = 0;
    *a3 = 0;
    return v18;
  }
  if (a4)
  {
    if (!a5 || *a5)
    {
      v18 = 0;
      *a3 = 1;
      return v18;
    }
    v20 = 1;
  }
  else
  {
    v20 = 0;
  }
  *a3 = v20;
  if (!a6 && (*(_WORD *)(a2 + 64) & 0x80) != 0)
    return 0;
  v18 = _gss_spnego_verify_mechtypes_mic(a1, (gss_buffer_t)a2, a6);
  if ((_DWORD)v18 && *a3)
    send_reject(a1, a7);
  return v18;
}

_DWORD *send_reject(_DWORD *a1, uint64_t a2)
{
  _DWORD *result;
  size_t v5;
  void *v6;
  int v7;

  result = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (result)
  {
    *result = 2;
    v5 = length_NegotiationToken();
    *(_QWORD *)a2 = v5;
    v6 = malloc_type_malloc(v5, 0x4A659835uLL);
    *(_QWORD *)(a2 + 8) = v6;
    if (v6)
    {
      v7 = encode_NegotiationToken();
      *a1 = v7;
      if (v7)
      {
        free(*(void **)(a2 + 8));
        *(_QWORD *)(a2 + 8) = 0;
      }
    }
    else
    {
      *a1 = 12;
    }
    return (_DWORD *)free_NegotiationToken();
  }
  else
  {
    *a1 = 12;
  }
  return result;
}

uint64_t send_accept(OM_uint32 *a1, uint64_t a2, _QWORD *a3, int a4, gss_buffer_desc_struct *a5, uint64_t a6)
{
  _DWORD *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t mic;
  _QWORD *v18;
  size_t v19;
  void *v20;
  gss_buffer_desc_struct message_token;
  uint64_t v23;
  _DWORD *v24;
  __int128 v25;
  __int128 v26;

  v23 = 2;
  v25 = 0u;
  v26 = 0u;
  v12 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  v24 = v12;
  if (v12)
  {
    message_token.length = 0;
    message_token.value = 0;
    v13 = *(_WORD *)(a2 + 64);
    if ((v13 & 1) != 0)
    {
      v14 = a3 && a5 && *a3;
    }
    else
    {
      v14 = 1;
      if (a4 && (v13 & 4) != 0)
      {
        *v12 = 3;
LABEL_13:
        if (*(_QWORD *)(a2 + 16))
        {
          *(_QWORD *)&v25 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040466105CCuLL);
          if (!(_QWORD)v25 || der_get_oid())
            goto LABEL_38;
          if (!a3)
            goto LABEL_22;
LABEL_19:
          if (*a3)
          {
            v16 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
            *((_QWORD *)&v25 + 1) = v16;
            if (!v16)
              goto LABEL_38;
            *v16 = *a3;
            *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8) = a3[1];
            *a3 = 0;
            a3[1] = 0;
LABEL_23:
            if (gss_oid_equal(*(gss_const_OID *)(a2 + 32), &__gss_ntlm_mechanism_oid_desc))
            {
              if (!a5 || (*(_WORD *)(a2 + 64) & 0x80) != 0)
                goto LABEL_32;
            }
            else if (!a5)
            {
              goto LABEL_32;
            }
            mic = gss_get_mic(a1, *(gss_ctx_id_t *)(a2 + 40), 0, a5, &message_token);
            if ((_DWORD)mic != 0x100000)
            {
              v15 = mic;
              if ((_DWORD)mic)
                goto LABEL_39;
              v18 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
              *(_QWORD *)&v26 = v18;
              if (!v18)
              {
                gss_release_buffer(a1, &message_token);
                goto LABEL_38;
              }
              *v18 = message_token.length;
              *(_QWORD *)(v26 + 8) = message_token.value;
LABEL_33:
              v19 = length_NegotiationToken();
              *(_QWORD *)a6 = v19;
              v20 = malloc_type_malloc(v19, 0xFAF20801uLL);
              *(_QWORD *)(a6 + 8) = v20;
              if (v20)
              {
                if (encode_NegotiationToken())
                {
                  free(*(void **)(a6 + 8));
                  *(_QWORD *)(a6 + 8) = 0;
                  goto LABEL_38;
                }
                v15 = *v24 != 0;
LABEL_39:
                free_NegotiationToken();
                return v15;
              }
LABEL_38:
              *a1 = 12;
              v15 = 851968;
              goto LABEL_39;
            }
LABEL_32:
            *(_QWORD *)&v26 = 0;
            goto LABEL_33;
          }
LABEL_22:
          *((_QWORD *)&v25 + 1) = 0;
          goto LABEL_23;
        }
LABEL_18:
        *(_QWORD *)&v25 = 0;
        if (!a3)
          goto LABEL_22;
        goto LABEL_19;
      }
    }
    *v12 = v14;
    if (!a4)
      goto LABEL_18;
    goto LABEL_13;
  }
  *a1 = 12;
  return 851968;
}

uint64_t acceptor_approved(int a1, uint64_t a2, gss_cred_id_t cred_handle, const gss_OID_desc *a4)
{
  uint64_t v5;
  uint64_t v6;
  OM_uint32 v7;
  gss_cred_id_t output_cred_handle;
  gss_OID_set mechanisms;
  OM_uint32 minor_status;

  minor_status = 0;
  mechanisms = 0;
  if (cred_handle)
  {
    LODWORD(output_cred_handle) = 0;
    v5 = gss_inquire_cred(&minor_status, cred_handle, 0, 0, 0, &mechanisms);
    if ((_DWORD)v5)
      return v5;
    v7 = gss_test_oid_set_member(&minor_status, a4, mechanisms, (int *)&output_cred_handle);
    gss_release_oid_set(&minor_status, &mechanisms);
    v6 = 851968;
    if (!v7 && (_DWORD)output_cred_handle)
      return 0;
  }
  else
  {
    v6 = a2;
    output_cred_handle = 0;
    if (a2)
    {
      gss_create_empty_oid_set(&minor_status, &mechanisms);
      gss_add_oid_set_member(&minor_status, a4, &mechanisms);
      v6 = gss_acquire_cred(&minor_status, (gss_name_t)v6, 0xFFFFFFFF, mechanisms, 2, &output_cred_handle, 0, 0);
      gss_release_oid_set(&minor_status, &mechanisms);
      if (!(_DWORD)v6)
      {
        gss_release_cred(&minor_status, &output_cred_handle);
        return 0;
      }
    }
  }
  return v6;
}

uint64_t _gss_spnego_alloc_sec_context(_DWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t result;

  v4 = (char *)malloc_type_calloc(1uLL, 0x98uLL, 0x10A0040585C2CE9uLL);
  if (v4)
  {
    v5 = v4;
    *((_QWORD *)v4 + 7) = 0;
    *(_OWORD *)v4 = 0u;
    *((_OWORD *)v4 + 1) = 0u;
    *((_OWORD *)v4 + 2) = 0u;
    *((_WORD *)v4 + 32) &= 0xFFB0u;
    pthread_mutex_init((pthread_mutex_t *)(v4 + 72), 0);
    result = 0;
    *a2 = v5;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return result;
}

uint64_t _gss_spnego_internal_delete_sec_context(OM_uint32 *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  OM_uint32 minor_status;

  *a1 = 0;
  if (!a2)
    return 0x80000;
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  v4 = *a2;
  *a2 = 0;
  if (!v4)
    return 0x80000;
  v5 = *(void **)(v4 + 8);
  if (v5)
    free(v5);
  minor_status = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  gss_release_name(&minor_status, (gss_name_t *)(v4 + 136));
  gss_release_name(&minor_status, (gss_name_t *)(v4 + 56));
  if (*(_QWORD *)(v4 + 40))
  {
    v6 = gss_delete_sec_context(a1, (gss_ctx_id_t *)(v4 + 40), 0);
    *(_QWORD *)(v4 + 40) = 0;
  }
  else
  {
    v6 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 72));
  pthread_mutex_destroy((pthread_mutex_t *)(v4 + 72));
  free((void *)v4);
  return v6;
}

uint64_t _gss_spnego_fixup_ntlm(uint64_t a1)
{
  uint64_t result;
  OM_uint32 minor_status;
  gss_buffer_set_t data_set;

  result = gss_oid_equal(*(gss_const_OID *)(a1 + 32), &__gss_ntlm_mechanism_oid_desc);
  if ((_DWORD)result)
  {
    data_set = 0;
    minor_status = 0;
    gss_inquire_sec_context_by_oid(&minor_status, *(gss_ctx_id_t *)(a1 + 40), &__gss_c_ntlm_reset_keys_oid_desc, &data_set);
    return gss_release_buffer_set(&minor_status, &data_set);
  }
  return result;
}

uint64_t _gss_spnego_require_mechlist_mic(uint64_t a1)
{
  __int16 v1;
  _BOOL8 v3;
  OM_uint32 minor_status;
  gss_buffer_set_t data_set;

  data_set = 0;
  v1 = *(_WORD *)(a1 + 64);
  if ((v1 & 8) != 0)
    return 1;
  if ((v1 & 0x10) != 0)
    return 0;
  minor_status = 0;
  if (!gss_inquire_sec_context_by_oid(&minor_status, *(gss_ctx_id_t *)(a1 + 40), &__gss_c_peer_has_updated_spnego_oid_desc, &data_set))gss_release_buffer_set(&minor_status, &data_set);
  v3 = (*(_WORD *)(a1 + 64) & 2) == 0 || gss_oid_equal(*(gss_const_OID *)(a1 + 32), &__gss_ntlm_mechanism_oid_desc) == 0;
  if (gss_oid_equal(*(gss_const_OID *)(a1 + 32), *(gss_const_OID *)(a1 + 16))
    || gss_oid_equal(*(gss_const_OID *)(a1 + 32), &_gss_spnego_krb5_mechanism_oid_desc)
    && gss_oid_equal(*(gss_const_OID *)(a1 + 16), (gss_const_OID)&_gss_spnego_mskrb_mechanism_oid_desc))
  {
    *(_WORD *)(a1 + 64) |= 0x80u;
  }
  return v3;
}

uint64_t _gss_spnego_indicate_mechtypelist(OM_uint32 *minor_status, uint64_t a2, unsigned int (*a3)(uint64_t, uint64_t, gss_cred_id_t, gss_OID_desc *), uint64_t a4, int a5, gss_cred_id_t cred_handle, uint64_t a7, uint64_t **a8)
{
  uint64_t v16;
  uint64_t v17;
  const gss_OID_desc *v19;
  unsigned int v20;
  gss_OID_desc *v21;
  gss_OID_set v22;
  uint64_t v23;
  size_t v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  OM_uint32 v29;
  int v30;
  uint64_t **v31;
  gss_OID_desc_struct *v32;
  int present[2];
  gss_OID_set mechanisms;

  *(_QWORD *)present = 0;
  mechanisms = 0;
  *(_DWORD *)a7 = 0;
  *(_QWORD *)(a7 + 8) = 0;
  if (cred_handle)
    v16 = gss_inquire_cred(minor_status, cred_handle, 0, 0, 0, &mechanisms);
  else
    v16 = gss_indicate_mechs(minor_status, &mechanisms);
  v17 = v16;
  if ((_DWORD)v16)
    return v17;
  if (!mechanisms->count)
  {
    *minor_status = 2;
    gss_release_oid_set(minor_status, &mechanisms);
    return 851968;
  }
  v19 = 0;
  if (!gss_test_oid_set_member((OM_uint32 *)&present[1], &__gss_krb5_mechanism_oid_desc, mechanisms, present)
    && present[0])
  {
    if (a3(a4, a2, cred_handle, &__gss_krb5_mechanism_oid_desc))
    {
      v19 = 0;
    }
    else
    {
      v20 = add_mech_type(&__gss_krb5_mechanism_oid_desc, a5, (unsigned int *)a7);
      v21 = (gss_OID_desc *)&_gss_spnego_mskrb_mechanism_oid_desc;
      if (!a5)
        v21 = &__gss_krb5_mechanism_oid_desc;
      if (v20 >= 0x10000)
        v19 = 0;
      else
        v19 = v21;
      add_mech_type(&__gss_appl_lkdc_supported_oid_desc, 0, (unsigned int *)a7);
    }
  }
  v22 = mechanisms;
  if (!mechanisms->count)
  {
    v17 = 0;
    goto LABEL_31;
  }
  v31 = a8;
  v32 = (gss_OID_desc_struct *)v19;
  v30 = a5;
  v23 = 0;
  v24 = 0;
  while (1)
  {
    v25 = gss_oid_equal(&v22->elements[v23], &__gss_spnego_mechanism_oid_desc);
    v22 = mechanisms;
    if (!v25)
    {
      v26 = gss_oid_equal(&mechanisms->elements[v23], &__gss_krb5_mechanism_oid_desc);
      v22 = mechanisms;
      if (!v26)
      {
        v27 = gss_oid_equal(&mechanisms->elements[v23], &__gss_netlogon_mechanism_oid_desc);
        v22 = mechanisms;
        if (!v27)
        {
          v28 = a3(a4, a2, cred_handle, &mechanisms->elements[v23]);
          v22 = mechanisms;
          if (!v28)
            break;
        }
      }
    }
LABEL_27:
    ++v24;
    ++v23;
    if (v24 >= v22->count)
    {
      v17 = 0;
      goto LABEL_29;
    }
  }
  v29 = add_mech_type(&mechanisms->elements[v23], v30, (unsigned int *)a7);
  if (!v29)
  {
    v22 = mechanisms;
    if (!v32)
      v32 = &mechanisms->elements[v23];
    goto LABEL_27;
  }
  *minor_status = v29;
  v17 = 851968;
LABEL_29:
  a8 = v31;
  v19 = v32;
LABEL_31:
  if (*(_DWORD *)a7)
  {
    if (a8)
      *a8 = _gss_mg_support_mechanism(v19);
    gss_release_oid_set(minor_status, &mechanisms);
  }
  else
  {
    gss_release_oid_set(minor_status, &mechanisms);
    *minor_status = 0;
    return 0x10000;
  }
  return v17;
}

uint64_t add_mech_type(gss_const_OID a, int a2, unsigned int *a3)
{
  uint64_t oid;

  if (!a2
    || !gss_oid_equal(a, &_gss_spnego_krb5_mechanism_oid_desc)
    || (oid = der_get_oid(), !(_DWORD)oid) && (oid = add_MechTypeList(a3), free_MechType(), !(_DWORD)oid))
  {
    oid = der_get_oid();
    if (!(_DWORD)oid)
    {
      oid = add_MechTypeList(a3);
      free_MechType();
    }
  }
  return oid;
}

uint64_t _gss_spnego_verify_mechtypes_mic(OM_uint32 *minor_status, gss_buffer_t message_buffer, size_t *a3)
{
  void *v5;
  OM_uint32 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  gss_buffer_desc_struct v14;

  if ((message_buffer[4].length & 0x40) != 0)
  {
    *minor_status = 0;
    return 2;
  }
  else
  {
    v5 = (void *)a3[1];
    v14.length = *a3;
    v14.value = v5;
    v6 = gss_verify_mic(minor_status, (gss_ctx_id_t)message_buffer[2].value, message_buffer, &v14, 0);
    if (!v6)
    {
LABEL_5:
      result = 0;
      LOWORD(message_buffer[4].length) |= 0x40u;
      *minor_status = 0;
      return result;
    }
    if (v6 == 0x100000)
    {
      _gss_mg_log(10, "mech doesn't support MIC, allowing anyway", v7, v8, v9, v10, v11, v12, v14.length);
      goto LABEL_5;
    }
    return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 589824, *minor_status, "SPNEGO peer sent invalid mechListMIC", v9, v10, v11, v12, v14.length);
  }
}

uint64_t _gss_spnego_process_context_token(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (!a2)
    return 0x80000;
  v10 = a2;
  v6 = (pthread_mutex_t *)(a2 + 72);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 72));
  v7 = gss_process_context_token(a1, *(gss_ctx_id_t *)(a2 + 40), a3);
  if ((_DWORD)v7)
  {
    v8 = v7;
    pthread_mutex_unlock(v6);
  }
  else
  {
    *(_QWORD *)(a2 + 40) = 0;
    return _gss_spnego_internal_delete_sec_context(a1, &v10, 0);
  }
  return v8;
}

uint64_t _gss_spnego_delete_sec_context(OM_uint32 *a1, uint64_t *a2, _QWORD *a3)
{
  if (!a2 || !*a2)
    return 0x80000;
  pthread_mutex_lock((pthread_mutex_t *)(*a2 + 72));
  return _gss_spnego_internal_delete_sec_context(a1, a2, a3);
}

uint64_t _gss_spnego_context_time(OM_uint32 *a1, uint64_t a2, OM_uint32 *a3)
{
  gss_ctx_id_t_desc_struct *v3;

  *a1 = 0;
  if (a2 && (v3 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0)
    return gss_context_time(a1, v3, a3);
  else
    return 0x80000;
}

uint64_t _gss_spnego_get_mic(OM_uint32 *a1, uint64_t a2, gss_qop_t a3, gss_buffer_desc_struct *a4, gss_buffer_desc_struct *a5)
{
  gss_ctx_id_t_desc_struct *v5;

  *a1 = 0;
  if (a2 && (v5 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0)
    return gss_get_mic(a1, v5, a3, a4, a5);
  else
    return 0x80000;
}

uint64_t _gss_spnego_verify_mic(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3, gss_buffer_desc_struct *a4, gss_qop_t *a5)
{
  gss_ctx_id_t_desc_struct *v5;

  *a1 = 0;
  if (a2 && (v5 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0)
    return gss_verify_mic(a1, v5, a3, a4, a5);
  else
    return 0x80000;
}

uint64_t _gss_spnego_wrap(OM_uint32 *a1, uint64_t a2, int a3, gss_qop_t a4, gss_buffer_desc_struct *a5, int *a6, gss_buffer_desc_struct *a7)
{
  gss_ctx_id_t_desc_struct *v7;

  *a1 = 0;
  if (a2 && (v7 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0)
    return gss_wrap(a1, v7, a3, a4, a5, a6, a7);
  else
    return 0x80000;
}

uint64_t _gss_spnego_unwrap(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3, gss_buffer_desc_struct *a4, int *a5, gss_qop_t *a6)
{
  gss_ctx_id_t_desc_struct *v6;

  *a1 = 0;
  if (a2 && (v6 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0)
    return gss_unwrap(a1, v6, a3, a4, a5, a6);
  else
    return 0x80000;
}

uint64_t _gss_spnego_compare_name(int a1, gss_const_OID a, gss_const_OID b, _DWORD *a4)
{
  size_t v7;

  *a4 = 0;
  if (gss_oid_equal(a, b))
  {
    v7 = *(_QWORD *)&a[1].length;
    if (v7 == *(_QWORD *)&b[1].length && !memcmp(a[1].elements, b[1].elements, v7))
      *a4 = 1;
  }
  return 0;
}

uint64_t _gss_spnego_display_name(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3, gss_OID *a4)
{
  gss_name_t_desc_struct *v4;

  *a1 = 0;
  if (a2 && (v4 = *(gss_name_t_desc_struct **)(a2 + 32)) != 0)
    return gss_display_name(a1, v4, a3, a4);
  else
    return 851968;
}

uint64_t _gss_spnego_import_name(_DWORD *a1, uint64_t a2, const void **a3, size_t **a4)
{
  size_t *v8;
  size_t *v9;
  uint64_t result;
  size_t *v11;

  *a1 = 0;
  v8 = (size_t *)malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
  if (v8)
  {
    v9 = v8;
    if (_gss_copy_oid(a1, a3, (uint64_t)v8))
    {
      free(v9);
    }
    else
    {
      result = _gss_copy_buffer(a1, a2, v9 + 2);
      if (!(_DWORD)result)
      {
        v9[4] = 0;
        *a4 = v9;
        return result;
      }
      v11 = v9;
      _gss_spnego_release_name(a1, (uint64_t *)&v11);
    }
  }
  else
  {
    *a1 = 12;
  }
  return 851968;
}

uint64_t _gss_spnego_release_name(_DWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  OM_uint32 minor_status;

  *a1 = 0;
  v2 = *a2;
  if (*a2)
  {
    minor_status = 0;
    _gss_free_oid(&minor_status, v2);
    gss_release_buffer(&minor_status, (gss_buffer_t)(v2 + 16));
    if (*(_QWORD *)(v2 + 32))
      gss_release_name(&minor_status, (gss_name_t *)(v2 + 32));
    free((void *)v2);
    *a2 = 0;
  }
  return 0;
}

uint64_t _gss_spnego_export_name(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3)
{
  gss_name_t_desc_struct *v3;

  *a1 = 0;
  if (a2 && (v3 = *(gss_name_t_desc_struct **)(a2 + 32)) != 0)
    return gss_export_name(a1, v3, a3);
  else
    return 0x20000;
}

uint64_t _gss_spnego_inquire_context(OM_uint32 *a1, uint64_t a2, gss_name_t *a3, _QWORD *a4, OM_uint32 *a5, gss_OID *a6, OM_uint32 *a7, int *a8, int *xopen)
{
  gss_ctx_id_t_desc_struct *v9;
  uint64_t result;
  gss_name_t_desc_struct *v14;
  _QWORD *v15;
  _QWORD *v16;
  gss_name_t targ_name;
  gss_name_t src_name;
  OM_uint32 minor_status;

  *a1 = 0;
  if (!a2)
    return 0x80000;
  v9 = *(gss_ctx_id_t_desc_struct **)(a2 + 40);
  if (!v9)
    return 0x80000;
  minor_status = 0;
  targ_name = 0;
  src_name = 0;
  result = gss_inquire_context(a1, v9, &src_name, &targ_name, a5, a6, a7, a8, xopen);
  if (!(_DWORD)result)
  {
    if (a3)
    {
      v14 = (gss_name_t_desc_struct *)malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
      if (!v14)
      {
LABEL_14:
        gss_release_name(&minor_status, &targ_name);
        gss_release_name(&minor_status, &src_name);
        *a1 = 12;
        return 851968;
      }
      *((_QWORD *)v14 + 4) = src_name;
      *a3 = v14;
      if (a4)
      {
LABEL_7:
        v15 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
        if (v15)
        {
          v16 = v15;
          result = 0;
          v16[4] = targ_name;
          *a4 = v16;
          return result;
        }
        gss_release_name(a1, a3);
        goto LABEL_14;
      }
    }
    else
    {
      gss_release_name(&minor_status, &src_name);
      if (a4)
        goto LABEL_7;
    }
    gss_release_name(&minor_status, &targ_name);
    return 0;
  }
  return result;
}

uint64_t _gss_spnego_wrap_size_limit(OM_uint32 *a1, uint64_t a2, int a3, gss_qop_t a4, OM_uint32 a5, OM_uint32 *a6)
{
  gss_ctx_id_t_desc_struct *v6;

  *a1 = 0;
  if (a2 && (v6 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0)
    return gss_wrap_size_limit(a1, v6, a3, a4, a5, a6);
  else
    return 0x80000;
}

uint64_t _gss_spnego_export_sec_context(OM_uint32 *a1, uint64_t *a2, gss_buffer_desc_struct *a3)
{
  uint64_t v3;
  pthread_mutex_t *v6;
  gss_ctx_id_t *v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = 0;
  if (!a2)
    return 0x80000;
  v3 = *a2;
  if (!*a2)
    return 0x80000;
  v6 = (pthread_mutex_t *)(v3 + 72);
  pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
  v8 = *(_QWORD *)(v3 + 40);
  v7 = (gss_ctx_id_t *)(v3 + 40);
  if (v8)
    v9 = gss_export_sec_context(a1, v7, a3);
  else
    v9 = 0x80000;
  pthread_mutex_unlock(v6);
  return v9;
}

uint64_t _gss_spnego_import_sec_context(OM_uint32 *a1, gss_buffer_desc_struct *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  pthread_mutex_t *v8;
  uint64_t v10;
  OM_uint32 v11;

  v11 = 0;
  v10 = 0;
  v6 = _gss_spnego_alloc_sec_context(a1, &v10);
  if (!(_DWORD)v6)
  {
    v7 = v10;
    v8 = (pthread_mutex_t *)(v10 + 72);
    pthread_mutex_lock((pthread_mutex_t *)(v10 + 72));
    v6 = gss_import_sec_context(a1, a2, (gss_ctx_id_t *)(v7 + 40));
    if ((_DWORD)v6)
    {
      _gss_spnego_internal_delete_sec_context(&v11, a3, 0);
    }
    else
    {
      *(_WORD *)(v7 + 64) |= 1u;
      pthread_mutex_unlock(v8);
      *a3 = v7;
    }
  }
  return v6;
}

uint64_t _gss_spnego_inquire_mechs_for_name(OM_uint32 *a1, int a2, gss_OID_set *oid_set)
{
  uint64_t empty_oid_set;
  OM_uint32 minor_status;

  empty_oid_set = gss_create_empty_oid_set(a1, oid_set);
  if (!(_DWORD)empty_oid_set)
  {
    empty_oid_set = gss_add_oid_set_member(a1, &__gss_spnego_mechanism_oid_desc, oid_set);
    if ((_DWORD)empty_oid_set)
    {
      minor_status = 0;
      gss_release_oid_set(&minor_status, oid_set);
    }
  }
  return empty_oid_set;
}

uint64_t _gss_spnego_canonicalize_name(OM_uint32 *a1, gss_name_t_desc_struct *a2, int a3, gss_name_t *dest_name)
{
  return gss_duplicate_name(a1, a2, dest_name);
}

uint64_t _gss_spnego_wrap_iov(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  uint64_t v7;

  *a1 = 0;
  if (a2 && (v7 = *(_QWORD *)(a2 + 40)) != 0)
    return __ApplePrivate_gss_wrap_iov(a1, v7, a3, a4, a5, a6, a7);
  else
    return 0x80000;
}

uint64_t _gss_spnego_unwrap_iov(_DWORD *a1, uint64_t a2, _DWORD *a3, _DWORD *a4, uint64_t a5, int a6)
{
  uint64_t v6;

  *a1 = 0;
  if (a2 && (v6 = *(_QWORD *)(a2 + 40)) != 0)
    return __ApplePrivate_gss_unwrap_iov(a1, v6, a3, a4, a5, a6);
  else
    return 0x80000;
}

uint64_t _gss_spnego_wrap_iov_length(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  uint64_t v7;

  *a1 = 0;
  if (a2 && (v7 = *(_QWORD *)(a2 + 40)) != 0)
    return __ApplePrivate_gss_wrap_iov_length(a1, v7, a3, a4, a5, a6, a7);
  else
    return 0x80000;
}

uint64_t _gss_spnego_inquire_sec_context_by_oid(OM_uint32 *a1, uint64_t a2, gss_OID_desc_struct *a3, gss_buffer_set_t *a4)
{
  gss_ctx_id_t_desc_struct *v4;

  *a1 = 0;
  if (a2 && (v4 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0)
    return gss_inquire_sec_context_by_oid(a1, v4, a3, a4);
  else
    return 0x80000;
}

uint64_t _gss_spnego_set_sec_context_option(OM_uint32 *a1, uint64_t *a2, gss_OID_desc_struct *a3, gss_buffer_desc_struct *a4)
{
  uint64_t v4;
  gss_ctx_id_t *v5;
  uint64_t v6;

  *a1 = 0;
  if (a2 && (v4 = *a2) != 0 && (v6 = *(_QWORD *)(v4 + 40), v5 = (gss_ctx_id_t *)(v4 + 40), v6))
    return gss_set_sec_context_option(a1, v5, a3, a4);
  else
    return 0x80000;
}

uint64_t _gss_spnego_pseudo_random(OM_uint32 *a1, uint64_t a2, int a3, gss_buffer_desc_struct *a4, ssize_t a5, gss_buffer_desc_struct *a6)
{
  gss_ctx_id_t_desc_struct *v6;

  *a1 = 0;
  if (a2 && (v6 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0)
    return gss_pseudo_random(a1, v6, a3, a4, a5, a6);
  else
    return 0x80000;
}

void *__gss_spnego_initialize()
{
  return &spnego_mech;
}

uint64_t _gss_spnego_init_sec_context(_DWORD *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, uint64_t a8, uint64_t a9, _QWORD *a10, _QWORD *a11, uint64_t a12, uint64_t a13)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char);
  uint64_t v21;
  OM_uint32 v26;

  v18 = *a3;
  if (!*a3)
  {
    v19 = _gss_spnego_alloc_sec_context(a1, a3);
    if (WORD1(v19))
      return v19;
    v18 = *a3;
    *(_QWORD *)(*a3 + 144) = spnego_initial;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v18 + 72));
  v20 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))(v18 + 144);
  while (1)
  {
    v21 = ((uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))v20)(a1, a2, v18, a4, a5, a6, a7, a8, a9, a11, a12, a13);
    v19 = v21;
    if ((_DWORD)v21)
      break;
    v20 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))(v18 + 144);
    if (v20 == step_completed_0 || *a11)
      goto LABEL_10;
  }
  if (v21 >= 0x10000)
  {
    v26 = 0;
    _gss_spnego_internal_delete_sec_context(&v26, a3, 0);
    return v19;
  }
LABEL_10:
  pthread_mutex_unlock((pthread_mutex_t *)(v18 + 72));
  if (a10)
    *a10 = *(_QWORD *)(v18 + 32);
  return v19;
}

uint64_t spnego_initial(_DWORD *a1, gss_cred_id_t_desc_struct *a2, uint64_t a3, gss_const_OID input_name_type, int a5, int a6, int a7, uint64_t a8, uint64_t a9, gss_buffer_t output_token, _DWORD *a11, _DWORD *a12)
{
  uint64_t v18;
  uint64_t v19;
  size_t length;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  size_t v29;
  void *v30;
  int v31;
  int v32;
  size_t v34;
  void *v35;
  void *v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  gss_buffer_desc_struct v41;
  __int128 v42;
  uint64_t v43;
  gss_buffer_desc input_token;
  uint64_t v45;
  gss_buffer_desc_struct buffer;
  OM_uint32 minor_status;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  v45 = 0;
  *a1 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  if (!input_name_type)
    return 0x20000;
  minor_status = 0;
  input_token.length = 0;
  input_token.value = 0;
  *(_WORD *)(a3 + 64) |= 2u;
  v18 = gss_import_name(&minor_status, (gss_buffer_t)&input_name_type[1], input_name_type, (gss_name_t *)(a3 + 136));
  if (v18 >= 0x10000)
    goto LABEL_10;
  LODWORD(v48) = 1;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = (gss_buffer_desc_struct)0;
  v42 = 0u;
  v43 = 0;
  *((_QWORD *)&v38 + 1) = *(_QWORD *)(a3 + 136);
  LODWORD(v38) = a6;
  LODWORD(v39) = a7;
  *((_QWORD *)&v39 + 1) = a8;
  v18 = _gss_spnego_indicate_mechtypelist(&minor_status, *((uint64_t *)&v38 + 1), (unsigned int (*)(uint64_t, uint64_t, gss_cred_id_t, gss_OID_desc *))initiator_approved, (uint64_t)&v38, 0, a2, (uint64_t)&v48 + 8, (uint64_t **)(a3 + 16));
  if (v18 >= 0x10000)
  {
LABEL_10:
    v24 = v18;
    *a1 = minor_status;
  }
  else
  {
    *((_QWORD *)&v49 + 1) = 0;
    v19 = *((_QWORD *)&v42 + 1);
    if (*((_QWORD *)&v42 + 1))
    {
      buffer = v41;
      *(_DWORD *)(a3 + 48) = v42;
      *(_QWORD *)(a3 + 32) = *((_QWORD *)&v40 + 1);
      *(_QWORD *)(a3 + 40) = v19;
      *(_WORD *)(a3 + 64) = ((v43 & 1) << 8) | *(_WORD *)(a3 + 64) & 0xFEFF;
      length = buffer.length;
      if (buffer.length)
      {
        v21 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
        *(_QWORD *)&v50 = v21;
        if (!v21
          || (*v21 = length,
              v22 = malloc_type_malloc(length, 0x138100C3uLL),
              *(_QWORD *)(v50 + 8) = v22,
              (v23 = *(void **)(v50 + 8)) == 0)
          && buffer.length)
        {
          free_NegotiationToken();
          gss_release_buffer(&minor_status, &buffer);
          *a1 = 12;
          return 851968;
        }
        memcpy(v23, buffer.value, buffer.length);
        gss_release_buffer(&minor_status, &buffer);
      }
      else
      {
        *(_QWORD *)&v50 = 0;
      }
      *((_QWORD *)&v50 + 1) = 0;
      v29 = length_MechTypeList();
      *(_QWORD *)a3 = v29;
      v30 = malloc_type_malloc(v29, 0x7E4F3EFEuLL);
      *(_QWORD *)(a3 + 8) = v30;
      if (!v30)
      {
        v32 = 12;
        goto LABEL_19;
      }
      v31 = encode_MechTypeList();
      if (v31)
      {
        v32 = v31;
        free(*(void **)(a3 + 8));
        *(_QWORD *)(a3 + 8) = 0;
LABEL_19:
        *a1 = v32;
LABEL_20:
        free_NegotiationToken();
        return 851968;
      }
      v34 = length_NegotiationToken();
      input_token.length = v34;
      v35 = malloc_type_malloc(v34, 0x23F2496EuLL);
      input_token.value = v35;
      if (!v35)
        goto LABEL_20;
      v36 = v35;
      if (encode_NegotiationToken())
      {
        free(v36);
        goto LABEL_20;
      }
      free_NegotiationToken();
      if (v34 != v45)
        abort();
      v24 = gss_encapsulate_token(&input_token, &__gss_spnego_mechanism_oid_desc, output_token);
      free(input_token.value);
      if (!(_DWORD)v24)
      {
        if (a11)
          *a11 = *(_DWORD *)(a3 + 48);
        if (a12)
          *a12 = *(_DWORD *)(a3 + 52);
        *(_QWORD *)(a3 + 144) = spnego_reply;
        return 1;
      }
    }
    else
    {
      free_NegotiationToken();
      *a1 = 0;
      return gss_mg_set_error_string(0, 0x80000, 0, "SPNEGO could not find a prefered mechanism", v25, v26, v27, v28, v37);
    }
  }
  return v24;
}

uint64_t step_completed_0(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = 22;
  return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 327680, 22, "SPNEGO called got ISC call one too many", a5, a6, a7, a8, a9);
}

uint64_t initiator_approved(uint64_t a1, int a2, gss_cred_id_t initiator_cred_handle, gss_OID input_mech_type)
{
  OM_uint32 inited;
  uint64_t v7;
  gss_OID v8;
  OM_uint32 ret_flags;
  gss_OID actual_mech_type;
  gss_buffer_desc_struct buffer;
  gss_ctx_id_t context_handle;
  OM_uint32 minor_status;

  minor_status = 0;
  context_handle = 0;
  buffer.length = 0;
  buffer.value = 0;
  actual_mech_type = 0;
  ret_flags = 0;
  inited = gss_init_sec_context(&minor_status, initiator_cred_handle, &context_handle, *(gss_name_t *)(a1 + 8), input_mech_type, *(_DWORD *)a1, *(_DWORD *)(a1 + 16), *(gss_channel_bindings_t *)(a1 + 24), 0, &actual_mech_type, &buffer, &ret_flags, 0);
  if (inited >= 0x10000)
  {
    v7 = 0x10000;
    gss_mg_collect_error(input_mech_type, 0x10000, minor_status);
  }
  else
  {
    if (*(_QWORD *)(a1 + 32))
    {
      gss_release_buffer(&minor_status, &buffer);
      gss_delete_sec_context(&minor_status, &context_handle, 0);
    }
    else
    {
      v8 = actual_mech_type;
      *(_QWORD *)(a1 + 32) = input_mech_type;
      *(_QWORD *)(a1 + 40) = v8;
      *(gss_buffer_desc_struct *)(a1 + 48) = buffer;
      *(_DWORD *)(a1 + 64) = ret_flags;
      *(_QWORD *)(a1 + 72) = context_handle;
      if (!inited)
      {
        v7 = 0;
        *(_DWORD *)(a1 + 80) = 1;
        return v7;
      }
    }
    return 0;
  }
  return v7;
}

uint64_t spnego_reply(OM_uint32 *a1, gss_cred_id_t_desc_struct *a2, uint64_t a3, uint64_t a4, uint64_t a5, OM_uint32 a6, OM_uint32 a7, gss_channel_bindings_struct *a8, uint64_t a9, _QWORD *a10, _DWORD *a11, _DWORD *a12)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t inited;
  int *v27;
  int v28;
  __int16 v29;
  char v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _DWORD *v34;
  unsigned int reply;
  int v36;
  const gss_OID_desc *v37;
  uint64_t *v38;
  char input_token;
  gss_OID_desc b;
  gss_buffer_desc_struct buffer;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  OM_uint32 minor_status;

  minor_status = 0;
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  *a1 = 0;
  *a10 = 0;
  a10[1] = 0;
  buffer.length = 0;
  buffer.value = 0;
  v22 = decode_NegotiationToken();
  if ((_DWORD)v22)
    return v22;
  if ((_DWORD)v42 != 2)
  {
    free_NegotiationToken();
    *a1 = 0;
    return 0x10000;
  }
  if (!*((_QWORD *)&v42 + 1) || **((_DWORD **)&v42 + 1) == 2)
  {
LABEL_18:
    free_NegotiationToken();
    return 0x10000;
  }
  v23 = *(_QWORD *)(a3 + 24);
  if (!v23 && (_QWORD)v43)
  {
    *(_QWORD *)&b.length = 0;
    b.elements = 0;
    *(_WORD *)(a3 + 64) |= 0x200u;
    b.length = der_length_oid();
    b.elements = malloc_type_malloc(b.length, 0xDCB0767AuLL);
    if (b.elements)
    {
      if (!der_put_oid() && !b.length)
      {
        if (gss_oid_equal(&__gss_spnego_mechanism_oid_desc, &b))
        {
          free(b.elements);
          free_NegotiationToken();
          *a1 = 22;
          v24 = "SPNEGO acceptor picked SPNEGO??";
          return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, 22, v24, v18, v19, v20, v21, input_token);
        }
        v36 = gss_oid_equal(*(gss_const_OID *)(a3 + 16), &b);
        v37 = *(const gss_OID_desc **)(a3 + 16);
        if (!v36)
        {
          if (!gss_oid_equal(v37, &__gss_krb5_mechanism_oid_desc)
            || !gss_oid_equal(&b, (gss_const_OID)&_gss_spnego_mskrb_mechanism_oid_desc))
          {
            gss_delete_sec_context(&minor_status, (gss_ctx_id_t *)(a3 + 40), 0);
            *(_QWORD *)(a3 + 40) = 0;
            v38 = _gss_mg_support_mechanism(&b);
            *(_QWORD *)(a3 + 24) = v38;
            if (!v38)
            {
              free(b.elements);
              free_NegotiationToken();
              *a1 = 22;
              v24 = "SPNEGO acceptor send supportedMech we don't support";
              return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, 22, v24, v18, v19, v20, v21, input_token);
            }
            goto LABEL_71;
          }
          v37 = *(const gss_OID_desc **)(a3 + 16);
        }
        *(_QWORD *)(a3 + 24) = v37;
LABEL_71:
        free(b.elements);
        goto LABEL_14;
      }
      free(b.elements);
    }
    goto LABEL_18;
  }
  if (!v23)
  {
    free_NegotiationToken();
    *a1 = 22;
    v24 = "SPNEGO acceptor didn't send supportedMech";
    return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, 22, v24, v18, v19, v20, v21, input_token);
  }
LABEL_14:
  if (*((_QWORD *)&v43 + 1))
  {
    if (!**((_QWORD **)&v43 + 1) && *(_QWORD *)(a3 + 40))
      goto LABEL_32;
    *(_QWORD *)&b.length = **((_QWORD **)&v43 + 1);
    b.elements = 0;
    b.elements = *(void **)(*((_QWORD *)&v43 + 1) + 8);
LABEL_25:
    inited = gss_init_sec_context(&minor_status, a2, (gss_ctx_id_t *)(a3 + 40), *(gss_name_t *)(a3 + 136), *(gss_OID *)(a3 + 24), a6, a7, a8, (gss_buffer_t)&b, (gss_OID *)(a3 + 32), &buffer, (OM_uint32 *)(a3 + 48), (OM_uint32 *)(a3 + 52));
    v22 = inited;
    if (WORD1(inited))
    {
      free_NegotiationToken();
      gss_mg_collect_error(*(const gss_OID_desc **)(a3 + 24), v22, minor_status);
      *a1 = minor_status;
      return v22;
    }
    if (!(_DWORD)inited)
      *(_WORD *)(a3 + 64) |= 1u;
    v27 = (int *)*((_QWORD *)&v42 + 1);
    goto LABEL_29;
  }
  if (!*(_QWORD *)(a3 + 40))
  {
    *(_QWORD *)&b.length = 0;
    b.elements = 0;
    goto LABEL_25;
  }
LABEL_32:
  v27 = (int *)*((_QWORD *)&v42 + 1);
  v28 = **((_DWORD **)&v42 + 1);
  if (**((_DWORD **)&v42 + 1))
  {
    v22 = 0;
    goto LABEL_34;
  }
  v33 = *(_WORD *)(a3 + 64);
  if ((v33 & 0x100) != 0)
  {
    v33 |= 1u;
    *(_WORD *)(a3 + 64) = v33;
  }
  if ((v33 & 1) == 0)
  {
    *a1 = 22;
    v24 = "SPNEGO acceptor send acceptor compete, but we are not complete yet";
    return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, 22, v24, v18, v19, v20, v21, input_token);
  }
  v22 = 0;
LABEL_29:
  v28 = *v27;
LABEL_34:
  v29 = *(_WORD *)(a3 + 64);
  if (v28 == 3)
  {
    v29 |= 8u;
    *(_WORD *)(a3 + 64) = v29;
  }
  if ((v29 & 0x41) != 1)
    goto LABEL_41;
  v30 = _gss_spnego_require_mechlist_mic(a3);
  v31 = *(_WORD *)(a3 + 64);
  LOBYTE(v29) = (4 * (v30 & 1)) | v31 & 0xFB;
  *(_WORD *)(a3 + 64) = (4 * (v30 & 1)) | v31 & 0xFFFB;
  if ((_QWORD)v44)
  {
    LOBYTE(v29) = v31 | 4;
    *(_WORD *)(a3 + 64) = v31 | 4;
    if ((v31 & 0x80) != 0)
    {
      if (*((_QWORD *)&v43 + 1))
      {
        v32 = der_heim_octet_string_cmp();
        v29 = *(_WORD *)(a3 + 64);
        if (!v32)
        {
LABEL_41:
          v29 &= ~4u;
          *(_WORD *)(a3 + 64) = v29;
        }
      }
    }
  }
  if ((v29 & 4) != 0 && (_QWORD)v44)
  {
    v22 = _gss_spnego_verify_mechtypes_mic(a1, (gss_buffer_t)a3, (size_t *)v44);
    if ((_DWORD)v22)
    {
      free_NegotiationToken();
      return v22;
    }
    v29 = *(_WORD *)(a3 + 64);
  }
  v34 = (_DWORD *)*((_QWORD *)&v42 + 1);
  if ((v29 & 1) != 0)
  {
    if (((v29 & 0x80) == 0 || **((_DWORD **)&v42 + 1)) && (v29 & 0x44) == 4)
    {
      *(_QWORD *)(a3 + 144) = wait_server_mic;
      v22 = 1;
    }
    else
    {
      v22 = 0;
      *(_QWORD *)(a3 + 144) = step_completed_0;
    }
  }
  if (*v34
    || *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))(a3 + 144) != step_completed_0
    || buffer.length)
  {
    reply = make_reply(a1, (gss_buffer_t)a3, &buffer, (uint64_t)a10);
    if (reply)
      v22 = reply;
    else
      v22 = v22;
  }
  free_NegotiationToken();
  gss_release_buffer(&minor_status, &buffer);
  if (a11)
    *a11 = *(_DWORD *)(a3 + 48);
  if (a12)
    *a12 = *(_DWORD *)(a3 + 52);
  return v22;
}

uint64_t wait_server_mic(_DWORD *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;

  v2 = decode_NegotiationToken();
  if (v2)
  {
    v7 = v2;
    v8 = "Failed to decode NegotiationToken";
  }
  else
  {
    free_NegotiationToken();
    *a1 = 22;
    v8 = "NegToken not accept_completed";
    v7 = 22;
  }
  return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, v7, v8, v3, v4, v5, v6, 0);
}

uint64_t make_reply(OM_uint32 *minor_status, gss_buffer_t message_buffer, _QWORD *a3, uint64_t a4)
{
  __int16 length;
  _BOOL4 v9;
  _QWORD *v11;
  uint64_t mic;
  uint64_t v13;
  _QWORD *v14;
  _DWORD *v15;
  size_t v16;
  void *v17;
  OM_uint32 v18;
  OM_uint32 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  gss_buffer_desc_struct message_token;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  message_token.length = 0;
  message_token.value = 0;
  v29 = 0u;
  v27 = 2uLL;
  v28 = 0uLL;
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  length = message_buffer[4].length;
  v9 = (length & 1) == 0 || (length & 0x44) == 4;
  if (*a3)
  {
    v11 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
    *((_QWORD *)&v28 + 1) = v11;
    if (!v11)
      goto LABEL_30;
    *v11 = *a3;
    *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8) = a3[1];
    *a3 = 0;
    a3[1] = 0;
    length = message_buffer[4].length;
  }
  if ((length & 0x21) == 1)
  {
    LOWORD(message_buffer[4].length) = length | 0x20;
    mic = gss_get_mic(minor_status, (gss_ctx_id_t)message_buffer[2].value, 0, message_buffer, &message_token);
    if ((_DWORD)mic == 0x100000)
    {
      *(_QWORD *)&v29 = 0;
      LOWORD(message_buffer[4].length) &= ~4u;
    }
    else
    {
      v13 = mic;
      if ((_DWORD)mic)
      {
        free_NegotiationToken();
        *minor_status = 12;
        return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, v13, 12, "SPNEGO failed to sign MIC", v20, v21, v22, v23, v25);
      }
      v14 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
      *(_QWORD *)&v29 = v14;
      if (!v14)
      {
        gss_release_buffer(minor_status, &message_token);
        goto LABEL_30;
      }
      *v14 = message_token.length;
      *(_QWORD *)(v29 + 8) = message_token.value;
    }
  }
  else
  {
    *(_QWORD *)&v29 = 0;
  }
  if (gss_oid_equal((gss_const_OID)message_buffer[2].length, &__gss_ntlm_mechanism_oid_desc))
    goto LABEL_20;
  v15 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  *((_QWORD *)&v27 + 1) = v15;
  if (!v15)
  {
LABEL_30:
    free_NegotiationToken();
    *minor_status = 12;
    return 851968;
  }
  *v15 = v9;
LABEL_20:
  v16 = length_NegotiationToken();
  *(_QWORD *)a4 = v16;
  v17 = malloc_type_malloc(v16, 0x7168D0A3uLL);
  *(_QWORD *)(a4 + 8) = v17;
  if (!v17)
  {
    v19 = 12;
    goto LABEL_24;
  }
  v18 = encode_NegotiationToken();
  if (v18)
  {
    v19 = v18;
    free(*(void **)(a4 + 8));
    *(_QWORD *)(a4 + 8) = 0;
LABEL_24:
    free_NegotiationToken();
    *minor_status = v19;
    return 851968;
  }
  free_NegotiationToken();
  if (v9)
    return 1;
  _gss_spnego_fixup_ntlm((uint64_t)message_buffer);
  return 0;
}

uint64_t _gss_ntlm_allocate_ctx(int *a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t result;
  int v6;

  *a3 = 0;
  if (__ApplePrivate_gss_mo_get(&__gss_ntlm_mechanism_oid_desc, &__gss_c_ntlm_v2_oid_desc, 0))
  {
    v4 = malloc_type_calloc(1uLL, 0x2A0uLL, 0x10F204024BAB64EuLL);
    if (v4)
    {
      free(v4);
      result = 851968;
      v6 = 22;
    }
    else
    {
      result = 851968;
      v6 = 12;
    }
  }
  else
  {
    v6 = 0;
    result = 0x100000;
  }
  *a1 = v6;
  return result;
}

uint64_t _gss_ntlm_accept_sec_context(int *a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t a5, void ***a6, gss_OID_desc **a7, _QWORD *a8, _DWORD *a9, _DWORD *a10, _QWORD *a11)
{
  uint64_t v11;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  OM_uint32 *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char **name;
  void *v49;
  char v50;
  char v51;
  CCHmacContext ctx;
  char **v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  size_t v59;
  void *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v63 = 0;
  v64 = 0;
  *a8 = 0;
  a8[1] = 0;
  *a1 = 0;
  v11 = 851968;
  if (!a2 || !a4)
    return v11;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a9)
    *a9 = 0;
  if (a10)
    *a10 = 0;
  if (a11)
    *a11 = 0;
  v62 = 0;
  v18 = *a2;
  if (!*a2)
    return _gss_ntlm_allocate_ctx(a1, (uint64_t)a2, &v61);
  v59 = 0;
  v60 = 0;
  v57 = 0;
  v58 = 0;
  v55 = 0;
  v56 = 0;
  v53 = 0;
  v54 = 0;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v65 = 0u;
  v61 = v18;
  _gss_mg_log(1, "ntlm-asc-type3", a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, v50);
  v19 = a4[1];
  v63 = *a4;
  v64 = v19;
  v20 = heim_ntlm_decode_type3();
  if (v20 || (v20 = krb5_data_copy()) != 0)
  {
    v26 = v20;
LABEL_17:
    _gss_ntlm_delete_sec_context((OM_uint32 *)a1, a2, 0);
    *a1 = v26;
    return 851968;
  }
  *a1 = 0;
  v28 = *(_QWORD *)(v18 + 8);
  if (!v28)
  {
    v11 = 851968;
LABEL_31:
    heim_ntlm_free_type3();
    v39 = (OM_uint32 *)&v62;
    goto LABEL_32;
  }
  v29 = 0;
  v30 = 0;
  v11 = 851968;
  do
  {
    v31 = *(_QWORD *)(*(_QWORD *)v18 + v29 + 8);
    if (v31)
    {
      v11 = (*(uint64_t (**)(int *, uint64_t, uint64_t, __int128 *, uint64_t, char *, uint64_t *, size_t *, char ***, uint64_t *, uint64_t *))(*(_QWORD *)(*(_QWORD *)v18 + v29) + 32))(a1, v18, v31, &v65, a3, (char *)&v54 + 4, &v54, &v59, &v53, &v57, &v55);
      _gss_mg_log(10, "ntlm-asc-type3: tried %s -> %d/%d", v32, v33, v34, v35, v36, v37, **(_QWORD **)(*(_QWORD *)v18 + v29));
      v28 = *(_QWORD *)(v18 + 8);
      if (!(_DWORD)v11)
        break;
    }
    ++v30;
    v29 += 16;
  }
  while (v30 < v28);
  if (v30 >= v28)
    goto LABEL_31;
  if ((v54 & 2) != 0 && !*((_QWORD *)&v70 + 1))
  {
    _gss_mg_log(1, "ntlm-asc-type3 mic missing from reply", v31, v21, v22, v23, v24, v25, v51);
    v38 = 80;
LABEL_37:
    *a1 = v38;
    return 851968;
  }
  _gss_ntlm_debug_key(10, (char)"session key");
  if (v59)
  {
    if (*((_QWORD *)&v70 + 1))
    {
      v40 = (_QWORD *)(*(_QWORD *)(v18 + 104) + *((_QWORD *)&v70 + 1));
      memset(&ctx, 0, sizeof(ctx));
      *v40 = 0;
      v40[1] = 0;
      CCHmacInit(&ctx, 1u, v60, v59);
      CCHmacUpdate(&ctx, *(const void **)(v18 + 72), *(_QWORD *)(v18 + 64));
      CCHmacUpdate(&ctx, *(const void **)(v18 + 88), *(_QWORD *)(v18 + 80));
      CCHmacUpdate(&ctx, *(const void **)(v18 + 104), *(_QWORD *)(v18 + 96));
      CCHmacFinal(&ctx, v40);
      if (ct_memcmp())
      {
        _gss_ntlm_debug_hex(10, (char)"mic");
        _gss_ntlm_debug_hex(10, (char)"ntlm-asc-type3 mic invalid");
        free(v60);
        v38 = -1561745650;
        goto LABEL_37;
      }
    }
  }
  if ((v54 & 0x80000000000) != 0)
    *(_DWORD *)(v18 + 28) |= 0x40u;
  v41 = v56;
  *(_QWORD *)(v18 + 256) = v55;
  *(_QWORD *)(v18 + 264) = v41;
  if (!v53)
  {
    name = _gss_ntlm_create_name(a1, *((const char **)&v65 + 1), (const char *)v66, 0);
    *(_QWORD *)(v18 + 216) = name;
    if (name)
      goto LABEL_43;
    free(v60);
    heim_ntlm_free_type3();
    v39 = (OM_uint32 *)a1;
LABEL_32:
    _gss_ntlm_delete_sec_context(v39, a2, 0);
    return v11;
  }
  _gss_ntlm_release_name(&v62, (void ***)(v18 + 216));
  name = v53;
  *(_QWORD *)(v18 + 216) = v53;
LABEL_43:
  v49 = v58;
  if (v58)
  {
    if (v57 == 16)
    {
      *(_OWORD *)((char *)name + 20) = *(_OWORD *)v58;
      *((_DWORD *)name + 4) |= 4u;
    }
    free(v49);
    name = *(char ***)(v18 + 216);
  }
  _gss_mg_log(1, "ntlm-asc-type3: %s\\%s", v42, v43, v44, v45, v46, v47, (char)name[1]);
  if (a6)
    _gss_ntlm_duplicate_name(&v62, *(_QWORD *)(v18 + 216), a6);
  heim_ntlm_free_type3();
  v26 = krb5_data_copy();
  free(v60);
  if (v26)
  {
    if (a6)
      _gss_ntlm_release_name(&v62, a6);
    goto LABEL_17;
  }
  _gss_ntlm_set_keys(v18);
  _gss_ntlm_reset_seq(v18);
  if (a7)
    *a7 = &__gss_ntlm_mechanism_oid_desc;
  if (a10)
    *a10 = -1;
  *(_DWORD *)(v18 + 40) |= 1u;
  v11 = 0;
  if (a9)
    *a9 = *(_DWORD *)(v18 + 28);
  return v11;
}

uint64_t _gss_ntlm_have_cred(krb5_error_code *a1, const char **a2, _QWORD *a3)
{
  krb5_error_code inited;
  uint64_t v7;
  const __CFAllocator *v9;
  CFStringRef v10;
  const __CFString *v11;
  CFStringRef v12;
  void *v13;
  void *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  __CFDictionary *MutableCopy;
  const __CFArray *v18;
  const __CFArray *v19;
  const __CFUUID *UUID;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  const void *v33;
  void **v34;
  char *v35;
  krb5_context v36;
  char out[40];
  void *values[3];
  void *keys[3];
  unsigned __int8 uu[16];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v36 = 0;
  memset(uu, 0, sizeof(uu));
  inited = krb5_init_context(&v36);
  if (inited)
  {
    *a1 = inited;
    return 851968;
  }
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], *a2, 0x8000100u);
  if (!v10)
  {
    heim_release();
    return 851968;
  }
  v11 = v10;
  v12 = CFStringCreateWithCString(v9, a2[1], 0x8000100u);
  if (!v12)
  {
    MutableCopy = 0;
    v19 = 0;
    goto LABEL_22;
  }
  v13 = (void *)*MEMORY[0x24BE4C3B8];
  keys[0] = *(void **)MEMORY[0x24BE4C3D0];
  keys[1] = v13;
  keys[2] = *(void **)MEMORY[0x24BE4C3A8];
  v14 = (void *)*MEMORY[0x24BE4C3E0];
  values[0] = *(void **)MEMORY[0x24BE4C3C8];
  values[1] = v14;
  values[2] = *(void **)MEMORY[0x24BDBD430];
  v15 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v15)
    heim_abort();
  v16 = v15;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v15);
  CFRelease(v16);
  if (CFStringGetLength(v11) >= 1)
    CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x24BE4C3A0], v11);
  if (CFStringGetLength(v12) >= 1)
    CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x24BE4C370], v12);
  v18 = (const __CFArray *)HeimCredCopyQuery();
  v19 = v18;
  if (!v18)
    goto LABEL_22;
  if (!CFArrayGetCount(v18))
    goto LABEL_22;
  if (!CFArrayGetValueAtIndex(v19, 0))
    goto LABEL_22;
  UUID = (const __CFUUID *)HeimCredGetUUID();
  if (!UUID)
    goto LABEL_22;
  *(CFUUIDBytes *)uu = CFUUIDGetUUIDBytes(UUID);
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  _gss_mg_log(1, "_gss_ntlm_have_cred  UUID(%s)", v21, v22, v23, v24, v25, v26, (char)out);
  if (CFStringGetLength(v11) && CFStringGetLength(v12))
  {
    v27 = _gss_ntlm_duplicate_name(a1, (uint64_t)a2, &v35);
    if ((_DWORD)v27)
    {
      v7 = v27;
      goto LABEL_23;
    }
    v29 = v35;
    goto LABEL_38;
  }
  v28 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
  v35 = v28;
  if (!v28)
  {
LABEL_22:
    v7 = 851968;
    goto LABEL_23;
  }
  v29 = v28;
  v30 = HeimCredCopyAttribute();
  if (v30)
  {
    v31 = (const void *)v30;
    *(_QWORD *)v29 = rk_cfstring2cstring();
    CFRelease(v31);
  }
  v32 = HeimCredCopyAttribute();
  if (v32)
  {
    v33 = (const void *)v32;
    *((_QWORD *)v29 + 1) = rk_cfstring2cstring();
    CFRelease(v33);
  }
  if (!*(_QWORD *)v29 || !*((_QWORD *)v29 + 1))
  {
    v34 = (void **)v29;
    _gss_ntlm_release_name(a1, &v34);
    heim_release();
    *a1 = 12;
    CFRelease(v11);
    v7 = 851968;
    goto LABEL_24;
  }
LABEL_38:
  v7 = 0;
  *((_DWORD *)v29 + 4) |= 1u;
  *(_OWORD *)(v29 + 36) = *(_OWORD *)uu;
  *a3 = v29;
LABEL_23:
  heim_release();
  CFRelease(v11);
  if (v12)
LABEL_24:
    CFRelease(v12);
  if (MutableCopy)
    CFRelease(MutableCopy);
  if (v19)
    CFRelease(v19);
  return v7;
}

uint64_t _gss_ntlm_acquire_cred(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  OM_uint32 v15;

  *a1 = 0;
  *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a8)
    *a8 = -1;
  if (!a2)
    return 458752;
  v15 = 0;
  v14 = 0;
  if ((a5 & 0xFFFFFFFD) == 0)
  {
    result = _gss_ntlm_allocate_ctx(a1, *(_QWORD *)(a2 + 8), &v14);
    if ((_DWORD)result)
      return result;
    v13 = v14;
    _gss_ntlm_delete_sec_context(&v15, &v13, 0);
  }
  if (a5 > 1)
    return 0;
  v13 = 0;
  if ((*(_BYTE *)(a2 + 16) & 2) != 0)
  {
    result = _gss_ntlm_duplicate_name(a1, a2, &v13);
    if ((_DWORD)result)
      return result;
  }
  else
  {
    result = _gss_ntlm_have_cred(a1, (const char **)a2, &v13);
    if ((_DWORD)result)
      return result;
  }
  result = 0;
  *a6 = v13;
  return result;
}

uint64_t _gss_ntlm_acquire_cred_ext(int a1, const char **a2, gss_const_OID a, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  int v11;
  uint64_t v12;
  char *v13;
  char *v14;
  size_t v15;
  const __CFAllocator *v16;
  CFStringRef v17;
  CFStringRef v18;
  CFStringRef v19;
  CFDataRef v20;
  CFDataRef v21;
  void *v22;
  void *v23;
  void *v24;
  CFDictionaryRef v25;
  CFDictionaryRef v26;
  const void *v27;
  const __CFUUID *UUID;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  krb5_context v38;
  char out[48];
  void *values[5];
  void *keys[5];
  unsigned __int8 uu[16];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return 851968;
  v11 = gss_oid_equal(a, &__gss_c_cred_password_oid_desc);
  v12 = 851968;
  if (a2)
  {
    if (v11)
    {
      v38 = 0;
      memset(uu, 0, sizeof(uu));
      if (!krb5_init_context(&v38))
      {
        v13 = (char *)malloc_type_malloc(*(_QWORD *)a4 + 1, 0xC3BA1EA5uLL);
        if (!v13)
          goto LABEL_16;
        v14 = v13;
        memcpy(v13, *(const void **)(a4 + 8), *(_QWORD *)a4);
        v14[*(_QWORD *)a4] = 0;
        heim_ntlm_nt_key();
        v15 = strlen(v14);
        bzero(v14, v15);
        free(v14);
        v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], *a2, 0x8000100u);
        if (!v17)
        {
LABEL_16:
          heim_release();
          return v12;
        }
        v18 = v17;
        v19 = CFStringCreateWithCString(v16, a2[1], 0x8000100u);
        if (v19)
        {
          v20 = CFDataCreate(v16, 0, 0);
          v21 = v20;
          if (v20)
          {
            v22 = (void *)*MEMORY[0x24BE4C3B8];
            keys[0] = *(void **)MEMORY[0x24BE4C3D0];
            keys[1] = v22;
            v23 = (void *)*MEMORY[0x24BE4C370];
            keys[2] = *(void **)MEMORY[0x24BE4C3A0];
            keys[3] = v23;
            keys[4] = *(void **)MEMORY[0x24BE4C348];
            v24 = (void *)*MEMORY[0x24BE4C3E0];
            values[0] = *(void **)MEMORY[0x24BE4C3C8];
            values[1] = v24;
            values[2] = (void *)v18;
            values[3] = (void *)v19;
            values[4] = v20;
            v25 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            if (!v25)
              heim_abort();
            v26 = v25;
            v27 = (const void *)HeimCredCreate();
            if (v27)
            {
              UUID = (const __CFUUID *)HeimCredGetUUID();
              if (UUID)
              {
                *(CFUUIDBytes *)uu = CFUUIDGetUUIDBytes(UUID);
                memset(out, 0, 37);
                uuid_unparse(uu, out);
                _gss_mg_log(1, "_gss_ntlm_acquire_cred_ext name(%s) domain(%s) UUID(%s)", v29, v30, v31, v32, v33, v34, (char)*a2);
                heim_ntlm_free_buf();
                v35 = malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
                if (v35)
                {
                  v36 = v35;
                  *v35 = strdup(*a2);
                  v12 = 0;
                  v36[1] = strdup(a2[1]);
                  *((_DWORD *)v36 + 4) = 1;
                  *(_OWORD *)((char *)v36 + 36) = *(_OWORD *)uu;
                  *a8 = v36;
                }
                else
                {
                  v12 = 851968;
                }
              }
            }
            goto LABEL_20;
          }
          v27 = 0;
        }
        else
        {
          v27 = 0;
          v21 = 0;
        }
        v26 = 0;
LABEL_20:
        heim_release();
        CFRelease(v18);
        if (v19)
          CFRelease(v19);
        if (v21)
          CFRelease(v21);
        if (v26)
          CFRelease(v26);
        if (v27)
          CFRelease(v27);
      }
    }
  }
  return v12;
}

uint64_t _gss_ntlm_add_cred(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8, _QWORD *a9, _DWORD *a10, _DWORD *a11)
{
  if (a1)
    *a1 = 0;
  if (a8)
    *a8 = 0;
  if (a9)
    *a9 = 0;
  if (a10)
    *a10 = 0;
  if (a11)
    *a11 = 0;
  return 0;
}

uint64_t _gss_ntlm_canonicalize_name(_DWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return _gss_ntlm_duplicate_name(a1, a2, a4);
}

uint64_t _gss_ntlm_compare_name(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

uint64_t _gss_ntlm_context_time(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a3)
    *a3 = -1;
  return 0;
}

uint64_t _gss_ntlm_reset_seq(uint64_t result)
{
  if ((*(_BYTE *)(result + 38) & 8) != 0)
  {
    *(_DWORD *)(result + 272) = 0;
    *(_DWORD *)(result + 472) = 0;
  }
  return result;
}

uint64_t _gss_ntlm_set_keys(uint64_t result)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  uint64_t v4;

  if (*(_QWORD *)(result + 48))
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 36);
    v3 = *(_DWORD *)(result + 40);
    *(_DWORD *)(result + 40) = v3 | 4;
    if ((v2 & 0x20) != 0)
      *(_DWORD *)(result + 28) |= 0x10u;
    if ((v2 & 0x8010) != 0)
      *(_DWORD *)(result + 28) |= 0x20u;
    if ((v2 & 0x80000) != 0)
    {
      v4 = (v3 >> 1) & 1;
      _gss_ntlm_set_key(result + 272, (v3 & 2) == 0, v2 & 0x40000000);
      return _gss_ntlm_set_key(v1 + 472, v4, *(_DWORD *)(v1 + 36) & 0x40000000);
    }
    else
    {
      hc_EVP_CIPHER_CTX_cleanup();
      hc_EVP_CIPHER_CTX_cleanup();
      hc_EVP_rc4();
      hc_EVP_CipherInit_ex();
      hc_EVP_rc4();
      return hc_EVP_CipherInit_ex();
    }
  }
  return result;
}

uint64_t _gss_ntlm_set_key(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  CCDigestCreate();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestReset();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestDestroy();
  hc_EVP_CIPHER_CTX_cleanup();
  hc_EVP_rc4();
  result = hc_EVP_CipherInit_ex();
  if (a3)
    *(_QWORD *)(a1 + 176) = a1 + 8;
  return result;
}

uint64_t _gss_ntlm_destroy_crypto(uint64_t result)
{
  if ((*(_BYTE *)(result + 40) & 4) != 0)
  {
    hc_EVP_CIPHER_CTX_cleanup();
    return hc_EVP_CIPHER_CTX_cleanup();
  }
  return result;
}

uint64_t _gss_ntlm_get_mic(_DWORD *a1, uint64_t a2, uint64_t a3, __int128 *a4, gss_buffer_desc_struct *a5)
{
  uint64_t mic_iov;
  OM_uint32 minor_status;
  int v11;
  __int128 v12;
  int v13;
  gss_buffer_desc_struct v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = 1;
  v12 = *a4;
  v13 = 7;
  v14.length = 16;
  v14.value = malloc_type_malloc(0x10uLL, 0x6F94655EuLL);
  if (v14.value)
  {
    minor_status = 0;
    mic_iov = get_mic_iov(a1, a2, (uint64_t)&v13, (uint64_t)&v11, 1);
    if ((_DWORD)mic_iov)
      gss_release_buffer(&minor_status, &v14);
    else
      *a5 = v14;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return mic_iov;
}

uint64_t get_mic_iov(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  _DWORD *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  int v19;
  int v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  if (*(_QWORD *)(a3 + 8) != 16)
    get_mic_iov_cold_2();
  v7 = *(_DWORD **)(a3 + 16);
  if (!v7)
    get_mic_iov_cold_1();
  LODWORD(v8) = a5;
  v9 = *(_DWORD *)(a2 + 36);
  if ((~v9 & 0x80010) == 0)
  {
    if ((*(_BYTE *)(a2 + 40) & 4) != 0)
    {
      v10 = *(_QWORD *)(a2 + 448);
      v11 = *(unsigned int *)(a2 + 272);
      *(_DWORD *)(a2 + 272) = v11 + 1;
      v2_sign_message((void *)(a2 + 456), v10, v11, a3, a4, a5);
      return 0;
    }
    return 0x100000;
  }
  if ((v9 & 0x10) == 0)
  {
    if ((v9 & 0x8000) != 0)
    {
      _gss_mg_encode_le_uint32(1, *(_DWORD **)(a3 + 16));
      _gss_mg_encode_le_uint32(0, v7 + 1);
      _gss_mg_encode_le_uint32(0, v7 + 2);
      _gss_mg_encode_le_uint32(0, v7 + 3);
      return 0;
    }
    return 0x100000;
  }
  if ((*(_BYTE *)(a2 + 40) & 4) == 0)
    return 0x100000;
  v13 = *(unsigned int *)(a2 + 272);
  *(_DWORD *)(a2 + 272) = v13 + 1;
  v14 = *(_DWORD **)(a3 + 16);
  _krb5_crc_init_table();
  if ((int)v8 < 1)
  {
    v15 = 0;
  }
  else
  {
    v15 = 0;
    v16 = a4 + 16;
    v8 = v8;
    do
    {
      v17 = *(unsigned __int16 *)(v16 - 16);
      v18 = v17 > 0xB;
      v19 = (1 << v17) & 0xA02;
      if (!v18 && v19 != 0)
        v15 = _krb5_crc_update();
      v16 += 24;
      --v8;
    }
    while (v8);
  }
  _gss_mg_encode_le_uint32(0, &v21);
  _gss_mg_encode_le_uint32(v15, &v22);
  _gss_mg_encode_le_uint32(v13, &v23);
  _gss_mg_encode_le_uint32(1, v14);
  hc_EVP_Cipher();
  return (CCRandomCopyBytes() != 0) << 20;
}

uint64_t _gss_ntlm_verify_mic(_DWORD *a1, uint64_t a2, __int128 *a3, __int128 *a4, _DWORD *a5)
{
  int v6;
  __int128 v7;
  int v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = 1;
  v7 = *a3;
  v8 = 7;
  v9 = *a4;
  return verify_mic_iov(a1, a2, (uint64_t)&v8, a5, (uint64_t)&v6, 1);
}

uint64_t verify_mic_iov(_DWORD *a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  uint64_t v6;
  int v9;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  int v17;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;

  LODWORD(v6) = a6;
  v24 = *MEMORY[0x24BDAC8D0];
  if (a4)
    *a4 = 0;
  *a1 = 0;
  if (*(_QWORD *)(a3 + 8) != 16)
    return 393216;
  v9 = *(_DWORD *)(a2 + 36);
  if ((~v9 & 0x80010) == 0)
  {
    if ((*(_BYTE *)(a2 + 40) & 4) != 0)
      return v2_verify_message((void *)(a2 + 656), *(_QWORD *)(a2 + 648), 0, a3, a5, a6);
    return 0x100000;
  }
  if ((v9 & 0x10) != 0)
  {
    v20 = 0;
    if ((*(_BYTE *)(a2 + 40) & 4) == 0)
      return 0x100000;
    _gss_mg_decode_le_uint32(*(_DWORD **)(a3 + 16), &v20);
    if (v20 == 1)
    {
      hc_EVP_Cipher();
      _krb5_crc_init_table();
      if ((int)v6 < 1)
      {
        v13 = 0;
      }
      else
      {
        v13 = 0;
        v14 = a5 + 16;
        v6 = v6;
        do
        {
          v15 = *(unsigned __int16 *)(v14 - 16);
          v16 = v15 > 0xB;
          v17 = (1 << v15) & 0xA02;
          if (!v16 && v17 != 0)
            v13 = _krb5_crc_update();
          v14 += 24;
          --v6;
        }
        while (v6);
      }
      _gss_mg_decode_le_uint32(&v22, &v20);
      if (v20 == v13)
      {
        _gss_mg_decode_le_uint32(&v23, &v20);
        v19 = *(_DWORD *)(a2 + 448);
        if (v19 == v20)
        {
          v12 = 0;
          *(_DWORD *)(a2 + 448) = v19 + 1;
          return v12;
        }
      }
    }
    return 393216;
  }
  if ((v9 & 0x8000) != 0)
  {
    v21 = 0;
    v11 = *(_DWORD **)(a3 + 16);
    _gss_mg_decode_le_uint32(v11, &v21);
    if (v21 == 1)
    {
      _gss_mg_decode_le_uint32(v11 + 1, &v21);
      if (!v21)
      {
        _gss_mg_decode_le_uint32(v11 + 2, &v21);
        v12 = 393216;
        if (!v21)
        {
          _gss_mg_decode_le_uint32(v11 + 3, &v21);
          if (v21)
            return 393216;
          else
            return 0;
        }
        return v12;
      }
    }
    return 393216;
  }
  return 0x100000;
}

uint64_t _gss_ntlm_wrap_size_limit(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int *a6)
{
  uint64_t result;
  unsigned int v7;

  *a1 = 0;
  if ((*(_BYTE *)(a2 + 36) & 0x20) == 0)
    return 0x100000;
  result = 0;
  v7 = a5 - 16;
  if (a5 < 0x10)
    v7 = 0;
  *a6 = v7;
  return result;
}

uint64_t _gss_ntlm_wrap_iov(_DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, uint64_t a7, uint64_t a8, char a9)
{
  unsigned __int16 *buffer;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned __int16 *v23;

  *a1 = 0;
  if (a5)
    *a5 = 0;
  if (!a6)
    return 851968;
  buffer = _gss_mg_find_buffer(a6, a7, 7);
  if (!buffer)
  {
    buffer = _gss_mg_find_buffer(a6, a7, 2);
    if (!buffer)
    {
      *a1 = -1561745656;
      return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 851968, -1561745656, "iov header buffer missing", v15, v16, v17, v18, a9);
    }
  }
  if ((buffer[1] & 1) != 0)
  {
    result = _gss_mg_allocate_buffer(a1, (uint64_t)buffer, 0x10uLL);
    if ((_DWORD)result)
      return result;
  }
  else
  {
    if (*((_QWORD *)buffer + 1) <= 0xFuLL)
    {
      *a1 = -1765328194;
      return 851968;
    }
    *((_QWORD *)buffer + 1) = 16;
  }
  v20 = a2[9];
  if ((~v20 & 0x80020) != 0)
  {
    if ((v20 & 0x20) != 0)
    {
      if ((int)a7 >= 1)
      {
        v22 = a7;
        v23 = a6 + 8;
        do
        {
          if ((*(v23 - 8) | 8) == 9)
            hc_EVP_Cipher();
          v23 += 12;
          --v22;
        }
        while (v22);
      }
      return get_mic_iov(a1, (uint64_t)a2, (uint64_t)buffer, (uint64_t)a6, a7);
    }
    else
    {
      return 0x100000;
    }
  }
  else
  {
    v21 = a2[68];
    a2[68] = v21 + 1;
    return v2_seal_message(a2 + 114, v21, (uint64_t)(a2 + 70), (uint64_t)buffer, (uint64_t)a6, a7, a5);
  }
}

uint64_t v2_seal_message(void *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  int v16;
  size_t v17;
  void **v18;
  const void **v19;
  void *v20;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void **v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if ((int)a6 < 1)
    return 851968;
  v22 = a1;
  v23 = a2;
  v25 = &v22;
  v26 = a4;
  v10 = a6;
  v24 = a6;
  v11 = 24 * a6;
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v22 - v12;
  v14 = 0;
  do
  {
    v15 = &v13[v14];
    *(_QWORD *)&v13[v14 + 8] = 0;
    *((_QWORD *)v15 + 2) = 0;
    v16 = *(_DWORD *)(a5 + v14);
    *(_DWORD *)v15 = v16;
    if (((unsigned __int16)v16 | 8) == 9)
    {
      v17 = *(_QWORD *)(a5 + v14 + 8);
      *(_QWORD *)&v13[v14 + 8] = v17;
      *((_QWORD *)v15 + 2) = malloc_type_calloc(1uLL, v17, 0xE5D7B905uLL);
      hc_EVP_Cipher();
      if (a7)
        *a7 = 1;
    }
    v14 += 24;
  }
  while (v11 != v14);
  if (*(_QWORD *)(v26 + 8) != 16)
    v2_seal_message_cold_1();
  v2_sign_message(v22, a3, v23, v26, a5, v24);
  v18 = (void **)(a5 + 16);
  v19 = (const void **)(v13 + 16);
  do
  {
    if ((*((unsigned __int16 *)v18 - 8) | 8) == 9)
    {
      v20 = (void *)*v19;
      if (*v19)
      {
        memcpy(*v18, *v19, (size_t)*(v19 - 1));
        free(v20);
      }
    }
    v18 += 3;
    v19 += 3;
    --v10;
  }
  while (v10);
  return 0;
}

uint64_t _gss_ntlm_wrap(_DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4, size_t *a5, _DWORD *a6, gss_buffer_desc_struct *a7)
{
  size_t v12;
  void *v13;
  const void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  OM_uint32 minor_status;
  int v23;
  size_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = *a5 + 16;
  a7->length = v12;
  v13 = malloc_type_malloc(v12, 0x9F94BCC0uLL);
  a7->value = v13;
  if (v13)
  {
    v23 = 1;
    v14 = (const void *)a5[1];
    v24 = *a5;
    v25 = v13;
    memcpy(v13, v14, v24);
    v26 = 7;
    v15 = (char *)a7->value + *a5;
    v27 = 16;
    v28 = v15;
    v19 = _gss_ntlm_wrap_iov(a1, a2, v16, v17, a6, (unsigned __int16 *)&v23, 2, v18, v21);
    if (v19 >= 0x10000)
    {
      minor_status = 0;
      gss_release_buffer(&minor_status, a7);
    }
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return v19;
}

uint64_t _gss_ntlm_unwrap_iov(_DWORD *a1, uint64_t a2, _DWORD *a3, _DWORD *a4, unsigned __int16 *a5, int a6, uint64_t a7, uint64_t a8, char a9)
{
  unsigned __int16 *buffer;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int16 *v25;
  uint64_t v26;
  unsigned __int16 *v27;

  *a1 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  buffer = _gss_mg_find_buffer(a5, a6, 7);
  if (buffer || (buffer = _gss_mg_find_buffer(a5, a6, 2)) != 0)
  {
    if (*((_QWORD *)buffer + 1) >= 0x10uLL)
    {
      v20 = *(_DWORD *)(a2 + 36);
      if ((~v20 & 0x80020) != 0)
      {
        if ((v20 & 0x20) != 0)
        {
          if (a6 >= 1)
          {
            v26 = a6;
            v27 = a5 + 8;
            do
            {
              if ((*(v27 - 8) | 8) == 9)
                hc_EVP_Cipher();
              v27 += 12;
              --v26;
            }
            while (v26);
          }
          return verify_mic_iov(a1, a2, (uint64_t)buffer, 0, (uint64_t)a5, a6);
        }
        else
        {
          return 0x100000;
        }
      }
      else
      {
        v21 = (void *)(a2 + 656);
        v22 = *(_DWORD *)(a2 + 472);
        *(_DWORD *)(a2 + 472) = v22 + 1;
        v23 = a2 + 480;
        if (a6 >= 1)
        {
          v24 = a6;
          v25 = a5 + 8;
          do
          {
            if ((*(v25 - 8) | 8) == 9)
            {
              hc_EVP_Cipher();
              if (a3)
                *a3 = 1;
            }
            v25 += 12;
            --v24;
          }
          while (v24);
        }
        return v2_verify_message(v21, v23, v22, (uint64_t)buffer, (uint64_t)a5, a6);
      }
    }
    else
    {
      return 393216;
    }
  }
  else
  {
    *a1 = -1561745656;
    return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 851968, -1561745656, "iov tailer buffer missing", v15, v16, v17, v18, a9);
  }
}

uint64_t _gss_ntlm_unwrap(_DWORD *a1, uint64_t a2, uint64_t a3, gss_buffer_desc_struct *a4, _DWORD *a5, _DWORD *a6)
{
  size_t v7;
  uint64_t v8;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  OM_uint32 minor_status;
  int v21;
  gss_buffer_desc_struct v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)a3 - 16;
  if (*(_QWORD *)a3 < 0x10uLL)
    return 589824;
  a4->length = v7;
  v14 = malloc_type_malloc(v7, 0xEF7A6F95uLL);
  a4->value = v14;
  if (v14)
  {
    memcpy(v14, *(const void **)(a3 + 8), a4->length);
    v21 = 1;
    v22 = *a4;
    v23 = 7;
    v15 = *(_QWORD *)(a3 + 8) + *(_QWORD *)a3 - 16;
    v24 = 16;
    v25 = v15;
    v8 = _gss_ntlm_unwrap_iov(a1, a2, a5, a6, (unsigned __int16 *)&v21, 2, v16, v17, v19);
    if (v8 >= 0x10000)
    {
      minor_status = 0;
      gss_release_buffer(&minor_status, a4);
    }
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return v8;
}

uint64_t _gss_ntlm_wrap_iov_length(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, int a7, uint64_t a8, char a9)
{
  unsigned __int16 *buffer;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 *v20;
  unsigned __int16 *v21;

  buffer = _gss_mg_find_buffer(a6, a7, 7);
  if (buffer)
  {
    v15 = 2;
  }
  else
  {
    buffer = _gss_mg_find_buffer(a6, a7, 2);
    if (!buffer)
    {
      *a1 = -1561745656;
      return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 851968, -1561745656, "iov header buffer missing", v16, v17, v18, v19, a9);
    }
    v15 = 7;
  }
  *((_QWORD *)buffer + 1) = 16;
  v20 = _gss_mg_find_buffer(a6, a7, 9);
  if (v20)
    *((_QWORD *)v20 + 1) = 0;
  v21 = _gss_mg_find_buffer(a6, a7, v15);
  if (v21)
    *((_QWORD *)v21 + 1) = 0;
  if (a5)
    *a5 = a3;
  *a1 = 0;
  return 0;
}

void _gss_ntlm_debug_hex(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (_gss_mg_log_level(a1) && (rk_hex_encode() & 0x8000000000000000) == 0)
  {
    _gss_mg_log(a1, "%s %s", v4, v5, v6, v7, v8, v9, a2);
    free(0);
  }
}

void _gss_ntlm_debug_key(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;

  if (_gss_mg_log_level(a1) && (rk_hex_encode() & 0x8000000000000000) == 0)
  {
    _gss_mg_log(a1, "%s %s", v4, v5, v6, v7, v8, v9, a2);
    v10 = strlen(0);
    bzero(0, v10);
    free(0);
  }
}

uint64_t v2_sign_message(void *key, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  const void **v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  CCHmacContext v17;
  _QWORD data[3];

  data[2] = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a4 + 16);
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  data[0] = 0;
  data[1] = 0;
  if (*(_QWORD *)(a4 + 8) != 16)
    v2_sign_message_cold_1();
  LODWORD(v7) = a6;
  memset(&v17, 0, sizeof(v17));
  CCHmacInit(&v17, 1u, key, 0x10uLL);
  _gss_mg_encode_le_uint32(a3, data);
  CCHmacUpdate(&v17, data, 4uLL);
  if ((int)v7 >= 1)
  {
    v7 = v7;
    v11 = (const void **)(a5 + 16);
    do
    {
      v12 = *((unsigned __int16 *)v11 - 8);
      v13 = v12 > 0xB;
      v14 = (1 << v12) & 0xA03;
      if (!v13 && v14 != 0)
        CCHmacUpdate(&v17, *v11, (size_t)*(v11 - 1));
      v11 += 3;
      --v7;
    }
    while (v7);
  }
  CCHmacFinal(&v17, data);
  memset(&v17, 0, sizeof(v17));
  _gss_mg_encode_le_uint32(1, (_DWORD *)v6);
  if (a2)
    hc_EVP_Cipher();
  else
    *(_QWORD *)(v6 + 4) = data[0];
  return _gss_mg_encode_le_uint32(a3, (_DWORD *)(v6 + 12));
}

uint64_t v2_verify_message(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  __int128 v12;
  char *v13;
  unsigned int v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v6 = 393216;
  if (*(_QWORD *)(a4 + 8) == 16)
  {
    _gss_mg_decode_le_uint32((_DWORD *)(*(_QWORD *)(a4 + 16) + 12), &v14);
    v12 = xmmword_209772C20;
    LODWORD(v12) = 7;
    v13 = &v15;
    v2_sign_message(a1, a2, v14, (uint64_t)&v12, a5, a6);
    if (ct_memcmp())
      return 393216;
    else
      return 0;
  }
  return v6;
}

uint64_t _gss_ntlm_delete_sec_context(OM_uint32 *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  void **v12;

  if (a2)
  {
    v5 = *a2;
    v12 = *(void ***)(*a2 + 16);
    *a2 = 0;
    v6 = *(void **)(v5 + 208);
    if (v6)
      free(v6);
    if (*(_QWORD *)(v5 + 120))
      heim_ntlm_free_targetinfo();
    v7 = *(_QWORD *)(v5 + 8);
    if (v7)
    {
      v8 = 0;
      for (i = 0; i < v7; ++i)
      {
        if (*(_QWORD *)(*(_QWORD *)v5 + v8 + 8))
        {
          (*(void (**)(OM_uint32 *))(*(_QWORD *)(*(_QWORD *)v5 + v8) + 16))(a1);
          v7 = *(_QWORD *)(v5 + 8);
        }
        v8 += 16;
      }
    }
    if (*(_QWORD *)v5)
      free(*(void **)v5);
    if (*(_QWORD *)(v5 + 216))
      _gss_ntlm_release_name(0, (void ***)(v5 + 216));
    if (*(_QWORD *)(v5 + 224))
      _gss_ntlm_release_name(0, (void ***)(v5 + 224));
    v10 = *(void **)(v5 + 232);
    if (v10)
      free(v10);
    _gss_ntlm_destroy_crypto(v5);
    krb5_data_free();
    krb5_data_free();
    krb5_data_free();
    krb5_data_free();
    gss_release_buffer(a1, (gss_buffer_t)(v5 + 256));
    _gss_ntlm_release_cred(0, &v12);
    bzero((void *)v5, 0x2A0uLL);
    free((void *)v5);
  }
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  *a1 = 0;
  return 0;
}

uint64_t _gss_ntlm_display_name(int *a1, const char **a2, _QWORD *a3, gss_OID_desc **a4)
{
  unsigned int v6;
  uint64_t result;
  int v8;
  char *v9;
  char *v10;

  *a1 = 0;
  if (a4)
    *a4 = &__gss_ntlm_mechanism_oid_desc;
  if (!a3)
    return 0;
  v10 = 0;
  *a3 = 0;
  a3[1] = 0;
  if (a2)
  {
    v6 = asprintf(&v10, "%s@%s", *a2, a2[1]);
    result = 851968;
    v8 = 12;
    if ((v6 & 0x80000000) == 0)
    {
      v9 = v10;
      if (v10)
      {
        result = 0;
        *a3 = v6;
        a3[1] = v9;
        return result;
      }
    }
  }
  else
  {
    v8 = 0;
    result = 0x20000;
  }
  *a1 = v8;
  return result;
}

uint64_t _gss_ntlm_duplicate_name(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t result;
  void **v11;

  v6 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
  if (!v6)
    goto LABEL_7;
  v7 = strdup(*(const char **)a2);
  *(_QWORD *)v6 = v7;
  v8 = strdup(*(const char **)(a2 + 8));
  *((_QWORD *)v6 + 1) = v8;
  *((_DWORD *)v6 + 4) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(v6 + 20) = *(_OWORD *)(a2 + 20);
  *(_OWORD *)(v6 + 36) = *(_OWORD *)(a2 + 36);
  if (!v7 || v8 == 0)
  {
LABEL_7:
    v11 = (void **)v6;
    _gss_ntlm_release_name(a1, &v11);
    *a1 = 12;
    return 851968;
  }
  else
  {
    *a3 = v6;
    result = 0;
    if (a1)
      *a1 = 0;
  }
  return result;
}

uint64_t _gss_ntlm_export_name(int *a1, const char **a2, size_t *a3)
{
  size_t v5;
  uint64_t v6;
  char *__s;

  __s = 0;
  asprintf(&__s, "%s\\%s", a2[1], *a2);
  if (__s)
  {
    v5 = strlen(__s);
    v6 = gss_mg_export_name(a1, (const void **)&__gss_ntlm_mechanism_oid_desc, __s, v5, a3);
    free(__s);
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return v6;
}

uint64_t _gss_ntlm_export_sec_context(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  if (a1)
    *a1 = 0;
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return 0;
}

void *__gss_ntlm_initialize()
{
  return &ntlm_mech;
}

uint64_t get_signing_supported(gss_const_OID a, uint64_t a2, size_t *a3)
{
  int v6;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v10 = 0;
  v9 = 0;
  if (__gss_ntlm_is_digest_service)
    return _gss_mo_get_option_0(a, a2, a3);
  if (_gss_ntlm_allocate_ctx(&v10, 0, &v9))
    return _gss_mo_get_option_0(a, a2, a3);
  v8 = v9;
  v6 = *(_DWORD *)(v9 + 24);
  _gss_ntlm_delete_sec_context((OM_uint32 *)&v10, &v8, 0);
  if ((v6 & 1) != 0)
    return _gss_mo_get_option_0(a, a2, a3);
  else
    return _gss_mo_get_option_1(a, a2, a3);
}

char **_gss_ntlm_create_name(_DWORD *a1, const char *a2, const char *a3, int a4)
{
  char **v8;
  char **v9;
  char *v10;
  char *v11;
  char *v12;

  v8 = (char **)malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
  if (!v8)
    goto LABEL_5;
  v9 = v8;
  v10 = strdup(a2);
  *v9 = v10;
  v11 = strdup(a3);
  v12 = v11;
  v9[1] = v11;
  *((_DWORD *)v9 + 4) = a4;
  if (!v10 || !v11)
  {
    free(v10);
    free(v12);
    free(v9);
LABEL_5:
    v9 = 0;
    *a1 = 12;
  }
  return v9;
}

uint64_t _gss_ntlm_import_name(_DWORD *a1, unint64_t *a2, gss_const_OID a, _QWORD *a4)
{
  return _gss_mech_import_name(a1, (const void **)&__gss_ntlm_mechanism_oid_desc, (uint64_t)&ntlm_names, a2, a, a4);
}

uint64_t _gss_ntlm_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *a3)
{
  return _gss_mech_inquire_names_for_mech(a1, (uint64_t)&ntlm_names, a3);
}

uint64_t anon_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5)
{
  char **name;

  name = _gss_ntlm_create_name(a1, "", "", 2);
  *a5 = name;
  if (name)
    return 0;
  else
    return 851968;
}

uint64_t hostbased_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5)
{
  char *v8;
  char *v9;
  char *v10;
  const char *v11;

  v8 = (char *)malloc_type_malloc(*(_QWORD *)a3 + 1, 0x259A9304uLL);
  if (v8)
  {
    v9 = v8;
    memcpy(v8, *(const void **)(a3 + 8), *(_QWORD *)a3);
    v9[*(_QWORD *)a3] = 0;
    v10 = strchr(v9, 64);
    if (v10)
    {
      *v10 = 0;
      v11 = v10 + 1;
    }
    else
    {
      v11 = "";
    }
    *a5 = _gss_ntlm_create_name(a1, v9, v11, 0);
    free(v9);
    if (*a5)
      return 0;
    else
      return 851968;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
}

uint64_t user_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return parse_name(a1, a2, 0, a3, a4, a5, a7, a8, a9);
}

uint64_t parse_ntlm_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return parse_name(a1, a2, 1, a3, a4, a5, a7, a8, a9);
}

uint64_t export_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return parse_name(a1, a2, 1, a3, a4, a5, a7, a8, a9);
}

uint64_t parse_name(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, char ***a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v17;
  char *v18;
  char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v13 = *(_QWORD *)a4;
  if (memchr(*(void **)(a4 + 8), 64, *(_QWORD *)a4))
    return hostbased_name(a1, v14, a4, v15, a6);
  v17 = (char *)malloc_type_malloc(v13 + 1, 0xA267D31AuLL);
  if (!v17)
  {
    *a1 = 12;
    return 851968;
  }
  v18 = v17;
  memcpy(v17, *(const void **)(a4 + 8), *(_QWORD *)a4);
  v18[*(_QWORD *)a4] = 0;
  v19 = strchr(v18, 92);
  if (v19)
  {
    *v19 = 0;
    v20 = v19 + 1;
    rk_strupr();
    v21 = v18;
  }
  else
  {
    if (a3)
    {
      free(v18);
      *a1 = -1561745657;
      return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 0x20000, -1561745657, "domain requested but missing name", v22, v23, v24, v25, a9);
    }
    v21 = "";
    v20 = v18;
  }
  *a6 = _gss_ntlm_create_name(a1, v20, v21, 0);
  free(v18);
  if (*a6)
    return 0;
  else
    return 851968;
}

uint64_t _gss_ntlm_import_sec_context(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  if (a1)
    *a1 = 0;
  if (a3)
    *a3 = 0;
  return 851968;
}

uint64_t _gss_ntlm_init_sec_context(int *a1, uint64_t a2, uint64_t *a3, const char **a4, uint64_t a5, char a6, uint64_t a7, _QWORD *a8, uint64_t a9, gss_OID_desc **a10, CFIndex *a11, _DWORD *a12, _DWORD *a13)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFIndex *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFArray *v34;
  const __CFArray *v35;
  CFTypeID v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CFIndex Count;
  CFIndex v44;
  uint64_t v45;
  const void *ValueAtIndex;
  CFTypeID v47;
  const char *v48;
  char *v49;
  _BOOL4 v50;
  _DWORD *v51;
  _DWORD *v52;
  uint64_t have_cred;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const __CFAllocator *v71;
  CFUUIDRef v72;
  uint64_t v73;
  const void *v74;
  CFStringRef v75;
  CFStringRef v76;
  CFStringRef v77;
  CFDataRef v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CFIndex v84;
  CFDataRef v85;
  CFIndex v86;
  CFDataRef v87;
  CFStringRef v88;
  CFNumberRef v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  CFDataRef v95;
  int v96;
  char v97;
  const char *v98;
  int v99;
  char **name;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v108;
  unsigned int v109;
  CFDictionaryRef v110;
  const __CFDictionary *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const __CFData *Value;
  const __CFData *v119;
  CFIndex v120;
  const __CFNumber *v121;
  const __CFData *v122;
  CFIndex v123;
  void *v124;
  char *v125;
  const __CFNumber *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  CFIndex v133;
  int v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  char v152;
  char v153;
  CFDataRef v154;
  CFTypeRef v155;
  CFNumberRef v156;
  CFDictionaryRef v157;
  CFStringRef v158;
  CFDataRef v159;
  CFDataRef v160;
  CFStringRef cf;
  uint64_t *v162;
  CFIndex length;
  CFIndex lengtha;
  UInt8 *bytes;
  UInt8 *bytesa;
  void *values[9];
  void *keys[9];
  _BYTE v169[16];
  const char *out[6];
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;
  uint64_t v179;
  CFRange v180;
  CFRange v181;

  v179 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  if (a12)
    *a12 = 0;
  if (a13)
    *a13 = 0;
  if (a10)
    *a10 = 0;
  if (!a4)
    return 0x20000;
  if (__ApplePrivate_gss_mo_get(&__gss_ntlm_mechanism_oid_desc, &__gss_c_ntlm_v2_oid_desc, 0))
  {
    v162 = a3;
    v23 = *a3;
    if (a10)
      *a10 = &__gss_ntlm_mechanism_oid_desc;
    v24 = a11;
    if (a12)
      *a12 = 0;
    if (v23)
    {
      if ((*(_BYTE *)(v23 + 37) & 8) == 0)
      {
        length = 0;
        bytes = 0;
        v25 = *(_QWORD *)(a9 + 8);
        *(_QWORD *)&v175 = *(_QWORD *)a9;
        *((_QWORD *)&v175 + 1) = v25;
        if (a8)
        {
          v26 = gss_mg_gen_cb(a1, a8, (uint64_t)v169, 0);
          if ((_DWORD)v26)
            goto LABEL_17;
          length = 16;
          bytes = v169;
        }
        else
        {
          krb5_data_zero();
        }
        _gss_mg_log(1, "NTLM: _gss_ntlm_init_sec_context (GSSCred)", v27, v28, v29, v30, v31, v32, v151);
        if ((*(_BYTE *)(*(_QWORD *)(v23 + 16) + 16) & 1) == 0)
        {
          _gss_mg_log(1, "NTLM: NTLM_UUID not available", v56, v57, v58, v59, v60, v61, v152);
          _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
          v62 = "no credentials available";
          v63 = 458752;
LABEL_43:
          v64 = 0;
          return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
        }
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)(*(_QWORD *)(v23 + 16) + 36), (char *)out);
        _gss_mg_log(1, "_gss_ntlm_init_sec_context  UUID(%s)", v65, v66, v67, v68, v69, v70, (char)out);
        v71 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v72 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFUUIDBytes *)(*(_QWORD *)(v23 + 16) + 36));
        v73 = HeimCredCopyFromUUID();
        if (!v73)
          goto LABEL_117;
        v74 = (const void *)v73;
        v75 = CFStringCreateWithCString(v71, **(const char ***)(v23 + 16), 0x8000100u);
        if (!v75)
        {
          v96 = -1765328191;
          goto LABEL_126;
        }
        v76 = v75;
        v77 = CFStringCreateWithCString(v71, *(const char **)(*(_QWORD *)(v23 + 16) + 8), 0x8000100u);
        if (!v77)
        {
          v110 = (CFDictionaryRef)v76;
          v96 = -1765328191;
LABEL_125:
          CFRelease(v110);
          goto LABEL_126;
        }
        cf = v77;
        v155 = v74;
        if (!*(_QWORD *)a9 || (v78 = CFDataCreate(v71, *(const UInt8 **)(a9 + 8), *(_QWORD *)a9)) == 0)
        {
          v159 = 0;
          v160 = 0;
          v95 = 0;
          v157 = 0;
          v158 = 0;
          v156 = 0;
          v97 = 0;
          v96 = -1765328191;
          goto LABEL_92;
        }
        v154 = v78;
        v84 = length;
        if (!length)
        {
          _gss_mg_log(1, "_gss_ntlm_init_sec_context  UUID(%s) - no channel bindings", 0, v79, v80, v81, v82, v83, (char)out);
          v84 = 0;
        }
        v85 = CFDataCreate(v71, bytes, v84);
        if (v85)
        {
          v160 = v85;
          v86 = *(_QWORD *)(v23 + 64);
          if (v86 && (v87 = CFDataCreate(v71, *(const UInt8 **)(v23 + 72), v86)) != 0)
          {
            v159 = v87;
            v88 = CFStringCreateWithCString(v71, *(const char **)(v23 + 232), 0x8000100u);
            if (v88)
            {
              v158 = v88;
              v89 = CFNumberCreate(v71, kCFNumberSInt32Type, (const void *)(v23 + 36));
              if (v89)
              {
                v90 = (void *)*MEMORY[0x24BE4C3B8];
                keys[0] = *(void **)MEMORY[0x24BE4C3D0];
                keys[1] = v90;
                v91 = (void *)*MEMORY[0x24BE4C370];
                keys[2] = *(void **)MEMORY[0x24BE4C3A0];
                keys[3] = v91;
                v92 = (void *)*MEMORY[0x24BE4C358];
                keys[4] = *(void **)MEMORY[0x24BE4C390];
                keys[5] = v92;
                v93 = (void *)*MEMORY[0x24BE4C368];
                keys[6] = *(void **)MEMORY[0x24BE4C388];
                keys[7] = v93;
                keys[8] = *(void **)MEMORY[0x24BE4C360];
                v94 = (void *)*MEMORY[0x24BE4C3E0];
                values[0] = *(void **)MEMORY[0x24BE4C3C8];
                values[1] = v94;
                values[2] = (void *)v76;
                values[3] = (void *)cf;
                v95 = v154;
                values[4] = v154;
                values[5] = v160;
                values[6] = v159;
                values[7] = (void *)v158;
                v156 = v89;
                values[8] = v89;
                v157 = CFDictionaryCreate(v71, (const void **)keys, (const void **)values, 9, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                v96 = 0;
                v97 = 1;
                goto LABEL_92;
              }
              goto LABEL_91;
            }
          }
          else
          {
            v159 = 0;
          }
        }
        else
        {
          v159 = 0;
          v160 = 0;
        }
        v158 = 0;
LABEL_91:
        v156 = 0;
        v157 = 0;
        v97 = 0;
        v96 = -1765328191;
        v95 = v154;
LABEL_92:
        CFRelease(v76);
        CFRelease(cf);
        if (v95)
          CFRelease(v95);
        if (v160)
          CFRelease(v160);
        if (v159)
          CFRelease(v159);
        if (v158)
          CFRelease(v158);
        if (v156)
          CFRelease(v156);
        if ((v97 & 1) != 0)
        {
          v111 = (const __CFDictionary *)HeimCredDoAuth();
          CFRelease(v157);
          if (!v111)
          {
            _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
            _gss_mg_log(1, "NTLM: HeimCredCreate failed error(%ld)", v141, v142, v143, v144, v145, v146, 0);
            CFRelease(v155);
            if (v72)
              CFRelease(v72);
            *a1 = -1765328191;
            v62 = "HeimCredCreate failed";
            v63 = 851968;
            goto LABEL_43;
          }
          _gss_mg_log(1, "ntlm-isc-type3: GSSCred returned", v112, v113, v114, v115, v116, v117, v151);
          Value = (const __CFData *)CFDictionaryGetValue(v111, (const void *)*MEMORY[0x24BE4C398]);
          v119 = Value;
          if (!Value)
            goto LABEL_130;
          v120 = CFDataGetLength(Value);
          *(_QWORD *)&v175 = v120;
          if (!v120)
            goto LABEL_131;
          *((_QWORD *)&v175 + 1) = malloc_type_calloc(1uLL, v120, 0x81F2FF23uLL);
          if (*((_QWORD *)&v175 + 1))
          {
            v180.length = CFDataGetLength(v119);
            v180.location = 0;
            CFDataGetBytes(v119, v180, *((UInt8 **)&v175 + 1));
            v121 = (const __CFNumber *)CFDictionaryGetValue(v111, (const void *)*MEMORY[0x24BE4C378]);
            if (!v121 || !CFNumberGetValue(v121, kCFNumberSInt32Type, (void *)(v23 + 32)))
              goto LABEL_131;
            v122 = (const __CFData *)CFDictionaryGetValue(v111, (const void *)*MEMORY[0x24BE4C380]);
            v119 = v122;
            if (!v122)
              goto LABEL_130;
            v123 = CFDataGetLength(v122);
            *(_QWORD *)(v23 + 48) = v123;
            if (!v123)
            {
LABEL_131:
              v125 = 0;
              v119 = 0;
              goto LABEL_132;
            }
            v124 = malloc_type_calloc(1uLL, v123, 0x34FAB149uLL);
            *(_QWORD *)(v23 + 56) = v124;
            if (v124)
            {
              v181.length = CFDataGetLength(v119);
              v181.location = 0;
              CFDataGetBytes(v119, v181, *(UInt8 **)(v23 + 56));
              if (CFDictionaryGetValue(v111, (const void *)*MEMORY[0x24BE4C3A0]))
              {
                v119 = (const __CFData *)heim_string_copy_utf8();
                if (CFDictionaryGetValue(v111, (const void *)*MEMORY[0x24BE4C370]))
                {
                  v125 = (char *)heim_string_copy_utf8();
                  v126 = (const __CFNumber *)CFDictionaryGetValue(v111, (const void *)*MEMORY[0x24BE4C360]);
                  if (CFNumberGetValue(v126, kCFNumberSInt32Type, (void *)(v23 + 36)))
                  {
                    _gss_mg_log(1, "ntlm-isc-type3: %s\\%s", v127, v128, v129, v130, v131, v132, (char)v125);
                    *(_QWORD *)(v23 + 216) = _gss_ntlm_create_name(a1, (const char *)v119, v125, 0);
                    free(v119);
                    free(v125);
                    if (*(_QWORD *)(v23 + 216))
                    {
                      CFRelease(v155);
                      v24 = a11;
LABEL_117:
                      CFRelease(v72);
                      v133 = *((_QWORD *)&v175 + 1);
                      *v24 = v175;
                      v24[1] = v133;
LABEL_118:
                      *(_DWORD *)(v23 + 40) |= 1u;
                      _gss_ntlm_reset_seq(v23);
                      _gss_ntlm_set_keys(v23);
                      if (a12)
                        *a12 = *(_DWORD *)(v23 + 28);
                      if (a13)
                      {
                        v33 = 0;
                        *a13 = -1;
                        return v33;
                      }
                      return 0;
                    }
                    CFRelease(v157);
                    _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
                    krb5_data_free();
                    return 851968;
                  }
LABEL_132:
                  _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
                  krb5_data_free();
                  free(v119);
                  free(v125);
                  *a1 = -1765328191;
                  v62 = "failed parse GSSCred reply";
                  v63 = 851968;
                  v64 = -1765328191;
                  return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
                }
LABEL_130:
                v125 = 0;
                goto LABEL_132;
              }
              goto LABEL_131;
            }
          }
LABEL_122:
          *a1 = 12;
          v62 = "out of memory";
          v63 = 851968;
          v64 = 12;
          return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
        }
        v110 = v157;
        if (v157)
          goto LABEL_125;
LABEL_126:
        if (v72)
          CFRelease(v72);
        _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
        *a1 = v96;
        v62 = "failed to create ntlm response";
        v63 = 851968;
        v64 = v96;
        return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
      }
      v176 = 0u;
      v177 = 0u;
      v178 = 0;
      memset(out, 0, sizeof(out));
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      v175 = 0u;
      if (!a9)
        return 851968;
      lengtha = *(_QWORD *)a9;
      bytesa = *(UInt8 **)(a9 + 8);
      v54 = heim_ntlm_decode_type2();
      if (v54)
      {
        v55 = v54;
        _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
        *a1 = v55;
        return 851968;
      }
      LODWORD(out[0]) = *(_DWORD *)(v23 + 36);
      out[1] = "";
      out[2] = "";
      *((_QWORD *)&v172 + 1) = "";
      out[3] = (const char *)1;
      out[4] = (const char *)&unk_209772D88;
      v99 = heim_ntlm_encode_type3();
      heim_ntlm_free_type2();
      if (!v99)
      {
        *a11 = lengtha;
        a11[1] = (CFIndex)bytesa;
        *(_DWORD *)(v23 + 28) |= 0x40u;
        name = _gss_ntlm_create_name(a1, "", "", 0);
        *(_QWORD *)(v23 + 216) = name;
        if (name)
        {
          _gss_mg_log(1, "ntlm-isc-type3: anonymous", v101, v102, v103, v104, v105, v106, v151);
          goto LABEL_118;
        }
        _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
        return 851968;
      }
LABEL_64:
      _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
      *a1 = v99;
      return 851968;
    }
    v175 = 0u;
    v176 = 0u;
    if (!a4[1])
      goto LABEL_59;
    v34 = (const __CFArray *)_gss_mg_copy_key(CFSTR("com.apple.GSS.NTLM"), CFSTR("AllowedHosts"));
    if (!v34)
    {
LABEL_33:
      v51 = malloc_type_calloc(1uLL, 0x2A0uLL, 0x10F204024BAB64EuLL);
      if (!v51)
        goto LABEL_122;
      v52 = v51;
      *v162 = (uint64_t)v51;
      v51[10] |= 2u;
      if (a2)
      {
        have_cred = _gss_ntlm_duplicate_name(a1, a2, (_QWORD *)v51 + 2);
      }
      else
      {
        *(_QWORD *)&v171 = 0;
        memset(&out[2], 0, 32);
        out[0] = "";
        out[1] = "";
        have_cred = _gss_ntlm_have_cred(a1, out, (_QWORD *)v51 + 2);
      }
      v33 = have_cred;
      if ((_DWORD)have_cred)
        goto LABEL_70;
      v26 = _gss_ntlm_duplicate_name(a1, (uint64_t)a4, (_QWORD *)v52 + 28);
      if ((_DWORD)v26)
      {
LABEL_17:
        v33 = v26;
LABEL_70:
        LODWORD(out[0]) = 0;
        _gss_ntlm_delete_sec_context((OM_uint32 *)out, v162, 0);
        return v33;
      }
      if (asprintf((char **)v52 + 29, "%s/%s", *a4, a4[1]) < 0 || !*((_QWORD *)v52 + 29))
      {
        LODWORD(out[0]) = 0;
        _gss_ntlm_delete_sec_context((OM_uint32 *)out, v162, 0);
        return 0;
      }
      if ((a6 & 0x40) != 0)
      {
        v109 = 33556997;
      }
      else
      {
        if ((*(_BYTE *)(*((_QWORD *)v52 + 2) + 16) & 2) != 0)
        {
          LODWORD(out[0]) = 0;
          _gss_ntlm_delete_sec_context((OM_uint32 *)out, v162, 0);
          v33 = 458752;
          gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 458752, 0, "Cant authenticate with anon name", v147, v148, v149, v150, v153);
          *a1 = 0;
          return v33;
        }
        if ((a6 & 0x10) != 0)
          v108 = 33587765;
        else
          v108 = 33554949;
        if ((a6 & 0x20) != 0)
          v108 |= 0x8010u;
        v109 = v108 | 0x60880000;
      }
      v175 = v109;
      *(_QWORD *)&v176 = 0;
      *((_QWORD *)&v176 + 1) = 0xF0601B01DLL;
      v134 = heim_ntlm_encode_type1();
      if (!v134)
      {
        *v24 = 0;
        v24[1] = 0;
        v134 = krb5_data_copy();
        if (!v134)
        {
          v52[9] = v109;
          v33 = 1;
          _gss_mg_log(1, "ntlm-isc-type1: %s\\%s", v135, v136, v137, v138, v139, v140, *(_QWORD *)(*((_QWORD *)v52 + 2) + 8));
          return v33;
        }
      }
      v99 = v134;
      goto LABEL_64;
    }
    v35 = v34;
    v36 = CFGetTypeID(v34);
    if (v36 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount(v35);
      if (Count >= 1)
      {
        v44 = Count;
        v45 = 1;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v35, v45 - 1);
          if (ValueAtIndex
            && (v47 = CFGetTypeID(ValueAtIndex), v47 == CFStringGetTypeID())
            && (v48 = (const char *)rk_cfstring2cstring()) != 0)
          {
            v49 = (char *)v48;
            v50 = fnmatch(v48, a4[1], 16) == 0;
            free(v49);
          }
          else
          {
            v50 = 0;
          }
          if (v45 >= v44)
            break;
          ++v45;
        }
        while (!v50);
        CFRelease(v35);
        v24 = a11;
        if (v50)
          goto LABEL_33;
LABEL_59:
        *a1 = 80;
        v98 = a4[1];
        if (!v98)
          v98 = "???";
        v151 = (char)v98;
        v62 = "Not allowed to use NTLM to host %s";
        v63 = 851968;
        v64 = 80;
        return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
      }
    }
    else
    {
      _gss_mg_log(1, "NTLM: invalid type of AllowedHosts", v37, v38, v39, v40, v41, v42, v151);
    }
    CFRelease(v35);
    goto LABEL_59;
  }
  *a1 = 0;
  return 0x100000;
}

uint64_t _gss_ntlm_inquire_context(_DWORD *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _DWORD *a5, gss_OID_desc **a6, _DWORD *a7, int *a8, int *a9)
{
  uint64_t v16;
  uint64_t result;
  uint64_t v18;

  *a1 = 0;
  if (!a2)
    return 50331648;
  if (a3)
  {
    v16 = *(_QWORD *)(a2 + 216);
    if (!v16)
      return 0x80000;
    result = _gss_ntlm_duplicate_name(a1, v16, a3);
    if ((_DWORD)result)
      return result;
  }
  if (a4)
  {
    v18 = *(_QWORD *)(a2 + 224);
    if (v18)
    {
      result = _gss_ntlm_duplicate_name(a1, v18, a4);
      if ((_DWORD)result)
        return result;
    }
    else
    {
      *a4 = 0;
    }
  }
  if (a5)
    *a5 = -1;
  if (a6)
    *a6 = &__gss_ntlm_mechanism_oid_desc;
  if (a7)
    *a7 = *(_DWORD *)(a2 + 28);
  if (a8)
    *a8 = (*(_DWORD *)(a2 + 40) >> 1) & 1;
  result = 0;
  if (a9)
    *a9 = *(_DWORD *)(a2 + 40) & 1;
  return result;
}

uint64_t _gss_ntlm_inquire_cred_by_mech(_DWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t result;

  if (a4)
  {
    if (a2)
    {
      result = _gss_ntlm_duplicate_name(a1, a2, a4);
      if ((_DWORD)result)
        return result;
    }
    else
    {
      *a4 = 0;
    }
  }
  if (a5)
    *a5 = -1;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 1;
  result = 0;
  if (a1)
    *a1 = 0;
  return result;
}

uint64_t _gss_ntlm_inquire_cred(OM_uint32 *minor_status, uint64_t a2, _QWORD *a3, _DWORD *a4, _DWORD *a5, gss_OID_set *oid_set)
{
  uint64_t empty_oid_set;
  OM_uint32 minor_statusa;

  *minor_status = 0;
  if (!a2)
    return 458752;
  if (a3)
  {
    empty_oid_set = _gss_ntlm_duplicate_name(minor_status, a2, a3);
    if ((_DWORD)empty_oid_set)
      goto LABEL_11;
  }
  if (a4)
    *a4 = -1;
  if (a5)
    *a5 = 0;
  if (!oid_set)
    return 0;
  *oid_set = 0;
  empty_oid_set = gss_create_empty_oid_set(minor_status, oid_set);
  if ((_DWORD)empty_oid_set
    || (empty_oid_set = gss_add_oid_set_member(minor_status, &__gss_ntlm_mechanism_oid_desc, oid_set),
        (_DWORD)empty_oid_set))
  {
LABEL_11:
    minor_statusa = 0;
    gss_release_oid_set(&minor_statusa, oid_set);
  }
  return empty_oid_set;
}

uint64_t _gss_ntlm_destroy_cred(_DWORD *a1, void ***a2)
{
  void **v3;
  CFUUIDRef v5;
  CFUUIDRef v6;

  if (!a2)
    return 0;
  v3 = *a2;
  if (!*a2)
    return 0;
  if (((_BYTE)v3[2] & 1) == 0)
    return _gss_ntlm_release_cred(a1, a2);
  v5 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFUUIDBytes *)((char *)v3 + 36));
  if (v5)
  {
    v6 = v5;
    *a1 = 0;
    HeimCredDeleteByUUID();
    CFRelease(v6);
    return _gss_ntlm_release_cred(a1, a2);
  }
  *a1 = -1765328191;
  return 851968;
}

uint64_t _gss_ntlm_cred_hold(_DWORD *a1, uint64_t a2)
{
  CFUUIDRef v3;
  CFUUIDRef v4;
  uint64_t v5;
  const void *v6;

  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
    return 851968;
  v3 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFUUIDBytes *)(a2 + 36));
  if (!v3)
  {
    *a1 = -1765328191;
    return 851968;
  }
  v4 = v3;
  *a1 = 0;
  v5 = HeimCredCopyFromUUID();
  if (v5)
  {
    v6 = (const void *)v5;
    HeimCredRetainTransient();
    CFRelease(v6);
  }
  CFRelease(v4);
  return 0;
}

uint64_t _gss_ntlm_cred_unhold(_DWORD *a1, uint64_t a2)
{
  CFUUIDRef v3;
  CFUUIDRef v4;
  uint64_t v5;
  const void *v6;

  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
    return 851968;
  v3 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFUUIDBytes *)(a2 + 36));
  if (!v3)
  {
    *a1 = -1765328191;
    return 851968;
  }
  v4 = v3;
  *a1 = 0;
  v5 = HeimCredCopyFromUUID();
  if (v5)
  {
    v6 = (const void *)v5;
    HeimCredReleaseTransient();
    CFRelease(v6);
  }
  CFRelease(v4);
  return 0;
}

uint64_t _gss_ntlm_cred_label_get(_DWORD *a1, uint64_t a2, const char *a3, CFIndex *a4)
{
  const __CFAllocator *v7;
  CFUUIDRef v8;
  CFUUIDRef v9;
  CFStringRef v10;
  void *v11;
  void *v12;
  void *v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  const __CFArray *v16;
  const void *ValueAtIndex;
  const void *v18;
  CFIndex Length;
  void *v20;
  void *v21;
  const UInt8 *BytePtr;
  CFIndex v23;
  uint64_t v24;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x24BDAC8D0];
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFUUIDBytes *)(a2 + 36));
  if (v8)
  {
    v9 = v8;
    *a1 = 0;
    v10 = CFStringCreateWithCString(v7, a3, 0x8000100u);
    if (v10)
    {
      v11 = (void *)*MEMORY[0x24BE4C3B8];
      keys[0] = *(void **)MEMORY[0x24BE4C3D0];
      keys[1] = v11;
      v12 = (void *)*MEMORY[0x24BE4C3B0];
      keys[2] = *(void **)MEMORY[0x24BE4C3A8];
      keys[3] = v12;
      v13 = (void *)*MEMORY[0x24BE4C3E0];
      values[0] = *(void **)MEMORY[0x24BE4C3C8];
      values[1] = v13;
      values[2] = v9;
      values[3] = (void *)v10;
      v14 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!v14)
        _gss_ntlm_cred_label_get_cold_1();
      v15 = v14;
      v16 = (const __CFArray *)HeimCredCopyQuery();
      CFRelease(v15);
      if (CFArrayGetCount(v16) <= 0)
      {
        v24 = 0;
        if (!v16)
          return v24;
        goto LABEL_19;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(v16, 0);
      if (!ValueAtIndex)
      {
        v24 = 851968;
        if (!v16)
          return v24;
        goto LABEL_19;
      }
      v18 = ValueAtIndex;
      CFRetain(ValueAtIndex);
      if (v16)
        CFRelease(v16);
      v16 = (const __CFArray *)HeimCredCopyAttribute();
      CFRelease(v18);
      if (v16)
      {
        Length = CFDataGetLength(v16);
        v20 = malloc_type_malloc(Length, 0x843B75B6uLL);
        a4[1] = (CFIndex)v20;
        if (v20)
        {
          v21 = v20;
          BytePtr = CFDataGetBytePtr(v16);
          v23 = CFDataGetLength(v16);
          memcpy(v21, BytePtr, v23);
          v24 = 0;
          *a4 = CFDataGetLength(v16);
        }
        else
        {
          v24 = 851968;
        }
LABEL_19:
        CFRelease(v16);
        return v24;
      }
    }
    else
    {
      CFRelease(v9);
    }
  }
  else
  {
    *a1 = -1765328191;
  }
  return 851968;
}

uint64_t _gss_ntlm_cred_label_set(_DWORD *a1, uint64_t a2, const char *a3, uint64_t a4)
{
  const __CFAllocator *v8;
  CFUUIDRef v9;
  CFUUIDRef v10;
  CFStringRef v11;
  CFStringRef v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFDictionaryRef v17;
  CFDictionaryRef v18;
  CFStringRef v19;
  CFStringRef v20;
  CFStringRef v21;
  CFDataRef v22;
  CFDataRef v23;
  void *v24;
  CFDictionaryRef v25;
  CFDictionaryRef v26;
  const void *v27;
  uint64_t v28;
  const void *v30;
  void *v31[7];
  void *v32[7];
  void *values[3];
  void *keys[5];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
    return 851968;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFUUIDBytes *)(a2 + 36));
  if (!v9)
  {
    *a1 = -1765328191;
    return 851968;
  }
  v10 = v9;
  *a1 = 0;
  v11 = CFStringCreateWithCString(v8, a3, 0x8000100u);
  if (!v11)
  {
    CFRelease(v10);
    return 851968;
  }
  v12 = v11;
  v13 = (void *)*MEMORY[0x24BE4C3A8];
  v14 = (void *)*MEMORY[0x24BE4C3B8];
  keys[0] = *(void **)MEMORY[0x24BE4C3A8];
  keys[1] = v14;
  v15 = (void *)*MEMORY[0x24BE4C3B0];
  keys[2] = *(void **)MEMORY[0x24BE4C3B0];
  v16 = (void *)*MEMORY[0x24BE4C3E0];
  values[0] = v10;
  values[1] = v16;
  values[2] = (void *)v11;
  v17 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v17)
  {
    heim_abort();
LABEL_29:
    heim_abort();
  }
  v18 = v17;
  HeimCredDeleteQuery();
  CFRelease(v18);
  if (!a4)
  {
    v28 = 0;
LABEL_18:
    CFRelease(v10);
    v30 = v12;
LABEL_27:
    CFRelease(v30);
    return v28;
  }
  v19 = CFStringCreateWithCString(v8, *(const char **)a2, 0x8000100u);
  if (!v19)
  {
    v28 = 851968;
    goto LABEL_18;
  }
  v20 = v19;
  v21 = CFStringCreateWithCString(v8, *(const char **)(a2 + 8), 0x8000100u);
  if (!v21)
  {
    v23 = 0;
    goto LABEL_20;
  }
  v22 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a4 + 8), *(_QWORD *)a4, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v23 = v22;
  if (!v22)
  {
LABEL_20:
    v26 = 0;
LABEL_21:
    CFRelease(v10);
    CFRelease(v20);
    v28 = 851968;
    if (!v21)
      goto LABEL_23;
    goto LABEL_22;
  }
  v32[0] = *(void **)MEMORY[0x24BE4C3D0];
  v32[1] = v14;
  v24 = (void *)*MEMORY[0x24BE4C3A0];
  v32[2] = v13;
  v32[3] = v24;
  v32[4] = *(void **)MEMORY[0x24BE4C370];
  v32[5] = v15;
  v32[6] = *(void **)MEMORY[0x24BE4C350];
  v31[0] = *(void **)MEMORY[0x24BE4C3C8];
  v31[1] = v16;
  v31[2] = v10;
  v31[3] = (void *)v20;
  v31[4] = (void *)v21;
  v31[5] = (void *)v12;
  v31[6] = v22;
  v25 = CFDictionaryCreate(0, (const void **)v32, (const void **)v31, 7, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v25)
    goto LABEL_29;
  v26 = v25;
  v27 = (const void *)HeimCredCreate();
  if (!v27)
    goto LABEL_21;
  CFRelease(v27);
  CFRelease(v10);
  CFRelease(v20);
  v28 = 0;
LABEL_22:
  CFRelease(v21);
LABEL_23:
  CFRelease(v12);
  if (v23)
    CFRelease(v23);
  if (v26)
  {
    v30 = v26;
    goto LABEL_27;
  }
  return v28;
}

uint64_t _gss_ntlm_inquire_mechs_for_name(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  if (a1)
    *a1 = 0;
  if (a3)
    *a3 = 0;
  return 0;
}

uint64_t _gss_ntlm_process_context_token(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

uint64_t _gss_ntlm_release_cred(_DWORD *a1, void ***a2)
{
  void **v3;

  if (a1)
    *a1 = 0;
  if (!a2 || !*a2)
    return 0;
  v3 = *a2;
  *a2 = 0;
  return _gss_ntlm_release_name(a1, &v3);
}

uint64_t _gss_ntlm_release_name(_DWORD *a1, void ***a2)
{
  void **v2;

  if (a1)
    *a1 = 0;
  if (a2)
  {
    v2 = *a2;
    if (*a2)
    {
      *a2 = 0;
      free(*v2);
      free(v2[1]);
      free(v2);
    }
  }
  return 0;
}

uint64_t _gss_ntlm_iter_creds_f(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, gss_OID_desc *, _QWORD *))
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  const __CFArray *v7;
  CFIndex i;
  const void *v9;
  char *v10;
  const void *v11;
  char *v12;
  const __CFUUID *UUID;
  const __CFUUID *v14;
  CFUUIDBytes v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  CFIndex Count;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE4C3B8];
  keys[0] = *(void **)MEMORY[0x24BE4C3D0];
  keys[1] = v3;
  v4 = (void *)*MEMORY[0x24BE4C3E0];
  values[0] = *(void **)MEMORY[0x24BE4C3C8];
  values[1] = v4;
  v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v5)
    _gss_ntlm_cred_label_get_cold_1();
  v6 = v5;
  v7 = (const __CFArray *)HeimCredCopyQuery();
  CFRelease(v6);
  Count = CFArrayGetCount(v7);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(v7, i);
      v9 = (const void *)HeimCredCopyAttribute();
      if (v9)
        v10 = (char *)rk_cfstring2cstring();
      else
        v10 = 0;
      v11 = (const void *)HeimCredCopyAttribute();
      if (v11)
        v12 = (char *)rk_cfstring2cstring();
      else
        v12 = 0;
      UUID = (const __CFUUID *)HeimCredGetUUID();
      v14 = UUID;
      if (UUID)
      {
        v15 = CFUUIDGetUUIDBytes(UUID);
        v16 = *(_QWORD *)&v15.byte0;
        v17 = *(_QWORD *)&v15.byte8;
      }
      else
      {
        v16 = 0;
        v17 = 0;
      }
      v18 = malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
      if (v18)
      {
        v19 = v18;
        if (v10 && v12 && v14)
        {
          *v18 = strdup(v10);
          v19[1] = strdup(v12);
          *((_DWORD *)v19 + 4) = 1;
          *(_QWORD *)((char *)v19 + 36) = v16;
          *(_QWORD *)((char *)v19 + 44) = v17;
          a3(a2, &__gss_ntlm_mechanism_oid_desc, v19);
        }
        else
        {
          free(v18);
        }
      }
      free(v10);
      free(v12);
      if (v9)
        CFRelease(v9);
      if (v11)
        CFRelease(v11);
    }
  }
  if (v7)
    CFRelease(v7);
  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD))a3)(a2, 0, 0);
}

uint64_t _gss_ntlm_inquire_sec_context_by_oid(OM_uint32 *a1, uint64_t a2, gss_const_OID a, gss_buffer_set_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t v13;
  int *v14;
  int v16;
  gss_buffer_desc_struct member_buffer;

  *a1 = 0;
  if (!a2)
    return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 0x80000, 0, "no context", a5, a6, a7, a8, a9);
  *a4 = 0;
  if (gss_oid_equal(a, &__gss_ntlm_get_session_key_x_oid_desc)
    || gss_oid_equal(a, &__gss_c_inq_sspi_session_key_oid_desc))
  {
    v13 = *(_QWORD *)(a2 + 48);
    if (v13)
    {
      v14 = *(int **)(a2 + 56);
LABEL_6:
      member_buffer.length = v13;
      member_buffer.value = v14;
      return gss_add_buffer_set_member(a1, &member_buffer, a4);
    }
LABEL_11:
    *a1 = 2;
    return 851968;
  }
  if (gss_oid_equal(a, &__gss_c_inq_win2k_pac_x_oid_desc))
  {
    if (*(_QWORD *)(a2 + 256))
      return gss_add_buffer_set_member(a1, (gss_buffer_t)(a2 + 256), a4);
    goto LABEL_11;
  }
  if (gss_oid_equal(a, &__gss_c_ntlm_guest_oid_desc))
  {
    v16 = (*(_DWORD *)(a2 + 32) >> 3) & 1;
    v13 = 4;
    v14 = &v16;
    goto LABEL_6;
  }
  if (!gss_oid_equal(a, &__gss_c_peer_has_updated_spnego_oid_desc))
  {
    if (gss_oid_equal(a, &__gss_c_ntlm_reset_keys_oid_desc))
    {
      _gss_ntlm_set_keys(a2);
      return 0;
    }
    *a1 = 0;
    return 851968;
  }
  if ((*(_BYTE *)(a2 + 38) & 8) != 0)
    return 0;
  else
    return 851968;
}

uint64_t __gss_scram_initialize()
{
  return 0;
}

uint64_t _netlogon_delete_sec_context(OM_uint32 *minor_status, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;

  if (a2)
  {
    v5 = *a2;
    if (*a2)
    {
      *a2 = 0;
      _netlogon_release_name(minor_status, (gss_buffer_t *)(v5 + 96));
      _netlogon_release_name(minor_status, (gss_buffer_t *)(v5 + 104));
      pthread_mutex_destroy((pthread_mutex_t *)v5);
      *(_OWORD *)v5 = 0u;
      *(_OWORD *)(v5 + 16) = 0u;
      *(_OWORD *)(v5 + 32) = 0u;
      *(_OWORD *)(v5 + 48) = 0u;
      *(_OWORD *)(v5 + 64) = 0u;
      *(_OWORD *)(v5 + 80) = 0u;
      *(_OWORD *)(v5 + 96) = 0u;
      *(_OWORD *)(v5 + 112) = 0u;
      free((void *)v5);
    }
  }
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  *minor_status = 0;
  return 0;
}

uint64_t _netlogon_init_sec_context(OM_uint32 *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, _QWORD *a9, gss_OID_desc **a10, size_t *a11, _DWORD *a12, _DWORD *a13)
{
  uint64_t v13;
  uint64_t initial_auth_message;
  int v18;
  _DWORD *v21;
  _DWORD *v22;
  OM_uint32 minor_status;
  uint64_t v25;

  v13 = *a3;
  *a1 = 0;
  *a11 = 0;
  a11[1] = 0;
  if (!a2)
    return 458752;
  if (!a4)
    return 0x20000;
  if (!v13)
  {
    if (*a9)
      return 589824;
    v21 = malloc_type_calloc(1uLL, 0x80uLL, 0x102004039E40906uLL);
    v13 = (uint64_t)v21;
    if (v21)
    {
      v21[16] = 0;
      *((_BYTE *)v21 + 72) = 1;
      v21[19] = 1;
      pthread_mutex_init((pthread_mutex_t *)v21, 0);
      pthread_mutex_lock((pthread_mutex_t *)v13);
      *a3 = v13;
      *(_DWORD *)(v13 + 68) = a6 & 0x103E;
      *(_DWORD *)(v13 + 80) = *(_DWORD *)(a2 + 8);
      initial_auth_message = _netlogon_duplicate_name(a1, *(_QWORD *)a2, (gss_buffer_desc_struct **)(v13 + 96));
      if (!WORD1(initial_auth_message))
      {
        initial_auth_message = _netlogon_duplicate_name(a1, a4, (gss_buffer_desc_struct **)(v13 + 104));
        if (!WORD1(initial_auth_message))
        {
          *(_OWORD *)(v13 + 112) = *(_OWORD *)(a2 + 12);
          initial_auth_message = _netlogon_make_initial_auth_message((int *)a1, v13, a11);
          if (initial_auth_message < 0x10000)
            goto LABEL_13;
        }
      }
    }
    else
    {
      *a1 = 12;
      initial_auth_message = 851968;
    }
    pthread_mutex_unlock((pthread_mutex_t *)v13);
LABEL_31:
    minor_status = 0;
    _netlogon_delete_sec_context(&minor_status, a3, 0);
    return initial_auth_message;
  }
  pthread_mutex_lock((pthread_mutex_t *)v13);
  if (*(_DWORD *)(v13 + 64))
  {
    initial_auth_message = 851968;
    v18 = 22;
LABEL_6:
    *a1 = v18;
    goto LABEL_13;
  }
  if (*a9 >= 8uLL)
  {
    v22 = (_DWORD *)a9[1];
    v25 = 0;
    _gss_mg_decode_le_uint32(v22, &v25);
    _gss_mg_decode_le_uint32(v22 + 1, (_DWORD *)&v25 + 1);
    initial_auth_message = 589824;
    if ((_DWORD)v25 == 1)
    {
      v18 = HIDWORD(v25);
      if (!HIDWORD(v25))
      {
        initial_auth_message = 0;
        *(_DWORD *)(v13 + 64) = 1;
        goto LABEL_6;
      }
    }
  }
  else
  {
    initial_auth_message = 589824;
  }
LABEL_13:
  if (a12)
    *a12 = *(_DWORD *)(v13 + 68);
  if (a13)
    *a13 = -1;
  if (a10)
    *a10 = &__gss_netlogon_mechanism_oid_desc;
  pthread_mutex_unlock((pthread_mutex_t *)v13);
  if (initial_auth_message >= 2)
    goto LABEL_31;
  return initial_auth_message;
}

uint64_t _netlogon_make_initial_auth_message(int *a1, uint64_t a2, size_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  _DWORD *v22;
  _DWORD *v23;
  char *v24;
  const void **v25;
  size_t v26;
  const void *v27;
  int v28;
  _BYTE v29[1536];
  _OWORD v30[5];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a2 + 104);
  if (*(_QWORD *)v6)
  {
    v30[0] = *(_OWORD *)v6;
    ++*(_QWORD *)&v30[0];
    v7 = 1;
    v8 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v9 = *(_QWORD *)(a2 + 96);
  if (*(_QWORD *)v9)
  {
    v7 = v7 | 2;
    v30[v8] = *(_OWORD *)v9;
    ++*(_QWORD *)&v30[v8++];
  }
  v11 = *(_QWORD *)(v6 + 16);
  v10 = v6 + 16;
  if (v11)
  {
    v12 = &v30[v8];
    *v12 = 512;
    v12[1] = v29;
    result = _netlogon_encode_dns_string(a1, v10, (uint64_t)v12);
    if (WORD1(result))
      return result;
    v7 = v7 | 4;
    ++v8;
    v9 = *(_QWORD *)(a2 + 96);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  if (*(_QWORD *)(v9 + 16))
  {
    v15 = &v30[v8];
    *v15 = 512;
    v15[1] = &v29[512 * v14];
    result = _netlogon_encode_dns_string(a1, v9 + 16, (uint64_t)v15);
    if (WORD1(result))
      return result;
    ++v14;
    v7 = v7 | 8;
    ++v8;
    v9 = *(_QWORD *)(a2 + 96);
  }
  if (*(_QWORD *)v9)
  {
    v16 = &v30[v8];
    *v16 = 512;
    v16[1] = &v29[512 * v14];
    result = _netlogon_encode_dns_string(a1, v9, (uint64_t)v16);
    if (WORD1(result))
      return result;
    v7 = v7 | 0x10;
    ++v8;
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_17:
    v17 = (uint64_t *)v30;
    v18 = 8;
    v19 = v8;
    do
    {
      v20 = *v17;
      v17 += 2;
      v18 += v20;
      --v19;
    }
    while (v19);
    v21 = 0;
    goto LABEL_21;
  }
  v21 = 1;
  v18 = 8;
LABEL_21:
  v22 = malloc_type_malloc(v18, 0x44EB2717uLL);
  a3[1] = (size_t)v22;
  if (v22)
  {
    v23 = v22;
    _gss_mg_encode_le_uint32(0, v22);
    _gss_mg_encode_le_uint32(v7, v23 + 1);
    v24 = (char *)(v23 + 2);
    if ((v21 & 1) == 0)
    {
      v25 = (const void **)v30 + 1;
      do
      {
        v26 = (size_t)*(v25 - 1);
        if (!v26)
          _netlogon_make_initial_auth_message_cold_2();
        v27 = *v25;
        if (*((char *)*v25 + v26 - 1))
          _netlogon_make_initial_auth_message_cold_3();
        v25 += 2;
        memcpy(v24, v27, v26);
        v24 += v26;
        --v8;
      }
      while (v8);
    }
    *a3 = v18;
    if (v24 != (char *)(a3[1] + v18))
      _netlogon_make_initial_auth_message_cold_1();
    v28 = 0;
    result = 1;
  }
  else
  {
    result = 851968;
    v28 = 12;
  }
  *a1 = v28;
  return result;
}

uint64_t _netlogon_encode_dns_string(int *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  unsigned int v7;
  int v8;
  uint64_t result;

  bzero(*(void **)(a3 + 8), *(_QWORD *)a3);
  v6 = res_9_ns_name_compress(*(const char **)(a2 + 8), *(u_char **)(a3 + 8), *(_QWORD *)a3, 0, 0);
  if (v6 < 0)
  {
    v8 = *__error();
    result = 851968;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    result = 0;
    *(_QWORD *)a3 = v7;
  }
  *a1 = v8;
  return result;
}

void *__gss_netlogon_initialize()
{
  return &netlogon_mech;
}

uint64_t _netlogon_accept_sec_context(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _DWORD *a9, _DWORD *a10, _QWORD *a11)
{
  *a8 = 0;
  a8[1] = 0;
  *a1 = 0;
  if (a2 && a4)
  {
    if (a6)
      *a6 = 0;
    if (a7)
      *a7 = 0;
    if (a9)
      *a9 = 0;
    if (a10)
      *a10 = 0;
    if (a11)
      *a11 = 0;
    *a1 = 12;
  }
  return 851968;
}

uint64_t _netlogon_acquire_cred(OM_uint32 *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5 != 1)
    return 851968;
  if (!a2)
    return 0x20000;
  v13 = malloc_type_calloc(1uLL, 0x20uLL, 0x1080040DCAC275BuLL);
  if (!v13)
  {
    *a1 = 12;
    return 851968;
  }
  v14 = v13;
  *((_DWORD *)v13 + 2) = 7995511;
  v15 = _netlogon_duplicate_name(a1, a2, (gss_buffer_desc_struct **)v13);
  if (v15 >= 0x10000)
  {
    v16 = v15;
    free(v14);
  }
  else
  {
    *a6 = v14;
    if (a7)
      *a7 = 0;
    v16 = 0;
    if (a8)
      *a8 = -1;
  }
  return v16;
}

uint64_t _netlogon_set_cred_option(int *a1, uint64_t *a2, gss_const_OID a, _QWORD *a4)
{
  int v8;
  uint64_t result;
  uint64_t v10;
  int v11;
  __int16 v13;

  if (!a4)
    goto LABEL_18;
  if (gss_oid_equal(a, &__gss_netlogon_set_session_key_x_oid_desc))
  {
    if (*a2)
    {
      if (*a4 == 16)
      {
        v8 = 0;
        result = 0;
        *(_OWORD *)(*a2 + 12) = *(_OWORD *)a4[1];
        goto LABEL_19;
      }
LABEL_20:
      result = 851968;
      v8 = 34;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!gss_oid_equal(a, &__gss_netlogon_set_sign_algorithm_x_oid_desc))
    goto LABEL_18;
  v10 = *a2;
  if (!*a2)
    goto LABEL_18;
  if (*a4 != 2)
    goto LABEL_20;
  v11 = *(unsigned __int16 *)a4[1];
  if (v11 != 119 && v11 != 19)
  {
LABEL_18:
    result = 851968;
    v8 = 22;
    goto LABEL_19;
  }
  v8 = 0;
  result = 0;
  *(_WORD *)(v10 + 8) = v11;
  if (v11 == 19)
    v13 = 26;
  else
    v13 = 122;
  *(_WORD *)(v10 + 10) = v13;
LABEL_19:
  *a1 = v8;
  return result;
}

uint64_t _netlogon_add_cred(OM_uint32 *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t *a8, _QWORD *a9, _DWORD *a10, _DWORD *a11)
{
  uint64_t result;
  uint64_t v17;
  int v18;

  v18 = 0;
  if (a2 && a3)
  {
    result = _netlogon_compare_name(a1, a3, *(_QWORD *)a2, &v18);
    if (WORD1(result))
      return result;
    if (!v18)
      return 0x20000;
  }
  else if (!a2)
  {
    result = _netlogon_acquire_cred(a1, a3, a6, 0, a5, a8, a9, a10);
    if (result >= 0x10000)
      return result;
    goto LABEL_10;
  }
  result = _netlogon_acquire_cred(a1, *(_QWORD *)a2, a6, 0, a5, a8, a9, a10);
  if (result >= 0x10000)
    return result;
  v17 = *a8;
  *(_DWORD *)(v17 + 8) = *(_DWORD *)(a2 + 8);
  *(_OWORD *)(v17 + 12) = *(_OWORD *)(a2 + 12);
LABEL_10:
  result = 0;
  if (a11)
    *a11 = 0;
  return result;
}

uint64_t _netlogon_canonicalize_name(OM_uint32 *a1, uint64_t a2, uint64_t a3, gss_buffer_desc_struct **a4)
{
  return _netlogon_duplicate_name(a1, a2, a4);
}

uint64_t _netlogon_compare_name(_DWORD *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  *a4 = 0;
  v8 = *(const char **)(a2 + 8);
  if (v8)
  {
    v9 = *(const char **)(a3 + 8);
    if (v9)
      *a4 = strcasecmp(v8, v9) == 0;
  }
  v10 = *(const char **)(a2 + 24);
  if (v10)
  {
    v11 = *(const char **)(a3 + 24);
    if (v11)
      *a4 = strcasecmp(v10, v11) == 0;
  }
  *a1 = 0;
  return 0;
}

uint64_t _netlogon_context_time(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a3)
    *a3 = -1;
  return 0;
}

uint64_t _netlogon_display_name(int *a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t result;

  if (a4)
    *a4 = 0;
  if (a3)
  {
    v6 = *(_QWORD *)(a2 + 16);
    v7 = v6 == 0;
    v8 = 16 * (v6 != 0);
    if (v7)
      v9 = a2;
    else
      v9 = a2 + 16;
    v10 = malloc_type_malloc(*(_QWORD *)(a2 + v8) + 1, 0x984EF18FuLL);
    a3[1] = v10;
    if (v10)
    {
      memcpy(v10, *(const void **)(v9 + 8), *(_QWORD *)v9);
      v11 = 0;
      result = 0;
      *(_BYTE *)(a3[1] + *(_QWORD *)v9) = 0;
      *a3 = *(_QWORD *)v9;
    }
    else
    {
      result = 851968;
      v11 = 12;
    }
  }
  else
  {
    v11 = 0;
    result = 0;
  }
  *a1 = v11;
  return result;
}

uint64_t _netlogon_display_status(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, _QWORD *a6)
{
  if (a1)
    *a1 = 0;
  if (a6)
  {
    *a6 = 0;
    a6[1] = 0;
  }
  if (a5)
    *a5 = 0;
  return 0;
}

uint64_t _netlogon_duplicate_name(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct **a3)
{
  gss_buffer_desc_struct *v6;
  gss_buffer_desc_struct *v7;
  void *v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  uint64_t result;
  gss_buffer_t v14;

  v6 = (gss_buffer_desc_struct *)malloc_type_calloc(1uLL, 0x20uLL, 0x10800403AF1B36BuLL);
  v14 = v6;
  if (v6)
  {
    v7 = v6;
    v8 = malloc_type_malloc(*(_QWORD *)a2 + 1, 0x5811222AuLL);
    v7->value = v8;
    if (v8)
    {
      memcpy(v8, *(const void **)(a2 + 8), *(_QWORD *)a2);
      v9 = *(_QWORD *)a2;
      v7->length = *(_QWORD *)a2;
      *((_BYTE *)v7->value + v9) = 0;
      v10 = *(_QWORD *)(a2 + 16);
      if (!v10)
      {
LABEL_6:
        result = 0;
        *a1 = 0;
        *a3 = v7;
        return result;
      }
      v11 = malloc_type_malloc(v10 + 1, 0xBEE84176uLL);
      v7[1].value = v11;
      if (v11)
      {
        memcpy(v11, *(const void **)(a2 + 24), *(_QWORD *)(a2 + 16));
        v12 = *(_QWORD *)(a2 + 16);
        v7[1].length = v12;
        *((_BYTE *)v7[1].value + v12) = 0;
        goto LABEL_6;
      }
    }
  }
  _netlogon_release_name(a1, &v14);
  *a1 = 12;
  return 851968;
}

uint64_t _netlogon_export_name()
{
  return 0x100000;
}

uint64_t _netlogon_export_sec_context(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return 0x100000;
}

uint64_t _netlogon_import_name(OM_uint32 *a1, size_t *a2, gss_const_OID a, gss_buffer_desc_struct **a4)
{
  const char *v7;
  size_t v8;
  size_t v9;
  gss_buffer_desc_struct *v10;
  gss_buffer_desc_struct *v11;
  void *v12;
  uint64_t i;
  _BYTE *value;
  const char *v15;
  char *v16;
  int v17;
  uint64_t result;
  gss_buffer_t v19;

  if (gss_oid_equal(a, &__gss_netlogon_nt_netbios_dns_name_oid_desc))
  {
    v7 = (const char *)a2[1];
    v8 = strlen(v7);
    v9 = *a2;
    v10 = (gss_buffer_desc_struct *)malloc_type_calloc(1uLL, 0x20uLL, 0x10800403AF1B36BuLL);
    v19 = v10;
    if (v10)
    {
      v11 = v10;
      v12 = malloc_type_malloc(v8 + 1, 0xF71E659uLL);
      v11->value = v12;
      if (v12)
      {
        memcpy(v12, v7, v8 + 1);
        v11->length = v8;
        if (v8)
        {
          for (i = 0; i != v8; ++i)
          {
            value = v11->value;
            value[i] = __toupper((char)value[i]);
          }
        }
        if (v8 >= v9)
          goto LABEL_11;
        v15 = &v7[v8 + 1];
        if (!*v15)
          goto LABEL_11;
        v16 = strdup(v15);
        v11[1].value = v16;
        if (v16)
        {
          v11[1].length = strlen(v15);
LABEL_11:
          v17 = 0;
          result = 0;
          *a4 = v11;
LABEL_13:
          *a1 = v17;
          return result;
        }
      }
    }
    _netlogon_release_name(a1, &v19);
    result = 851968;
    v17 = 12;
    goto LABEL_13;
  }
  return 0x20000;
}

uint64_t _netlogon_import_sec_context(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  *a1 = 0;
  if (a3)
    *a3 = 0;
  return 0x100000;
}

uint64_t _netlogon_inquire_context(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct **a3, gss_buffer_desc_struct **a4, uint64_t a5, gss_OID_desc **a6, _DWORD *a7, _DWORD *a8, _DWORD *a9)
{
  uint64_t result;

  if (!a3 || (result = _netlogon_duplicate_name(a1, *(_QWORD *)(a2 + 96), a3), !WORD1(result)))
  {
    if (!a4 || (result = _netlogon_duplicate_name(a1, *(_QWORD *)(a2 + 104), a4), !WORD1(result)))
    {
      if (a6)
        *a6 = &__gss_netlogon_mechanism_oid_desc;
      if (a7)
        *a7 = *(_DWORD *)(a2 + 68);
      if (a8)
        *a8 = *(unsigned __int8 *)(a2 + 72);
      result = 0;
      if (a9)
        *a9 = *(_DWORD *)(a2 + 64) == 1;
    }
  }
  return result;
}

uint64_t _netlogon_inquire_cred_by_mech(OM_uint32 *a1, uint64_t *a2, uint64_t a3, gss_buffer_desc_struct **a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t result;

  if (!a4 || (result = _netlogon_duplicate_name(a1, *a2, a4), !WORD1(result)))
  {
    if (a5)
      *a5 = -1;
    if (a6)
      *a6 = -1;
    if (a7)
      *a7 = 1;
    result = 0;
    *a1 = 0;
  }
  return result;
}

uint64_t _netlogon_inquire_cred(OM_uint32 *a1, uint64_t *a2, gss_buffer_desc_struct **a3, _DWORD *a4, _DWORD *a5, _QWORD *a6)
{
  uint64_t result;

  *a1 = 0;
  if (!a2)
    return 458752;
  if (!a3 || (result = _netlogon_duplicate_name(a1, *a2, a3), !WORD1(result)))
  {
    if (a4)
      *a4 = -1;
    if (a5)
      *a5 = 1;
    result = 0;
    if (a6)
      *a6 = 0;
  }
  return result;
}

uint64_t _netlogon_inquire_mechs_for_name(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  if (a3)
    *a3 = 0;
  *a1 = 0;
  return 0;
}

uint64_t _netlogon_inquire_names_for_mech(OM_uint32 *a1, int a2, gss_OID_set *oid_set)
{
  uint64_t empty_oid_set;
  OM_uint32 minor_status;

  empty_oid_set = gss_create_empty_oid_set(a1, oid_set);
  if (!(_DWORD)empty_oid_set)
  {
    empty_oid_set = gss_add_oid_set_member(a1, &__gss_netlogon_nt_netbios_dns_name_oid_desc, oid_set);
    if ((_DWORD)empty_oid_set)
    {
      minor_status = 0;
      gss_release_oid_set(&minor_status, oid_set);
    }
    else
    {
      *a1 = 0;
    }
  }
  return empty_oid_set;
}

uint64_t _netlogon_iter_creds_f(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD, _QWORD))
{
  return a3(a2, 0, 0);
}

uint64_t _netlogon_process_context_token(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

uint64_t _netlogon_release_cred(OM_uint32 *a1, gss_buffer_t **a2)
{
  gss_buffer_t *v2;

  v2 = *a2;
  if (*a2)
  {
    _netlogon_release_name(a1, *a2);
    *(_OWORD *)v2 = 0u;
    *((_OWORD *)v2 + 1) = 0u;
    free(v2);
    *a2 = 0;
  }
  return 0;
}

uint64_t _netlogon_release_name(OM_uint32 *minor_status, gss_buffer_t *a2)
{
  gss_buffer_t v3;

  v3 = *a2;
  if (*a2)
  {
    gss_release_buffer(minor_status, *a2);
    gss_release_buffer(minor_status, v3 + 1);
    free(v3);
    *a2 = 0;
  }
  *minor_status = 0;
  return 0;
}

uint64_t _netlogon_wrap_iov(int *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  unsigned __int16 *buffer;
  unsigned __int16 *v14;
  uint64_t v15;
  size_t v16;
  uint64_t result;
  int v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v23[8];

  v23[7] = *MEMORY[0x24BDAC8D0];
  memset((char *)&v23[4] + 2, 0, 22);
  memset((char *)v23 + 2, 0, 32);
  if (*(_DWORD *)(a2 + 64) != 1 || (buffer = _gss_mg_find_buffer(a6, a7, 2)) == 0)
  {
    result = 851968;
    v18 = 22;
    goto LABEL_9;
  }
  v14 = buffer;
  v15 = 24;
  if (*(_WORD *)(a2 + 80) == 19)
    v15 = 48;
  v16 = v15 + 8 * (a3 != 0);
  if ((buffer[1] & 1) == 0)
  {
    if (*((_QWORD *)buffer + 1) < v16)
    {
      result = 851968;
      v18 = -1765328194;
LABEL_9:
      *a1 = v18;
      return result;
    }
    *((_QWORD *)buffer + 1) = v16;
LABEL_14:
    bzero(*((void **)v14 + 2), v16);
    LOWORD(v23[0]) = *(_WORD *)(a2 + 80);
    if (a3)
    {
      WORD1(v23[0]) = *(_WORD *)(a2 + 82);
      krb5_generate_random_block();
    }
    else
    {
      WORD1(v23[0]) = -1;
    }
    HIDWORD(v23[0]) = 0xFFFF;
    pthread_mutex_lock((pthread_mutex_t *)a2);
    v19 = *(unsigned int *)(a2 + 92);
    v20 = *(unsigned __int8 *)(a2 + 72);
    _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 88), &v23[1]);
    _gss_mg_encode_be_uint32(v19, (_DWORD *)&v23[1] + 1);
    if (v20)
      BYTE4(v23[1]) |= 0x80u;
    ++*(_QWORD *)(a2 + 88);
    pthread_mutex_unlock((pthread_mutex_t *)a2);
    _netlogon_digest(a2, (uint64_t)v23, (uint64_t)a6, a7, &v23[2]);
    if (a3)
      _netlogon_seal((int8x16_t *)a2, (uint64_t)v23, (uint64_t)a6, a7);
    _netlogon_seq(a2, v23);
    v22 = *((_QWORD *)v14 + 1);
    v21 = (_QWORD *)*((_QWORD *)v14 + 2);
    *v21 = v23[0];
    if (v22 >= 9)
    {
      v21[1] = v23[1];
      if (v22 >= 0x11)
      {
        v21[2] = v23[2];
        if (SWORD1(v23[0]) != -1)
          v21[3] = v23[3];
      }
    }
    v18 = 0;
    result = 0;
    if (a5)
      *a5 = a3;
    goto LABEL_9;
  }
  result = _gss_mg_allocate_buffer(a1, (uint64_t)buffer, v16);
  if (!WORD1(result))
  {
    v16 = *((_QWORD *)v14 + 1);
    goto LABEL_14;
  }
  return result;
}

void _netlogon_digest(uint64_t a1, uint64_t a2, uint64_t a3, int a4, _QWORD *a5)
{
  uint64_t v6;
  const void **v10;
  unsigned int v11;
  BOOL v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  _QWORD macOut[4];
  _WORD data[2];
  int v22;
  CCHmacContext ctx;
  uint64_t v24;

  LODWORD(v6) = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  if (*(_WORD *)a2 == 19)
  {
    memset(&ctx, 0, sizeof(ctx));
    data[0] = 19;
    data[1] = *(_WORD *)(a2 + 2);
    v22 = *(_DWORD *)(a2 + 4);
    CCHmacInit(&ctx, 2u, (const void *)(a1 + 112), 0x10uLL);
    CCHmacUpdate(&ctx, data, 8uLL);
    if (*(__int16 *)(a2 + 2) != -1)
      CCHmacUpdate(&ctx, (const void *)(a2 + 24), 8uLL);
    if ((int)v6 >= 1)
    {
      v10 = (const void **)(a3 + 16);
      v6 = v6;
      do
      {
        v11 = *((unsigned __int16 *)v10 - 8);
        v12 = v11 > 0xB;
        v13 = (1 << v11) & 0xA02;
        if (!v12 && v13 != 0)
          CCHmacUpdate(&ctx, *v10, (size_t)*(v10 - 1));
        v10 += 3;
        --v6;
      }
      while (v6);
    }
    CCHmacFinal(&ctx, macOut);
    v15 = macOut[0];
  }
  else
  {
    macOut[0] = *(_QWORD *)a2;
    CCDigestCreate();
    CCDigestUpdate();
    CCDigestUpdate();
    if (*(__int16 *)(a2 + 2) != -1)
      CCDigestUpdate();
    if ((int)v6 >= 1)
    {
      v16 = a3 + 16;
      v6 = v6;
      do
      {
        v17 = *(unsigned __int16 *)(v16 - 16);
        v12 = v17 > 0xB;
        v18 = (1 << v17) & 0xA02;
        if (!v12 && v18 != 0)
          CCDigestUpdate();
        v16 += 24;
        --v6;
      }
      while (v6);
    }
    CCDigestFinal();
    CCDigestDestroy();
    CCHmac(1u, (const void *)(a1 + 112), 0x10uLL, &ctx, 0x10uLL, &ctx);
    v15 = *(_QWORD *)ctx.ctx;
  }
  *a5 = v15;
}

uint64_t _netlogon_seal(int8x16_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  int8x16_t v8;
  int8x16_t v9;
  int v10;
  int v12;
  int8x16_t key;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  hc_EVP_CIPHER_CTX_init();
  v8.i64[0] = 0xF0F0F0F0F0F0F0F0;
  v8.i64[1] = 0xF0F0F0F0F0F0F0F0;
  if (*(_WORD *)(a2 + 2) == 26)
  {
    key = veorq_s8(a1[7], v8);
    hc_EVP_aes_128_cfb8();
    hc_EVP_CipherInit_ex();
  }
  else
  {
    key = veorq_s8(a1[7], v8);
    _netlogon_derive_rc4_hmac_key(&key, (const void *)(a2 + 8));
  }
  hc_EVP_Cipher();
  if (*(_WORD *)(a2 + 2) == 122)
  {
    hc_EVP_CipherFinal_ex();
    v9.i64[0] = 0xF0F0F0F0F0F0F0F0;
    v9.i64[1] = 0xF0F0F0F0F0F0F0F0;
    key = veorq_s8(a1[7], v9);
    _netlogon_derive_rc4_hmac_key(&key, (const void *)(a2 + 8));
  }
  v12 = 0;
  if (a4 >= 1)
  {
    v10 = 0;
    do
    {
      if ((*(unsigned __int16 *)(a3 + 24 * v10) | 8) == 9)
      {
        hc_EVP_Cipher();
        v10 = v12;
      }
      v12 = ++v10;
    }
    while (v10 < a4);
  }
  hc_EVP_CipherFinal_ex();
  return hc_EVP_CIPHER_CTX_cleanup();
}

uint64_t _netlogon_seq(uint64_t a1, _WORD *a2)
{
  hc_EVP_CIPHER_CTX_init();
  if (*a2 == 19)
  {
    hc_EVP_aes_128_cfb8();
    hc_EVP_CipherInit_ex();
  }
  else
  {
    _netlogon_derive_rc4_hmac_key((void *)(a1 + 112), a2 + 8);
  }
  hc_EVP_Cipher();
  return hc_EVP_CIPHER_CTX_cleanup();
}

uint64_t _netlogon_unwrap_iov(int *a1, int8x16_t *a2, _DWORD *a3, _DWORD *a4, unsigned __int16 *a5, int a6)
{
  unsigned __int16 *buffer;
  unint64_t v13;
  __int16 *v14;
  int v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26[8];
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a2[4].i32[0] != 1 || (buffer = _gss_mg_find_buffer(a5, a6, 2)) == 0)
  {
    *a1 = 22;
    return 851968;
  }
  v33 = 0u;
  v34 = 0u;
  v13 = *((_QWORD *)buffer + 1);
  if (v13 < 0x10)
    goto LABEL_12;
  v14 = (__int16 *)*((_QWORD *)buffer + 2);
  v27 = *v14;
  v15 = (unsigned __int16)v14[1];
  v28 = v14[1];
  v16 = (unsigned __int16)v14[2];
  v29 = v14[2];
  v30 = v14[3];
  v31 = *((_QWORD *)v14 + 1);
  if (v27 == 119)
  {
    v17 = 32;
  }
  else
  {
    if (v27 != 19)
    {
      v19 = 22;
      goto LABEL_13;
    }
    v17 = 56;
  }
  if (v15 == 0xFFFF)
    v17 -= 8;
  if (v17 > v13)
  {
LABEL_12:
    v19 = -1765328194;
LABEL_13:
    *a1 = v19;
    return 589824;
  }
  v32 = *((_QWORD *)v14 + 2);
  if (v15 == 0xFFFF)
  {
    if (v27 == a2[5].i16[0])
    {
      if (v16 != 0xFFFF)
        return 589824;
      goto LABEL_27;
    }
    return 393216;
  }
  *(_QWORD *)&v33 = *((_QWORD *)v14 + 3);
  if (v27 != a2[5].i16[0])
    return 393216;
  if (v15 != a2[5].u16[1] || v16 != 0xFFFF)
    return 589824;
LABEL_27:
  _netlogon_seq((uint64_t)a2, &v27);
  if ((a2[4].i8[8] == 0) != BYTE4(v31) >> 7)
    return 8;
  v25 = 0;
  v26[0] = 0;
  BYTE4(v31) &= ~0x80u;
  _gss_mg_decode_be_uint32((unsigned int *)&v31, v26);
  _gss_mg_decode_be_uint32((unsigned int *)&v31 + 1, &v25);
  v23 = v25;
  v22 = v26[0];
  if (v28 != -1)
    _netlogon_seal(a2, (uint64_t)&v27, (uint64_t)a5, a6);
  _netlogon_digest((uint64_t)a2, (uint64_t)&v27, (uint64_t)a5, a6, v26);
  if (v32 != *(_QWORD *)v26)
    return 393216;
  v24 = v22 | (v23 << 32);
  pthread_mutex_lock((pthread_mutex_t *)a2);
  if (v24 == a2[5].i64[1])
  {
    v18 = 0;
    a2[5].i64[1] = v24 + 1;
  }
  else
  {
    v18 = 8;
  }
  pthread_mutex_unlock((pthread_mutex_t *)a2);
  if (a3)
    *a3 = v28 != -1;
  if (a4)
    *a4 = 0;
  *a1 = 0;
  return v18;
}

uint64_t _netlogon_wrap_iov_length(int *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  unsigned __int16 *buffer;
  uint64_t v14;
  unsigned __int16 *v15;
  unsigned __int16 *v16;
  int v17;
  uint64_t result;

  buffer = _gss_mg_find_buffer(a6, a7, 2);
  if (buffer)
  {
    v14 = 24;
    if (*(_WORD *)(a2 + 80) == 19)
      v14 = 48;
    if (a3)
      v14 += 8;
    *((_QWORD *)buffer + 1) = v14;
    v15 = _gss_mg_find_buffer(a6, a7, 9);
    if (v15)
      *((_QWORD *)v15 + 1) = 0;
    v16 = _gss_mg_find_buffer(a6, a7, 7);
    if (v16)
      *((_QWORD *)v16 + 1) = 0;
    v17 = 0;
    result = 0;
    if (a5)
      *a5 = a3;
  }
  else
  {
    result = 851968;
    v17 = 22;
  }
  *a1 = v17;
  return result;
}

double _netlogon_get_mic(int *a1, uint64_t a2, uint64_t a3, __int128 *a4, _OWORD *a5)
{
  double result;
  int v7;
  __int128 v8;
  int v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = 1;
  v8 = *a4;
  v9 = 65538;
  v10 = 0uLL;
  if (!_netlogon_wrap_iov(a1, a2, 0, (uint64_t)a4, 0, (unsigned __int16 *)&v7, 2))
  {
    result = *(double *)&v10;
    *a5 = v10;
  }
  return result;
}

uint64_t _netlogon_verify_mic(int *a1, int8x16_t *a2, __int128 *a3, __int128 *a4, _DWORD *a5)
{
  int v6;
  __int128 v7;
  int v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = 1;
  v7 = *a3;
  v8 = 2;
  v9 = *a4;
  return _netlogon_unwrap_iov(a1, a2, 0, a5, (unsigned __int16 *)&v6, 2);
}

uint64_t _netlogon_wrap_size_limit(int *a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5, _DWORD *a6)
{
  uint64_t result;
  int v9;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 2;
  v11 = 0;
  result = _netlogon_wrap_iov_length(a1, a2, a3, a4, 0, (unsigned __int16 *)&v10, 1);
  if (!WORD1(result))
  {
    result = 0;
    if (v11 <= a5)
      v9 = a5 - v11;
    else
      v9 = 0;
    *a6 = v9;
  }
  return result;
}

uint64_t _netlogon_derive_rc4_hmac_key(void *key, const void *a2)
{
  _BYTE v4[16];
  _BYTE macOut[16];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CCHmac(1u, key, 0x10uLL, &zeros, 4uLL, macOut);
  CCHmac(1u, macOut, 0x10uLL, a2, 8uLL, v4);
  hc_EVP_rc4();
  return hc_EVP_CipherInit_ex();
}

void _gsskrb5cfx_wrap_length_cfx_cold_1()
{
  __assert_rtn("_gsskrb5cfx_wrap_length_cfx", "cfx.c", 138, "*output_length > input_length");
}

void unrotate_iov_cold_1()
{
  __assert_rtn("unrotate_iov", "cfx.c", 700, "(size_t)(q - p) == len");
}

void _gssapi_wrap_cfx_cold_1()
{
  __assert_rtn("_gssapi_wrap_cfx", "cfx.c", 1360, "cksum.checksum.length == cksumsize");
}

void _gssapi_wrap_cfx_cold_2()
{
  __assert_rtn("_gssapi_wrap_cfx", "cfx.c", 1313, "sizeof(*token) + cipher.length == wrapped_len");
}

void _gsskrb5_get_mic_cold_1()
{
  __assert_rtn("mic_des3", "get_mic.c", 265, "encdata.length == 8");
}

void elem_insert_cold_1()
{
  __assert_rtn("elem_insert", "sequence.c", 124, "o->jitter_window > after_slot");
}

void _gsskrb5_unwrap_cold_1()
{
  __assert_rtn("unwrap_des3", "unwrap.c", 292, "tmp.length == input_message_buffer->length - len");
}

void _gsskrb5_wrap_cold_1()
{
  __assert_rtn("wrap_des3", "wrap.c", 528, "tmp.length == datalen");
}

void _gsskrb5_wrap_cold_2()
{
  __assert_rtn("wrap_des3", "wrap.c", 493, "encdata.length == 8");
}

void get_mic_iov_cold_1()
{
  __assert_rtn("get_mic_iov", "crypto.c", 423, "trailer->buffer.value != NULL");
}

void get_mic_iov_cold_2()
{
  __assert_rtn("get_mic_iov", "crypto.c", 422, "trailer->buffer.length == 16");
}

void v2_seal_message_cold_1()
{
  __assert_rtn("v2_seal_message", "crypto.c", 337, "trailer->buffer.length == 16");
}

void v2_sign_message_cold_1()
{
  __assert_rtn("v2_sign_message", "crypto.c", 226, "trailer->buffer.length == 16");
}

void _gss_ntlm_cred_label_get_cold_1()
{
  errx(1, "out of memory");
}

void _netlogon_make_initial_auth_message_cold_1()
{
  __assert_rtn("_netlogon_make_initial_auth_message", "init_sec_context.c", 144, "p == (uint8_t *)output_token->value + len");
}

void _netlogon_make_initial_auth_message_cold_2()
{
  __assert_rtn("_netlogon_make_initial_auth_message", "init_sec_context.c", 137, "names[i].length != 0");
}

void _netlogon_make_initial_auth_message_cold_3()
{
  __assert_rtn("_netlogon_make_initial_auth_message", "init_sec_context.c", 138, "((char *)names[i].value)[names[i].length - 1] == '\\0'");
}

uint64_t CCDigest()
{
  return MEMORY[0x24BDAC1B8]();
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x24BDAC1C0]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x24BDAC1C8]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x24BDAC1D0]();
}

uint64_t CCDigestReset()
{
  return MEMORY[0x24BDAC1F0]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x24BDAC1F8]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x24BDAC240](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x24BDAC248](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x24BDAC250](ctx, data, dataLength);
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x24BDAC2C8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB870](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x24BDBBC68]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x24BDBBE90](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x24BDBC208](propertyList, stream, format, options, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
  MEMORY[0x24BDBC5F0](theString, theFlags, theLocale);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7A0](anURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7D8](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC988](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

uint64_t HeimCredCheckNTLMChallenge()
{
  return MEMORY[0x24BE4C0D0]();
}

uint64_t HeimCredCopyAttribute()
{
  return MEMORY[0x24BE4C0D8]();
}

uint64_t HeimCredCopyFromUUID()
{
  return MEMORY[0x24BE4C0E8]();
}

uint64_t HeimCredCopyQuery()
{
  return MEMORY[0x24BE4C0F0]();
}

uint64_t HeimCredCreate()
{
  return MEMORY[0x24BE4C0F8]();
}

uint64_t HeimCredDeleteByUUID()
{
  return MEMORY[0x24BE4C108]();
}

uint64_t HeimCredDeleteQuery()
{
  return MEMORY[0x24BE4C110]();
}

uint64_t HeimCredDoAuth()
{
  return MEMORY[0x24BE4C118]();
}

uint64_t HeimCredGetImpersonateBundle()
{
  return MEMORY[0x24BE4C120]();
}

uint64_t HeimCredGetUUID()
{
  return MEMORY[0x24BE4C128]();
}

uint64_t HeimCredReleaseTransient()
{
  return MEMORY[0x24BE4C130]();
}

uint64_t HeimCredRetainTransient()
{
  return MEMORY[0x24BE4C138]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x24BDAC480]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x24BDE8948]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x24BDE8A60]();
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

uint64_t _asn1_copy_top()
{
  return MEMORY[0x24BEDBD58]();
}

uint64_t _asn1_decode_top()
{
  return MEMORY[0x24BEDBD60]();
}

uint64_t _asn1_encode()
{
  return MEMORY[0x24BEDBD68]();
}

uint64_t _asn1_free_top()
{
  return MEMORY[0x24BEDBD70]();
}

uint64_t _asn1_length()
{
  return MEMORY[0x24BEDBD78]();
}

uint64_t _krb5_auth_con_setup_pfs()
{
  return MEMORY[0x24BE4C158]();
}

uint64_t _krb5_build_authenticator()
{
  return MEMORY[0x24BE4C160]();
}

uint64_t _krb5_crc_init_table()
{
  return MEMORY[0x24BE4C168]();
}

uint64_t _krb5_crc_update()
{
  return MEMORY[0x24BE4C170]();
}

uint64_t _krb5_get_krbtgt()
{
  return MEMORY[0x24BE4C178]();
}

uint64_t _krb5_have_debug()
{
  return MEMORY[0x24BE4C180]();
}

uint64_t _krb5_init_creds_get_cred_client()
{
  return MEMORY[0x24BE4C188]();
}

uint64_t _krb5_init_creds_get_cred_endtime()
{
  return MEMORY[0x24BE4C190]();
}

uint64_t _krb5_init_creds_set_pku2u()
{
  return MEMORY[0x24BE4C198]();
}

uint64_t _krb5_pk_find_cert()
{
  return MEMORY[0x24BE4C1A0]();
}

uint64_t _krb5_pk_match_cert()
{
  return MEMORY[0x24BE4C1A8]();
}

uint64_t _krb5_principalname2krb5_principal()
{
  return MEMORY[0x24BE4C1B0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t csops()
{
  return MEMORY[0x24BDADC00]();
}

uint64_t ct_memcmp()
{
  return MEMORY[0x24BE4C1B8]();
}

char *__cdecl ctime(const time_t *a1)
{
  return (char *)MEMORY[0x24BDADC18](a1);
}

uint64_t der_free_octet_string()
{
  return MEMORY[0x24BEDBDB0]();
}

uint64_t der_free_oid()
{
  return MEMORY[0x24BEDBDB8]();
}

uint64_t der_get_length()
{
  return MEMORY[0x24BEDBDC0]();
}

uint64_t der_get_oid()
{
  return MEMORY[0x24BEDBDC8]();
}

uint64_t der_heim_octet_string_cmp()
{
  return MEMORY[0x24BEDBDE0]();
}

uint64_t der_heim_oid_cmp()
{
  return MEMORY[0x24BEDBDE8]();
}

uint64_t der_length_len()
{
  return MEMORY[0x24BEDBDF8]();
}

uint64_t der_length_oid()
{
  return MEMORY[0x24BEDBE00]();
}

uint64_t der_print_heim_oid()
{
  return MEMORY[0x24BEDBE18]();
}

uint64_t der_put_length()
{
  return MEMORY[0x24BEDBE30]();
}

uint64_t der_put_oid()
{
  return MEMORY[0x24BEDBE40]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void errx(int a1, const char *a2, ...)
{
  MEMORY[0x24BDAE1D0](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

int fnmatch(const char *a1, const char *a2, int a3)
{
  return MEMORY[0x24BDAE408](a1, a2, *(_QWORD *)&a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

uint64_t hc_EVP_CIPHER_CTX_cleanup()
{
  return MEMORY[0x24BE4C1D0]();
}

uint64_t hc_EVP_CIPHER_CTX_init()
{
  return MEMORY[0x24BE4C1D8]();
}

uint64_t hc_EVP_Cipher()
{
  return MEMORY[0x24BE4C1E0]();
}

uint64_t hc_EVP_CipherFinal_ex()
{
  return MEMORY[0x24BE4C1E8]();
}

uint64_t hc_EVP_CipherInit_ex()
{
  return MEMORY[0x24BE4C1F0]();
}

uint64_t hc_EVP_aes_128_cfb8()
{
  return MEMORY[0x24BE4C1F8]();
}

uint64_t hc_EVP_rc4()
{
  return MEMORY[0x24BE4C200]();
}

uint64_t heim_abort()
{
  return MEMORY[0x24BE4C208]();
}

uint64_t heim_base_once_f()
{
  return MEMORY[0x24BE4C210]();
}

uint64_t heim_data_get_bytes()
{
  return MEMORY[0x24BE4C218]();
}

uint64_t heim_data_get_length()
{
  return MEMORY[0x24BE4C220]();
}

uint64_t heim_data_get_type_id()
{
  return MEMORY[0x24BE4C228]();
}

uint64_t heim_dict_copy_value()
{
  return MEMORY[0x24BE4C230]();
}

uint64_t heim_dict_get_type_id()
{
  return MEMORY[0x24BE4C238]();
}

uint64_t heim_get_tid()
{
  return MEMORY[0x24BE4C240]();
}

uint64_t heim_ipc_call()
{
  return MEMORY[0x24BE4C248]();
}

uint64_t heim_ipc_free_context()
{
  return MEMORY[0x24BE4C250]();
}

uint64_t heim_ipc_free_data()
{
  return MEMORY[0x24BE4C258]();
}

uint64_t heim_ipc_init_context()
{
  return MEMORY[0x24BE4C260]();
}

uint64_t heim_ntlm_decode_type2()
{
  return MEMORY[0x24BE18DA8]();
}

uint64_t heim_ntlm_decode_type3()
{
  return MEMORY[0x24BE18DB0]();
}

uint64_t heim_ntlm_encode_type1()
{
  return MEMORY[0x24BE18DB8]();
}

uint64_t heim_ntlm_encode_type3()
{
  return MEMORY[0x24BE18DC0]();
}

uint64_t heim_ntlm_free_buf()
{
  return MEMORY[0x24BE18DC8]();
}

uint64_t heim_ntlm_free_targetinfo()
{
  return MEMORY[0x24BE18DD0]();
}

uint64_t heim_ntlm_free_type2()
{
  return MEMORY[0x24BE18DD8]();
}

uint64_t heim_ntlm_free_type3()
{
  return MEMORY[0x24BE18DE0]();
}

uint64_t heim_ntlm_nt_key()
{
  return MEMORY[0x24BE18DE8]();
}

uint64_t heim_release()
{
  return MEMORY[0x24BE4C268]();
}

uint64_t heim_retain()
{
  return MEMORY[0x24BE4C270]();
}

uint64_t heim_string_copy_utf8()
{
  return MEMORY[0x24BE4C278]();
}

uint64_t heim_string_create()
{
  return MEMORY[0x24BE4C280]();
}

uint64_t heim_string_get_type_id()
{
  return MEMORY[0x24BE4C288]();
}

uint64_t heim_warn_blocking()
{
  return MEMORY[0x24BE4C290]();
}

uint64_t hx509_cert_find_subjectAltName_otherName()
{
  return MEMORY[0x24BE4C298]();
}

uint64_t hx509_cert_free()
{
  return MEMORY[0x24BE4C2A0]();
}

uint64_t hx509_cert_get_appleid()
{
  return MEMORY[0x24BE4C2A8]();
}

uint64_t hx509_cert_get_persistent()
{
  return MEMORY[0x24BE4C2B0]();
}

uint64_t hx509_cert_get_subject()
{
  return MEMORY[0x24BE4C2B8]();
}

uint64_t hx509_cert_init_SecFramework()
{
  return MEMORY[0x24BE4C2C0]();
}

uint64_t hx509_cert_init_SecFrameworkAuth()
{
  return MEMORY[0x24BE4C2C8]();
}

uint64_t hx509_cert_ref()
{
  return MEMORY[0x24BE4C2D0]();
}

uint64_t hx509_certs_free()
{
  return MEMORY[0x24BE4C2D8]();
}

uint64_t hx509_certs_init()
{
  return MEMORY[0x24BE4C2E0]();
}

uint64_t hx509_free_octet_string_list()
{
  return MEMORY[0x24BE4C2E8]();
}

uint64_t hx509_name_free()
{
  return MEMORY[0x24BE4C2F0]();
}

uint64_t hx509_name_to_Name()
{
  return MEMORY[0x24BE4C2F8]();
}

uint64_t hx509_query_alloc()
{
  return MEMORY[0x24BE4C300]();
}

uint64_t hx509_query_free()
{
  return MEMORY[0x24BE4C308]();
}

uint64_t hx509_query_match_cmp_func()
{
  return MEMORY[0x24BE4C310]();
}

uint64_t hx509_query_match_option()
{
  return MEMORY[0x24BE4C318]();
}

uint64_t hx509_query_match_persistent()
{
  return MEMORY[0x24BE4C320]();
}

uint64_t hx509_xfree()
{
  return MEMORY[0x24BE4C328]();
}

uint64_t issuid()
{
  return MEMORY[0x24BE4C330]();
}

uint64_t krb5_abortx()
{
  return MEMORY[0x24BE4C3E8]();
}

krb5_error_code krb5_aname_to_localname(krb5_context a1, krb5_const_principal a2, int a3, char *a4)
{
  return MEMORY[0x24BE4C3F0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t krb5_auth_con_addflags()
{
  return MEMORY[0x24BE4C3F8]();
}

krb5_error_code krb5_auth_con_free(krb5_context a1, krb5_auth_context a2)
{
  return MEMORY[0x24BE4C400](a1, a2);
}

uint64_t krb5_auth_con_generatelocalsubkey()
{
  return MEMORY[0x24BE4C408]();
}

krb5_error_code krb5_auth_con_getauthenticator(krb5_context a1, krb5_auth_context a2, krb5_authenticator **a3)
{
  return MEMORY[0x24BE4C410](a1, a2, a3);
}

krb5_error_code krb5_auth_con_getkey(krb5_context a1, krb5_auth_context a2, krb5_keyblock **a3)
{
  return MEMORY[0x24BE4C418](a1, a2, a3);
}

krb5_error_code krb5_auth_con_getlocalseqnumber(krb5_context a1, krb5_auth_context a2, krb5_int32 *a3)
{
  return MEMORY[0x24BE4C420](a1, a2, a3);
}

uint64_t krb5_auth_con_getlocalsubkey()
{
  return MEMORY[0x24BE4C428]();
}

krb5_error_code krb5_auth_con_getremoteseqnumber(krb5_context a1, krb5_auth_context a2, krb5_int32 *a3)
{
  return MEMORY[0x24BE4C430](a1, a2, a3);
}

uint64_t krb5_auth_con_getremotesubkey()
{
  return MEMORY[0x24BE4C438]();
}

krb5_error_code krb5_auth_con_init(krb5_context a1, krb5_auth_context *a2)
{
  return MEMORY[0x24BE4C440](a1, a2);
}

uint64_t krb5_auth_con_removeflags()
{
  return MEMORY[0x24BE4C448]();
}

krb5_error_code krb5_auth_con_setaddrs(krb5_context a1, krb5_auth_context a2, krb5_address *a3, krb5_address *a4)
{
  return MEMORY[0x24BE4C450](a1, a2, a3, a4);
}

krb5_error_code krb5_auth_con_setflags(krb5_context a1, krb5_auth_context a2, krb5_int32 a3)
{
  return MEMORY[0x24BE4C458](a1, a2, *(_QWORD *)&a3);
}

uint64_t krb5_auth_con_setkey()
{
  return MEMORY[0x24BE4C460]();
}

uint64_t krb5_auth_con_setlocalseqnumber()
{
  return MEMORY[0x24BE4C468]();
}

uint64_t krb5_auth_con_setlocalsubkey()
{
  return MEMORY[0x24BE4C470]();
}

uint64_t krb5_auth_con_setremoteseqnumber()
{
  return MEMORY[0x24BE4C478]();
}

uint64_t krb5_auth_con_setremotesubkey()
{
  return MEMORY[0x24BE4C480]();
}

uint64_t krb5_build_ap_req()
{
  return MEMORY[0x24BE4C488]();
}

krb5_error_code krb5_cc_cache_match(krb5_context context, krb5_principal client, krb5_ccache *id)
{
  return MEMORY[0x24BE4C490](context, client, id);
}

uint64_t krb5_cc_clear_mcred()
{
  return MEMORY[0x24BE4C498]();
}

krb5_error_code krb5_cc_close(krb5_context context, krb5_ccache cache)
{
  return MEMORY[0x24BE4C4A0](context, cache);
}

uint64_t krb5_cc_copy_cache()
{
  return MEMORY[0x24BE4C4A8]();
}

uint64_t krb5_cc_copy_match_f()
{
  return MEMORY[0x24BE4C4B0]();
}

krb5_error_code krb5_cc_default(krb5_context a1, krb5_ccache *a2)
{
  return MEMORY[0x24BE4C4B8](a1, a2);
}

const char *__cdecl krb5_cc_default_name(krb5_context a1)
{
  return (const char *)MEMORY[0x24BE4C4C0](a1);
}

krb5_error_code krb5_cc_destroy(krb5_context context, krb5_ccache cache)
{
  return MEMORY[0x24BE4C4C8](context, cache);
}

krb5_error_code krb5_cc_end_seq_get(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor)
{
  return MEMORY[0x24BE4C4D0](context, cache, cursor);
}

krb5_error_code krb5_cc_get_config(krb5_context a1, krb5_ccache a2, krb5_const_principal a3, const char *a4, krb5_data *a5)
{
  return MEMORY[0x24BE4C4D8](a1, a2, a3, a4, a5);
}

uint64_t krb5_cc_get_full_name()
{
  return MEMORY[0x24BE4C4E0]();
}

const char *__cdecl krb5_cc_get_name(krb5_context context, krb5_ccache cache)
{
  return (const char *)MEMORY[0x24BE4C4E8](context, cache);
}

uint64_t krb5_cc_get_ops()
{
  return MEMORY[0x24BE4C4F0]();
}

uint64_t krb5_cc_get_prefix_ops()
{
  return MEMORY[0x24BE4C4F8]();
}

krb5_error_code krb5_cc_get_principal(krb5_context context, krb5_ccache cache, krb5_principal *principal)
{
  return MEMORY[0x24BE4C500](context, cache, principal);
}

const char *__cdecl krb5_cc_get_type(krb5_context context, krb5_ccache cache)
{
  return (const char *)MEMORY[0x24BE4C508](context, cache);
}

uint64_t krb5_cc_get_uuid()
{
  return MEMORY[0x24BE4C510]();
}

krb5_error_code krb5_cc_initialize(krb5_context context, krb5_ccache cache, krb5_principal principal)
{
  return MEMORY[0x24BE4C520](context, cache, principal);
}

krb5_error_code krb5_cc_move(krb5_context context, krb5_ccache src, krb5_ccache dst)
{
  return MEMORY[0x24BE4C528](context, src, dst);
}

krb5_error_code krb5_cc_new_unique(krb5_context context, const char *type, const char *hint, krb5_ccache *id)
{
  return MEMORY[0x24BE4C530](context, type, hint, id);
}

krb5_error_code krb5_cc_next_cred(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor, krb5_creds *creds)
{
  return MEMORY[0x24BE4C538](context, cache, cursor, creds);
}

krb5_error_code krb5_cc_remove_cred(krb5_context context, krb5_ccache cache, krb5_flags flags, krb5_creds *creds)
{
  return MEMORY[0x24BE4C540](context, cache, *(_QWORD *)&flags, creds);
}

krb5_error_code krb5_cc_resolve(krb5_context a1, const char *a2, krb5_ccache *a3)
{
  return MEMORY[0x24BE4C548](a1, a2, a3);
}

uint64_t krb5_cc_resolve_by_uuid()
{
  return MEMORY[0x24BE4C550]();
}

krb5_error_code krb5_cc_retrieve_cred(krb5_context context, krb5_ccache cache, krb5_flags flags, krb5_creds *mcreds, krb5_creds *creds)
{
  return MEMORY[0x24BE4C558](context, cache, *(_QWORD *)&flags, mcreds, creds);
}

uint64_t krb5_cc_set_acl()
{
  return MEMORY[0x24BE4C560]();
}

krb5_error_code krb5_cc_set_config(krb5_context a1, krb5_ccache a2, krb5_const_principal a3, const char *a4, krb5_data *a5)
{
  return MEMORY[0x24BE4C568](a1, a2, a3, a4, a5);
}

krb5_error_code krb5_cc_set_default_name(krb5_context a1, const char *a2)
{
  return MEMORY[0x24BE4C570](a1, a2);
}

krb5_error_code krb5_cc_start_seq_get(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor)
{
  return MEMORY[0x24BE4C578](context, cache, cursor);
}

krb5_error_code krb5_cc_store_cred(krb5_context context, krb5_ccache cache, krb5_creds *creds)
{
  return MEMORY[0x24BE4C580](context, cache, creds);
}

uint64_t krb5_cc_switch()
{
  return MEMORY[0x24BE4C588]();
}

krb5_error_code krb5_cccol_cursor_free(krb5_context context, krb5_cccol_cursor *cursor)
{
  return MEMORY[0x24BE4C5A8](context, cursor);
}

krb5_error_code krb5_cccol_cursor_new(krb5_context context, krb5_cccol_cursor *cursor)
{
  return MEMORY[0x24BE4C5B0](context, cursor);
}

krb5_error_code krb5_cccol_cursor_next(krb5_context context, krb5_cccol_cursor cursor, krb5_ccache *ccache)
{
  return MEMORY[0x24BE4C5B8](context, cursor, ccache);
}

uint64_t krb5_checksumsize()
{
  return MEMORY[0x24BE4C5C0]();
}

void krb5_clear_error_message(krb5_context a1)
{
  MEMORY[0x24BE4C5C8](a1);
}

uint64_t krb5_config_free_strings()
{
  return MEMORY[0x24BE4C5D0]();
}

uint64_t krb5_config_get_strings()
{
  return MEMORY[0x24BE4C5D8]();
}

krb5_error_code krb5_copy_data(krb5_context a1, const krb5_data *a2, krb5_data **a3)
{
  return MEMORY[0x24BE4C5E0](a1, a2, a3);
}

krb5_error_code krb5_copy_principal(krb5_context a1, krb5_const_principal a2, krb5_principal *a3)
{
  return MEMORY[0x24BE4C5E8](a1, a2, a3);
}

uint64_t krb5_create_checksum()
{
  return MEMORY[0x24BE4C5F0]();
}

uint64_t krb5_create_checksum_iov()
{
  return MEMORY[0x24BE4C5F8]();
}

uint64_t krb5_crypto_destroy()
{
  return MEMORY[0x24BE4C600]();
}

uint64_t krb5_crypto_get_checksum_type()
{
  return MEMORY[0x24BE4C608]();
}

uint64_t krb5_crypto_getblocksize()
{
  return MEMORY[0x24BE4C610]();
}

uint64_t krb5_crypto_getpadsize()
{
  return MEMORY[0x24BE4C618]();
}

uint64_t krb5_crypto_init()
{
  return MEMORY[0x24BE4C620]();
}

uint64_t krb5_crypto_length()
{
  return MEMORY[0x24BE4C628]();
}

uint64_t krb5_crypto_prf()
{
  return MEMORY[0x24BE4C630]();
}

uint64_t krb5_data_alloc()
{
  return MEMORY[0x24BE4C638]();
}

uint64_t krb5_data_copy()
{
  return MEMORY[0x24BE4C640]();
}

uint64_t krb5_data_free()
{
  return MEMORY[0x24BE4C648]();
}

uint64_t krb5_data_zero()
{
  return MEMORY[0x24BE4C650]();
}

uint64_t krb5_decode_ap_req()
{
  return MEMORY[0x24BE4C658]();
}

krb5_error_code krb5_decrypt(krb5_context context, krb5_const_pointer inptr, krb5_pointer outptr, size_t size, krb5_encrypt_block *eblock, krb5_pointer ivec)
{
  return MEMORY[0x24BE4C660](context, inptr, outptr, size, eblock, ivec);
}

uint64_t krb5_decrypt_iov_ivec()
{
  return MEMORY[0x24BE4C668]();
}

uint64_t krb5_decrypt_ivec()
{
  return MEMORY[0x24BE4C670]();
}

krb5_error_code krb5_encrypt(krb5_context context, krb5_const_pointer inptr, krb5_pointer outptr, size_t size, krb5_encrypt_block *eblock, krb5_pointer ivec)
{
  return MEMORY[0x24BE4C680](context, inptr, outptr, size, eblock, ivec);
}

uint64_t krb5_encrypt_iov_ivec()
{
  return MEMORY[0x24BE4C688]();
}

uint64_t krb5_encrypt_ivec()
{
  return MEMORY[0x24BE4C690]();
}

krb5_error_code krb5_enctype_to_string(krb5_enctype a1, char *a2, size_t a3)
{
  return MEMORY[0x24BE4C698](*(_QWORD *)&a1, a2, a3);
}

uint64_t krb5_enctype_valid()
{
  return MEMORY[0x24BE4C6A0]();
}

uint64_t krb5_enomem()
{
  return MEMORY[0x24BE4C6A8]();
}

uint64_t krb5_error_from_rd_error()
{
  return MEMORY[0x24BE4C6B0]();
}

uint64_t krb5_free_address()
{
  return MEMORY[0x24BE4C6B8]();
}

void krb5_free_ap_rep_enc_part(krb5_context a1, krb5_ap_rep_enc_part *a2)
{
  MEMORY[0x24BE4C6C0](a1, a2);
}

void krb5_free_authenticator(krb5_context a1, krb5_authenticator *a2)
{
  MEMORY[0x24BE4C6C8](a1, a2);
}

void krb5_free_context(krb5_context a1)
{
  MEMORY[0x24BE4C6D0](a1);
}

void krb5_free_cred_contents(krb5_context a1, krb5_creds *a2)
{
  MEMORY[0x24BE4C6D8](a1, a2);
}

void krb5_free_creds(krb5_context a1, krb5_creds *a2)
{
  MEMORY[0x24BE4C6E0](a1, a2);
}

void krb5_free_data(krb5_context a1, krb5_data *a2)
{
  MEMORY[0x24BE4C6E8](a1, a2);
}

void krb5_free_error_message(krb5_context a1, const char *a2)
{
  MEMORY[0x24BE4C6F0](a1, a2);
}

void krb5_free_keyblock(krb5_context a1, krb5_keyblock *a2)
{
  MEMORY[0x24BE4C6F8](a1, a2);
}

void krb5_free_keyblock_contents(krb5_context a1, krb5_keyblock *a2)
{
  MEMORY[0x24BE4C700](a1, a2);
}

void krb5_free_principal(krb5_context a1, krb5_principal a2)
{
  MEMORY[0x24BE4C708](a1, a2);
}

void krb5_free_ticket(krb5_context a1, krb5_ticket *a2)
{
  MEMORY[0x24BE4C710](a1, a2);
}

uint64_t krb5_generate_random_block()
{
  return MEMORY[0x24BE4C718]();
}

krb5_error_code krb5_get_credentials(krb5_context a1, krb5_flags a2, krb5_ccache a3, krb5_creds *a4, krb5_creds **a5)
{
  return MEMORY[0x24BE4C720](a1, *(_QWORD *)&a2, a3, a4, a5);
}

uint64_t krb5_get_default_principal()
{
  return MEMORY[0x24BE4C758]();
}

const char *__cdecl krb5_get_error_message(krb5_context a1, krb5_error_code a2)
{
  return (const char *)MEMORY[0x24BE4C768](a1, *(_QWORD *)&a2);
}

uint64_t krb5_get_forwarded_creds()
{
  return MEMORY[0x24BE4C770]();
}

krb5_error_code krb5_get_init_creds_keytab(krb5_context context, krb5_creds *creds, krb5_principal client, krb5_keytab arg_keytab, krb5_deltat start_time, char *in_tkt_service, krb5_get_init_creds_opt *k5_gic_options)
{
  return MEMORY[0x24BE4C778](context, creds, client, arg_keytab, *(_QWORD *)&start_time, in_tkt_service, k5_gic_options);
}

krb5_error_code krb5_get_init_creds_opt_alloc(krb5_context context, krb5_get_init_creds_opt **opt)
{
  return MEMORY[0x24BE4C780](context, opt);
}

void krb5_get_init_creds_opt_free(krb5_context context, krb5_get_init_creds_opt *opt)
{
  MEMORY[0x24BE4C788](context, opt);
}

void krb5_get_init_creds_opt_set_canonicalize(krb5_get_init_creds_opt *opt, int canonicalize)
{
  MEMORY[0x24BE4C790](opt, *(_QWORD *)&canonicalize);
}

uint64_t krb5_get_init_creds_opt_set_default_flags()
{
  return MEMORY[0x24BE4C798]();
}

void krb5_get_init_creds_opt_set_forwardable(krb5_get_init_creds_opt *opt, int forwardable)
{
  MEMORY[0x24BE4C7A0](opt, *(_QWORD *)&forwardable);
}

uint64_t krb5_get_init_creds_opt_set_pkinit()
{
  return MEMORY[0x24BE4C7B0]();
}

void krb5_get_init_creds_opt_set_proxiable(krb5_get_init_creds_opt *opt, int proxiable)
{
  MEMORY[0x24BE4C7B8](opt, *(_QWORD *)&proxiable);
}

void krb5_get_init_creds_opt_set_renew_life(krb5_get_init_creds_opt *opt, krb5_deltat renew_life)
{
  MEMORY[0x24BE4C7C0](opt, *(_QWORD *)&renew_life);
}

void krb5_get_init_creds_opt_set_tkt_life(krb5_get_init_creds_opt *opt, krb5_deltat tkt_life)
{
  MEMORY[0x24BE4C7C8](opt, *(_QWORD *)&tkt_life);
}

uint64_t krb5_get_init_creds_opt_set_win2k()
{
  return MEMORY[0x24BE4C7D0]();
}

krb5_error_code krb5_get_init_creds_password(krb5_context context, krb5_creds *creds, krb5_principal client, char *password, krb5_prompter_fct prompter, void *data, krb5_deltat start_time, char *in_tkt_service, krb5_get_init_creds_opt *k5_gic_options)
{
  return MEMORY[0x24BE4C7D8](context, creds, client, password, prompter, data, *(_QWORD *)&start_time, in_tkt_service);
}

uint64_t krb5_get_kdc_cred()
{
  return MEMORY[0x24BE4C7E0]();
}

uint64_t krb5_get_kdc_sec_offset()
{
  return MEMORY[0x24BE4C7E8]();
}

uint64_t krb5_get_wrapped_length()
{
  return MEMORY[0x24BE4C7F0]();
}

uint64_t krb5_h_addr2sockaddr()
{
  return MEMORY[0x24BE4C7F8]();
}

uint64_t krb5_hmac()
{
  return MEMORY[0x24BE4C800]();
}

uint64_t krb5_homedir_access()
{
  return MEMORY[0x24BE4C808]();
}

krb5_error_code krb5_init_context(krb5_context *a1)
{
  return MEMORY[0x24BE4C810](a1);
}

uint64_t krb5_init_creds_free()
{
  return MEMORY[0x24BE4C818]();
}

uint64_t krb5_init_creds_get()
{
  return MEMORY[0x24BE4C820]();
}

uint64_t krb5_init_creds_get_as_reply_key()
{
  return MEMORY[0x24BE4C828]();
}

uint64_t krb5_init_creds_get_creds()
{
  return MEMORY[0x24BE4C830]();
}

uint64_t krb5_init_creds_init()
{
  return MEMORY[0x24BE4C838]();
}

uint64_t krb5_init_creds_set_kdc_hostname()
{
  return MEMORY[0x24BE4C840]();
}

uint64_t krb5_init_creds_set_password()
{
  return MEMORY[0x24BE4C858]();
}

uint64_t krb5_init_creds_set_pkinit_client_cert()
{
  return MEMORY[0x24BE4C860]();
}

uint64_t krb5_init_creds_set_service()
{
  return MEMORY[0x24BE4C868]();
}

uint64_t krb5_init_creds_set_sitename()
{
  return MEMORY[0x24BE4C870]();
}

uint64_t krb5_init_creds_set_source_process()
{
  return MEMORY[0x24BE4C878]();
}

uint64_t krb5_init_creds_step()
{
  return MEMORY[0x24BE4C880]();
}

uint64_t krb5_init_creds_store()
{
  return MEMORY[0x24BE4C888]();
}

uint64_t krb5_init_creds_store_config()
{
  return MEMORY[0x24BE4C890]();
}

krb5_error_code krb5_kt_close(krb5_context context, krb5_keytab keytab)
{
  return MEMORY[0x24BE4C8A8](context, keytab);
}

krb5_error_code krb5_kt_default(krb5_context a1, krb5_keytab *a2)
{
  return MEMORY[0x24BE4C8B0](a1, a2);
}

krb5_error_code krb5_kt_end_seq_get(krb5_context context, krb5_keytab keytab, krb5_kt_cursor *cursor)
{
  return MEMORY[0x24BE4C8B8](context, keytab, cursor);
}

uint64_t krb5_kt_free_entry()
{
  return MEMORY[0x24BE4C8C0]();
}

krb5_error_code krb5_kt_get_entry(krb5_context context, krb5_keytab keytab, krb5_const_principal principal, krb5_kvno vno, krb5_enctype enctype, krb5_keytab_entry *entry)
{
  return MEMORY[0x24BE4C8C8](context, keytab, principal, *(_QWORD *)&vno, *(_QWORD *)&enctype, entry);
}

uint64_t krb5_kt_get_full_name()
{
  return MEMORY[0x24BE4C8D0]();
}

uint64_t krb5_kt_have_content()
{
  return MEMORY[0x24BE4C8D8]();
}

krb5_error_code krb5_kt_next_entry(krb5_context context, krb5_keytab keytab, krb5_keytab_entry *entry, krb5_kt_cursor *cursor)
{
  return MEMORY[0x24BE4C8E0](context, keytab, entry, cursor);
}

krb5_error_code krb5_kt_resolve(krb5_context a1, const char *a2, krb5_keytab *a3)
{
  return MEMORY[0x24BE4C8E8](a1, a2, a3);
}

krb5_error_code krb5_kt_start_seq_get(krb5_context context, krb5_keytab keytab, krb5_kt_cursor *cursor)
{
  return MEMORY[0x24BE4C8F0](context, keytab, cursor);
}

krb5_BOOLean krb5_kuserok(krb5_context a1, krb5_principal a2, const char *a3)
{
  return MEMORY[0x24BE4C8F8](a1, a2, a3);
}

uint64_t krb5_load_plugins()
{
  return MEMORY[0x24BE4C900]();
}

uint64_t krb5_make_principal()
{
  return MEMORY[0x24BE4C908]();
}

krb5_error_code krb5_mk_error(krb5_context a1, const krb5_error *a2, krb5_data *a3)
{
  return MEMORY[0x24BE4C910](a1, a2, a3);
}

krb5_error_code krb5_mk_rep(krb5_context a1, krb5_auth_context a2, krb5_data *a3)
{
  return MEMORY[0x24BE4C918](a1, a2, a3);
}

krb5_error_code krb5_mk_req_extended(krb5_context a1, krb5_auth_context *a2, krb5_flags a3, krb5_data *a4, krb5_creds *a5, krb5_data *a6)
{
  return MEMORY[0x24BE4C920](a1, a2, *(_QWORD *)&a3, a4, a5, a6);
}

uint64_t krb5_pac_copy_credential_package()
{
  return MEMORY[0x24BE4C928]();
}

uint64_t krb5_pac_free()
{
  return MEMORY[0x24BE4C930]();
}

krb5_error_code krb5_parse_name(krb5_context a1, const char *a2, krb5_principal *a3)
{
  return MEMORY[0x24BE4C950](a1, a2, a3);
}

uint64_t krb5_plugin_register_module()
{
  return MEMORY[0x24BE4C960]();
}

uint64_t krb5_plugin_run_f()
{
  return MEMORY[0x24BE4C968]();
}

krb5_BOOLean krb5_principal_compare(krb5_context a1, krb5_const_principal a2, krb5_const_principal a3)
{
  return MEMORY[0x24BE4C970](a1, a2, a3);
}

uint64_t krb5_principal_get_realm()
{
  return MEMORY[0x24BE4C978]();
}

uint64_t krb5_principal_get_type()
{
  return MEMORY[0x24BE4C980]();
}

uint64_t krb5_principal_is_gss_hostbased_service()
{
  return MEMORY[0x24BE4C988]();
}

uint64_t krb5_principal_is_lkdc()
{
  return MEMORY[0x24BE4C990]();
}

uint64_t krb5_principal_is_null()
{
  return MEMORY[0x24BE4C998]();
}

uint64_t krb5_principal_is_pku2u()
{
  return MEMORY[0x24BE4C9A0]();
}

uint64_t krb5_principal_match()
{
  return MEMORY[0x24BE4C9A8]();
}

uint64_t krb5_principal_set_realm()
{
  return MEMORY[0x24BE4C9B0]();
}

uint64_t krb5_principal_set_type()
{
  return MEMORY[0x24BE4C9B8]();
}

uint64_t krb5_rd_cred2()
{
  return MEMORY[0x24BE4C9C0]();
}

krb5_error_code krb5_rd_error(krb5_context a1, const krb5_data *a2, krb5_error **a3)
{
  return MEMORY[0x24BE4C9C8](a1, a2, a3);
}

krb5_error_code krb5_rd_rep(krb5_context a1, krb5_auth_context a2, const krb5_data *a3, krb5_ap_rep_enc_part **a4)
{
  return MEMORY[0x24BE4C9D0](a1, a2, a3, a4);
}

uint64_t krb5_rd_req_ctx()
{
  return MEMORY[0x24BE4C9D8]();
}

uint64_t krb5_rd_req_in_ctx_alloc()
{
  return MEMORY[0x24BE4C9E0]();
}

uint64_t krb5_rd_req_in_ctx_free()
{
  return MEMORY[0x24BE4C9E8]();
}

uint64_t krb5_rd_req_in_set_as_reply_key()
{
  return MEMORY[0x24BE4C9F0]();
}

uint64_t krb5_rd_req_in_set_keytab()
{
  return MEMORY[0x24BE4C9F8]();
}

uint64_t krb5_rd_req_in_set_pac_check()
{
  return MEMORY[0x24BE4CA00]();
}

uint64_t krb5_rd_req_out_copy_pac()
{
  return MEMORY[0x24BE4CA08]();
}

uint64_t krb5_rd_req_out_ctx_free()
{
  return MEMORY[0x24BE4CA10]();
}

uint64_t krb5_rd_req_out_get_ap_req_options()
{
  return MEMORY[0x24BE4CA18]();
}

uint64_t krb5_rd_req_out_get_flags()
{
  return MEMORY[0x24BE4CA20]();
}

uint64_t krb5_rd_req_out_get_keyblock()
{
  return MEMORY[0x24BE4CA28]();
}

uint64_t krb5_rd_req_out_get_ticket()
{
  return MEMORY[0x24BE4CA30]();
}

uint64_t krb5_realm_is_lkdc()
{
  return MEMORY[0x24BE4CA38]();
}

uint64_t krb5_reload_config()
{
  return MEMORY[0x24BE4CA40]();
}

uint64_t krb5_ret_address()
{
  return MEMORY[0x24BE4CA48]();
}

uint64_t krb5_ret_creds()
{
  return MEMORY[0x24BE4CA50]();
}

uint64_t krb5_ret_data()
{
  return MEMORY[0x24BE4CA58]();
}

uint64_t krb5_ret_int16()
{
  return MEMORY[0x24BE4CA60]();
}

uint64_t krb5_ret_int32()
{
  return MEMORY[0x24BE4CA68]();
}

uint64_t krb5_ret_keyblock()
{
  return MEMORY[0x24BE4CA70]();
}

uint64_t krb5_ret_string()
{
  return MEMORY[0x24BE4CA78]();
}

uint64_t krb5_ret_uint16()
{
  return MEMORY[0x24BE4CA80]();
}

uint64_t krb5_ret_uint32()
{
  return MEMORY[0x24BE4CA88]();
}

uint64_t krb5_set_default_in_tkt_etypes()
{
  return MEMORY[0x24BE4CA90]();
}

krb5_error_code krb5_set_default_realm(krb5_context a1, const char *a2)
{
  return MEMORY[0x24BE4CA98](a1, a2);
}

uint64_t krb5_set_dns_canonicalize_hostname()
{
  return MEMORY[0x24BE4CAA0]();
}

void krb5_set_error_message(krb5_context a1, krb5_error_code a2, const char *a3, ...)
{
  MEMORY[0x24BE4CAA8](a1, *(_QWORD *)&a2, a3);
}

uint64_t krb5_set_kdc_sec_offset()
{
  return MEMORY[0x24BE4CAB0]();
}

krb5_error_code krb5_set_password(krb5_context context, krb5_creds *creds, char *newpw, krb5_principal change_password_for, int *result_code, krb5_data *result_code_string, krb5_data *result_string)
{
  return MEMORY[0x24BE4CAB8](context, creds, newpw, change_password_for, result_code, result_code_string, result_string);
}

krb5_error_code krb5_set_real_time(krb5_context a1, krb5_timestamp a2, krb5_int32 a3)
{
  return MEMORY[0x24BE4CAC0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

krb5_error_code krb5_sname_to_principal(krb5_context a1, const char *a2, const char *a3, krb5_int32 a4, krb5_principal *a5)
{
  return MEMORY[0x24BE4CAC8](a1, a2, a3, *(_QWORD *)&a4, a5);
}

uint64_t krb5_sockaddr2address()
{
  return MEMORY[0x24BE4CAD0]();
}

uint64_t krb5_storage_emem()
{
  return MEMORY[0x24BE4CAD8]();
}

uint64_t krb5_storage_free()
{
  return MEMORY[0x24BE4CAE0]();
}

uint64_t krb5_storage_from_mem()
{
  return MEMORY[0x24BE4CAE8]();
}

uint64_t krb5_storage_from_readonly_mem()
{
  return MEMORY[0x24BE4CAF0]();
}

uint64_t krb5_storage_read()
{
  return MEMORY[0x24BE4CAF8]();
}

uint64_t krb5_storage_set_byteorder()
{
  return MEMORY[0x24BE4CB00]();
}

uint64_t krb5_storage_to_data()
{
  return MEMORY[0x24BE4CB08]();
}

uint64_t krb5_storage_write()
{
  return MEMORY[0x24BE4CB10]();
}

uint64_t krb5_store_address()
{
  return MEMORY[0x24BE4CB18]();
}

uint64_t krb5_store_creds()
{
  return MEMORY[0x24BE4CB20]();
}

uint64_t krb5_store_data()
{
  return MEMORY[0x24BE4CB28]();
}

uint64_t krb5_store_int16()
{
  return MEMORY[0x24BE4CB30]();
}

uint64_t krb5_store_int32()
{
  return MEMORY[0x24BE4CB38]();
}

uint64_t krb5_store_keyblock()
{
  return MEMORY[0x24BE4CB40]();
}

uint64_t krb5_store_string()
{
  return MEMORY[0x24BE4CB48]();
}

uint64_t krb5_store_uint16()
{
  return MEMORY[0x24BE4CB50]();
}

uint64_t krb5_store_uint32()
{
  return MEMORY[0x24BE4CB58]();
}

uint64_t krb5_string_to_uuid()
{
  return MEMORY[0x24BE4CB60]();
}

uint64_t krb5_ticket_get_authorization_data_type()
{
  return MEMORY[0x24BE4CB68]();
}

krb5_error_code krb5_timeofday(krb5_context a1, krb5_timestamp *a2)
{
  return MEMORY[0x24BE4CB70](a1, a2);
}

uint64_t krb5_tkt_creds_free()
{
  return MEMORY[0x24BE4CB78]();
}

uint64_t krb5_tkt_creds_get_creds()
{
  return MEMORY[0x24BE4CB80]();
}

uint64_t krb5_tkt_creds_init()
{
  return MEMORY[0x24BE4CB88]();
}

uint64_t krb5_tkt_creds_step()
{
  return MEMORY[0x24BE4CB90]();
}

krb5_error_code krb5_unparse_name(krb5_context a1, krb5_const_principal a2, char **a3)
{
  return MEMORY[0x24BE4CB98](a1, a2, a3);
}

krb5_error_code krb5_unparse_name_flags(krb5_context a1, krb5_const_principal a2, int a3, char **a4)
{
  return MEMORY[0x24BE4CBA0](a1, a2, *(_QWORD *)&a3, a4);
}

krb5_error_code krb5_us_timeofday(krb5_context a1, krb5_timestamp *a2, krb5_int32 *a3)
{
  return MEMORY[0x24BE4CBA8](a1, a2, a3);
}

uint64_t krb5_uuid_to_string()
{
  return MEMORY[0x24BE4CBB0]();
}

krb5_error_code krb5_verify_checksum(krb5_context context, krb5_cksumtype ctype, const krb5_checksum *cksum, krb5_const_pointer in, size_t in_length, krb5_const_pointer seed, size_t seed_length)
{
  return MEMORY[0x24BE4CBB8](context, *(_QWORD *)&ctype, cksum, in, in_length, seed, seed_length);
}

uint64_t krb5_verify_checksum_iov()
{
  return MEMORY[0x24BE4CBC0]();
}

krb5_error_code krb5_verify_init_creds(krb5_context context, krb5_creds *creds, krb5_principal ap_req_server, krb5_keytab ap_req_keytab, krb5_ccache *ccache, krb5_verify_init_creds_opt *k5_vic_options)
{
  return MEMORY[0x24BE4CBC8](context, creds, ap_req_server, ap_req_keytab, ccache, k5_vic_options);
}

void krb5_verify_init_creds_opt_init(krb5_verify_init_creds_opt *k5_vic_options)
{
  MEMORY[0x24BE4CBD0](k5_vic_options);
}

void krb5_verify_init_creds_opt_set_ap_req_nofail(krb5_verify_init_creds_opt *k5_vic_options, int ap_req_nofail)
{
  MEMORY[0x24BE4CBD8](k5_vic_options, *(_QWORD *)&ap_req_nofail);
}

uint64_t krb5_xfree()
{
  return MEMORY[0x24BE4CBF8]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x24BDAF140](*(_QWORD *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

int res_9_ns_name_compress(const char *a1, u_char *a2, size_t a3, const u_char **a4, const u_char **a5)
{
  return MEMORY[0x24BEDDCB0](a1, a2, a3, a4, a5);
}

uint64_t rk_cfstring2cstring()
{
  return MEMORY[0x24BE4CC00]();
}

uint64_t rk_cloexec_file()
{
  return MEMORY[0x24BE4CC08]();
}

uint64_t rk_hex_encode()
{
  return MEMORY[0x24BE4CC10]();
}

uint64_t rk_strupr()
{
  return MEMORY[0x24BE4CC18]();
}

uint64_t rtbl_add_column()
{
  return MEMORY[0x24BE4CC20]();
}

uint64_t rtbl_add_column_entry()
{
  return MEMORY[0x24BE4CC28]();
}

uint64_t rtbl_create()
{
  return MEMORY[0x24BE4CC30]();
}

uint64_t rtbl_destroy()
{
  return MEMORY[0x24BE4CC38]();
}

uint64_t rtbl_format_str()
{
  return MEMORY[0x24BE4CC40]();
}

uint64_t rtbl_set_separator()
{
  return MEMORY[0x24BE4CC48]();
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x24BDAFFB0](__stringp, __delim);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFFC0](__s, __charset);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x24BDB0698](xarray, index);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

