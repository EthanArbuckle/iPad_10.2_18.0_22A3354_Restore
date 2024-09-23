@implementation AVTImageTransitioningContainerView

+ (CGRect)liveViewRectForContentRect:(CGRect)a3 aspectRatio:(CGSize)a4 layoutMode:(int64_t)a5 scale:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a5 == 1)
    _UIScaleTransformForAspectFitOfSizeInTargetSize();
  else
    _UIScaleTransformForAspectFillOfSizeInTargetSize();
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)imageViewRectForContentRect:(CGRect)a3 liveViewRect:(CGRect)a4 imageSize:(CGSize)a5 scale:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)borderMaskRectForContentRect:(CGRect)a3
{
  return CGRectInset(a3, 1.0, 1.0);
}

- (AVTImageTransitioningContainerView)initWithFrame:(CGRect)a3
{
  return -[AVTImageTransitioningContainerView initWithFrame:layoutMode:](self, "initWithFrame:layoutMode:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (AVTImageTransitioningContainerView)initWithFrame:(CGRect)a3 layoutMode:(int64_t)a4
{
  char *v5;
  AVTImageTransitioningContainerView *v6;
  void *v12;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  AVTUIAnimatingImageView *v29;
  AVTUIAnimatingImageView *imageViewsContainer;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  uint64_t v39;
  UIView *borderMaskView;
  void *v41;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)AVTImageTransitioningContainerView;
  v5 = -[AVTImageTransitioningContainerView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (AVTImageTransitioningContainerView *)v5;
  if (v5)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v5 + 456) = _Q0;
    *((_QWORD *)v5 + 54) = a4;
    v12 = (void *)objc_opt_class();
    -[AVTImageTransitioningContainerView bounds](v6, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[AVTImageTransitioningContainerView bounds](v6, "bounds");
    objc_msgSend(v12, "imageViewRectForContentRect:liveViewRect:imageSize:scale:", v14, v16, v18, v20, v21, v22, v23, v24, 0x3FF0000000000000, 0x3FF0000000000000, 0);
    v29 = -[AVTUIAnimatingImageView initWithFrame:]([AVTUIAnimatingImageView alloc], "initWithFrame:", v25, v26, v27, v28);
    imageViewsContainer = v6->_imageViewsContainer;
    v6->_imageViewsContainer = v29;

    -[AVTImageTransitioningContainerView addSubview:](v6, "addSubview:", v6->_imageViewsContainer);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");
    v33 = v32;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "nativeScale");
    v36 = v35;

    if (v33 != v36)
    {
      v37 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v38 = (void *)objc_opt_class();
      -[AVTImageTransitioningContainerView bounds](v6, "bounds");
      objc_msgSend(v38, "borderMaskRectForContentRect:");
      v39 = objc_msgSend(v37, "initWithFrame:");
      borderMaskView = v6->_borderMaskView;
      v6->_borderMaskView = (UIView *)v39;

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6->_borderMaskView, "setBackgroundColor:", v41);

      -[AVTImageTransitioningContainerView setMaskView:](v6, "setMaskView:", v6->_borderMaskView);
    }
  }
  return v6;
}

- (void)setStaticImage:(id)a3
{
  -[AVTImageTransitioningContainerView setStaticImage:animated:](self, "setStaticImage:animated:", a3, 0);
}

- (void)setStaticImage:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIImage *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  UIImage *v16;

  v4 = a4;
  v7 = (UIImage *)a3;
  if (self->_staticImage != v7)
  {
    v16 = v7;
    -[UIImage size](v7, "size");
    v9 = v8;
    v11 = v10;
    -[UIImage size](self->_staticImage, "size");
    if (v9 != v13 || v11 != v12)
      -[AVTImageTransitioningContainerView setNeedsLayout](self, "setNeedsLayout");
    objc_storeStrong((id *)&self->_staticImage, a3);
    -[AVTImageTransitioningContainerView imageViewsContainer](self, "imageViewsContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:animated:", v16, v4);

    v7 = v16;
  }

}

