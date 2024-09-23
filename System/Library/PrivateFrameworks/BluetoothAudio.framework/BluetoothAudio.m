uint64_t manager_SetDiscoveryMode(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v5;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __manager_SetDiscoveryMode_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  block[6] = DerivedStorage;
  dispatch_sync(v5, block);
  return 0;
}

uint64_t BluetoothEndpointCollectionGetCount(NSObject **a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v1 = *a1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __BluetoothEndpointCollectionGetCount_block_invoke;
  v4[3] = &unk_24DE51230;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t manager_CopyProperty(uint64_t a1, const void *a2, const __CFAllocator *a3, uint64_t *a4)
{
  NSObject ***DerivedStorage;
  NSObject ***v8;
  CFTypeRef *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  void *v14;
  NSObject **v15;
  NSObject *v16;
  uint64_t Count;
  const char *v18;
  uint64_t v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = (NSObject ***)CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)DerivedStorage)
    return 4294950584;
  v8 = DerivedStorage;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC0E98]))
  {
    v9 = (CFTypeRef *)MEMORY[0x24BDC0EB0];
LABEL_4:
    v10 = (uint64_t)CFRetain(*v9);
LABEL_10:
    v12 = v10;
    result = 0;
    *a4 = v12;
    return result;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC0EA8]))
  {
    v11 = 2;
LABEL_7:
    *(_QWORD *)v20 = v11;
    v10 = (uint64_t)CFNumberCreate(a3, kCFNumberSInt64Type, v20);
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC0E88]))
  {
    v10 = BluetoothEndpointCollectionCopyAsCFArray(v8[4], (uint64_t)a3);
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC0E90]))
  {
    v14 = (void *)BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
    {
      v15 = v8[4];
      v16 = v14;
      Count = BluetoothEndpointCollectionGetCount(v15);
      v18 = "endpoints present";
      if (!Count)
        v18 = "no endpoints";
      *(_DWORD *)v20 = 136446210;
      *(_QWORD *)&v20[4] = v18;
      _os_log_impl(&dword_21B151000, v16, OS_LOG_TYPE_INFO, "We have %{public}s", v20, 0xCu);

    }
    v19 = BluetoothEndpointCollectionGetCount(v8[4]);
    v9 = (CFTypeRef *)MEMORY[0x24BDBD270];
    if (!v19)
      v9 = (CFTypeRef *)MEMORY[0x24BDBD268];
    goto LABEL_4;
  }
  result = CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC0EA0]);
  if ((_DWORD)result)
  {
    v11 = 7;
    goto LABEL_7;
  }
  return result;
}

uint64_t BluetoothEndpointCreateWithDescription(const __CFAllocator *a1, const __CFDictionary *a2, _QWORD *a3)
{
  uint64_t v3;
  NSObject *v7;
  uint64_t DerivedStorage;
  uint64_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  const void *Value;
  const void *v14;
  const void *v15;
  const __CFBoolean *v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  const __CFNumber *v19;
  const __CFBoolean *v20;
  const __CFBoolean *v21;
  const __CFNumber *v22;
  const __CFBoolean *v23;
  const __CFBoolean *v24;
  const __CFBoolean *v25;
  const __CFBoolean *v26;
  const __CFBoolean *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  void *v30;
  const __CFBoolean *v31;
  int v32;
  const __CFDictionary *v33;
  CFDictionaryRef Copy;
  const void *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  void *v40;
  uint8_t buf[4];
  const __CFDictionary *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = 4294950576;
  if (a2 && a3)
  {
    v7 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = a2;
      _os_log_impl(&dword_21B151000, v7, OS_LOG_TYPE_DEFAULT, "BluetoothEndpointCreateWithDescription %@", buf, 0xCu);
    }
    FigEndpointGetClassID();
    v3 = CMDerivedObjectCreate();
    if (!(_DWORD)v3)
    {
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (!DerivedStorage)
        return 4294950575;
      v9 = DerivedStorage;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = dispatch_queue_create("BluetoothEndpointQueue", v10);
      v12 = *(void **)(v9 + 8);
      *(_QWORD *)(v9 + 8) = v11;

      if (*(_QWORD *)(v9 + 8))
      {
        Value = CFDictionaryGetValue(a2, CFSTR("Name"));
        *(_QWORD *)(v9 + 32) = Value;
        if (!Value)
          goto LABEL_30;
        CFRetain(Value);
        v14 = CFDictionaryGetValue(a2, CFSTR("DeviceID"));
        *(_QWORD *)(v9 + 40) = v14;
        if (!v14)
          goto LABEL_30;
        CFRetain(v14);
        v15 = CFDictionaryGetValue(a2, CFSTR("ModelID"));
        *(_QWORD *)(v9 + 48) = v15;
        if (!v15)
          goto LABEL_30;
        CFRetain(v15);
        if (CFDictionaryGetValue(a2, CFSTR("Shareable")))
        {
          v16 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("Shareable"));
          *(_BYTE *)(v9 + 89) = CFBooleanGetValue(v16);
        }
        v17 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("SupportedFormats"));
        if (!CFNumberGetValue(v17, kCFNumberCharType, (void *)(v9 + 88)))
          goto LABEL_30;
        v18 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("ListeningMode"));
        if (!CFNumberGetValue(v18, kCFNumberIntType, (void *)(v9 + 96)))
          goto LABEL_30;
        v19 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("SupportedListeningModes"));
        if (!CFNumberGetValue(v19, kCFNumberIntType, (void *)(v9 + 92)))
          goto LABEL_30;
        v20 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SupportsSpatialAudio"));
        if (!v20)
          goto LABEL_30;
        *(_BYTE *)(v9 + 101) = CFBooleanGetValue(v20);
        v21 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SpatialAudioEnabled"));
        if (!v21)
          goto LABEL_30;
        *(_BYTE *)(v9 + 102) = CFBooleanGetValue(v21);
        v22 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("SpatialAudioMode"));
        if (!CFNumberGetValue(v22, kCFNumberCharType, (void *)(v9 + 100)))
          goto LABEL_30;
        v23 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SupportsSmartRouting"));
        if (!v23)
          goto LABEL_30;
        *(_BYTE *)(v9 + 104) = CFBooleanGetValue(v23);
        v24 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SmartRoutingEnabled"));
        if (!v24
          || (*(_BYTE *)(v9 + 105) = CFBooleanGetValue(v24),
              (v25 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SupportsConversationDetect"))) == 0)
          || (*(_BYTE *)(v9 + 107) = CFBooleanGetValue(v25),
              (v26 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("ConversationDetectEnable"))) == 0)
          || (*(_BYTE *)(v9 + 108) = CFBooleanGetValue(v26),
              (v27 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("IsGenuineAirPods"))) == 0))
        {
LABEL_30:
          v3 = 4294950576;
LABEL_31:
          v36 = *(const void **)(v9 + 32);
          if (v36)
            CFRelease(v36);
          v37 = *(const void **)(v9 + 40);
          if (v37)
            CFRelease(v37);
          v38 = *(const void **)(v9 + 48);
          if (v38)
            CFRelease(v38);
          v39 = *(const void **)(v9 + 64);
          if (v39)
            CFRelease(v39);
          v40 = *(void **)v9;
          *(_QWORD *)v9 = 0;

          return v3;
        }
        *(_BYTE *)(v9 + 106) = CFBooleanGetValue(v27);
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = dispatch_queue_create("BluetoothEndpointNotification", v28);
        v30 = *(void **)v9;
        *(_QWORD *)v9 = v29;

        if (*(_QWORD *)v9)
        {
          v31 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("Connected"));
          v32 = CFBooleanGetValue(v31);
          endpoint_setConnected(0, v32);
          if (CFDictionaryContainsKey(a2, CFSTR("BatteryLevels")))
          {
            v33 = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("BatteryLevels"));
            Copy = CFDictionaryCreateCopy(a1, v33);
          }
          else
          {
            Copy = CFDictionaryCreate(a1, 0, 0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          }
          v3 = 0;
          *(_QWORD *)(v9 + 64) = Copy;
          *a3 = 0;
          return v3;
        }
      }
      v3 = 4294950575;
      goto LABEL_31;
    }
  }
  return v3;
}

