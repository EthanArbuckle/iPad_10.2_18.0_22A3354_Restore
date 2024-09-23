@implementation CTLazuliMessageComposingIndicator

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageComposingIndicator refreshTime](self, "refreshTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", refreshTime = %@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", active = %d"), -[CTLazuliMessageComposingIndicator active](self, "active"));
  -[CTLazuliMessageComposingIndicator lastActive](self, "lastActive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", lastActive = %@"), v5);

  -[CTLazuliMessageComposingIndicator contentType](self, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", contentType = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageComposingIndicator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  int v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;

  v7 = a3;
  -[CTLazuliMessageComposingIndicator refreshTime](self, "refreshTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "refreshTime"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliMessageComposingIndicator refreshTime](self, "refreshTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "longValue");
    objc_msgSend(v7, "refreshTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 != objc_msgSend(v4, "longValue"))
    {

      v10 = 0;
      goto LABEL_10;
    }
    v24 = 1;
  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  v11 = -[CTLazuliMessageComposingIndicator active](self, "active");
  if (v11 != objc_msgSend(v7, "active"))
  {
    v10 = 0;
    if ((v24 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  -[CTLazuliMessageComposingIndicator lastActive](self, "lastActive");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v7, "lastActive");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v20 = 0;
      v21 = 0;
      goto LABEL_19;
    }
  }
  -[CTLazuliMessageComposingIndicator lastActive](self, "lastActive");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastActive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", v5))
  {
    v21 = 1;
LABEL_19:
    -[CTLazuliMessageComposingIndicator contentType](self, "contentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v7, "contentType"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageComposingIndicator contentType](self, "contentType", v18, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v14)
      {

        goto LABEL_26;
      }
      v17 = v19;
    }
    else
    {
      v17 = 0;
      v10 = 1;
    }

LABEL_26:
    if ((v21 & 1) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
  v10 = 0;
LABEL_27:

LABEL_28:
  if (!v13)

  if (v24)
  {
LABEL_9:

  }
LABEL_10:
  if (!v8)

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageComposingIndicator *v4;
  CTLazuliMessageComposingIndicator *v5;
  BOOL v6;

  v4 = (CTLazuliMessageComposingIndicator *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageComposingIndicator isEqualToCTLazuliMessageComposingIndicator:](self, "isEqualToCTLazuliMessageComposingIndicator:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageComposingIndicator *v4;

  v4 = +[CTLazuliMessageComposingIndicator allocWithZone:](CTLazuliMessageComposingIndicator, "allocWithZone:", a3);
  -[CTLazuliMessageComposingIndicator setRefreshTime:](v4, "setRefreshTime:", self->_refreshTime);
  -[CTLazuliMessageComposingIndicator setActive:](v4, "setActive:", self->_active);
  -[CTLazuliMessageComposingIndicator setLastActive:](v4, "setLastActive:", self->_lastActive);
  -[CTLazuliMessageComposingIndicator setContentType:](v4, "setContentType:", self->_contentType);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_refreshTime, CFSTR("kRefreshTimeKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_active, CFSTR("kActiveKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastActive, CFSTR("kLastActiveKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentType, CFSTR("kContentTypeKey"));

}

- (CTLazuliMessageComposingIndicator)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageComposingIndicator *v5;
  uint64_t v6;
  NSNumber *refreshTime;
  uint64_t v8;
  NSString *lastActive;
  uint64_t v10;
  NSString *contentType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageComposingIndicator;
  v5 = -[CTLazuliMessageComposingIndicator init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRefreshTimeKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    refreshTime = v5->_refreshTime;
    v5->_refreshTime = (NSNumber *)v6;

    v5->_active = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kActiveKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLastActiveKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastActive = v5->_lastActive;
    v5->_lastActive = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContentTypeKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v10;

  }
  return v5;
}

- (CTLazuliMessageComposingIndicator)initWithReflection:(const void *)a3
{
  CTLazuliMessageComposingIndicator *v4;
  CTLazuliMessageComposingIndicator *v5;
  uint64_t v6;
  NSNumber *refreshTime;
  char *v8;
  uint64_t v9;
  NSString *lastActive;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  NSString *contentType;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CTLazuliMessageComposingIndicator;
  v4 = -[CTLazuliMessageComposingIndicator init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    if (*((_BYTE *)a3 + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)a3);
      v6 = objc_claimAutoreleasedReturnValue();
      refreshTime = v5->_refreshTime;
      v5->_refreshTime = (NSNumber *)v6;
    }
    else
    {
      refreshTime = v4->_refreshTime;
      v4->_refreshTime = 0;
    }

    v5->_active = *((_BYTE *)a3 + 16);
    if (*((_BYTE *)a3 + 48))
    {
      if (*((char *)a3 + 47) >= 0)
        v8 = (char *)a3 + 24;
      else
        v8 = (char *)*((_QWORD *)a3 + 3);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      lastActive = v5->_lastActive;
      v5->_lastActive = (NSString *)v9;
    }
    else
    {
      lastActive = v5->_lastActive;
      v5->_lastActive = 0;
    }

    if (*((_BYTE *)a3 + 80))
    {
      v13 = (char *)*((_QWORD *)a3 + 7);
      v12 = (char *)a3 + 56;
      v11 = v13;
      if (v12[23] >= 0)
        v14 = v12;
      else
        v14 = v11;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      contentType = v5->_contentType;
      v5->_contentType = (NSString *)v15;
    }
    else
    {
      contentType = v5->_contentType;
      v5->_contentType = 0;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)refreshTime
{
  return self->_refreshTime;
}

- (void)setRefreshTime:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTime, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSString)lastActive
{
  return self->_lastActive;
}

- (void)setLastActive:(id)a3
{
  objc_storeStrong((id *)&self->_lastActive, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_lastActive, 0);
  objc_storeStrong((id *)&self->_refreshTime, 0);
}

@end
