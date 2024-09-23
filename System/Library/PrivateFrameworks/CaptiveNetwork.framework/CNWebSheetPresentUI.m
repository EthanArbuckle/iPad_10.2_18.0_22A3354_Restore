@implementation CNWebSheetPresentUI

void __CNWebSheetPresentUI_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(G_websheet + 16))(*(_QWORD *)(G_websheet + 24), *(_QWORD *)(a1 + 32), 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
