@implementation CAUITransportButton

- (CAUITransportButton)initWithCoder:(id)a3
{
  CAUITransportButton *v3;
  CAUITransportButton *v4;
  CGRect *p_imageRect;
  objc_class *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double v16;
  double v17;
  float v18;
  double v19;
  float v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CAUITransportButton;
  v3 = -[CAUITransportButton initWithCoder:](&v22, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    p_imageRect = &v3->imageRect;
    -[CAUITransportButton bounds](v3, "bounds");
    *(_QWORD *)&p_imageRect->origin.x = v6;
    v4->imageRect.origin.y = v7;
    v4->imageRect.size.width = v8;
    v4->imageRect.size.height = v9;
    -[CAUITransportButton bounds](v4, "bounds");
    width = 24.0;
    v12 = 24.0 - v11;
    -[CAUITransportButton bounds](v4, "bounds");
    v14 = 24.0 - v13;
    if (v12 > 0.0 || v14 > 0.0)
    {
      if (v12 <= 0.0)
        width = v4->imageRect.size.width;
      height = 24.0;
      if (v14 <= 0.0)
        height = v4->imageRect.size.height;
      -[CAUITransportButton frame](v4, "frame");
      v17 = v16;
      if (v12 > 0.0)
      {
        v18 = v16 + v12 * -0.5;
        v17 = roundf(v18);
      }
      -[CAUITransportButton frame](v4, "frame");
      if (v14 > 0.0)
      {
        v20 = v19 + v14 * -0.5;
        v19 = roundf(v20);
      }
      -[CAUITransportButton setFrame:](v4, "setFrame:", v17, v19, width, height);
      -[CAUITransportButton setBounds:](v4, "setBounds:", 0.0, 0.0, width, height);
    }
  }
  return v4;
}

- (CAUITransportButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  CAUITransportButton *v5;
  CAUITransportButton *v6;
  CGRect *p_imageRect;
  double v8;
  double v9;
  double v10;
  objc_class *v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  float v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  v23.receiver = self;
  v23.super_class = (Class)CAUITransportButton;
  v5 = -[CAUITransportButton initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    p_imageRect = &v5->imageRect;
    -[CAUITransportButton bounds](v5, "bounds");
    v10 = v9;
    *(_QWORD *)&p_imageRect->origin.x = v11;
    v6->imageRect.origin.y = v12;
    v6->imageRect.size.width = v9;
    v6->imageRect.size.height = v8;
    v13 = 24.0 - width;
    v14 = 24.0 - height;
    if (24.0 - width > 0.0 || v14 > 0.0)
    {
      if (v14 <= 0.0)
        v15 = v8;
      else
        v15 = 24.0;
      -[CAUITransportButton frame](v6, "frame");
      v17 = v16;
      if (v13 <= 0.0)
        v18 = v10;
      else
        v18 = 24.0;
      if (v13 > 0.0)
      {
        v19 = v16 + v13 * -0.5;
        v17 = roundf(v19);
      }
      -[CAUITransportButton frame](v6, "frame");
      if (v14 > 0.0)
      {
        v21 = v20 + v14 * -0.5;
        v20 = roundf(v21);
      }
      -[CAUITransportButton setFrame:](v6, "setFrame:", v17, v20, v18, v15);
      -[CAUITransportButton setBounds:](v6, "setBounds:", 0.0, 0.0, v18, v15);
    }
  }
  return v6;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!objc_msgSend(a4, "type"))
    objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setFillColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "fillColor")), "colorWithAlphaComponent:", 0.5), "CGColor"));
  v7.receiver = self;
  v7.super_class = (Class)CAUITransportButton;
  -[CAUITransportButton touchesBegan:withEvent:](&v7, sel_touchesBegan_withEvent_, a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!objc_msgSend(a4, "type"))
    objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setFillColor:", self->fillColor);
  v7.receiver = self;
  v7.super_class = (Class)CAUITransportButton;
  -[CAUITransportButton touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!objc_msgSend(a4, "type"))
    objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setFillColor:", self->fillColor);
  v7.receiver = self;
  v7.super_class = (Class)CAUITransportButton;
  -[CAUITransportButton touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, a4);
}

