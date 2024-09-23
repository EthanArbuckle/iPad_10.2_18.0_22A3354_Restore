@implementation CNiOSABWithWallpaperMetadataContactPredicate

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  void *v7;
  id v8;
  void *v9;
  __CFArray *v10;

  v7 = (void *)MEMORY[0x1E0CF5D88];
  v8 = a4;
  objc_msgSend(v7, "predicateForContactsWithWallpaperMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortOrder");

  v10 = (__CFArray *)ABAddressBookCopyAllPeopleForBufferPredicate();
  return v10;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CF5D88], "predicateForContactsWithWallpaperMetadata", a3, a4, a5);
}

@end
