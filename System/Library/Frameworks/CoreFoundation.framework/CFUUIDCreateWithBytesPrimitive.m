@implementation CFUUIDCreateWithBytesPrimitive

void ____CFUUIDCreateWithBytesPrimitive_block_invoke(uint64_t a1)
{
  _OWORD *v2;
  const void *Value;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFDictionary *v7;
  CFDictionaryValueCallBacks v8;
  CFDictionaryKeyCallBacks keyCallBacks;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (_OWORD *)(a1 + 48);
  Value = (const void *)_uniquedUUIDs;
  if (_uniquedUUIDs)
    Value = CFDictionaryGetValue((CFDictionaryRef)_uniquedUUIDs, v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Value;
  v4 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v4)
  {
    if (!*(_BYTE *)(a1 + 64))
      CFRetain(v4);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _CFRuntimeCreateInstance(*(__objc2_class ***)(a1 + 40), 0x22uLL, 16, 0);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (!v5)
      return;
    *(_OWORD *)(v5 + 16) = *v2;
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    memset(&keyCallBacks, 0, 32);
    *(_OWORD *)&keyCallBacks.equal = xmmword_1E1332F80;
    *(_OWORD *)&v8.version = xmmword_1E1332F90;
    *(_OWORD *)&v8.release = unk_1E1332FA0;
    v8.equal = CFEqual;
    v7 = (__CFDictionary *)_uniquedUUIDs;
    if (!_uniquedUUIDs)
    {
      v7 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &keyCallBacks, &v8);
      _uniquedUUIDs = (uint64_t)v7;
    }
    CFDictionarySetValue(v7, (const void *)(v6 + 16), (const void *)v6);
  }
  if (*(_BYTE *)(a1 + 64))
    __CFRuntimeSetRC(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0);
}

@end
