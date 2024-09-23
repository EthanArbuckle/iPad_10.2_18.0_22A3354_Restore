@implementation PDFAnnotationEditMenuConfiguration

+ (id)configurationWithIdentifier:(id)a3 sourcePoint:(CGPoint)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PDFAnnotationEditMenuConfiguration;
  objc_msgSendSuper2(&v5, sel_configurationWithIdentifier_sourcePoint_, a3, a4.x, a4.y);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PDFAnnotation)annotation
{
  return (PDFAnnotation *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
