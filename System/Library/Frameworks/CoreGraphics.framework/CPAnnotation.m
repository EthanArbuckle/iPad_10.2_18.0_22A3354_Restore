@implementation CPAnnotation

- (CPAnnotation)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3
{
  char *v5;
  __int128 v6;
  __int128 v7;
  objc_super v9;
  __int128 v10;
  __int128 v11;

  if (!a3)
    return 0;
  v10 = 0u;
  v11 = 0u;
  if (!CGPDFDictionaryGetRect(*((CGPDFDictionary **)a3 + 2), "Rect", (double *)&v10))
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)CPAnnotation;
  v5 = -[CPGraphicObject init](&v9, sel_init);
  if (v5)
  {
    CFRetain(a3);
    *((_QWORD *)v5 + 21) = a3;
    v6 = v11;
    *(_OWORD *)(v5 + 104) = v10;
    *(_OWORD *)(v5 + 120) = v6;
    v7 = v11;
    *((_OWORD *)v5 + 3) = v10;
    *((_OWORD *)v5 + 4) = v7;
  }
  return (CPAnnotation *)v5;
}

- (void)dealloc
{
  CGPDFAnnotation *cgAnnotation;
  objc_super v4;

  cgAnnotation = self->_cgAnnotation;
  if (cgAnnotation)
    CFRelease(cgAnnotation);
  v4.receiver = self;
  v4.super_class = (Class)CPAnnotation;
  -[CPGraphicObject dealloc](&v4, sel_dealloc);
}

- (CGPDFAnnotation)cgAnnotation
{
  return self->_cgAnnotation;
}

- (void)setCgAnnotation:(CGPDFAnnotation *)a3
{
  self->_cgAnnotation = a3;
}

@end
