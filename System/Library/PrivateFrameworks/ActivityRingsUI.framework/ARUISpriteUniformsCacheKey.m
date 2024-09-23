@implementation ARUISpriteUniformsCacheKey

- (unint64_t)hash
{
  return self->_hashValue;
}

+ (id)keyForSprite:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  ARUISpriteUniformsCacheKey *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ARUISpriteUniformsCacheKey initWithSprite:context:]([ARUISpriteUniformsCacheKey alloc], "initWithSprite:context:", v6, v5);

  return v7;
}

- (ARUISpriteUniformsCacheKey)initWithSprite:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  ARUISpriteUniformsCacheKey *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUISpriteUniformsCacheKey;
  v8 = -[ARUISpriteUniformsCacheKey init](&v11, sel_init);
  if (v8)
  {
    +[ARUIHashBuilder builder](ARUIHashBuilder, "builder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendObject:", v6);
    objc_msgSend(v9, "appendObject:", v7);
    v8->_hashValue = objc_msgSend(v9, "hash");

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ARUISpriteUniformsCacheKey hashValue](self, "hashValue");
    v7 = objc_msgSend(v5, "hashValue");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

@end
