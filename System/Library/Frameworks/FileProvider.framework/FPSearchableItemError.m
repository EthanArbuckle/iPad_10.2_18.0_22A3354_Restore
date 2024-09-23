@implementation FPSearchableItemError

+ (id)stringFromError:(id)a3
{
  id v3;
  FPSearchableItemError *v4;
  void *v5;
  int v6;
  FPSearchableItemError *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(FPSearchableItemError);
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("NSFileProviderErrorDomain"));

    if (v6)
    {
      v7 = v4;
      v8 = 1;
    }
    else
    {
      objc_msgSend(v3, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

      v7 = v4;
      if (!v11)
      {
        -[FPSearchableItemError setDomain:](v4, "setDomain:", 0);
        objc_msgSend(v3, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPSearchableItemError setCustomDomain:](v4, "setCustomDomain:", v12);

        goto LABEL_9;
      }
      v8 = 2;
    }
    -[FPSearchableItemError setDomain:](v7, "setDomain:", v8);
LABEL_9:
    -[FPSearchableItemError setCode:](v4, "setCode:", objc_msgSend(v3, "code"));
    -[FPSearchableItemError data](v4, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

+ (id)errorFromString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  FPSearchableItemError *v6;
  void *v7;
  id *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  v6 = -[FPSearchableItemError initWithData:]([FPSearchableItemError alloc], "initWithData:", v5);
  -[FPSearchableItemError customDomain](v6, "customDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FPSearchableItemError domain](v6, "domain") == 1)
  {
    v8 = (id *)&NSFileProviderErrorDomain;
  }
  else
  {
    if (-[FPSearchableItemError domain](v6, "domain") != 2)
      goto LABEL_6;
    v8 = (id *)MEMORY[0x1E0CB28A8];
  }
  v9 = *v8;

  v7 = v9;
LABEL_6:
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -[FPSearchableItemError code](v6, "code");
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v7, v11, MEMORY[0x1E0C9AA70]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)domainAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E4450068 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDomain:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Custom")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FileProvider")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cocoa")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCustomDomain
{
  return self->_customDomain != 0;
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
  v8.super_class = (Class)FPSearchableItemError;
  -[FPSearchableItemError description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSearchableItemError dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t domain;
  void *v5;
  void *v6;
  NSString *customDomain;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  domain = self->_domain;
  if (domain >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_domain);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *(&off_1E4450068 + domain);
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("domain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_code);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("code"));

  customDomain = self->_customDomain;
  if (customDomain)
    objc_msgSend(v3, "setObject:forKey:", customDomain, CFSTR("customDomain"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FPSearchableItemErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteSint64Field();
  if (self->_customDomain)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  NSString *customDomain;

  *((_DWORD *)a3 + 6) = self->_domain;
  *((_QWORD *)a3 + 1) = self->_code;
  customDomain = self->_customDomain;
  if (customDomain)
    objc_msgSend(a3, "setCustomDomain:", customDomain);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_domain;
  *(_QWORD *)(v5 + 8) = self->_code;
  v6 = -[NSString copyWithZone:](self->_customDomain, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *customDomain;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_domain == *((_DWORD *)v4 + 6)
    && self->_code == v4[1])
  {
    customDomain = self->_customDomain;
    if ((unint64_t)customDomain | v4[2])
      v6 = -[NSString isEqual:](customDomain, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = (2654435761 * self->_code) ^ (2654435761 * self->_domain);
  return v2 ^ -[NSString hash](self->_customDomain, "hash");
}

- (void)mergeFrom:(id)a3
{
  self->_domain = *((_DWORD *)a3 + 6);
  self->_code = *((_QWORD *)a3 + 1);
  if (*((_QWORD *)a3 + 2))
    -[FPSearchableItemError setCustomDomain:](self, "setCustomDomain:");
}

- (int)domain
{
  return self->_domain;
}

- (void)setDomain:(int)a3
{
  self->_domain = a3;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (NSString)customDomain
{
  return self->_customDomain;
}

- (void)setCustomDomain:(id)a3
{
  objc_storeStrong((id *)&self->_customDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDomain, 0);
}

@end
