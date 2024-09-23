@implementation UIApplication(MKLookAroundExtras)

- (id)_mklookaround_possiblePrimaryWindowScene
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "connectedScenes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_55);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "filteredSetUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_mklookaround_possibleWindowForControllingOverallAppearance
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_mklookaround_possiblePrimaryWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "_findWindowForControllingOverallAppearanceInWindowScene:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