- (void)setDrawingStyle:(int)a3
{
  CGPath *v5;
  void *v6;
  double v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  CAUITransportButton *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  CAUITransportButton *v18;

  if (self->drawingStyle != a3)
  {
    self->drawingStyle = a3;
    v5 = -[CAUITransportButton newPathRefForStyle:](self, "newPathRefForStyle:");
    objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setPath:", v5);
    CGPathRelease(v5);
    -[CAUITransportButton setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor"));
    if (a3 == 4)
    {
      objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "removeAllAnimations");
      v6 = (void *)MEMORY[0x24BEBDB00];
      v9 = MEMORY[0x24BDAC760];
      v10 = 3221225472;
      v11 = __39__CAUITransportButton_setDrawingStyle___block_invoke_2;
      v12 = &unk_24CF54EF0;
      v13 = self;
      v7 = 1.0;
      v8 = &v9;
    }
    else
    {
      if (a3 != 5)
      {
LABEL_7:
        -[CAUITransportButton setNeedsDisplay](self, "setNeedsDisplay");
        return;
      }
      v6 = (void *)MEMORY[0x24BEBDB00];
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __39__CAUITransportButton_setDrawingStyle___block_invoke;
      v17 = &unk_24CF54EF0;
      v18 = self;
      v7 = 1.0;
      v8 = &v14;
    }
    objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 196608, v8, 0, v7, 0.0, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_7;
  }
}

uint64_t __39__CAUITransportButton_setDrawingStyle___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setStrokeColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 760));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setFillColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 760));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setLineWidth:", 0.5);
  return objc_msgSend(*(id *)(a1 + 32), "flash");
}

uint64_t __39__CAUITransportButton_setDrawingStyle___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor"), "CGColor"));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setFillColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 760));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setLineWidth:", 0.0);
}

- (int)drawingStyle
{
  return self->drawingStyle;
}

- (void)setFillColor:(CGColor *)a3
{
  CGColorRetain(a3);
  CGColorRelease(self->fillColor);
  self->fillColor = a3;
  objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setFillColor:", a3);
}

- (CGColor)fillColor
{
  return self->fillColor;
}

- (void)flash
{
  void *v3;
  void *v4;
  double v5;
  _QWORD v6[5];

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", self->fillColor), "colorWithAlphaComponent:", 0.2);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("fillColor"));
  objc_msgSend(v4, "setFromValue:", objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "fillColor"));
  objc_msgSend(v4, "setToValue:", objc_msgSend(v3, "CGColor"));
  objc_msgSend(v4, "setDuration:", 2.0);
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setRepeatCount:", v5);
  objc_msgSend(v4, "setAutoreverses:", 1);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__CAUITransportButton_flash__block_invoke;
  v6[3] = &unk_24CF54EF0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v6);
  objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "addAnimation:forKey:", v4, CFSTR("animateStrokeColor"));
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

_DWORD *__28__CAUITransportButton_flash__block_invoke(uint64_t a1)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[188] == 5)
    return (_DWORD *)objc_msgSend(result, "flash");
  return result;
}

