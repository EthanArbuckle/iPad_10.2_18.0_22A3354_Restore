@implementation C3DProgramHashCodeCreate

void __C3DProgramHashCodeCreate_block_invoke_2(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  CFTypeRef v4;
  CFTypeRef v5;
  id v6;
  id v7;
  CFTypeRef v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)s_ProgramHashCodeDictionary, *(const void **)(a1 + 48));
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFRetain(v2);
  }
  else
  {
    if (C3DProgramHashCodeGetTypeID_onceToken != -1)
      dispatch_once(&C3DProgramHashCodeGetTypeID_onceToken, &__block_literal_global_109);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = C3DTypeCreateInstance_(C3DProgramHashCodeGetTypeID_typeID, 0x118uLL);
    memcpy((void *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 16), (const void *)(*(_QWORD *)(a1 + 56) + 16), 0x108uLL);
    v3 = *(_QWORD *)(a1 + 56);
    *(_OWORD *)(v3 + 16) = 0u;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
    *(_OWORD *)(v3 + 80) = 0u;
    *(_OWORD *)(v3 + 96) = 0u;
    *(_OWORD *)(v3 + 112) = 0u;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_OWORD *)(v3 + 160) = 0u;
    *(_OWORD *)(v3 + 176) = 0u;
    *(_OWORD *)(v3 + 192) = 0u;
    *(_OWORD *)(v3 + 208) = 0u;
    *(_OWORD *)(v3 + 224) = 0u;
    *(_OWORD *)(v3 + 240) = 0u;
    *(_OWORD *)(v3 + 256) = 0u;
    *(_QWORD *)(v3 + 272) = 0;
    v4 = *(CFTypeRef *)(a1 + 48);
    v5 = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 280);
    if (v5 != v4)
    {
      if (v5)
      {
        CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 280));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 280) = 0;
        v4 = *(CFTypeRef *)(a1 + 48);
      }
      if (v4)
        v4 = CFRetain(v4);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 280) = v4;
    }
    if (C3DStandardShadersUseFunctionConstants())
    {
      v6 = SCNCreateFuntionConstants(*(_QWORD **)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88) + 4, ((unint64_t)**(unsigned __int16 **)(a1 + 88) >> 7), *(_WORD **)(a1 + 88), *(_QWORD *)(a1 + 96));
      v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 288);
      if (v7 != v6)
      {
        if (v7)
        {
          CFRelease(v7);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 288) = 0;
        }
        if (v6)
          v8 = CFRetain(v6);
        else
          v8 = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 288) = v8;
      }
      CFRelease(v6);
    }
    CFDictionarySetValue((CFMutableDictionaryRef)s_ProgramHashCodeDictionary, *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
}

dispatch_queue_t __C3DProgramHashCodeCreate_block_invoke()
{
  dispatch_queue_t result;

  s_ProgramHashCodeDictionary = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
  result = dispatch_queue_create("com.apple.scenekit.programHashCodeQueue", 0);
  s_ProgramHashCodeDictionaryQueue = (uint64_t)result;
  return result;
}

@end
