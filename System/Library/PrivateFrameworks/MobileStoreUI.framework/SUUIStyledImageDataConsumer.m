@implementation SUUIStyledImageDataConsumer

+ (BOOL)isImageCompressionEnabled
{
  if (isImageCompressionEnabled_onceToken != -1)
    dispatch_once(&isImageCompressionEnabled_onceToken, &__block_literal_global_10);
  return isImageCompressionEnabled_isImageCompressionEnabled;
}

uint64_t __56__SUUIStyledImageDataConsumer_isImageCompressionEnabled__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("SUUIImageCompressionEnabled"), (CFStringRef)*MEMORY[0x24BEB2C88], 0);
  isImageCompressionEnabled_isImageCompressionEnabled = (_DWORD)result != 0;
  return result;
}

- (SUUIStyledImageDataConsumer)init
{
  SUUIStyledImageDataConsumer *v2;
  SUUIStyledImageDataConsumer *v3;
  uint64_t v4;
  UITraitCollection *startingTraitCollection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIStyledImageDataConsumer;
  v2 = -[SUUIStyledImageDataConsumer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_imageContentMode = 0;
    objc_msgSend(MEMORY[0x24BEBDAB0], "_currentTraitCollection");
    v4 = objc_claimAutoreleasedReturnValue();
    startingTraitCollection = v3->_startingTraitCollection;
    v3->_startingTraitCollection = (UITraitCollection *)v4;

  }
  return v3;
}

- (SUUIStyledImageDataConsumer)initWithSize:(CGSize)a3 treatment:(int64_t)a4
{
  double height;
  double width;
  SUUIStyledImageDataConsumer *v7;
  void *v8;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)SUUIStyledImageDataConsumer;
  v7 = -[SUUIStyledImageDataConsumer init](&v10, sel_init);
  if (v7)
  {
    if ((unint64_t)a4 <= 0xF && ((1 << a4) & 0x8026) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStyledImageDataConsumer setBorderColor:](v7, "setBorderColor:", v8);

      -[SUUIStyledImageDataConsumer setBorderWidths:](v7, "setBorderWidths:", 1.0, 1.0, 1.0, 1.0);
    }
    -[SUUIStyledImageDataConsumer setImageSize:](v7, "setImageSize:", width, height);
    -[SUUIStyledImageDataConsumer setImageTreatment:](v7, "setImageTreatment:", a4);
    -[SUUIStyledImageDataConsumer setImageContentMode:](v7, "setImageContentMode:", 0);
  }
  return v7;
}

- (SUUIStyledImageDataConsumer)initWithViewElement:(id)a3
{
  id v4;
  SUUIStyledImageDataConsumer *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  IKColor *iKBackgroundColor;
  void *v13;
  uint64_t v14;
  UIColor *backgroundColor;
  void *v16;
  unint64_t imageTreatment;
  UIEdgeInsets *p_borderWidths;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  uint64_t v30;
  UIColor *borderColor;
  UIColor *v32;
  void *v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  uint64_t v39;
  UIColor *v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  uint64_t v46;
  UIColor *shadowColor;
  CGFloat v48;
  CGFloat v49;
  double v50;

  v4 = a3;
  v5 = -[SUUIStyledImageDataConsumer init](self, "init");
  if (!v5)
    goto LABEL_17;
  objc_msgSend(v4, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_imageContentMode = objc_msgSend(v6, "fillImage") == 1;
  objc_msgSend(v6, "elementPadding");
  v5->_imagePadding.top = v7;
  v5->_imagePadding.left = v8;
  v5->_imagePadding.bottom = v9;
  v5->_imagePadding.right = v10;
  objc_msgSend(v6, "ikBackgroundColor");
  v11 = objc_claimAutoreleasedReturnValue();
  iKBackgroundColor = v5->_iKBackgroundColor;
  v5->_iKBackgroundColor = (IKColor *)v11;

  objc_msgSend(v6, "ikBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v14 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v5->_backgroundColor;
  v5->_backgroundColor = (UIColor *)v14;

  objc_msgSend(v6, "imageTreatment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_imageTreatment = SUUIImageTreatmentForString(v16);

  imageTreatment = v5->_imageTreatment;
  if (imageTreatment > 0x10)
    goto LABEL_12;
  if (((1 << imageTreatment) & 0x10026) == 0)
  {
    if (imageTreatment == 3)
    {
      p_borderWidths = &v5->_borderWidths;
      v5->_borderWidths.top = 0.0;
      v5->_borderWidths.left = 0.0;
      v5->_borderWidths.bottom = 1.0;
      v24 = 0.0;
      goto LABEL_5;
    }
LABEL_12:
    p_borderWidths = &v5->_borderWidths;
    objc_msgSend(v6, "borderWidths");
    v5->_borderWidths.top = v36;
    v5->_borderWidths.left = v37;
    v5->_borderWidths.bottom = v38;
    goto LABEL_5;
  }
  p_borderWidths = &v5->_borderWidths;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v5->_borderWidths.top = _Q0;
  v5->_borderWidths.bottom = 1.0;
  v24 = 1.0;
LABEL_5:
  p_borderWidths->right = v24;
  objc_msgSend(v6, "borderMargins");
  v5->_borderMargins.top = v25;
  v5->_borderMargins.left = v26;
  v5->_borderMargins.bottom = v27;
  v5->_borderMargins.right = v28;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v5->_borderWidths.top, *MEMORY[0x24BEBE158]), (int32x4_t)vceqq_f64(*(float64x2_t *)&v5->_borderWidths.bottom, *(float64x2_t *)(MEMORY[0x24BEBE158] + 16)))), 0xFuLL))) & 1) == 0)
  {
    objc_msgSend(v6, "ikBorderColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "color");
    v30 = objc_claimAutoreleasedReturnValue();
    borderColor = v5->_borderColor;
    v5->_borderColor = (UIColor *)v30;

    if (!v5->_borderColor)
    {
      v32 = v5->_backgroundColor;
      if (v32)
      {
        switch(SUUIColorSchemeStyleForColor(v32))
        {
          case 0:
          case 2:
            goto LABEL_9;
          case 1:
          case 3:
            v33 = (void *)MEMORY[0x24BEBD4B8];
            v34 = 0.15;
            v35 = 1.0;
            goto LABEL_14;
          default:
            break;
        }
      }
      else
      {
LABEL_9:
        v33 = (void *)MEMORY[0x24BEBD4B8];
        v34 = 0.2;
        v35 = 0.0;
LABEL_14:
        objc_msgSend(v33, "colorWithWhite:alpha:", v35, v34);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v5->_borderColor;
        v5->_borderColor = (UIColor *)v39;

      }
    }
    objc_msgSend(v6, "borderRadius");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "edgeInsetsValue");
    v5->_borderRadii.top = v42;
    v5->_borderRadii.left = v43;
    v5->_borderRadii.bottom = v44;
    v5->_borderRadii.right = v45;

  }
  objc_msgSend(v4, "shadowColor");
  v46 = objc_claimAutoreleasedReturnValue();
  shadowColor = v5->_shadowColor;
  v5->_shadowColor = (UIColor *)v46;

  objc_msgSend(v4, "shadowOffset");
  v5->_shadowOffset.width = v48;
  v5->_shadowOffset.height = v49;
  objc_msgSend(v4, "shadowRadius");
  v5->_shadowRadius = v50;

