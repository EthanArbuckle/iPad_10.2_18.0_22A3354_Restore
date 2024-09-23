@implementation CPUINowPlayingLayoutRightArtwork

- (CPUINowPlayingLayoutRightArtwork)initWithSafeArea:(CGRect)a3 frame:(CGRect)a4 displayScale:(double)a5 showsArtwork:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CPUINowPlayingLayoutRightArtwork *v14;
  CPUINowPlayingLayoutRightArtwork *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat rect;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v28.receiver = self;
  v28.super_class = (Class)CPUINowPlayingLayoutRightArtwork;
  v14 = -[_CPUINowPlayingLayout initWithSafeArea:frame:displayScale:showsArtwork:](&v28, sel_initWithSafeArea_frame_displayScale_showsArtwork_, a6, a3.origin.x, *(_QWORD *)&a5);
  v15 = v14;
  if (v14)
  {
    -[CPUINowPlayingLayoutRightArtwork layoutMargins](v14, "layoutMargins");
    v26 = v17;
    v27 = v16;
    +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:](CPUISongDetailsView, "maximumHeightForTrackInfoFontStyle:", 1);
    rect = v10;
    v19 = v18;
    -[_CPUINowPlayingLayout transportControlButtonHeight](v15, "transportControlButtonHeight");
    v21 = v19 + v20 + 18.0 + 14.0 + 26.0;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v22 = CGRectGetWidth(v29) * 0.360000014;
    v30.origin.x = v13;
    v30.origin.y = v12;
    v30.size.width = v11;
    v30.size.height = rect;
    v23 = CGRectGetHeight(v30) - v27 - v26;
    if (v22 < v23)
      v23 = v22;
    -[_CPUINowPlayingLayout setVerticalCentering:](v15, "setVerticalCentering:", v21 < v23);
  }
  return v15;
}

- (unint64_t)artworkPosition
{
  return 2;
}

- (double)albumArtWidthMultiplier
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Width;
  double v12;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[CPUINowPlayingLayoutRightArtwork layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  Width = CGRectGetWidth(v16);
  -[_CPUINowPlayingLayout viewAreaFrame](self, "viewAreaFrame");
  v12 = CGRectGetWidth(v17) * 0.360000014;
  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  v13 = CGRectGetHeight(v18) - v4 - v8;
  if (v12 >= v13)
    v12 = v13;
  -[_CPUINowPlayingLayout minimumDesiredPlayModeControlButtonWidth](self, "minimumDesiredPlayModeControlButtonWidth");
  if (Width + v10 * -2.0 - v6 - v12 < v14)
  {
    -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
    v12 = CGRectGetHeight(v19) - v8 - v4 - 14.0 - 26.0 + -12.0;
  }
  return fmin(v12 / Width, 0.360000014);
}

- (unint64_t)trackInfoFontStyle
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;

  -[CPUINowPlayingLayoutRightArtwork maximumTitleViewSize](self, "maximumTitleViewSize");
  v3 = v2;
  v5 = v4;
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:](CPUISongDetailsView, "maximumHeightForTrackInfoFontStyle:", 0);
  v7 = v6;
  +[CPUISongDetailsView minimumHeightForTrackInfoFontStyle:](CPUISongDetailsView, "minimumHeightForTrackInfoFontStyle:", 1);
  if (v7 >= v8)
    v8 = v7;
  if (v5 < v8)
    return 0;
  v9 = 1;
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:](CPUISongDetailsView, "maximumHeightForTrackInfoFontStyle:", 1);
  if (v5 < v10 && v3 <= 330.0)
    return 0;
  return v9;
}

- (BOOL)playModeControlButtonsFullWidth
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGRect v10;

  if (-[_CPUINowPlayingLayout verticalCentering](self, "verticalCentering"))
    return 0;
  -[CPUINowPlayingLayoutRightArtwork layoutMargins](self, "layoutMargins");
  v5 = v4;
  v7 = v6;
  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  v8 = CGRectGetHeight(v10) - (v7 + v5);
  -[_CPUINowPlayingLayout _effectiveAlbumArtWidth](self, "_effectiveAlbumArtWidth");
  return v8 - v9 >= 26.0;
}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 12.0;
  v4 = 12.0;
  v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)maximumTitleViewSize
{
  double Height;
  double v4;
  double v5;
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
  float v16;
  double v17;
  float v18;
  double v19;
  CGSize result;
  CGRect v21;
  CGRect v22;

  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  Height = CGRectGetHeight(v21);
  -[CPUINowPlayingLayoutRightArtwork layoutMargins](self, "layoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_CPUINowPlayingLayout transportControlButtonHeight](self, "transportControlButtonHeight");
  v13 = v12;
  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  v14 = round(CGRectGetWidth(v22)) - (v7 + v11 * 2.0);
  if (-[_CPUINowPlayingLayout showsArtwork](self, "showsArtwork"))
  {
    -[_CPUINowPlayingLayout _effectiveAlbumArtWidth](self, "_effectiveAlbumArtWidth");
    v14 = v14 - v15;
  }
  v16 = v14 + -45.0;
  v17 = floorf(v16);
  v18 = round(Height) - (v5 + v9) - (14.0 + 26.0) - v13 + -18.0;
  v19 = floorf(v18);
  result.height = v19;
  result.width = v17;
  return result;
}

@end
