@implementation SHShazamKey

- (SHShazamKey)initWithKey:(id)a3
{
  id v5;
  SHShazamKey *v6;
  id *p_isa;
  SHShazamKey *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHShazamKey;
  v6 = -[SHShazamKey init](&v10, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    if (!-[SHShazamKey isShazamKeyValid:](v6, "isShazamKeyValid:", v5))
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong(p_isa + 1, a3);
  }
  v8 = p_isa;
LABEL_6:

  return v8;
}

- (BOOL)isShazamKeyValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "unsignedIntegerValue") != -1;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHShazamKey *v5;
  void *v6;
  void *v7;
  SHShazamKey *v8;

  v5 = +[SHShazamKey allocWithZone:](SHShazamKey, "allocWithZone:");
  -[SHShazamKey validatedKey](self, "validatedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[SHShazamKey initWithKey:](v5, "initWithKey:", v7);

  return v8;
}

- (NSString)validatedKey
{
  return self->_validatedKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedKey, 0);
}

@end
