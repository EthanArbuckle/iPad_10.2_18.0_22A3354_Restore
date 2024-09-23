@implementation NPKProtoStandalonePaymentSetupProductImageAssetURLs

- (BOOL)hasDigitalCardImageUrl
{
  return self->_digitalCardImageUrl != 0;
}

- (BOOL)hasThumbnailImageUrl
{
  return self->_thumbnailImageUrl != 0;
}

- (BOOL)hasLogoImageUrl
{
  return self->_logoImageUrl != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentSetupProductImageAssetURLs;
  -[NPKProtoStandalonePaymentSetupProductImageAssetURLs description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupProductImageAssetURLs dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *digitalCardImageUrl;
  NSString *thumbnailImageUrl;
  NSString *logoImageUrl;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  digitalCardImageUrl = self->_digitalCardImageUrl;
  if (digitalCardImageUrl)
    objc_msgSend(v3, "setObject:forKey:", digitalCardImageUrl, CFSTR("digitalCardImageUrl"));
  thumbnailImageUrl = self->_thumbnailImageUrl;
  if (thumbnailImageUrl)
    objc_msgSend(v4, "setObject:forKey:", thumbnailImageUrl, CFSTR("thumbnailImageUrl"));
  logoImageUrl = self->_logoImageUrl;
  if (logoImageUrl)
    objc_msgSend(v4, "setObject:forKey:", logoImageUrl, CFSTR("logoImageUrl"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentSetupProductImageAssetURLsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_digitalCardImageUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_thumbnailImageUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_logoImageUrl)
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
  if (self->_digitalCardImageUrl)
  {
    objc_msgSend(v4, "setDigitalCardImageUrl:");
    v4 = v5;
  }
  if (self->_thumbnailImageUrl)
  {
    objc_msgSend(v5, "setThumbnailImageUrl:");
    v4 = v5;
  }
  if (self->_logoImageUrl)
  {
    objc_msgSend(v5, "setLogoImageUrl:");
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
  v6 = -[NSString copyWithZone:](self->_digitalCardImageUrl, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_thumbnailImageUrl, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_logoImageUrl, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *digitalCardImageUrl;
  NSString *thumbnailImageUrl;
  NSString *logoImageUrl;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((digitalCardImageUrl = self->_digitalCardImageUrl, !((unint64_t)digitalCardImageUrl | v4[1]))
     || -[NSString isEqual:](digitalCardImageUrl, "isEqual:"))
    && ((thumbnailImageUrl = self->_thumbnailImageUrl, !((unint64_t)thumbnailImageUrl | v4[3]))
     || -[NSString isEqual:](thumbnailImageUrl, "isEqual:")))
  {
    logoImageUrl = self->_logoImageUrl;
    if ((unint64_t)logoImageUrl | v4[2])
      v8 = -[NSString isEqual:](logoImageUrl, "isEqual:");
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

  v3 = -[NSString hash](self->_digitalCardImageUrl, "hash");
  v4 = -[NSString hash](self->_thumbnailImageUrl, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_logoImageUrl, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setDigitalCardImageUrl:](self, "setDigitalCardImageUrl:");
  if (v4[3])
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setThumbnailImageUrl:](self, "setThumbnailImageUrl:");
  if (v4[2])
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setLogoImageUrl:](self, "setLogoImageUrl:");

}

- (NSString)digitalCardImageUrl
{
  return self->_digitalCardImageUrl;
}

- (void)setDigitalCardImageUrl:(id)a3
{
  objc_storeStrong((id *)&self->_digitalCardImageUrl, a3);
}

- (NSString)thumbnailImageUrl
{
  return self->_thumbnailImageUrl;
}

- (void)setThumbnailImageUrl:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageUrl, a3);
}

- (NSString)logoImageUrl
{
  return self->_logoImageUrl;
}

- (void)setLogoImageUrl:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageUrl, 0);
  objc_storeStrong((id *)&self->_logoImageUrl, 0);
  objc_storeStrong((id *)&self->_digitalCardImageUrl, 0);
}

@end
