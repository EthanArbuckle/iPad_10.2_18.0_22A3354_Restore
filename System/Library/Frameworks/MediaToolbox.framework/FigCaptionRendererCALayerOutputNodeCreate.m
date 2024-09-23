@implementation FigCaptionRendererCALayerOutputNodeCreate

void __FigCaptionRendererCALayerOutputNodeCreate_block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_alloc_init(FigFCRCALayerOutputNodeLayer);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