void endpoint_setConnected(const void *a1, int a2)
{
  uint64_t DerivedStorage;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const __CFAllocator *v8;
  __CFDictionary *Mutable;
  char v10;
  const __CFAllocator *v11;
  CFStringRef v12;
  int v13;
  const __CFAllocator *v14;
  CFStringRef v15;
  int v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  CFTypeRef *v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  const __CFAllocator *v25;
  CFMutableDictionaryRef v26;
  NSObject *v27;
  _QWORD block[6];
  char v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "connected";
    v7 = *(_QWORD *)(DerivedStorage + 40);
    if (!a2)
      v6 = "disconnected";
    *(_DWORD *)buf = 138412546;
    v31 = v7;
    v32 = 2080;
    v33 = v6;
    _os_log_impl(&dword_21B151000, v5, OS_LOG_TYPE_DEFAULT, "Device with address %@ is %s", buf, 0x16u);
  }
  *(_BYTE *)(DerivedStorage + 56) = a2;
  if (a2)
  {
    v8 = CFGetAllocator(a1);
    Mutable = CFDictionaryCreateMutable(v8, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, CFSTR("Name"), *(const void **)(DerivedStorage + 32));
    v10 = *(_BYTE *)(DerivedStorage + 88);
    if ((v10 & 1) != 0)
    {
      v11 = CFGetAllocator(a1);
      v12 = CFStringCreateWithFormat(v11, 0, CFSTR("%@-%s"), *(_QWORD *)(DerivedStorage + 40), "tacl");
      CFDictionarySetValue(Mutable, CFSTR("DeviceID"), v12);
      v13 = CFGetAllocator(a1);
      BluetoothEndpointStreamAudioCreate(v13, Mutable, (_QWORD *)(DerivedStorage + 16));
      CFRelease(v12);
      v10 = *(_BYTE *)(DerivedStorage + 88);
    }
    if ((v10 & 2) != 0)
    {
      v14 = CFGetAllocator(a1);
      v15 = CFStringCreateWithFormat(v14, 0, CFSTR("%@-%s"), *(_QWORD *)(DerivedStorage + 40), "tsco");
      CFDictionarySetValue(Mutable, CFSTR("DeviceID"), v15);
      v16 = CFGetAllocator(a1);
      BluetoothEndpointStreamAudioCreate(v16, Mutable, (_QWORD *)(DerivedStorage + 24));
      CFRelease(v15);
    }
    CFRelease(Mutable);
  }
  else
  {
    v17 = 0;
    v18 = 1;
    do
    {
      v19 = v18;
      v20 = DerivedStorage + 8 * v17;
      v23 = *(_QWORD *)(v20 + 16);
      v22 = (CFTypeRef *)(v20 + 16);
      v21 = v23;
      if (v23)
      {
        v24 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v24)
          v24(v21);
        if (*v22)
        {
          CFRelease(*v22);
          *v22 = 0;
        }
      }
      v18 = 0;
      v17 = 1;
    }
    while ((v19 & 1) != 0);
  }
  v25 = CFGetAllocator(a1);
  v26 = CFDictionaryCreateMutable(v25, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  FigCFDictionarySetInt64();
  FigCFDictionarySetInt64();
  CFRetain(a1);
  v27 = *(NSObject **)DerivedStorage;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __endpoint_setConnected_block_invoke;
  block[3] = &__block_descriptor_49_e5_v8__0l;
  v29 = a2;
  block[4] = a1;
  block[5] = v26;
  dispatch_async(v27, block);
}

