@implementation IFGraphicsContext

+ (id)bitmapContextWithSize:(CGSize)a3 scale:(double)a4 preset:(unint64_t)a5
{
  double v7;
  double v8;
  double v9;
  CGColorSpace *v10;
  uint32_t v11;
  CGContextRef v12;
  CGContextRef v13;
  __int128 v14;
  IFGraphicsContext *v15;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v7 = round(a3.width * a4);
  v8 = round(a3.height * a4);
  if (a5 == 3)
  {
    v10 = 0;
    v11 = 7;
LABEL_7:
    v9 = v7;
    goto LABEL_10;
  }
  if (a5 == 2)
  {
    v10 = +[IFColor deviceGreyColorSpace](IFColor, "deviceGreyColorSpace");
    v11 = 1;
    goto LABEL_7;
  }
  v9 = v7 * 4.0;
  if (a5)
    v10 = 0;
  else
    v10 = +[IFColor deviceRGBColorSpace](IFColor, "deviceRGBColorSpace");
  v11 = 1;
LABEL_10:
  v12 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, 8uLL, (unint64_t)v9, v10, v11);
  if (v12)
  {
    v13 = v12;
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v18.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
    *(_OWORD *)&v17.c = v14;
    *(_OWORD *)&v17.tx = *(_OWORD *)&v18.tx;
    CGAffineTransformScale(&v18, &v17, a4, a4);
    v17 = v18;
    CGContextSetCTM();
    v15 = -[IFGraphicsContext initWithCGContext:preset:]([IFGraphicsContext alloc], "initWithCGContext:preset:", v13, a5);
    CFRelease(v13);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (IFGraphicsContext)initWithCGContext:(CGContext *)a3 preset:(unint64_t)a4
{
  IFGraphicsContext *v6;
  IFGraphicsContext *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IFGraphicsContext;
  v6 = -[IFGraphicsContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_preset = a4;
    v6->_cgContext = (CGContext *)CFRetain(a3);
  }
  return v7;
}

- (void)dealloc
{
  CGContext *cgContext;
  objc_super v4;

  cgContext = self->_cgContext;
  if (cgContext)
    CFRelease(cgContext);
  v4.receiver = self;
  v4.super_class = (Class)IFGraphicsContext;
  -[IFGraphicsContext dealloc](&v4, sel_dealloc);
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[IFGraphicsContext scale](self, "scale");
  v4 = v3;
  v5 = (double)CGBitmapContextGetWidth(self->_cgContext) / v3;
  v6 = (double)CGBitmapContextGetHeight(self->_cgContext) / v4;
  v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)scale
{
  CGAffineTransform v3;

  memset(&v3, 0, sizeof(v3));
  CGContextGetCTM(&v3, -[IFGraphicsContext cgContext](self, "cgContext"));
  return sqrt(fabs(v3.a * v3.d - v3.b * v3.c));
}

- (IFImage)image
{
  CGImageRef Image;
  CGImageRef v4;
  IFImage *v5;
  IFImage *v6;

  Image = CGBitmapContextCreateImage(self->_cgContext);
  if (Image)
  {
    v4 = Image;
    v5 = [IFImage alloc];
    -[IFGraphicsContext scale](self, "scale");
    v6 = -[IFImage initWithCGImage:scale:](v5, "initWithCGImage:scale:", v4);
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)imageFromRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGImageRef Image;
  CGImage *v9;
  CGImageRef v10;
  IFImage *v11;
  IFImage *v12;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Image = CGBitmapContextCreateImage(self->_cgContext);
  if (!Image)
    goto LABEL_4;
  v9 = Image;
  -[IFGraphicsContext transform](self, "transform");
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v16 = CGRectApplyAffineTransform(v15, &v14);
  v10 = CGImageCreateWithImageInRect(v9, v16);
  CFRelease(v9);
  if (v10)
  {
    v11 = [IFImage alloc];
    -[IFGraphicsContext scale](self, "scale");
    v12 = -[IFImage initWithCGImage:scale:](v11, "initWithCGImage:scale:", v10);
    CFRelease(v10);
  }
  else
  {
LABEL_4:
    v12 = 0;
  }
  return v12;
}

- (NSData)data
{
  void *Data;
  size_t BytesPerRow;

  Data = CGBitmapContextGetData(self->_cgContext);
  BytesPerRow = CGBitmapContextGetBytesPerRow(self->_cgContext);
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", Data, CGBitmapContextGetHeight(self->_cgContext) * BytesPerRow, 0);
}

- (IFColor)fillColor
{
  return -[IFColor initWithCGColor:]([IFColor alloc], "initWithCGColor:", CGContextGetFillColorAsColor());
}

- (void)setFillColor:(id)a3
{
  CGContextSetFillColorWithColor(self->_cgContext, (CGColorRef)objc_msgSend(a3, "cgColor"));
}

- (IFColor)strokeColor
{
  return -[IFColor initWithCGColor:]([IFColor alloc], "initWithCGColor:", CGContextGetStrokeColorAsColor());
}

- (void)setStrokeColor:(id)a3
{
  CGContextSetStrokeColorWithColor(self->_cgContext, (CGColorRef)objc_msgSend(a3, "cgColor"));
}

- (void)setLineWidth:(double)a3
{
  CGContextSetLineWidth(self->_cgContext, a3);
}

- (double)lineWidth
{
  double result;

  CGContextGetLineWidth();
  return result;
}

- (void)setBlendMode:(int)a3
{
  CGContextSetBlendMode(self->_cgContext, (CGBlendMode)a3);
}

- (int)blendMode
{
  return CGContextGetBlendMode();
}

- (void)drawCGImage:(CGImage *)a3 inRect:(CGRect)a4
{
  CGContextDrawImage(self->_cgContext, a4, a3);
}

- (void)drawCGImage:(CGImage *)a3 centeredInRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[IFGraphicsContext scale](self, "scale");
  v11 = v10;
  v12 = (double)CGImageGetWidth(a3) / v10;
  v13 = (double)CGImageGetHeight(a3) / v11;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v14 = round(CGRectGetMidX(v15) - v12 * 0.5);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v17.origin.y = round(CGRectGetMidY(v16) - v13 * 0.5);
  v17.origin.x = v14;
  v17.size.width = v12;
  v17.size.height = v13;
  CGContextDrawImage(self->_cgContext, v17, a3);
}

