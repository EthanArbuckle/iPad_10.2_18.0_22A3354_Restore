@implementation INIssueSandboxExtensionsForFileURLEnumerable

uint64_t __INIssueSandboxExtensionsForFileURLEnumerable_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "isFileURL");
  if ((_DWORD)v3)
    _INIssueSandboxExtensionWithTokenGeneratorBlock(v2, &__block_literal_global_4);

  return v3;
}

@end
