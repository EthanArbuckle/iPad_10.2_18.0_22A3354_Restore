@implementation PHLivePhotoView

- (CGSize)intrinsicContentSize
{
  PHLivePhotoView *v2;
  PHLivePhoto *v3;
  PHLivePhoto *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[PHLivePhotoView livePhoto](v2, "livePhoto");
  if (v3)
  {
    v4 = v3;
    -[PHLivePhoto size](v3, "size");
    v6 = v5;
    v8 = v7;

  }
  else
  {

    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
