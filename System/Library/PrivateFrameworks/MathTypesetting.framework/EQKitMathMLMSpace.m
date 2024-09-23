@implementation EQKitMathMLMSpace

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMSpace;
  return -[EQKitMathMLMSpace init](&v5, sel_init, a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMSpace;
  -[EQKitMathMLMSpace dealloc](&v3, sel_dealloc);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMSpace mathMLAttributes]::sAttributesSet, -[EQKitMathMLMSpace mathMLAttributes]::sAttributesData, &-[EQKitMathMLMStack mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMSpace mathMLAttributes]::sAttributesSet;
}

- (BOOL)isSpaceLike
{
  return 1;
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
