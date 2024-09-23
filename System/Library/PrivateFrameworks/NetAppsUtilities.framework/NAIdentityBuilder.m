@implementation NAIdentityBuilder

id __41__NAIdentityBuilder_buildPointerIdentity__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (id)appendCharacteristic:(id)a3
{
  return -[NAIdentityBuilder appendCharacteristic:withRole:comparatorBlock:hashBlock:](self, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", a3, 3, 0, 0);
}

+ (id)buildPointerIdentity
{
  void *v2;
  void *v3;
  void *v4;

  +[NAIdentityBuilder builder](NAIdentityBuilder, "builder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_126, 3, &__block_literal_global_4_1, &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)builderWithIdentity:(id)a3
{
  id v3;
  NAIdentityBuilder *v4;

  v3 = a3;
  v4 = -[NAIdentityBuilder initWithIdentity:]([NAIdentityBuilder alloc], "initWithIdentity:", v3);

  return v4;
}

+ (id)builder
{
  return (id)objc_opt_new();
}

- (NAIdentityBuilder)initWithIdentity:(id)a3
{
  id v4;
  NAIdentityBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NAIdentityBuilder;
  v5 = -[NAIdentityBuilder init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "characteristics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    if (v7)
    {
      -[NAIdentityBuilder setCharacteristics:](v5, "setCharacteristics:", v7);
    }
    else
    {
      v8 = (void *)objc_opt_new();
      -[NAIdentityBuilder setCharacteristics:](v5, "setCharacteristics:", v8);

    }
    -[NAIdentityBuilder setBuiltIdentity:](v5, "setBuiltIdentity:", v4);
  }

  return v5;
}

- (void)setCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_characteristics, a3);
}

- (NAIdentityBuilder)init
{
  return -[NAIdentityBuilder initWithIdentity:](self, "initWithIdentity:", 0);
}

- (id)build
{
  void *v3;
  NAIdentity *v4;
  void *v5;
  NAIdentity *v6;

  -[NAIdentityBuilder builtIdentity](self, "builtIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [NAIdentity alloc];
    -[NAIdentityBuilder characteristics](self, "characteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NAIdentity initWithCharacteristics:](v4, "initWithCharacteristics:", v5);
    -[NAIdentityBuilder setBuiltIdentity:](self, "setBuiltIdentity:", v6);

  }
  -[NAIdentityBuilder builtIdentity](self, "builtIdentity");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendCharacteristic:(id)a3 withRole:(int64_t)a4 comparatorBlock:(id)a5 hashBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a5;
  v11 = a6;
  v12 = a3;
  -[NAIdentityBuilder setBuiltIdentity:](self, "setBuiltIdentity:", 0);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setRole:", a4);
  v14 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v13, "setRetrievalBlock:", v14);
  if (v10)
  {
    v15 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v13, "setComparisonBlock:", v15);

  }
  if (v11)
  {
    v16 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v13, "setHashBlock:", v16);

  }
  -[NAIdentityBuilder characteristics](self, "characteristics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v13);

  return self;
}

- (void)setBuiltIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_builtIdentity, a3);
}

- (NSMutableArray)characteristics
{
  return self->_characteristics;
}

- (NAIdentity)builtIdentity
{
  return self->_builtIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtIdentity, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
}

- (id)appendCharacteristic:(id)a3 withRole:(int64_t)a4
{
  return -[NAIdentityBuilder appendCharacteristic:withRole:comparatorBlock:hashBlock:](self, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", a3, a4, 0, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[NAIdentityBuilder characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v4, "setCharacteristics:", v6);

  objc_msgSend(v4, "builtIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBuiltIdentity:", v7);

  return v4;
}

- (id)appendIntegerCharacteristic:(id)a3
{
  return -[NAIdentityBuilder appendIntegerCharacteristic:withRole:](self, "appendIntegerCharacteristic:withRole:", a3, 3);
}

- (id)appendUnsignedIntegerCharacteristic:(id)a3
{
  return -[NAIdentityBuilder appendUnsignedIntegerCharacteristic:withRole:](self, "appendUnsignedIntegerCharacteristic:withRole:", a3, 3);
}

- (id)appendFloatCharacteristic:(id)a3
{
  return -[NAIdentityBuilder appendFloatCharacteristic:withRole:](self, "appendFloatCharacteristic:withRole:", a3, 3);
}

- (id)appendDoubleCharacteristic:(id)a3
{
  return -[NAIdentityBuilder appendDoubleCharacteristic:withRole:](self, "appendDoubleCharacteristic:withRole:", a3, 3);
}

- (id)appendRangeCharacteristic:(id)a3
{
  return -[NAIdentityBuilder appendRangeCharacteristic:withRole:](self, "appendRangeCharacteristic:withRole:", a3, 3);
}

- (id)appendIntegerCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__NAIdentityBuilder_appendIntegerCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E6228AD0;
  v11 = v6;
  v7 = v6;
  -[NAIdentityBuilder appendCharacteristic:withRole:comparatorBlock:hashBlock:](self, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", v10, a4, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __58__NAIdentityBuilder_appendIntegerCharacteristic_withRole___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))());
}

- (id)appendUnsignedIntegerCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__NAIdentityBuilder_appendUnsignedIntegerCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E6228AD0;
  v11 = v6;
  v7 = v6;
  -[NAIdentityBuilder appendCharacteristic:withRole:comparatorBlock:hashBlock:](self, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", v10, a4, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __66__NAIdentityBuilder_appendUnsignedIntegerCharacteristic_withRole___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))());
}

- (id)appendFloatCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__NAIdentityBuilder_appendFloatCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E6228AD0;
  v11 = v6;
  v7 = v6;
  -[NAIdentityBuilder appendCharacteristic:withRole:comparatorBlock:hashBlock:](self, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", v10, a4, &__block_literal_global_8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__NAIdentityBuilder_appendFloatCharacteristic_withRole___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v1, "numberWithFloat:");
}

- (id)appendDoubleCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NAIdentityBuilder_appendDoubleCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E6228AD0;
  v11 = v6;
  v7 = v6;
  -[NAIdentityBuilder appendCharacteristic:withRole:comparatorBlock:hashBlock:](self, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", v10, a4, &__block_literal_global_1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __57__NAIdentityBuilder_appendDoubleCharacteristic_withRole___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v1, "numberWithDouble:");
}

- (id)appendRangeCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__NAIdentityBuilder_appendRangeCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E6228AD0;
  v11 = v6;
  v7 = v6;
  -[NAIdentityBuilder appendCharacteristic:withRole:comparatorBlock:hashBlock:](self, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", v10, a4, &__block_literal_global_1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__NAIdentityBuilder_appendRangeCharacteristic_withRole___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB3B18];
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v1, "valueWithRange:", v2, v3);
}

- (unint64_t)hashOfObject:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[NAIdentityBuilder build](self, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hashOfObject:", v4);

  return v6;
}

- (BOOL)isObject:(id)a3 equalToObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[NAIdentityBuilder build](self, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isObject:equalToObject:", v7, v6);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

+ (id)na_identity
{
  if (na_identity_onceToken_121 != -1)
    dispatch_once(&na_identity_onceToken_121, &__block_literal_global_122);
  return (id)na_identity_identity_120;
}

void __32__NAIdentityBuilder_na_identity__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[NAIdentityBuilder builder](NAIdentityBuilder, "builder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_124);
  objc_msgSend(v3, "build");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)na_identity_identity_120;
  na_identity_identity_120 = v1;

}

uint64_t __32__NAIdentityBuilder_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristics");
}

@end
