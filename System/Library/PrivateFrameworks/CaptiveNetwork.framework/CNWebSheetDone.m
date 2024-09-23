@implementation CNWebSheetDone

BOOL __CNWebSheetDone_block_invoke(uint64_t a1)
{
  return ServerConnectionProvideResponse(*(_QWORD *)G_websheet, *(CFPropertyListRef *)(a1 + 32));
}

@end
