@implementation CVNLPTextDecodingConfiguration

- (CVNLPTextDecodingConfiguration)initWithCommitActionBehavior:(id)a3
{
  CVNLPTextDecodingConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CVNLPTextDecodingConfiguration;
  result = -[CVNLPTextDecodingConfiguration init](&v5, sel_init);
  if (result)
    result->_commitActionBlock = a3;
  return result;
}

+ (id)defaultCommitActionBehaviorForLocale:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char isEqualToString;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend_languageCode(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("zh"), v9);

  if ((isEqualToString & 1) != 0)
  {
    v11 = &unk_1E60CDAC8;
  }
  else
  {
    v12 = (void *)objc_opt_class();
    objc_msgSend_defaultWhitespaceCommitActionBehavior(v12, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)MEMORY[0x1B5E082B4](v11);

  return v16;
}

+ (id)defaultWhitespaceCommitActionBehavior
{
  return &unk_1E60CDBC8;
}

+ (id)defaultCharacterCommitActionBehavior
{
  return &unk_1E60CDBE8;
}

- (id)commitActionBlock
{
  return self->_commitActionBlock;
}

- (void)setCommitActionBlock:(id)a3
{
  self->_commitActionBlock = a3;
}

@end
