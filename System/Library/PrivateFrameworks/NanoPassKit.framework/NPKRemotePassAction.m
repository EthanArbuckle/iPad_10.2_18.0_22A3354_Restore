@implementation NPKRemotePassAction

- (NPKRemotePassAction)initWithUnderlyingMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NPKProtoRemotePassActionEnvelope *v7;
  void *v8;
  NPKRemotePassAction *v9;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassAction _messageDataWithDataURL:](self, "_messageDataWithDataURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[NPKProtoRemotePassActionEnvelope initWithData:]([NPKProtoRemotePassActionEnvelope alloc], "initWithData:", v6);
  else
    v7 = 0;
  -[NPKRemotePassAction _imageForMessage:](self, "_imageForMessage:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NPKRemotePassAction initWithMessage:protoEnvelope:image:](self, "initWithMessage:protoEnvelope:image:", v4, v7, v8);

  return v9;
}

- (NPKRemotePassAction)initWithProtoEnvelope:(id)a3 image:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NPKRemotePassAction *v12;

  v6 = (objc_class *)MEMORY[0x24BDDD0C0];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = objc_alloc_init(MEMORY[0x24BDDD0E8]);
  v11 = (void *)objc_msgSend(v9, "initWithSession:", v10);

  v12 = -[NPKRemotePassAction initWithMessage:protoEnvelope:image:](self, "initWithMessage:protoEnvelope:image:", v11, v8, v7);
  return v12;
}

- (NPKRemotePassAction)initWithMessage:(id)a3 protoEnvelope:(id)a4 image:(id)a5
{
  id v9;
  id v10;
  id v11;
  NPKRemotePassAction *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NPKRemotePassAction;
  v12 = -[NPKRemotePassAction init](&v14, sel_init);
  if (v12)
  {
    objc_msgSend(v9, "setRequiresValidation:", 1);
    objc_storeStrong((id *)&v12->_underlyingMessage, a3);
    objc_storeStrong((id *)&v12->_protoEnvelope, a4);
    -[NPKRemotePassAction _updateDataURL](v12, "_updateDataURL");
    -[NPKRemotePassAction _updateSummaryText](v12, "_updateSummaryText");
    -[NPKRemotePassAction _updateLayoutContentsWithImage:](v12, "_updateLayoutContentsWithImage:", v11);
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (-[NPKRemotePassAction isResponse](self, "isResponse"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[NPKRemotePassAction passLocalizedDescription](self, "passLocalizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassAction caption](self, "caption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassAction image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> isResponse: %@, passLocalizedDescription: %@, caption: %@, image: %@, underlyingMessage: %@"), v4, self, v5, v6, v7, v8, self->_underlyingMessage);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKRemotePassAction)initWithCoder:(id)a3
{
  id v4;
  NPKRemotePassAction *v5;
  uint64_t v6;
  MSMessage *underlyingMessage;
  uint64_t v8;
  NPKProtoRemotePassActionEnvelope *protoEnvelope;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKRemotePassAction;
  v5 = -[NPKRemotePassAction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlyingMessage"));
    v6 = objc_claimAutoreleasedReturnValue();
    underlyingMessage = v5->_underlyingMessage;
    v5->_underlyingMessage = (MSMessage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protoEnvelope"));
    v8 = objc_claimAutoreleasedReturnValue();
    protoEnvelope = v5->_protoEnvelope;
    v5->_protoEnvelope = (NPKProtoRemotePassActionEnvelope *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MSMessage *underlyingMessage;
  id v5;

  underlyingMessage = self->_underlyingMessage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", underlyingMessage, CFSTR("underlyingMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_protoEnvelope, CFSTR("protoEnvelope"));

}

- (BOOL)isResponse
{
  return -[NPKProtoRemotePassActionEnvelope isResponse](self->_protoEnvelope, "isResponse");
}

- (NSString)passLocalizedDescription
{
  return -[NPKProtoRemotePassActionEnvelope passLocalizedDescription](self->_protoEnvelope, "passLocalizedDescription");
}

- (NSString)caption
{
  return -[NPKProtoRemotePassActionEnvelope caption](self->_protoEnvelope, "caption");
}

- (UIImage)image
{
  return (UIImage *)-[NPKRemotePassAction _imageForMessage:](self, "_imageForMessage:", self->_underlyingMessage);
}

- (NSString)passOrganizationName
{
  return -[NPKProtoRemotePassActionEnvelope passOrganizationName](self->_protoEnvelope, "passOrganizationName");
}

- (BOOL)supportsTopUp
{
  int v3;

  if ((PKIsPhone() & 1) != 0 || (PKIsPod() & 1) != 0 || (v3 = PKIsWatch()) != 0)
    LOBYTE(v3) = -[NPKProtoRemotePassActionEnvelope messageType](self->_protoEnvelope, "messageType") == 1;
  return v3;
}

- (BOOL)supportsCommutePlanRenewal
{
  int v3;

  if ((PKIsPhone() & 1) != 0 || (PKIsPod() & 1) != 0 || (v3 = PKIsWatch()) != 0)
    LOBYTE(v3) = -[NPKProtoRemotePassActionEnvelope version](self->_protoEnvelope, "version") >= 2
              && -[NPKProtoRemotePassActionEnvelope messageType](self->_protoEnvelope, "messageType") == 2;
  return v3;
}

- (unint64_t)cardType
{
  if (-[NPKProtoRemotePassActionEnvelope hasCardType](self->_protoEnvelope, "hasCardType"))
    return NPKRemotePassActionCardTypeForNPKProtoRemotePassActionCardType(-[NPKProtoRemotePassActionEnvelope cardType](self->_protoEnvelope, "cardType"));
  else
    return 0;
}

- (id)_messageDataURLWithData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(NPKRemotePassActionMessageAbsoluteDataURLPrefix, "stringByAppendingString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v4);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_messageDataWithDataURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isEqualToString:", CFSTR("data")))
    {
      v6 = objc_msgSend(v4, "hasPrefix:", NPKRemotePassActionMessageAbsoluteDataURLPrefix);

      if (!v6)
      {
        v7 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(NPKRemotePassActionMessageAbsoluteDataURLPrefix, "length"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v5, 1);
    }
    else
    {
      v7 = 0;
    }

LABEL_9:
    return v7;
  }
  v7 = 0;
  return v7;
}

- (void)_updateDataURL
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[NPKProtoRemotePassActionEnvelope data](self->_protoEnvelope, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassAction _messageDataURLWithData:](self, "_messageDataURLWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setURL:](self->_underlyingMessage, "setURL:", v4);
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  pk_RemotePassAction_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_RemotePassAction_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Data url has size %lu", (uint8_t *)&v13, 0xCu);
    }

  }
  if (v6 >= 0x1401)
  {
    pk_RemotePassAction_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_RemotePassAction_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Warning: The data URL is too big! We may fail message size validation, causing issues when inserting this message into a conversation.", (uint8_t *)&v13, 2u);
      }

    }
  }

}

- (void)_updateSummaryText
{
  void *v3;
  id v4;

  -[NPKRemotePassAction protoEnvelope](self, "protoEnvelope");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setSummaryText:](self->_underlyingMessage, "setSummaryText:", v3);

}

