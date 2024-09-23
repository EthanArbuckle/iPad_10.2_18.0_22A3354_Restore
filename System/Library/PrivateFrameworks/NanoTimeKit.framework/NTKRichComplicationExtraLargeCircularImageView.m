@implementation NTKRichComplicationExtraLargeCircularImageView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKRichComplicationExtraLargeCircularImageView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularImageView;
  return -[NTKRichComplicationBaseCircularImageView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(a3, "imageProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularImageView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageProvider:reason:", v7, a4);

}

@end
