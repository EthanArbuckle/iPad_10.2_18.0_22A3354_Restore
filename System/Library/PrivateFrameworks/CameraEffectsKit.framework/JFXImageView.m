@implementation JFXImageView

- (JFXImageView)initWithFrame:(CGRect)a3
{
  JFXImageView *v3;
  JFXImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageView;
  v3 = -[JFXImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[JFXImageView JFXImageView_commonInit](v3, "JFXImageView_commonInit");
  return v4;
}

- (JFXImageView)initWithCoder:(id)a3
{
  JFXImageView *v3;
  JFXImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageView;
  v3 = -[JFXImageView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[JFXImageView JFXImageView_commonInit](v3, "JFXImageView_commonInit");
  return v4;
}

- (void)JFXImageView_commonInit
{
  JTImage *jtImage;
  UIView *imageView;

  if (JFXImageView_commonInit_onceToken != -1)
    dispatch_once(&JFXImageView_commonInit_onceToken, &__block_literal_global_53);
  self->_enableDebugDrawing = JFXImageView_commonInit_s_enableDebugDrawing;
  self->_disableIOSurface = JFXImageView_commonInit_s_disableIOSurface;
  self->_disableMetalKit = JFXImageView_commonInit_s_disableMetalKit;
  self->_preferIOSurfaceForYUV = 0;
  self->_preferMetalKit = 0;
  jtImage = self->_jtImage;
  self->_jtImage = 0;

  imageView = self->_imageView;
  self->_imageView = 0;

  self->_imageViewType = 0;
  -[JFXImageView setCurrentImageViewType:](self, "setCurrentImageViewType:", -1);
}

void __39__JFXImageView_JFXImageView_commonInit__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("JTImageViewDebugDraw"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    JFXImageView_commonInit_s_enableDebugDrawing = objc_msgSend(v2, "BOOLForKey:", CFSTR("JTImageViewDebugDraw"));

  }
  JFXLog_core();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("JTImageIOSurfaceViewDisabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    JFXImageView_commonInit_s_disableIOSurface = objc_msgSend(v13, "BOOLForKey:", CFSTR("JTImageIOSurfaceViewDisabled"));

  }
  JFXLog_core();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKey:", CFSTR("JTImageMTKViewDisabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    JFXImageView_commonInit_s_disableMetalKit = objc_msgSend(v24, "BOOLForKey:", CFSTR("JTImageMTKViewDisabled"));

  }
  JFXLog_core();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_1(v25, v26, v27, v28, v29, v30, v31, v32);

}

- (void)reconfigureImageView
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_2269A9000, a3, OS_LOG_TYPE_DEBUG, "configuring %@ for mode %@ (1:uiimage 2:iosurface 3:metal)", (uint8_t *)&v6, 0x16u);

}

- (void)updateImageViewImage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[JFXImageView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    switch(self->_currentImageViewType)
    {
      case 1:
        -[JFXImageView imageView](self, "imageView");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        -[JTImage image](self->_jtImage, "image");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setImage:", v4);

        -[JFXImageView layer](self, "layer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "borderWidth");
        v7 = v6 + v6;
        objc_msgSend(v12, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBorderWidth:", v7);

        if (self->_enableDebugDrawing)
        {
          objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
          v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v10 = objc_msgSend(v9, "CGColor");
          objc_msgSend(v12, "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setBorderColor:", v10);

        }
        goto LABEL_4;
      case 2:
      case 3:
      case 4:
        -[JFXImageView imageView](self, "imageView");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setJtImage:", self->_jtImage);
LABEL_4:

        break;
      default:
        return;
    }
  }
}

- (id)stringFromImageViewType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("None");
  else
    return (id)*((_QWORD *)&off_24EE5B108 + a3);
}

