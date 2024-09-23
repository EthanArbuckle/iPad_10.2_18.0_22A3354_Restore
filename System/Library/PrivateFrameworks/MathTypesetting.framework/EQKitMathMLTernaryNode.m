@implementation EQKitMathMLTernaryNode

- (EQKitMathMLTernaryNode)init
{
  return -[EQKitMathMLTernaryNode initWithFirst:second:third:](self, "initWithFirst:second:third:", 0, 0, 0);
}

- (EQKitMathMLTernaryNode)initWithFirst:(id)a3 second:(id)a4 third:(id)a5
{
  EQKitMathMLTernaryNode *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EQKitMathMLTernaryNode;
  v8 = -[EQKitMathMLTernaryNode init](&v10, sel_init);
  if (v8)
  {
    v8->mFirst = (EQKitMathMLNode *)a3;
    v8->mSecond = (EQKitMathMLNode *)a4;
    v8->mThird = (EQKitMathMLNode *)a5;
    -[EQKitMathMLNode setParent:](v8->mFirst, "setParent:", v8);
    -[EQKitMathMLNode setParent:](v8->mSecond, "setParent:", v8);
    -[EQKitMathMLNode setParent:](v8->mThird, "setParent:", v8);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLTernaryNode;
  -[EQKitMathMLTernaryNode dealloc](&v3, sel_dealloc);
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  void *v7;

  v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");
  if (objc_msgSend(v7, "count") == 3)
    return -[EQKitMathMLTernaryNode initWithFirst:second:third:](self, "initWithFirst:second:third:", objc_msgSend(v7, "objectAtIndex:", 0), objc_msgSend(v7, "objectAtIndex:", 1), objc_msgSend(v7, "objectAtIndex:", 2));
  objc_msgSend(a4, "reportError:withNode:", 5, a3);

  return 0;
}

- (id)children
{
  EQKitMathMLNode *mSecond;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  mSecond = self->mSecond;
  v4[0] = self->mFirst;
  v4[1] = mSecond;
  v4[2] = self->mThird;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitMathMLNode isBaseFontNameUsed](self->mFirst, "isBaseFontNameUsed")
      || -[EQKitMathMLNode isBaseFontNameUsed](self->mSecond, "isBaseFontNameUsed")
      || -[EQKitMathMLNode isBaseFontNameUsed](self->mThird, "isBaseFontNameUsed");
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
