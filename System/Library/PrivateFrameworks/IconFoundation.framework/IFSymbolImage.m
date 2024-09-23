@implementation IFSymbolImage

- (IFSymbolImage)initWithNamedVectorGlyph:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  id *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
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
  objc_super v26;

  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "image");
  v26.receiver = self;
  v26.super_class = (Class)IFSymbolImage;
  v7 = -[IFImage _init](&v26, sel__init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong(v7 + 15, a3);
    objc_msgSend(v5, "scale");
    v8[6] = v9;
    if (v6)
    {
      CFRetain(v6);
      v8[5] = v6;
      v10 = (double)CGImageGetWidth((CGImageRef)v6) / *((double *)v8 + 6);
      v11 = (double)CGImageGetHeight((CGImageRef)v6) / *((double *)v8 + 6);
      *((double *)v8 + 16) = v10;
      *((double *)v8 + 17) = v11;
    }
    objc_msgSend(v5, "pointSize");
    v8[7] = v12;
    v8[8] = (id)objc_msgSend(v5, "glyphSize");
    v8[9] = (id)objc_msgSend(v5, "glyphWeight");
    objc_msgSend(v5, "referencePointSize");
    v8[10] = v13;
    objc_msgSend(v5, "fontMatchingScaleFactor");
    v8[11] = v14;
    objc_msgSend(v5, "baselineOffset");
    v8[12] = v15;
    objc_msgSend(v5, "baselineOffset");
    v8[13] = v16;
    objc_msgSend(v5, "alignmentRect");
    v8[18] = v17;
    v8[19] = v18;
    v8[20] = v19;
    v8[21] = v20;
    objc_msgSend(v5, "contentBounds");
    v8[22] = v21;
    v8[23] = v22;
    v8[24] = v23;
    v8[25] = v24;
    *((_BYTE *)v8 + 32) = objc_msgSend(v5, "isFlippable");
    v8[14] = (id)objc_msgSend(v5, "layoutDirection");
  }

  return (IFSymbolImage *)v8;
}

- (void)dealloc
{
  CGImage *internalCGImage;
  objc_super v4;

  internalCGImage = self->_internalCGImage;
  if (internalCGImage)
    CFRelease(internalCGImage);
  v4.receiver = self;
  v4.super_class = (Class)IFSymbolImage;
  -[IFSymbolImage dealloc](&v4, sel_dealloc);
}

- (CGImage)CGImage
{
  CGImage *v3;
  CGImage *internalCGImage;

  v3 = +[IFImage escapingCGImageWithCGImage:](IFImage, "escapingCGImageWithCGImage:", self->_internalCGImage);
  internalCGImage = self->_internalCGImage;
  if (v3 != internalCGImage)
  {
    CFAutorelease(internalCGImage);
    CFRetain(v3);
    self->_internalCGImage = v3;
  }
  return v3;
}

- (double)scale
{
  return self->_internalScale;
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_internalSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (unint64_t)symbolSize
{
  return self->_symbolSize;
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (double)referencePointSize
{
  return self->_referencePointSize;
}

- (double)fontMatchingScaleFactor
{
  return self->_fontMatchingScaleFactor;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (double)capHeight
{
  return self->_capHeight;
}

- (CGRect)alignmentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_alignmentRect.origin.x;
  y = self->_alignmentRect.origin.y;
  width = self->_alignmentRect.size.width;
  height = self->_alignmentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isFlippable
{
  return self->_flippable;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (CUINamedVectorGlyph)vectorGlyph
{
  return (CUINamedVectorGlyph *)objc_getProperty(self, a2, 120, 1);
}

- (void)setVectorGlyph:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorGlyph, 0);
}

@end
