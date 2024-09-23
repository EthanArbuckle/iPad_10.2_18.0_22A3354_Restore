@implementation EQKitMathMLUnaryNode

- (EQKitMathMLUnaryNode)init
{
  return -[EQKitMathMLUnaryNode initWithChild:](self, "initWithChild:", 0);
}

- (EQKitMathMLUnaryNode)initWithChild:(id)a3
{
  EQKitMathMLUnaryNode *v4;
  EQKitMathMLNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EQKitMathMLUnaryNode;
  v4 = -[EQKitMathMLUnaryNode init](&v7, sel_init);
  if (v4)
  {
    v5 = (EQKitMathMLNode *)a3;
    v4->mChild = v5;
    -[EQKitMathMLNode setParent:](v5, "setParent:", v4);
  }
  return v4;
}

- (EQKitMathMLUnaryNode)initWithChildren:(id)a3
{
  EQKitMathMLUnaryNode *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EQKitMathMLUnaryNode;
  v4 = -[EQKitMathMLUnaryNode init](&v6, sel_init);
  if (v4)
    v4->mChild = (EQKitMathMLNode *)-[EQKitMathMLMRow initWithChildren:]([EQKitMathMLMRow alloc], "initWithChildren:", a3);
  return v4;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a4, "parseChildrenAsNodeFromXMLNode:");
  if (v7)
    return -[EQKitMathMLUnaryNode initWithChild:](self, "initWithChild:", v7);
  objc_msgSend(a4, "reportError:withNode:", 5, a3);

  return 0;
}

- (id)children
{
  return -[EQKitMathMLNode children](self->mChild, "children");
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitMathMLNode isBaseFontNameUsed](self->mChild, "isBaseFontNameUsed");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLUnaryNode;
  -[EQKitMathMLUnaryNode dealloc](&v3, sel_dealloc);
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
