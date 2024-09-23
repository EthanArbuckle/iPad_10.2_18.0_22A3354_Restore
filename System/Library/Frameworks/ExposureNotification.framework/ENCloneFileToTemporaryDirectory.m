@implementation ENCloneFileToTemporaryDirectory

uint64_t __ENCloneFileToTemporaryDirectory_block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __ENCloneFileToTemporaryDirectory_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result != -1)
    return sandbox_extension_release();
  return result;
}

@end
