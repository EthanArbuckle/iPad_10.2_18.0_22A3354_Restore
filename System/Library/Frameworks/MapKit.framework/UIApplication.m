@implementation UIApplication

BOOL __77__UIApplication_MKLookAroundExtras___mklookaround_possiblePrimaryWindowScene__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!objc_msgSend(v2, "activationState") || objc_msgSend(v2, "activationState") == 1))
  {
    objc_msgSend(v2, "screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3 == v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
