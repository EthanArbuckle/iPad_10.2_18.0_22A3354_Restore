@implementation EKEventStore(MobileCal)

- (id)colorNamesInRainbowOrder
{
  if (colorNamesInRainbowOrder_onceToken != -1)
    dispatch_once(&colorNamesInRainbowOrder_onceToken, &__block_literal_global_19);
  return (id)colorNamesInRainbowOrder___colorNames;
}

- (id)_uicolorFromString:()MobileCal
{
  CGColorSpace *DeviceRGB;
  CGColorRef v4;
  void *v5;
  int v7;
  uint64_t v8;
  CGFloat components[2];
  double v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v7 = 0;
  sscanf((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), "#%02X%02X%02X", (char *)&v8 + 4, &v8, &v7);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(float64x2_t *)components = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v8, HIDWORD(v8))), (float32x2_t)vdup_n_s32(0x437F0000u)));
  v10 = (float)((float)v7 / 255.0);
  v11 = 0x3FF0000000000000;
  v4 = CGColorCreate(DeviceRGB, components);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(DeviceRGB);
  CFRelease(v4);
  return v5;
}

- (id)symbolicNameToUIColors
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EKEventStore_MobileCal__symbolicNameToUIColors__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = a1;
  if (symbolicNameToUIColors_onceToken != -1)
    dispatch_once(&symbolicNameToUIColors_onceToken, block);
  return (id)symbolicNameToUIColors___symbolicColorMapping;
}

- (id)defaultCalendarColorsInRainbowOrder
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__EKEventStore_MobileCal__defaultCalendarColorsInRainbowOrder__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = a1;
  if (defaultCalendarColorsInRainbowOrder_onceToken != -1)
    dispatch_once(&defaultCalendarColorsInRainbowOrder_onceToken, block);
  return (id)defaultCalendarColorsInRainbowOrder___orderedUIColors;
}

- (uint64_t)colorForCalendar:()MobileCal
{
  return objc_msgSend(a3, "uiColor");
}

- (id)localizedStringForSymbolicColorName:()MobileCal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (localizedStringForSymbolicColorName__onceToken != -1)
    dispatch_once(&localizedStringForSymbolicColorName__onceToken, &__block_literal_global_24);
  objc_msgSend((id)localizedStringForSymbolicColorName____localizedStringMapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)localizedStringForSymbolicColorName____localizedStringMapping, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Custom"), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)stringForColor:()MobileCal
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "symbolicNameForColor:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedStringForSymbolicColorName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)symbolicNameForColor:()MobileCal
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  objc_msgSend(a1, "symbolicNameToUIColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__EKEventStore_MobileCal__symbolicNameForColor___block_invoke;
  v9[3] = &unk_1E60190C0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end