uint64_t BluetoothEndpointUpdateWithDescription(const void *a1, const __CFDictionary *a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t DerivedStorage;
  uint64_t v8;
  const void *Value;
  const void *v10;
  NSObject *v11;
  uint64_t v12;
  const void *v13;
  NSObject *v14;
  uint64_t v15;
  const void *v16;
  NSObject *v17;
  uint64_t v18;
  const __CFNumber *v19;
  NSObject *v20;
  int v21;
  const __CFBoolean *v22;
  int v23;
  int v24;
  NSObject *v25;
  int v26;
  const void *v27;
  uint64_t v28;
  NSObject *v29;
  const __CFBoolean *v30;
  int v31;
  int v32;
  NSObject *v33;
  int v34;
  const __CFNumber *v35;
  NSObject *v36;
  int v37;
  const __CFBoolean *v38;
  int v39;
  NSObject *v40;
  int v41;
  const __CFBoolean *v42;
  int v43;
  NSObject *v44;
  int v45;
  const __CFNumber *v46;
  NSObject *v47;
  int v48;
  const __CFBoolean *v49;
  int v50;
  NSObject *v51;
  int v52;
  const __CFBoolean *v53;
  int v54;
  NSObject *v55;
  int v56;
  const __CFBoolean *v57;
  int v58;
  NSObject *v59;
  int v60;
  const __CFBoolean *v61;
  int v62;
  NSObject *v63;
  int v64;
  const __CFBoolean *v65;
  int v66;
  NSObject *v67;
  int v68;
  NSObject *v69;
  _QWORD v70[5];
  unsigned __int8 v71;
  int v72;
  _QWORD block[8];
  int valuePtr;
  uint8_t buf[4];
  _BYTE v76[10];
  const void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  result = 4294950576;
  if (a1 && a2 && a3)
  {
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!DerivedStorage)
      return 4294950575;
    v8 = DerivedStorage;
    Value = CFDictionaryGetValue(a2, CFSTR("Name"));
    if (!Value)
      return 4294950576;
    v10 = Value;
    if (!CFEqual(*(CFTypeRef *)(v8 + 32), Value))
    {
      CFAutorelease(*(CFTypeRef *)(v8 + 32));
      v11 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(v8 + 32);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v76 = v12;
        *(_WORD *)&v76[8] = 2112;
        v77 = v10;
        _os_log_impl(&dword_21B151000, v11, OS_LOG_TYPE_DEFAULT, "Name %@->%@", buf, 0x16u);
      }
      *(_QWORD *)(v8 + 32) = v10;
      CFRetain(v10);
      *a3 = 1;
    }
    v13 = CFDictionaryGetValue(a2, CFSTR("DeviceID"));
    if (!CFEqual(*(CFTypeRef *)(v8 + 40), v13))
    {
      CFAutorelease(*(CFTypeRef *)(v8 + 40));
      v14 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(v8 + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v76 = v15;
        *(_WORD *)&v76[8] = 2112;
        v77 = v13;
        _os_log_impl(&dword_21B151000, v14, OS_LOG_TYPE_DEFAULT, "DeviceID %@->%@", buf, 0x16u);
      }
      *(_QWORD *)(v8 + 40) = v13;
      CFRetain(v13);
      *a3 = 1;
    }
    v16 = CFDictionaryGetValue(a2, CFSTR("ModelID"));
    if (!CFEqual(*(CFTypeRef *)(v8 + 48), v16))
    {
      CFAutorelease(*(CFTypeRef *)(v8 + 48));
      v17 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(v8 + 48);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v76 = v18;
        *(_WORD *)&v76[8] = 2112;
        v77 = v16;
        _os_log_impl(&dword_21B151000, v17, OS_LOG_TYPE_DEFAULT, "ModelID %@->%@", buf, 0x16u);
      }
      *(_QWORD *)(v8 + 48) = v16;
      CFRetain(v16);
      *a3 = 1;
    }
    v19 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("SupportedListeningModes"));
    valuePtr = 0;
    if (CFNumberGetValue(v19, kCFNumberIntType, &valuePtr) && *(_DWORD *)(v8 + 92) != valuePtr)
    {
      v20 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_DWORD *)(v8 + 92);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v21;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = valuePtr;
        _os_log_impl(&dword_21B151000, v20, OS_LOG_TYPE_DEFAULT, "Supported Listening Modes %d->%d", buf, 0xEu);
      }
      *(_DWORD *)(v8 + 92) = valuePtr;
      *a3 = 1;
    }
    v22 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("Connected"));
    v23 = CFBooleanGetValue(v22);
    if (v23 != *(unsigned __int8 *)(v8 + 56))
    {
      v24 = v23;
      v25 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(unsigned __int8 *)(v8 + 56);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v26;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v24;
        _os_log_impl(&dword_21B151000, v25, OS_LOG_TYPE_DEFAULT, "Connected %d->%d", buf, 0xEu);
      }
      endpoint_setConnected(a1, v24);
      *a3 = 1;
    }
    v27 = CFDictionaryGetValue(a2, CFSTR("BatteryLevels"));
    v28 = MEMORY[0x24BDAC760];
    if (v27)
    {
      v29 = *(NSObject **)(v8 + 8);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __BluetoothEndpointUpdateWithDescription_block_invoke;
      block[3] = &__block_descriptor_64_e5_v8__0l;
      block[4] = v8;
      block[5] = v27;
      block[6] = a1;
      block[7] = a3;
      dispatch_sync(v29, block);
    }
    if (CFDictionaryContainsKey(a2, CFSTR("Shareable")))
    {
      v30 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("Shareable"));
      v31 = CFBooleanGetValue(v30);
      if (*(unsigned __int8 *)(v8 + 89) != v31)
      {
        v32 = v31;
        v33 = BluetoothEndpointManagerLogComponent;
        if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *(unsigned __int8 *)(v8 + 89);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v76 = v34;
          *(_WORD *)&v76[4] = 1024;
          *(_DWORD *)&v76[6] = v32;
          _os_log_impl(&dword_21B151000, v33, OS_LOG_TYPE_DEFAULT, "Shareable %d->%d", buf, 0xEu);
        }
        *(_BYTE *)(v8 + 89) = v32;
        *a3 = 1;
      }
    }
    v72 = 0;
    v35 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("ListeningMode"));
    if (CFNumberGetValue(v35, kCFNumberIntType, &v72) && v72 != *(_DWORD *)(v8 + 96))
    {
      v36 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v37 = *(_DWORD *)(v8 + 96);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v37;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v72;
        _os_log_impl(&dword_21B151000, v36, OS_LOG_TYPE_DEFAULT, "Listening mode %d->%d", buf, 0xEu);
      }
      *(_DWORD *)(v8 + 96) = v72;
      *a3 = 1;
    }
    v38 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SupportsSpatialAudio"));
    v39 = CFBooleanGetValue(v38) != 0;
    if (*(unsigned __int8 *)(v8 + 101) != v39)
    {
      v40 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v41 = *(unsigned __int8 *)(v8 + 101);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v41;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v39;
        _os_log_impl(&dword_21B151000, v40, OS_LOG_TYPE_DEFAULT, "Spatial audio Support : %d->%d", buf, 0xEu);
      }
      *(_BYTE *)(v8 + 101) = v39;
      *a3 = 1;
    }
    v42 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SpatialAudioEnabled"));
    v43 = CFBooleanGetValue(v42) != 0;
    if (*(unsigned __int8 *)(v8 + 102) != v43)
    {
      v44 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(unsigned __int8 *)(v8 + 102);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v45;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v43;
        _os_log_impl(&dword_21B151000, v44, OS_LOG_TYPE_DEFAULT, "Spatial audio Allowed : %d->%d", buf, 0xEu);
      }
      *(_BYTE *)(v8 + 102) = v43;
      *a3 = 1;
    }
    v71 = 0;
    v46 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("SpatialAudioMode"));
    if (CFNumberGetValue(v46, kCFNumberCharType, &v71) && v71 != *(unsigned __int8 *)(v8 + 100))
    {
      v47 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v48 = *(unsigned __int8 *)(v8 + 100);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v48;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v71;
        _os_log_impl(&dword_21B151000, v47, OS_LOG_TYPE_DEFAULT, "Spatial Audio mode %d->%d", buf, 0xEu);
      }
      *(_BYTE *)(v8 + 100) = v71;
      *a3 = 1;
    }
    v49 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SupportsSmartRouting"));
    v50 = CFBooleanGetValue(v49) != 0;
    if (*(unsigned __int8 *)(v8 + 104) != v50)
    {
      v51 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v52 = *(unsigned __int8 *)(v8 + 104);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v52;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v50;
        _os_log_impl(&dword_21B151000, v51, OS_LOG_TYPE_DEFAULT, "Support SmartRouting : %d->%d", buf, 0xEu);
      }
      *(_BYTE *)(v8 + 104) = v50;
      *a3 = 1;
    }
    v53 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SmartRoutingEnabled"));
    v54 = CFBooleanGetValue(v53) != 0;
    if (*(unsigned __int8 *)(v8 + 105) != v54)
    {
      v55 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v56 = *(unsigned __int8 *)(v8 + 105);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v56;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v54;
        _os_log_impl(&dword_21B151000, v55, OS_LOG_TYPE_DEFAULT, "SmartRouting Enabled : %d->%d", buf, 0xEu);
      }
      *(_BYTE *)(v8 + 105) = v54;
      *a3 = 1;
    }
    v57 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("SupportsConversationDetect"));
    v58 = CFBooleanGetValue(v57) != 0;
    if (*(unsigned __int8 *)(v8 + 107) != v58)
    {
      v59 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v60 = *(unsigned __int8 *)(v8 + 107);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v60;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v58;
        _os_log_impl(&dword_21B151000, v59, OS_LOG_TYPE_DEFAULT, "Support Conversation Detect : %d->%d", buf, 0xEu);
      }
      *(_BYTE *)(v8 + 107) = v58;
      *a3 = 1;
    }
    v61 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("ConversationDetectEnable"));
    v62 = CFBooleanGetValue(v61) != 0;
    if (*(unsigned __int8 *)(v8 + 108) != v62)
    {
      v63 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v64 = *(unsigned __int8 *)(v8 + 108);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v64;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v62;
        _os_log_impl(&dword_21B151000, v63, OS_LOG_TYPE_DEFAULT, "Conversation Detect Enabled : %d->%d", buf, 0xEu);
      }
      *(_BYTE *)(v8 + 108) = v62;
      *a3 = 1;
    }
    v65 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("IsGenuineAirPods"));
    v66 = CFBooleanGetValue(v65) != 0;
    if (*(unsigned __int8 *)(v8 + 106) == v66)
    {
      if (!*a3)
        return 0;
    }
    else
    {
      v67 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v68 = *(unsigned __int8 *)(v8 + 106);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v76 = v68;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = v66;
        _os_log_impl(&dword_21B151000, v67, OS_LOG_TYPE_DEFAULT, "Is Genuine AirPods : %d->%d", buf, 0xEu);
      }
      *(_BYTE *)(v8 + 106) = v66;
      *a3 = 1;
    }
    CFRetain(a1);
    v69 = *(NSObject **)v8;
    v70[0] = v28;
    v70[1] = 3221225472;
    v70[2] = __BluetoothEndpointUpdateWithDescription_block_invoke_40;
    v70[3] = &__block_descriptor_40_e5_v8__0l;
    v70[4] = a1;
    dispatch_async(v69, v70);
    return 0;
  }
  return result;
}

