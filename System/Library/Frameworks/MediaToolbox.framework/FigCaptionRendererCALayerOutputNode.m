@implementation FigCaptionRendererCALayerOutputNode

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_AddChildNode_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  const void *v4;
  const void *v5;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
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

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_RemoveChildNode_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "removeFromSuperlayer");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_RemoveAllChildNodes_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setSublayers:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetPosition_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetSize_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetClipToBounds_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setMasksToBounds:", *(_BYTE *)(a1 + 40) != 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetContent_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;
  const void *v4;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
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

uint64_t __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_BeginScene_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
}

uint64_t __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_EndScene_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetCornerRadius_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setCornerRadius:", *(double *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetWindowOpacity_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setWindowOpacity:", *(double *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetOptions_block_invoke(_QWORD *a1)
{
  uint64_t DerivedStorage;
  const void *v3;
  const void *v4;
  const void *v5;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setNodeOptions:forKeyPath:", a1[5], a1[6]);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = (const void *)a1[4];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[6];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[5];
  if (v5)
    CFRelease(v5);
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetSeparated_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(DerivedStorage + 8), "setNodeSeparated:", *(_BYTE *)(a1 + 40) != 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

@end
