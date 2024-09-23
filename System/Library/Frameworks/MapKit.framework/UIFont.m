@implementation UIFont

void __42__UIFont_MKExtras___mapkit_ax3TextEnabled__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB3C8];
  v3[0] = *MEMORY[0x1E0CEB3D0];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0CEB3C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_133;
  _MergedGlobals_133 = v1;

}

void __52__UIFont_MKExtras___mapkit_accessibilityTextEnabled__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB3D8];
  v4[0] = *MEMORY[0x1E0CEB3E0];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0CEB3C8];
  v4[2] = *MEMORY[0x1E0CEB3D0];
  v4[3] = v1;
  v4[4] = *MEMORY[0x1E0CEB3C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECE2D8F8;
  qword_1ECE2D8F8 = v2;

}

void __107__UIFont_MKCrossPlatformExtras___mapkit_scaledValueForValue_scalingForMacIdiom_respectingTraitEnvironment___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  qword_1ECE2D940 = objc_msgSend(v0, "userInterfaceIdiom");

}

@end
