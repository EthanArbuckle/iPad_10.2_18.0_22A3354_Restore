@implementation AVPictureInPictureSampleBufferDisplayLayerHostView

- (AVPictureInPictureSampleBufferDisplayLayerHostView)initWithFrame:(CGRect)a3
{
  AVPictureInPictureSampleBufferDisplayLayerHostView *v3;
  AVPictureInPictureCALayerHostView *v4;
  uint64_t v5;
  AVPictureInPictureCALayerHostView *hostView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerHostView;
  v3 = -[AVPictureInPictureSampleBufferDisplayLayerHostView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [AVPictureInPictureCALayerHostView alloc];
    -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](v3, "bounds");
    v5 = -[AVPictureInPictureCALayerHostView initWithFrame:](v4, "initWithFrame:");
    hostView = v3->_hostView;
    v3->_hostView = (AVPictureInPictureCALayerHostView *)v5;

    -[AVPictureInPictureCALayerHostView setTranslatesAutoresizingMaskIntoConstraints:](v3->_hostView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[AVPictureInPictureCALayerHostView setAutoresizingMask:](v3->_hostView, "setAutoresizingMask:", 0);
    -[AVPictureInPictureSampleBufferDisplayLayerHostView addSubview:](v3, "addSubview:", v3->_hostView);
  }
  return v3;
}

- (unsigned)contextId
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contextId");

  return v4;
}

- (void)setContextId:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextId:", v3);

}

- (double)beginTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginTime");
  v5 = v4;

  return v5;
}

- (void)setBeginTime:(double)a3
{
  void *v4;
  id v5;

  -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBeginTime:", a3);

}

