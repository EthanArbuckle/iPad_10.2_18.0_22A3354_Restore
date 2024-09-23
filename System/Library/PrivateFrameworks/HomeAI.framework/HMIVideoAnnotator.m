@implementation HMIVideoAnnotator

- (HMIVideoAnnotator)initWithPixelBuffer:(__CVBuffer *)a3 fontSize:(double)a4
{
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMIVideoAnnotator;
  v6 = -[HMIVideoAnnotator init](&v8, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 1) = CVPixelBufferRetain(a3);
    *((_QWORD *)v6 + 2) = 0;
    *((_QWORD *)v6 + 3) = 0;
    *((_QWORD *)v6 + 4) = objc_msgSend(v6, "_createFontWithSize:", a4);
    *(_OWORD *)(v6 + 40) = *MEMORY[0x24BDBF148];
  }
  return (HMIVideoAnnotator *)v6;
}

- (__CTFont)_createFontWithSize:(double)a3
{
  const __CTFont *UIFontForLanguage;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  const __CTFontDescriptor *v8;
  __CTFont *CopyWithAttributes;
  _QWORD v11[2];
  _QWORD v12[2];
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, a3, 0);
  v14 = *MEMORY[0x24BDC4D20];
  v4 = *MEMORY[0x24BDC4D18];
  v11[0] = *MEMORY[0x24BDC4D28];
  v11[1] = v4;
  v12[0] = &unk_24DC146C0;
  v12[1] = &unk_24DC146D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v8 = CTFontDescriptorCreateWithAttributes(v7);
  CopyWithAttributes = CTFontCreateCopyWithAttributes(UIFontForLanguage, 0.0, 0, v8);
  CFRelease(v8);
  CFRelease(UIFontForLanguage);

  return CopyWithAttributes;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  CGContextRelease(self->_context);
  CGColorSpaceRelease(self->_colorSpace);
  CFRelease(self->_font);
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoAnnotator;
  -[HMIVideoAnnotator dealloc](&v3, sel_dealloc);
}

- (void)draw:(id)a3
{
  void *BaseAddressOfPlane;
  OSType PixelFormatType;
  CGFloat v6;
  uint32_t v7;
  CGColorSpace *DeviceRGB;
  size_t width;
  size_t height;
  size_t BytesPerRowOfPlane;
  CGContext *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a3;
  CVPixelBufferLockBaseAddress(self->_pixelBuffer, 0);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(self->_pixelBuffer, 0);
  PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  self->_size.width = HMICVPixelBufferGetSize(self->_pixelBuffer);
  self->_size.height = v6;
  if (PixelFormatType == 32)
  {
    v7 = 2;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceGray();
    v7 = 0;
  }
  self->_colorSpace = DeviceRGB;
  width = (unint64_t)self->_size.width;
  height = (unint64_t)self->_size.height;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(self->_pixelBuffer, 0);
  v12 = CGBitmapContextCreate(BaseAddressOfPlane, width, height, 8uLL, BytesPerRowOfPlane, self->_colorSpace, v7);
  self->_context = v12;
  if (v12)
    v13[2]();
  CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 0);
  CGColorSpaceRelease(self->_colorSpace);
  CGContextRelease(self->_context);
  self->_context = 0;
  self->_colorSpace = 0;

}

- (void)drawText:(id)a3 at:(CGPoint)a4 color:(const double *)a5
{
  CGFloat y;
  CGFloat x;
  CGColorSpace *colorSpace;
  id v10;
  CGColor *v11;
  __CTFont *font;
  uint64_t v13;
  void *v14;
  const __CFAttributedString *v15;
  const __CTLine *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  y = a4.y;
  x = a4.x;
  v18[2] = *MEMORY[0x24BDAC8D0];
  colorSpace = self->_colorSpace;
  v10 = a3;
  v11 = CGColorCreate(colorSpace, a5);
  font = self->_font;
  v13 = *MEMORY[0x24BDC4EE0];
  v17[0] = *MEMORY[0x24BDC4C28];
  v17[1] = v13;
  v18[0] = font;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v10, v14);

  v16 = CTLineCreateWithAttributedString(v15);
  CGContextSetTextPosition(self->_context, x, y);
  CTLineDraw(v16, self->_context);
  CFRelease(v16);
  CGColorRelease(v11);

}

