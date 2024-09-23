@implementation CNUIPRLikenessProvider

- (PRLikeness)likeness
{
  return self->_likeness;
}

- (CNUIPRLikenessProvider)initWithPRLikeness:(id)a3
{
  id v5;
  CNUIPRLikenessProvider *v6;
  CNUIPRLikenessProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNUIPRLikenessProvider;
  v6 = -[CNUIPRLikenessProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_likeness, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likeness, 0);
}

- (unint64_t)_cnui_likenessType
{
  void *v2;
  unint64_t v3;

  -[CNUIPRLikenessProvider likeness](self, "likeness");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

@end
