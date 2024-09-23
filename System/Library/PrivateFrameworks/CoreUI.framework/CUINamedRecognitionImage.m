@implementation CUINamedRecognitionImage

- (CUINamedRecognitionImage)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedRecognitionImage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUINamedRecognitionImage;
  v5 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v7, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a5);
  if ((id)-[CUIThemeRendition type](-[CUINamedLookup _rendition](v5, "_rendition"), "type") == (id)1014)
  {

    return 0;
  }
  return v5;
}

- (CGImage)image
{
  return -[CUIThemeRendition uncroppedImage](-[CUINamedLookup _rendition](self, "_rendition"), "uncroppedImage");
}

- (CGSize)physicalSizeInMeters
{
  double v2;
  double v3;
  CGSize result;

  -[CUIThemeRendition physicalSizeInMeters](-[CUINamedLookup _rendition](self, "_rendition"), "physicalSizeInMeters");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)exifOrientation
{
  return -[CUIThemeRendition exifOrientation](-[CUINamedLookup _rendition](self, "_rendition"), "exifOrientation");
}

@end
