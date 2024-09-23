@implementation WFOverlayImageEditorCanvasView

- (WFOverlayImageEditorCanvasView)initWithBackgroundImage:(id)a3 overlayImage:(id)a4 transform:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFOverlayImageEditorCanvasView *v11;
  WFOverlayImageEditorCanvasView *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  WFOverlayImageEditorCanvasView *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WFOverlayImageEditorCanvasView;
  v11 = -[WFOverlayImageEditorCanvasView init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    -[WFOverlayImageEditorCanvasView setClipsToBounds:](v11, "setClipsToBounds:", 1);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v8);
    objc_msgSend(v13, "setUserInteractionEnabled:", 1);
    objc_msgSend(v13, "setClipsToBounds:", 1);
    -[WFOverlayImageEditorCanvasView addSubview:](v12, "addSubview:", v13);
    objc_storeWeak((id *)&v12->_backgroundImageView, v13);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v9);
    objc_msgSend(v14, "setUserInteractionEnabled:", 1);
    objc_msgSend(v14, "setContentMode:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&v12->_backgroundImageView);
    objc_msgSend(WeakRetained, "addSubview:", v14);

    objc_storeWeak((id *)&v12->_overlayImageView, v14);
    objc_storeStrong((id *)&v12->_imageTransform, a5);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD808]), "initWithTarget:action:", v12, sel_handlePinchGesture_);
    objc_msgSend(v16, "setDelegate:", v12);
    -[WFOverlayImageEditorCanvasView addGestureRecognizer:](v12, "addGestureRecognizer:", v16);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", v12, sel_handlePanGesture_);
    objc_msgSend(v17, "setDelegate:", v12);
    -[WFOverlayImageEditorCanvasView addGestureRecognizer:](v12, "addGestureRecognizer:", v17);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD8D0]), "initWithTarget:action:", v12, sel_handleRotateGesture_);
    objc_msgSend(v18, "setDelegate:", v12);
    -[WFOverlayImageEditorCanvasView addGestureRecognizer:](v12, "addGestureRecognizer:", v18);
    objc_storeWeak((id *)&v12->_rotateRecognizer, v18);
    v19 = v12;

  }
  return v12;
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
  id WeakRetained;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double MidX;
  double MidY;
  id v21;
  double x;
  double y;
  double width;
  double height;
  id v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  id v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  double v40;
  double v41;
  id v42;
  float64x2_t v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v48;
  CGAffineTransform v49;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v50.receiver = self;
  v50.super_class = (Class)WFOverlayImageEditorCanvasView;
  -[WFOverlayImageEditorCanvasView layoutSubviews](&v50, sel_layoutSubviews);
  -[WFOverlayImageEditorCanvasView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  objc_msgSend(WeakRetained, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  v17 = CGRectGetWidth(v51) / v14;
  v52.origin.x = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  memset(&v49, 0, sizeof(v49));
  v18 = fmin(v17, CGRectGetHeight(v52) / v16);
  CGAffineTransformMakeScale(&v49, v18, v18);
  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  MidX = CGRectGetMidX(v53);
  v54.origin.x = v4;
  v54.origin.y = v6;
  v54.size.width = v8;
  v54.size.height = v10;
  MidY = CGRectGetMidY(v54);
  v21 = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  objc_msgSend(v21, "setCenter:", MidX, MidY);

  v55.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
  v55.origin.y = *(CGFloat *)(MEMORY[0x24BDBEFB0] + 8);
  v55.size.width = v16 * v49.c + v49.a * v14;
  v55.size.height = v16 * v49.d + v49.b * v14;
  v56 = CGRectIntegral(v55);
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  v26 = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  objc_msgSend(v26, "setBounds:", x, y, width, height);

  memset(&v48, 0, sizeof(v48));
  -[WFOverlayImageTransform scale](self->_imageTransform, "scale");
  v28 = v27;
  -[WFOverlayImageTransform scale](self->_imageTransform, "scale");
  CGAffineTransformMakeScale(&t1, v28, v29);
  t2 = v49;
  CGAffineTransformConcat(&v48, &t1, &t2);
  -[WFOverlayImageTransform rotation](self->_imageTransform, "rotation");
  CGAffineTransformMakeRotation(&v45, v30);
  v31 = objc_loadWeakRetained((id *)&self->_overlayImageView);
  v44 = v45;
  objc_msgSend(v31, "setTransform:", &v44);

  -[WFOverlayImageTransform center](self->_imageTransform, "center");
  v43 = vaddq_f64(*(float64x2_t *)&v48.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v48.c, v32), *(float64x2_t *)&v48.a, v33));
  v34 = objc_loadWeakRetained((id *)&self->_overlayImageView);
  objc_msgSend(v34, "setCenter:", *(_OWORD *)&v43);

  -[WFOverlayImageTransform bounds](self->_imageTransform, "bounds");
  t2 = v48;
  v58 = CGRectApplyAffineTransform(v57, &t2);
  v35 = v58.origin.x;
  v36 = v58.origin.y;
  v37 = v58.size.width;
  v38 = v58.size.height;
  v39 = objc_loadWeakRetained((id *)&self->_overlayImageView);
  objc_msgSend(v39, "setBounds:", v35, v36, v37, v38);

  -[WFOverlayImageTransform opacity](self->_imageTransform, "opacity");
  v41 = v40;
  v42 = objc_loadWeakRetained((id *)&self->_overlayImageView);
  objc_msgSend(v42, "setAlpha:", v41);

}

