@implementation PDFAnnotationFreeText

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v3;
  PDFAnnotationFreeTextPrivateVars *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFAnnotationFreeText;
  v3 = -[PDFAnnotation copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(PDFAnnotationFreeTextPrivateVars);
    v5 = (void *)v3[49];
    v3[49] = v4;

  }
  return v3;
}

- (PDFAnnotationFreeText)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PDFAnnotationFreeText;
    self = -[PDFAnnotation initWithCoder:](&v10, sel_initWithCoder_, v5);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDD0E20];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ - only keyed coders are supported by %@"), v8, objc_opt_class());

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  -[PDFAnnotation encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSFont)font
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  -[PDFAnnotation font](&v3, sel_font);
  return (NSFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFont:(NSFont *)font
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  -[PDFAnnotation setFont:](&v3, sel_setFont_, font);
}

- (NSColor)fontColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  -[PDFAnnotation fontColor](&v3, sel_fontColor);
  return (NSColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFontColor:(NSColor *)color
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  -[PDFAnnotation setFontColor:](&v3, sel_setFontColor_, color);
}

- (NSTextAlignment)alignment
{
  void *v2;
  NSTextAlignment v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Q"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setAlignment:(NSTextAlignment)alignment
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", alignment);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/Q"));

}

- (PDFAnnotationFreeText)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFAnnotationFreeText;
  return -[PDFAnnotation initWithAnnotationDictionary:forPage:](&v5, sel_initWithAnnotationDictionary_forPage_, a3, a4);
}

- (void)commonInit
{
  PDFAnnotationFreeTextPrivateVars *v3;
  PDFAnnotationFreeTextPrivateVars *private2;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFAnnotationFreeText;
  -[PDFAnnotation commonInit](&v5, sel_commonInit);
  v3 = objc_alloc_init(PDFAnnotationFreeTextPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  -[PDFAnnotation setIsFullyConstructed:](self, "setIsFullyConstructed:", 0);
  -[PDFAnnotation setType:](self, "setType:", CFSTR("/FreeText"));
  -[PDFAnnotation setIsFullyConstructed:](self, "setIsFullyConstructed:", 1);
}

- (__CFDictionary)commonCreateDictionaryRef
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFAnnotationFreeText;
  return -[PDFAnnotation commonCreateDictionaryRef](&v3, sel_commonCreateDictionaryRef);
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFAnnotationFreeText;
  -[PDFAnnotation drawWithBox:inContext:](&v4, sel_drawWithBox_inContext_, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private2, 0);
}

@end