void BluetoothEndpoint_Disassociate(const void *a1)
{
  NSObject **DerivedStorage;
  NSObject *v3;
  _QWORD block[5];

  DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  v3 = *DerivedStorage;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BluetoothEndpoint_Disassociate_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

uint64_t endpoint_Invalidate()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeRef *v6;
  uint64_t v7;
  void (*v8)(uint64_t);

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = 0;
  v2 = 1;
  do
  {
    v3 = v2;
    v4 = DerivedStorage + 8 * v1;
    v7 = *(_QWORD *)(v4 + 16);
    v6 = (CFTypeRef *)(v4 + 16);
    v5 = v7;
    if (v7)
    {
      v8 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v8)
        v8(v5);
      if (*v6)
      {
        CFRelease(*v6);
        *v6 = 0;
      }
    }
    v2 = 0;
    v1 = 1;
  }
  while ((v3 & 1) != 0);
  return 0;
}

void endpoint_Finalize()
{
  uint64_t DerivedStorage;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(void **)DerivedStorage;
  *(_QWORD *)DerivedStorage = 0;

  v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(DerivedStorage + 40);
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21B151000, v2, OS_LOG_TYPE_DEFAULT, "Finalize %@", buf, 0xCu);
  }
  v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __endpoint_Finalize_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = DerivedStorage;
  dispatch_sync(v4, block);
  v5 = *(void **)(DerivedStorage + 8);
  *(_QWORD *)(DerivedStorage + 8) = 0;

}

CFTypeRef endpoint_CopyDebugDescription()
{
  return CFRetain(CFSTR("Bluetooth Endpoint"));
}

uint64_t endpoint_CopyProperty(uint64_t a1, const void *a2, const __CFAllocator *a3, uint64_t *a4)
{
  uint64_t DerivedStorage;
  const void *v8;
  NSObject *v9;
  uint64_t result;
  uint64_t *p_valuePtr;
  const __CFAllocator *v12;
  CFNumberType v13;
  __CFArray *Mutable;
  uint64_t v15;
  char v16;
  char v17;
  const void *v18;
  const void **v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[7];
  uint64_t valuePtr;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11E8]))
  {
    *a4 = *MEMORY[0x24BDC1250];
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1180]))
  {
    v8 = *(const void **)(DerivedStorage + 40);
    if (!v8)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11B0]))
  {
    v8 = *(const void **)(DerivedStorage + 48);
LABEL_8:
    v8 = CFRetain(v8);
LABEL_9:
    *a4 = (uint64_t)v8;
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11B8]))
  {
    v8 = *(const void **)(DerivedStorage + 32);
    if (!v8)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11D0]))
  {
    valuePtr = 2;
    p_valuePtr = &valuePtr;
    v12 = a3;
    v13 = kCFNumberSInt64Type;
LABEL_18:
    v8 = CFNumberCreate(v12, v13, p_valuePtr);
    goto LABEL_9;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11C8]))
  {
    Mutable = CFArrayCreateMutable(a3, 0, MEMORY[0x24BDBD690]);
    v15 = 0;
    v16 = 1;
    do
    {
      v17 = v16;
      v18 = *(const void **)(DerivedStorage + 8 * v15 + 16);
      if (v18)
        CFArrayAppendValue(Mutable, v18);
      v16 = 0;
      v15 = 1;
    }
    while ((v17 & 1) != 0);
    *a4 = (uint64_t)Mutable;
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1188]) || CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1198]))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    v20 = *(unsigned __int8 *)(DerivedStorage + 56);
    goto LABEL_28;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1170]))
  {
    v21 = *(NSObject **)(DerivedStorage + 8);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __endpoint_CopyProperty_block_invoke;
    v23[3] = &__block_descriptor_56_e5_v8__0l;
    v23[4] = DerivedStorage;
    v23[5] = a4;
    v23[6] = a3;
    dispatch_sync(v21, v23);
LABEL_10:
    v9 = BluetoothEndpointManagerLogComponent;
    result = os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)result)
    {
      endpoint_CopyProperty_cold_2((uint64_t)a2, a4, v9);
      return 0;
    }
    return result;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1190]))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    v20 = *(unsigned __int8 *)(DerivedStorage + 89);
    goto LABEL_28;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11A8]))
  {
    p_valuePtr = (uint64_t *)(DerivedStorage + 96);
LABEL_39:
    v12 = a3;
    v13 = kCFNumberIntType;
    goto LABEL_18;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11D8]))
  {
    p_valuePtr = (uint64_t *)(DerivedStorage + 92);
    goto LABEL_39;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11E0]))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    v20 = *(unsigned __int8 *)(DerivedStorage + 101);
    goto LABEL_28;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1160]))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    if (*(_BYTE *)(DerivedStorage + 102) != 1)
      v19 = (const void **)MEMORY[0x24BDBD268];
    goto LABEL_30;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1178]))
  {
    p_valuePtr = (uint64_t *)(DerivedStorage + 100);
    v12 = a3;
    v13 = kCFNumberCharType;
    goto LABEL_18;
  }
  if (CFEqual(a2, CFSTR("SupportsSmartRouting")))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    v20 = *(unsigned __int8 *)(DerivedStorage + 104);
    goto LABEL_28;
  }
  if (CFEqual(a2, CFSTR("SmartRoutingEnabled")))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    v20 = *(unsigned __int8 *)(DerivedStorage + 105);
    goto LABEL_28;
  }
  if (CFEqual(a2, CFSTR("SupportsConversationDetect")))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    v20 = *(unsigned __int8 *)(DerivedStorage + 107);
    goto LABEL_28;
  }
  if (CFEqual(a2, CFSTR("ConversationDetectEnable")))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    v20 = *(unsigned __int8 *)(DerivedStorage + 108);
    goto LABEL_28;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11A0]))
  {
    v19 = (const void **)MEMORY[0x24BDBD270];
    v20 = *(unsigned __int8 *)(DerivedStorage + 106);
LABEL_28:
    if (!v20)
      v19 = (const void **)MEMORY[0x24BDBD268];
LABEL_30:
    v8 = *v19;
    goto LABEL_8;
  }
  v22 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEBUG))
    endpoint_CopyProperty_cold_1((uint64_t)a2, v22);
  return 4294954509;
}

