@implementation EQKitMathMLAnnotation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLAnnotation;
  -[EQKitMathMLAnnotation dealloc](&v3, sel_dealloc);
}

- (const)mathMLAttributes
{
  return 0;
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
