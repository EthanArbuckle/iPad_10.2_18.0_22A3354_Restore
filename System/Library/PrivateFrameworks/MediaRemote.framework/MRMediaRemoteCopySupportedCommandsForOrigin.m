@implementation MRMediaRemoteCopySupportedCommandsForOrigin

uint64_t __MRMediaRemoteCopySupportedCommandsForOrigin_block_invoke(uint64_t a1, CFTypeRef cf)
{
  if (cf)
    CFRetain(cf);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
