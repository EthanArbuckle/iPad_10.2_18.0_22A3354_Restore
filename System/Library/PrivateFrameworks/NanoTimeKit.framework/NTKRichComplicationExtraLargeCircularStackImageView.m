@implementation NTKRichComplicationExtraLargeCircularStackImageView

- (NTKRichComplicationExtraLargeCircularStackImageView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularStackImageView;
  return -[NTKRichComplicationCircularStackContentTextView initWithFamily:](&v3, sel_initWithFamily_, 12);
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
  v9.super_class = (Class)NTKRichComplicationExtraLargeCircularStackImageView;
  v6 = a3;
  -[NTKRichComplicationCircularStackContentTextView _handleTemplate:reason:](&v9, sel__handleTemplate_reason_, v6, a4);
  -[NTKRichComplicationBaseCircularStackImageView line1ImageView](self, "line1ImageView", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "line1ImageProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setImageProvider:reason:", v8, a4);
}

@end
