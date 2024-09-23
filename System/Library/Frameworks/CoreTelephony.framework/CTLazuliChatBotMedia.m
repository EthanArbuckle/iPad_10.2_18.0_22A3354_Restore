@implementation CTLazuliChatBotMedia

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotMedia mediaUrl](self, "mediaUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mediaUrl = %@"), v4);

  -[CTLazuliChatBotMedia fingerprint](self, "fingerprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fingerprint = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMedia:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  -[CTLazuliChatBotMedia mediaUrl](self, "mediaUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToCTLazuliChatBotMediaUrl:", v7))
  {
    -[CTLazuliChatBotMedia fingerprint](self, "fingerprint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v5, "fingerprint"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotMedia fingerprint](self, "fingerprint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fingerprint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToCTLazuliChatBotMediaFingerprint:", v10);

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotMedia *v4;
  CTLazuliChatBotMedia *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotMedia *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotMedia isEqualToCTLazuliChatBotMedia:](self, "isEqualToCTLazuliChatBotMedia:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotMedia *v4;

  v4 = +[CTLazuliChatBotMedia allocWithZone:](CTLazuliChatBotMedia, "allocWithZone:", a3);
  -[CTLazuliChatBotMedia setMediaUrl:](v4, "setMediaUrl:", self->_mediaUrl);
  -[CTLazuliChatBotMedia setFingerprint:](v4, "setFingerprint:", self->_fingerprint);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_mediaUrl, CFSTR("kMediaUrlKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fingerprint, CFSTR("kFingerprintKey"));

}

- (CTLazuliChatBotMedia)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotMedia *v5;
  uint64_t v6;
  CTLazuliChatBotMediaUrl *mediaUrl;
  uint64_t v8;
  CTLazuliChatBotMediaFingerprint *fingerprint;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotMedia;
  v5 = -[CTLazuliChatBotMedia init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaUrlKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaUrl = v5->_mediaUrl;
    v5->_mediaUrl = (CTLazuliChatBotMediaUrl *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFingerprintKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    fingerprint = v5->_fingerprint;
    v5->_fingerprint = (CTLazuliChatBotMediaFingerprint *)v8;

  }
  return v5;
}

- (CTLazuliChatBotMedia)initWithReflection:(const void *)a3
{
  CTLazuliChatBotMedia *v4;
  CTLazuliChatBotMediaUrl *v5;
  CTLazuliChatBotMediaUrl *mediaUrl;
  CTLazuliChatBotMediaFingerprint *v7;
  uint64_t v8;
  CTLazuliChatBotMediaFingerprint *fingerprint;
  CTLazuliChatBotMedia *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotMedia;
  v4 = -[CTLazuliChatBotMedia init](&v11, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliChatBotMediaUrl initWithReflection:]([CTLazuliChatBotMediaUrl alloc], "initWithReflection:", a3);
  mediaUrl = v4->_mediaUrl;
  v4->_mediaUrl = v5;

  if (!*((_BYTE *)a3 + 48))
  {
    fingerprint = v4->_fingerprint;
    v4->_fingerprint = 0;
    goto LABEL_6;
  }
  v7 = [CTLazuliChatBotMediaFingerprint alloc];
  if (*((_BYTE *)a3 + 48))
  {
    v8 = -[CTLazuliChatBotMediaFingerprint initWithReflection:](v7, "initWithReflection:", (char *)a3 + 24);
    fingerprint = v4->_fingerprint;
    v4->_fingerprint = (CTLazuliChatBotMediaFingerprint *)v8;
LABEL_6:

    return v4;
  }
  result = (CTLazuliChatBotMedia *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotMediaUrl)mediaUrl
{
  return self->_mediaUrl;
}

- (void)setMediaUrl:(id)a3
{
  objc_storeStrong((id *)&self->_mediaUrl, a3);
}

- (CTLazuliChatBotMediaFingerprint)fingerprint
{
  return self->_fingerprint;
}

- (void)setFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_mediaUrl, 0);
}

@end