- (void)_updateLayoutContentsWithImage:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  -[MSMessage layout](self->_underlyingMessage, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDDD0C8]);
    v8 = objc_alloc_init(MEMORY[0x24BDDD0D8]);
    v6 = (id)objc_msgSend(v7, "initWithAlternateLayout:", v8);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      v9 = 0;
      goto LABEL_11;
    }
    v10 = v6;
    v9 = 0;
    if (!v10)
      goto LABEL_11;
LABEL_9:
    -[NPKRemotePassAction passLocalizedDescription](self, "passLocalizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCaption:", v11);

    -[NPKRemotePassAction caption](self, "caption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSubcaption:", v12);

    objc_msgSend(v10, "setImage:", v14);
    goto LABEL_11;
  }
  v9 = v6;
  objc_msgSend(v9, "alternateLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_9;
LABEL_11:
  if (v9)
    v13 = v9;
  else
    v13 = v10;
  -[MSMessage setLayout:](self->_underlyingMessage, "setLayout:", v13);

}

- (id)_imageForMessage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "alternateLayout");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = v3;
  }
  v5 = v4;
LABEL_7:
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MSMessage)underlyingMessage
{
  return self->_underlyingMessage;
}

- (void)setUnderlyingMessage:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingMessage, a3);
}

- (NPKProtoRemotePassActionEnvelope)protoEnvelope
{
  return self->_protoEnvelope;
}

- (void)setProtoEnvelope:(id)a3
{
  objc_storeStrong((id *)&self->_protoEnvelope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoEnvelope, 0);
  objc_storeStrong((id *)&self->_underlyingMessage, 0);
}

@end
