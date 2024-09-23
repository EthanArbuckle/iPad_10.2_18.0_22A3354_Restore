@implementation MSStickerBrowserViewLayoutSpecStandard

- (CGSize)itemSize
{
  int64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[MSStickerBrowserViewLayoutSpec stickerSize](self, "stickerSize");
  v3 = dbl_1DB1D2370[v2 == 0];
  if (v2 == 2)
    v3 = 163.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end
