@implementation EMFQueryUntokenized

- (id)tokens
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  -[EMFQuery queryString](self, "queryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFQuery locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _createNormalizedString(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)EMFQueryUntokenized;
  -[EMFQuery setTokens:](&v10, sel_setTokens_, v6);
  v9.receiver = self;
  v9.super_class = (Class)EMFQueryUntokenized;
  -[EMFQuery tokens](&v9, sel_tokens);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasMultipleConstituentTokens
{
  void *v2;
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EMFQueryUntokenized;
  -[EMFQuery tokens](&v5, sel_tokens);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

@end
