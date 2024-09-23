@implementation PDFBorder

- (PDFBorder)init
{
  PDFBorder *v2;
  PDFBorderPrivateVars *v3;
  PDFBorderPrivateVars *v4;
  PDFBorderPrivateVars *v5;
  NSArray *dashPattern;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDFBorder;
  v2 = -[PDFBorder init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PDFBorderPrivateVars);
    v4 = v2->_private;
    v2->_private = v3;

    objc_storeWeak((id *)&v2->_private->annotation, 0);
    v2->_private->style = 0;
    v2->_private->hCornerRadius = 0.0;
    v2->_private->vCornerRadius = 0.0;
    v2->_private->lineWidth = 1.0;
    v2->_private->dashCount = 0;
    v5 = v2->_private;
    dashPattern = v5->dashPattern;
    v5->dashPattern = 0;

    v2->_private->dashPatternRaw = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStyle:", -[PDFBorder style](self, "style"));
  -[PDFBorder lineWidth](self, "lineWidth");
  objc_msgSend(v4, "setLineWidth:");
  -[PDFBorder dashPattern](self, "dashPattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDashPattern:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PDFBorder style](self, "style"), CFSTR("PDFBorderStyle"));
  -[PDFBorder lineWidth](self, "lineWidth");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("PDFBorderLineWidth"));
  -[PDFBorder dashPattern](self, "dashPattern");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PDFBorderDashPattern"));

}

- (void)dealloc
{
  PDFBorderPrivateVars *v3;
  double *dashPatternRaw;
  objc_super v5;

  v3 = self->_private;
  dashPatternRaw = v3->dashPatternRaw;
  if (dashPatternRaw)
  {
    free(dashPatternRaw);
    v3 = self->_private;
  }
  v3->dashPatternRaw = 0;
  v5.receiver = self;
  v5.super_class = (Class)PDFBorder;
  -[PDFBorder dealloc](&v5, sel_dealloc);
}

- (id)description
{
  unint64_t style;
  const __CFString *v3;

  style = self->_private->style;
  if (style > 4)
    v3 = CFSTR("<unknown>");
  else
    v3 = off_24C25D968[style];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PDFBorder: {%@ lineWidth:%.1f hCorner:%.1f vCorner:%.1f dashCount:%lu dashPattern:%@}"), v3, *(_QWORD *)&self->_private->lineWidth, *(_QWORD *)&self->_private->hCornerRadius, *(_QWORD *)&self->_private->vCornerRadius, self->_private->dashCount, self->_private->dashPattern);
}

- (PDFBorderStyle)style
{
  return self->_private->style;
}

- (void)setStyle:(PDFBorderStyle)style
{
  PDFBorderStyle v4;
  PDFBorderPrivateVars *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PDFBorderPrivateVars *v10;
  NSArray *dashPattern;
  id WeakRetained;
  id v13;

  self->_private->style = style;
  v4 = -[PDFBorder style](self, "style");
  v5 = self->_private;
  if (v4 == kPDFBorderStyleDashed && !v5->dashPattern)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v6);
    v10 = self->_private;
    dashPattern = v10->dashPattern;
    v10->dashPattern = (NSArray *)v9;

    self->_private->dashCount = 2;
    -[PDFBorder _updateDashPatternRaw](self, "_updateDashPatternRaw");

    v5 = self->_private;
  }
  WeakRetained = objc_loadWeakRetained((id *)&v5->annotation);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    objc_msgSend(WeakRetained, "updateAnnotationEffect");
    WeakRetained = v13;
  }

}

- (CGFloat)lineWidth
{
  return self->_private->lineWidth;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  PDFBorderPrivateVars *v3;
  double v4;
  id WeakRetained;
  PDFBorder *v6;
  id v7;

  v3 = self->_private;
  v4 = v3->lineWidth;
  v3->lineWidth = lineWidth;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "updateAnnotationEffect");
    v6 = objc_alloc_init(PDFBorder);
    -[PDFBorder setLineWidth:](v6, "setLineWidth:", v4);
    objc_msgSend(v7, "presentRedactionDiscoverabilityAlertWithOldValue:forAnnotationKey:", v6, CFSTR("/Border"));

    WeakRetained = v7;
  }

}

