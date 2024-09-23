@implementation CMIOExtensionFigCaptureDeviceCopyProperty

void __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  _QWORD v11[7];
  _QWORD v12[7];
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  char v16;

  v2 = dispatch_group_create();
  v13 = 0;
  v14 = (unsigned __int8 *)&v13;
  v15 = 0x2020000000;
  v16 = 1;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "availableProperties"))
    dispatch_group_enter(v2);
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "streams"), "count"))
  {
    v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "streams"), "firstObject");
    if (objc_msgSend(v3, "availableProperties"))
      dispatch_group_enter(v2);
  }
  else
  {
    v3 = 0;
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v5 = objc_msgSend(v4, "availableProperties");
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_2;
  v12[3] = &unk_1E4922278;
  v7 = *(_QWORD *)(a1 + 32);
  v12[5] = &v13;
  v12[6] = v7;
  v12[4] = v2;
  objc_msgSend(v4, "propertyStatesForProperties:reply:", v5, v12);
  if (v3)
  {
    v8 = objc_msgSend(v3, "availableProperties");
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_3;
    v11[3] = &unk_1E4922278;
    v9 = *(_QWORD *)(a1 + 32);
    v11[5] = &v13;
    v11[6] = v9;
    v11[4] = v2;
    objc_msgSend(v3, "propertyStatesForProperties:reply:", v8, v11);
  }
  v10 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v2, v10);
  atomic_store(0, v14 + 24);

  _Block_object_dispose(&v13, 8);
}

void __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_2(uint64_t a1, void *a2)
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if ((v2 & 1) != 0)
  {
    cmioefcd_addSupportedPropertiesWithValue(a2, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if ((v2 & 1) != 0)
  {
    cmioefcd_addSupportedPropertiesWithValue(a2, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

intptr_t __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  intptr_t result;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  intptr_t (*v11)(intptr_t, void *, void *);
  void *v12;
  __int128 v13;
  uint64_t v14;
  int8x16_t v15;
  uint64_t v16;
  uint64_t v17;
  intptr_t (*v18)(intptr_t, void *, void *);
  void *v19;
  __int128 v20;
  uint64_t v21;
  int8x16_t v22;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 16), "availableProperties"), "containsObject:", *(_QWORD *)(a1 + 72));
  v3 = *(void **)(*(_QWORD *)(a1 + 64) + 16);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_5;
    v19 = &unk_1E49222C8;
    v21 = *(_QWORD *)(a1 + 56);
    v22 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    v20 = *(_OWORD *)(a1 + 40);
    v5 = &v16;
    return objc_msgSend(v3, "propertyStatesForProperties:reply:", v4, v5, v9, v10, v11, v12, v13, v14, *(_OWORD *)&v15, v16, v17, v18, v19, v20, v21, *(_OWORD *)&v22);
  }
  result = objc_msgSend((id)objc_msgSend(v3, "streams"), "count");
  if (result)
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 16), "streams"), "firstObject");
    result = objc_msgSend((id)objc_msgSend(v7, "availableProperties"), "containsObject:", *(_QWORD *)(a1 + 72));
    if ((_DWORD)result)
    {
      v4 = *(_QWORD *)(a1 + 32);
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_6;
      v12 = &unk_1E49222C8;
      v14 = *(_QWORD *)(a1 + 56);
      v15 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
      v13 = *(_OWORD *)(a1 + 40);
      v5 = &v9;
      v3 = v7;
      return objc_msgSend(v3, "propertyStatesForProperties:reply:", v4, v5, v9, v10, v11, v12, v13, v14, *(_OWORD *)&v15, v16, v17, v18, v19, v20, v21, *(_OWORD *)&v22);
    }
  }
  v8 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if ((v8 & 1) != 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  return result;
}

intptr_t __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_5(intptr_t result, void *a2, void *a3)
{
  unsigned __int8 v3;
  intptr_t v5;
  CFTypeRef v6;

  v3 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24));
  if ((v3 & 1) != 0)
  {
    v5 = result;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = objc_msgSend(a3, "code");
    v6 = (CFTypeRef)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(v5 + 64)), "value");
    if (v6)
      v6 = CFRetain(v6);
    **(_QWORD **)(v5 + 56) = v6;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v5 + 32));
  }
  return result;
}

intptr_t __CMIOExtensionFigCaptureDeviceCopyProperty_block_invoke_6(intptr_t result, void *a2, void *a3)
{
  unsigned __int8 v3;
  intptr_t v5;
  CFTypeRef v6;

  v3 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24));
  if ((v3 & 1) != 0)
  {
    v5 = result;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = objc_msgSend(a3, "code");
    v6 = (CFTypeRef)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(v5 + 64)), "value");
    if (v6)
      v6 = CFRetain(v6);
    **(_QWORD **)(v5 + 56) = v6;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v5 + 32));
  }
  return result;
}

@end
