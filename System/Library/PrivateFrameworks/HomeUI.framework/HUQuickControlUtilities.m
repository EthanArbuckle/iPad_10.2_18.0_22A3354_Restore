@implementation HUQuickControlUtilities

+ (unint64_t)quickControlStepperViewSizeForViewSizeSubclass:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = &unk_1E7040738;
  v7[1] = &unk_1E7040768;
  v8[0] = &unk_1E7040750;
  v8[1] = &unk_1E7040780;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HUConstantIntegerForViewSizeSubclass(a3, v4);

  return v5;
}

+ (unint64_t)sliderQuickControlSizeForViewSizeSubclass:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = &unk_1E7040738;
  v7[1] = &unk_1E7040768;
  v8[0] = &unk_1E7040750;
  v8[1] = &unk_1E7040798;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HUConstantIntegerForViewSizeSubclass(a3, v4);

  return v5;
}

+ (unint64_t)iconSizeForQuickControlSize:(unint64_t)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 == 1)
    v3 = 3;
  if (a3)
    return v3;
  else
    return 4;
}

+ (id)backgroundColorForUserInterfaceStyle:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor", a3);
}

+ (BOOL)shouldAlwaysDisplayQuickControlAsSwitch:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = qword_1ED580A88;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED580A88, &__block_literal_global_51);
  objc_msgSend(v4, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "primaryServiceDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend((id)_MergedGlobals_617, "containsObject:", v7);
  return (char)v6;
}

void __67__HUQuickControlUtilities_shouldAlwaysDisplayQuickControlAsSwitch___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB9B08];
  v3[0] = *MEMORY[0x1E0CB9AD8];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_617;
  _MergedGlobals_617 = v1;

}

+ (BOOL)shouldDisplayQuickControlAsPushButton:(id)a3 preferredControl:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;

  v5 = a3;
  objc_msgSend(v5, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryServiceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9AF0]) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_class(), "shouldAlwaysDisplayQuickControlAsSwitch:", v5) ^ 1;
    if (a4 == 1)
      v9 = v10;
    else
      v9 = 0;
  }

  return v9;
}

@end
