@implementation CTLazuliChatBotResponseForSuggestedAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotResponseForSuggestedAction displayText](self, "displayText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", displayText = %@"), v4);

  -[CTLazuliChatBotResponseForSuggestedAction postBackData](self, "postBackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", postBackData = %@"), v5);

  -[CTLazuliChatBotResponseForSuggestedAction inReplyToID](self, "inReplyToID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", inReplyToID = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotResponseForSuggestedAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[CTLazuliChatBotResponseForSuggestedAction displayText](self, "displayText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliChatBotResponseForSuggestedAction postBackData](self, "postBackData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postBackData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToCTLazuliChatBotPostbackData:", v8))
    {
      -[CTLazuliChatBotResponseForSuggestedAction inReplyToID](self, "inReplyToID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "inReplyToID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToCTLazuliMessageID:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotResponseForSuggestedAction *v4;
  CTLazuliChatBotResponseForSuggestedAction *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotResponseForSuggestedAction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotResponseForSuggestedAction isEqualToCTLazuliChatBotResponseForSuggestedAction:](self, "isEqualToCTLazuliChatBotResponseForSuggestedAction:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotResponseForSuggestedAction *v4;

  v4 = +[CTLazuliChatBotResponseForSuggestedAction allocWithZone:](CTLazuliChatBotResponseForSuggestedAction, "allocWithZone:", a3);
  -[CTLazuliChatBotResponseForSuggestedAction setDisplayText:](v4, "setDisplayText:", self->_displayText);
  -[CTLazuliChatBotResponseForSuggestedAction setPostBackData:](v4, "setPostBackData:", self->_postBackData);
  -[CTLazuliChatBotResponseForSuggestedAction setInReplyToID:](v4, "setInReplyToID:", self->_inReplyToID);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayText, CFSTR("kDisplayTextKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_postBackData, CFSTR("kPostBackDataKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inReplyToID, CFSTR("kInReplyToIDKey"));

}

- (CTLazuliChatBotResponseForSuggestedAction)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotResponseForSuggestedAction *v5;
  uint64_t v6;
  NSString *displayText;
  uint64_t v8;
  CTLazuliChatBotPostbackData *postBackData;
  uint64_t v10;
  CTLazuliMessageID *inReplyToID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotResponseForSuggestedAction;
  v5 = -[CTLazuliChatBotResponseForSuggestedAction init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDisplayTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPostBackDataKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    postBackData = v5->_postBackData;
    v5->_postBackData = (CTLazuliChatBotPostbackData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kInReplyToIDKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    inReplyToID = v5->_inReplyToID;
    v5->_inReplyToID = (CTLazuliMessageID *)v10;

  }
  return v5;
}

- (CTLazuliChatBotResponseForSuggestedAction)initWithReflection:(const void *)a3
{
  CTLazuliChatBotResponseForSuggestedAction *v4;
  const void *v5;
  uint64_t v6;
  NSString *displayText;
  CTLazuliChatBotPostbackData *v8;
  CTLazuliChatBotPostbackData *postBackData;
  CTLazuliMessageID *v10;
  CTLazuliMessageID *inReplyToID;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotResponseForSuggestedAction;
  v4 = -[CTLazuliChatBotResponseForSuggestedAction init](&v13, sel_init);
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

    v8 = -[CTLazuliChatBotPostbackData initWithReflection:]([CTLazuliChatBotPostbackData alloc], "initWithReflection:", (char *)a3 + 24);
    postBackData = v4->_postBackData;
    v4->_postBackData = v8;

    v10 = -[CTLazuliMessageID initWithReflection:]([CTLazuliMessageID alloc], "initWithReflection:", (char *)a3 + 48);
    inReplyToID = v4->_inReplyToID;
    v4->_inReplyToID = v10;

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

- (CTLazuliChatBotPostbackData)postBackData
{
  return self->_postBackData;
}

- (void)setPostBackData:(id)a3
{
  objc_storeStrong((id *)&self->_postBackData, a3);
}

- (CTLazuliMessageID)inReplyToID
{
  return self->_inReplyToID;
}

- (void)setInReplyToID:(id)a3
{
  objc_storeStrong((id *)&self->_inReplyToID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inReplyToID, 0);
  objc_storeStrong((id *)&self->_postBackData, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
