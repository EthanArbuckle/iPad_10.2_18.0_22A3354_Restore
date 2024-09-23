@implementation CTVoicemailInfoType

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTVoicemailInfoType url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", url=%{sensitive}@"), v4);

  -[CTVoicemailInfoType count](self, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", count=%@"), v5);

  if (-[CTVoicemailInfoType isNetworkOriginated](self, "isNetworkOriginated"))
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isNetworkOriginated=%s"), v6);
  if (-[CTVoicemailInfoType isVoiceMailMWI](self, "isVoiceMailMWI"))
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isVoiceMailMWI=%s"), v7);
  if (-[CTVoicemailInfoType available](self, "available"))
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", available=%s"), v8);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTVoicemailInfoType)init
{
  CTVoicemailInfoType *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTVoicemailInfoType;
  v2 = -[CTVoicemailInfoType init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CTVoicemailInfoType setUrl:](v2, "setUrl:", v3);

    v4 = (void *)objc_opt_new();
    -[CTVoicemailInfoType setCount:](v2, "setCount:", v4);

    -[CTVoicemailInfoType setIsNetworkOriginated:](v2, "setIsNetworkOriginated:", 0);
    -[CTVoicemailInfoType setIsVoiceMailMWI:](v2, "setIsVoiceMailMWI:", 0);
    -[CTVoicemailInfoType setAvailable:](v2, "setAvailable:", 0);
  }
  return v2;
}

- (CTVoicemailInfoType)initWithParam:(id)a3 available:(BOOL)a4 count:(id)a5 isNetworkOriginated:(BOOL)a6 isVoiceMailMWI:(BOOL)a7
{
  id v12;
  id v13;
  CTVoicemailInfoType *v14;
  uint64_t v15;
  NSString *url;
  uint64_t v17;
  NSNumber *count;
  objc_super v20;

  v12 = a3;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CTVoicemailInfoType;
  v14 = -[CTVoicemailInfoType init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    url = v14->_url;
    v14->_url = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    count = v14->_count;
    v14->_count = (NSNumber *)v17;

    v14->_isNetworkOriginated = a6;
    v14->_isVoiceMailMWI = a7;
    v14->_available = a4;
  }

  return v14;
}

- (BOOL)isEqualToCTVoicemailInfoType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  _BOOL4 v17;

  v4 = a3;
  if (v4)
  {
    -[CTVoicemailInfoType url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);
    if ((v7 & 1) == 0)
    {
      -[CTVoicemailInfoType url](self, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        LOBYTE(v12) = 0;
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v4, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

        LOBYTE(v12) = 0;
LABEL_23:
        v13 = 0;
        goto LABEL_24;
      }
    }
    -[CTVoicemailInfoType count](self, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "count");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[CTVoicemailInfoType count](self, "count");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_14;
      objc_msgSend(v4, "count");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        LOBYTE(v12) = 0;
        goto LABEL_21;
      }
    }
    v14 = -[CTVoicemailInfoType isNetworkOriginated](self, "isNetworkOriginated");
    if (v14 == objc_msgSend(v4, "isNetworkOriginated"))
    {
      v15 = -[CTVoicemailInfoType isVoiceMailMWI](self, "isVoiceMailMWI");
      if (v15 == objc_msgSend(v4, "isVoiceMailMWI"))
      {
        v17 = -[CTVoicemailInfoType available](self, "available");
        v12 = v17 ^ objc_msgSend(v4, "available") ^ 1;
        if (v8 == v9)
          goto LABEL_22;
        v11 = 0;
LABEL_21:

LABEL_22:
        if ((v7 & 1) != 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        goto LABEL_23;
      }
    }
    if (v8 == v9)
    {
      LOBYTE(v12) = 0;
      goto LABEL_22;
    }
    v10 = 0;
LABEL_14:

    LOBYTE(v12) = 0;
    if ((v7 & 1) != 0)
      goto LABEL_25;
    goto LABEL_23;
  }
  LOBYTE(v12) = 0;
LABEL_26:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CTVoicemailInfoType *v4;
  BOOL v5;

  v4 = (CTVoicemailInfoType *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTVoicemailInfoType isEqualToCTVoicemailInfoType:](self, "isEqualToCTVoicemailInfoType:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CTVoicemailInfoType initWithParam:available:count:isNetworkOriginated:isVoiceMailMWI:](+[CTVoicemailInfoType allocWithZone:](CTVoicemailInfoType, "allocWithZone:", a3), "initWithParam:available:count:isNetworkOriginated:isVoiceMailMWI:", self->_url, self->_available, self->_count, self->_isNetworkOriginated, self->_isVoiceMailMWI);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_count, CFSTR("count"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNetworkOriginated, CFSTR("is_network_originated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isVoiceMailMWI, CFSTR("is_voicemail_MWI"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_available, CFSTR("available"));

}

- (CTVoicemailInfoType)initWithCoder:(id)a3
{
  id v4;
  CTVoicemailInfoType *v5;
  uint64_t v6;
  NSString *url;
  uint64_t v8;
  NSNumber *count;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTVoicemailInfoType;
  v5 = -[CTVoicemailInfoType init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("count"));
    v8 = objc_claimAutoreleasedReturnValue();
    count = v5->_count;
    v5->_count = (NSNumber *)v8;

    v5->_isNetworkOriginated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_network_originated"));
    v5->_isVoiceMailMWI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_voicemail_MWI"));
    v5->_available = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("available"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
  objc_storeStrong((id *)&self->_count, a3);
}

- (BOOL)isNetworkOriginated
{
  return self->_isNetworkOriginated;
}

- (void)setIsNetworkOriginated:(BOOL)a3
{
  self->_isNetworkOriginated = a3;
}

- (BOOL)isVoiceMailMWI
{
  return self->_isVoiceMailMWI;
}

- (void)setIsVoiceMailMWI:(BOOL)a3
{
  self->_isVoiceMailMWI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
