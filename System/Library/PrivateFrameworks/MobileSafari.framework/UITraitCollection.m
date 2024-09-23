@implementation UITraitCollection

void __77__UITraitCollection_MobileSafariExtras__safari_traitsAffectingTextAppearance__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safari_traitsAffectingTextAppearance_traits;
  safari_traitsAffectingTextAppearance_traits = v0;

}

void __76__UITraitCollection_MobileSafariExtras__safari_traitsAffectingVisualEffects__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safari_traitsAffectingVisualEffects_traits;
  safari_traitsAffectingVisualEffects_traits = v0;

}

@end
