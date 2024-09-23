@implementation UIView

uint64_t __104__UIView_MKCrossPlatformOperations___maps_setDoesNotTranslateAutoresizingConstraintsForViewsDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

uint64_t __87__UIView_MKCrossPlatformOperations___mapkit_animateWithDuration_animations_completion___block_invoke(uint64_t a1)
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

uint64_t __103__UIView_MKCrossPlatformOperations___mapkit_animateFromCurrentStateWithDuration_animations_completion___block_invoke(uint64_t a1)
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
