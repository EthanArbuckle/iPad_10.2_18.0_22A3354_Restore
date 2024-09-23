@implementation FigCDSCALayerOutputNode

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_AddChildNode_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  const void *v4;
  const void *v5;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "addSublayer:", *(_QWORD *)(v3 + 8));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 32);
  if (v5)
    CFRelease(v5);
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_RemoveChildNode_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "removeFromSuperlayer");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_RemoveAllChildNodes_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setSublayers:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_SetPosition_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_SetSize_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_SetContent_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;
  const void *v4;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setContents:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

@end