- (void)handleRotateGesture:(id)a3
{
  WFOverlayImageTransform *imageTransform;
  id v5;
  double v6;
  double v7;
  double v8;

  imageTransform = self->_imageTransform;
  v5 = a3;
  objc_msgSend(v5, "rotation");
  v7 = v6;
  -[WFOverlayImageTransform rotation](imageTransform, "rotation");
  -[WFOverlayImageTransform setRotation:](imageTransform, "setRotation:", v7 + v8);
  objc_msgSend(v5, "setRotation:", 0.0);

  -[WFOverlayImageEditorCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (void)handlePanGesture:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id WeakRetained;
  void *v14;
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
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  -[WFOverlayImageEditorCanvasView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  objc_msgSend(WeakRetained, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v16 = v15;
  v18 = v17;

  objc_msgSend(v4, "translationInView:", self);
  v20 = v19;
  v22 = v21;
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  v23 = CGRectGetWidth(v33) / v16;
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  v24 = fmin(v23, CGRectGetHeight(v34) / v18);
  objc_msgSend(v4, "setTranslation:inView:", self, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  -[WFOverlayImageTransform center](self->_imageTransform, "center");
  v30 = v26;
  v31 = v25;
  -[WFOverlayImageTransform scale](self->_imageTransform, "scale");
  v28 = v20 / v24 / v27;
  -[WFOverlayImageTransform scale](self->_imageTransform, "scale");
  CGAffineTransformMakeTranslation(&v32, v28, v22 / v24 / v29);
  -[WFOverlayImageTransform setCenter:](self->_imageTransform, "setCenter:", vaddq_f64(*(float64x2_t *)&v32.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v32.c, v30), *(float64x2_t *)&v32.a, v31)));
  -[WFOverlayImageEditorCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (void)handlePinchGesture:(id)a3
{
  WFOverlayImageTransform *imageTransform;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;

  imageTransform = self->_imageTransform;
  v5 = a3;
  objc_msgSend(v5, "scale");
  v7 = v6;
  -[WFOverlayImageTransform scale](imageTransform, "scale");
  -[WFOverlayImageTransform setScale:](imageTransform, "setScale:", v7 * v8);
  -[WFOverlayImageTransform center](self->_imageTransform, "center");
  v14 = v10;
  v15 = v9;
  objc_msgSend(v5, "scale");
  v12 = 1.0 / v11;
  objc_msgSend(v5, "scale");
  CGAffineTransformMakeScale(&v16, v12, 1.0 / v13);
  -[WFOverlayImageTransform setCenter:](self->_imageTransform, "setCenter:", vaddq_f64(*(float64x2_t *)&v16.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v16.c, v14), *(float64x2_t *)&v16.a, v15)));
  objc_msgSend(v5, "setScale:", 1.0);

  -[WFOverlayImageEditorCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isRotationEnabled
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rotateRecognizer);
  v3 = objc_msgSend(WeakRetained, "isEnabled");

  return v3;
}

- (void)setRotationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rotateRecognizer);
  objc_msgSend(WeakRetained, "setEnabled:", v3);

}

- (void)setOverlayImageOpacity:(double)a3
{
  -[WFOverlayImageTransform setOpacity:](self->_imageTransform, "setOpacity:", a3);
  -[WFOverlayImageEditorCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (void)reset
{
  -[WFOverlayImageTransform setRotation:](self->_imageTransform, "setRotation:", 0.0);
  -[WFOverlayImageEditorCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (WFOverlayImageTransform)imageTransform
{
  return self->_imageTransform;
}

- (UIRotationGestureRecognizer)rotateRecognizer
{
  return (UIRotationGestureRecognizer *)objc_loadWeakRetained((id *)&self->_rotateRecognizer);
}

- (UIImageView)backgroundImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_backgroundImageView);
}

- (UIImageView)overlayImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_overlayImageView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlayImageView);
  objc_destroyWeak((id *)&self->_backgroundImageView);
  objc_destroyWeak((id *)&self->_rotateRecognizer);
  objc_storeStrong((id *)&self->_imageTransform, 0);
}

@end
