@implementation CPUINowPlayingLayoutStacked

- (unint64_t)artworkPosition
{
  return -[_CPUINowPlayingLayout showsArtwork](self, "showsArtwork");
}

- (double)albumArtWidthMultiplier
{
  CGFloat v3;
  CGRect v5;
  CGRect v6;

  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  v3 = CGRectGetHeight(v5) * 0.400000006;
  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  return v3 / CGRectGetWidth(v6);
}

- (BOOL)progressViewFullWidth
{
  return 1;
}

- (BOOL)playModeControlButtonsFullWidth
{
  return 1;
}

- (unint64_t)trackInfoFontStyle
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[CPUINowPlayingLayoutStacked maximumTitleViewSize](self, "maximumTitleViewSize");
  v3 = v2;
  v5 = v4;
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:](CPUISongDetailsView, "maximumHeightForTrackInfoFontStyle:", 1);
  return v3 >= 300.0 && v5 >= v6;
}

- (double)transportControlButtonSpacing
{
  return 16.0;
}

- (double)playModeControlButtonSpacing
{
  return 16.0;
}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 20.0;
  v4 = 20.0;
  v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)maximumTitleViewSize
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  CGSize result;
  CGRect v23;
  CGRect v24;

  -[CPUINowPlayingLayoutStacked maximumNowPlayingSize](self, "maximumNowPlayingSize");
  if (v4 == *MEMORY[0x24BDBF148] && v3 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
    v7 = round(CGRectGetHeight(v23));
  }
  else
  {
    -[CPUINowPlayingLayoutStacked maximumNowPlayingSize](self, "maximumNowPlayingSize");
    v7 = v6;
  }
  -[CPUINowPlayingLayoutStacked layoutMargins](self, "layoutMargins");
  v9 = v8;
  v11 = v10;
  v14 = v7 - (v12 + v13) - (26.0 + 14.0);
  -[_CPUINowPlayingLayout transportControlButtonHeight](self, "transportControlButtonHeight");
  v16 = v14 - v15 + -18.0;
  if (-[_CPUINowPlayingLayout showsArtwork](self, "showsArtwork"))
  {
    -[_CPUINowPlayingLayout _effectiveAlbumArtWidth](self, "_effectiveAlbumArtWidth");
    v16 = v16 + -6.0 - v17;
  }
  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  v18 = round(CGRectGetWidth(v24)) - (v11 + v9);
  v19 = floorf(v18);
  v20 = v16;
  v21 = floorf(v20);
  result.height = v21;
  result.width = v19;
  return result;
}

- (CGSize)maximumNowPlayingSize
{
  double v3;
  double v4;
  double Width;
  double Height;
  double v7;
  CGSize result;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  if (-[_CPUINowPlayingLayout showsArtwork](self, "showsArtwork"))
  {
    v4 = *MEMORY[0x24BDBF148];
    v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  else
  {
    -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
    if (CGRectEqualToRect(v9, *MEMORY[0x24BDBF090]))
    {
      v3 = 480.0;
      v4 = 500.0;
    }
    else
    {
      -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
      Width = CGRectGetWidth(v10);
      if (Width <= 500.0)
        v4 = Width;
      else
        v4 = 500.0;
      -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
      Height = CGRectGetHeight(v11);
      v3 = 480.0;
      if (Height <= 480.0)
        v3 = Height;
    }
  }
  v7 = v4;
  result.height = v3;
  result.width = v7;
  return result;
}

@end
