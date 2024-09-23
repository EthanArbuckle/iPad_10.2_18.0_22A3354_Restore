@implementation CTLazuliChatBotMenuL2

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotMenuL2 displayText](self, "displayText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", displayText = %@"), v4);

  -[CTLazuliChatBotMenuL2 list](self, "list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", list = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMenuL2:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliChatBotMenuL2 displayText](self, "displayText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliChatBotMenuL2 list](self, "list");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "list");
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
  CTLazuliChatBotMenuL2 *v4;
  CTLazuliChatBotMenuL2 *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotMenuL2 *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotMenuL2 isEqualToCTLazuliChatBotMenuL2:](self, "isEqualToCTLazuliChatBotMenuL2:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotMenuL2 *v4;

  v4 = +[CTLazuliChatBotMenuL2 allocWithZone:](CTLazuliChatBotMenuL2, "allocWithZone:", a3);
  -[CTLazuliChatBotMenuL2 setDisplayText:](v4, "setDisplayText:", self->_displayText);
  -[CTLazuliChatBotMenuL2 setList:](v4, "setList:", self->_list);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayText, CFSTR("kDisplayTextKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_list, CFSTR("kListKey"));

}

- (CTLazuliChatBotMenuL2)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotMenuL2 *v5;
  uint64_t v6;
  NSString *displayText;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *list;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotMenuL2;
  v5 = -[CTLazuliChatBotMenuL2 init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDisplayTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kListKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    list = v5->_list;
    v5->_list = (NSArray *)v11;

  }
  return v5;
}

- (CTLazuliChatBotMenuL2)initWithReflection:(const void *)a3
{
  CTLazuliChatBotMenuL2 *v4;
  const void *v5;
  uint64_t v6;
  NSString *displayText;
  NSArray *v8;
  uint64_t v9;
  uint64_t i;
  CTLazuliChatBotMenuL2Content *v11;
  NSArray *list;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotMenuL2;
  v4 = -[CTLazuliChatBotMenuL2 init](&v14, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    displayText = v4->_displayText;
    v4->_displayText = (NSString *)v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = *((_QWORD *)a3 + 3);
    for (i = *((_QWORD *)a3 + 4); v9 != i; v9 += 232)
    {
      v11 = -[CTLazuliChatBotMenuL2Content initWithReflection:]([CTLazuliChatBotMenuL2Content alloc], "initWithReflection:", v9);
      -[NSArray addObject:](v8, "addObject:", v11);

    }
    list = v4->_list;
    v4->_list = v8;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_storeStrong((id *)&self->_displayText, a3);
}

- (NSArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
