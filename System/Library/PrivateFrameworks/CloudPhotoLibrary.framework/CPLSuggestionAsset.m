@implementation CPLSuggestionAsset

- (BOOL)hasAssetIdentifier
{
  return self->_assetIdentifier != 0;
}

- (BOOL)hasAssetFlag
{
  return self->_assetFlag != 0;
}

- (BOOL)hasActionData
{
  return self->_actionData != 0;
}

- (BOOL)hasMasterFingerprint
{
  return self->_masterFingerprint != 0;
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
  v8.super_class = (Class)CPLSuggestionAsset;
  -[CPLSuggestionAsset description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLSuggestionAsset dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *assetIdentifier;
  CPLSuggestionAssetFlag *assetFlag;
  void *v7;
  NSData *actionData;
  NSString *masterFingerprint;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  assetIdentifier = self->_assetIdentifier;
  if (assetIdentifier)
    objc_msgSend(v3, "setObject:forKey:", assetIdentifier, CFSTR("assetIdentifier"));
  assetFlag = self->_assetFlag;
  if (assetFlag)
  {
    -[CPLSuggestionAssetFlag dictionaryRepresentation](assetFlag, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("assetFlag"));

  }
  actionData = self->_actionData;
  if (actionData)
    objc_msgSend(v4, "setObject:forKey:", actionData, CFSTR("actionData"));
  masterFingerprint = self->_masterFingerprint;
  if (masterFingerprint)
    objc_msgSend(v4, "setObject:forKey:", masterFingerprint, CFSTR("masterFingerprint"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CPLSuggestionAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_assetIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_assetFlag)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_actionData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_masterFingerprint)
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
  if (self->_assetIdentifier)
  {
    objc_msgSend(v4, "setAssetIdentifier:");
    v4 = v5;
  }
  if (self->_assetFlag)
  {
    objc_msgSend(v5, "setAssetFlag:");
    v4 = v5;
  }
  if (self->_actionData)
  {
    objc_msgSend(v5, "setActionData:");
    v4 = v5;
  }
  if (self->_masterFingerprint)
  {
    objc_msgSend(v5, "setMasterFingerprint:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_assetIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[CPLSuggestionAssetFlag copyWithZone:](self->_assetFlag, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_actionData, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_masterFingerprint, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *assetIdentifier;
  CPLSuggestionAssetFlag *assetFlag;
  NSData *actionData;
  NSString *masterFingerprint;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((assetIdentifier = self->_assetIdentifier, !((unint64_t)assetIdentifier | v4[3]))
     || -[NSString isEqual:](assetIdentifier, "isEqual:"))
    && ((assetFlag = self->_assetFlag, !((unint64_t)assetFlag | v4[2]))
     || -[CPLSuggestionAssetFlag isEqual:](assetFlag, "isEqual:"))
    && ((actionData = self->_actionData, !((unint64_t)actionData | v4[1]))
     || -[NSData isEqual:](actionData, "isEqual:")))
  {
    masterFingerprint = self->_masterFingerprint;
    if ((unint64_t)masterFingerprint | v4[4])
      v9 = -[NSString isEqual:](masterFingerprint, "isEqual:");
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
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_assetIdentifier, "hash");
  v4 = -[CPLSuggestionAssetFlag hash](self->_assetFlag, "hash") ^ v3;
  v5 = -[NSData hash](self->_actionData, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_masterFingerprint, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CPLSuggestionAssetFlag *assetFlag;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[CPLSuggestionAsset setAssetIdentifier:](self, "setAssetIdentifier:");
    v4 = v7;
  }
  assetFlag = self->_assetFlag;
  v6 = v4[2];
  if (assetFlag)
  {
    if (!v6)
      goto LABEL_9;
    -[CPLSuggestionAssetFlag mergeFrom:](assetFlag, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[CPLSuggestionAsset setAssetFlag:](self, "setAssetFlag:");
  }
  v4 = v7;
LABEL_9:
  if (v4[1])
  {
    -[CPLSuggestionAsset setActionData:](self, "setActionData:");
    v4 = v7;
  }
  if (v4[4])
  {
    -[CPLSuggestionAsset setMasterFingerprint:](self, "setMasterFingerprint:");
    v4 = v7;
  }

}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetIdentifier, a3);
}

- (CPLSuggestionAssetFlag)assetFlag
{
  return self->_assetFlag;
}

- (void)setAssetFlag:(id)a3
{
  objc_storeStrong((id *)&self->_assetFlag, a3);
}

- (NSData)actionData
{
  return self->_actionData;
}

- (void)setActionData:(id)a3
{
  objc_storeStrong((id *)&self->_actionData, a3);
}

- (NSString)masterFingerprint
{
  return self->_masterFingerprint;
}

- (void)setMasterFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_masterFingerprint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterFingerprint, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetFlag, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
}

@end
