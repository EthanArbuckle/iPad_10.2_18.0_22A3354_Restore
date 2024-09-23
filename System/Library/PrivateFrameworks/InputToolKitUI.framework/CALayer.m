@implementation CALayer

void __55__CALayer_ITKUtilities__itk_autoFadeOutShapePointLayer__block_invoke(uint64_t a1)
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
  v4[2] = __55__CALayer_ITKUtilities__itk_autoFadeOutShapePointLayer__block_invoke_2;
  v4[3] = &unk_250FA1030;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setCompletionBlock:", v4);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

void __55__CALayer_ITKUtilities__itk_autoFadeOutShapePointLayer__block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  itk_dispatchMainAfterDelay();

}

uint64_t __55__CALayer_ITKUtilities__itk_autoFadeOutShapePointLayer__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

@end
