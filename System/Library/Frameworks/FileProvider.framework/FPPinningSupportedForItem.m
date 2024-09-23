@implementation FPPinningSupportedForItem

void __FPPinningSupportedForItem_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("NSFileProviderRootContainerItemIdentifier");
  v2[1] = CFSTR("NSFileProviderTrashContainerItemIdentifier");
  v3[0] = MEMORY[0x1E0C9AAB0];
  v3[1] = MEMORY[0x1E0C9AAB0];
  v2[2] = CFSTR("NSFileProviderWorkingSetContainerItemIdentifier");
  v2[3] = CFSTR("NSFileProviderTemporaryLocalFolderItemIdentifier");
  v3[2] = MEMORY[0x1E0C9AAB0];
  v3[3] = MEMORY[0x1E0C9AAB0];
  v2[4] = CFSTR("NSFileProviderAllDirectoriesContainerItemIdentifier");
  v2[5] = CFSTR("NSFileProviderSearchContainerItemIdentifier");
  v3[4] = MEMORY[0x1E0C9AAB0];
  v3[5] = MEMORY[0x1E0C9AAB0];
  v2[6] = CFSTR("a1");
  v3[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FPPinningSupportedForItem_unsupportedIdentifiers;
  FPPinningSupportedForItem_unsupportedIdentifiers = v0;

}

@end
