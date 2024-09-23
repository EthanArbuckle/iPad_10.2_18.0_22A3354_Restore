@implementation NTKRichComplicationCornerSegmentedGaugeImageView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (int64_t)progressFillStyle
{
  return 7;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  objc_msgSend(v6, "imageProvider");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCornerGaugeImageView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageProvider:reason:", v17, a4);

  objc_msgSend(v6, "gaugeProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingTextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationCornerBaseGaugeView handleGaugeProvider:leftTextProvider:rightTextProvider:](self, "handleGaugeProvider:leftTextProvider:rightTextProvider:", v8, v9, 0);
  -[CDRichComplicationCornerBaseGaugeView leftLabel](self, "leftLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pointSize");
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v13, *MEMORY[0x1E0DC1438]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "CLKFontWithAlternativePunctuation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationCornerBaseGaugeView leftLabel](self, "leftLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v15);

}

- (double)_progressViewHorizontalPaddingInRadius
{
  double result;

  CLKDegreesToRadians();
  return result;
}

@end
