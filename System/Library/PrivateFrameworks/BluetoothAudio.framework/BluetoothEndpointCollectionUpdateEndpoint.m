@implementation BluetoothEndpointCollectionUpdateEndpoint

void __BluetoothEndpointCollectionUpdateEndpoint_block_invoke(uint64_t a1)
{
  const void **EntryForDescription;
  _QWORD *v3;
  const void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, CFTypeRef, _QWORD);
  CFTypeRef cf;
  CFIndex v8;

  v8 = -1;
  EntryForDescription = (const void **)collection_findEntryForDescription(*(_QWORD *)(a1 + 40), *(const __CFDictionary **)(a1 + 48), &v8);
  if (EntryForDescription)
  {
    BluetoothEndpointUpdateWithDescription(*EntryForDescription, *(const __CFDictionary **)(a1 + 48), *(_BYTE **)(a1 + 56));
  }
  else
  {
    cf = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = BluetoothEndpointCreateWithDescription((const __CFAllocator *)*MEMORY[0x24BDBD240], *(const __CFDictionary **)(a1 + 48), &cf);
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v3 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
      if (v3)
      {
        v4 = v3;
        *v3 = CFRetain(cf);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 40) + 32), v4);
        v5 = *(_QWORD *)(a1 + 40);
        v6 = *(void (**)(uint64_t, CFTypeRef, _QWORD))(v5 + 8);
        if (v6)
          v6(v5, cf, *(_QWORD *)(v5 + 24));
        **(_BYTE **)(a1 + 56) = 1;
      }
      else
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12786;
      }
      if (cf)
        CFRelease(cf);
    }
  }
}

@end
