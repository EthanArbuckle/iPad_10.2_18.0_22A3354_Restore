@implementation FCCCAnimator

uint64_t __35___FCCCAnimator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
  return result;
}

uint64_t __35___FCCCAnimator_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

@end
