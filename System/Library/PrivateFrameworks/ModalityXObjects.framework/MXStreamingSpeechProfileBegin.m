@implementation MXStreamingSpeechProfileBegin

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasPhoneSetVersion
{
  return self->_phoneSetVersion != 0;
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
  v8.super_class = (Class)MXStreamingSpeechProfileBegin;
  -[MXStreamingSpeechProfileBegin description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXStreamingSpeechProfileBegin dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestId;
  NSString *locale;
  NSString *phoneSetVersion;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestId = self->_requestId;
  if (requestId)
    objc_msgSend(v3, "setObject:forKey:", requestId, CFSTR("request_id"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(v4, "setObject:forKey:", locale, CFSTR("locale"));
  phoneSetVersion = self->_phoneSetVersion;
  if (phoneSetVersion)
    objc_msgSend(v4, "setObject:forKey:", phoneSetVersion, CFSTR("phone_set_version"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXStreamingSpeechProfileBeginReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_phoneSetVersion)
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
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    v4 = v5;
  }
  if (self->_locale)
  {
    objc_msgSend(v5, "setLocale:");
    v4 = v5;
  }
  if (self->_phoneSetVersion)
  {
    objc_msgSend(v5, "setPhoneSetVersion:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_phoneSetVersion, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestId;
  NSString *locale;
  NSString *phoneSetVersion;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[3]))
     || -[NSString isEqual:](requestId, "isEqual:"))
    && ((locale = self->_locale, !((unint64_t)locale | v4[1]))
     || -[NSString isEqual:](locale, "isEqual:")))
  {
    phoneSetVersion = self->_phoneSetVersion;
    if ((unint64_t)phoneSetVersion | v4[2])
      v8 = -[NSString isEqual:](phoneSetVersion, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_requestId, "hash");
  v4 = -[NSString hash](self->_locale, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_phoneSetVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[MXStreamingSpeechProfileBegin setRequestId:](self, "setRequestId:");
  if (v4[1])
    -[MXStreamingSpeechProfileBegin setLocale:](self, "setLocale:");
  if (v4[2])
    -[MXStreamingSpeechProfileBegin setPhoneSetVersion:](self, "setPhoneSetVersion:");

}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)phoneSetVersion
{
  return self->_phoneSetVersion;
}

- (void)setPhoneSetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_phoneSetVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_phoneSetVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
