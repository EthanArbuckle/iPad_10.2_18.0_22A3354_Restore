@implementation EQKitMathMLMUnder

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMUnder;
  return -[EQKitMathMLBinaryNode initFromXMLNode:parser:](&v5, sel_initFromXMLNode_parser_, a3, a4);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMUnder mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMUnder mathMLAttributes]::sAttributesData, -[EQKitMathMLMUnderover mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMUnder mathMLAttributes]::sAttributesSet;
}

- (id)schemataBase
{
  return self->super.mFirst;
}

- (id)schemataUnder
{
  return self->super.mSecond;
}

- (id)schemataOver
{
  return 0;
}

- (BOOL)isEmbellishedOperator
{
  return -[EQKitMathMLNode isEmbellishedOperator](self->super.mFirst, "isEmbellishedOperator");
}

- (id)operatorCore
{
  return -[EQKitMathMLNode operatorCore](self->super.mFirst, "operatorCore");
}

@end
