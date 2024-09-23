@implementation NPKProtoStandaloneInitializationRequest

- (void)setUseSimulatedFlowController:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_useSimulatedFlowController = a3;
}

- (void)setHasUseSimulatedFlowController:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUseSimulatedFlowController
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUserLanguageCode
{
  return self->_userLanguageCode != 0;
}

- (BOOL)hasPassImageSize
{
  return self->_passImageSize != 0;
}

- (BOOL)hasPassThumbnailImageSize
{
  return self->_passThumbnailImageSize != 0;
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
  v8.super_class = (Class)NPKProtoStandaloneInitializationRequest;
  -[NPKProtoStandaloneInitializationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneInitializationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandaloneRequestHeader *requestHeader;
  void *v5;
  void *v6;
  NSString *userLanguageCode;
  NPKProtoStandaloneImageSize *passImageSize;
  void *v9;
  NPKProtoStandaloneImageSize *passThumbnailImageSize;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    -[NPKProtoStandaloneRequestHeader dictionaryRepresentation](requestHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestHeader"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useSimulatedFlowController);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("useSimulatedFlowController"));

  }
  userLanguageCode = self->_userLanguageCode;
  if (userLanguageCode)
    objc_msgSend(v3, "setObject:forKey:", userLanguageCode, CFSTR("userLanguageCode"));
  passImageSize = self->_passImageSize;
  if (passImageSize)
  {
    -[NPKProtoStandaloneImageSize dictionaryRepresentation](passImageSize, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("passImageSize"));

  }
  passThumbnailImageSize = self->_passThumbnailImageSize;
  if (passThumbnailImageSize)
  {
    -[NPKProtoStandaloneImageSize dictionaryRepresentation](passThumbnailImageSize, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("passThumbnailImageSize"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneInitializationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_requestHeader)
    -[NPKProtoStandaloneInitializationRequest writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_userLanguageCode)
    PBDataWriterWriteStringField();
  v5 = v6;
  if (self->_passImageSize)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_passThumbnailImageSize)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  _BYTE *v5;

  v5 = a3;
  objc_msgSend(v5, "setRequestHeader:", self->_requestHeader);
  v4 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[40] = self->_useSimulatedFlowController;
    v5[44] |= 1u;
  }
  if (self->_userLanguageCode)
  {
    objc_msgSend(v5, "setUserLanguageCode:");
    v4 = v5;
  }
  if (self->_passImageSize)
  {
    objc_msgSend(v5, "setPassImageSize:");
    v4 = v5;
  }
  if (self->_passThumbnailImageSize)
  {
    objc_msgSend(v5, "setPassThumbnailImageSize:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandaloneRequestHeader copyWithZone:](self->_requestHeader, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_useSimulatedFlowController;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_userLanguageCode, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NPKProtoStandaloneImageSize copyWithZone:](self->_passImageSize, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NPKProtoStandaloneImageSize copyWithZone:](self->_passThumbnailImageSize, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  NSString *userLanguageCode;
  NPKProtoStandaloneImageSize *passImageSize;
  NPKProtoStandaloneImageSize *passThumbnailImageSize;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  requestHeader = self->_requestHeader;
  if ((unint64_t)requestHeader | *((_QWORD *)v4 + 3))
  {
    if (!-[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) != 0)
    {
      if (self->_useSimulatedFlowController)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_18;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_12;
    }
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
    goto LABEL_18;
LABEL_12:
  userLanguageCode = self->_userLanguageCode;
  if ((unint64_t)userLanguageCode | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](userLanguageCode, "isEqual:"))
  {
    goto LABEL_18;
  }
  passImageSize = self->_passImageSize;
  if ((unint64_t)passImageSize | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoStandaloneImageSize isEqual:](passImageSize, "isEqual:"))
      goto LABEL_18;
  }
  passThumbnailImageSize = self->_passThumbnailImageSize;
  if ((unint64_t)passThumbnailImageSize | *((_QWORD *)v4 + 2))
    v9 = -[NPKProtoStandaloneImageSize isEqual:](passThumbnailImageSize, "isEqual:");
  else
    v9 = 1;
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;

  v3 = -[NPKProtoStandaloneRequestHeader hash](self->_requestHeader, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_useSimulatedFlowController;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_userLanguageCode, "hash");
  v7 = v5 ^ v6 ^ -[NPKProtoStandaloneImageSize hash](self->_passImageSize, "hash");
  return v7 ^ -[NPKProtoStandaloneImageSize hash](self->_passThumbnailImageSize, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  uint64_t v6;
  NPKProtoStandaloneImageSize *passImageSize;
  uint64_t v8;
  NPKProtoStandaloneImageSize *passThumbnailImageSize;
  uint64_t v10;
  id v11;

  v4 = a3;
  requestHeader = self->_requestHeader;
  v6 = *((_QWORD *)v4 + 3);
  v11 = v4;
  if (requestHeader)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandaloneRequestHeader mergeFrom:](requestHeader, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandaloneInitializationRequest setRequestHeader:](self, "setRequestHeader:");
  }
  v4 = v11;
LABEL_7:
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_useSimulatedFlowController = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NPKProtoStandaloneInitializationRequest setUserLanguageCode:](self, "setUserLanguageCode:");
    v4 = v11;
  }
  passImageSize = self->_passImageSize;
  v8 = *((_QWORD *)v4 + 1);
  if (passImageSize)
  {
    if (!v8)
      goto LABEL_17;
    -[NPKProtoStandaloneImageSize mergeFrom:](passImageSize, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[NPKProtoStandaloneInitializationRequest setPassImageSize:](self, "setPassImageSize:");
  }
  v4 = v11;
LABEL_17:
  passThumbnailImageSize = self->_passThumbnailImageSize;
  v10 = *((_QWORD *)v4 + 2);
  if (passThumbnailImageSize)
  {
    if (v10)
    {
      -[NPKProtoStandaloneImageSize mergeFrom:](passThumbnailImageSize, "mergeFrom:");
LABEL_22:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[NPKProtoStandaloneInitializationRequest setPassThumbnailImageSize:](self, "setPassThumbnailImageSize:");
    goto LABEL_22;
  }

}

- (NPKProtoStandaloneRequestHeader)requestHeader
{
  return self->_requestHeader;
}

- (void)setRequestHeader:(id)a3
{
  objc_storeStrong((id *)&self->_requestHeader, a3);
}

- (BOOL)useSimulatedFlowController
{
  return self->_useSimulatedFlowController;
}

- (NSString)userLanguageCode
{
  return self->_userLanguageCode;
}

- (void)setUserLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_userLanguageCode, a3);
}

- (NPKProtoStandaloneImageSize)passImageSize
{
  return self->_passImageSize;
}

- (void)setPassImageSize:(id)a3
{
  objc_storeStrong((id *)&self->_passImageSize, a3);
}

- (NPKProtoStandaloneImageSize)passThumbnailImageSize
{
  return self->_passThumbnailImageSize;
}

- (void)setPassThumbnailImageSize:(id)a3
{
  objc_storeStrong((id *)&self->_passThumbnailImageSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLanguageCode, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_passThumbnailImageSize, 0);
  objc_storeStrong((id *)&self->_passImageSize, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandaloneInitializationRequest writeTo:]", "NPKProtoStandaloneInitializationRequest.m", 180, "self->_requestHeader != nil");
}

@end