LABEL_17:
  return v5;
}

- (id)imageForColor:(id)a3
{
  return -[SUUIStyledImageDataConsumer imageForColor:size:](self, "imageForColor:size:", a3, self->_imageSize.width, self->_imageSize.height);
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v10;
  _QWORD v12[4];
  id v13;
  SUUIStyledImageDataConsumer *v14;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = v7;
  if (width < 0.00000011920929 || height < 0.00000011920929)
  {
    v10 = 0;
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__SUUIStyledImageDataConsumer_imageForColor_size___block_invoke;
    v12[3] = &unk_2511F6A08;
    v13 = v7;
    v14 = self;
    -[SUUIStyledImageDataConsumer _outputImageWithInputSize:outputSize:drawBlock:](self, "_outputImageWithInputSize:outputSize:drawBlock:", v12, width, height, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void __50__SUUIStyledImageDataConsumer_imageForColor_size___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  void *v9;
  CGRect v10;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 32), "set");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_defaultPlaceholderColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set");

  }
  v10.origin.x = a2;
  v10.origin.y = a3;
  v10.size.width = a4;
  v10.size.height = a5;
  UIRectFill(v10);
}

- (id)imageForImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double height;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__SUUIStyledImageDataConsumer_imageForImage___block_invoke;
  v14[3] = &unk_2511F52C8;
  v15 = v4;
  width = self->_imageSize.width;
  height = self->_imageSize.height;
  v11 = v4;
  -[SUUIStyledImageDataConsumer _outputImageWithInputSize:outputSize:drawBlock:](self, "_outputImageWithInputSize:outputSize:drawBlock:", v14, v6, v8, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __45__SUUIStyledImageDataConsumer_imageForImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:");
}

- (BOOL)isImagePlaceholderAvailable
{
  unint64_t imageTreatment;
  double top;
  double left;
  BOOL v6;

  imageTreatment = self->_imageTreatment;
  if (imageTreatment > 0x10)
    return 0;
  if (((1 << imageTreatment) & 0x1CD06) != 0)
    return 1;
  if (((1 << imageTreatment) & 0xA9) == 0)
    return 0;
  top = self->_borderWidths.top;
  left = self->_borderWidths.left;
  v6 = left == self->_borderWidths.right;
  if (top != self->_borderWidths.bottom)
    v6 = 0;
  return left == top && v6;
}