- (int64_t)preferredImageViewTypeForImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int64_t v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "hasPVImageBufferAndCanCreateCVPixelBufferWithoutCopy"))
    {
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "jfx_displayColorSpace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "isHDRSpace")
        && (objc_msgSend(v5, "pvImageBuffer"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(MEMORY[0x24BE78FF8], "jfx_getColorSpaceFromImageBuffer:", v8),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "isHDRSpace"),
            v9,
            v8,
            (v10 & 1) != 0))
      {
        v11 = 3;
      }
      else if (self->_disableIOSurface || !self->_preferIOSurfaceForYUV)
      {
        if (self->_disableMetalKit || !self->_preferMetalKit)
          v11 = 1;
        else
          v11 = 4;
      }
      else
      {
        v11 = 2;
      }

    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (void)flipX
{
  void *v2;
  void *v3;
  id v4;

  if (self->_currentImageViewType == 1)
  {
    -[JFXImageView imageView](self, "imageView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageWithHorizontallyFlippedOrientation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v3);

  }
}

- (void)updateDebugDrawing
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (self->_enableDebugDrawing)
  {
    +[JFXImageView colorFromImageViewType:](JFXImageView, "colorFromImageViewType:", self->_currentImageViewType);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    -[JFXImageView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderColor:", v4);

    -[JFXImageView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 2.0;
  }
  else
  {
    -[JFXImageView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
  }
  v8 = v6;
  objc_msgSend(v6, "setBorderWidth:", v7);

}

+ (id)colorFromImageViewType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case -1:
      objc_msgSend(MEMORY[0x24BDF6950], "redColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend(MEMORY[0x24BDF6950], "yellowColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDF6950], "purpleColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDF6950], "orangeColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDF6950], "greenColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDF6950], "cyanColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (id)colorFromRenderingType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case -1:
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend(MEMORY[0x24BDF6950], "blueColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDF6950], "magentaColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDF6950], "brownColor", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (BOOL)normalizedQuadVertices:(id *)a3 viewSize:(CGSize)a4 textureSize:(CGSize)a5 contentMode:(int64_t)a6
{
  double v6;
  float v10;
  float v11;
  CGFloat v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float v17;
  float v18;
  int32x2_t v23;
  int32x2_t v24;
  NSObject *v25;
  uint8_t buf[16];

  if (!a3)
    return 0;
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (a4.width == *MEMORY[0x24BDBF148] && a4.height == v6)
    return 0;
  if (a5.width == *MEMORY[0x24BDBF148] && a5.height == v6)
    return 0;
  if ((unint64_t)(a6 - 4) < 9)
  {
    v10 = a4.width + a4.width;
    v11 = a4.height + a4.height;
    v14.f32[0] = a5.width / v10;
    v12 = a5.height / v11;
    *(float *)&v12 = v12;
    v13 = vmulq_n_f32((float32x4_t)xmmword_226AB7890, v14.f32[0]);
    v14.i32[1] = -1082130432;
    v15 = vmulq_n_f32((float32x4_t)xmmword_226AB78A0, *(float *)&v12);
    switch(a6)
    {
      case 5:
        goto LABEL_23;
      case 6:
        goto LABEL_27;
      case 7:
        v14.f32[0] = 1.0 - v13.f32[0];
        goto LABEL_21;
      case 8:
        v14.f32[0] = -1.0 - v13.f32[1];
LABEL_21:
        v13 = vsubq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0));
        goto LABEL_29;
      case 9:
        v14.f32[0] = 1.0 - v13.f32[0];
        v14 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0);
        v13 = vsubq_f32(v13, v14);
LABEL_23:
        v14.f32[0] = -1.0 - v15.f32[0];
        goto LABEL_28;
      case 10:
        v14.f32[0] = -1.0 - v13.f32[1];
        v14 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0);
        v13 = vsubq_f32(v13, v14);
        v14.f32[0] = -1.0 - v15.f32[0];
        goto LABEL_28;
      case 11:
        *(float *)&v12 = 1.0 - v13.f32[0];
        v13 = vsubq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v12, 0));
        v14.f32[0] = 1.0 - v15.f32[2];
        goto LABEL_28;
      case 12:
        v14.f32[0] = -1.0 - v13.f32[1];
        v14 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0);
        v13 = vsubq_f32(v13, v14);
LABEL_27:
        v14.f32[0] = 1.0 - v15.f32[2];
LABEL_28:
        v15 = vsubq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0));
        break;
      default:
        goto LABEL_29;
    }
    goto LABEL_29;
  }
  v13 = (float32x4_t)xmmword_226AB7890;
  v15 = (float32x4_t)xmmword_226AB78A0;
  if (a6)
  {
    v17 = a4.width / a4.height;
    v18 = a5.width / a5.height;
    if (a6 == 2)
    {
      if (v18 <= v17)
      {
LABEL_19:
        v15 = vmulq_n_f32((float32x4_t)xmmword_226AB78A0, v17 / v18);
        goto LABEL_29;
      }
    }
    else
    {
      if (a6 != 1)
      {
        JFXLog_core();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2269A9000, v25, OS_LOG_TYPE_DEFAULT, "Unsupported content mode. Falling back to UIViewContentModeScaleToFill", buf, 2u);
        }

        v15 = (float32x4_t)xmmword_226AB78A0;
        v13 = (float32x4_t)xmmword_226AB7890;
        goto LABEL_29;
      }
      if (v18 > v17)
        goto LABEL_19;
    }
    v13 = vmulq_n_f32((float32x4_t)xmmword_226AB7890, v18 / v17);
  }
