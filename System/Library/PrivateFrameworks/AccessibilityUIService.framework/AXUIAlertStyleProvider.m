@implementation AXUIAlertStyleProvider

+ (id)styleProvider
{
  return (id)objc_opt_new();
}

- (NSBundle)bundle
{
  NSBundle *bundle;
  NSBundle *v4;
  NSBundle *v5;

  bundle = self->_bundle;
  if (!bundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bundle;
    self->_bundle = v4;

    bundle = self->_bundle;
  }
  return bundle;
}

- (int)alertBackgroundStyleForType:(unint64_t)a3
{
  if (a3 > 7)
    return 0;
  else
    return dword_215E411A8[a3];
}

- (double)alertBackgroundCornerRadiusForType:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 1)
    result = 10.0;
  if (!a3)
    return 6.0;
  return result;
}

- (CGSize)alertBackgroundSizeForType:(unint64_t)a3
{
  double Width;
  double v4;
  void *v5;
  NSString *v6;
  NSComparisonResult v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  CGSize result;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  Width = *(double *)&AXUIAlertSizeMetricFitting;
  v4 = *(double *)&AXUIAlertSizeMetricFitting;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredContentSizeCategory");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x24BDF76A0]);

      if (v7 == NSOrderedDescending)
      {
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77F0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_scaledValueForValue:", 155.0);
        v10 = v9;

        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        v13 = v12;

        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bounds");
        v16 = v15;

        Width = fmin(v10, fmin(v13, v16));
      }
      else
      {
        Width = 155.0;
      }
      goto LABEL_10;
    case 1uLL:
    case 5uLL:
      break;
    case 2uLL:
    case 4uLL:
      Width = *(double *)&AXUIAlertSizeMetricFillingContainer;
      v4 = 44.0;
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_scaledValueForValue:", 100.0);
      v23 = v22;

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      v26 = v25 * 0.5;

      v4 = fmin(v26, v23);
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      Width = CGRectGetWidth(v35);
      goto LABEL_8;
    case 6uLL:
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v29 = v28 * 0.5;

      v4 = fmin(v29, 150.0);
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v30 = CGRectGetWidth(v36);
      Width = v30 / 3.0 + v30 / 3.0;
      goto LABEL_8;
    case 7uLL:
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v19 = v18 * 0.5;

      v4 = fmin(v19, 100.0);
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      Width = CGRectGetWidth(v34) * 0.5 * 1.8;
LABEL_8:

      break;
    default:
LABEL_10:
      v4 = Width;
      break;
  }
  v31 = Width;
  v32 = v4;
  result.height = v32;
  result.width = v31;
  return result;
}

- (BOOL)alertShouldGrowInAxis:(int64_t)a3 forType:(unint64_t)a4
{
  BOOL v4;

  if (((1 << a4) & 0xD5) != 0)
    v4 = a3 == 1;
  else
    v4 = a4 == 1;
  return a4 <= 7 && v4;
}

- (UIEdgeInsets)alertContentEdgeInsetsForType:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  if (a3 <= 7)
    v3 = dbl_215E411C8[a3];
  v4 = v3;
  v5 = v3;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)alertTextFontForType:(unint64_t)a3
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;

  v3 = 0;
  v4 = 0.0;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77F0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v5;
      v6 = 18.0;
      goto LABEL_4;
    case 1uLL:
    case 2uLL:
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v5;
      v6 = 14.0;
LABEL_4:
      objc_msgSend(v5, "_scaledValueForValue:", v6);
      v4 = v7;
      break;
    case 3uLL:
      v8 = (void *)MEMORY[0x24BDF6A78];
      v9 = (_QWORD *)MEMORY[0x24BDF77D8];
      goto LABEL_8;
    case 6uLL:
      v8 = (void *)MEMORY[0x24BDF6A78];
      v9 = (_QWORD *)MEMORY[0x24BDF77F0];
      goto LABEL_8;
    case 7uLL:
      v8 = (void *)MEMORY[0x24BDF6A78];
      v9 = (_QWORD *)MEMORY[0x24BDF77F8];
LABEL_8:
      objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v9, 0x8000, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(v10, "pointSize");
      objc_msgSend(v11, "fontWithDescriptor:size:", v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pointSize");
      v4 = v12;

      break;
    default:
      break;
  }
  objc_msgSend(v3, "fontWithSize:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)alertTextColorForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v5 = 0;
  if (a3 && a3 != 6)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (double)alertTextLineHeightOffsetForType:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (((a3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0)
    return -1.0;
  return result;
}

- (id)alertSubtitleTextFontForType:(unint64_t)a3
{
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[AXUIAlertStyleProvider alertTextFontForType:](self, "alertTextFontForType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)MEMORY[0x24BDF7808];
  if (a3 == 3 || a3 == 6)
    goto LABEL_5;
  if (a3 == 7)
  {
    v5 = (_QWORD *)MEMORY[0x24BDF7820];
LABEL_5:
    objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v5, 0x8000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(v6, "pointSize");
    objc_msgSend(v7, "fontWithDescriptor:size:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

- (id)alertSubtitleTextColorForType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  -[AXUIAlertStyleProvider alertTextColorForType:](self, "alertTextColorForType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 6 < 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:

    v4 = (void *)v5;
    return v4;
  }
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.8);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = v6;
    goto LABEL_5;
  }
  return v4;
}

- (double)alertSubtitleTextVerticalSpacingHeightWithTextForType:(unint64_t)a3
{
  return 3.0;
}

- (UIEdgeInsets)alertIconImageEdgeInsetsForType:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 4.0;
  v4 = 4.0;
  v5 = 4.0;
  v6 = 9.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)alertEdgeInsetsForType:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (a3 == 4)
  {
    v3 = 9.0;
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
  }
  else
  {
    v4 = *MEMORY[0x24BDF7718];
    v5 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v3 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v6 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  result.right = v6;
  result.bottom = v3;
  result.left = v5;
  result.top = v4;
  return result;
}

- (int)alertPositionForType:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 0;
  else
    return dword_215E41208[a3 - 1];
}

- (double)alertFadeAnimationDurationForType:(unint64_t)a3
{
  return 0.3;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