- (void)setLiveView:(id)a3
{
  UIView *v5;
  UIView **p_liveView;
  UIView *liveView;
  AVTImageTransitioningContainerView *v8;
  UIView *v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_liveView = &self->_liveView;
  liveView = self->_liveView;
  if (liveView != v5)
  {
    v11 = v5;
    -[UIView superview](liveView, "superview");
    v8 = (AVTImageTransitioningContainerView *)objc_claimAutoreleasedReturnValue();

    v9 = *p_liveView;
    if (v8 == self)
    {
      -[UIView removeFromSuperview](v9, "removeFromSuperview");
    }
    else
    {
      -[UIView superview](v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Live view wasn't removed from superview!"));
    }
    objc_storeStrong((id *)&self->_liveView, a3);
    -[AVTImageTransitioningContainerView addSubview:](self, "addSubview:", *p_liveView);
    -[AVTImageTransitioningContainerView transitionStaticViewToFront](self, "transitionStaticViewToFront");
    -[AVTImageTransitioningContainerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)setAspectRatio:(CGSize)a3
{
  if (self->_aspectRatio.width != a3.width || self->_aspectRatio.height != a3.height)
  {
    self->_aspectRatio = a3;
    -[AVTImageTransitioningContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  void *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  BOOL v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v63.receiver = self;
  v63.super_class = (Class)AVTImageTransitioningContainerView;
  -[AVTImageTransitioningContainerView layoutSubviews](&v63, sel_layoutSubviews);
  -[AVTImageTransitioningContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_opt_class();
  -[AVTImageTransitioningContainerView aspectRatio](self, "aspectRatio");
  v13 = v12;
  v15 = v14;
  v16 = -[AVTImageTransitioningContainerView layoutMode](self, "layoutMode");
  -[AVTImageTransitioningContainerView window](self, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v61 = v10;
  v62 = v8;
  objc_msgSend(v11, "liveViewRectForContentRect:aspectRatio:layoutMode:scale:", v16, v4, v6, v8, v10, v13, v15, v19);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[AVTImageTransitioningContainerView staticImage](self, "staticImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[AVTImageTransitioningContainerView staticImage](self, "staticImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "size");
    v31 = v30;
    v33 = v32;

  }
  else
  {
    v31 = 1.0;
    v33 = 1.0;
  }

  v34 = (void *)objc_opt_class();
  -[AVTImageTransitioningContainerView window](self, "window");
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v35, "screen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scale");
  v59 = v6;
  v60 = v4;
  objc_msgSend(v34, "imageViewRectForContentRect:liveViewRect:imageSize:scale:", v4, v6, v62, v61, v21, v23, v25, v27, *(_QWORD *)&v31, *(_QWORD *)&v33, v37);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  -[AVTImageTransitioningContainerView liveView](self, "liveView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frame");
  v66.origin.x = v47;
  v66.origin.y = v48;
  v66.size.width = v49;
  v66.size.height = v50;
  v64.origin.x = v21;
  v64.origin.y = v23;
  v64.size.width = v25;
  v64.size.height = v27;
  LOBYTE(v35) = CGRectEqualToRect(v64, v66);

  if ((v35 & 1) == 0)
  {
    -[AVTImageTransitioningContainerView liveView](self, "liveView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setFrame:", v21, v23, v25, v27);

  }
  -[AVTImageTransitioningContainerView imageViewsContainer](self, "imageViewsContainer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "frame");
  v67.origin.x = v53;
  v67.origin.y = v54;
  v67.size.width = v55;
  v67.size.height = v56;
  v65.origin.x = v39;
  v65.origin.y = v41;
  v65.size.width = v43;
  v65.size.height = v45;
  v57 = CGRectEqualToRect(v65, v67);

  if (!v57)
  {
    -[AVTImageTransitioningContainerView imageViewsContainer](self, "imageViewsContainer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFrame:", v39, v41, v43, v45);

  }
  objc_msgSend((id)objc_opt_class(), "borderMaskRectForContentRect:", v60, v59, v62, v61);
  -[UIView setFrame:](self->_borderMaskView, "setFrame:");
}

- (void)transitionStaticViewToFront
{
  void *v3;
  void *v4;
  id v5;

  -[AVTImageTransitioningContainerView imageViewsContainer](self, "imageViewsContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTImageTransitioningContainerView bringSubviewToFront:](self, "bringSubviewToFront:", v3);

  -[AVTImageTransitioningContainerView liveView](self, "liveView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[AVTImageTransitioningContainerView imageViewsContainer](self, "imageViewsContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

}

- (void)transitionLiveViewToFront
{
  void *v3;
  void *v4;
  id v5;

  -[AVTImageTransitioningContainerView liveView](self, "liveView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTImageTransitioningContainerView bringSubviewToFront:](self, "bringSubviewToFront:", v3);

  -[AVTImageTransitioningContainerView liveView](self, "liveView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[AVTImageTransitioningContainerView imageViewsContainer](self, "imageViewsContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

}

- (void)setStaticViewVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  -[AVTImageTransitioningContainerView imageViewsContainer](self, "imageViewsContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = 0.0;
  if (v3)
    v5 = 1.0;
  objc_msgSend(v4, "setAlpha:", v5);

}

- (UIView)liveView
{
  return self->_liveView;
}

- (UIImage)staticImage
{
  return self->_staticImage;
}

- (CGSize)aspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_aspectRatio.width;
  height = self->_aspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (AVTUIAnimatingImageView)imageViewsContainer
{
  return self->_imageViewsContainer;
}

- (UIView)borderMaskView
{
  return self->_borderMaskView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderMaskView, 0);
  objc_storeStrong((id *)&self->_imageViewsContainer, 0);
  objc_storeStrong((id *)&self->_staticImage, 0);
  objc_storeStrong((id *)&self->_liveView, 0);
}

@end
