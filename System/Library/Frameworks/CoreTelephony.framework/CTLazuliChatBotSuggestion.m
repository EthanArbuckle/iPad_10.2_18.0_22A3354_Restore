@implementation CTLazuliChatBotSuggestion

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotSuggestion displayText](self, "displayText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", displayText = %@"), v4);

  -[CTLazuliChatBotSuggestion postback](self, "postback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", postback = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSuggestion:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  -[CTLazuliChatBotSuggestion displayText](self, "displayText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    -[CTLazuliChatBotSuggestion postback](self, "postback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v5, "postback"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotSuggestion postback](self, "postback");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postback");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToCTLazuliChatBotPostbackData:", v10);

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotSuggestion *v4;
  CTLazuliChatBotSuggestion *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotSuggestion isEqualToCTLazuliChatBotSuggestion:](self, "isEqualToCTLazuliChatBotSuggestion:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotSuggestion *v4;

  v4 = +[CTLazuliChatBotSuggestion allocWithZone:](CTLazuliChatBotSuggestion, "allocWithZone:", a3);
  -[CTLazuliChatBotSuggestion setDisplayText:](v4, "setDisplayText:", self->_displayText);
  -[CTLazuliChatBotSuggestion setPostback:](v4, "setPostback:", self->_postback);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayText, CFSTR("kDisplayTextKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_postback, CFSTR("kPostbackKey"));

}

- (CTLazuliChatBotSuggestion)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotSuggestion *v5;
  uint64_t v6;
  NSString *displayText;
  uint64_t v8;
  CTLazuliChatBotPostbackData *postback;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotSuggestion;
  v5 = -[CTLazuliChatBotSuggestion init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDisplayTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPostbackKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    postback = v5->_postback;
    v5->_postback = (CTLazuliChatBotPostbackData *)v8;

  }
  return v5;
}

- (CTLazuliChatBotSuggestion)initWithReflection:(const void *)a3
{
  CTLazuliChatBotSuggestion *v4;
  const void *v5;
  uint64_t v6;
  NSString *displayText;
  CTLazuliChatBotPostbackData *v8;
  uint64_t v9;
  CTLazuliChatBotPostbackData *postback;
  CTLazuliChatBotSuggestion *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotSuggestion;
  v4 = -[CTLazuliChatBotSuggestion init](&v12, sel_init);
  if (!v4)
    return v4;
  if (*((char *)a3 + 23) >= 0)
    v5 = a3;
  else
    v5 = *(const void **)a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  displayText = v4->_displayText;
  v4->_displayText = (NSString *)v6;

  if (!*((_BYTE *)a3 + 48))
  {
    postback = v4->_postback;
    v4->_postback = 0;
    goto LABEL_9;
  }
  v8 = [CTLazuliChatBotPostbackData alloc];
  if (*((_BYTE *)a3 + 48))
  {
    v9 = -[CTLazuliChatBotPostbackData initWithReflection:](v8, "initWithReflection:", (char *)a3 + 24);
    postback = v4->_postback;
    v4->_postback = (CTLazuliChatBotPostbackData *)v9;
LABEL_9:

    return v4;
  }
  result = (CTLazuliChatBotSuggestion *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
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

- (CTLazuliChatBotPostbackData)postback
{
  return self->_postback;
}

- (void)setPostback:(id)a3
{
  objc_storeStrong((id *)&self->_postback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postback, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
