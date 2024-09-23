@implementation ICDocCamImageQuadEditImageView

- (ICDocCamImageQuadEditImageView)initWithFrame:(CGRect)a3
{
  ICDocCamImageQuadEditImageView *v3;
  ICDocCamImageQuadEditImageView *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICDocCamImageQuadEditImageView;
  v3 = -[ICDocCamImageQuadEditImageView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ICDocCamImageQuadEditImageView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 0);

    v6 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    -[ICDocCamImageQuadEditImageView setImageLayer:](v4, "setImageLayer:", v6);

    -[ICDocCamImageQuadEditImageView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditImageView imageLayer](v4, "imageLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v8);

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditImageView setBackgroundColor:](v4, "setBackgroundColor:", v9);

  }
  return v4;
}

- (void)setImageOpacity:(double)a3
{
  float v3;
  double v4;
  id v5;

  self->_imageOpacity = a3;
  v3 = a3;
  -[ICDocCamImageQuadEditImageView imageLayer](self, "imageLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setOpacity:", v4);

}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ICDocCamImageQuadEditImageView;
  -[ICDocCamImageQuadEditImageView setFrame:](&v21, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICDocCamImageQuadEditImageView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ICDocCamImageQuadEditImageView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[ICDocCamImageQuadEditImageView bounds](self, "bounds");
  v17 = DCTSDCenterOfRect(v13, v14, v15, v16);
  v19 = v18;
  -[ICDocCamImageQuadEditImageView imageLayer](self, "imageLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPosition:", v17, v19);

}

- (void)setImage:(id)a3 orientation:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t matched;
  void *v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v6 = a3;
  v7 = v6;
  if (*(_OWORD *)&self->_image != __PAIR128__(a4, (unint64_t)v6))
  {
    objc_msgSend(v6, "size");
    v9 = v8;
    v11 = v10;
    v12 = objc_msgSend(objc_retainAutorelease(v7), "CGImage");
    -[ICDocCamImageQuadEditImageView imageLayer](self, "imageLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContents:", v12);

    -[ICDocCamImageQuadEditImageView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v9, v11);

    -[ICDocCamImageQuadEditImageView imageLayer](self, "imageLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, v9, v11);

    matched = dc_clockwiseRotationsFromUpToMatchOrientation(a4);
    CGAffineTransformMakeRotation(&v19, (double)(unint64_t)matched * 1.57079633);
    -[ICDocCamImageQuadEditImageView imageLayer](self, "imageLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    objc_msgSend(v17, "setAffineTransform:", &v18);

  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (double)imageOpacity
{
  return self->_imageOpacity;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayer, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

@end