- (NSArray)dashPattern
{
  return self->_private->dashPattern;
}

- (void)setDashPattern:(NSArray *)dashPattern
{
  PDFBorderPrivateVars *v4;
  uint64_t v5;
  PDFBorderPrivateVars *v6;
  NSArray *v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = (id)-[NSArray copy](dashPattern, "copy");
  self->_private->dashCount = objc_msgSend(v10, "count");
  v4 = self->_private;
  if (v4->dashCount >= 11)
    v4->dashCount = 10;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v10);
  v6 = self->_private;
  v7 = v6->dashPattern;
  v6->dashPattern = (NSArray *)v5;

  -[PDFBorder _updateDashPatternRaw](self, "_updateDashPatternRaw");
  -[PDFBorder setStyle:](self, "setStyle:", self->_private->dashCount != 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "updateAnnotationEffect");

}

- (void)drawInRect:(CGRect)rect
{
  -[PDFBorder drawInRect:inContext:](self, "drawInRect:inContext:", PDFGraphicsGetCurrentContext(), rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

- (NSDictionary)borderKeyValues
{
  id v3;
  void *v4;
  void *v5;
  NSArray *dashPattern;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_private->lineWidth);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("W"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_private->style);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("S"));

  dashPattern = self->_private->dashPattern;
  if (dashPattern)
  {
    v7 = (void *)-[NSArray copyWithZone:](dashPattern, "copyWithZone:", 0);
    objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("D"));

  }
  return (NSDictionary *)v3;
}

- (PDFBorder)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4
{
  id v6;
  CGPDFDictionaryRef v8;
  CGPDFArrayRef value;

  v6 = a4;
  v8 = 0;
  value = 0;
  if (a3)
  {
    self = -[PDFBorder init](self, "init");
    if (self)
    {
      if (CGPDFDictionaryGetDictionary(a3, "BS", &v8))
      {
        -[PDFBorder _setStyleFromDictionary:](self, "_setStyleFromDictionary:", v8);
LABEL_7:
        self = self;
        a3 = (CGPDFDictionary *)self;
        goto LABEL_9;
      }
      if (!CGPDFDictionaryGetArray(a3, "Border", &value)
        || -[PDFBorder setBorderCharacteristicsFromArray:](self, "setBorderCharacteristicsFromArray:", value))
      {
        goto LABEL_7;
      }
    }
    a3 = 0;
  }
LABEL_9:

  return (PDFBorder *)a3;
}

- (__CFDictionary)createDictionaryRef
{
  double v3;
  double v4;
  PDFBorderStyle v5;
  PDFBorderStyle v7;
  const __CFAllocator *v8;
  __CFDictionary *Mutable;
  CFNumberRef v10;
  PDFBorderPrivateVars *v11;
  const __CFString *dashPattern;
  const __CFString *v13;
  double valuePtr;

  -[PDFBorder lineWidth](self, "lineWidth");
  v4 = v3;
  valuePtr = v3;
  v5 = -[PDFBorder style](self, "style");
  if (v4 == 1.0 && v5 == kPDFBorderStyleSolid)
    return 0;
  v7 = v5;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v4 != 1.0)
  {
    v10 = CFNumberCreate(v8, kCFNumberDoubleType, &valuePtr);
    CFDictionarySetValue(Mutable, CFSTR("/W"), v10);
    CFRelease(v10);
  }
  switch(v7)
  {
    case kPDFBorderStyleDashed:
      CFDictionarySetValue(Mutable, CFSTR("/S"), CFSTR("/D"));
      v11 = self->_private;
      if (v11->dashCount >= 1)
      {
        dashPattern = (const __CFString *)v11->dashPattern;
        if (dashPattern)
        {
          v13 = CFSTR("/D");
          goto LABEL_15;
        }
      }
      return Mutable;
    case kPDFBorderStyleBeveled:
      v13 = CFSTR("/S");
      dashPattern = CFSTR("/B");
      goto LABEL_15;
    case kPDFBorderStyleInset:
      v13 = CFSTR("/S");
      dashPattern = CFSTR("/I");
      goto LABEL_15;
    case kPDFBorderStyleUnderline:
      v13 = CFSTR("/S");
      dashPattern = CFSTR("/U");
LABEL_15:
      CFDictionarySetValue(Mutable, v13, dashPattern);
      break;
    default:
      return Mutable;
  }
  return Mutable;
}

