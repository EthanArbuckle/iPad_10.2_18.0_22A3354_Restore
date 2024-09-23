@implementation NSSLegalDocumentsRespMsg

- (BOOL)hasLicense
{
  return self->_license != 0;
}

- (BOOL)hasSarStatement
{
  return self->_sarStatement != 0;
}

- (BOOL)hasLegalNotices
{
  return self->_legalNotices != 0;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (void)setSarUrlAdded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sarUrlAdded = a3;
}

- (void)setHasSarUrlAdded:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSarUrlAdded
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBuiltinApps
{
  return self->_builtinApps != 0;
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
  v8.super_class = (Class)NSSLegalDocumentsRespMsg;
  -[NSSLegalDocumentsRespMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSLegalDocumentsRespMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *license;
  NSData *sarStatement;
  NSData *legalNotices;
  NSString *buildVersion;
  void *v9;
  NSData *builtinApps;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  license = self->_license;
  if (license)
    objc_msgSend(v3, "setObject:forKey:", license, CFSTR("license"));
  sarStatement = self->_sarStatement;
  if (sarStatement)
    objc_msgSend(v4, "setObject:forKey:", sarStatement, CFSTR("sarStatement"));
  legalNotices = self->_legalNotices;
  if (legalNotices)
    objc_msgSend(v4, "setObject:forKey:", legalNotices, CFSTR("legalNotices"));
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v4, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sarUrlAdded);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("sarUrlAdded"));

  }
  builtinApps = self->_builtinApps;
  if (builtinApps)
    objc_msgSend(v4, "setObject:forKey:", builtinApps, CFSTR("builtinApps"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLegalDocumentsRespMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_license)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_sarStatement)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_legalNotices)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_builtinApps)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_license)
  {
    objc_msgSend(v4, "setLicense:");
    v4 = v5;
  }
  if (self->_sarStatement)
  {
    objc_msgSend(v5, "setSarStatement:");
    v4 = v5;
  }
  if (self->_legalNotices)
  {
    objc_msgSend(v5, "setLegalNotices:");
    v4 = v5;
  }
  if (self->_buildVersion)
  {
    objc_msgSend(v5, "setBuildVersion:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[48] = self->_sarUrlAdded;
    v4[52] |= 1u;
  }
  if (self->_builtinApps)
  {
    objc_msgSend(v5, "setBuiltinApps:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_license, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_sarStatement, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSData copyWithZone:](self->_legalNotices, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_sarUrlAdded;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v14 = -[NSData copyWithZone:](self->_builtinApps, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *license;
  NSData *sarStatement;
  NSData *legalNotices;
  NSString *buildVersion;
  char v9;
  NSData *builtinApps;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  license = self->_license;
  if ((unint64_t)license | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](license, "isEqual:"))
      goto LABEL_14;
  }
  sarStatement = self->_sarStatement;
  if ((unint64_t)sarStatement | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](sarStatement, "isEqual:"))
      goto LABEL_14;
  }
  legalNotices = self->_legalNotices;
  if ((unint64_t)legalNotices | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](legalNotices, "isEqual:"))
      goto LABEL_14;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](buildVersion, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0)
    {
      if (self->_sarUrlAdded)
      {
        if (*((_BYTE *)v4 + 48))
          goto LABEL_20;
      }
      else if (!*((_BYTE *)v4 + 48))
      {
        goto LABEL_20;
      }
    }
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
    goto LABEL_14;
LABEL_20:
  builtinApps = self->_builtinApps;
  if ((unint64_t)builtinApps | *((_QWORD *)v4 + 2))
    v9 = -[NSData isEqual:](builtinApps, "isEqual:");
  else
    v9 = 1;
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSData hash](self->_license, "hash");
  v4 = -[NSData hash](self->_sarStatement, "hash");
  v5 = -[NSData hash](self->_legalNotices, "hash");
  v6 = -[NSString hash](self->_buildVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_sarUrlAdded;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSData hash](self->_builtinApps, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[NSSLegalDocumentsRespMsg setLicense:](self, "setLicense:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NSSLegalDocumentsRespMsg setSarStatement:](self, "setSarStatement:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NSSLegalDocumentsRespMsg setLegalNotices:](self, "setLegalNotices:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NSSLegalDocumentsRespMsg setBuildVersion:](self, "setBuildVersion:");
    v4 = v5;
  }
  if (v4[52])
  {
    self->_sarUrlAdded = v4[48];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NSSLegalDocumentsRespMsg setBuiltinApps:](self, "setBuiltinApps:");
    v4 = v5;
  }

}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
  objc_storeStrong((id *)&self->_license, a3);
}

- (NSData)sarStatement
{
  return self->_sarStatement;
}

- (void)setSarStatement:(id)a3
{
  objc_storeStrong((id *)&self->_sarStatement, a3);
}

- (NSData)legalNotices
{
  return self->_legalNotices;
}

- (void)setLegalNotices:(id)a3
{
  objc_storeStrong((id *)&self->_legalNotices, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (BOOL)sarUrlAdded
{
  return self->_sarUrlAdded;
}

- (NSData)builtinApps
{
  return self->_builtinApps;
}

- (void)setBuiltinApps:(id)a3
{
  objc_storeStrong((id *)&self->_builtinApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sarStatement, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_legalNotices, 0);
  objc_storeStrong((id *)&self->_builtinApps, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
