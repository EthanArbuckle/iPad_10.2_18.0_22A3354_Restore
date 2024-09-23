@implementation UIView

uint64_t __101__UIView_MUXCrossPlatformOperations___mapsui_performImageLoadingTransitionWithAnimations_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __88__UIView_MUXCrossPlatformOperations___mapsui_animateWithDuration_animations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", *(double *)(a1 + 40));
  v2 = (void *)MEMORY[0x1E0CD28B0];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnimationTimingFunction:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

@end
