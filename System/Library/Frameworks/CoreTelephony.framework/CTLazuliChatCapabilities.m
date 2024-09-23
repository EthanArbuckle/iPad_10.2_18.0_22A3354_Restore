@implementation CTLazuliChatCapabilities

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", autoAcceptChat = %d"), -[CTLazuliChatCapabilities autoAcceptChat](self, "autoAcceptChat"));
  -[CTLazuliChatCapabilities max1ToManyRecipients](self, "max1ToManyRecipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", max1ToManyRecipients = %@"), v4);

  -[CTLazuliChatCapabilities revokeTimer](self, "revokeTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", revokeTimer = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatCapabilities:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  int v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v8 = a3;
  v9 = -[CTLazuliChatCapabilities autoAcceptChat](self, "autoAcceptChat");
  if (v9 == objc_msgSend(v8, "autoAcceptChat"))
  {
    -[CTLazuliChatCapabilities max1ToManyRecipients](self, "max1ToManyRecipients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v8, "max1ToManyRecipients"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatCapabilities max1ToManyRecipients](self, "max1ToManyRecipients");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "longValue");
      objc_msgSend(v8, "max1ToManyRecipients");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != objc_msgSend(v5, "longValue"))
      {

        v10 = 0;
        if (!v11)
          goto LABEL_16;
        goto LABEL_17;
      }
      v18 = v3;
      LODWORD(v3) = 1;
    }
    else
    {
      v18 = 0;
    }
    -[CTLazuliChatCapabilities revokeTimer](self, "revokeTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend(v8, "revokeTimer"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatCapabilities revokeTimer](self, "revokeTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "longValue");
      objc_msgSend(v8, "revokeTimer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15 == objc_msgSend(v16, "longValue");

      if (v13)
      {

        if (!(_DWORD)v3)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
    else
    {
      v10 = 1;
    }

    if ((v3 & 1) == 0)
    {
LABEL_15:
      v3 = v18;
      if (!v11)
LABEL_16:

LABEL_17:
      goto LABEL_18;
    }
LABEL_14:

    goto LABEL_15;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatCapabilities *v4;
  CTLazuliChatCapabilities *v5;
  BOOL v6;

  v4 = (CTLazuliChatCapabilities *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatCapabilities isEqualToCTLazuliChatCapabilities:](self, "isEqualToCTLazuliChatCapabilities:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatCapabilities *v4;

  v4 = +[CTLazuliChatCapabilities allocWithZone:](CTLazuliChatCapabilities, "allocWithZone:", a3);
  -[CTLazuliChatCapabilities setAutoAcceptChat:](v4, "setAutoAcceptChat:", self->_autoAcceptChat);
  -[CTLazuliChatCapabilities setMax1ToManyRecipients:](v4, "setMax1ToManyRecipients:", self->_max1ToManyRecipients);
  -[CTLazuliChatCapabilities setRevokeTimer:](v4, "setRevokeTimer:", self->_revokeTimer);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_autoAcceptChat, CFSTR("kAutoAcceptChatKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_max1ToManyRecipients, CFSTR("kMax1ToManyRecipientsKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_revokeTimer, CFSTR("kRevokeTimerKey"));

}

- (CTLazuliChatCapabilities)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatCapabilities *v5;
  uint64_t v6;
  NSNumber *max1ToManyRecipients;
  uint64_t v8;
  NSNumber *revokeTimer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatCapabilities;
  v5 = -[CTLazuliChatCapabilities init](&v11, sel_init);
  if (v5)
  {
    v5->_autoAcceptChat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAutoAcceptChatKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMax1ToManyRecipientsKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    max1ToManyRecipients = v5->_max1ToManyRecipients;
    v5->_max1ToManyRecipients = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRevokeTimerKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    revokeTimer = v5->_revokeTimer;
    v5->_revokeTimer = (NSNumber *)v8;

  }
  return v5;
}

- (CTLazuliChatCapabilities)initWithReflection:(const void *)a3
{
  CTLazuliChatCapabilities *v4;
  CTLazuliChatCapabilities *v5;
  uint64_t v6;
  NSNumber *max1ToManyRecipients;
  uint64_t v8;
  NSNumber *revokeTimer;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatCapabilities;
  v4 = -[CTLazuliChatCapabilities init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_autoAcceptChat = *(_BYTE *)a3;
    if (*((_BYTE *)a3 + 16))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 1));
      v6 = objc_claimAutoreleasedReturnValue();
      max1ToManyRecipients = v5->_max1ToManyRecipients;
      v5->_max1ToManyRecipients = (NSNumber *)v6;
    }
    else
    {
      max1ToManyRecipients = v4->_max1ToManyRecipients;
      v4->_max1ToManyRecipients = 0;
    }

    if (*((_BYTE *)a3 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 3));
      v8 = objc_claimAutoreleasedReturnValue();
      revokeTimer = v5->_revokeTimer;
      v5->_revokeTimer = (NSNumber *)v8;
    }
    else
    {
      revokeTimer = v5->_revokeTimer;
      v5->_revokeTimer = 0;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)autoAcceptChat
{
  return self->_autoAcceptChat;
}

- (void)setAutoAcceptChat:(BOOL)a3
{
  self->_autoAcceptChat = a3;
}

- (NSNumber)max1ToManyRecipients
{
  return self->_max1ToManyRecipients;
}

- (void)setMax1ToManyRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_max1ToManyRecipients, a3);
}

- (NSNumber)revokeTimer
{
  return self->_revokeTimer;
}

- (void)setRevokeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_revokeTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revokeTimer, 0);
  objc_storeStrong((id *)&self->_max1ToManyRecipients, 0);
}

@end
