@implementation MPDownloadProgressView

- (MPDownloadProgressView)initWithFrame:(CGRect)a3
{
  MPDownloadProgressView *v3;
  id v4;
  uint64_t v5;
  UIView *outerRingView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPDownloadProgressView;
  v3 = -[MPDownloadProgressView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[MPDownloadProgressView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    outerRingView = v3->_outerRingView;
    v3->_outerRingView = (UIView *)v5;

    -[UIView setClipsToBounds:](v3->_outerRingView, "setClipsToBounds:", 1);
    -[MPDownloadProgressView addSubview:](v3, "addSubview:", v3->_outerRingView);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double SafeScaleForValue;
  double x;
  double y;
  double width;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)MPDownloadProgressView;
  -[MPDownloadProgressView layoutSubviews](&v28, sel_layoutSubviews);
  -[MPDownloadProgressView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  SafeScaleForValue = MPFloatGetSafeScaleForValue(v4);
  v26 = SafeScaleForValue;

  -[MPDownloadProgressView bounds](self, "bounds");
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v10 = CGRectGetWidth(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v11 = CGRectGetHeight(v30);
  if (v10 < v11)
    v11 = v10;
  v27 = v11 * 0.5;
  -[_MPDownloadProgressRingView setFrame:](self->_progressView, "setFrame:", x, y, width, height);
  -[UIImageView frame](self->_centerImageView, "frame");
  -[UIImageView sizeThatFits:](self->_centerImageView, "sizeThatFits:", width, height);
  v25 = SafeScaleForValue;
  UIRectCenteredIntegralRectScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UIImage alignmentRectInsets](self->_centerImage, "alignmentRectInsets", *(_QWORD *)&v25);
  -[UIImageView setFrame:](self->_centerImageView, "setFrame:", v13 + v23, v15 + v20, v17 - (v23 + v21), v19 - (v20 + v22));
  -[UIView setFrame:](self->_outerRingView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_outerRingView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerRadius:", v27);
  objc_msgSend(v24, "setBorderWidth:", 1.0 / v26 + 2.0);

}

- (void)setCenterImage:(id)a3
{
  UIImage *v5;
  UIImage **p_centerImage;
  UIImageView *centerImageView;
  id v8;
  UIImageView *v9;
  UIImageView *v10;
  UIImage *v11;

  v5 = (UIImage *)a3;
  p_centerImage = &self->_centerImage;
  if (self->_centerImage != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_centerImage, a3);
    centerImageView = self->_centerImageView;
    if (*p_centerImage)
    {
      if (!centerImageView)
      {
        v8 = objc_alloc(MEMORY[0x1E0DC3890]);
        v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v10 = self->_centerImageView;
        self->_centerImageView = v9;

        -[MPDownloadProgressView addSubview:](self, "addSubview:", self->_centerImageView);
        centerImageView = self->_centerImageView;
      }
      -[UIImageView setHidden:](centerImageView, "setHidden:", 0);
      -[UIImageView setImage:](self->_centerImageView, "setImage:", *p_centerImage);
    }
    else
    {
      -[UIImageView setHidden:](centerImageView, "setHidden:", 1);
    }
    -[MPDownloadProgressView setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)setDownloadProgress:(double)downloadProgress
{
  double v4;
  _MPDownloadProgressRingView *progressView;
  _MPDownloadProgressRingView *v7;
  _QWORD v8[5];

  if (vabdd_f64(downloadProgress, self->_downloadProgress) >= 0.00000011920929)
  {
    self->_downloadProgress = downloadProgress;
    v4 = vabdd_f64(0.0, downloadProgress);
    progressView = self->_progressView;
    if (downloadProgress < 0.0 || v4 < 0.00000011920929)
    {
      -[_MPDownloadProgressRingView removeFromSuperview](progressView, "removeFromSuperview");
      v7 = self->_progressView;
      self->_progressView = 0;

    }
    else
    {
      if (!progressView)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __46__MPDownloadProgressView_setDownloadProgress___block_invoke;
        v8[3] = &unk_1E3163508;
        v8[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
        progressView = self->_progressView;
        downloadProgress = self->_downloadProgress;
      }
      -[_MPDownloadProgressRingView setProgress:](progressView, "setProgress:", downloadProgress, v4);
    }
  }
}

- (void)setOuterRingColor:(id)a3
{
  UIColor *v5;
  UIColor **p_outerRingColor;
  void *v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  p_outerRingColor = &self->_outerRingColor;
  if (self->_outerRingColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_outerRingColor, a3);
    -[UIView layer](self->_outerRingView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", -[UIColor CGColor](*p_outerRingColor, "CGColor"));

    v5 = v8;
  }

}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (UIColor)outerRingColor
{
  return self->_outerRingColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerRingColor, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_outerRingView, 0);
  objc_storeStrong((id *)&self->_centerImageView, 0);
}

uint64_t __46__MPDownloadProgressView_setDownloadProgress___block_invoke(uint64_t a1)
{
  _MPDownloadProgressRingView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = [_MPDownloadProgressRingView alloc];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = -[_MPDownloadProgressRingView initWithFrame:](v2, "initWithFrame:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 432);
  *(_QWORD *)(v4 + 432) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setProgress:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
}

@end
