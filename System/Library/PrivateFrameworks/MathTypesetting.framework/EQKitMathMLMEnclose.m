@implementation EQKitMathMLMEnclose

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMEnclose;
  -[EQKitMathMLUnaryNode dealloc](&v3, sel_dealloc);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMEnclose mathMLAttributes]::sAttributesSet, (int *)"/", -[EQKitMathMLMFenced mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMEnclose mathMLAttributes]::sAttributesSet;
}

- (id)schemataRow
{
  return self->super.mChild;
}

- (id)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
