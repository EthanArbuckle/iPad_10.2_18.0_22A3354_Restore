@implementation EQKitMathMLMText

- (EQKitMathMLMText)initWithContent:(id)a3
{
  EQKitMathMLMText *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)EQKitMathMLMText;
    v4 = -[EQKitMathMLMText init](&v6, sel_init);
    if (v4)
      v4->mContent = (EQKitMathMLTokenContent *)a3;
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMText;
  -[EQKitMathMLMText dealloc](&v3, sel_dealloc);
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  return -[EQKitMathMLMText initWithContent:](self, "initWithContent:", objc_msgSend(a4, "parseChildrenAsTokenContentFromXMLNode:", a3));
}

- (id)children
{
  return 0;
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMText mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMText mathMLAttributes]::sAttributesData, &-[EQKitMathMLMToken mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMText mathMLAttributes]::sAttributesSet;
}

- (BOOL)schemataIsQuoted
{
  return 0;
}

- (id)schemataChildren
{
  return -[EQKitMathMLTokenContent children](self->mContent, "children");
}

- (BOOL)isBaseFontNameUsed
{
  return 1;
}

- (int)scriptVariant
{
  return 0;
}

- (int)scriptContext
{
  return 1;
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
