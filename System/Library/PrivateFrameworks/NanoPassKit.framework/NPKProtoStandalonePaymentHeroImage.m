@implementation NPKProtoStandalonePaymentHeroImage

- (BOOL)hasImageHash
{
  return self->_imageHash != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (BOOL)hasImageURL
{
  return self->_imageURL != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentHeroImage;
  -[NPKProtoStandalonePaymentHeroImage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentHeroImage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *imageHash;
  NSData *imageData;
  NSString *imageURL;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  imageHash = self->_imageHash;
  if (imageHash)
    objc_msgSend(v4, "setObject:forKey:", imageHash, CFSTR("imageHash"));
  imageData = self->_imageData;
  if (imageData)
    objc_msgSend(v4, "setObject:forKey:", imageData, CFSTR("imageData"));
  imageURL = self->_imageURL;
  if (imageURL)
    objc_msgSend(v4, "setObject:forKey:", imageURL, CFSTR("imageURL"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentHeroImageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_identifier)
    -[NPKProtoStandalonePaymentHeroImage writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_imageHash)
    PBDataWriterWriteStringField();
  if (self->_imageData)
    PBDataWriterWriteDataField();
  v5 = v6;
  if (self->_imageURL)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setIdentifier:", self->_identifier);
  if (self->_imageHash)
    objc_msgSend(v5, "setImageHash:");
  if (self->_imageData)
    objc_msgSend(v5, "setImageData:");
  v4 = v5;
  if (self->_imageURL)
  {
    objc_msgSend(v5, "setImageURL:");
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
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_imageHash, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_imageURL, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *imageHash;
  NSData *imageData;
  NSString *imageURL;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((imageHash = self->_imageHash, !((unint64_t)imageHash | v4[3]))
     || -[NSString isEqual:](imageHash, "isEqual:"))
    && ((imageData = self->_imageData, !((unint64_t)imageData | v4[2]))
     || -[NSData isEqual:](imageData, "isEqual:")))
  {
    imageURL = self->_imageURL;
    if ((unint64_t)imageURL | v4[4])
      v9 = -[NSString isEqual:](imageURL, "isEqual:");
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
  uint64_t v5;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_imageHash, "hash") ^ v3;
  v5 = -[NSData hash](self->_imageData, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_imageURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[NPKProtoStandalonePaymentHeroImage setIdentifier:](self, "setIdentifier:");
  if (v4[3])
    -[NPKProtoStandalonePaymentHeroImage setImageHash:](self, "setImageHash:");
  if (v4[2])
    -[NPKProtoStandalonePaymentHeroImage setImageData:](self, "setImageData:");
  if (v4[4])
    -[NPKProtoStandalonePaymentHeroImage setImageURL:](self, "setImageURL:");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)imageHash
{
  return self->_imageHash;
}

- (void)setImageHash:(id)a3
{
  objc_storeStrong((id *)&self->_imageHash, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentHeroImage writeTo:]", "NPKProtoStandalonePaymentHeroImage.m", 117, "nil != self->_identifier");
}

@end
