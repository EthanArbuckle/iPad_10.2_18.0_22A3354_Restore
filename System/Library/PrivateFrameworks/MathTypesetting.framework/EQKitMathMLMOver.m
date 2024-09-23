@implementation EQKitMathMLMOver

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMOver;
  return -[EQKitMathMLBinaryNode initFromXMLNode:parser:](&v5, sel_initFromXMLNode_parser_, a3, a4);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMOver mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMOver mathMLAttributes]::sAttributesData, -[EQKitMathMLMPadded mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMOver mathMLAttributes]::sAttributesSet;
}

- (id)schemataBase
{
  return self->super.mFirst;
}

- (id)schemataUnder
{
  return 0;
}

- (id)schemataOver
{
  return self->super.mSecond;
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
