@implementation SUUIButtonBorderStyle

- (SUUIButtonBorderStyle)initWithElementStyle:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v37[2];
  objc_super v38;

  v4 = a3;
  objc_msgSend(v4, "ikBorderColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v38.receiver = self;
    v38.super_class = (Class)SUUIButtonBorderStyle;
    v6 = -[SUUIButtonBorderStyle init](&v38, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)*((_QWORD *)v6 + 1);
      *((_QWORD *)v6 + 1) = v7;

      objc_msgSend(v4, "ikBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "_usesBackgroundWithAlpha:", v10);

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x24BE51978]);
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "initWithColor:", v13);
      }
      else
      {
        objc_msgSend(v4, "ikBackgroundColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "copy");
      }
      v15 = (void *)*((_QWORD *)v6 + 11);
      *((_QWORD *)v6 + 11) = v14;

      objc_msgSend(v4, "valueForStyle:", *MEMORY[0x24BE518B8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        memset(v37, 0, sizeof(v37));
        objc_msgSend(v16, "getValue:", v37);
        *((_QWORD *)v6 + 2) = v37[0].receiver;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scale");
        *((double *)v6 + 2) = 1.0 / v19;

      }
      objc_msgSend(v4, "valueForStyle:", *MEMORY[0x24BE518F0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "getValue:", v6 + 24);
      }
      else
      {
        *(_OWORD *)(v6 + 24) = xmmword_241EFC700;
        *(_OWORD *)(v6 + 40) = xmmword_241EFC700;
      }
      objc_msgSend(v4, "borderRadius");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "namedStyle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("square")))
          {
            *(_OWORD *)(v6 + 56) = 0u;
            *(_OWORD *)(v6 + 72) = 0u;
          }
          else
          {
            __asm { FMOV            V0.2D, #7.0 }
            *(_OWORD *)(v6 + 72) = _Q0;
            *(_OWORD *)(v6 + 56) = _Q0;
            objc_storeStrong((id *)v6 + 12, v25);
          }
        }
        else
        {
          objc_msgSend(v23, "cornerRadiiValue");
          *((_QWORD *)v6 + 7) = v31;
          *((_QWORD *)v6 + 8) = v32;
          *((_QWORD *)v6 + 9) = v33;
          *((_QWORD *)v6 + 10) = v34;
        }

      }
      else
      {
        __asm { FMOV            V0.2D, #7.0 }
        *(_OWORD *)(v6 + 72) = _Q0;
        *(_OWORD *)(v6 + 56) = _Q0;
      }

    }
  }
  else
  {

    v6 = 0;
  }

  return (SUUIButtonBorderStyle *)v6;
}

- (id)bezierPathWithBounds:(CGRect)a3
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double bottomRight;
  double topLeft;
  double topRight;
  float v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double MaxX;
  CGFloat v17;
  double v18;
  double v19;
  double MinX;
  double v21;
  double bottomLeft;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  bottomRight = self->_cornerRadii.bottomRight;
  bottomLeft = self->_cornerRadii.bottomLeft;
  topLeft = self->_cornerRadii.topLeft;
  topRight = self->_cornerRadii.topRight;
  if (-[NSString isEqualToString:](self->_namedCornerStyle, "isEqualToString:", CFSTR("circle-caps")))
  {
    v12 = height * 0.5;
    topRight = floorf(v12);
    topLeft = topRight;
    bottomRight = topRight;
    bottomLeft = topRight;
  }
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v13 = topLeft + CGRectGetMinX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  objc_msgSend(v8, "moveToPoint:", v13, CGRectGetMinY(v25));
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v14 = CGRectGetMaxX(v26) - topRight;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  objc_msgSend(v8, "addLineToPoint:", v14, CGRectGetMinY(v27));
  if (topRight > 0.00000011920929)
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v15 = CGRectGetMaxX(v28) - topRight;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v15, topRight + CGRectGetMinY(v29), topRight, 4.71238898, 6.28318531);
  }
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MaxX = CGRectGetMaxX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  objc_msgSend(v8, "addLineToPoint:", MaxX, CGRectGetMaxY(v31) - bottomRight);
  if (bottomRight > 0.00000011920929)
  {
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v17 = CGRectGetMaxX(v32) - bottomRight;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v17, CGRectGetMaxY(v33) - bottomRight, bottomRight, 0.0, 1.57079633);
  }
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v18 = bottomLeft + CGRectGetMinX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  objc_msgSend(v8, "addLineToPoint:", v18, CGRectGetMaxY(v35));
  if (bottomLeft > 0.00000011920929)
  {
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v19 = bottomLeft + CGRectGetMinX(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v19, CGRectGetMaxY(v37) - bottomLeft, bottomLeft, 1.57079633, 3.14159265);
  }
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MinX = CGRectGetMinX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  objc_msgSend(v8, "addLineToPoint:", MinX, topLeft + CGRectGetMinY(v39));
  if (topLeft != 0.0)
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v21 = topLeft + CGRectGetMinX(v40);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v21, topLeft + CGRectGetMinY(v41), topLeft, 3.14159265, 4.71238898);
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[IKColor copyWithZone:](self->_borderColor, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(double *)(v5 + 16) = self->_borderWidth;
  v8 = *(_OWORD *)&self->_contentInset.top;
  *(_OWORD *)(v5 + 40) = *(_OWORD *)&self->_contentInset.bottom;
  *(_OWORD *)(v5 + 24) = v8;
  v9 = *(_OWORD *)&self->_cornerRadii.bottomLeft;
  *(_OWORD *)(v5 + 72) = *(_OWORD *)&self->_cornerRadii.topLeft;
  *(_OWORD *)(v5 + 56) = v9;
  v10 = -[IKColor copyWithZone:](self->_fillColor, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v10;

  v12 = -[NSString copyWithZone:](self->_namedCornerStyle, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v12;

  return (id)v5;
}

- (BOOL)_usesBackgroundWithAlpha:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = 0;
  v5 = 0;
  v6 = 0;
  v4 = 0.0;
  return objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4)
      && v4 < 1.0
      && v4 != 0.0;
}

- (IKColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (IKCornerRadii)cornerRadii
{
  double bottomLeft;
  double bottomRight;
  double topLeft;
  double topRight;
  IKCornerRadii result;

  bottomLeft = self->_cornerRadii.bottomLeft;
  bottomRight = self->_cornerRadii.bottomRight;
  topLeft = self->_cornerRadii.topLeft;
  topRight = self->_cornerRadii.topRight;
  result.topRight = topRight;
  result.topLeft = topLeft;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  return result;
}

- (void)setCornerRadii:(IKCornerRadii)a3
{
  self->_cornerRadii = a3;
}

- (IKColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)namedCornerStyle
{
  return self->_namedCornerStyle;
}

- (void)setNamedCornerStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedCornerStyle, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
