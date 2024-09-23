@implementation SetProperty

void __hoseSBAR_SetProperty_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, _QWORD, uint64_t);
  int v7;
  uint64_t v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;

  v2 = a1[5];
  v3 = *(_QWORD *)(v2 + 224);
  if (v3)
  {
    v4 = a1[6];
    v5 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
    if (v5)
    {
      v6 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 56);
      if (v6)
        v7 = v6(v3, *MEMORY[0x1E0D49C40], v4);
      else
        v7 = -19225;
    }
    else
    {
      v7 = -19221;
    }
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
    v8 = *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24);
    if ((_DWORD)v8)
    {
      APSLogErrorAt(v8);
      goto LABEL_14;
    }
    v2 = a1[5];
  }
  v9 = *(const void **)(v2 + 256);
  v10 = (const void *)a1[6];
  *(_QWORD *)(v2 + 256) = v10;
  if (v10)
    CFRetain(v10);
  if (v9)
    CFRelease(v9);
  hoseSBAR_setPreferencesOnAudioSession(a1[7], 1);
LABEL_14:
  v11 = (const void *)a1[6];
  if (v11)
    CFRelease(v11);
  v12 = (const void *)a1[7];
  if (v12)
    CFRelease(v12);
}

void __dataSource_SetProperty_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;

  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("PSGDataSource::DevicePSGInfos")))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = dataSource_SetDevicePSGInfoInternal(*(_QWORD *)(a1 + 48), *(const void **)(a1 + 56));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("PSGDataSource::LocalPSGInfo")))
  {
    v2 = *(const void **)(a1 + 56);
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(const void **)(v3 + 24);
    if (v2)
      CFRetain(v2);
    *(_QWORD *)(v3 + 24) = v2;
    if (v4)
      CFRelease(v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12787;
  }
}

@end
