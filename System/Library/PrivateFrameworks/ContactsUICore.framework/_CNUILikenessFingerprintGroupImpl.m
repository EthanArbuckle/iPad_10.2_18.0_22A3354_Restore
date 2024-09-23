@implementation _CNUILikenessFingerprintGroupImpl

- (_CNUILikenessFingerprintGroupImpl)initWithImpls:(id)a3 scope:(id)a4 badges:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CNUILikenessFingerprintGroupImpl *v11;
  uint64_t v12;
  NSArray *impls;
  uint64_t v14;
  CNUILikenessRenderingScope *scope;
  uint64_t v16;
  NSArray *badges;
  _CNUILikenessFingerprintGroupImpl *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_CNUILikenessFingerprintGroupImpl;
  v11 = -[_CNUILikenessFingerprintGroupImpl init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    impls = v11->_impls;
    v11->_impls = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    scope = v11->_scope;
    v11->_scope = (CNUILikenessRenderingScope *)v14;

    v16 = objc_msgSend(v10, "copy");
    badges = v11->_badges;
    v11->_badges = (NSArray *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  _CNUILikenessFingerprintGroupImpl *v4;
  NSArray *impls;
  CNUILikenessRenderingScope *scope;
  NSArray *badges;
  BOOL v8;

  v4 = (_CNUILikenessFingerprintGroupImpl *)a3;
  v8 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (impls = self->_impls, (unint64_t)impls | (unint64_t)v4->_impls)
      && !-[NSArray isEqual:](impls, "isEqual:")
      || (scope = self->_scope, (unint64_t)scope | (unint64_t)v4->_scope)
      && !-[CNUILikenessRenderingScope isEqual:](scope, "isEqual:")
      || (badges = self->_badges, (unint64_t)badges | (unint64_t)v4->_badges)
      && !-[NSArray isEqual:](badges, "isEqual:"))
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "arrayHash:", self->_impls);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_scope) - v3 + 32 * v3;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_badges) - v4 + 32 * v4 + 506447;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_impls, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray _cn_map:](self->_impls, "_cn_map:", &__block_literal_global_169);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("impls"), v4);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scope"), self->_scope);
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("badges"), self->_badges);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)hasContactIdentifier:(id)a3
{
  id v4;
  NSArray *impls;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  impls = self->_impls;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58___CNUILikenessFingerprintGroupImpl_hasContactIdentifier___block_invoke;
  v8[3] = &unk_1EA603418;
  v9 = v4;
  v6 = v4;
  LOBYTE(impls) = -[NSArray _cn_any:](impls, "_cn_any:", v8);

  return (char)impls;
}

- (NSArray)impls
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (CNUILikenessRenderingScope)scope
{
  return (CNUILikenessRenderingScope *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)badges
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

@end
