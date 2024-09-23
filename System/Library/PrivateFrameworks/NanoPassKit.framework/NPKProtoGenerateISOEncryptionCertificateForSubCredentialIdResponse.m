@implementation NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse

- (void)clearAttestations
{
  -[NSMutableArray removeAllObjects](self->_attestations, "removeAllObjects");
}

- (void)addAttestation:(id)a3
{
  id v4;
  NSMutableArray *attestations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attestations = self->_attestations;
  v8 = v4;
  if (!attestations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_attestations;
    self->_attestations = v6;

    v4 = v8;
    attestations = self->_attestations;
  }
  -[NSMutableArray addObject:](attestations, "addObject:", v4);

}

- (unint64_t)attestationsCount
{
  return -[NSMutableArray count](self->_attestations, "count");
}

- (id)attestationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attestations, "objectAtIndex:", a3);
}

+ (Class)attestationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAuthorization
{
  return self->_authorization != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
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
  v8.super_class = (Class)NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse;
  -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *attestations;
  NSData *authorization;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  attestations = self->_attestations;
  if (attestations)
    objc_msgSend(v3, "setObject:forKey:", attestations, CFSTR("attestation"));
  authorization = self->_authorization;
  if (authorization)
    objc_msgSend(v4, "setObject:forKey:", authorization, CFSTR("authorization"));
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponseReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_attestations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_authorization)
    PBDataWriterWriteDataField();
  if (self->_errorData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse attestationsCount](self, "attestationsCount"))
  {
    objc_msgSend(v9, "clearAttestations");
    v4 = -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse attestationsCount](self, "attestationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse attestationAtIndex:](self, "attestationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAttestation:", v7);

      }
    }
  }
  if (self->_authorization)
    objc_msgSend(v9, "setAuthorization:");
  v8 = v9;
  if (self->_errorData)
  {
    objc_msgSend(v9, "setErrorData:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_attestations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addAttestation:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = -[NSData copyWithZone:](self->_authorization, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *attestations;
  NSData *authorization;
  NSData *errorData;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((attestations = self->_attestations, !((unint64_t)attestations | v4[1]))
     || -[NSMutableArray isEqual:](attestations, "isEqual:"))
    && ((authorization = self->_authorization, !((unint64_t)authorization | v4[2]))
     || -[NSData isEqual:](authorization, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[3])
      v8 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableArray hash](self->_attestations, "hash");
  v4 = -[NSData hash](self->_authorization, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_errorData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4[1];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse addAttestation:](self, "addAttestation:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (v4[2])
    -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse setAuthorization:](self, "setAuthorization:");
  if (v4[3])
    -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse setErrorData:](self, "setErrorData:");

}

- (NSMutableArray)attestations
{
  return self->_attestations;
}

- (void)setAttestations:(id)a3
{
  objc_storeStrong((id *)&self->_attestations, a3);
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_authorization, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_attestations, 0);
}

@end
