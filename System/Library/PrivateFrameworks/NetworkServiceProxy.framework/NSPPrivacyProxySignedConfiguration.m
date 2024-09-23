@implementation NSPPrivacyProxySignedConfiguration

- (void)clearCertificates
{
  -[NSMutableArray removeAllObjects](self->_certificates, "removeAllObjects");
}

- (void)addCertificates:(id)a3
{
  id v4;
  NSMutableArray *certificates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  certificates = self->_certificates;
  v8 = v4;
  if (!certificates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_certificates;
    self->_certificates = v6;

    v4 = v8;
    certificates = self->_certificates;
  }
  -[NSMutableArray addObject:](certificates, "addObject:", v4);

}

- (unint64_t)certificatesCount
{
  return -[NSMutableArray count](self->_certificates, "count");
}

- (id)certificatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_certificates, "objectAtIndex:", a3);
}

+ (Class)certificatesType
{
  return (Class)objc_opt_class();
}

- (int)algorithm
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_algorithm;
  else
    return 1;
}

- (void)setAlgorithm:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_algorithm = a3;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlgorithm
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)algorithmAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("ECDSA_SHA256");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAlgorithm:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ECDSA_SHA256"));

  return v4;
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
  v8.super_class = (Class)NSPPrivacyProxySignedConfiguration;
  -[NSPPrivacyProxySignedConfiguration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxySignedConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSPPrivacyProxyConfiguration *configuration;
  void *v5;
  NSData *signature;
  NSMutableArray *certificates;
  int algorithm;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  configuration = self->_configuration;
  if (configuration)
  {
    -[NSPPrivacyProxyConfiguration dictionaryRepresentation](configuration, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("configuration"));

  }
  signature = self->_signature;
  if (signature)
    objc_msgSend(v3, "setObject:forKey:", signature, CFSTR("signature"));
  certificates = self->_certificates;
  if (certificates)
    objc_msgSend(v3, "setObject:forKey:", certificates, CFSTR("certificates"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    algorithm = self->_algorithm;
    if (algorithm)
    {
      if (algorithm == 1)
      {
        v9 = CFSTR("ECDSA_SHA256");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_algorithm);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = CFSTR("UNKNOWN");
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("algorithm"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxySignedConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_configuration)
    __assert_rtn("-[NSPPrivacyProxySignedConfiguration writeTo:]", "NSPPrivacyProxySignedConfiguration.m", 187, "self->_configuration != nil");
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_signature)
    __assert_rtn("-[NSPPrivacyProxySignedConfiguration writeTo:]", "NSPPrivacyProxySignedConfiguration.m", 192, "nil != self->_signature");
  PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_certificates;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setConfiguration:", self->_configuration);
  objc_msgSend(v8, "setSignature:", self->_signature);
  if (-[NSPPrivacyProxySignedConfiguration certificatesCount](self, "certificatesCount"))
  {
    objc_msgSend(v8, "clearCertificates");
    v4 = -[NSPPrivacyProxySignedConfiguration certificatesCount](self, "certificatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSPPrivacyProxySignedConfiguration certificatesAtIndex:](self, "certificatesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addCertificates:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v8 + 2) = self->_algorithm;
    *((_BYTE *)v8 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSPPrivacyProxyConfiguration copyWithZone:](self->_configuration, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_certificates;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addCertificates:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_algorithm;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSPPrivacyProxyConfiguration *configuration;
  NSData *signature;
  NSMutableArray *certificates;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((_QWORD *)v4 + 3))
  {
    if (!-[NSPPrivacyProxyConfiguration isEqual:](configuration, "isEqual:"))
      goto LABEL_12;
  }
  signature = self->_signature;
  if ((unint64_t)signature | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](signature, "isEqual:"))
      goto LABEL_12;
  }
  certificates = self->_certificates;
  if ((unint64_t)certificates | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](certificates, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_algorithm == *((_DWORD *)v4 + 2))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSPPrivacyProxyConfiguration hash](self->_configuration, "hash");
  v4 = -[NSData hash](self->_signature, "hash");
  v5 = -[NSMutableArray hash](self->_certificates, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_algorithm;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NSPPrivacyProxyConfiguration *configuration;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  configuration = self->_configuration;
  v6 = *((_QWORD *)v4 + 3);
  if (configuration)
  {
    if (v6)
      -[NSPPrivacyProxyConfiguration mergeFrom:](configuration, "mergeFrom:");
  }
  else if (v6)
  {
    -[NSPPrivacyProxySignedConfiguration setConfiguration:](self, "setConfiguration:");
  }
  if (*((_QWORD *)v4 + 4))
    -[NSPPrivacyProxySignedConfiguration setSignature:](self, "setSignature:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[NSPPrivacyProxySignedConfiguration addCertificates:](self, "addCertificates:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_algorithm = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSPPrivacyProxyConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSMutableArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_certificates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