- (id)imagePlaceholderForColor:(id)a3
{
  UIColor *v4;
  SUUIImagePlaceholder *v5;
  SUUIImagePlaceholder *v6;
  UIColor *v7;
  CGFloat v8;
  void *v9;
  SUUIImagePlaceholder *v10;
  UIColor *v11;
  UIColor *v12;
  double v13;
  double top;
  double left;
  SUUIImagePlaceholder *v18;
  UIColor *borderColor;
  double v20;
  UIColor *v21;
  SUUIImagePlaceholder *v23;
  UIColor *v24;

  v4 = (UIColor *)a3;
  if (!v4)
  {
    -[SUUIStyledImageDataConsumer _defaultPlaceholderColor](self, "_defaultPlaceholderColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v5 = 0;
  switch(self->_imageTreatment)
  {
    case 0:
    case 3:
    case 5:
    case 7:
      top = self->_borderWidths.top;
      left = self->_borderWidths.left;
      if (left == self->_borderWidths.right && top == self->_borderWidths.bottom && left == top)
      {
        v18 = [SUUIImagePlaceholder alloc];
        borderColor = self->_borderColor;
        v20 = self->_borderWidths.left;
        v21 = v4;
        goto LABEL_16;
      }
      v5 = 0;
      break;
    case 1:
    case 2:
    case 0xALL:
    case 0xBLL:
    case 0xFLL:
    case 0x10:
      v6 = [SUUIImagePlaceholder alloc];
      v7 = self->_borderColor;
      v8 = self->_borderWidths.top;
      -[SUUIStyledImageDataConsumer _placeholderCornerPathBlock](self, "_placeholderCornerPathBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      v11 = v4;
      v12 = v7;
      v13 = v8;
      goto LABEL_5;
    case 8:
      v18 = [SUUIImagePlaceholder alloc];
      v20 = 0.0;
      v21 = v4;
      borderColor = 0;
LABEL_16:
      v5 = -[SUUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerRadius:](v18, "initWithBackgroundColor:borderColor:borderWidth:cornerRadius:", v21, borderColor, v20, 0.0);
      break;
    case 0xELL:
      v23 = [SUUIImagePlaceholder alloc];
      v24 = self->_borderColor;
      -[SUUIStyledImageDataConsumer _placeholderCornerPathBlock](self, "_placeholderCornerPathBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0.0;
      v10 = v23;
      v11 = v24;
      v12 = 0;
LABEL_5:
      v5 = -[SUUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:](v10, "initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:", v11, v12, v9, v13);

      break;
    default:
      break;
  }

  return v5;
}

- (id)_placeholderCornerPathBlock
{
  void *v3;
  id result;
  CGFloat top;
  _QWORD aBlock[5];

  v3 = 0;
  switch(self->_imageTreatment)
  {
    case 1:
      result = &__block_literal_global_6;
      break;
    case 2:
      result = &__block_literal_global_8;
      break;
    case 0xALL:
    case 0xBLL:
      result = &__block_literal_global_9;
      break;
    case 0xELL:
      top = self->_borderRadii.top;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_4;
      aBlock[3] = &__block_descriptor_40_e53___UIBezierPath_40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
      *(CGFloat *)&aBlock[4] = top;
      v3 = _Block_copy(aBlock);
      goto LABEL_8;
    case 0xFLL:
      result = &__block_literal_global_10;
      break;
    case 0x10:
      result = &__block_literal_global_11;
      break;
    default:
LABEL_8:
      result = v3;
      break;
  }
  return result;
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke(double a1, double a2, double a3, double a4)
{
  double v4;

  if (a4 >= a3)
    v4 = a4;
  else
    v4 = a3;
  return objc_msgSend(MEMORY[0x24BEBD420], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, v4 / 57.0 * 13.5);
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_2(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x24BEBD420], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, 10.0);
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_3()
{
  return objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:");
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", a2, a3, a4, a5, *(double *)(a1 + 32));
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_5(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x24BEBD420], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, CGRectGetHeight(*(CGRect *)&a1) * 0.5);
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_6(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x24BEBD420], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, 6.0);
}

- (BOOL)_backgroundIsOpaque
{
  UIColor *backgroundColor;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
    LOBYTE(backgroundColor) = CGColorGetAlpha(-[UIColor CGColor](backgroundColor, "CGColor")) == 1.0;
  return (char)backgroundColor;
}

- (id)_defaultPlaceholderColor
{
  UIColor *backgroundColor;
  UIColor *v4;
  float v5;
  void *v6;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    switch(SUUIColorSchemeStyleForColor(backgroundColor))
    {
      case 0:
      case 2:
        v4 = self->_backgroundColor;
        v5 = -0.2;
        goto LABEL_6;
      case 1:
      case 3:
        v4 = self->_backgroundColor;
        v5 = 0.15;
LABEL_6:
        SUUIColorByAdjustingBrightness(v4, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v6 = 0;
        break;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.85, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_drawBordersWithImageRect:(CGRect)a3 bounds:(CGRect)a4
{
  UIColor *borderColor;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double bottom;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double left;
  double v29;
  double rect;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  borderColor = self->_borderColor;
  if (borderColor)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v10 = a3.size.height;
    v11 = a3.size.width;
    v12 = a3.origin.y;
    v13 = a3.origin.x;
    -[UIColor set](borderColor, "set");
    if (x >= v13)
      v14 = x;
    else
      v14 = v13;
    rect = v14;
    if (y < v12)
      y = v12;
    if (height >= v10)
      v15 = v10;
    else
      v15 = height;
    if (width >= v11)
      v16 = v11;
    else
      v16 = width;
    v29 = v16;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v18;

    left = self->_borderWidths.left;
    v20 = self->_borderWidths.top / v19;
    bottom = self->_borderWidths.bottom;
    v22 = self->_borderWidths.right / v19;
    if (v20 > 0.00000011920929)
    {
      v31.size.width = v29;
      v31.origin.x = rect;
      v31.origin.y = y;
      v31.size.height = self->_borderWidths.top / v19;
      UIRectFillUsingBlendMode(v31, kCGBlendModeNormal);
    }
    v23 = y + v20;
    v24 = v15;
    v25 = v15 - v20;
    v26 = bottom / v19;
    if (v22 > 0.00000011920929)
    {
      v32.origin.x = rect + v29 - v22;
      v32.size.height = v25 - v26;
      v32.origin.y = v23;
      v32.size.width = v22;
      UIRectFillUsingBlendMode(v32, kCGBlendModeNormal);
    }
    v27 = left / v19;
    if (v26 > 0.00000011920929)
    {
      v33.origin.y = y + v24 - v26;
      v33.size.width = v29;
      v33.origin.x = rect;
      v33.size.height = v26;
      UIRectFillUsingBlendMode(v33, kCGBlendModeNormal);
    }
    if (v27 > 0.00000011920929)
    {
      v34.size.height = v25 - v26;
      v34.origin.x = rect;
      v34.origin.y = v23;
      v34.size.width = v27;
      UIRectFillUsingBlendMode(v34, kCGBlendModeNormal);
    }
  }
}

- (id)_outputImageWithInputSize:(CGSize)a3 outputSize:(CGSize)a4 drawBlock:(id)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double x;
  double y;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGSize *p_shadowOffset;
  double v69;
  CGFloat v70;
  double shadowRadius;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  void *v76;
  double v77;
  CGFloat v78;
  CGContext *CurrentContext;
  double v80;
  CGColor *v81;
  uint64_t v82;
  double v84;
  CGSize v85;
  CGSize v86;
  CGRect v87;
  CGRect v88;

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  v10 = a5;
  v11 = (void *)MEMORY[0x2426A2860]();
  switch(self->_imageTreatment)
  {
    case 0:
    case 3:
    case 5:
    case 7:
      v14 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      goto LABEL_3;
    case 1:
      v31 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      v33 = v32;
      v34 = v29;
      v35 = v30;
      if (v30 >= v29)
        v36 = v30;
      else
        v36 = v29;
      v37 = v36 / 57.0 * 13.5;
      goto LABEL_22;
    case 2:
      v31 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      v33 = v38;
      v34 = v39;
      v35 = v40;
      v41 = 0x4024000000000000;
      goto LABEL_24;
    case 4:
      v42 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      -[SUUIStyledImageDataConsumer _leftToRightGradient:contentRect:drawBlock:](self, "_leftToRightGradient:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v42, v43, v44, v45);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 6:
      v46 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      -[SUUIStyledImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v46, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "imageWithRenderingMode:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 8:
      -[SUUIStyledImageDataConsumer _dynamicUberImageWithBounds:inputSize:drawBlock:](self, "_dynamicUberImageWithBounds:inputSize:drawBlock:", v10, 0.0, 0.0, width, height, v8, v7);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 9:
      -[SUUIStyledImageDataConsumer _uberBannerImageWithBounds:inputSize:drawBlock:](self, "_uberBannerImageWithBounds:inputSize:drawBlock:", v10, 0.0, 0.0, width, height, v8, v7);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 0xALL:
    case 0xBLL:
      v87.origin.x = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      x = v87.origin.x;
      y = v87.origin.y;
      v24 = v87.size.width;
      v25 = v87.size.height;
      v26 = CGRectGetWidth(v87) * 0.5;
      v88.origin.x = x;
      v88.origin.y = y;
      v88.size.width = v24;
      v88.size.height = v25;
      v27 = CGRectGetHeight(v88) * 0.5;
      if (v26 >= v27)
        v27 = v26;
      -[SUUIStyledImageDataConsumer _arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:](self, "_arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:", v10, 0.0, 0.0, width, height, x, y, v24, v25, *(_QWORD *)&v27);
      goto LABEL_26;
    case 0xCLL:
      v14 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      v16 = v51;
      v18 = v52;
      v20 = v53;
      goto LABEL_19;
    case 0xDLL:
      width = v8 + self->_imagePadding.left + self->_imagePadding.right;
      height = v7 + self->_imagePadding.top + self->_imagePadding.bottom;
      v14 = SUUIImageRectForBoundsAndPadding(1, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      v16 = v54;
      v18 = v55;
      v20 = v56;
      if (self->_imagePadding.bottom < 0.00000011920929)
      {
LABEL_3:
        -[SUUIStyledImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v14, v16, v18, v20);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_19:
        -[SUUIStyledImageDataConsumer _radialBlurImageWithBounds:contentRect:drawBlock:](self, "_radialBlurImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v14, v16, v18, v20);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_27;
    case 0xELL:
      v57 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_borderWidths.top, self->_borderWidths.left, self->_borderWidths.bottom, self->_borderWidths.right);
      -[SUUIStyledImageDataConsumer _roundedBorderWithBounds:contentRect:drawBlock:](self, "_roundedBorderWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v57, v58, v59, v60);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 0xFLL:
      v31 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      v33 = v61;
      v34 = v62;
      v35 = v63;
      v37 = v63 * 0.5;
LABEL_22:
      v84 = v37;
      goto LABEL_25;
    case 0x10:
      v31 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      v33 = v64;
      v34 = v65;
      v35 = v66;
      v41 = 0x4018000000000000;
LABEL_24:
      v84 = *(double *)&v41;
LABEL_25:
      -[SUUIStyledImageDataConsumer _arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:](self, "_arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:", v10, 0.0, 0.0, width, height, v31, v33, v34, v35, *(_QWORD *)&v84);
LABEL_26:
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v28 = (void *)v21;
      break;
    default:
      v28 = 0;
      break;
  }
  p_shadowOffset = &self->_shadowOffset;
  if (self->_shadowOffset.width != *MEMORY[0x24BDBF148]
    || self->_shadowOffset.height != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(v28, "size");
    v70 = v69 + (fabs(p_shadowOffset->width) + self->_shadowRadius) * 2.0;
    objc_msgSend(v28, "size");
    shadowRadius = self->_shadowRadius;
    v72 = fabs(self->_shadowOffset.height) + shadowRadius;
    v74 = v73 + v72 * 2.0;
    v75 = shadowRadius + fabs(p_shadowOffset->width);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "scale");
    v78 = v77;
    v85.width = v70;
    v85.height = v74;
    UIGraphicsBeginImageContextWithOptions(v85, 0, v78);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
    v80 = self->_shadowRadius;
    v81 = -[UIColor CGColor](self->_shadowColor, "CGColor");
    v86.width = p_shadowOffset->width;
    v86.height = self->_shadowOffset.height;
    CGContextSetShadowWithColor(CurrentContext, v86, v80, v81);
    objc_msgSend(v28, "drawAtPoint:", v75, v72);
    UIGraphicsGetImageFromCurrentImageContext();
    v82 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v28 = (void *)v82;
  }
  objc_autoreleasePoolPop(v11);

  return v28;
}

- (id)_imageWithSize:(CGSize)a3 isOpaque:(BOOL)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  void (**v8)(id, _QWORD);
  void *v9;
  double v10;
  CGFloat v11;
  uint64_t HasASTCSupport;
  uint64_t v13;
  void *v14;
  CGSize v16;

  height = a3.height;
  width = a3.width;
  v8 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  v16.width = width;
  v16.height = height;
  UIGraphicsBeginImageContextWithOptions(v16, a4, v11);
  if (!+[SUUIStyledImageDataConsumer isImageCompressionEnabled](SUUIStyledImageDataConsumer, "isImageCompressionEnabled"))
  {
    v8[2](v8, 0);
    goto LABEL_5;
  }
  HasASTCSupport = SUUIGraphicsDeviceHasASTCSupport();
  v8[2](v8, HasASTCSupport);
  if (!(_DWORD)HasASTCSupport)
  {
LABEL_5:
    UIGraphicsGetImageFromCurrentImageContext();
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  SUUIGraphicsGetASTCImageFromCurrentImageContext(v11);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v14 = (void *)v13;
  UIGraphicsEndImageContext();

  return v14;
}

- (id)_arcRoundedImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 cornerRadius:(double)a5 drawBlock:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __93__SUUIStyledImageDataConsumer__arcRoundedImageWithBounds_contentRect_cornerRadius_drawBlock___block_invoke;
  v18[3] = &unk_2511F6B10;
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  v24 = a5;
  v14 = v13;
  v18[4] = self;
  v19 = v14;
  -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", 0, v18, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    objc_msgSend(v16, "setCornerRadius:", a5);
    objc_msgSend(v16, "setCornerType:", 1);
    if (self->_borderColor)
    {
      objc_msgSend(v16, "setBorderColor:");
      objc_msgSend(v16, "setBorderWidth:", 1.0);
    }

  }
  return v15;
}

void __93__SUUIStyledImageDataConsumer__arcRoundedImageWithBounds_contentRect_cornerRadius_drawBlock___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD420], "_bezierPathWithArcRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineWidth:", 1.0);
  objc_msgSend(v5, "addClip");
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    if (v4)
    {
      objc_msgSend(v4, "set");
      objc_msgSend(v5, "strokeWithBlendMode:alpha:", 0, 1.0);
    }
  }

}

- (id)_scaledImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  v15 = -[SUUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __76__SUUIStyledImageDataConsumer__scaledImageWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_2511F6B38;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  v19[4] = self;
  v20 = v14;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  v16 = v14;
  -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __76__SUUIStyledImageDataConsumer__scaledImageWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "set");
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  return objc_msgSend(*(id *)(a1 + 32), "_drawBordersWithImageRect:bounds:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)_radialBlurImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  v15 = -[SUUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __80__SUUIStyledImageDataConsumer__radialBlurImageWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_2511F6B38;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  v19[4] = self;
  v20 = v14;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  v16 = v14;
  -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __80__SUUIStyledImageDataConsumer__radialBlurImageWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v9;
  double v10;
  CGContext *CurrentContext;
  CGColorSpace *DeviceRGB;
  CGGradient *v13;
  float v14;
  double v15;
  uint64_t v16;
  float64x2_t *v17;
  float64x2_t *v18;
  float64x2_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  CGFloat v26;
  float v27;
  CGFloat components[4];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  CGFloat locations[2];
  uint64_t v36;
  __int128 v37;
  _OWORD v38[4];
  uint64_t v39;
  CGPoint v40;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "set");
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v3)
  {
    v37 = 0u;
    memset(v38, 0, 48);
    __asm { FMOV            V0.2D, #1.0 }
    v38[3] = _Q0;
    objc_msgSend(v3, "getRed:green:blue:alpha:", &v37, (char *)&v37 + 8, v38, 0);
    *(_OWORD *)((char *)&v38[1] + 8) = v37;
    *((_QWORD *)&v38[2] + 1) = *(_QWORD *)&v38[0];
    v10 = *(double *)(a1 + 64);
    v9 = *(double *)(a1 + 72);
    *(_OWORD *)locations = xmmword_241EFBD60;
    v36 = 0x3FF0000000000000;
    *(_OWORD *)components = v37;
    components[2] = *(CGFloat *)v38;
    components[3] = 0.0;
    v29 = v37;
    v30 = *(_QWORD *)&v38[0];
    v31 = 0x3FE3333340000000;
    v32 = v37;
    v33 = *(_QWORD *)&v38[0];
    v34 = 0x3FF0000000000000;
    CurrentContext = UIGraphicsGetCurrentContext();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v13 = CGGradientCreateWithColorComponents(DeviceRGB, components, locations, 3uLL);
    v14 = v10 * 0.25;
    v15 = ceilf(v14);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = (float64x2_t *)(v16 + 200);
    v18 = (float64x2_t *)(v16 + 168);
    v19 = *(float64x2_t *)(MEMORY[0x24BEBE158] + 16);
    v20 = -0.0;
    if (vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v17, *MEMORY[0x24BEBE158]), (int32x4_t)vceqq_f64(v17[1], v19))), 0xFuLL)), (int8x8_t)0x8000400020001)) != 15)v20 = v17[1].f64[0];
    v21 = v20 + v15;
    v22 = 0.0;
    if (vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v18, *MEMORY[0x24BEBE158]), (int32x4_t)vceqq_f64(v18[1], v19))), 0xFuLL)), (int8x8_t)0x8000400020001)) != 15)v22 = v18[1].f64[0];
    v23 = v21 - v22;
    v24 = v10 * 0.5;
    v40.x = floorf(v24);
    v25 = v10 * 1.70000005;
    v26 = ceilf(v25);
    v27 = v10 * 1.89999998;
    v40.y = v9 - v26 - v23;
    CGContextDrawRadialGradient(CurrentContext, v13, v40, v26, v40, ceilf(v27), 2u);
    CGColorSpaceRelease(DeviceRGB);
    CGGradientRelease(v13);
  }
}

