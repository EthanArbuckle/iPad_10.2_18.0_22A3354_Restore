@implementation HUGridPlaceholderServiceCellLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HUGridPlaceholderServiceCellLayoutOptions;
  objc_msgSendSuper2(&v8, sel_defaultOptionsForCellSizeSubclass_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowDescription:", 0);
  if (!+[HUGraphicsUtilities shouldReduceVisualEffects](HUGraphicsUtilities, "shouldReduceVisualEffects"))
  {
    v4 = (void *)MEMORY[0x1E0CEABA8];
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectForBlurEffect:style:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVibrancyEffect:", v6);

  }
  return v3;
}

@end