uint64_t endpoint_SetProperty(uint64_t a1, const void *a2, const __CFNumber *a3)
{
  _QWORD *DerivedStorage;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  int Value;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  CFTypeID v23;
  int v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  CFTypeID v29;
  _BOOL4 v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _BOOL4 valuePtr;
  uint8_t buf[4];
  _BOOL4 v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC11A8]))
  {
    valuePtr = 0;
    if (CFNumberGetValue(a3, kCFNumberIntType, &valuePtr))
    {
      +[BluetoothBridge sharedBluetoothBridge](BluetoothBridge, "sharedBluetoothBridge");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceFromIdentifier:", DerivedStorage[5]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_alloc_init(MEMORY[0x24BDBB248]);
      objc_msgSend(v8, "setListeningMode:", valuePtr);
      v9 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v41 = valuePtr;
        v42 = 2112;
        v43 = v7;
        _os_log_impl(&dword_21B151000, v9, OS_LOG_TYPE_DEFAULT, "Set listening mode to %d for %@", buf, 0x12u);
      }
      v10 = objc_alloc_init(MEMORY[0x24BDBB238]);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __endpoint_SetProperty_block_invoke;
      v37[3] = &unk_24DE51160;
      v38 = v10;
      v11 = v10;
      objc_msgSend(v11, "modifyDevice:settings:completion:", v7, v8, v37);

    }
    else if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    {
      endpoint_SetProperty_cold_2();
    }
    return 0;
  }
  if (CFEqual(a2, CFSTR("ConversationDetectEnable")))
  {
    Value = CFBooleanGetValue(a3);
    +[BluetoothBridge sharedBluetoothBridge](BluetoothBridge, "sharedBluetoothBridge");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceFromIdentifier:", DerivedStorage[5]);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setIdentifier:", DerivedStorage[5]);
    v15 = objc_alloc_init(MEMORY[0x24BDBB248]);
    v16 = v15;
    if (Value)
      v17 = 1;
    else
      v17 = 2;
    objc_msgSend(v15, "setConversationDetectConfig:", v17);
    v18 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v41 = Value != 0;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_21B151000, v18, OS_LOG_TYPE_DEFAULT, "Set conversationDetect mode to %d for %@", buf, 0x12u);
    }
    v19 = objc_alloc_init(MEMORY[0x24BDBB238]);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __endpoint_SetProperty_block_invoke_48;
    v35[3] = &unk_24DE51160;
    v36 = v19;
    v20 = v19;
    objc_msgSend(v20, "modifyDevice:settings:completion:", v14, v16, v35);
    v21 = v36;
    goto LABEL_13;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1160]))
  {
    v23 = CFGetTypeID(a3);
    if (v23 != CFBooleanGetTypeID())
      return 0;
    v24 = CFBooleanGetValue(a3);
    v14 = objc_alloc_init(MEMORY[0x24BDBB240]);
    objc_msgSend(v14, "setIdentifier:", DerivedStorage[5]);
    v16 = objc_alloc_init(MEMORY[0x24BDBB248]);
    objc_msgSend(v16, "setSpatialAudioAllowed:", v24 != 0);
    v25 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v41 = v24 != 0;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_21B151000, v25, OS_LOG_TYPE_DEFAULT, "Set setSpatialAudioAllowed mode to %d for %@", buf, 0x12u);
    }
    v26 = objc_alloc_init(MEMORY[0x24BDBB238]);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __endpoint_SetProperty_block_invoke_50;
    v33[3] = &unk_24DE51160;
    v34 = v26;
    v20 = v26;
    objc_msgSend(v20, "modifyDevice:settings:completion:", v14, v16, v33);
    v21 = v34;
LABEL_13:

    return 0;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1178]))
  {
    valuePtr = 0;
    if (!CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr))
    {
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
        endpoint_SetProperty_cold_1();
      return 0;
    }
    v14 = objc_alloc_init(MEMORY[0x24BDBB240]);
    objc_msgSend(v14, "setIdentifier:", DerivedStorage[5]);
    v16 = objc_alloc_init(MEMORY[0x24BDBB248]);
    objc_msgSend(v16, "setSpatialAudioMode:", valuePtr);
    v27 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v41 = valuePtr;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_21B151000, v27, OS_LOG_TYPE_DEFAULT, "Set setSpatialAudioMode mode to %d for %@", buf, 0x12u);
    }
    v28 = objc_alloc_init(MEMORY[0x24BDBB238]);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __endpoint_SetProperty_block_invoke_51;
    v31[3] = &unk_24DE51160;
    v32 = v28;
    v20 = v28;
    objc_msgSend(v20, "modifyDevice:settings:completion:", v14, v16, v31);
    v21 = v32;
    goto LABEL_13;
  }
  if (CFEqual(a2, CFSTR("UserPickedRoute")))
  {
    v29 = CFGetTypeID(a3);
    if (v29 == CFBooleanGetTypeID())
    {
      v30 = CFBooleanGetValue(a3) != 0;
      endpoint_SetUserRouted(DerivedStorage, v30);
    }
    return 0;
  }
  return 4294954509;
}

void endpoint_SetUserRouted(_QWORD *a1, int a2)
{
  _BOOL4 v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  char v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v4 = a2 != 0;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBB240]);
  objc_msgSend(v5, "setIdentifier:", a1[5]);
  v6 = objc_alloc_init(MEMORY[0x24BDBB248]);
  objc_msgSend(v6, "setDeviceFlagsMask:", 0x400000);
  objc_msgSend(v6, "setDeviceFlagsValue:", (unint64_t)v4 << 22);
  v7 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = a2;
    _os_log_impl(&dword_21B151000, v7, OS_LOG_TYPE_DEFAULT, "Set user routed: %d", buf, 8u);
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBB238]);
  objc_msgSend(v8, "setDispatchQueue:", *a1);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __endpoint_SetUserRouted_block_invoke;
  v10[3] = &unk_24DE51188;
  v13 = a2;
  v11 = v8;
  v12 = a1;
  v9 = v8;
  objc_msgSend(v9, "modifyDevice:settings:completion:", v5, v6, v10);

}

uint64_t endpoint_Activate(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t DerivedStorage;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[8];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v10 = *(id *)(DerivedStorage + 40);
  v11 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(DerivedStorage + 40);
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_21B151000, v11, OS_LOG_TYPE_DEFAULT, "Activate %@", buf, 0xCu);
  }
  if (a2 == 2)
  {
    endpoint_SetUserRouted((_QWORD *)DerivedStorage, 1);
    *(_QWORD *)(DerivedStorage + 80) = 2;
    CFRetain(a1);
    +[BluetoothBridge sharedBluetoothBridge](BluetoothBridge, "sharedBluetoothBridge");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __endpoint_Activate_block_invoke;
    v16[3] = &__block_descriptor_64_e8_v12__0i8l;
    v16[4] = DerivedStorage;
    v16[5] = a4;
    v16[6] = a1;
    v16[7] = a5;
    objc_msgSend(v13, "connectToAddress:completionHandler:", v10, v16);

    v14 = 0;
  }
  else
  {
    v14 = 4294950576;
  }

  return v14;
}

