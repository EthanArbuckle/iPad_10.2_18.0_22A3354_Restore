@implementation NTKAllExtendedSignatureCircularTypes

void __NTKAllExtendedSignatureCircularTypes_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  NTKAllSignatureCircularTypes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "addIndex:", 14);
  objc_msgSend(v3, "addIndex:", 45);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v3);
  v2 = (void *)NTKAllExtendedSignatureCircularTypes_results;
  NTKAllExtendedSignatureCircularTypes_results = v1;

}

@end
