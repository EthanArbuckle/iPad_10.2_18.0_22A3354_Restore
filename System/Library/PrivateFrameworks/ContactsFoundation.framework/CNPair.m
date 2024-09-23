@implementation CNPair

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (id)first
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)second
{
  return objc_getProperty(self, a2, 16, 1);
}

void __31__CNPair_initWithFirst_second___block_invoke_2()
{
  CNPair *v0;
  uint64_t v1;
  void *v2;

  v0 = [CNPair alloc];
  v1 = -[CNPair initNonMemoizedWithFirst:second:](v0, "initNonMemoizedWithFirst:second:", MEMORY[0x1E0C9AAA0], 0);
  v2 = (void *)initWithFirst_second__cn_once_object_2;
  initWithFirst_second__cn_once_object_2 = v1;

}

void __31__CNPair_initWithFirst_second___block_invoke()
{
  CNPair *v0;
  uint64_t v1;
  void *v2;

  v0 = [CNPair alloc];
  v1 = -[CNPair initNonMemoizedWithFirst:second:](v0, "initNonMemoizedWithFirst:second:", MEMORY[0x1E0C9AAB0], 0);
  v2 = (void *)initWithFirst_second__cn_once_object_1;
  initWithFirst_second__cn_once_object_1 = v1;

}

+ (CNPair)pairWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFirst:second:", v7, v6);

  return (CNPair *)v8;
}

- (CNPair)initWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNPair *v11;
  CNPair *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 == (id)MEMORY[0x1E0C9AAB0] && v7 == 0)
  {
    if (initWithFirst_second__cn_once_token_1 != -1)
      dispatch_once(&initWithFirst_second__cn_once_token_1, &__block_literal_global_33);
    v11 = (CNPair *)initWithFirst_second__cn_once_object_1;
  }
  else if (v6 == (id)MEMORY[0x1E0C9AAA0] && v7 == 0)
  {
    if (initWithFirst_second__cn_once_token_2 != -1)
      dispatch_once(&initWithFirst_second__cn_once_token_2, &__block_literal_global_1_1);
    v11 = (CNPair *)initWithFirst_second__cn_once_object_2;
  }
  else
  {
    v11 = -[CNPair initNonMemoizedWithFirst:second:](self, "initNonMemoizedWithFirst:second:", v6, v7);
    self = v11;
  }
  v12 = v11;

  return v12;
}

- (id)initNonMemoizedWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  CNPair *v9;
  id *p_isa;
  id *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNPair;
  v9 = -[CNPair init](&v13, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(p_isa + 2, a4);
    v11 = p_isa;
  }

  return p_isa;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPair first](self, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("first"), v4);

  -[CNPair second](self, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("second"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CNPair *v4;
  unint64_t first;
  unint64_t second;
  BOOL v7;

  v4 = (CNPair *)a3;
  v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (first = (unint64_t)self->_first, first | (unint64_t)v4->_first)
      && !objc_msgSend((id)first, "isEqual:")
      || (second = (unint64_t)self->_second, second | (unint64_t)v4->_second)
      && !objc_msgSend((id)second, "isEqual:"))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;
  _QWORD aBlock[5];
  _QWORD v6[5];

  aBlock[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __14__CNPair_hash__block_invoke;
  v6[3] = &unk_1E29B9B10;
  v6[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __14__CNPair_hash__block_invoke_2;
  aBlock[3] = &unk_1E29B9B10;
  v2 = _Block_copy(aBlock);
  v3 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v6, v2, 0);

  return v3;
}

unint64_t __14__CNPair_hash__block_invoke(uint64_t a1)
{
  void *v1;
  unint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "first");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", v1);

  return v2;
}

unint64_t __14__CNPair_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  unint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "second");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", v1);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNPair *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("first"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("second"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNPair initWithFirst:second:](self, "initWithFirst:second:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNPair first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("first"));

  -[CNPair second](self, "second");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("second"));

}

@end
