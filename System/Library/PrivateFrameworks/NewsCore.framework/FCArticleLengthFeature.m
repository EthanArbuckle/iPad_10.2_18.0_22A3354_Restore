@implementation FCArticleLengthFeature

+ (id)shortLengthFeature
{
  if (qword_1ED0F7AD0 != -1)
    dispatch_once(&qword_1ED0F7AD0, &__block_literal_global_134_0);
  return (id)qword_1ED0F7AC8;
}

void __44__FCArticleLengthFeature_shortLengthFeature__block_invoke()
{
  FCArticleLengthFeature *v0;
  void *v1;

  v0 = -[FCArticleLengthFeature initWithLengthIdentifier:]([FCArticleLengthFeature alloc], "initWithLengthIdentifier:", CFSTR("s"));
  v1 = (void *)qword_1ED0F7AC8;
  qword_1ED0F7AC8 = (uint64_t)v0;

}

+ (id)mediumLengthFeature
{
  if (qword_1ED0F7AE0 != -1)
    dispatch_once(&qword_1ED0F7AE0, &__block_literal_global_137);
  return (id)qword_1ED0F7AD8;
}

void __45__FCArticleLengthFeature_mediumLengthFeature__block_invoke()
{
  FCArticleLengthFeature *v0;
  void *v1;

  v0 = -[FCArticleLengthFeature initWithLengthIdentifier:]([FCArticleLengthFeature alloc], "initWithLengthIdentifier:", CFSTR("m"));
  v1 = (void *)qword_1ED0F7AD8;
  qword_1ED0F7AD8 = (uint64_t)v0;

}

+ (id)longLengthFeature
{
  if (qword_1ED0F7AF0 != -1)
    dispatch_once(&qword_1ED0F7AF0, &__block_literal_global_140_0);
  return (id)qword_1ED0F7AE8;
}

void __43__FCArticleLengthFeature_longLengthFeature__block_invoke()
{
  FCArticleLengthFeature *v0;
  void *v1;

  v0 = -[FCArticleLengthFeature initWithLengthIdentifier:]([FCArticleLengthFeature alloc], "initWithLengthIdentifier:", CFSTR("l"));
  v1 = (void *)qword_1ED0F7AE8;
  qword_1ED0F7AE8 = (uint64_t)v0;

}

- (FCArticleLengthFeature)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[FCArticleLengthFeature initWithLengthIdentifier:](self, "initWithLengthIdentifier:", &stru_1E464BC40);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticleLengthFeature init]";
    v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    v11 = 1024;
    v12 = 506;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleLengthFeature init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCArticleLengthFeature)initWithLengthIdentifier:(id)a3
{
  id v4;
  FCArticleLengthFeature *v5;
  FCArticleLengthFeature *v6;
  uint64_t v7;
  NSString *personalizationIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCArticleLengthFeature;
  v5 = -[FCPersonalizationFeature init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FCArticleLengthFeature setLengthID:](v5, "setLengthID:", v4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("fa0"), CFSTR("+"), v4);
    v7 = objc_claimAutoreleasedReturnValue();
    personalizationIdentifier = v6->super._personalizationIdentifier;
    v6->super._personalizationIdentifier = (NSString *)v7;

  }
  return v6;
}

- (FCArticleLengthFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  FCArticleLengthFeature *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("+"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "substringWithRange:", v5 + v6, objc_msgSend(v4, "length") - (v5 + v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[FCArticleLengthFeature initWithLengthIdentifier:](self, "initWithLengthIdentifier:", v8);

    v7 = self;
  }

  return v7;
}

- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4
{
  double result;

  objc_msgSend(a3, "articleLengthAggregateWeight");
  return result;
}

- (NSString)lengthID
{
  return self->_lengthID;
}

- (void)setLengthID:(id)a3
{
  objc_storeStrong((id *)&self->_lengthID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lengthID, 0);
}

@end
