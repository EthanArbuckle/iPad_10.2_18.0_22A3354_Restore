@implementation EQKitMathMLBinaryNode

- (EQKitMathMLBinaryNode)init
{
  return -[EQKitMathMLBinaryNode initWithFirst:second:](self, "initWithFirst:second:", 0, 0);
}

- (EQKitMathMLBinaryNode)initWithFirst:(id)a3 second:(id)a4
{
  EQKitMathMLBinaryNode *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EQKitMathMLBinaryNode;
  v6 = -[EQKitMathMLBinaryNode init](&v8, sel_init);
  if (v6)
  {
    v6->mFirst = (EQKitMathMLNode *)a3;
    v6->mSecond = (EQKitMathMLNode *)a4;
    -[EQKitMathMLNode setParent:](v6->mFirst, "setParent:", v6);
    -[EQKitMathMLNode setParent:](v6->mSecond, "setParent:", v6);
  }
  return v6;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  void *v7;

  v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");
  if (objc_msgSend(v7, "count") == 2)
    return -[EQKitMathMLBinaryNode initWithFirst:second:](self, "initWithFirst:second:", objc_msgSend(v7, "objectAtIndex:", 0), objc_msgSend(v7, "objectAtIndex:", 1));
  objc_msgSend(a4, "reportError:withNode:", 5, a3);

  return 0;
}

- (id)children
{
  EQKitMathMLNode *mSecond;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  mSecond = self->mSecond;
  v4[0] = self->mFirst;
  v4[1] = mSecond;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitMathMLNode isBaseFontNameUsed](self->mFirst, "isBaseFontNameUsed")
      || -[EQKitMathMLNode isBaseFontNameUsed](self->mSecond, "isBaseFontNameUsed");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLBinaryNode;
  -[EQKitMathMLBinaryNode dealloc](&v3, sel_dealloc);
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
