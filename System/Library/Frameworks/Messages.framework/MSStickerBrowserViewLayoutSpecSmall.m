@implementation MSStickerBrowserViewLayoutSpecSmall

- (CGSize)itemSize
{
  int64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[MSStickerBrowserViewLayoutSpec stickerSize](self, "stickerSize");
  v3 = 85.0;
  if (!v2)
    v3 = 60.0;
  if (v2 == 2)
    v3 = 136.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end
