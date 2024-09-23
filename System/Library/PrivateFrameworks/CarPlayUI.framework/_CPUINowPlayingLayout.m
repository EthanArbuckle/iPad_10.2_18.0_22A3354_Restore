@implementation _CPUINowPlayingLayout

- (_CPUINowPlayingLayout)initWithSafeArea:(CGRect)a3 frame:(CGRect)a4 displayScale:(double)a5 showsArtwork:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  _CPUINowPlayingLayout *result;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)_CPUINowPlayingLayout;
  result = -[_CPUINowPlayingLayout init](&v16, sel_init);
  if (result)
  {
    result->_safeAreaFrame.origin.y = v13;
    result->_safeAreaFrame.size.width = v12;
    result->_safeAreaFrame.size.height = v11;
    result->_viewAreaFrame.origin.x = x;
    result->_viewAreaFrame.origin.y = y;
    result->_viewAreaFrame.size.width = width;
    result->_viewAreaFrame.size.height = height;
    result->_displayScale = a5;
    result->_safeAreaFrame.origin.x = v14;
    result->_showsArtwork = a6;
    result->_verticalCentering = 0;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  CGRect v17;
  CGRect v18;

  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  NSStringFromCGRect(v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_CPUINowPlayingLayout viewAreaFrame](self, "viewAreaFrame");
  NSStringFromCGRect(v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[_CPUINowPlayingLayout displayScale](self, "displayScale");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_CPUINowPlayingLayout artworkPosition](self, "artworkPosition"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_CPUINowPlayingLayout showsArtwork](self, "showsArtwork"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_CPUINowPlayingLayout verticalCentering](self, "verticalCentering"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  _CPUINowPlayingLayout *v4;
  _CPUINowPlayingLayout *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v4 = (_CPUINowPlayingLayout *)a3;
  if (v4 == self)
  {
    LOBYTE(v35) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[_CPUINowPlayingLayout safeAreaFrame](v5, "safeAreaFrame");
      v40.origin.x = v14;
      v40.origin.y = v15;
      v40.size.width = v16;
      v40.size.height = v17;
      v38.origin.x = v7;
      v38.origin.y = v9;
      v38.size.width = v11;
      v38.size.height = v13;
      if (!CGRectEqualToRect(v38, v40))
        goto LABEL_8;
      -[_CPUINowPlayingLayout viewAreaFrame](self, "viewAreaFrame");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      -[_CPUINowPlayingLayout viewAreaFrame](v5, "viewAreaFrame");
      v41.origin.x = v26;
      v41.origin.y = v27;
      v41.size.width = v28;
      v41.size.height = v29;
      v39.origin.x = v19;
      v39.origin.y = v21;
      v39.size.width = v23;
      v39.size.height = v25;
      if (!CGRectEqualToRect(v39, v41))
        goto LABEL_8;
      -[_CPUINowPlayingLayout displayScale](self, "displayScale");
      v31 = v30;
      -[_CPUINowPlayingLayout displayScale](v5, "displayScale");
      if (vabdd_f64(v31, v32) < 0.00000011920929
        && (v33 = -[_CPUINowPlayingLayout artworkPosition](self, "artworkPosition"),
            v33 == -[_CPUINowPlayingLayout artworkPosition](v5, "artworkPosition"))
        && (v34 = -[_CPUINowPlayingLayout showsArtwork](self, "showsArtwork"),
            v34 == -[_CPUINowPlayingLayout showsArtwork](v5, "showsArtwork")))
      {
        v37 = -[_CPUINowPlayingLayout verticalCentering](self, "verticalCentering");
        v35 = v37 ^ -[_CPUINowPlayingLayout verticalCentering](v5, "verticalCentering") ^ 1;
      }
      else
      {
LABEL_8:
        LOBYTE(v35) = 0;
      }

    }
    else
    {
      LOBYTE(v35) = 0;
    }
  }

  return v35;
}

- (double)_scaledWidth
{
  double Width;
  double v4;
  CGRect v6;

  -[_CPUINowPlayingLayout viewAreaFrame](self, "viewAreaFrame");
  Width = CGRectGetWidth(v6);
  -[_CPUINowPlayingLayout displayScale](self, "displayScale");
  return Width * v4;
}

