@implementation EQKitMathMLMAlignMark

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMAlignMark;
  return -[EQKitMathMLMAlignMark init](&v5, sel_init, a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMAlignMark;
  -[EQKitMathMLMAlignMark dealloc](&v3, sel_dealloc);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesData, &-[EQKitMathMLMath mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesSet;
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
