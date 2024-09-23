@implementation NTKCSeparatorColor

void __NTKCSeparatorColor_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.262745098, 0.262745098, 0.270588235, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DC3658];
  v6 = v1;
  v7[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dynamicColorWithColorsByTraitCollection:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)NTKCSeparatorColor_color;
  NTKCSeparatorColor_color = v4;

}

@end
