@implementation ARCoachingDeviceController

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CALayer bounds](self->_deviceLayer, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CALayer *deviceMaskLayer;
  double MidX;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CALayer setBounds:](self->_deviceLayer, "setBounds:");
  -[CALayer setBounds:](self->_holeLayer, "setBounds:", x, y, width, height);
  deviceMaskLayer = self->_deviceMaskLayer;
  if (deviceMaskLayer)
  {
    -[CALayer setBounds:](deviceMaskLayer, "setBounds:", x, y, width, height);
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    MidX = CGRectGetMidX(v10);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    -[CALayer setPosition:](self->_deviceMaskLayer, "setPosition:", MidX, CGRectGetMidY(v11));
  }
}

- (CGPoint)position
{
  double v2;
  double v3;
  CGPoint result;

  -[CALayer position](self->_deviceLayer, "position");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[CALayer setPosition:](self->_deviceLayer, "setPosition:");
  -[CALayer setPosition:](self->_holeLayer, "setPosition:", x, y);
}

- (CATransform3D)transform
{
  CATransform3D *result;

  result = (CATransform3D *)self->_deviceLayer;
  if (result)
    return (CATransform3D *)-[CATransform3D transform](result, "transform");
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return result;
}

- (void)setTransform:(CATransform3D *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[8];
  _OWORD v14[8];

  v5 = *(_OWORD *)&a3->m33;
  v14[4] = *(_OWORD *)&a3->m31;
  v14[5] = v5;
  v6 = *(_OWORD *)&a3->m43;
  v14[6] = *(_OWORD *)&a3->m41;
  v14[7] = v6;
  v7 = *(_OWORD *)&a3->m13;
  v14[0] = *(_OWORD *)&a3->m11;
  v14[1] = v7;
  v8 = *(_OWORD *)&a3->m23;
  v14[2] = *(_OWORD *)&a3->m21;
  v14[3] = v8;
  -[CALayer setTransform:](self->_deviceLayer, "setTransform:", v14);
  v9 = *(_OWORD *)&a3->m33;
  v13[4] = *(_OWORD *)&a3->m31;
  v13[5] = v9;
  v10 = *(_OWORD *)&a3->m43;
  v13[6] = *(_OWORD *)&a3->m41;
  v13[7] = v10;
  v11 = *(_OWORD *)&a3->m13;
  v13[0] = *(_OWORD *)&a3->m11;
  v13[1] = v11;
  v12 = *(_OWORD *)&a3->m23;
  v13[2] = *(_OWORD *)&a3->m21;
  v13[3] = v12;
  -[CALayer setTransform:](self->_holeLayer, "setTransform:", v13);
}

- (float)opacity
{
  float result;

  -[CALayer opacity](self->_deviceLayer, "opacity");
  return result;
}

- (void)setOpacity:(float)a3
{
  double v5;
  CALayer *holeLayer;

  -[CALayer setOpacity:](self->_deviceLayer, "setOpacity:");
  holeLayer = self->_holeLayer;
  if (self->_geoTrackingMode)
  {
    LODWORD(v5) = 1.0;
    -[CALayer setOpacity:](holeLayer, "setOpacity:", v5);
    holeLayer = self->_holeLayer;
  }
  *(float *)&v5 = a3;
  -[CALayer setOpacity:](holeLayer, "setOpacity:", v5);
}

