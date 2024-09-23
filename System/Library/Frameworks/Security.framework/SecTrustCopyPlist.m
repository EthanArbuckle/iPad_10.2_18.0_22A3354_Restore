@implementation SecTrustCopyPlist

void __SecTrustCopyPlist_block_invoke(uint64_t a1)
{
  const void *v2;
  CFMutableArrayRef v3;
  CFMutableArrayRef v4;
  const void *v5;
  CFMutableArrayRef v6;
  CFMutableArrayRef v7;
  uint64_t v8;
  const __CFArray *v9;
  CFTypeID v10;
  CFIndex Count;
  CFMutableArrayRef Mutable;
  _QWORD *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  CFMutableArrayRef v19;
  CFMutableArrayRef v20;
  _QWORD *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  CFNumberRef v25;
  CFNumberRef v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *v30;
  CFRange v31;

  v2 = *(const void **)(*(_QWORD *)(a1 + 40) + 16);
  if (v2)
  {
    v3 = SecCertificateArraySerialize(v2);
    if (v3)
    {
      v4 = v3;
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("certificates"), v3);
      CFRelease(v4);
    }
  }
  v5 = *(const void **)(*(_QWORD *)(a1 + 40) + 24);
  if (v5)
  {
    v6 = SecCertificateArraySerialize(v5);
    if (v6)
    {
      v7 = v6;
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("anchors"), v6);
      CFRelease(v7);
    }
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(const __CFArray **)(v8 + 32);
  if (v9)
  {
    v10 = CFGetTypeID(*(CFTypeRef *)(v8 + 32));
    if (v10 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount(v9);
      Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
      v31.location = 0;
      v31.length = Count;
      CFArrayApplyFunction(v9, v31, (CFArrayApplierFunction)serializePolicy, Mutable);
      if (Mutable)
      {
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("policies"), Mutable);
        CFRelease(Mutable);
      }
    }
  }
  v13 = *(_QWORD **)(a1 + 40);
  v14 = (const void *)v13[5];
  if (v14)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("responses"), v14);
    v13 = *(_QWORD **)(a1 + 40);
  }
  v15 = (const void *)v13[6];
  if (v15)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("scts"), v15);
    v13 = *(_QWORD **)(a1 + 40);
  }
  v16 = (const void *)v13[7];
  if (v16)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("trustedLogs"), v16);
    v13 = *(_QWORD **)(a1 + 40);
  }
  v17 = (const void *)v13[8];
  if (v17)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("verifyDate"), v17);
    v13 = *(_QWORD **)(a1 + 40);
  }
  v18 = (const void *)v13[9];
  if (v18)
  {
    v19 = SecCertificateArraySerialize(v18);
    if (v19)
    {
      v20 = v19;
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("chain"), v19);
      CFRelease(v20);
    }
  }
  v21 = *(_QWORD **)(a1 + 40);
  v22 = (const void *)v21[11];
  if (v22)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("details"), v22);
    v21 = *(_QWORD **)(a1 + 40);
  }
  v23 = (const void *)v21[12];
  if (v23)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("info"), v23);
    v21 = *(_QWORD **)(a1 + 40);
  }
  v24 = (const void *)v21[13];
  if (v24)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("exceptions"), v24);
    v21 = *(_QWORD **)(a1 + 40);
  }
  v25 = CFNumberCreate(0, kCFNumberSInt32Type, v21 + 14);
  if (v25)
  {
    v26 = v25;
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("result"), v25);
    CFRelease(v26);
  }
  v27 = (const void *)*MEMORY[0x1E0C9AE40];
  v28 = (const void *)*MEMORY[0x1E0C9AE50];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 116))
    v29 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v29 = (const void *)*MEMORY[0x1E0C9AE40];
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("anchorsOnly"), v29);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 117))
    v30 = v28;
  else
    v30 = v27;
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), CFSTR("keychainsAllowed"), v30);
}

@end
