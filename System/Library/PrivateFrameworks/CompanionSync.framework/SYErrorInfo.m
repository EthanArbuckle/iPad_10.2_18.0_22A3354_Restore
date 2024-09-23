@implementation SYErrorInfo

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYErrorInfo;
  -[SYErrorInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYErrorInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  void *v6;
  NSData *userInfo;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_code);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("code"));

  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v4, "setObject:forKey:", userInfo, CFSTR("userInfo"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYErrorInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_domain)
    -[SYErrorInfo writeTo:].cold.1();
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_userInfo)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _DWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "setDomain:", self->_domain);
  v4 = v5;
  v5[2] = self->_code;
  if (self->_userInfo)
  {
    objc_msgSend(v5, "setUserInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_code;
  v8 = -[NSData copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *domain;
  NSData *userInfo;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && self->_code == *((_DWORD *)v4 + 2))
  {
    userInfo = self->_userInfo;
    if ((unint64_t)userInfo | v4[3])
      v7 = -[NSData isEqual:](userInfo, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = 2654435761 * self->_code;
  return v4 ^ v3 ^ -[NSData hash](self->_userInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[SYErrorInfo setDomain:](self, "setDomain:");
    v4 = v5;
  }
  self->_code = v4[2];
  if (*((_QWORD *)v4 + 3))
  {
    -[SYErrorInfo setUserInfo:](self, "setUserInfo:");
    v4 = v5;
  }

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (int)code
{
  return self->_code;
}

- (void)setCode:(int)a3
{
  self->_code = a3;
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

+ (void)initialize
{
  objc_method *InstanceMethod;
  objc_method *v4;
  BOOL v5;

  if ((id)objc_opt_class() == a1)
  {
    InstanceMethod = class_getInstanceMethod((Class)a1, sel_description);
    v4 = class_getInstanceMethod((Class)a1, sel__usefulDescription);
    if (InstanceMethod)
      v5 = v4 == 0;
    else
      v5 = 1;
    if (!v5)
      method_exchangeImplementations(InstanceMethod, v4);
  }
}

- (SYErrorInfo)initWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SYErrorInfo *v10;
  objc_super v12;

  v4 = a3;
  if (v4
    && (v12.receiver = self,
        v12.super_class = (Class)SYErrorInfo,
        (self = -[SYErrorInfo init](&v12, sel_init)) != 0))
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYErrorInfo setDomain:](self, "setDomain:", v5);

    -[SYErrorInfo setCode:](self, "setCode:", objc_msgSend(v4, "code"));
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYErrorInfo setUserInfo:](self, "setUserInfo:", v9);

    }
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_usefulDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)SYErrorInfo;
  -[SYErrorInfo description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYErrorInfo domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SYErrorInfo code](self, "code");
  -[SYErrorInfo userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD1620];
    -[SYErrorInfo userInfo](self, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sy_unarchivedObjectFromData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: domain=%@, code=%ld, userInfo=%@"), v4, v5, v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: domain=%@, code=%ld, userInfo=%@"), v4, v5, v6, CFSTR("(nil)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYErrorInfo writeTo:]", "SYErrorInfo.m", 94, "nil != self->_domain");
}

@end
