@implementation MBOpenLogFile

uint64_t __MBOpenLogFile_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
}

uint64_t __MBOpenLogFile_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
