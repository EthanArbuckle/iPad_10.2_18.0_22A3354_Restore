@implementation SFWebClipViewController

uint64_t __45___SFWebClipViewController_updateUIAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  objc_msgSend(v2, "generateIconImageForFormat:scale:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setImage:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_textFieldChanged:", 0);
}

uint64_t __61___SFWebClipViewController__showDemoModeFeatureDisabledAlert__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1050) = 0;
  return result;
}

@end
