@implementation CNEither

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pair, 0);
}

- (BOOL)isLeft
{
  void *v2;
  BOOL v3;

  -[CNEither left](self, "left");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isRight
{
  void *v2;
  BOOL v3;

  -[CNEither right](self, "right");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)left
{
  void *v2;
  void *v3;

  -[CNEither pair](self, "pair");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)right
{
  void *v2;
  void *v3;

  -[CNEither pair](self, "pair");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNPair)pair
{
  return self->_pair;
}

+ (CNEither)eitherWithLeft:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_64);
    v5 = CNGuardOSLog_cn_once_object_0_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
      +[CNEither eitherWithLeft:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  objc_msgSend(a1, "eitherWithLeft:right:", v4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNEither *)v13;
}

+ (CNEither)eitherWithBool:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v5;
  CNEither *v6;
  uint64_t v7;
  CNEither *v8;

  v4 = a3;
  v5 = a4;
  v6 = [CNEither alloc];
  if (v4)
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = 0;
  v8 = -[CNEither initWithLeft:right:](v6, "initWithLeft:right:", v7, v5);

  return v8;
}

+ (CNEither)eitherWithLeft:(id)a3 right:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeft:right:", v7, v6);

  return (CNEither *)v8;
}

- (CNEither)initWithLeft:(id)a3 right:(id)a4
{
  id v6;
  id v7;
  CNEither *v8;
  uint64_t v9;
  CNPair *pair;
  CNEither *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNEither;
  v8 = -[CNEither init](&v13, sel_init);
  if (v8)
  {
    +[CNPair pairWithFirst:second:](CNPair, "pairWithFirst:second:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    pair = v8->_pair;
    v8->_pair = (CNPair *)v9;

    v11 = v8;
  }

  return v8;
}

+ (CNEither)eitherWithRight:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_64);
    v5 = CNGuardOSLog_cn_once_object_0_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
      +[CNEither eitherWithRight:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  objc_msgSend(a1, "eitherWithLeft:right:", 0, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNEither *)v13;
}

+ (CNEither)eitherWithBlock:(id)a3
{
  void (**v3)(id, id *);
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = (void (**)(id, id *))a3;
  v4 = (void *)MEMORY[0x194004260]();
  v9 = 0;
  v3[2](v3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  +[CNEither eitherWithLeft:right:](CNEither, "eitherWithLeft:right:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return (CNEither *)v7;
}

+ (id)firstLeftInLazyChain:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_64);
    v4 = CNGuardOSLog_cn_once_object_0_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
      +[CNEither firstLeftInLazyChain:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("no either blocks passed to firstLeftInLazyChain"), 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v3;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v22;
LABEL_9:
    v17 = 0;
    v18 = v15;
    while (1)
    {
      if (*(_QWORD *)v22 != v16)
        objc_enumerationMutation(v12);
      (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17) + 16))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (((*((uint64_t (**)(uint64_t, void *))CNEitherIsLeft + 2))((uint64_t)CNEitherIsLeft, v15) & 1) != 0)
        break;
      ++v17;
      v18 = v15;
      if (v14 == v17)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          goto LABEL_9;
        break;
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
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
  -[CNEither left](self, "left");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("left"), v4);

  -[CNEither right](self, "right");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("right"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  v6[2] = __16__CNEither_hash__block_invoke;
  v6[3] = &unk_1E29B9B10;
  v6[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __16__CNEither_hash__block_invoke_2;
  aBlock[3] = &unk_1E29B9B10;
  v2 = _Block_copy(aBlock);
  v3 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v6, v2, 0);

  return v3;
}

unint64_t __16__CNEither_hash__block_invoke(uint64_t a1)
{
  void *v1;
  unint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "left");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", v1);

  return v2;
}

unint64_t __16__CNEither_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  unint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "right");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", v1);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  CNEither *v4;
  CNPair *pair;
  BOOL v6;

  v4 = (CNEither *)a3;
  v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (pair = self->_pair, (unint64_t)pair | (unint64_t)v4->_pair)
      && !-[CNPair isEqual:](pair, "isEqual:"))
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNEither)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNEither *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("left"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("right"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNEither initWithLeft:right:](self, "initWithLeft:right:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNEither left](self, "left");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("left"));

  -[CNEither right](self, "right");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("right"));

}

- (void)setPair:(id)a3
{
  objc_storeStrong((id *)&self->_pair, a3);
}

+ (void)eitherWithLeft:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, a1, a3, "parameter ‘left’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

+ (void)eitherWithRight:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, a1, a3, "parameter ‘right’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

+ (void)firstLeftInLazyChain:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, a1, a3, "parameter ‘eitherBlocks’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

@end
