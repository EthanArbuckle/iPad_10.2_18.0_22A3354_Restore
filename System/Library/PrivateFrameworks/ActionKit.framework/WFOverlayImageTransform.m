@implementation WFOverlayImageTransform

- (WFOverlayImageTransform)init
{
  WFOverlayImageTransform *v2;
  WFOverlayImageTransform *v3;
  WFOverlayImageTransform *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFOverlayImageTransform;
  v2 = -[WFOverlayImageTransform init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scale = 1.0;
    v4 = v2;
  }

  return v3;
}

- (WFOverlayImageTransform)initWithCenter:(CGPoint)a3 bounds:(CGRect)a4 rotation:(double)a5 scale:(double)a6 opacity:(double)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v13;
  CGFloat v14;
  WFOverlayImageTransform *v15;
  WFOverlayImageTransform *v16;
  WFOverlayImageTransform *v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3.y;
  v14 = a3.x;
  v15 = -[WFOverlayImageTransform init](self, "init");
  v16 = v15;
  if (v15)
  {
    v15->_center.y = v13;
    v15->_bounds.origin.x = x;
    v15->_bounds.origin.y = y;
    v15->_bounds.size.width = width;
    v15->_bounds.size.height = height;
    v15->_rotation = a5;
    v15->_scale = a6;
    v15->_opacity = a7;
    v15->_center.x = v14;
    v17 = v15;
  }

  return v16;
}

- (id)initForCenteringImage:(id)a3 inBackgroundImage:(id)a4
{
  double v6;
  double v7;
  id v8;
  double v9;
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
  CGRect v24;
  CGRect v25;

  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v8 = a4;
  objc_msgSend(a3, "sizeInPoints");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "sizeInPoints");
  v14 = v13;
  v24.origin.x = v6;
  v24.origin.y = v7;
  v24.size.width = v10;
  v24.size.height = v12;
  v15 = v14 / CGRectGetWidth(v24);
  objc_msgSend(v8, "sizeInPoints");
  v17 = v16;
  v25.origin.x = v6;
  v25.origin.y = v7;
  v25.size.width = v10;
  v25.size.height = v12;
  v18 = fmin(v15, v17 / CGRectGetHeight(v25)) / 1.5;
  objc_msgSend(v8, "sizeInPoints");
  v20 = v19 * 0.5 / v18;
  objc_msgSend(v8, "sizeInPoints");
  v22 = v21;

  return -[WFOverlayImageTransform initWithCenter:bounds:rotation:scale:opacity:](self, "initWithCenter:bounds:rotation:scale:opacity:", v20, v22 * 0.5 / v18, v6, v7, v10, v12, 0.0, v18, 0x3FF0000000000000);
}

- (void)applyToImageFile:(id)a3 withOverlayImage:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  WFImageSizeFromFile();
  v10 = v7;
  WFAsyncTransformedImageFromImage();

}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

void __79__WFOverlayImageTransform_applyToImageFile_withOverlayImage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  CGContext *v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;

  v13 = a3;
  objc_msgSend(a2, "drawInContext:inRect:", v13, a4, a5, a6, a7);
  v30 = objc_retainAutorelease(v13);
  v14 = (CGContext *)objc_msgSend(v30, "CGContext");
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  CGContextScaleCTM(v14, v16, v17);
  objc_msgSend(*(id *)(a1 + 32), "center");
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "center");
  CGContextTranslateCTM(v14, v19, v20);
  objc_msgSend(*(id *)(a1 + 32), "rotation");
  CGContextRotateCTM(v14, v21);
  v22 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v23 = CGRectGetWidth(v31) * -0.5;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v24 = CGRectGetHeight(v32) * -0.5;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v26 = v25;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v28 = v27;
  objc_msgSend(*(id *)(a1 + 32), "opacity");
  objc_msgSend(v22, "drawInContext:inRect:blendMode:alpha:", v30, 0, v23, v24, v26, v28, v29);

}

@end
