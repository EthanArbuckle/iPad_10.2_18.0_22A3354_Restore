@implementation CTLazuliUserIdentities

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliUserIdentities impi](self, "impi");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", impi = %@"), v4);

  -[CTLazuliUserIdentities impus](self, "impus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", impus = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliUserIdentities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliUserIdentities impi](self, "impi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "impi");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliUserIdentities impus](self, "impus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "impus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToArray:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliUserIdentities *v4;
  CTLazuliUserIdentities *v5;
  BOOL v6;

  v4 = (CTLazuliUserIdentities *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliUserIdentities isEqualToCTLazuliUserIdentities:](self, "isEqualToCTLazuliUserIdentities:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliUserIdentities *v4;

  v4 = +[CTLazuliUserIdentities allocWithZone:](CTLazuliUserIdentities, "allocWithZone:", a3);
  -[CTLazuliUserIdentities setImpi:](v4, "setImpi:", self->_impi);
  -[CTLazuliUserIdentities setImpus:](v4, "setImpus:", self->_impus);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_impi, CFSTR("kImpiKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_impus, CFSTR("kImpusKey"));

}

- (CTLazuliUserIdentities)initWithCoder:(id)a3
{
  id v4;
  CTLazuliUserIdentities *v5;
  uint64_t v6;
  NSString *impi;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *impus;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliUserIdentities;
  v5 = -[CTLazuliUserIdentities init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kImpiKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    impi = v5->_impi;
    v5->_impi = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kImpusKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    impus = v5->_impus;
    v5->_impus = (NSArray *)v11;

  }
  return v5;
}

- (CTLazuliUserIdentities)initWithReflection:(const void *)a3
{
  CTLazuliUserIdentities *v4;
  const void *v5;
  uint64_t v6;
  NSString *impi;
  NSArray *v8;
  uint64_t *v9;
  uint64_t *v10;
  id v11;
  uint64_t *v12;
  void *v13;
  NSArray *impus;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CTLazuliUserIdentities;
  v4 = -[CTLazuliUserIdentities init](&v16, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    impi = v4->_impi;
    v4->_impi = (NSString *)v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = (uint64_t *)*((_QWORD *)a3 + 3);
    v10 = (uint64_t *)*((_QWORD *)a3 + 4);
    while (v9 != v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = v9;
      if (*((char *)v9 + 23) < 0)
        v12 = (uint64_t *)*v9;
      v13 = (void *)objc_msgSend(v11, "initWithUTF8String:", v12);
      -[NSArray addObject:](v8, "addObject:", v13);

      v9 += 3;
    }
    impus = v4->_impus;
    v4->_impus = v8;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)impi
{
  return self->_impi;
}

- (void)setImpi:(id)a3
{
  objc_storeStrong((id *)&self->_impi, a3);
}

- (NSArray)impus
{
  return self->_impus;
}

- (void)setImpus:(id)a3
{
  objc_storeStrong((id *)&self->_impus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impus, 0);
  objc_storeStrong((id *)&self->_impi, 0);
}

@end
