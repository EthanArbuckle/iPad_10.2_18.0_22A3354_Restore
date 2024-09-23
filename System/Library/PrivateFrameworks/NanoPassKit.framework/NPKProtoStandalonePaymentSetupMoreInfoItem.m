@implementation NPKProtoStandalonePaymentSetupMoreInfoItem

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (BOOL)hasLinkText
{
  return self->_linkText != 0;
}

- (BOOL)hasLinkURL
{
  return self->_linkURL != 0;
}

- (BOOL)hasImageURL
{
  return self->_imageURL != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentSetupMoreInfoItem;
  -[NPKProtoStandalonePaymentSetupMoreInfoItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupMoreInfoItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *body;
  NSString *linkText;
  NSString *linkURL;
  NSString *imageURL;
  NSData *imageData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  body = self->_body;
  if (body)
    objc_msgSend(v4, "setObject:forKey:", body, CFSTR("body"));
  linkText = self->_linkText;
  if (linkText)
    objc_msgSend(v4, "setObject:forKey:", linkText, CFSTR("linkText"));
  linkURL = self->_linkURL;
  if (linkURL)
    objc_msgSend(v4, "setObject:forKey:", linkURL, CFSTR("linkURL"));
  imageURL = self->_imageURL;
  if (imageURL)
    objc_msgSend(v4, "setObject:forKey:", imageURL, CFSTR("imageURL"));
  imageData = self->_imageData;
  if (imageData)
    objc_msgSend(v4, "setObject:forKey:", imageData, CFSTR("imageData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentSetupMoreInfoItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_body)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_linkText)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_linkURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_imageURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_imageData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v5;
  }
  if (self->_body)
  {
    objc_msgSend(v5, "setBody:");
    v4 = v5;
  }
  if (self->_linkText)
  {
    objc_msgSend(v5, "setLinkText:");
    v4 = v5;
  }
  if (self->_linkURL)
  {
    objc_msgSend(v5, "setLinkURL:");
    v4 = v5;
  }
  if (self->_imageURL)
  {
    objc_msgSend(v5, "setImageURL:");
    v4 = v5;
  }
  if (self->_imageData)
  {
    objc_msgSend(v5, "setImageData:");
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_linkText, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_linkURL, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSString copyWithZone:](self->_imageURL, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  v16 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  v17 = (void *)v5[2];
  v5[2] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  NSString *body;
  NSString *linkText;
  NSString *linkURL;
  NSString *imageURL;
  NSData *imageData;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((title = self->_title, !((unint64_t)title | v4[6]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((body = self->_body, !((unint64_t)body | v4[1])) || -[NSString isEqual:](body, "isEqual:"))
    && ((linkText = self->_linkText, !((unint64_t)linkText | v4[4]))
     || -[NSString isEqual:](linkText, "isEqual:"))
    && ((linkURL = self->_linkURL, !((unint64_t)linkURL | v4[5]))
     || -[NSString isEqual:](linkURL, "isEqual:"))
    && ((imageURL = self->_imageURL, !((unint64_t)imageURL | v4[3]))
     || -[NSString isEqual:](imageURL, "isEqual:")))
  {
    imageData = self->_imageData;
    if ((unint64_t)imageData | v4[2])
      v11 = -[NSData isEqual:](imageData, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_body, "hash") ^ v3;
  v5 = -[NSString hash](self->_linkText, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_linkURL, "hash");
  v7 = -[NSString hash](self->_imageURL, "hash");
  return v6 ^ v7 ^ -[NSData hash](self->_imageData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[6])
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setTitle:](self, "setTitle:");
  if (v4[1])
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setBody:](self, "setBody:");
  if (v4[4])
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setLinkText:](self, "setLinkText:");
  if (v4[5])
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setLinkURL:](self, "setLinkURL:");
  if (v4[3])
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setImageURL:](self, "setImageURL:");
  if (v4[2])
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setImageData:](self, "setImageData:");

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
  objc_storeStrong((id *)&self->_linkText, a3);
}

- (NSString)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
  objc_storeStrong((id *)&self->_linkURL, a3);
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
