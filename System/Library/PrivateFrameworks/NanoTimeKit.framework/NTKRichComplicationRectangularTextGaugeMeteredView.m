@implementation NTKRichComplicationRectangularTextGaugeMeteredView

- (NTKRichComplicationRectangularTextGaugeMeteredView)init
{
  NTKRichComplicationRectangularTextGaugeMeteredView *v2;
  NTKRichComplicationRectangularTextGaugeMeteredView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularTextGaugeMeteredView;
  v2 = -[NTKRichComplicationRectangularTextGaugeView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NTKRichComplicationRectangularTextGaugeView _enumerateLabelsWithBlock:](v2, "_enumerateLabelsWithBlock:", &__block_literal_global_82);
  return v3;
}

uint64_t __58__NTKRichComplicationRectangularTextGaugeMeteredView_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUppercase:", 0);
}

+ (int64_t)progressFillStyle
{
  return 1;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  objc_msgSend(v6, "headerImageProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerTextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "body1TextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gaugeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationRectangularTextGaugeView _handleTemplateUpdateWithReason:headerViewData:headerImageProvider:headerTextProvider:bodyTextProvider:gaugeProvider:](self, "_handleTemplateUpdateWithReason:headerViewData:headerImageProvider:headerTextProvider:bodyTextProvider:gaugeProvider:", a4, 0, v10, v7, v8, v9);
}

@end
