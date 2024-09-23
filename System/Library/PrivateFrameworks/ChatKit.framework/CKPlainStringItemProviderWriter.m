@implementation CKPlainStringItemProviderWriter

+ (id)writableTypeIdentifiersForItemProvider
{
  if (writableTypeIdentifiersForItemProvider_onceToken != -1)
    dispatch_once(&writableTypeIdentifiersForItemProvider_onceToken, &__block_literal_global_43);
  return (id)writableTypeIdentifiersForItemProvider_sTypeIdentifiers;
}

void __73__CKPlainStringItemProviderWriter_writableTypeIdentifiersForItemProvider__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)writableTypeIdentifiersForItemProvider_sTypeIdentifiers;
  writableTypeIdentifiersForItemProvider_sTypeIdentifiers = v1;

}

@end
