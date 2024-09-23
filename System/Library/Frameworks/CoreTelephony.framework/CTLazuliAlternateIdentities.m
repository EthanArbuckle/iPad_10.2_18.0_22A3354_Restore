@implementation CTLazuliAlternateIdentities

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliAlternateIdentities identityList](self, "identityList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", identityList = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliAlternateIdentities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliAlternateIdentities identityList](self, "identityList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliAlternateIdentities *v4;
  CTLazuliAlternateIdentities *v5;
  BOOL v6;

  v4 = (CTLazuliAlternateIdentities *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliAlternateIdentities isEqualToCTLazuliAlternateIdentities:](self, "isEqualToCTLazuliAlternateIdentities:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliAlternateIdentities *v4;

  v4 = +[CTLazuliAlternateIdentities allocWithZone:](CTLazuliAlternateIdentities, "allocWithZone:", a3);
  -[CTLazuliAlternateIdentities setIdentityList:](v4, "setIdentityList:", self->_identityList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identityList, CFSTR("kIdentityListKey"));
}

- (CTLazuliAlternateIdentities)initWithCoder:(id)a3
{
  id v4;
  CTLazuliAlternateIdentities *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *identityList;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliAlternateIdentities;
  v5 = -[CTLazuliAlternateIdentities init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kIdentityListKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    identityList = v5->_identityList;
    v5->_identityList = (NSArray *)v9;

  }
  return v5;
}

- (CTLazuliAlternateIdentities)initWithReflection:(const void *)a3
{
  CTLazuliAlternateIdentities *v4;
  NSArray *v5;
  uint64_t *v6;
  uint64_t *v7;
  id v8;
  uint64_t *v9;
  void *v10;
  NSArray *identityList;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTLazuliAlternateIdentities;
  v4 = -[CTLazuliAlternateIdentities init](&v13, sel_init);
  if (v4)
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(uint64_t **)a3;
    v7 = (uint64_t *)*((_QWORD *)a3 + 1);
    if (*(uint64_t **)a3 != v7)
    {
      do
      {
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        v9 = v6;
        if (*((char *)v6 + 23) < 0)
          v9 = (uint64_t *)*v6;
        v10 = (void *)objc_msgSend(v8, "initWithUTF8String:", v9);
        -[NSArray addObject:](v5, "addObject:", v10);

        v6 += 3;
      }
      while (v6 != v7);
    }
    identityList = v4->_identityList;
    v4->_identityList = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)identityList
{
  return self->_identityList;
}

- (void)setIdentityList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityList, 0);
}

@end