- (ARCoachingDeviceController)initWithDeviceMaskImage:(id)a3 solidColor:(id)a4 geoTrackingMode:(BOOL)a5
{
  id v8;
  id v9;
  ARCoachingDeviceController *v10;
  uint64_t v11;
  CALayer *holeLayer;
  uint64_t v13;
  uint64_t v14;
  CALayer *deviceLayer;
  uint64_t v16;
  CALayer *deviceMaskLayer;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)ARCoachingDeviceController;
  v10 = -[ARCoachingDeviceController init](&v26, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    holeLayer = v10->_holeLayer;
    v10->_holeLayer = (CALayer *)v11;

    -[CALayer setCompositingFilter:](v10->_holeLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2E38]);
    -[CALayer setBackgroundColor:](v10->_holeLayer, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v9), "CGColor"));
    -[CALayer setCornerRadius:](v10->_holeLayer, "setCornerRadius:", 8.0);
    v13 = *MEMORY[0x1E0CD2A68];
    -[CALayer setCornerCurve:](v10->_holeLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v14 = objc_claimAutoreleasedReturnValue();
    deviceLayer = v10->_deviceLayer;
    v10->_deviceLayer = (CALayer *)v14;

    v10->_geoTrackingMode = a5;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v16 = objc_claimAutoreleasedReturnValue();
      deviceMaskLayer = v10->_deviceMaskLayer;
      v10->_deviceMaskLayer = (CALayer *)v16;

      v18 = objc_retainAutorelease(v8);
      -[CALayer setContents:](v10->_deviceMaskLayer, "setContents:", objc_msgSend(v18, "CGImage"));
      -[CALayer setAllowsEdgeAntialiasing:](v10->_deviceMaskLayer, "setAllowsEdgeAntialiasing:", 1);
      -[CALayer setMask:](v10->_deviceLayer, "setMask:", v10->_deviceMaskLayer);
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](v10->_deviceLayer, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));

      objc_msgSend(v18, "size");
      v21 = v20;
      objc_msgSend(v18, "size");
      v23 = v21 / v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBorderColor:](v10->_deviceLayer, "setBorderColor:", objc_msgSend(v24, "CGColor"));

      -[CALayer setBorderWidth:](v10->_deviceLayer, "setBorderWidth:", 2.0);
      -[CALayer setCornerRadius:](v10->_deviceLayer, "setCornerRadius:", 8.0);
      -[CALayer setCornerCurve:](v10->_deviceLayer, "setCornerCurve:", v13);
      v23 = 0.5;
    }
    v10->_aspectRatio = v23;
  }

  return v10;
}

