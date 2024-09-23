@implementation LNSystemProtocolParameter

- (LNSystemProtocolParameter)initWithVocabularyModel:(int64_t)a3
{
  LNSystemProtocolParameter *v4;
  LNSystemProtocolParameter *v5;
  LNSystemProtocolParameter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNSystemProtocolParameter;
  v4 = -[LNSystemProtocolParameter init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_vocabularyModel = a3;
    v6 = v4;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNSystemProtocolParameter vocabularyModel](self, "vocabularyModel");
  v7 = CFSTR("AppSetting");
  if (!v6)
    v7 = CFSTR("None");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, vocabularyModel: %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (LNSystemProtocolParameter)initWithCoder:(id)a3
{
  return -[LNSystemProtocolParameter initWithVocabularyModel:](self, "initWithVocabularyModel:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("vocabularyModel")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNSystemProtocolParameter vocabularyModel](self, "vocabularyModel"), CFSTR("vocabularyModel"));

}

- (BOOL)isEqual:(id)a3
{
  LNSystemProtocolParameter *v4;
  LNSystemProtocolParameter *v5;
  LNSystemProtocolParameter *v6;
  int64_t v7;
  BOOL v8;

  v4 = (LNSystemProtocolParameter *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = -[LNSystemProtocolParameter vocabularyModel](self, "vocabularyModel");
      v8 = v7 == -[LNSystemProtocolParameter vocabularyModel](v6, "vocabularyModel");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int64_t)vocabularyModel
{
  return self->_vocabularyModel;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
