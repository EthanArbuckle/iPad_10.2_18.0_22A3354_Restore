@implementation FigCaptionRendererCALayerOutput

uint64_t __FigCaptionRendererCALayerOutput_Finalize_block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");

  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

@end
