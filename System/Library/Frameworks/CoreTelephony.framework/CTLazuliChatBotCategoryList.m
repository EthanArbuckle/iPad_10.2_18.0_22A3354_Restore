@implementation CTLazuliChatBotCategoryList

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotCategoryList categoryList](self, "categoryList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", categoryList = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCategoryList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliChatBotCategoryList categoryList](self, "categoryList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotCategoryList *v4;
  CTLazuliChatBotCategoryList *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotCategoryList *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotCategoryList isEqualToCTLazuliChatBotCategoryList:](self, "isEqualToCTLazuliChatBotCategoryList:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotCategoryList *v4;

  v4 = +[CTLazuliChatBotCategoryList allocWithZone:](CTLazuliChatBotCategoryList, "allocWithZone:", a3);
  -[CTLazuliChatBotCategoryList setCategoryList:](v4, "setCategoryList:", self->_categoryList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_categoryList, CFSTR("kCategoryListKey"));
}

- (CTLazuliChatBotCategoryList)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotCategoryList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *categoryList;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotCategoryList;
  v5 = -[CTLazuliChatBotCategoryList init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCategoryListKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    categoryList = v5->_categoryList;
    v5->_categoryList = (NSArray *)v9;

  }
  return v5;
}

- (CTLazuliChatBotCategoryList)initWithReflection:(const void *)a3
{
  CTLazuliChatBotCategoryList *v4;
  NSArray *v5;
  uint64_t *v6;
  uint64_t *v7;
  id v8;
  uint64_t *v9;
  void *v10;
  NSArray *categoryList;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotCategoryList;
  v4 = -[CTLazuliChatBotCategoryList init](&v13, sel_init);
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
    categoryList = v4->_categoryList;
    v4->_categoryList = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (void)setCategoryList:(id)a3
{
  objc_storeStrong((id *)&self->_categoryList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryList, 0);
}

@end
