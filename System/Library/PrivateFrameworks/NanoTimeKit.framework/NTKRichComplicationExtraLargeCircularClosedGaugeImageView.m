@implementation NTKRichComplicationExtraLargeCircularClosedGaugeImageView

- (NTKRichComplicationExtraLargeCircularClosedGaugeImageView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularClosedGaugeImageView;
  return -[NTKRichComplicationCircularClosedGaugeContentView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationExtraLargeCircularClosedGaugeImageView;
  v6 = a3;
  -[NTKRichComplicationCircularClosedGaugeContentView _handleTemplate:reason:](&v9, sel__handleTemplate_reason_, v6, a4);
  objc_msgSend(v6, "imageProvider", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationBaseCircularClosedGaugeImageView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImageProvider:reason:", v7, a4);

}

@end
