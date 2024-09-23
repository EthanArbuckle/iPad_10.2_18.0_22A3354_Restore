@implementation CUIKORImageUtils

+ (double)colorBarThickness
{
  return 3.0;
}

+ (id)scaledCalendarInvitationDotForFont:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_calendarColorDotImageForColor:baseSize:font:", v6, v5, 6.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_edgeInsets:scaledByFont:", v5, 1.0, 0.0, 0.5, 3.0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v7, "cuik_imageWithInsets:", v9, v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)scaledCalendarColorDotImageForColor:(id)a3 font:(id)a4
{
  return (id)objc_msgSend(a1, "_calendarColorDotImageForColor:baseSize:font:", a3, a4, 7.5);
}

+ (id)scaledCalendarColorChooserDotImageForColor:(id)a3 font:(id)a4
{
  return (id)objc_msgSend(a1, "_calendarColorDotImageForColor:baseSize:font:", a3, a4, 13.0);
}

+ (id)scaledCalendarColorDotImageForColor_SuggestedEvent:(id)a3 font:(id)a4
{
  return (id)objc_msgSend(a1, "_calendarColorDotImageForColor:baseSize:font:", a3, a4, 10.0);
}

+ (double)occurrencePadding
{
  return 4.0;
}

+ (double)iconToTextPadding
{
  double v2;

  objc_msgSend(a1, "occurrencePadding");
  return v2 + -2.0;
}

+ (id)_calendarColorDotImageForColor:(id)a3 diameter:(double)a4 enabled:(BOOL)a5 adjustWhiteColor:(BOOL)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  BOOL v17;
  BOOL v18;
  _QWORD v19[6];
  double v20;
  double v21;

  v9 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x4010000000;
  v19[4] = 0;
  v19[5] = 0;
  v19[3] = &unk_1B8BDE616;
  v20 = a4;
  v21 = a4;
  v10 = (void *)MEMORY[0x1E0DC3870];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__CUIKORImageUtils__calendarColorDotImageForColor_diameter_enabled_adjustWhiteColor___block_invoke;
  v14[3] = &unk_1E6EB6E10;
  v11 = v9;
  v17 = a5;
  v15 = v11;
  v16 = v19;
  v18 = a6;
  objc_msgSend(v10, "cuik_drawImageWithSize:drawBlock:", v14, v20, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v19, 8);
  return v12;
}

void __85__CUIKORImageUtils__calendarColorDotImageForColor_diameter_enabled_adjustWhiteColor___block_invoke(uint64_t a1, CGContext *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v4 = *(id *)(a1 + 32);
  if (!*(_BYTE *)(a1 + 48))
  {
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.65, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKBlendColorsSourceOver(v8, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  v9 = v4;
  objc_msgSend(v4, "setFill");
  CGContextFillEllipseInRect(a2, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  if (CUIKColorIsWhite(*(void **)(a1 + 32)) && *(_BYTE *)(a1 + 49))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextSetLineWidth(a2, 1.0);
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectInset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 32), 0.5, 0.5);
    objc_msgSend(v7, "setStroke");
    CGContextStrokeEllipseInRect(a2, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));

  }
}

+ (unint64_t)_uniqueDotHashForColor:(id)a3 diameter:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  objc_msgSend(a3, "cuik_getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  return (int)(v9 * 100.0) | ((int)(a4 * 100.0) << 28) | ((int)(v8 * 100.0) << 7) | ((int)(v7 * 100.0) << 14) | ((int)(v6 * 100.0) << 21);
}

+ (id)_calendarColorDotImageForColor:(id)a3 diameter:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = v6;
  if (_calendarColorDotImageForColor_diameter__onceToken == -1)
  {
    if (v6)
      goto LABEL_3;
LABEL_8:
    v12 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  dispatch_once(&_calendarColorDotImageForColor_diameter__onceToken, &__block_literal_global_11);
  if (!v7)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0DC3658], "cuik_systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKAdjustedColorForBackgroundColor(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(a1, "_uniqueDotHashForColor:diameter:", v9, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_calendarColorDotImageForColor_diameter____CachedDotImages, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(a1, "_calendarColorDotImageForColor:diameter:enabled:adjustWhiteColor:", v9, 1, 1, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend((id)_calendarColorDotImageForColor_diameter____CachedDotImages, "setObject:forKey:", v12, v11);
  }

LABEL_9:
  return v12;
}

void __60__CUIKORImageUtils__calendarColorDotImageForColor_diameter___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_calendarColorDotImageForColor_diameter____CachedDotImages;
  _calendarColorDotImageForColor_diameter____CachedDotImages = v0;

}

+ (id)_calendarColorDotImageForColor:(id)a3 baseSize:(double)a4 font:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a5, "cuik_scaledValueForValue:", a4);
  objc_msgSend(a1, "_calendarColorDotImageForColor:diameter:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (UIEdgeInsets)_edgeInsets:(UIEdgeInsets)a3 scaledByFont:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = a4;
  objc_msgSend(v8, "cuik_scaledValueForValue:", top);
  v10 = v9;
  objc_msgSend(v8, "cuik_scaledValueForValue:", left);
  v12 = v11;
  objc_msgSend(v8, "cuik_scaledValueForValue:", bottom);
  v14 = v13;
  objc_msgSend(v8, "cuik_scaledValueForValue:", right);
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

@end
