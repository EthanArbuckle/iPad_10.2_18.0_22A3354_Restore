@implementation MRMediaRemoteCommandInfoCopySupportedCommandsWithPredicate

uint64_t __MRMediaRemoteCommandInfoCopySupportedCommandsWithPredicate_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a3);
  return result;
}

@end
