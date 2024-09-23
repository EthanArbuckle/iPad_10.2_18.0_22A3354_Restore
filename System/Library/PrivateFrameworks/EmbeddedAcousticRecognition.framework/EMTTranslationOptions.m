@implementation EMTTranslationOptions

- (EMTTranslationOptions)init
{
  EMTTranslationOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMTTranslationOptions;
  result = -[EMTTranslationOptions init](&v3, sel_init);
  if (result)
    result->_enableDisambiguationAlternatives = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setEnableDisambiguationAlternatives:", -[EMTTranslationOptions enableDisambiguationAlternatives](self, "enableDisambiguationAlternatives"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_enableDisambiguationAlternatives, CFSTR("enableDisambiguationAlternatives"));
}

- (EMTTranslationOptions)initWithCoder:(id)a3
{
  id v4;
  EMTTranslationOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMTTranslationOptions;
  v5 = -[EMTTranslationOptions init](&v7, sel_init);
  if (v5)
    v5->_enableDisambiguationAlternatives = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableDisambiguationAlternatives"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)enableDisambiguationAlternatives
{
  return self->_enableDisambiguationAlternatives;
}

- (void)setEnableDisambiguationAlternatives:(BOOL)a3
{
  self->_enableDisambiguationAlternatives = a3;
}

@end