- (void)setFrame:(CGRect)a3 contentDimensions:(CGSize)a4 imageQueueSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double y;
  double x;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  _QWORD v22[5];

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v9 = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVPictureInPictureSampleBufferDisplayLayerHostView imageQueueSize](self, "imageQueueSize");
  v16 = height == v15 && width == v14;
  -[AVPictureInPictureSampleBufferDisplayLayerHostView setDeferringGeometryUpdates:](self, "setDeferringGeometryUpdates:", 1);
  -[AVPictureInPictureSampleBufferDisplayLayerHostView contentDimensions](self, "contentDimensions");
  v19 = v18 == v8 && v17 == v7;
  if (!v19
    || (-[AVPictureInPictureSampleBufferDisplayLayerHostView imageQueueSize](self, "imageQueueSize"), v21 != width)
    || v20 != height)
  {
    -[AVPictureInPictureSampleBufferDisplayLayerHostView setNeedsGeometryUpdate:](self, "setNeedsGeometryUpdate:", 1);
  }
  -[AVPictureInPictureSampleBufferDisplayLayerHostView setContentDimensions:](self, "setContentDimensions:", v8, v7);
  -[AVPictureInPictureSampleBufferDisplayLayerHostView setImageQueueSize:](self, "setImageQueueSize:", width, height);
  -[AVPictureInPictureSampleBufferDisplayLayerHostView setFrame:](self, "setFrame:", x, y, v10, v9);
  -[AVPictureInPictureSampleBufferDisplayLayerHostView setDeferringGeometryUpdates:](self, "setDeferringGeometryUpdates:", 0);
  if (v16)
  {
    -[AVPictureInPictureSampleBufferDisplayLayerHostView _updateGeometryIfNeeded](self, "_updateGeometryIfNeeded");
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __96__AVPictureInPictureSampleBufferDisplayLayerHostView_setFrame_contentDimensions_imageQueueSize___block_invoke;
    v22[3] = &unk_1E5BB4CA0;
    v22[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v22);
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v27.receiver = self;
  v27.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerHostView;
  -[AVPictureInPictureSampleBufferDisplayLayerHostView layoutSubviews](&v27, sel_layoutSubviews);
  -[AVPictureInPictureSampleBufferDisplayLayerHostView lastKnownBounds](self, "lastKnownBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](self, "bounds");
  v30.origin.x = v11;
  v30.origin.y = v12;
  v30.size.width = v13;
  v30.size.height = v14;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  if (!CGRectEqualToRect(v28, v30))
    goto LABEL_3;
  -[AVPictureInPictureSampleBufferDisplayLayerHostView lastKnownFrame](self, "lastKnownFrame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[AVPictureInPictureSampleBufferDisplayLayerHostView frame](self, "frame");
  v31.origin.x = v23;
  v31.origin.y = v24;
  v31.size.width = v25;
  v31.size.height = v26;
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  if (!CGRectEqualToRect(v29, v31))
  {
LABEL_3:
    -[AVPictureInPictureSampleBufferDisplayLayerHostView setNeedsGeometryUpdate:](self, "setNeedsGeometryUpdate:", 1);
    -[AVPictureInPictureSampleBufferDisplayLayerHostView frame](self, "frame");
    -[AVPictureInPictureSampleBufferDisplayLayerHostView setLastKnownFrame:](self, "setLastKnownFrame:");
    -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](self, "bounds");
    -[AVPictureInPictureSampleBufferDisplayLayerHostView setLastKnownBounds:](self, "setLastKnownBounds:");
    -[AVPictureInPictureSampleBufferDisplayLayerHostView _updateGeometryIfNeeded](self, "_updateGeometryIfNeeded");
  }
}

- (void)_updateGeometryIfNeeded
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  _BOOL4 v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  int v27;
  BOOL v28;
  BOOL v29;
  void *v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  __int128 v56;
  _OWORD v57[3];
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  _OWORD v61[3];
  CGSize v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  if (-[AVPictureInPictureSampleBufferDisplayLayerHostView needsGeometryUpdate](self, "needsGeometryUpdate")
    && !-[AVPictureInPictureSampleBufferDisplayLayerHostView isDeferringGeometryUpdates](self, "isDeferringGeometryUpdates"))
  {
    -[AVPictureInPictureSampleBufferDisplayLayerHostView setNeedsGeometryUpdate:](self, "setNeedsGeometryUpdate:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

    -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](self, "bounds");
    x = v63.origin.x;
    y = v63.origin.y;
    width = v63.size.width;
    height = v63.size.height;
    if (CGRectIsInfinite(v63))
      goto LABEL_59;
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    if (CGRectIsNull(v64))
      goto LABEL_59;
    -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](self, "bounds");
    v11 = ((v10 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF || v10 < 0;
    v12 = v11 && (unint64_t)(v10 - 1) >= 0xFFFFFFFFFFFFFLL;
    v13 = !v12;
    v14 = v9 < 0 || ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    v15 = v14 && (unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFELL;
    if (v15 || !v13)
      goto LABEL_59;
    -[AVPictureInPictureSampleBufferDisplayLayerHostView contentDimensions](self, "contentDimensions");
    v18 = ((v17 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF || v17 < 0;
    v19 = v18 && (unint64_t)(v17 - 1) >= 0xFFFFFFFFFFFFFLL;
    v20 = !v19;
    v21 = v16 < 0 || ((v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    v22 = v21 && (unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFELL;
    if (v22
      || !v20
      || ((-[AVPictureInPictureSampleBufferDisplayLayerHostView imageQueueSize](self, "imageQueueSize"),
           ((v24 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF)
        ? (v25 = v24 < 0)
        : (v25 = 1),
          v25 ? (v26 = (unint64_t)(v24 - 1) >= 0xFFFFFFFFFFFFFLL) : (v26 = 0),
          v26 ? (v27 = 0) : (v27 = 1),
          v23 >= 0 ? (v28 = ((v23 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE) : (v28 = 1),
          v28 ? (v29 = (unint64_t)(v23 - 1) > 0xFFFFFFFFFFFFELL) : (v29 = 0),
          v29 || !v27))
    {
LABEL_59:
      -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](self, "bounds");
      v48 = v47;
      v50 = v49;
      v52 = v51;
      v54 = v53;
      -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

      -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v57[0] = *MEMORY[0x1E0C9BAA8];
      v57[1] = v56;
      v57[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v46, "setTransform:", v57);
    }
    else
    {
      -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v61[0] = *MEMORY[0x1E0C9BAA8];
      v61[1] = v31;
      v61[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v30, "setTransform:", v61);

      -[AVPictureInPictureSampleBufferDisplayLayerHostView contentDimensions](self, "contentDimensions");
      v70.size.width = 1600.0;
      v70.origin.x = 0.0;
      v70.origin.y = 0.0;
      v70.size.height = 1600.0;
      v65 = AVMakeRectWithAspectRatioInsideRect(v62, v70);
      v32 = v65.origin.x;
      v33 = v65.origin.y;
      v34 = v65.size.width;
      v35 = v65.size.height;
      -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](self, "bounds");
      v36 = CGRectGetWidth(v66);
      v67.origin.x = v32;
      v67.origin.y = v33;
      v67.size.width = v34;
      v67.size.height = v35;
      v37 = v36 / CGRectGetWidth(v67);
      -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](self, "bounds");
      v38 = CGRectGetHeight(v68);
      v69.origin.x = v32;
      v69.origin.y = v33;
      v69.size.width = v34;
      v69.size.height = v35;
      v39 = v38 / CGRectGetHeight(v69);
      memset(&v60.c, 0, 32);
      if (v37 >= v39)
        v39 = v37;
      *(_OWORD *)&v60.a = 0uLL;
      CGAffineTransformMakeScale(&v60, v39, v39);
      -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFrame:", v32, v33, v34, v35);

      v59 = v60;
      -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v59;
      objc_msgSend(v41, "setTransform:", &v58);

      -[AVPictureInPictureSampleBufferDisplayLayerHostView bounds](self, "bounds");
      UIRectGetCenter();
      v43 = v42;
      v45 = v44;
      -[AVPictureInPictureSampleBufferDisplayLayerHostView hostView](self, "hostView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setCenter:", v43, v45);
    }

  }
}

- (AVPictureInPictureCALayerHostView)hostView
{
  return self->_hostView;
}

- (CGSize)imageQueueSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageQueueSize.width;
  height = self->_imageQueueSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageQueueSize:(CGSize)a3
{
  self->_imageQueueSize = a3;
}

- (CGSize)contentDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_contentDimensions.width;
  height = self->_contentDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentDimensions:(CGSize)a3
{
  self->_contentDimensions = a3;
}

- (CGRect)lastKnownFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastKnownFrame.origin.x;
  y = self->_lastKnownFrame.origin.y;
  width = self->_lastKnownFrame.size.width;
  height = self->_lastKnownFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastKnownFrame:(CGRect)a3
{
  self->_lastKnownFrame = a3;
}

- (CGRect)lastKnownBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastKnownBounds.origin.x;
  y = self->_lastKnownBounds.origin.y;
  width = self->_lastKnownBounds.size.width;
  height = self->_lastKnownBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastKnownBounds:(CGRect)a3
{
  self->_lastKnownBounds = a3;
}

- (BOOL)needsGeometryUpdate
{
  return self->_needsGeometryUpdate;
}

- (void)setNeedsGeometryUpdate:(BOOL)a3
{
  self->_needsGeometryUpdate = a3;
}

- (BOOL)isDeferringGeometryUpdates
{
  return self->_deferringGeometryUpdates;
}

- (void)setDeferringGeometryUpdates:(BOOL)a3
{
  self->_deferringGeometryUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostView, 0);
}

uint64_t __96__AVPictureInPictureSampleBufferDisplayLayerHostView_setFrame_contentDimensions_imageQueueSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateGeometryIfNeeded");
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
