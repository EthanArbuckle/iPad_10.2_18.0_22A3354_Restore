@implementation CNUIPRLikenessLoadingGroupPlaceholderProvider

- (CNUIPRLikenessLoadingGroupPlaceholderProvider)initWithBackgroundStyle:(unint64_t)a3
{
  CNUIPRLikenessLoadingGroupPlaceholderProvider *v4;
  CNUIPRLikenessLoadingGroupPlaceholderProvider *v5;
  CNUIPRLikenessLoadingGroupPlaceholderProvider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNUIPRLikenessLoadingGroupPlaceholderProvider;
  v4 = -[CNUIPRLikenessLoadingPlaceholderProvider init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_backgroundStyle = a3;
    v6 = v4;
  }

  return v5;
}

- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4
{
  return +[CNUISnowglobeUtilities circularPlaceholderImageForSize:backgroundStyle:scale:](CNUISnowglobeUtilities, "circularPlaceholderImageForSize:backgroundStyle:scale:", -[CNUIPRLikenessLoadingGroupPlaceholderProvider backgroundStyle](self, "backgroundStyle"), a3.width, a3.height, a4);
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  return +[CNUISnowglobeUtilities roundedRectPlaceholderImageForSize:backgroundStyle:scale:](CNUISnowglobeUtilities, "roundedRectPlaceholderImageForSize:backgroundStyle:scale:", -[CNUIPRLikenessLoadingGroupPlaceholderProvider backgroundStyle](self, "backgroundStyle"), a3.width, a3.height, a4);
}

@end