- (id)_roundedBorderWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  v15 = -[SUUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __78__SUUIStyledImageDataConsumer__roundedBorderWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_2511F6B38;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __78__SUUIStyledImageDataConsumer__roundedBorderWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  double Width;
  double v3;
  double Height;
  double v5;
  double v6;
  CGFloat v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(*(_QWORD *)(a1 + 32) + 8));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setFill");
  objc_msgSend(v8, "fill");
  Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  v3 = floor((Width - CGRectGetWidth(*(CGRect *)(a1 + 80))) * 0.5);
  Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  v5 = floor((Height - CGRectGetHeight(*(CGRect *)(a1 + 80))) * 0.5);
  v6 = CGRectGetWidth(*(CGRect *)(a1 + 80));
  v7 = CGRectGetHeight(*(CGRect *)(a1 + 80));
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v3, v5, v6, v7);

}

- (id)_uberBannerImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  CGFloat y;
  CGFloat x;
  id v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;

  height = a4.height;
  width = a4.width;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v13 = -[SUUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__SUUIStyledImageDataConsumer__uberBannerImageWithBounds_inputSize_drawBlock___block_invoke;
  v17[3] = &unk_2511F6B60;
  v19 = x;
  v20 = y;
  v21 = v8;
  v22 = v7;
  v23 = width;
  v24 = height;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v13, v17, v8, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __78__SUUIStyledImageDataConsumer__uberBannerImageWithBounds_inputSize_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;
  CGContext *CurrentContext;
  double v4;
  double v5;
  double v6;
  CGColorSpace *DeviceRGB;
  CGGradient *v8;
  double MidX;
  CGFloat v10;
  CGFloat v11;
  float v12;
  CGContext *v13;
  double v14;
  float v15;
  double v16;
  float v17;
  _OWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  CGFloat locations[3];
  uint64_t v23;
  CGPoint v24;
  CGPoint v25;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "set");
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextFillRect(CurrentContext, *(CGRect *)(a1 + 48));
    v5 = *(double *)(a1 + 80);
    v4 = *(double *)(a1 + 88);
    v6 = *(double *)(a1 + 72);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    {
      *(_OWORD *)locations = xmmword_241EFBBB0;
      memset(v19, 0, sizeof(v19));
      v20 = 0;
      v21 = 0x3FF0000000000000;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v8 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v19, locations, 2uLL);
      CGColorSpaceRelease(DeviceRGB);
      MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
      v10 = MidX + CGRectGetWidth(*(CGRect *)(a1 + 48)) * -0.25;
      v11 = CGRectGetMidY(*(CGRect *)(a1 + 48)) + 40.0;
      v12 = *(double *)(a1 + 64) * 0.9;
      v13 = UIGraphicsGetCurrentContext();
      v24.x = v10;
      v24.y = v11;
      v25.x = v10;
      v25.y = v11;
      CGContextDrawRadialGradient(v13, v8, v24, 0.0, v25, v12, 2u);
      CGGradientRelease(v8);
    }
  }
  else
  {
    v5 = *(double *)(a1 + 80);
    v4 = *(double *)(a1 + 88);
    v6 = *(double *)(a1 + 72);
  }
  v14 = (double)(int)(v6 + -8.0 + -8.0);
  v15 = (v6 - v14) * 0.5;
  v16 = floorf(v15);
  v17 = v5 * (v14 / v4);
  return (*(uint64_t (**)(double, double, double))(*(_QWORD *)(a1 + 40) + 16))(15.0, v16, ceilf(v17));
}