uint64_t endpoint_Deactivate(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject **DerivedStorage;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[9];
  uint8_t buf[4];
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  v8 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v9 = DerivedStorage[5];
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl(&dword_21B151000, v8, OS_LOG_TYPE_DEFAULT, "Deactivate %@", buf, 0xCu);
  }
  endpoint_SetUserRouted(DerivedStorage, 0);
  if (a3)
  {
    v11 = DerivedStorage[9];
    v10 = DerivedStorage[10];
    CFRetain(a1);
    v12 = *DerivedStorage;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __endpoint_Deactivate_block_invoke;
    block[3] = &__block_descriptor_72_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    block[6] = v10;
    block[7] = v11;
    block[8] = a4;
    dispatch_async(v12, block);
  }
  return 0;
}

void __endpoint_setConnected_block_invoke(uint64_t a1)
{
  int v2;
  const void *v3;
  const void *v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  CMNotificationCenterGetDefaultLocalCenter();
  if (!v2)
  {
    CMNotificationCenterPostNotification();
    CMNotificationCenterGetDefaultLocalCenter();
  }
  CMNotificationCenterPostNotification();
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t BluetoothEndpointCollectionCreate(const __CFAllocator *a1, __CFArray *a2, __CFArray *a3, __CFArray *a4, CFMutableArrayRef **a5)
{
  CFMutableArrayRef *v10;
  dispatch_queue_t v11;
  CFMutableArrayRef Mutable;
  uint64_t result;

  v10 = (CFMutableArrayRef *)malloc_type_calloc(1uLL, 0x28uLL, 0xA0040B0408BC2uLL);
  if (v10
    && (v11 = dispatch_queue_create("BluetoothEndpointCollectionQueue", 0), (*v10 = (CFMutableArrayRef)v11) != 0)
    && (Mutable = CFArrayCreateMutable(a1, 0, 0), (v10[4] = Mutable) != 0))
  {
    result = 0;
    v10[1] = a2;
    v10[2] = a3;
    v10[3] = a4;
  }
  else
  {
    BluetoothEndpointCollectionDelete(v10);
    v10 = 0;
    result = 4294954510;
  }
  *a5 = v10;
  return result;
}

void BluetoothEndpointCollectionDelete(CFMutableArrayRef *a1)
{
  const __CFArray *v2;
  CFMutableArrayRef v3;
  CFRange v4;

  if (a1)
  {
    v2 = a1[4];
    v4.length = CFArrayGetCount(v2);
    v4.location = 0;
    CFArrayApplyFunction(v2, v4, (CFArrayApplierFunction)collection_deleteApplier, a1);
    CFArrayRemoveAllValues(a1[4]);
    *a1 = 0;
    v3 = a1[4];
    if (v3)
      CFRelease(v3);
    free(a1);
  }
}

uint64_t BluetoothEndpointCollectionCopyAsCFArray(NSObject **a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = *a1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __BluetoothEndpointCollectionCopyAsCFArray_block_invoke;
  block[3] = &unk_24DE51258;
  block[4] = &v6;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync(v2, block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t BluetoothEndpointCollectionUpdateEndpoint(NSObject **a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (a3)
  {
    v3 = *a1;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = __BluetoothEndpointCollectionUpdateEndpoint_block_invoke;
    v6[3] = &unk_24DE51280;
    v6[6] = a2;
    v6[7] = a3;
    v6[4] = &v7;
    v6[5] = a1;
    dispatch_sync(v3, v6);
    v4 = *((unsigned int *)v8 + 6);
  }
  else
  {
    v4 = 4294950586;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

const void *collection_findEntryForDescription(uint64_t a1, const __CFDictionary *a2, CFIndex *a3)
{
  CFIndex Count;
  const void *Value;
  const void *v8;
  CFIndex v9;
  uint64_t v10;
  const void *ValueAtIndex;
  uint64_t CMBaseObject;
  void (*v13)(uint64_t, uint64_t, _QWORD, CFTypeRef *);
  NSObject *v14;
  NSObject *v15;
  CFTypeRef cf;

  cf = 0;
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 32));
  Value = CFDictionaryGetValue(a2, CFSTR("DeviceID"));
  if (Value)
  {
    v8 = Value;
    if (Count < 1)
    {
      ValueAtIndex = 0;
      v9 = -1;
      if (!a3)
      {
LABEL_16:
        v14 = BluetoothEndpointManagerLogComponent;
        if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEBUG))
          collection_findEntryForDescription_cold_2((uint64_t)ValueAtIndex, (uint64_t)v8, v14);
        return ValueAtIndex;
      }
    }
    else
    {
      v9 = 0;
      v10 = *MEMORY[0x24BDC1180];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v9);
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        CMBaseObject = FigEndpointGetCMBaseObject();
        v13 = *(void (**)(uint64_t, uint64_t, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
        if (v13)
          v13(CMBaseObject, v10, 0, &cf);
        if (cf && CFEqual(v8, cf))
          break;
        if (Count == ++v9)
        {
          ValueAtIndex = 0;
          v9 = -1;
          break;
        }
      }
      if (cf)
        CFRelease(cf);
      if (!a3)
        goto LABEL_16;
    }
    *a3 = v9;
    goto LABEL_16;
  }
  v15 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    collection_findEntryForDescription_cold_1(v15);
  return 0;
}

uint64_t BluetoothEndpointCollectionMarkEndpointForRemoval(NSObject **a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (a3)
  {
    v3 = *a1;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = __BluetoothEndpointCollectionMarkEndpointForRemoval_block_invoke;
    v6[3] = &unk_24DE512A8;
    v6[4] = &v7;
    v6[5] = a1;
    v6[6] = a2;
    v6[7] = a3;
    dispatch_sync(v3, v6);
    v4 = *((unsigned int *)v8 + 6);
  }
  else
  {
    v4 = 4294950586;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void collection_removeEntry(uint64_t a1, const void **a2, CFIndex a3)
{
  NSObject *v6;
  uint64_t CMBaseObject;
  void (*v8)(uint64_t, _QWORD, _QWORD, const void **);
  const void *v9;
  NSObject *v10;
  void (*v11)(uint64_t, const void *, _QWORD);
  const void *v12;
  uint8_t buf[4];
  const void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEBUG))
    collection_removeEntry_cold_1(v6);
  v12 = 0;
  CMBaseObject = FigEndpointGetCMBaseObject();
  v8 = *(void (**)(uint64_t, _QWORD, _QWORD, const void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v8)
  {
    v8(CMBaseObject, *MEMORY[0x24BDC11B8], 0, &v12);
    v9 = v12;
    if (v12)
    {
      v10 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_21B151000, v10, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
        v9 = v12;
      }
      CFRelease(v9);
    }
  }
  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 32), a3);
  v11 = *(void (**)(uint64_t, const void *, _QWORD))(a1 + 16);
  if (v11)
    v11(a1, *a2, *(_QWORD *)(a1 + 24));
  collection_destroyCollectionEntry(a2);
}

uint64_t BluetoothEndpointCollectionMarkAllEndpointsForRemoval(NSObject **a1)
{
  NSObject *v1;
  _QWORD block[5];

  v1 = *a1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __BluetoothEndpointCollectionMarkAllEndpointsForRemoval_block_invoke;
  block[3] = &__block_descriptor_tmp_5;
  block[4] = a1;
  dispatch_sync(v1, block);
  return 0;
}

