@implementation ZN8Security11CodeSigning11Requirement11Interpreter18appleLocalAnchoredEv

const void **___ZN8Security11CodeSigning11Requirement11Interpreter18appleLocalAnchoredEv_block_invoke(Security *a1, uint64_t a2)
{
  io_registry_entry_t v2;
  io_object_t v3;
  const __CFAllocator *v4;
  const char *BytePtr;
  CFIndex Length;
  CFTypeRef v7;
  const __CFArray *Value;
  CFTypeID v9;
  uint64_t v10;
  const void **result;
  _QWORD context[5];
  const void *v13;
  CFDataRef theData;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  const void **(*v19)(uint64_t);
  CFMutableArrayRef CFMutableArray;
  CFRange v21;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3002000000;
  v18 = __Block_byref_object_copy__14572;
  v19 = __Block_byref_object_dispose__14573;
  CFMutableArray = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
  CFMutableArray = Security::makeCFMutableArray(a1, a2);
  v2 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
  v3 = v2;
  if (!v2)
    goto LABEL_10;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  theData = (CFDataRef)IORegistryEntryCreateCFProperty(v2, CFSTR("AMFITrustedKeys"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  IOObjectRelease(v3);
  if (!theData)
    goto LABEL_9;
  BytePtr = (const char *)CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v7 = IOCFUnserializeWithSize(BytePtr, Length, v4, 0, 0);
  v13 = v7;
  if (!v7
    || (Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("trustedKeys"))) == 0
    && (v9 = CFGetTypeID(0), v9 != CFArrayGetTypeID()))
  {
    Security::CFRef<__CFDictionary const*>::~CFRef(&v13);
LABEL_9:
    Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
    goto LABEL_10;
  }
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 0x40000000;
  context[2] = ___ZN8Security11CodeSigning11Requirement11Interpreter27getAdditionalTrustedAnchorsEv_block_invoke;
  context[3] = &unk_1E1FDCD98;
  context[4] = &v15;
  v21.length = CFArrayGetCount(Value);
  v21.location = 0;
  CFArrayApplyFunction(Value, v21, (CFArrayApplierFunction)Security::cfarrayApplyBlock_func, context);
  Security::CFRef<__CFDictionary const*>::~CFRef(&v13);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
  if (!CFArrayGetCount((CFArrayRef)v16[5]))
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = v16[5];
  v16[5] = 0;
LABEL_11:
  _Block_object_dispose(&v15, 8);
  result = Security::CFRef<__CFArray *>::~CFRef((const void **)&CFMutableArray);
  Security::CodeSigning::Requirement::Interpreter::appleLocalAnchored(void)::additionalTrustedCertificates = v10;
  return result;
}

@end
