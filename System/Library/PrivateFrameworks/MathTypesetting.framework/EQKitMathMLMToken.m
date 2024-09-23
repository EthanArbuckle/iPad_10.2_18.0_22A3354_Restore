@implementation EQKitMathMLMToken

- (EQKitMathMLMToken)init
{
  return -[EQKitMathMLMToken initWithString:environment:](self, "initWithString:environment:", 0, 0);
}

- (EQKitMathMLMToken)initWithString:(id)a3 environment:(id)a4
{
  EQKitMathMLMToken *v5;
  unsigned int v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EQKitMathMLMToken;
  v5 = -[EQKitMathMLMToken init](&v9, sel_init, a3, a4);
  if (v5)
  {
    v6 = EQKitUtilUTF32CharFromString(a3);
    v7 = *(_BYTE *)&v5->mFlags & 0xFC;
    if (v6)
    {
      *(_BYTE *)&v5->mFlags = v7;
      v5->mContent.mChar = v6;
    }
    else
    {
      *(_BYTE *)&v5->mFlags = v7 | 1;
      v5->mContent.mString = (NSString *)a3;
    }
  }
  return v5;
}

- (EQKitMathMLMToken)initWithContent:(id)a3
{
  EQKitMathMLMToken *v4;
  EQKitMathMLMToken *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)EQKitMathMLMToken;
    v4 = -[EQKitMathMLMToken init](&v7, sel_init);
    v5 = v4;
    if (v4)
    {
      *(_BYTE *)&v4->mFlags = *(_BYTE *)&v4->mFlags & 0xFC | 2;
      v4->mContent.mString = (NSString *)a3;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  id v7;
  std::string *p_p;
  void *v9;
  EQKitMathMLMToken *v10;
  std::string __p;

  if (!EQKitXMLIsTextContentOnly((uint64_t)a3))
    return -[EQKitMathMLMToken initWithContent:](self, "initWithContent:", objc_msgSend(a4, "parseChildrenAsTokenContentFromXMLNode:", a3));
  EQKitXMLTextContentAsString(a3, 1, &__p);
  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v9 = (void *)objc_msgSend(v7, "initWithUTF8String:", p_p);
  v10 = -[EQKitMathMLMToken initWithString:environment:](self, "initWithString:environment:", v9, objc_msgSend(a4, "environment"));

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v10;
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMToken mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMToken mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMUnder mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMToken mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  objc_super v3;

  if ((*(_BYTE *)&self->mFlags & 3u) - 1 <= 1)

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMToken;
  -[EQKitMathMLMToken dealloc](&v3, sel_dealloc);
}

- (int)scriptVariant
{
  return 0;
}

- (int)scriptContext
{
  return 0;
}

- (unsigned)schemataUnicharOrNul
{
  if ((*(_BYTE *)&self->mFlags & 3) != 0)
    return 0;
  else
    return self->mContent.mChar;
}

- (NSString)description
{
  int v3;
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;

  v3 = *(_BYTE *)&self->mFlags & 3;
  if (v3 == 2)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = (objc_class *)objc_opt_class();
    return (NSString *)objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@ %p content=%@>"), NSStringFromClass(v10), self, self->mContent.mString);
  }
  else if (v3 == 1)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    return (NSString *)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %p string=%@>"), NSStringFromClass(v12), self, self->mContent.mString);
  }
  else if ((*(_BYTE *)&self->mFlags & 3) != 0)
  {
    return 0;
  }
  else
  {
    v4 = (void *)EQKitUtilNewStringFromUTF32Char(self->mContent.mChar);
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (objc_class *)objc_opt_class();
    v7 = (NSString *)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p char='%@'>"), NSStringFromClass(v6), self, v4);

    return v7;
  }
}

- (BOOL)isNumber
{
  return 0;
}

- (id)schemataTokenString
{
  if ((*(_BYTE *)&self->mFlags & 3) == 1)
    return self->mContent.mString;
  if ((*(_BYTE *)&self->mFlags & 3) != 0)
    return 0;
  return (id)EQKitUtilNewStringFromUTF32Char(self->mContent.mChar);
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