- (id)_dynamicUberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  height = a4.height;
  width = a4.width;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35[2] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceLevel:", -[UITraitCollection userInterfaceLevel](self->_startingTraitCollection, "userInterfaceLevel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BEBDAB0];
  v35[0] = v13;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollectionWithTraitsFromCollections:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BEBDAB0];
  v34[0] = v13;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "traitCollectionWithTraitsFromCollections:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIColor resolvedColorWithTraitCollection:](self->_backgroundColor, "resolvedColorWithTraitCollection:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStyledImageDataConsumer _uberImageWithBounds:inputSize:backgroundColor:drawBlock:](self, "_uberImageWithBounds:inputSize:backgroundColor:drawBlock:", v22, v12, x, y, v8, v7, width, height);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor resolvedColorWithTraitCollection:](self->_backgroundColor, "resolvedColorWithTraitCollection:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqual:", v22))
  {
    v25 = v23;
  }
  else
  {
    v25 = objc_alloc_init(MEMORY[0x24BEBD640]);
    -[SUUIStyledImageDataConsumer _uberImageWithBounds:inputSize:backgroundColor:drawBlock:](self, "_uberImageWithBounds:inputSize:backgroundColor:drawBlock:", v24, v12, x, y, v8, v7, width, height);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageAsset");
    v33 = v17;
    v27 = v12;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerImage:withTraitCollection:", v23, v29);

    objc_msgSend(v25, "imageAsset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerImage:withTraitCollection:", v26, v31);

    v12 = v27;
    v17 = v33;

  }
  return v25;
}

