@implementation UIView

uint64_t __47__UIView_ITKUtilities__itk_setHidden_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setItk_alpha:", v1);
}

uint64_t __47__UIView_ITKUtilities__itk_setHidden_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 40));
}

void __66__UIView_ITKUtilities__itk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.5);
  LODWORD(v2) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v2);
  v3 = (void *)MEMORY[0x24BDE57D8];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__UIView_ITKUtilities__itk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_2;
  v4[3] = &unk_250FA1030;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setCompletionBlock:", v4);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

void __66__UIView_ITKUtilities__itk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  itk_dispatchMainAfterDelay();

}

uint64_t __66__UIView_ITKUtilities__itk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

uint64_t __71__UIView_ITKUtilities__itk_renderImageFromViewBackingStoreWithSubrect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  ITKMultiplyPointScalar();
  return objc_msgSend(*(id *)(a1 + 32), "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

@end