- (void)setAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_private->annotation, a3);
}

- (BOOL)_isRectangular
{
  double v3;
  double v4;

  -[PDFBorder horizontalCornerRadius](self, "horizontalCornerRadius");
  if (v3 != 0.0)
    return 0;
  -[PDFBorder verticalCornerRadius](self, "verticalCornerRadius");
  return v4 == 0.0;
}

- (const)dashPatternRaw
{
  return self->_private->dashPatternRaw;
}

- (void)_updateDashPatternRaw
{
  PDFBorderPrivateVars *v3;
  double *dashPatternRaw;
  PDFBorderPrivateVars *v5;
  int64_t v6;
  void *v7;
  float v8;

  v3 = self->_private;
  dashPatternRaw = v3->dashPatternRaw;
  if (dashPatternRaw)
  {
    free(dashPatternRaw);
    v3 = self->_private;
  }
  self->_private->dashPatternRaw = (double *)malloc_type_malloc(8 * v3->dashCount, 0x100004000313F17uLL);
  v5 = self->_private;
  if (v5->dashCount >= 1)
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndex:](v5->dashPattern, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      self->_private->dashPatternRaw[v6] = v8;

      ++v6;
      v5 = self->_private;
    }
    while (v5->dashCount > v6);
  }
}

- (unsigned)dashCountRaw
{
  return self->_private->dashCount;
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)CurrentContext
{
  double v6;
  double v7;
  PDFBorderStyle v8;
  CGAffineTransform *CTM;
  double a;
  CGFloat b;
  CGFloat d;
  double c;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MaxY;
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
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double MinY;
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
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  CGPath **v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGAffineTransform transform;
  CGAffineTransform v85;
  __int128 v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v86 = 0uLL;
  -[PDFBorder lineWidth](self, "lineWidth");
  if (v6 != 0.0)
  {
    v7 = v6;
    if (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
    {
      v83 = v7;
      CGContextSaveGState(CurrentContext);
      v8 = -[PDFBorder style](self, "style");
      CTM = CGContextGetCTM(&v85, CurrentContext);
      a = v85.a;
      b = v85.b;
      c = v85.c;
      d = v85.d;
      v86 = *(_OWORD *)&v85.tx;
      v87.origin.x = PDFRectToCGRect(CTM);
      v85.a = a;
      v85.b = b;
      v85.c = c;
      v85.d = d;
      *(_OWORD *)&v85.tx = v86;
      v88 = CGRectApplyAffineTransform(v87, &v85);
      v89 = CGRectIntegral(v88);
      v14 = PDFRectFromCGRect(v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v85.a = a;
      v85.b = b;
      v85.c = c;
      v85.d = d;
      *(_OWORD *)&v85.tx = v86;
      CGAffineTransformInvert(&transform, &v85);
      CGContextConcatCTM(CurrentContext, &transform);
      if (-[PDFBorder _isRectangular](self, "_isRectangular"))
      {
        v21 = (void *)MEMORY[0x24BDF6870];
        v90.origin.x = v14;
        v22 = v83;
        v90.origin.y = v16;
        v90.size.width = v18;
        v90.size.height = v20;
        v91 = PDFRectInset(v90, v83 * 0.5, v83 * 0.5);
        objc_msgSend(v21, "bezierPathWithRect:", v91.origin.x, v91.origin.y, v91.size.width, v91.size.height);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PDFBorder horizontalCornerRadius](self, "horizontalCornerRadius");
        v24 = v14;
        v26 = v25;
        -[PDFBorder verticalCornerRadius](self, "verticalCornerRadius");
        v78 = fabs(c * v26 + a * v26);
        v28 = fabs(c * v27 + a * v27);
        objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v16;
        v29 = v83 * 0.5 + PDFRectGetMinX(v24, v16, v18);
        MaxY = PDFRectGetMaxY(v24, v16, v18, v20);
        objc_msgSend(v23, "moveToPoint:", PDFPointMake(v29, MaxY - (v83 * 0.5 + v28)));
        v31 = PDFPointMake(v78, v28);
        v33 = v32;
        v81 = v20;
        v34 = PDFPointMake(0.0, v28 * 0.55228);
        v35 = v18;
        v37 = v36;
        v38 = PDFPointMake(v78 - 0.55228 * v78, v28);
        PDFKitAddRelativeCurveToPoint(v23, v31, v33, v34, v37, v38, v39);
        v80 = v35;
        v40 = PDFRectGetMaxX(v24, v82, v35) - (v83 * 0.5 + v78);
        v41 = PDFRectGetMaxY(v24, v82, v35, v81);
        v42 = PDFPointMake(v40, v41 - v83 * 0.5);
        PDFKitAddLineToPoint(v23, v42);
        v43 = v28;
        v79 = -v28;
        v44 = PDFPointMake(v78, -v28);
        v46 = v45;
        v47 = PDFPointMake(v78 * 0.55228, 0.0);
        v49 = v48;
        v50 = PDFPointMake(v78, -(v43 - 0.55228 * v43));
        PDFKitAddRelativeCurveToPoint(v23, v44, v46, v47, v49, v50, v51);
        v52 = PDFRectGetMaxX(v24, v82, v80) - v83 * 0.5;
        MinY = PDFRectGetMinY(v24, v82, v80, v81);
        v54 = v43;
        v55 = PDFPointMake(v52, v83 * 0.5 + v43 + MinY);
        PDFKitAddLineToPoint(v23, v55);
        v56 = PDFPointMake(-v78, v79);
        v58 = v57;
        v59 = PDFPointMake(0.0, -(v54 * 0.55228));
        v61 = v60;
        v62 = PDFPointMake(-(v78 - 0.55228 * v78), v79);
        PDFKitAddRelativeCurveToPoint(v23, v56, v58, v59, v61, v62, v63);
        v64 = v83 * 0.5 + v78 + PDFRectGetMinX(v24, v82, v80);
        v65 = PDFRectGetMinY(v24, v82, v80, v81);
        v66 = PDFPointMake(v64, v83 * 0.5 + v65);
        PDFKitAddLineToPoint(v23, v66);
        v67 = v54;
        v68 = PDFPointMake(-v78, v54);
        v70 = v69;
        v71 = PDFPointMake(-(v78 * 0.55228), 0.0);
        v73 = v72;
        v74 = PDFPointMake(-v78, v67 - 0.55228 * v67);
        v22 = v83;
        PDFKitAddRelativeCurveToPoint(v23, v68, v70, v71, v73, v74, v75);
        objc_msgSend(v23, "closePath");
      }
      CGContextSetLineWidth(CurrentContext, v22);
      if (v8 == kPDFBorderStyleDashed)
        objc_msgSend(v23, "setLineDash:count:phase:", self->_private->dashPatternRaw, self->_private->dashCount, 0.0);
      v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v23, 0);
      v77 = +[PDFAnnotationDrawing createCGPathArrayWithBezierPaths:](PDFAnnotationDrawing, "createCGPathArrayWithBezierPaths:", v76);
      if (objc_msgSend(v76, "count") && v77)
      {
        if (*v77)
        {
          CGContextAddPath(CurrentContext, *v77);
          CGContextStrokePath(CurrentContext);
          CGPathRelease(*v77);
          free(v77);
        }
      }
      CGContextRestoreGState(CurrentContext);

    }
  }
}