- (id)_uberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 backgroundColor:(id)a5 drawBlock:(id)a6
{
  CGFloat height;
  CGFloat width;
  double v9;
  double v10;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  _BOOL8 v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;

  height = a4.height;
  width = a4.width;
  v9 = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a5;
  v15 = a6;
  v16 = -[SUUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __88__SUUIStyledImageDataConsumer__uberImageWithBounds_inputSize_backgroundColor_drawBlock___block_invoke;
  v21[3] = &unk_2511F6B60;
  v24 = x;
  v25 = y;
  v26 = v10;
  v27 = v9;
  v28 = width;
  v29 = height;
  v22 = v14;
  v23 = v15;
  v17 = v15;
  v18 = v14;
  -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v16, v21, v10, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __88__SUUIStyledImageDataConsumer__uberImageWithBounds_inputSize_backgroundColor_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  void *v9;
  float v15;
  double v16;
  void *v17;
  __int128 v18;
  _OWORD v19[4];
  uint64_t v20;
  CGRect v21;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "set");
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 80) * (v4 / *(double *)(a1 + 88));
  v6 = ceilf(v5);
  v7 = (*(double *)(a1 + 64) - v6) * 0.5;
  v8 = floorf(v7);
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v8, v3, v6, v4);
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    v18 = 0u;
    memset(v19, 0, 48);
    __asm { FMOV            V0.2D, #1.0 }
    v19[3] = _Q0;
    objc_msgSend(v9, "getRed:green:blue:alpha:", &v18, (char *)&v18 + 8, v19, 0);
    *(_OWORD *)((char *)&v19[1] + 8) = v18;
    *((_QWORD *)&v19[2] + 1) = *(_QWORD *)&v19[0];
    v15 = v4 * 0.48;
    v16 = ceilf(v15);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD610]), "initVerticalWithValues:", &v18);
    v21.origin.x = v8;
    v21.origin.y = v3;
    v21.size.width = v6;
    v21.size.height = v4;
    objc_msgSend(v17, "fillRect:", v8, CGRectGetMaxY(v21) - v16, v6, v16);

  }
}

