@implementation UILabel(FocusUI)

+ (void)fcui_layoutPrimaryLabel:()FocusUI secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:
{
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  CGRect v32;

  v31 = a6;
  v17 = a7;
  v18 = a10;
  if (v31 && a8)
  {
    v19 = objc_msgSend(v31, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, v18, a1, a2, a3, 1.79769313e308);
    objc_msgSend(v31, "fcui_drawingHeightWithNumberOfLines:", v19);
    objc_msgSend(v17, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      objc_msgSend(v31, "fcui_measuringHeightWithNumberOfLines:", v19);
      v22 = objc_msgSend(v17, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, v18, a1, a2, a3, 1.79769313e308);
      objc_msgSend(v17, "fcui_measuringHeightWithNumberOfLines:", v22);
      UIRectCenteredYInRect();
      CGRectGetMaxY(v32);
      objc_msgSend(v17, "fcui_drawingHeightWithNumberOfLines:", v22);
      UIRectCenteredIntegralRectScale();
      if (a9)
      {
        *a9 = v23;
        a9[1] = v24;
        a9[2] = v25;
        a9[3] = v26;
      }
    }
    UIRectCenteredIntegralRectScale();
    *a8 = v27;
    a8[1] = v28;
    a8[2] = v29;
    a8[3] = v30;
  }

}

- (uint64_t)fcui_numberOfLinesInFrame:()FocusUI maximum:drawingContext:
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v14 = a8;
  objc_msgSend(a1, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "fcui_numberOfLinesForText:inFrame:maximum:drawingContext:", v16, a7, v14, a2, a3, a4, a5);

  return v17;
}

- (double)fcui_measuringHeightWithNumberOfLines:()FocusUI
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fcui_measuringHeightForText:withNumberOfLines:", v6, a3);
  v8 = v7;

  return v8;
}

- (double)fcui_drawingHeightWithNumberOfLines:()FocusUI
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fcui_drawingHeightForText:withNumberOfLines:additionalPadding:", v6, a3, 2.0);
  v8 = v7;

  return v8;
}

@end