- (void)_setStyleFromDictionary:(CGPDFDictionary *)a3
{
  char *v5;
  int64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PDFBorderPrivateVars *v11;
  NSArray *dashPattern;
  char *__s1;
  CGPDFArrayRef v14;
  CGPDFReal value;

  v14 = 0;
  value = 0.0;
  __s1 = 0;
  if (CGPDFDictionaryGetNumber(a3, "W", &value))
    self->_private->lineWidth = value;
  if (CGPDFDictionaryGetName(a3, "S", (const char **)&__s1))
  {
    v5 = __s1;
    if (!strcmp(__s1, "S"))
    {
      v6 = 0;
    }
    else if (!strcmp(v5, "D"))
    {
      v6 = 1;
    }
    else if (!strcmp(v5, "B"))
    {
      v6 = 2;
    }
    else if (!strcmp(v5, "I"))
    {
      v6 = 3;
    }
    else
    {
      if (strcmp(v5, "U"))
        goto LABEL_15;
      v6 = 4;
    }
    self->_private->style = v6;
  }
LABEL_15:
  if (-[PDFBorder style](self, "style") == kPDFBorderStyleDashed)
  {
    if (CGPDFDictionaryGetArray(a3, "D", &v14))
    {
      -[PDFBorder _setDashFromArray:](self, "_setDashFromArray:", v14);
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v7);
      v11 = self->_private;
      dashPattern = v11->dashPattern;
      v11->dashPattern = (NSArray *)v10;

      self->_private->dashCount = 2;
      -[PDFBorder _updateDashPatternRaw](self, "_updateDashPatternRaw");

    }
  }
}

