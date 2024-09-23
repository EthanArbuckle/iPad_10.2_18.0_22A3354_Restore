@implementation ABCPbSigConfig

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasSubtype
{
  return self->_subtype != 0;
}

- (BOOL)hasSubtypeContext
{
  return self->_subtypeContext != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSigConfig;
  -[ABCPbSigConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSigConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *type;
  NSString *subtype;
  NSString *subtypeContext;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  type = self->_type;
  if (type)
    objc_msgSend(v4, "setObject:forKey:", type, CFSTR("type"));
  subtype = self->_subtype;
  if (subtype)
    objc_msgSend(v4, "setObject:forKey:", subtype, CFSTR("subtype"));
  subtypeContext = self->_subtypeContext;
  if (subtypeContext)
    objc_msgSend(v4, "setObject:forKey:", subtypeContext, CFSTR("subtype_context"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subtype)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subtypeContext)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    v4 = v5;
  }
  if (self->_type)
  {
    objc_msgSend(v5, "setType:");
    v4 = v5;
  }
  if (self->_subtype)
  {
    objc_msgSend(v5, "setSubtype:");
    v4 = v5;
  }
  if (self->_subtypeContext)
  {
    objc_msgSend(v5, "setSubtypeContext:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_subtype, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_subtypeContext, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *domain;
  NSString *type;
  NSString *subtype;
  NSString *subtypeContext;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((domain = self->_domain, !((unint64_t)domain | v4[1]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[4])) || -[NSString isEqual:](type, "isEqual:"))
    && ((subtype = self->_subtype, !((unint64_t)subtype | v4[2]))
     || -[NSString isEqual:](subtype, "isEqual:")))
  {
    subtypeContext = self->_subtypeContext;
    if ((unint64_t)subtypeContext | v4[3])
      v9 = -[NSString isEqual:](subtypeContext, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = -[NSString hash](self->_type, "hash") ^ v3;
  v5 = -[NSString hash](self->_subtype, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_subtypeContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[ABCPbSigConfig setDomain:](self, "setDomain:");
  if (v4[4])
    -[ABCPbSigConfig setType:](self, "setType:");
  if (v4[2])
    -[ABCPbSigConfig setSubtype:](self, "setSubtype:");
  if (v4[3])
    -[ABCPbSigConfig setSubtypeContext:](self, "setSubtypeContext:");

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_subtype, a3);
}

- (NSString)subtypeContext
{
  return self->_subtypeContext;
}

- (void)setSubtypeContext:(id)a3
{
  objc_storeStrong((id *)&self->_subtypeContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