- (CGPath)newPathRefForStyle:(int)a3
{
  CGRect *p_imageRect;
  double width;
  double height;
  double v6;
  CGPath *Mutable;
  float v9;
  CGFloat v10;
  float v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGPath *v18;
  double v19;
  double v20;
  CGFloat v21;
  float v22;
  CGFloat v23;
  float v24;
  CGFloat v25;
  CGFloat v26;
  float v27;
  CGFloat v28;
  float v29;
  float v30;
  double v31;
  float v32;
  double v33;
  CGFloat v34;
  float v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  p_imageRect = &self->imageRect;
  width = self->imageRect.size.width;
  height = self->imageRect.size.height;
  if (width >= height)
    v6 = self->imageRect.size.height;
  else
    v6 = self->imageRect.size.width;
  switch(a3)
  {
    case 1:
      Mutable = CGPathCreateMutable();
      v9 = (p_imageRect->size.height - v6 * 0.857) * 0.5;
      v10 = roundf(v9);
      v11 = v6 * 0.857;
      v12 = roundf(v11);
      v38.origin.x = 0.0;
      v38.origin.y = v10;
      v38.size.width = v6 * 0.062;
      v38.size.height = v12;
      CGPathAddRoundedRect(Mutable, 0, v38, v6 * 0.026 * 0.5, v6 * 0.026 * 0.5);
      v13 = v6 * 0.0631 * 0.5;
      v14 = v6 * 0.062 + v6 * 0.006;
      v15 = 2.0943951;
      CGPathAddArc(Mutable, 0, v14 + v13, v12 * 0.5 + v10, v13, 2.0943951, 4.1887902, 0);
      CGPathAddArc(Mutable, 0, v6 * 0.699 + v14 - v13, v13 + v10, v13, 4.1887902, 0.0, 0);
      v16 = v12 + v10 - v13;
      v17 = 0.0;
      v18 = Mutable;
      v19 = v6 * 0.699 + v14 - v13;
      v20 = v13;
      goto LABEL_10;
    case 2:
      Mutable = CGPathCreateMutable();
      v21 = v6 * 0.2776;
      v22 = (p_imageRect->size.width + v6 * -0.7452) * 0.5;
      v23 = roundf(v22);
      v24 = (p_imageRect->size.height - v6 * 0.857) * 0.5;
      v25 = roundf(v24);
      v26 = v6 * 0.0397 * 0.5;
      v27 = v6 * 0.857;
      v28 = roundf(v27);
      v39.origin.x = v23;
      v39.origin.y = v25;
      v39.size.width = v21;
      v39.size.height = v28;
      CGPathAddRoundedRect(Mutable, 0, v39, v26, v26);
      v29 = p_imageRect->size.width - v23 - v21;
      v40.origin.x = roundf(v29);
      v40.origin.y = v25;
      v40.size.width = v21;
      v40.size.height = v28;
      CGPathAddRoundedRect(Mutable, 0, v40, v26, v26);
      return Mutable;
    case 3:
      Mutable = CGPathCreateMutable();
      v30 = (p_imageRect->size.width - v6 * 0.6538) * 0.5;
      v31 = roundf(v30);
      v32 = (p_imageRect->size.height - v6 * 0.857) * 0.5;
      v33 = roundf(v32);
      v34 = v6 * 0.0631 * 0.5;
      v35 = v6 * 0.857;
      v36 = roundf(v35);
      v15 = 3.14159265;
      CGPathAddArc(Mutable, 0, v34 + v31, v34 + v33, v34, 3.14159265, 5.23598776, 0);
      CGPathAddArc(Mutable, 0, v6 * 0.6538 + v31 - v34, v36 * 0.5 + v33, v34, 5.23598776, 1.04719755, 0);
      v16 = v36 + v33 - v34;
      v18 = Mutable;
      v19 = v34 + v31;
      v20 = v34;
      v17 = 1.04719755;
LABEL_10:
      CGPathAddArc(v18, 0, v19, v16, v20, v17, v15, 0);
      CGPathCloseSubpath(Mutable);
      return Mutable;
    case 4:
    case 5:
      v37.size.width = v6 * 0.7825;
      v37.origin.x = (width - v6 * 0.7825) * 0.5;
      v37.origin.y = (height - v6 * 0.7825) * 0.5;
      v37.size.height = v6 * 0.7825;
      return CGPathCreateWithEllipseInRect(v37, 0);
    default:
      return 0;
  }
}

@end