- (void)_setDashFromArray:(CGPDFArray *)a3
{
  size_t Count;
  int64_t v6;
  id v7;
  size_t v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  PDFBorderPrivateVars *v13;
  NSArray *dashPattern;
  CGPDFReal value;

  value = 0.0;
  Count = CGPDFArrayGetCount(a3);
  if (Count)
  {
    if (Count >= 0xA)
      v6 = 10;
    else
      v6 = Count;
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = 0;
    v9 = 0.0;
    while (CGPDFArrayGetNumber(a3, v8, &value))
    {
      v10 = value;
      if (value < 0.0)
      {
        value = 0.0;
        v10 = 0.0;
      }
      v9 = v9 + v10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (uint64_t)v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      if (v6 == ++v8)
      {
        if (v9 < 0.0001)
          self->_private->lineWidth = 0.0;
        v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v7);
        v13 = self->_private;
        dashPattern = v13->dashPattern;
        v13->dashPattern = (NSArray *)v12;

        self->_private->dashCount = v6;
        -[PDFBorder _updateDashPatternRaw](self, "_updateDashPatternRaw");
        break;
      }
    }

  }
}

- (BOOL)setBorderCharacteristicsFromArray:(CGPDFArray *)a3
{
  size_t Count;
  unint64_t v6;
  size_t v7;
  _BOOL4 Number;
  CGPDFReal v9;
  CGPDFArrayRef v11;
  CGPDFReal value;

  Count = CGPDFArrayGetCount(a3);
  v6 = Count - 3;
  if (Count - 3 <= 1)
  {
    v7 = Count;
    value = 0.0;
    if (CGPDFArrayGetNumber(a3, 0, &value))
      self->_private->hCornerRadius = value;
    if (CGPDFArrayGetNumber(a3, 1uLL, &value))
      self->_private->vCornerRadius = value;
    Number = CGPDFArrayGetNumber(a3, 2uLL, &value);
    v9 = value;
    if (!Number)
      v9 = 0.0;
    self->_private->lineWidth = v9;
    if (v7 == 4)
    {
      v11 = 0;
      if (CGPDFArrayGetArray(a3, 3uLL, &v11))
        -[PDFBorder _setDashFromArray:](self, "_setDashFromArray:", v11);
    }
    else
    {
      self->_private->style = 0;
    }
  }
  return v6 < 2;
}

- (double)horizontalCornerRadius
{
  return self->_private->hCornerRadius;
}

- (void)updateCornerBorderStyle
{
  if ((unint64_t)-[PDFBorder style](self, "style") >= kPDFBorderStyleBeveled)
    -[PDFBorder setStyle:](self, "setStyle:", -[PDFBorder dashCountRaw](self, "dashCountRaw") != 0);
}

- (void)setHorizontalCornerRadius:(double)a3
{
  self->_private->hCornerRadius = a3;
  -[PDFBorder updateCornerBorderStyle](self, "updateCornerBorderStyle");
}

- (double)verticalCornerRadius
{
  return self->_private->vCornerRadius;
}

- (void)setVerticalCornerRadius:(double)a3
{
  self->_private->vCornerRadius = a3;
  -[PDFBorder updateCornerBorderStyle](self, "updateCornerBorderStyle");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
