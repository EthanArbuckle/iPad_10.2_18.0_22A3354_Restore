@implementation NTKRoundedCornerOverlayView

- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 screenScale:(double)a4 cornerRadius:(double)a5
{
  NTKRoundedCornerOverlayView *v7;
  NTKRoundedCornerOverlayView *v8;
  void *v9;
  uint64_t v10;
  UIImageView *upperLeftCorner;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  UIImageView *upperRightCorner;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  UIImageView *bottomLeftCorner;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  UIImageView *bottomRightCorner;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)NTKRoundedCornerOverlayView;
  v7 = -[NTKRoundedCornerOverlayView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_cornerRadius = a5;
    v7->_screenScale = a4;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0DC3870], "newImageForScreenCorner:screenScale:cornerRadius:", 1, a4, a5);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    upperLeftCorner = v8->_upperLeftCorner;
    v8->_upperLeftCorner = (UIImageView *)v10;

    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    v13 = (void *)MEMORY[0x1E0DC3870];
    v14 = objc_retainAutorelease(v9);
    v15 = objc_msgSend(v14, "CGImage");
    objc_msgSend(v14, "scale");
    objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v15, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "initWithImage:", v16);
    upperRightCorner = v8->_upperRightCorner;
    v8->_upperRightCorner = (UIImageView *)v17;

    v19 = objc_alloc(MEMORY[0x1E0DC3890]);
    v20 = (void *)MEMORY[0x1E0DC3870];
    v21 = objc_retainAutorelease(v14);
    v22 = objc_msgSend(v21, "CGImage");
    objc_msgSend(v21, "scale");
    objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v22, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v19, "initWithImage:", v23);
    bottomLeftCorner = v8->_bottomLeftCorner;
    v8->_bottomLeftCorner = (UIImageView *)v24;

    v26 = objc_alloc(MEMORY[0x1E0DC3890]);
    v27 = (void *)MEMORY[0x1E0DC3870];
    v28 = objc_retainAutorelease(v21);
    v29 = objc_msgSend(v28, "CGImage");
    objc_msgSend(v28, "scale");
    objc_msgSend(v27, "imageWithCGImage:scale:orientation:", v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v26, "initWithImage:", v30);
    bottomRightCorner = v8->_bottomRightCorner;
    v8->_bottomRightCorner = (UIImageView *)v31;

    -[UIImageView layer](v8->_upperLeftCorner, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAllowsEdgeAntialiasing:", 0);

    -[UIImageView layer](v8->_upperRightCorner, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAllowsEdgeAntialiasing:", 0);

    -[UIImageView layer](v8->_bottomLeftCorner, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAllowsEdgeAntialiasing:", 0);

    -[UIImageView layer](v8->_bottomRightCorner, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAllowsEdgeAntialiasing:", 0);

    -[NTKRoundedCornerOverlayView addSubview:](v8, "addSubview:", v8->_upperRightCorner);
    -[NTKRoundedCornerOverlayView addSubview:](v8, "addSubview:", v8->_upperLeftCorner);
    -[NTKRoundedCornerOverlayView addSubview:](v8, "addSubview:", v8->_bottomLeftCorner);
    -[NTKRoundedCornerOverlayView addSubview:](v8, "addSubview:", v8->_bottomRightCorner);
    -[NTKRoundedCornerOverlayView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    -[NTKRoundedCornerOverlayView layer](v8, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAllowsHitTesting:", 0);

  }
  return v8;
}

- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 forDeviceCornerRadius:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  NTKRoundedCornerOverlayView *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "screenCornerRadius");
  v11 = -[NTKRoundedCornerOverlayView initWithFrame:forDevice:cornerRadius:](self, "initWithFrame:forDevice:cornerRadius:", v9, x, y, width, height, v10);

  return v11;
}

- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 forDevice:(id)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  double v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "screenScale");
  return -[NTKRoundedCornerOverlayView initWithFrame:screenScale:cornerRadius:](self, "initWithFrame:screenScale:cornerRadius:", x, y, width, height, v11, a5);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat MaxY;
  CGFloat v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v14.receiver = self;
  v14.super_class = (Class)NTKRoundedCornerOverlayView;
  -[NTKRoundedCornerOverlayView layoutSubviews](&v14, sel_layoutSubviews);
  -[NTKRoundedCornerOverlayView bounds](self, "bounds");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v7 = ceil(self->_cornerRadius * 1.528665 * self->_screenScale) / self->_screenScale;
  v8 = CGRectGetMinX(v15) + -0.5;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = CGRectGetMinY(v16) + -0.5;
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_upperLeftCorner, "ntk_setBoundsAndPositionFromFrame:", v8, v9, v7 + 0.5, v7 + 0.5);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v10 = CGRectGetWidth(v17);
  v11 = v10 - v7;
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_upperRightCorner, "ntk_setBoundsAndPositionFromFrame:", v10 - v7, v9, v7 + 0.5, v7 + 0.5);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MaxY = CGRectGetMaxY(v18);
  v13 = MaxY - v7;
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_bottomRightCorner, "ntk_setBoundsAndPositionFromFrame:", v11, MaxY - v7, v7 + 0.5, v7 + 0.5);
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_bottomLeftCorner, "ntk_setBoundsAndPositionFromFrame:", -0.5, v13, v7 + 0.5, v7 + 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRightCorner, 0);
  objc_storeStrong((id *)&self->_bottomLeftCorner, 0);
  objc_storeStrong((id *)&self->_upperRightCorner, 0);
  objc_storeStrong((id *)&self->_upperLeftCorner, 0);
}

@end
