@implementation CAMShutterButton

uint64_t __62__CAMShutterButton_CKActionMenuItemView__setEnabled_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setShowDisabled:", *(_BYTE *)(a1 + 40) == 0);
}

@end
