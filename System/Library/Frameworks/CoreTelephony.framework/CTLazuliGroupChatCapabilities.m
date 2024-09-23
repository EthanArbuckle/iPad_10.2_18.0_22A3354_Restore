@implementation CTLazuliGroupChatCapabilities

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", autoAcceptGroupChat = %d"), -[CTLazuliGroupChatCapabilities autoAcceptGroupChat](self, "autoAcceptGroupChat"));
  -[CTLazuliGroupChatCapabilities maxGroupSize](self, "maxGroupSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", maxGroupSize = %@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", supportsComposingIndicator = %d"), -[CTLazuliGroupChatCapabilities supportsComposingIndicator](self, "supportsComposingIndicator"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatCapabilities:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  _BOOL4 v13;

  v7 = a3;
  v8 = -[CTLazuliGroupChatCapabilities autoAcceptGroupChat](self, "autoAcceptGroupChat");
  if (v8 != objc_msgSend(v7, "autoAcceptGroupChat"))
  {
    LOBYTE(v9) = 0;
    goto LABEL_14;
  }
  -[CTLazuliGroupChatCapabilities maxGroupSize](self, "maxGroupSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v7, "maxGroupSize"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliGroupChatCapabilities maxGroupSize](self, "maxGroupSize");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "longValue");
    objc_msgSend(v7, "maxGroupSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != objc_msgSend(v5, "longValue"))
    {
      LOBYTE(v9) = 0;
LABEL_10:

      goto LABEL_11;
    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  v13 = -[CTLazuliGroupChatCapabilities supportsComposingIndicator](self, "supportsComposingIndicator");
  v9 = v13 ^ objc_msgSend(v7, "supportsComposingIndicator") ^ 1;
  if (v12)
    goto LABEL_10;
LABEL_11:
  if (!v10)

LABEL_14:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliGroupChatCapabilities *v4;
  CTLazuliGroupChatCapabilities *v5;
  BOOL v6;

  v4 = (CTLazuliGroupChatCapabilities *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliGroupChatCapabilities isEqualToCTLazuliGroupChatCapabilities:](self, "isEqualToCTLazuliGroupChatCapabilities:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliGroupChatCapabilities *v4;

  v4 = +[CTLazuliGroupChatCapabilities allocWithZone:](CTLazuliGroupChatCapabilities, "allocWithZone:", a3);
  -[CTLazuliGroupChatCapabilities setAutoAcceptGroupChat:](v4, "setAutoAcceptGroupChat:", self->_autoAcceptGroupChat);
  -[CTLazuliGroupChatCapabilities setMaxGroupSize:](v4, "setMaxGroupSize:", self->_maxGroupSize);
  -[CTLazuliGroupChatCapabilities setSupportsComposingIndicator:](v4, "setSupportsComposingIndicator:", self->_supportsComposingIndicator);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_autoAcceptGroupChat, CFSTR("kAutoAcceptGroupChatKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maxGroupSize, CFSTR("kMaxGroupSizeKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsComposingIndicator, CFSTR("kSupportsComposingIndicatorKey"));

}

- (CTLazuliGroupChatCapabilities)initWithCoder:(id)a3
{
  id v4;
  CTLazuliGroupChatCapabilities *v5;
  uint64_t v6;
  NSNumber *maxGroupSize;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatCapabilities;
  v5 = -[CTLazuliGroupChatCapabilities init](&v9, sel_init);
  if (v5)
  {
    v5->_autoAcceptGroupChat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAutoAcceptGroupChatKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMaxGroupSizeKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    maxGroupSize = v5->_maxGroupSize;
    v5->_maxGroupSize = (NSNumber *)v6;

    v5->_supportsComposingIndicator = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsComposingIndicatorKey"));
  }

  return v5;
}

- (CTLazuliGroupChatCapabilities)initWithReflection:(const void *)a3
{
  CTLazuliGroupChatCapabilities *v4;
  CTLazuliGroupChatCapabilities *v5;
  uint64_t v6;
  NSNumber *maxGroupSize;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatCapabilities;
  v4 = -[CTLazuliGroupChatCapabilities init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_autoAcceptGroupChat = *(_BYTE *)a3;
    if (*((_BYTE *)a3 + 16))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 1));
      v6 = objc_claimAutoreleasedReturnValue();
      maxGroupSize = v5->_maxGroupSize;
      v5->_maxGroupSize = (NSNumber *)v6;
    }
    else
    {
      maxGroupSize = v4->_maxGroupSize;
      v4->_maxGroupSize = 0;
    }

    v5->_supportsComposingIndicator = *((_BYTE *)a3 + 24);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)autoAcceptGroupChat
{
  return self->_autoAcceptGroupChat;
}

- (void)setAutoAcceptGroupChat:(BOOL)a3
{
  self->_autoAcceptGroupChat = a3;
}

- (NSNumber)maxGroupSize
{
  return self->_maxGroupSize;
}

- (void)setMaxGroupSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxGroupSize, a3);
}

- (BOOL)supportsComposingIndicator
{
  return self->_supportsComposingIndicator;
}

- (void)setSupportsComposingIndicator:(BOOL)a3
{
  self->_supportsComposingIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxGroupSize, 0);
}

@end
