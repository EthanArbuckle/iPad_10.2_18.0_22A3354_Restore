@implementation INIssueSandboxExtensionsForFileURLEnumerableToProcess

uint64_t __INIssueSandboxExtensionsForFileURLEnumerableToProcess_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "isFileURL");
  if ((_DWORD)v4)
  {
    v5 = *(_OWORD *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 32);
    v9 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __INIssueSandboxExtensionToProcess_block_invoke;
    v7[3] = &__block_descriptor_64_e15__16__0__NSURL_8l;
    _INIssueSandboxExtensionWithTokenGeneratorBlock(v3, v7);
  }

  return v4;
}

@end
