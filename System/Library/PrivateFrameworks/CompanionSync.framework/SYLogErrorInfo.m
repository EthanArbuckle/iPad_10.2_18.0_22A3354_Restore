@implementation SYLogErrorInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYLogErrorInfo;
  -[SYLogErrorInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLogErrorInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_code);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("code"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogErrorInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_domain)
    -[SYLogErrorInfo writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  NSString *domain;
  _QWORD *v5;

  domain = self->_domain;
  v5 = a3;
  objc_msgSend(v5, "setDomain:", domain);
  v5[1] = self->_code;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_code;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *domain;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && self->_code == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_code) ^ -[NSString hash](self->_domain, "hash");
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[SYLogErrorInfo setDomain:](self, "setDomain:");
    v4 = v5;
  }
  self->_code = v4[1];

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

- (SYLogErrorInfo)initWithCocoaError:(id)a3
{
  id v4;
  void *v5;
  SYLogErrorInfo *v6;
  objc_super v8;

  v4 = a3;
  if (v4
    && (v8.receiver = self,
        v8.super_class = (Class)SYLogErrorInfo,
        (self = -[SYLogErrorInfo init](&v8, sel_init)) != 0))
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYLogErrorInfo setDomain:](self, "setDomain:", v5);

    -[SYLogErrorInfo setCode:](self, "setCode:", objc_msgSend(v4, "code"));
    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSError)cocoaError
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD1540]);
  -[SYLogErrorInfo domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, -[SYLogErrorInfo code](self, "code"), 0);

  return (NSError *)v5;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYLogErrorInfo writeTo:]", "SYLogErrorInfo.m", 79, "nil != self->_domain");
}

@end