- (ARCoachingDeviceController)initWithDeviceMaskImage:(id)a3 geoTrackingMode:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  ARCoachingDeviceController *v9;
  uint64_t v10;
  CALayer *shineLayer;
  uint64_t v12;
  CALayer *shineInnerLayer;
  id v14;
  CALayer *v15;
  CGAffineTransform v17;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CEA478];
  v7 = a3;
  objc_msgSend(v6, "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ARCoachingDeviceController initWithDeviceMaskImage:solidColor:geoTrackingMode:](self, "initWithDeviceMaskImage:solidColor:geoTrackingMode:", v7, v8, v4);

  if (v9)
  {
    -[CALayer setCompositingFilter:](v9->_holeLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v10 = objc_claimAutoreleasedReturnValue();
    shineLayer = v9->_shineLayer;
    v9->_shineLayer = (CALayer *)v10;

    -[CALayer setCornerRadius:](v9->_shineLayer, "setCornerRadius:", 8.0);
    -[CALayer setCornerCurve:](v9->_shineLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[CALayer setMasksToBounds:](v9->_shineLayer, "setMasksToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v12 = objc_claimAutoreleasedReturnValue();
    shineInnerLayer = v9->_shineInnerLayer;
    v9->_shineInnerLayer = (CALayer *)v12;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v9->_shineInnerLayer, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

    -[CALayer setAllowsEdgeAntialiasing:](v9->_shineInnerLayer, "setAllowsEdgeAntialiasing:", 1);
    v15 = v9->_shineInnerLayer;
    CGAffineTransformMakeRotation(&v17, 1.09955743);
    -[CALayer setAffineTransform:](v15, "setAffineTransform:", &v17);
    -[CALayer addSublayer:](v9->_shineLayer, "addSublayer:", v9->_shineInnerLayer);
  }
  return v9;
}

- (void)update:(double)a3 visibility:(double)a4 layer:(id)a5 renderParams:(id *)a6
{
  id v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  float v19;
  float v20;
  float v21;
  float v22;
  double MidX;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  float v27;
  float v28;
  double v29;
  __float2 v30;
  float v31;
  double var2;
  float v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  CATransform3D *v40;
  float v41;
  double v42;
  double v43;
  double v44;
  CALayer *shineLayer;
  double v46;
  double v47;
  double v48;
  float v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  _OWORD v54[16];
  CATransform3D v55;
  CATransform3D v56;
  CATransform3D v57;
  CATransform3D v58;
  CATransform3D v59;
  CATransform3D v60;
  CATransform3D v61;
  CATransform3D v62;
  CATransform3D v63;
  CATransform3D v64;
  CATransform3D v65;
  CATransform3D v66;
  CATransform3D v67;
  CATransform3D v68;
  CATransform3D v69;
  _OWORD v70[5];
  uint64_t v71;
  double v72;
  __int128 v73;
  __int128 v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v10 = a5;
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  *(float *)&v11 = a3;
  v19 = cosf(*(float *)&v11);
  if (self->_geoTrackingMode)
  {
    v20 = a3 * 0.25 * 3.14159265 + a3 * 0.25 * 3.14159265;
    v19 = sinf(v20);
  }
  v21 = v19;
  v22 = v18 / 600.0;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[ARCoachingDeviceController setBounds:](self, "setBounds:", 0.0, 0.0, self->_aspectRatio * 72.0 * v22, (float)(v22 * 72.0));
  v75.origin.x = v12;
  v75.origin.y = v14;
  v75.size.width = v16;
  v75.size.height = v18;
  MidX = CGRectGetMidX(v75);
  v76.origin.x = v12;
  v76.origin.y = v14;
  v76.size.width = v16;
  v76.size.height = v18;
  -[ARCoachingDeviceController setPosition:](self, "setPosition:", MidX, CGRectGetMidY(v76));
  v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v70[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v70[3] = v24;
  v70[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v71 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
  v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v70[0] = *MEMORY[0x1E0CD2610];
  v70[1] = v25;
  v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v73 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v74 = v26;
  v72 = -1.0 / (v18 * 0.615763547);
  -[ARCoachingDeviceController setTransform:](self, "setTransform:", v70);
  -[ARCoachingDeviceController transform](self, "transform");
  CATransform3DRotate(&v69, &v68, a6->var0 * 3.14159265 / 180.0, 0.0, 1.0, 0.0);
  v67 = v69;
  -[ARCoachingDeviceController setTransform:](self, "setTransform:", &v67);
  v27 = a4 * 0.7 + 0.3;
  -[ARCoachingDeviceController transform](self, "transform");
  CATransform3DScale(&v66, &v65, v27, v27, 1.0);
  v64 = v66;
  -[ARCoachingDeviceController setTransform:](self, "setTransform:", &v64);
  v28 = a6->var1 + (float)(v21 * 0.25133);
  v30 = __sincosf_stret(v28);
  v31 = (1.0 - v30.__cosval) / -0.0314168334 + 1.0;
  var2 = a6->var2;
  v33 = v18 * 0.04618 * v31 * var2 + v18 * 0.04618;
  v34 = a4 * 0.4 + 0.6;
  v35 = (float)(a6->var3 * v22) + v18 * 0.15 * v34;
  v36 = v34 * (v18 * 0.182 * (float)(v30.__sinval / 0.24869)) * var2;
  if (self->_geoTrackingMode)
    v37 = v36 * 0.5;
  else
    v37 = v36;
  if (self->_geoTrackingMode)
    v38 = (float)(v35 + -72.0) + (float)(v30.__sinval * 5.0);
  else
    v38 = v35;
  if (self->_geoTrackingMode)
    v39 = (float)(v30.__sinval * -55.0) + 25.0;
  else
    v39 = v33;
  *(float *)&v29 = (float)(v30.__sinval * -55.0) + 25.0;
  -[ARCoachingDeviceController transform](self, "transform", v29);
  CATransform3DTranslate(&v63, &v62, v37, v38, v39);
  v61 = v63;
  -[ARCoachingDeviceController setTransform:](self, "setTransform:", &v61);
  if (self->_geoTrackingMode)
  {
    -[ARCoachingDeviceController transform](self, "transform");
    CATransform3DRotate(&v60, &v59, (float)((float)(v28 * -0.75) + -0.3), 0.0, 1.0, 0.0);
    v58 = v60;
    v40 = &v58;
  }
  else
  {
    -[ARCoachingDeviceController transform](self, "transform");
    CATransform3DRotate(&v57, &v56, v28, 0.0, 1.0, 0.0);
    v55 = v57;
    v40 = &v55;
  }
  -[ARCoachingDeviceController setTransform:](self, "setTransform:", v40);
  v41 = a4;
  *(float *)&v42 = v41 * v41;
  -[ARCoachingDeviceController setOpacity:](self, "setOpacity:", v42);
  objc_msgSend(v10, "contentsScale");
  v44 = v43;

  -[CALayer setContentsScale:](self->_deviceMaskLayer, "setContentsScale:", v44);
  -[ARCoachingDeviceController bounds](self, "bounds");
  -[CALayer setBounds:](self->_shineLayer, "setBounds:");
  -[ARCoachingDeviceController opacity](self, "opacity");
  -[CALayer setOpacity:](self->_shineLayer, "setOpacity:");
  -[ARCoachingDeviceController transform](self, "transform");
  shineLayer = self->_shineLayer;
  v54[4] = v54[12];
  v54[5] = v54[13];
  v54[6] = v54[14];
  v54[7] = v54[15];
  v54[0] = v54[8];
  v54[1] = v54[9];
  v54[2] = v54[10];
  v54[3] = v54[11];
  -[CALayer setTransform:](shineLayer, "setTransform:", v54);
  -[ARCoachingDeviceController position](self, "position");
  -[CALayer setPosition:](self->_shineLayer, "setPosition:");
  LODWORD(v46) = 1053609165;
  -[CALayer setOpacity:](self->_shineInnerLayer, "setOpacity:", v46);
  -[CALayer bounds](self->_shineLayer, "bounds");
  *(float *)&v44 = v47 * 6.0;
  -[CALayer bounds](self->_shineLayer, "bounds");
  v49 = v48;
  v50 = *(float *)&v44;
  v51 = v49;
  -[CALayer setBounds:](self->_shineInnerLayer, "setBounds:", 0.0, 0.0, v50, v49);
  v52 = v51 + v51 * -0.2 * v21;
  -[CALayer bounds](self->_shineLayer, "bounds");
  v53 = CGRectGetMidX(v77) + 5.0;
  -[CALayer bounds](self->_shineLayer, "bounds");
  -[CALayer setPosition:](self->_shineInnerLayer, "setPosition:", v53, CGRectGetMidX(v78) - v52);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
}

- (void)setLayerParent:(id)a3
{
  CALayer *holeLayer;
  id v5;

  holeLayer = self->_holeLayer;
  v5 = a3;
  objc_msgSend(v5, "addSublayer:", holeLayer);
  objc_msgSend(v5, "addSublayer:", self->_shineLayer);
  objc_msgSend(v5, "addSublayer:", self->_deviceLayer);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shineInnerLayer, 0);
  objc_storeStrong((id *)&self->_deviceMaskLayer, 0);
  objc_storeStrong((id *)&self->_shineLayer, 0);
  objc_storeStrong((id *)&self->_holeLayer, 0);
  objc_storeStrong((id *)&self->_deviceLayer, 0);
}

@end
