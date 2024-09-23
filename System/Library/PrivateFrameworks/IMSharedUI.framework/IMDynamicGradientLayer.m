@implementation IMDynamicGradientLayer

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)IMDynamicGradientLayer;
  -[IMDynamicGradientLayer description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceView(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ referenceView:%@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (IMDynamicGradientLayer)init
{
  IMDynamicGradientLayer *v2;
  const char *v3;
  uint64_t v4;
  IMDynamicGradientLayer *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  CATransform3D v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)IMDynamicGradientLayer;
  v2 = -[IMDynamicGradientLayer init](&v21, sel_init);
  v5 = v2;
  if (v2)
  {
    objc_msgSend_setScreenScale_(v2, v3, v4, 1.0);
    objc_msgSend_layer(MEMORY[0x24BDE56D0], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAnchorPoint_(v8, v9, v10, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend_layer(MEMORY[0x24BDE57E0], v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v20, -1.0, -1.0, 1.0);
    objc_msgSend_setSublayerTransform_(v13, v14, (uint64_t)&v20);
    objc_msgSend_setTrackingLayer_(v5, v15, (uint64_t)v13);
    objc_msgSend_addSublayer_(v5, v16, (uint64_t)v13);
    objc_msgSend_setGradientLayer_(v5, v17, (uint64_t)v8);
    objc_msgSend_addSublayer_(v13, v18, (uint64_t)v8);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)IMDynamicGradientLayer;
  -[IMDynamicGradientLayer dealloc](&v3, sel_dealloc);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (a3)
    objc_msgSend__updateAnimation(self, a2, a3);
  v5.receiver = self;
  v5.super_class = (Class)IMDynamicGradientLayer;
  -[IMDynamicGradientLayer layerDidBecomeVisible:](&v5, sel_layerDidBecomeVisible_, v3);
}

- (void)layoutSublayers
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  const char *v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double MidX;
  CGFloat MidY;
  const char *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CATransform3D v71;
  CATransform3D v72;
  CATransform3D v73;
  objc_super v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v74.receiver = self;
  v74.super_class = (Class)IMDynamicGradientLayer;
  -[IMDynamicGradientLayer layoutSublayers](&v74, sel_layoutSublayers);
  objc_msgSend_superlayer(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceView(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v8;
  if (v5)
  {
    if (v8)
    {
      objc_msgSend_bounds(self, v9, v10);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend_gradientFrame(v11, v20, v21);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend_gradientFrame(v11, v30, v31);
      v69 = v32;
      v70 = v33;
      v67 = v35;
      v68 = v34;
      v66 = v13;
      v75.origin.x = v13;
      v36 = v15;
      v75.origin.y = v15;
      v37 = v17;
      v75.size.width = v17;
      v38 = v19;
      v75.size.height = v19;
      v39 = v27;
      if (!CGRectIsEmpty(v75))
      {
        v76.origin.x = v23;
        v76.origin.y = v25;
        v76.size.width = v27;
        v76.size.height = v29;
        if (!CGRectIsEmpty(v76))
        {
          v77.origin.x = v69;
          v77.origin.y = v70;
          v77.size.height = v67;
          v77.size.width = v68;
          if (!CGRectIsEmpty(v77))
          {
            objc_msgSend_setGradientFrame_(self, v40, v41, v69, v70, v68, v67);
            v42 = v37 / v27 * (v68 / v27);
            objc_msgSend_begin(MEMORY[0x24BDE57D8], v43, v44);
            objc_msgSend_setDisableActions_(MEMORY[0x24BDE57D8], v45, 1);
            objc_msgSend_trackingLayer(self, v46, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setBounds_(v48, v49, v50, 0.0, 0.0, v42, v38 / v29 * (v67 / v29));
            v78.origin.x = v66;
            v78.origin.y = v36;
            v78.size.width = v37;
            v78.size.height = v38;
            MidX = CGRectGetMidX(v78);
            v79.origin.x = v66;
            v79.origin.y = v36;
            v79.size.width = v37;
            v79.size.height = v38;
            MidY = CGRectGetMidY(v79);
            objc_msgSend_setPosition_(v48, v53, v54, MidX, MidY);
            CATransform3DMakeScale(&v73, -v39, -v29, 1.0);
            objc_msgSend_setTransform_(v48, v55, (uint64_t)&v73);
            objc_msgSend_gradientLayer(self, v56, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setContentsRect_(v58, v59, v60, -v42 - v69 / v39, -(v38 / v29 * (v67 / v29)) - v70 / v29, v42, v38 / v29 * (v67 / v29));
            objc_msgSend_setBounds_(v58, v61, v62, v66, v36, v37, v38);
            CATransform3DMakeScale(&v71, 1.0 / v39, 1.0 / v29, 1.0);
            CATransform3DTranslate(&v72, &v71, 0.0, 0.0, 0.0);
            objc_msgSend_setTransform_(v58, v63, (uint64_t)&v72);
            objc_msgSend_commit(MEMORY[0x24BDE57D8], v64, v65);

          }
        }
      }
    }
  }

}

- (void)setReferenceView:(id)a3
{
  id WeakRetained;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  const char *v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  uint64_t v26;
  id obj;
  CGRect v28;
  CGRect v29;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_referenceView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_referenceView, obj);
    objc_msgSend__updateGradientImage(self, v6, v7);
    objc_msgSend__updateAnimation(self, v8, v9);
    v5 = obj;
    if (obj)
    {
      objc_msgSend_gradientFrame(obj, (const char *)obj, v10);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend_gradientFrame(self, v19, v20);
      v29.origin.x = v21;
      v29.origin.y = v22;
      v29.size.width = v23;
      v29.size.height = v24;
      v28.origin.x = v12;
      v28.origin.y = v14;
      v28.size.width = v16;
      v28.size.height = v18;
      v25 = CGRectEqualToRect(v28, v29);
      v5 = obj;
      if (!v25)
      {
        objc_msgSend_setNeedsLayout(self, (const char *)obj, v26);
        v5 = obj;
      }
    }
  }

}

- (void)didMoveToWindow:(id)a3
{
  if (a3)
    objc_msgSend__updateAnimation(self, a2, (uint64_t)a3);
}

- (void)setColors:(id)a3
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *colors;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend_isEqualToArray_(self->_colors, v4, (uint64_t)v11) & 1) == 0)
  {
    v7 = (NSArray *)objc_msgSend_copy(v11, v5, v6);
    colors = self->_colors;
    self->_colors = v7;

    objc_msgSend__updateGradientImage(self, v9, v10);
  }

}

- (void)setScreenScale:(double)a3
{
  uint64_t v3;

  if (self->_screenScale != a3)
  {
    self->_screenScale = a3;
    objc_msgSend__updateGradientImage(self, a2, v3);
  }
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  const char *v5;
  uint64_t v6;

  if (self->_colorSpace != a3 && (CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CGColorSpaceRelease(self->_colorSpace);
    self->_colorSpace = CGColorSpaceRetain(a3);
    objc_msgSend__updateGradientImage(self, v5, v6);
  }
}

- (CGColorSpace)colorSpace
{
  CGColorSpace *result;

  result = self->_colorSpace;
  if (!result)
  {
    result = CGColorSpaceCreateDeviceRGB();
    self->_colorSpace = result;
  }
  return result;
}

- (CGImage)gradient
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  CGImage *Image;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  CFIndex v30;
  __CFArray *Mutable;
  uint64_t v32;
  const CGFloat *v33;
  size_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  CGColorSpace *v39;
  CGContextRef v40;
  CGContext *v41;
  CGFloat v42;
  CGFloat v43;
  CGGradient *v44;
  const char *v45;
  _QWORD v47[2];
  CGPoint v48;
  CGPoint v49;

  v47[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_colors(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceView(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v7;
  Image = 0;
  if (v4 && v7)
  {
    if (qword_2549C1310 != -1)
      dispatch_once(&qword_2549C1310, &unk_24C751028);
    objc_msgSend_gradientFrame(v10, v8, v9);
    objc_msgSend__floorToPixels_(self, v12, v13, v14);
    v16 = v15;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_((void *)qword_2549C1308, v20, (uint64_t)v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend_dictionaryWithCapacity_(MEMORY[0x24BDBCED8], v21, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_((void *)qword_2549C1308, v23, (uint64_t)v22, v19);
    }
    Image = (CGImage *)objc_msgSend_objectForKey_(v22, v21, (uint64_t)v4);
    if (!Image)
    {
      objc_msgSend_screenScale(self, v24, v25);
      v27 = v16 * v26;
      v30 = objc_msgSend_count(v4, v28, v29);
      Mutable = CFArrayCreateMutable(0, v30, MEMORY[0x24BDBD690]);
      v47[0] = v47;
      MEMORY[0x24BDAC7A8](Mutable);
      v33 = (const CGFloat *)((char *)v47 - v32);
      bzero((char *)v47 - v32, v34);
      if (v30 >= 1)
      {
        for (i = 0; i != v30; ++i)
        {
          objc_msgSend_objectAtIndexedSubscript_(v4, v35, i);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          CFArrayAppendValue(Mutable, v38);

          v33[i] = (double)i / (double)(v30 - 1);
        }
      }
      v39 = (CGColorSpace *)objc_msgSend_colorSpace(self, v35, v36);
      v40 = CGBitmapContextCreate(0, 1uLL, (unint64_t)v27, 8uLL, 4uLL, v39, 5u);
      if (v40)
      {
        v41 = v40;
        v42 = *MEMORY[0x24BDBEFB0];
        v43 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        v44 = CGGradientCreateWithColors(0, Mutable, v33);
        v49.x = 0.0;
        v48.x = v42;
        v48.y = v43;
        v49.y = v27;
        CGContextDrawLinearGradient(v41, v44, v48, v49, 0);
        Image = CGBitmapContextCreateImage(v41);
        CGGradientRelease(v44);
        CGContextRelease(v41);
        if (Image)
        {
          objc_msgSend_setObject_forKey_(v22, v45, (uint64_t)Image, v4);
          CGImageRelease(Image);
        }
      }
      else
      {
        _IMWarn();
        CGContextRelease(0);
        Image = 0;
      }
      if (Mutable)
        CFRelease(Mutable);
    }

  }
  return Image;
}

- (void)_updateAnimation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_gradientLayer(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAnimationForKey_(v4, v5, (uint64_t)CFSTR("matchmove"));
  objc_msgSend_superlayer(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceView(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v8 && v11)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDE56E8]);
    objc_msgSend_setKeyPath_(v13, v14, (uint64_t)CFSTR("contentsRect.origin"));
    objc_msgSend_layer(v12, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSourceLayer_(v13, v18, (uint64_t)v17);

    objc_msgSend_setDuration_(v13, v19, v20, INFINITY);
    objc_msgSend_valueWithCGPoint_(MEMORY[0x24BDD1968], v21, v22, 0.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v23;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v24, (uint64_t)v33, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSourcePoints_(v13, v26, (uint64_t)v25);

    objc_msgSend_setBeginTimeMode_(v13, v27, (uint64_t)CFSTR("absolute"));
    objc_msgSend_setBeginTime_(v13, v28, v29, 0.0);
    objc_msgSend_setAdditive_(v13, v30, 1);
    objc_msgSend_setTargetsSuperlayer_(v13, v31, 1);
    objc_msgSend_addAnimation_forKey_(v4, v32, (uint64_t)v13, CFSTR("matchmove"));

  }
}

- (double)_floorToPixels:(double)a3
{
  uint64_t v3;
  double v5;

  objc_msgSend_screenScale(self, a2, v3);
  return floor(v5 * a3) / v5;
}

- (void)_updateGradientImage
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  objc_msgSend_begin(MEMORY[0x24BDE57D8], a2, v2);
  objc_msgSend_setDisableActions_(MEMORY[0x24BDE57D8], v4, 1);
  objc_msgSend_gradientLayer(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_gradient(self, v8, v9);
  objc_msgSend_setContents_(v7, v11, v10);

  objc_msgSend_commit(MEMORY[0x24BDE57D8], v12, v13);
}

- (double)screenScale
{
  return self->_screenScale;
}

- (IMDynamicGradientReferenceView)referenceView
{
  return (IMDynamicGradientReferenceView *)objc_loadWeakRetained((id *)&self->_referenceView);
}

- (NSArray)colors
{
  return self->_colors;
}

- (CALayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (CGRect)gradientFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gradientFrame.origin.x;
  y = self->_gradientFrame.origin.y;
  width = self->_gradientFrame.size.width;
  height = self->_gradientFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setGradientFrame:(CGRect)a3
{
  self->_gradientFrame = a3;
}

- (CATransformLayer)trackingLayer
{
  return self->_trackingLayer;
}

- (void)setTrackingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackingLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_destroyWeak((id *)&self->_referenceView);
}

@end