void collection_destroyCollectionEntry(const void **a1)
{
  NSObject *v2;
  const void *v3;
  void (*v4)(const void *);
  uint8_t v5[16];

  v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B151000, v2, OS_LOG_TYPE_INFO, "Destroy Collection entry", v5, 2u);
  }
  BluetoothEndpoint_Disassociate(*a1);
  v3 = *a1;
  v4 = *(void (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v4(v3);
  if (*a1)
    CFRelease(*a1);
  free(a1);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t BluetoothEndpointManagerCreate(const __CFAllocator *a1, void *a2, const __CFDictionary *a3, uint64_t *a4)
{
  id v7;
  os_log_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t DerivedStorage;
  dispatch_queue_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  void *v21;
  const __CFBoolean *Value;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = os_log_create("com.apple.bluetooth", "BTFigE");
  v9 = (void *)BluetoothEndpointManagerLogComponent;
  BluetoothEndpointManagerLogComponent = (uint64_t)v8;

  if (a4)
  {
    if (staticManager)
    {
      v10 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v27 = staticManager;
        _os_log_impl(&dword_21B151000, v10, OS_LOG_TYPE_DEFAULT, "BluetoothEndpointManager %p already exists!", buf, 0xCu);
      }
      v11 = 0;
      v12 = staticManager;
LABEL_6:
      *a4 = v12;
      goto LABEL_15;
    }
    if (!v7)
    {
      v7 = (id)MEMORY[0x24BDAC9B8];
      v13 = MEMORY[0x24BDAC9B8];
    }
    FigEndpointManagerGetClassID();
    v14 = CMDerivedObjectCreate();
    if ((_DWORD)v14)
      goto LABEL_12;
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    v16 = dispatch_queue_create("BluetoothEndpointManager", 0);
    v17 = *(void **)(DerivedStorage + 8);
    *(_QWORD *)(DerivedStorage + 8) = v16;

    if (*(_QWORD *)(DerivedStorage + 8))
    {
      objc_storeStrong((id *)(DerivedStorage + 16), v7);
      *(_QWORD *)(DerivedStorage + 24) = CFRetain((CFTypeRef)*MEMORY[0x24BDC0E68]);
      v14 = BluetoothEndpointCollectionCreate(a1, (__CFArray *)manager_endpointAddedCallback, (__CFArray *)manager_endpointRemovedCallback, 0, (CFMutableArrayRef **)(DerivedStorage + 32));
      if (!(_DWORD)v14)
      {
        +[BluetoothBridge sharedBluetoothBridge](BluetoothBridge, "sharedBluetoothBridge");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(DerivedStorage + 40);
        *(_QWORD *)(DerivedStorage + 40) = v20;

        objc_msgSend(*(id *)(DerivedStorage + 40), "setManager:", 0);
        if (!a3
          || !CFDictionaryGetValue(a3, CFSTR("TargetUserSession"))
          || (Value = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("TargetUserSession")), CFBooleanGetValue(Value)))
        {
          objc_msgSend(*(id *)(DerivedStorage + 40), "setTargetUserSession:", 1);
        }
        v23 = (void *)BluetoothEndpointManagerLogComponent;
        if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(void **)(DerivedStorage + 40);
          v25 = v23;
          *(_DWORD *)buf = 134218240;
          v27 = 0;
          v28 = 1024;
          v29 = objc_msgSend(v24, "targetUserSession");
          _os_log_impl(&dword_21B151000, v25, OS_LOG_TYPE_DEFAULT, "Created BluetoothEndpointManager %p with TargetUserSession: %d", buf, 0x12u);

        }
        v11 = 0;
        v12 = 0;
        staticManager = 0;
        goto LABEL_6;
      }
LABEL_12:
      v11 = v14;
      goto LABEL_13;
    }
    v11 = 4294950585;
  }
  else
  {
    v11 = 4294950586;
  }
LABEL_13:
  v18 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    BluetoothEndpointManagerCreate_cold_1(v11, v18);
LABEL_15:

  return v11;
}

void manager_endpointAddedCallback(uint64_t a1, uint64_t a2, const void *a3)
{
  CFAllocatorRef v4;
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *);
  CFTypeRef cf;

  cf = 0;
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  v4 = CFGetAllocator(a3);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v6)
  {
    v6(CMBaseObject, *MEMORY[0x24BDC1188], v4, &cf);
    if (cf)
      CFRelease(cf);
  }
}

void manager_endpointRemovedCallback(int a1, int a2, CFTypeRef cf)
{
  CFAllocatorRef v3;
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *);
  CFTypeRef cfa;

  cfa = 0;
  v3 = CFGetAllocator(cf);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v5)
    v5(CMBaseObject, *MEMORY[0x24BDC1188], v3, &cfa);
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  if (cfa)
    CFRelease(cfa);
}

void BluetoothEndpointManagerHandleUpdateEvent(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v5;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BluetoothEndpointManagerHandleUpdateEvent_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = DerivedStorage;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync(v5, block);
}

void manager_postEndpointsChangedNotification(const void *a1)
{
  uint64_t DerivedStorage;
  NSObject *v3;
  _QWORD v4[6];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  v3 = *(NSObject **)(DerivedStorage + 16);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __manager_postEndpointsChangedNotification_block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = DerivedStorage;
  v4[5] = a1;
  dispatch_async(v3, v4);
}

void BluetoothEndpointManagerHandleRemove(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v5;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BluetoothEndpointManagerHandleRemove_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = DerivedStorage;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync(v5, block);
}

void BluetoothEndpointManagerHandleRemoveAllEvent(uint64_t a1)
{
  uint64_t DerivedStorage;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[16];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B151000, v3, OS_LOG_TYPE_DEFAULT, "Handle Remove All Event", buf, 2u);
  }
  v4 = *(NSObject **)(DerivedStorage + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __BluetoothEndpointManagerHandleRemoveAllEvent_block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = DerivedStorage;
  v5[5] = a1;
  dispatch_sync(v4, v5);
}

uint64_t manager_Invalidate()
{
  uint64_t DerivedStorage;
  NSObject *v1;
  _QWORD block[5];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __manager_Invalidate_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  return 0;
}

void manager_Finalize()
{
  _QWORD *DerivedStorage;
  void *v1;
  void *v2;
  const void *v3;
  void *v4;

  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  v1 = (void *)DerivedStorage[2];
  DerivedStorage[2] = 0;

  manager_Invalidate();
  v2 = (void *)DerivedStorage[5];
  DerivedStorage[5] = 0;

  v3 = (const void *)DerivedStorage[3];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[3] = 0;
  }
  v4 = (void *)DerivedStorage[1];
  DerivedStorage[1] = 0;

}

CFTypeRef manager_CopyDebugDescription()
{
  return CFRetain(CFSTR("Bluetooth Endpoint Manager"));
}

uint64_t manager_SetProperty()
{
  if (*(_BYTE *)CMBaseObjectGetDerivedStorage())
    return 4294950584;
  else
    return 0;
}