- (id)_leftToRightGradient:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  _BOOL8 v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  if (-[IKColor colorType](self->_iKBackgroundColor, "colorType") == 3)
  {
    v15 = -[SUUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __74__SUUIStyledImageDataConsumer__leftToRightGradient_contentRect_drawBlock___block_invoke;
    v18[3] = &unk_2511F6B38;
    v18[4] = self;
    v20 = v12;
    v21 = v11;
    v22 = v10;
    v23 = v9;
    v19 = v14;
    v24 = x;
    v25 = y;
    v26 = width;
    v27 = height;
    -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v18, v10, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __74__SUUIStyledImageDataConsumer__leftToRightGradient_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGContext *CurrentContext;
  CGColorSpace *DeviceRGB;
  CGGradient *v16;
  _OWORD v17[2];
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  CGFloat locations[2];
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  CGPoint v32;
  CGPoint v33;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set");

    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  __asm { FMOV            V0.2D, #1.0 }
  v30 = _Q0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "gradientColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "gradientColors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "getRed:green:blue:alpha:", &v26, (char *)&v26 + 8, &v27, (char *)&v27 + 8);
  objc_msgSend(v12, "getRed:green:blue:alpha:", (char *)&v28 + 8, &v29, (char *)&v29 + 8, &v30);
  v13 = *(double *)(a1 + 64);
  *(_OWORD *)locations = xmmword_241EFBD78;
  v25 = 0x3FF0000000000000;
  v17[0] = v26;
  v17[1] = v27;
  v18 = *((_QWORD *)&v28 + 1);
  v19 = v29;
  v20 = v30;
  v21 = *((_QWORD *)&v28 + 1);
  v22 = v29;
  v23 = v30;
  CurrentContext = UIGraphicsGetCurrentContext();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v16 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v17, locations, 3uLL);
  v32.x = 0.0;
  v32.y = 0.5;
  v33.y = 0.5;
  v33.x = v13;
  CGContextDrawLinearGradient(CurrentContext, v16, v32, v33, 0);
  CGColorSpaceRelease(DeviceRGB);
  CGGradientRelease(v16);

}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (UIEdgeInsets)borderWidths
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderWidths.top;
  left = self->_borderWidths.left;
  bottom = self->_borderWidths.bottom;
  right = self->_borderWidths.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBorderWidths:(UIEdgeInsets)a3
{
  self->_borderWidths = a3;
}

