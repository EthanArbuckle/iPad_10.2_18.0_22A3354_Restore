@implementation UIKeyCommand

uint64_t __57__UIKeyCommand_DOCEExtension__doc_isCancellingKeyCommand__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "doc_isShortcutEqualToKeyCommand:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__UIKeyCommand_DOCEExtension__doc_isDismissingKeyCommand__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "doc_isShortcutEqualToKeyCommand:", *(_QWORD *)(a1 + 32));
}

@end