- (double)_scaledHeight
{
  double Height;
  double v4;
  CGRect v6;

  -[_CPUINowPlayingLayout viewAreaFrame](self, "viewAreaFrame");
  Height = CGRectGetHeight(v6);
  -[_CPUINowPlayingLayout displayScale](self, "displayScale");
  return Height * v4;
}

- (double)_effectiveAlbumArtWidth
{
  double v3;
  double v4;
  CGRect v6;

  -[_CPUINowPlayingLayout albumArtWidthMultiplier](self, "albumArtWidthMultiplier");
  v4 = v3;
  -[_CPUINowPlayingLayout viewAreaFrame](self, "viewAreaFrame");
  return v4 * CGRectGetWidth(v6);
}

- (unint64_t)artworkPosition
{
  -[_CPUINowPlayingLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (double)albumArtWidthMultiplier
{
  -[_CPUINowPlayingLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (CGSize)maximumNowPlayingSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)transportControlButtonHeight
{
  double v3;
  double v4;
  double v5;
  BOOL v7;
  double result;

  -[_CPUINowPlayingLayout _scaledWidth](self, "_scaledWidth");
  v4 = v3;
  -[_CPUINowPlayingLayout _scaledHeight](self, "_scaledHeight");
  v7 = (v4 >= 1400.0 || v5 < 624.0) && v5 <= 720.0;
  result = 36.0;
  if (!v7)
    return 44.0;
  return result;
}

- (double)transportControlButtonSpacing
{
  double v2;
  BOOL v3;
  double result;

  -[_CPUINowPlayingLayout _scaledWidth](self, "_scaledWidth");
  v3 = v2 < 1120.0;
  result = 16.0;
  if (v3)
    return 10.0;
  return result;
}

- (double)playModeControlButtonWidth
{
  return 44.0;
}

- (double)minimumDesiredPlayModeControlButtonWidth
{
  double v3;
  double v4;
  double v5;

  -[_CPUINowPlayingLayout playModeControlButtonWidth](self, "playModeControlButtonWidth");
  v4 = v3;
  -[_CPUINowPlayingLayout playModeControlButtonSpacing](self, "playModeControlButtonSpacing");
  return v5 * 4.0 + v4 * 5.0;
}

- (double)playModeControlButtonSpacing
{
  double v2;
  BOOL v3;
  double result;

  -[_CPUINowPlayingLayout _scaledWidth](self, "_scaledWidth");
  v3 = v2 < 1120.0;
  result = 16.0;
  if (v3)
    return 10.0;
  return result;
}

- (BOOL)playModeControlButtonsFullWidth
{
  -[_CPUINowPlayingLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)trackInfoFontStyle
{
  -[_CPUINowPlayingLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (double)verticalEdgePadding
{
  -[_CPUINowPlayingLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_CPUINowPlayingLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)progressViewFullWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGRect v10;

  -[_CPUINowPlayingLayout layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  -[_CPUINowPlayingLayout safeAreaFrame](self, "safeAreaFrame");
  v7 = CGRectGetHeight(v10) - (v6 + v4);
  -[_CPUINowPlayingLayout _effectiveAlbumArtWidth](self, "_effectiveAlbumArtWidth");
  return floor(v7 - v8 + -12.0 - 26.0) >= 14.0;
}

- (CGSize)maximumTitleViewSize
{
  double v2;
  double v3;
  CGSize result;

  -[_CPUINowPlayingLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)safeAreaFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_safeAreaFrame.origin.x;
  y = self->_safeAreaFrame.origin.y;
  width = self->_safeAreaFrame.size.width;
  height = self->_safeAreaFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSafeAreaFrame:(CGRect)a3
{
  self->_safeAreaFrame = a3;
}

- (CGRect)viewAreaFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewAreaFrame.origin.x;
  y = self->_viewAreaFrame.origin.y;
  width = self->_viewAreaFrame.size.width;
  height = self->_viewAreaFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setViewAreaFrame:(CGRect)a3
{
  self->_viewAreaFrame = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (void)setShowsArtwork:(BOOL)a3
{
  self->_showsArtwork = a3;
}

- (BOOL)verticalCentering
{
  return self->_verticalCentering;
}

- (void)setVerticalCentering:(BOOL)a3
{
  self->_verticalCentering = a3;
}

@end
