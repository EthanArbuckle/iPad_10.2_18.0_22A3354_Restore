@implementation SUUIMediaSocialPhotoUpload

- (SUUIMediaSocialPhotoUpload)initWithUploadDictionary:(id)a3
{
  id v4;
  SUUIMediaSocialPhotoUpload *v5;
  void *v6;
  uint64_t v7;
  NSNumber *uniqueIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *MD5;
  void *v15;
  uint64_t v16;
  NSString *token;
  void *v18;
  uint64_t v19;
  NSString *tokenType;
  void *v21;
  uint64_t v22;
  NSString *type;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUIMediaSocialPhotoUpload;
  v5 = -[SUUIMediaSocialPhotoUpload init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("dsId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      uniqueIdentifier = v5->_uniqueIdentifier;
      v5->_uniqueIdentifier = (NSNumber *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("hasAlpha"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_hasAlpha = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("height"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_height = objc_msgSend(v10, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_length = objc_msgSend(v11, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("md5"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      MD5 = v5->_MD5;
      v5->_MD5 = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("token"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      token = v5->_token;
      v5->_token = (NSString *)v16;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("tokenType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "copy");
      tokenType = v5->_tokenType;
      v5->_tokenType = (NSString *)v19;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_msgSend(v21, "copy");
      type = v5->_type;
      v5->_type = (NSString *)v22;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("width"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_width = objc_msgSend(v24, "unsignedIntegerValue");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setHasAlpha:", self->_hasAlpha);
  objc_msgSend(v4, "setHeight:", self->_height);
  objc_msgSend(v4, "setLength:", self->_length);
  objc_msgSend(v4, "setMD5:", self->_MD5);
  objc_msgSend(v4, "setToken:", self->_token);
  objc_msgSend(v4, "setTokenType:", self->_tokenType);
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setWidth:", self->_width);
  return v4;
}

- (BOOL)hasAlpha
{
  return self->_hasAlpha;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->_hasAlpha = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSString)MD5
{
  return self->_MD5;
}

- (void)setMD5:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_MD5, 0);
}

@end