- (UIEdgeInsets)borderMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderMargins.top;
  left = self->_borderMargins.left;
  bottom = self->_borderMargins.bottom;
  right = self->_borderMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBorderMargins:(UIEdgeInsets)a3
{
  self->_borderMargins = a3;
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setImageContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
}

- (UIEdgeInsets)imagePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imagePadding.top;
  left = self->_imagePadding.left;
  bottom = self->_imagePadding.bottom;
  right = self->_imagePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setImagePadding:(UIEdgeInsets)a3
{
  self->_imagePadding = a3;
}

- (int64_t)imageTreatment
{
  return self->_imageTreatment;
}

- (void)setImageTreatment:(int64_t)a3
{
  self->_imageTreatment = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_startingTraitCollection, 0);
  objc_storeStrong((id *)&self->_iKBackgroundColor, 0);
}

+ (id)appIconConsumerWithSize:(CGSize)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 1, a3.width, a3.height);
}

+ (id)applePackIconConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 36.0;
  if (v4 == 1)
    v5 = 47.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)brickConsumer
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    v5 = 103.0;
    v6 = 210.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    if (v9 <= 375.0)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;

      v5 = 100.0;
      if (v12 <= 320.0)
        v5 = 78.0;
      v6 = dbl_241EFC2D0[v12 > 320.0];
    }
    else
    {
      v5 = 86.0;
      v6 = 175.0;
    }
  }
  objc_msgSend(a1, "brickConsumerWithBrickSize:", v6, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)brickConsumerWithBrickSize:(CGSize)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 2, a3.width, a3.height);
}

+ (id)cardIconConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 72.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)cardProductImageConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 72.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)categoryIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 33.0, 33.0);
}

+ (id)giftComposeProductImageConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 75.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)giftResultIconConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 72.0;
  if (v4 == 1)
    v5 = 144.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)giftResultProductImageConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 72.0;
  if (v4 == 1)
    v5 = 144.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)giftThemeIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 57.0, 57.0);
}

+ (id)giftThemeProductImageConsumer
{
  return (id)objc_msgSend(a1, "productImageConsumerWithSize:", 57.0, 57.0);
}

+ (id)gridIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 75.0, 75.0);
}

+ (id)listIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
}

+ (id)lockupIconConsumerWithSize:(int64_t)a3
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", SUUILockupImageSizeForLockupSize(a3, 12));
}

+ (id)lockupProductImageConsumerWithSize:(int64_t)a3
{
  return (id)objc_msgSend(a1, "productImageConsumerWithSize:", SUUILockupImageSizeForLockupSize(a3, 12));
}

+ (id)mixedTopChartsNewsstandConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 67.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newsstandRoomNewsstandConsumer
{
  void *v3;
  _BOOL4 v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  objc_msgSend(a1, "productImageConsumerWithSize:", dbl_241EFCF70[v4], dbl_241EFCF80[v4]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newsstandSwooshNewsstandConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 107.0;
  if (v4 != 1)
    v5 = 100.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", dbl_241EFCF90[v4 == 1], v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)parentBundleIconConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 72.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)productImageConsumerWithSize:(CGSize)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 5, a3.width, a3.height);
}

+ (id)productPageProductImageConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 100.0;
  if (v4 == 1)
    v5 = 170.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)purchasedIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
}

+ (id)purchasedProductImageConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 57.0;
  if (v4 == 1)
    v5 = 72.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)roomIconConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 75.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)roomProductImageConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 75.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)shareSheetIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 100.0, 100.0);
}

+ (id)swooshNewsstandConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 200.0;
  if (v4 != 1)
    v5 = 107.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", dbl_241EFCFA0[v4 == 1], v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)topChartsIconConsumer
{
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 75.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)topChartsNewsstandConsumer
{
  void *v3;
  _BOOL4 v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  objc_msgSend(a1, "productImageConsumerWithSize:", dbl_241EFCF70[v4], dbl_241EFCF80[v4]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)updatesIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 57.0, 57.0);
}

+ (id)updatesProductImageConsumer
{
  return (id)objc_msgSend(a1, "productImageConsumerWithSize:", 57.0, 57.0);
}

+ (id)wishlistIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
}

+ (id)wishlistProductImageConsumer
{
  return (id)objc_msgSend(a1, "productImageConsumerWithSize:", 64.0, 64.0);
}

+ (id)manageMessagesConsumer
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 29.0, 22.0);
}

+ (id)categoriesMessagesConsumer
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 35.0, 26.0);
}

+ (id)purchasedMessagesConsumer
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 64.0, 48.0);
}

@end