- (void)drawSymbolImage:(id)a3 centeredInRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGImage *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MinX;
  CGFloat v21;
  double MinY;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (CGImage *)objc_msgSend(v9, "CGImage");
  objc_msgSend(v9, "contentBounds");
  v12 = v11;
  v28 = v13;
  objc_msgSend(v9, "alignmentRect");
  v15 = v14;
  objc_msgSend(v9, "alignmentRect");
  v17 = v16;
  objc_msgSend(v9, "baselineOffset");
  v19 = v17 - v18;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MinX = CGRectGetMinX(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v21 = v15 + MinX + CGRectGetMidX(v30) - v12 * 0.5;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MinY = CGRectGetMinY(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v23 = v19 + MinY + CGRectGetMidY(v32) - v28 * 0.5;
  objc_msgSend(v9, "alignmentRect");
  v25 = v24;
  objc_msgSend(v9, "alignmentRect");
  v27 = v26;

  v33.origin.x = v21;
  v33.origin.y = v23;
  v33.size.width = v25;
  v33.size.height = v27;
  CGContextDrawImage(self->_cgContext, v33, v10);
}

- (void)drawText:(id)a3 fontName:(id)a4 fontSize:(double)a5 inRect:(CGRect)a6
{
  double width;
  double y;
  double x;
  id v11;
  CTFontRef UIFontForLanguage;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFAttributedString *v17;
  const __CTLine *v18;
  const __CTLine *v19;
  double TypographicBounds;
  double v21;
  double v22;
  double v23;
  CGContext *cgContext;
  __int128 v25;
  CGAffineTransform v26;
  CGFloat leading;
  CGFloat descent;
  CGFloat ascent;
  _QWORD v30[2];
  _QWORD v31[3];
  CGRect ImageBounds;

  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v31[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[IFGraphicsContext pushState](self, "pushState");
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, a5, 0);
  -[IFGraphicsContext strokeColor](self, "strokeColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "cgColor");

  v15 = *MEMORY[0x1E0CA8550];
  v30[0] = *MEMORY[0x1E0CA8188];
  v30[1] = v15;
  v31[0] = UIFontForLanguage;
  v31[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v11, v16);
  v18 = CTLineCreateWithAttributedString(v17);
  if (v18)
  {
    v19 = v18;
    descent = 0.0;
    ascent = 0.0;
    leading = 0.0;
    TypographicBounds = CTLineGetTypographicBounds(v18, &ascent, &descent, &leading);
    if (TypographicBounds > 0.0)
    {
      v21 = TypographicBounds;
      v22 = TypographicBounds + 6.0;
      v23 = 1.0;
      if (width > 6.0 && v22 > width)
      {
        v22 = width + -6.0 + 6.0;
        v23 = (width + -6.0) / v21;
        v21 = width + -6.0;
      }
      if (v22 <= width)
      {
        ImageBounds = CTLineGetImageBounds(v19, self->_cgContext);
        CGContextTranslateCTM(self->_cgContext, x + (width - floor(v21)) * 0.5, ceil(y - ImageBounds.origin.y));
        if (v23 < 1.0)
          CGContextScaleCTM(self->_cgContext, v23, v23);
        cgContext = self->_cgContext;
        v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v26.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v26.c = v25;
        *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        CGContextSetTextMatrix(cgContext, &v26);
      }
      CGContextSetShouldAntialias(self->_cgContext, 1);
      CGContextSetShouldSmoothFonts(self->_cgContext, 0);
      CGContextSetTextDrawingMode(self->_cgContext, kCGTextFill);
      CGContextSetTextPosition(self->_cgContext, 0.0, 0.0);
      CTLineDraw(v19, self->_cgContext);
    }
    CFRelease(v19);
  }
  -[IFGraphicsContext popState](self, "popState");

}

- (void)strokeRect:(CGRect)a3
{
  CGContextStrokeRect(self->_cgContext, a3);
}

- (void)fillRect:(CGRect)a3
{
  CGContextFillRect(self->_cgContext, a3);
}

- (void)strokePath:(CGPath *)a3
{
  CGContextSaveGState(self->_cgContext);
  CGContextAddPath(self->_cgContext, a3);
  CGContextStrokePath(self->_cgContext);
  CGContextRestoreGState(self->_cgContext);
}

- (void)fillPath:(CGPath *)a3
{
  CGContextSaveGState(self->_cgContext);
  CGContextAddPath(self->_cgContext, a3);
  CGContextFillPath(self->_cgContext);
  CGContextRestoreGState(self->_cgContext);
}

- (void)clear
{
  CGContextClear();
}

- (CGRect)bounds
{
  return CGContextGetClipBoundingBox(self->_cgContext);
}

- (void)clipToMaskCGImage:(CGImage *)a3 inRect:(CGRect)a4
{
  CGContextClipToMask(self->_cgContext, a4, a3);
}

- (CGAffineTransform)transform
{
  return CGContextGetCTM(retstr, self->_cgContext);
}

- (void)setTransform:(CGAffineTransform *)a3
{
  CGContextSetCTM();
}

- (void)pushState
{
  CGContextSaveGState(self->_cgContext);
}

- (void)popState
{
  CGContextRestoreGState(self->_cgContext);
}

- (CGContext)cgContext
{
  return self->_cgContext;
}

- (unint64_t)preset
{
  return self->_preset;
}

@end