LABEL_29:
  __asm { FMOV            V1.2S, #1.0 }
  *(int32x2_t *)a3 = vzip1_s32(*(int32x2_t *)v13.f32, *(int32x2_t *)v15.f32);
  *((_QWORD *)a3 + 1) = _D1;
  *((int32x2_t *)a3 + 2) = vzip2_s32(*(int32x2_t *)v13.f32, *(int32x2_t *)v15.f32);
  *((_QWORD *)a3 + 3) = 0x3F80000000000000;
  v23 = (int32x2_t)vextq_s8((int8x16_t)v15, (int8x16_t)v15, 8uLL).u64[0];
  v24 = (int32x2_t)vextq_s8((int8x16_t)v13, (int8x16_t)v13, 8uLL).u64[0];
  *((int32x2_t *)a3 + 4) = vzip1_s32(v24, v23);
  *((_QWORD *)a3 + 5) = 1065353216;
  *((int32x2_t *)a3 + 6) = vzip2_s32(v24, v23);
  *((_QWORD *)a3 + 7) = 0;
  return 1;
}

- (void)setJtImage:(id)a3
{
  JTImage *v5;
  JTImage *v6;

  v5 = (JTImage *)a3;
  if (self->_jtImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_jtImage, a3);
    -[JFXImageView reconfigureImageView](self, "reconfigureImageView");
    v5 = v6;
  }

}

- (void)setImageViewType:(int64_t)a3
{
  if (self->_imageViewType != a3)
  {
    self->_imageViewType = a3;
    -[JFXImageView reconfigureImageView](self, "reconfigureImageView");
  }
}

- (void)setPreferIOSurfaceForYUV:(BOOL)a3
{
  if (self->_preferIOSurfaceForYUV != a3)
  {
    self->_preferIOSurfaceForYUV = a3;
    -[JFXImageView reconfigureImageView](self, "reconfigureImageView");
  }
}

- (void)setDisableIOSurface:(BOOL)a3
{
  if (self->_disableIOSurface != a3)
  {
    self->_disableIOSurface = a3;
    -[JFXImageView reconfigureImageView](self, "reconfigureImageView");
  }
}

- (void)setPreferMetalKit:(BOOL)a3
{
  if (self->_preferMetalKit != a3)
  {
    self->_preferMetalKit = a3;
    -[JFXImageView reconfigureImageView](self, "reconfigureImageView");
  }
}

- (void)setDisableMetalKit:(BOOL)a3
{
  if (self->_disableMetalKit != a3)
  {
    self->_disableMetalKit = a3;
    -[JFXImageView reconfigureImageView](self, "reconfigureImageView");
  }
}

- (void)setCurrentImageViewType:(int64_t)a3
{
  if (self->_currentImageViewType != a3)
  {
    self->_currentImageViewType = a3;
    -[JFXImageView updateDebugDrawing](self, "updateDebugDrawing");
  }
}

- (void)setEnableDebugDrawing:(BOOL)a3
{
  if (self->_enableDebugDrawing != a3)
  {
    self->_enableDebugDrawing = a3;
    -[JFXImageView updateDebugDrawing](self, "updateDebugDrawing");
  }
}

- (void)setContentMode:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageView;
  -[JFXImageView setContentMode:](&v6, sel_setContentMode_);
  -[JFXImageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

}

- (JTImage)jtImage
{
  return self->_jtImage;
}

- (int64_t)imageViewType
{
  return self->_imageViewType;
}

- (int64_t)currentImageViewType
{
  return self->_currentImageViewType;
}

- (BOOL)preferIOSurfaceForYUV
{
  return self->_preferIOSurfaceForYUV;
}

- (BOOL)preferMetalKit
{
  return self->_preferMetalKit;
}

- (BOOL)enableDebugDrawing
{
  return self->_enableDebugDrawing;
}

- (BOOL)disableIOSurface
{
  return self->_disableIOSurface;
}

- (BOOL)disableMetalKit
{
  return self->_disableMetalKit;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_jtImage, 0);
}

void __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a1, a3, "JFXImageView: MetalKit is %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a1, a3, "JFXImageView: IOSurface is %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a1, a3, "JFXImageView: JTImageViewDebugDraw %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
