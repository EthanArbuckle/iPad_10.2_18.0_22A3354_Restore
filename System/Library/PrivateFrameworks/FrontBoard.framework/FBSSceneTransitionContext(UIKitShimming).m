@implementation FBSSceneTransitionContext(UIKitShimming)

- (id)_uiApplicationSceneTransitionContextShim
{
  id v2;

  if (objc_msgSend(a1, "_uikitShimming_isUISubclass"))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (uint64_t)_uikitShimming_isUISubclass
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "isUISubclass");
  else
    return 0;
}

@end
