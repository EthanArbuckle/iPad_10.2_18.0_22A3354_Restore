@implementation EQKitMathMLMath

- (EQKitMathMLMath)init
{
  return 0;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  EQKitMathMLMath *v6;
  _QWORD *v7;
  _QWORD *v8;
  EQKitMathMLNode *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EQKitMathMLMath;
  v6 = -[EQKitMathMLMath init](&v11, sel_init);
  if (v6)
  {
    v7 = operator new(0x230uLL, MEMORY[0x24BEDB6B8]);
    if (v7)
    {
      v8 = v7;
      v6->mAttributeCollection = EQKit::AttributeCollection::AttributeCollection(v7);
      objc_msgSend(a4, "setAttributeCollection:", v8);
      v9 = (EQKitMathMLNode *)(id)objc_msgSend(a4, "parseChildrenAsNodeFromXMLNode:", a3);
      v6->mExpression = v9;
      -[EQKitMathMLNode setParent:](v9, "setParent:", v6);
    }
    else
    {
      v6->mAttributeCollection = 0;
    }
    if (v6->mExpression)
    {
      v6->mEnvironment = (EQKitEnvironment *)(id)objc_msgSend(a4, "environment");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMath mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMath mathMLAttributes]::sAttributesData, (int *)"N5EQKit19AttributeCollectionE");
  }
  return &-[EQKitMathMLMath mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  void *mAttributeCollection;
  objc_super v4;

  mAttributeCollection = self->mAttributeCollection;
  if (mAttributeCollection)
    (*(void (**)(void *, SEL))(*(_QWORD *)mAttributeCollection + 8))(mAttributeCollection, a2);

  v4.receiver = self;
  v4.super_class = (Class)EQKitMathMLMath;
  -[EQKitMathMLMath dealloc](&v4, sel_dealloc);
}

- (AttributeCollection)attributeCollection
{
  return (AttributeCollection *)self->mAttributeCollection;
}

- (id)newLayout
{
  return -[EQKitLayoutImplementation initWithRoot:environment:]([EQKitLayoutImplementation alloc], "initWithRoot:environment:", self, self->mEnvironment);
}

- (EQKitLayoutNode)parent
{
  return 0;
}

- (NSArray)children
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->mExpression;
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (Schemata)layoutSchemata
{
  EQKit::Layout::Schemata *v4;

  if (self->mExpression)
    v4 = (EQKit::Layout::Schemata *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
  else
    v4 = (EQKit::Layout::Schemata *)objc_msgSend(MEMORY[0x24BDBCE30], "array");
  return (Schemata *)EQKit::Layout::Schemata::row(v4, (uint64_t)retstr);
}

- (id)layoutStyleNode
{
  return 0;
}

- (int64_t)scriptLevelWithBase:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isNumber
{
  return 0;
}

- (BOOL)isSpaceLike
{
  return 0;
}

- (BOOL)isEmbellishedOperator
{
  return 0;
}

- (id)operatorCore
{
  return 0;
}

- (int)isOperatorPaddingRequired
{
  return 1;
}

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitMathMLNode isBaseFontNameUsed](self->mExpression, "isBaseFontNameUsed");
}

- (BOOL)isAttributeDefaultInheritableFromStyle:(int)a3
{
  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p expr=%@>"), NSStringFromClass(v4), self, self->mExpression);
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
