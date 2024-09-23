@implementation BRTrashExternalDocumentReference

void __BRTrashExternalDocumentReference_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/Mobile Documents/%@/"), CFSTR("com~apple~SharedDocs"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BRTrashExternalDocumentReference_sharedDocsContainerPartialPath;
  BRTrashExternalDocumentReference_sharedDocsContainerPartialPath = v0;

}

@end
