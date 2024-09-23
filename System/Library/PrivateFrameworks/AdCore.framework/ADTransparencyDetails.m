@implementation ADTransparencyDetails

- (BOOL)hasTransparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage != 0;
}

- (BOOL)hasTransparencyRendererPayload
{
  return self->_transparencyRendererPayload != 0;
}

- (BOOL)hasTransparencyRendererURL
{
  return self->_transparencyRendererURL != 0;
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
  v8.super_class = (Class)ADTransparencyDetails;
  -[ADTransparencyDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *transparencyDetailsUnavailableMessage;
  NSString *transparencyRendererPayload;
  NSString *transparencyRendererURL;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
  if (transparencyDetailsUnavailableMessage)
    objc_msgSend(v3, "setObject:forKey:", transparencyDetailsUnavailableMessage, CFSTR("transparencyDetailsUnavailableMessage"));
  transparencyRendererPayload = self->_transparencyRendererPayload;
  if (transparencyRendererPayload)
    objc_msgSend(v4, "setObject:forKey:", transparencyRendererPayload, CFSTR("transparencyRendererPayload"));
  transparencyRendererURL = self->_transparencyRendererURL;
  if (transparencyRendererURL)
    objc_msgSend(v4, "setObject:forKey:", transparencyRendererURL, CFSTR("transparencyRendererURL"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ADTransparencyDetailsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_transparencyDetailsUnavailableMessage)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_transparencyRendererPayload)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_transparencyRendererURL)
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
  if (self->_transparencyDetailsUnavailableMessage)
  {
    objc_msgSend(v4, "setTransparencyDetailsUnavailableMessage:");
    v4 = v5;
  }
  if (self->_transparencyRendererPayload)
  {
    objc_msgSend(v5, "setTransparencyRendererPayload:");
    v4 = v5;
  }
  if (self->_transparencyRendererURL)
  {
    objc_msgSend(v5, "setTransparencyRendererURL:");
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
  v6 = -[NSString copyWithZone:](self->_transparencyDetailsUnavailableMessage, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_transparencyRendererPayload, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_transparencyRendererURL, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *transparencyDetailsUnavailableMessage;
  NSString *transparencyRendererPayload;
  NSString *transparencyRendererURL;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage,
         !((unint64_t)transparencyDetailsUnavailableMessage | v4[1]))
     || -[NSString isEqual:](transparencyDetailsUnavailableMessage, "isEqual:"))
    && ((transparencyRendererPayload = self->_transparencyRendererPayload,
         !((unint64_t)transparencyRendererPayload | v4[2]))
     || -[NSString isEqual:](transparencyRendererPayload, "isEqual:")))
  {
    transparencyRendererURL = self->_transparencyRendererURL;
    if ((unint64_t)transparencyRendererURL | v4[3])
      v8 = -[NSString isEqual:](transparencyRendererURL, "isEqual:");
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

  v3 = -[NSString hash](self->_transparencyDetailsUnavailableMessage, "hash");
  v4 = -[NSString hash](self->_transparencyRendererPayload, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_transparencyRendererURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[ADTransparencyDetails setTransparencyDetailsUnavailableMessage:](self, "setTransparencyDetailsUnavailableMessage:");
  if (v4[2])
    -[ADTransparencyDetails setTransparencyRendererPayload:](self, "setTransparencyRendererPayload:");
  if (v4[3])
    -[ADTransparencyDetails setTransparencyRendererURL:](self, "setTransparencyRendererURL:");

}

- (NSString)transparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage;
}

- (void)setTransparencyDetailsUnavailableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, a3);
}

- (NSString)transparencyRendererPayload
{
  return self->_transparencyRendererPayload;
}

- (void)setTransparencyRendererPayload:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyRendererPayload, a3);
}

- (NSString)transparencyRendererURL
{
  return self->_transparencyRendererURL;
}

- (void)setTransparencyRendererURL:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyRendererURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_transparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, 0);
}

@end
