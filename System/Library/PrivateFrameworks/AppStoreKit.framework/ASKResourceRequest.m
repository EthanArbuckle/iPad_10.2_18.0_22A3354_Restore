@implementation ASKResourceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
}

- (NSObject)requestKey
{
  return self->_requestKey;
}

- (void)setRequestKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (ASKResourceRequest)init
{
  ASKResourceRequest *v2;
  void *v3;
  uint64_t v4;
  NSObject *requestKey;
  uint64_t v6;
  NSObject *cacheKey;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASKResourceRequest;
  v2 = -[ASKResourceRequest init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "makeUniqueKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copyWithZone:", 0);
    requestKey = v2->_requestKey;
    v2->_requestKey = v4;

    v6 = objc_msgSend(v3, "copyWithZone:", 0);
    cacheKey = v2->_cacheKey;
    v2->_cacheKey = v6;

  }
  return v2;
}

+ (id)makeUniqueKey
{
  unint64_t v2;
  void *v3;
  unint64_t v4;

  do
    v2 = __ldxr(&makeUniqueKey_counter);
  while (__stxr(v2 + 1, &makeUniqueKey_counter));
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = atomic_load(&makeUniqueKey_counter);
  return (id)objc_msgSend(v3, "numberWithUnsignedLong:", v4);
}

- (NSObject)cacheKey
{
  return self->_cacheKey;
}

- (unint64_t)cacheOptions
{
  return 0;
}

- (id)makeLoadOperation
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%s not overriden on %@"), "-[ASKResourceRequest makeLoadOperation]", objc_opt_class());
  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKResourceRequest cacheKey](self, "cacheKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p cacheKey = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASKResourceRequest requestKey](self, "requestKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "cacheKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASKResourceRequest cacheKey](self, "cacheKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == v8;

  }
  return v6;
}

@end
