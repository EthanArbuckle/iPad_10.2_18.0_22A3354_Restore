@implementation CTLazuliMessageIDList

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageIDList list](self, "list");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", list = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageIDList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliMessageIDList list](self, "list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "list");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageIDList *v4;
  CTLazuliMessageIDList *v5;
  BOOL v6;

  v4 = (CTLazuliMessageIDList *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageIDList isEqualToCTLazuliMessageIDList:](self, "isEqualToCTLazuliMessageIDList:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageIDList *v4;

  v4 = +[CTLazuliMessageIDList allocWithZone:](CTLazuliMessageIDList, "allocWithZone:", a3);
  -[CTLazuliMessageIDList setList:](v4, "setList:", self->_list);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_list, CFSTR("kListKey"));
}

- (CTLazuliMessageIDList)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageIDList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *list;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliMessageIDList;
  v5 = -[CTLazuliMessageIDList init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kListKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    list = v5->_list;
    v5->_list = (NSArray *)v9;

  }
  return v5;
}

- (CTLazuliMessageIDList)initWithReflection:(const void *)a3
{
  CTLazuliMessageIDList *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  CTLazuliMessageID *v8;
  NSArray *list;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CTLazuliMessageIDList;
  v4 = -[CTLazuliMessageIDList init](&v11, sel_init);
  if (v4)
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(_QWORD *)a3;
    v7 = *((_QWORD *)a3 + 1);
    if (*(_QWORD *)a3 != v7)
    {
      do
      {
        v8 = -[CTLazuliMessageID initWithReflection:]([CTLazuliMessageID alloc], "initWithReflection:", v6);
        -[NSArray addObject:](v5, "addObject:", v8);

        v6 += 24;
      }
      while (v6 != v7);
    }
    list = v4->_list;
    v4->_list = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

@end
