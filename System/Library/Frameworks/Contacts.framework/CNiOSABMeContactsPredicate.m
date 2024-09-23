@implementation CNiOSABMeContactsPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CF5D88], "predicateForMeContact", a3, a4, a5);
}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  __CFArray *v7;
  void *values;

  values = (void *)ABAddressBookCopyMe();
  if (!values)
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  CFRelease(values);
  return v7;
}

@end
