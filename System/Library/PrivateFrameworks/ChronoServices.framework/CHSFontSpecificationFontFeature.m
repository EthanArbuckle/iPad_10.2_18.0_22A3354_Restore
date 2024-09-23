@implementation CHSFontSpecificationFontFeature

- (CHSFontSpecificationFontFeature)initWithType:(int64_t)a3 selector:(int64_t)a4
{
  CHSFontSpecificationFontFeature *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHSFontSpecificationFontFeature;
  result = -[CHSFontSpecificationFontFeature init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_selector = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CHSFontSpecificationFontFeature *v4;
  BOOL v5;

  v4 = (CHSFontSpecificationFontFeature *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4->_type && self->_selector == v4->_selector;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_type);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_selector);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_selector, CFSTR("selector"));

}

- (CHSFontSpecificationFontFeature)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSFontSpecificationFontFeature *v5;

  v4 = a3;
  v5 = -[CHSFontSpecificationFontFeature init](self, "init");
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    v5->_selector = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("selector"));
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)selector
{
  return self->_selector;
}

@end
