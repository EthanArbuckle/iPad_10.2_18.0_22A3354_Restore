@implementation MPModelCuratorActualKind

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelCuratorActualKind;
  v3 = -[MPModelKind hash](&v5, sel_hash);
  return -[MPModelCuratorActualKind variants](self, "variants") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelCuratorActualKind;
  if (-[MPModelKind isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_variants == v4[2];
  else
    v5 = 0;

  return v5;
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  unint64_t variants;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  variants = self->_variants;
  if ((variants & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("Apple editor"));
    variants = self->_variants;
    if ((variants & 2) == 0)
    {
LABEL_3:
      if ((variants & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((variants & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "addObject:", CFSTR("editorial genre"));
  variants = self->_variants;
  if ((variants & 4) == 0)
  {
LABEL_4:
    if ((variants & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v4, "addObject:", CFSTR("radio show"));
  variants = self->_variants;
  if ((variants & 8) == 0)
  {
LABEL_5:
    if ((variants & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v4, "addObject:", CFSTR("activity"));
    if ((self->_variants & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v4, "addObject:", CFSTR("external curator"));
  variants = self->_variants;
  if ((variants & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((variants & 0x20) != 0)
LABEL_7:
    objc_msgSend(v4, "addObject:", CFSTR("editorial item"));
LABEL_8:
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" or "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MPModelCuratorActualKind)initWithCoder:(id)a3
{
  MPModelCuratorActualKind *v4;

  +[MPModelCuratorActualKind kindWithVariants:](MPModelCuratorActualKind, "kindWithVariants:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("variants")));
  v4 = (MPModelCuratorActualKind *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelCuratorActualKind;
  v4 = a3;
  -[MPModelKind encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, CFSTR("variants"), v5.receiver, v5.super_class);

}

- (unint64_t)variants
{
  return self->_variants;
}

+ (id)kindWithVariants:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Curator:v%lu"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MPModelCuratorActualKind_kindWithVariants___block_invoke;
  v9[3] = &__block_descriptor_40_e34_v16__0__MPModelCuratorActualKind_8l;
  v9[4] = a3;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v6, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __45__MPModelCuratorActualKind_kindWithVariants___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(result + 32);
  return result;
}

@end
