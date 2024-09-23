@implementation CTLazuliChatBotGenericCssTemplateInfo

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotGenericCssTemplateInfo cssUrl](self, "cssUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cssUrl = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotGenericCssTemplateInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliChatBotGenericCssTemplateInfo cssUrl](self, "cssUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cssUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotGenericCssTemplateInfo *v4;
  CTLazuliChatBotGenericCssTemplateInfo *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotGenericCssTemplateInfo *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotGenericCssTemplateInfo isEqualToCTLazuliChatBotGenericCssTemplateInfo:](self, "isEqualToCTLazuliChatBotGenericCssTemplateInfo:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotGenericCssTemplateInfo *v4;

  v4 = +[CTLazuliChatBotGenericCssTemplateInfo allocWithZone:](CTLazuliChatBotGenericCssTemplateInfo, "allocWithZone:", a3);
  -[CTLazuliChatBotGenericCssTemplateInfo setCssUrl:](v4, "setCssUrl:", self->_cssUrl);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_cssUrl, CFSTR("kCssUrlKey"));
}

- (CTLazuliChatBotGenericCssTemplateInfo)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotGenericCssTemplateInfo *v5;
  uint64_t v6;
  NSString *cssUrl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotGenericCssTemplateInfo;
  v5 = -[CTLazuliChatBotGenericCssTemplateInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCssUrlKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    cssUrl = v5->_cssUrl;
    v5->_cssUrl = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliChatBotGenericCssTemplateInfo)initWithReflection:(const void *)a3
{
  CTLazuliChatBotGenericCssTemplateInfo *v4;
  const void *v5;
  uint64_t v6;
  NSString *cssUrl;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotGenericCssTemplateInfo;
  v4 = -[CTLazuliChatBotGenericCssTemplateInfo init](&v9, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    cssUrl = v4->_cssUrl;
    v4->_cssUrl = (NSString *)v6;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)cssUrl
{
  return self->_cssUrl;
}

- (void)setCssUrl:(id)a3
{
  objc_storeStrong((id *)&self->_cssUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cssUrl, 0);
}

@end