void __manager_postEndpointsChangedNotification_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject **v3;
  NSObject *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  int v8;
  int v9;
  int Count;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (manager_postEndpointsChangedNotification_previousEndpointsPresent)
  {
LABEL_2:
    if (BluetoothEndpointCollectionGetCount(*(NSObject ***)(*(_QWORD *)(a1 + 32) + 32)))
      goto LABEL_8;
    goto LABEL_5;
  }
  if (!BluetoothEndpointCollectionGetCount(*(NSObject ***)(*(_QWORD *)(a1 + 32) + 32)))
  {
    if (!manager_postEndpointsChangedNotification_previousEndpointsPresent)
      goto LABEL_8;
    goto LABEL_2;
  }
LABEL_5:
  v2 = (void *)BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(NSObject ***)(*(_QWORD *)(a1 + 32) + 32);
    v4 = v2;
    v9 = 67109120;
    Count = BluetoothEndpointCollectionGetCount(v3);
    _os_log_impl(&dword_21B151000, v4, OS_LOG_TYPE_DEFAULT, "Posting Endpoints Present Changed Notification #endpoints:%d", (uint8_t *)&v9, 8u);

  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  manager_postEndpointsChangedNotification_previousEndpointsPresent ^= 1u;
LABEL_8:
  v5 = (void *)BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(NSObject ***)(*(_QWORD *)(a1 + 32) + 32);
    v7 = v5;
    v8 = BluetoothEndpointCollectionGetCount(v6);
    v9 = 67109120;
    Count = v8;
    _os_log_impl(&dword_21B151000, v7, OS_LOG_TYPE_DEFAULT, "Posting Available Endpoints Changed Notification #endpoints:%d", (uint8_t *)&v9, 8u);

  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void manager_handleEndpointDescriptionChanged(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage;
  NSObject *v4;
  _QWORD block[5];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a2);
  v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __manager_handleEndpointDescriptionChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(v4, block);
}

void __manager_handleEndpointDescriptionChanged_block_invoke(uint64_t a1)
{
  manager_postEndpointsChangedNotification(*(const void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t BluetoothEndpointStreamAudioCreate(int a1, CFTypeRef cf, _QWORD *a3)
{
  CFTypeID v5;
  CFTypeID TypeID;
  uint64_t v7;
  uint64_t v8;
  _QWORD *DerivedStorage;
  const void *Value;
  const void *v11;
  dispatch_queue_t v12;

  if (cf)
  {
    v5 = CFGetTypeID(cf);
    TypeID = CFDictionaryGetTypeID();
    v7 = 4294950536;
    if (!a3 || v5 != TypeID)
      return v7;
  }
  else if (!a3)
  {
    return 4294950536;
  }
  FigEndpointStreamGetClassID();
  v8 = CMDerivedObjectCreate();
  if ((_DWORD)v8)
    return v8;
  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  Value = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("Name"));
  DerivedStorage[1] = Value;
  if (!Value)
    return 4294950576;
  CFRetain(Value);
  v11 = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("DeviceID"));
  DerivedStorage[2] = v11;
  if (!v11)
    return 4294950576;
  CFRetain(v11);
  v12 = dispatch_queue_create("BluetoothEndpointStreamAudio", 0);
  *DerivedStorage = v12;
  if (!v12)
    return 4294950535;
  v7 = 0;
  *a3 = 0;
  return v7;
}

void audioStream_Finalize()
{
  uint64_t DerivedStorage;
  const void *v1;
  const void *v2;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_QWORD *)DerivedStorage)
  {
    dispatch_release(*(dispatch_object_t *)DerivedStorage);
    *(_QWORD *)DerivedStorage = 0;
  }
  v1 = *(const void **)(DerivedStorage + 8);
  if (v1)
  {
    CFRelease(v1);
    *(_QWORD *)(DerivedStorage + 8) = 0;
  }
  v2 = *(const void **)(DerivedStorage + 16);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(DerivedStorage + 16) = 0;
  }
}

__CFString *audioStream_CopyDebugDescription(uint64_t a1)
{
  uint64_t DerivedStorage;
  __CFString *Mutable;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<APEndpointStreamAudio %p '%@'>"), a1, *(_QWORD *)(DerivedStorage + 8));
  return Mutable;
}

uint64_t audioStream_CopyProperty(uint64_t a1, const void *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t DerivedStorage;
  uint64_t v7;
  CFTypeRef *v8;
  CFTypeRef v9;
  uint64_t result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a4)
    return 4294950536;
  v7 = DerivedStorage;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1220]))
  {
    v8 = (CFTypeRef *)MEMORY[0x24BDC1230];
LABEL_8:
    v9 = CFRetain(*v8);
    result = 0;
    *a4 = v9;
    return result;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1218]))
  {
    v8 = (CFTypeRef *)MEMORY[0x24BDC1228];
    goto LABEL_8;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC1210]))
  {
    v8 = (CFTypeRef *)(v7 + 16);
    goto LABEL_8;
  }
  return 4294954512;
}

uint64_t audioStream_SetProperty()
{
  return 4294954512;
}

void endpoint_CopyProperty_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21B151000, a2, OS_LOG_TYPE_DEBUG, "Copy property %@ not supported", (uint8_t *)&v2, 0xCu);
}

void endpoint_CopyProperty_cold_2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_21B151000, log, OS_LOG_TYPE_DEBUG, "Copy property %@ returns %@", (uint8_t *)&v4, 0x16u);
}

void endpoint_SetProperty_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Error setting spatial mode with a CFType != CFNumber", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void endpoint_SetProperty_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Failed to get listening mode property value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void collection_findEntryForDescription_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21B151000, log, OS_LOG_TYPE_ERROR, "Find endpoint for a NULL address?", v1, 2u);
}

void collection_findEntryForDescription_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = "Didn't find an entry";
  if (a1)
    v3 = "Found an existing entry";
  v4 = 136446466;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_21B151000, log, OS_LOG_TYPE_DEBUG, "%{public}s for %@", (uint8_t *)&v4, 0x16u);
}

void collection_removeEntry_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21B151000, log, OS_LOG_TYPE_DEBUG, "Remove entry", v1, 2u);
}

void BluetoothEndpointManagerCreate_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21B151000, a2, OS_LOG_TYPE_ERROR, "Error creating Bluetooth Endpoint Manager 0x%x", (uint8_t *)v2, 8u);
}

OSStatus AudioObjectAddPropertyListenerBlock(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, dispatch_queue_t inDispatchQueue, AudioObjectPropertyListenerBlock inListener)
{
  return MEMORY[0x24BDBAF30](*(_QWORD *)&inObjectID, inAddress, inDispatchQueue, inListener);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x24BDBAF38](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioObjectGetPropertyDataSize(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *outDataSize)
{
  return MEMORY[0x24BDBAF40](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, outDataSize);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetEmpty()
{
  return MEMORY[0x24BE28F78]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x24BDC0090]();
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x24BDC0228]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x24BDC0230]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x24BDC0238]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x24BDC0248]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x24BE291B8]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x24BE291C8]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x24BDC0740]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x24BDC0850]();
}

uint64_t FigEndpointGetClassID()
{
  return MEMORY[0x24BDC0858]();
}

uint64_t FigEndpointManagerGetClassID()
{
  return MEMORY[0x24BDC0868]();
}

uint64_t FigEndpointStreamGetClassID()
{
  return MEMORY[0x24BDC0878]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

intptr_t dispatch_block_testcancel(dispatch_block_t block)
{
  return MEMORY[0x24BDADD38](block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

