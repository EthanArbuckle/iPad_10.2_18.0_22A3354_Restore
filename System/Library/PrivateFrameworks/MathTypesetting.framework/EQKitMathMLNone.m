@implementation EQKitMathMLNone

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLNone;
  return -[EQKitMathMLNone init](&v5, sel_init, a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLNone;
  -[EQKitMathMLNone dealloc](&v3, sel_dealloc);
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
