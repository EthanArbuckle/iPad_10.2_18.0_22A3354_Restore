@implementation UITextView(SupportsDynamicallyTogglingAllowsTextAnimations)

+ (uint64_t)ck_supportsDynamicallyTogglingAllowsTextAnimations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__UITextView_SupportsDynamicallyTogglingAllowsTextAnimations__ck_supportsDynamicallyTogglingAllowsTextAnimations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (ck_supportsDynamicallyTogglingAllowsTextAnimations_onceToken != -1)
    dispatch_once(&ck_supportsDynamicallyTogglingAllowsTextAnimations_onceToken, block);
  return ck_supportsDynamicallyTogglingAllowsTextAnimations_supportsToggling;
}

@end