- (void)drawRect:(CGRect)a3 width:(double)a4 color:(const double *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSetLineWidth(self->_context, a4);
  if (a5)
  {
    v11 = *a5;
    v12 = a5[1];
    v13 = a5[2];
    v14 = a5[3];
  }
  else
  {
    v11 = 1.0;
    v12 = 1.0;
    v13 = 1.0;
    v14 = 1.0;
  }
  CGContextSetRGBStrokeColor(self->_context, v11, v12, v13, v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGContextStrokeRect(self->_context, v15);
}

- (void)drawTextHeaderBar:(id)a3
{
  CGContext *context;
  id v5;
  CGFloat v6;
  _OWORD v7[2];
  uint64_t v8;
  CGRect v9;

  v8 = *MEMORY[0x24BDAC8D0];
  context = self->_context;
  v5 = a3;
  CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
  v9.size.width = self->_size.width;
  v9.origin.y = self->_size.height + -64.0;
  v9.size.height = 64.0;
  v9.origin.x = 0.0;
  CGContextFillRect(context, v9);
  v6 = self->_size.height + -32.0 + -8.0;
  v7[0] = xmmword_219E9D388;
  v7[1] = unk_219E9D398;
  -[HMIVideoAnnotator drawText:at:color:](self, "drawText:at:color:", v5, v7, 10.0, v6);

}

- (void)drawBoundingBox:(CGRect)a3 lineWidth:(double)a4 text:(id)a5 color:(const double *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double MinX;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23 = a5;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (!CGRectIsNull(v24))
  {
    HMICGRectPixelFromNormalized(x, y, width, height, self->_size.width, self->_size.height);
    v13 = v25.origin.x;
    v14 = v25.origin.y;
    v15 = v25.size.width;
    v16 = v25.size.height;
    MinX = CGRectGetMinX(v25);
    v18 = self->_size.height;
    v26.origin.x = v13;
    v26.origin.y = v14;
    v26.size.width = v15;
    v26.size.height = v16;
    v19 = v18 - CGRectGetMinY(v26);
    v27.origin.x = v13;
    v27.origin.y = v14;
    v27.size.width = v15;
    v27.size.height = v16;
    v20 = CGRectGetWidth(v27);
    v28.origin.x = v13;
    v28.origin.y = v14;
    v28.size.width = v15;
    v28.size.height = v16;
    v21 = -CGRectGetHeight(v28);
    -[HMIVideoAnnotator drawRect:width:color:](self, "drawRect:width:color:", a6, MinX, v19, v20, v21, a4);
    if (objc_msgSend(v23, "length"))
    {
      v29.origin.x = MinX;
      v29.origin.y = v19;
      v29.size.width = v20;
      v29.size.height = v21;
      v22 = CGRectGetMinX(v29) + 4.0;
      v30.origin.x = MinX;
      v30.origin.y = v19;
      v30.size.width = v20;
      v30.size.height = v21;
      -[HMIVideoAnnotator drawText:at:color:](self, "drawText:at:color:", v23, a6, v22, CGRectGetMaxY(v30) + 8.0);
    }
  }

}

- (void)drawPolygonWithNormalizedPoints:(id)a3
{
  CGContext *context;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  double v10;
  _QWORD v11[6];
  CGFloat components[2];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  context = self->_context;
  *(_OWORD *)components = xmmword_219E9D388;
  v13 = unk_219E9D398;
  v5 = a3;
  CGContextSetStrokeColor(context, components);
  CGContextSetLineWidth(context, 3.0);
  CGContextSaveGState(context);
  CGContextTranslateCTM(context, 0.0, self->_size.height);
  CGContextScaleCTM(context, 1.0, -1.0);
  CGContextBeginPath(context);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "x");
  v8 = v7 * self->_size.width;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "y");
  CGContextMoveToPoint(context, v8, v10 * self->_size.height);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__HMIVideoAnnotator_drawPolygonWithNormalizedPoints___block_invoke;
  v11[3] = &unk_24DBEC310;
  v11[4] = self;
  v11[5] = context;
  objc_msgSend(v5, "na_each:", v11);

  CGContextStrokePath(context);
  CGContextRestoreGState(context);
}

void __53__HMIVideoAnnotator_drawPolygonWithNormalizedPoints___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;

  v3 = *(CGContext **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "x");
  v6 = v5 * *(double *)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v4, "y");
  v8 = v7;

  CGContextAddLineToPoint(v3, v6, v8 * *(double *)(*(_QWORD *)(a1 + 32) + 48));
}

@end
