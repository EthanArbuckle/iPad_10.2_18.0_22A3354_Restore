@implementation BRFieldCKInfo

- (void)setKnownToServer:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_knownToServer = a3;
}

- (void)setHasKnownToServer:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKnownToServer
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWasCached:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_wasCached = a3;
}

- (void)setHasWasCached:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWasCached
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasEtagBeforeCrossZoneMove
{
  return self->_etagBeforeCrossZoneMove != 0;
}

- (BOOL)hasDeletionChangeToken
{
  return self->_deletionChangeToken != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BRFieldCKInfo;
  -[BRFieldCKInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldCKInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *etag;
  NSString *etagBeforeCrossZoneMove;
  NSData *deletionChangeToken;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_knownToServer);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("knownToServer"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wasCached);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("wasCached"));

  }
  etag = self->_etag;
  if (etag)
    objc_msgSend(v3, "setObject:forKey:", etag, CFSTR("etag"));
  etagBeforeCrossZoneMove = self->_etagBeforeCrossZoneMove;
  if (etagBeforeCrossZoneMove)
    objc_msgSend(v3, "setObject:forKey:", etagBeforeCrossZoneMove, CFSTR("etagBeforeCrossZoneMove"));
  deletionChangeToken = self->_deletionChangeToken;
  if (deletionChangeToken)
    objc_msgSend(v3, "setObject:forKey:", deletionChangeToken, CFSTR("deletionChangeToken"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldCKInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_etagBeforeCrossZoneMove)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_deletionChangeToken)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[32] = self->_knownToServer;
    v4[36] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[33] = self->_wasCached;
    v4[36] |= 2u;
  }
  v6 = v4;
  if (self->_etag)
  {
    objc_msgSend(v4, "setEtag:");
    v4 = v6;
  }
  if (self->_etagBeforeCrossZoneMove)
  {
    objc_msgSend(v6, "setEtagBeforeCrossZoneMove:");
    v4 = v6;
  }
  if (self->_deletionChangeToken)
  {
    objc_msgSend(v6, "setDeletionChangeToken:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[32] = self->_knownToServer;
    v5[36] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[33] = self->_wasCached;
    v5[36] |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_etag, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = -[NSString copyWithZone:](self->_etagBeforeCrossZoneMove, "copyWithZone:", a3);
  v11 = (void *)v6[3];
  v6[3] = v10;

  v12 = -[NSData copyWithZone:](self->_deletionChangeToken, "copyWithZone:", a3);
  v13 = (void *)v6[1];
  v6[1] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *etag;
  NSString *etagBeforeCrossZoneMove;
  NSData *deletionChangeToken;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
      goto LABEL_24;
    if (self->_knownToServer)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) != 0)
    {
      if (self->_wasCached)
      {
        if (!*((_BYTE *)v4 + 33))
          goto LABEL_24;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_18;
    }
LABEL_24:
    v8 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
    goto LABEL_24;
LABEL_18:
  etag = self->_etag;
  if ((unint64_t)etag | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](etag, "isEqual:"))
    goto LABEL_24;
  etagBeforeCrossZoneMove = self->_etagBeforeCrossZoneMove;
  if ((unint64_t)etagBeforeCrossZoneMove | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](etagBeforeCrossZoneMove, "isEqual:"))
      goto LABEL_24;
  }
  deletionChangeToken = self->_deletionChangeToken;
  if ((unint64_t)deletionChangeToken | *((_QWORD *)v4 + 1))
    v8 = -[NSData isEqual:](deletionChangeToken, "isEqual:");
  else
    v8 = 1;
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_knownToServer;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_wasCached;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_etag, "hash");
  v6 = -[NSString hash](self->_etagBeforeCrossZoneMove, "hash");
  return v5 ^ v6 ^ -[NSData hash](self->_deletionChangeToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  char v5;
  _BYTE *v6;

  v4 = a3;
  v5 = v4[36];
  if ((v5 & 1) != 0)
  {
    self->_knownToServer = v4[32];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[36];
  }
  if ((v5 & 2) != 0)
  {
    self->_wasCached = v4[33];
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[BRFieldCKInfo setEtag:](self, "setEtag:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BRFieldCKInfo setEtagBeforeCrossZoneMove:](self, "setEtagBeforeCrossZoneMove:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[BRFieldCKInfo setDeletionChangeToken:](self, "setDeletionChangeToken:");
    v4 = v6;
  }

}

- (BOOL)knownToServer
{
  return self->_knownToServer;
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (NSString)etagBeforeCrossZoneMove
{
  return self->_etagBeforeCrossZoneMove;
}

- (void)setEtagBeforeCrossZoneMove:(id)a3
{
  objc_storeStrong((id *)&self->_etagBeforeCrossZoneMove, a3);
}

- (NSData)deletionChangeToken
{
  return self->_deletionChangeToken;
}

- (void)setDeletionChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_deletionChangeToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etagBeforeCrossZoneMove, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_deletionChangeToken, 0);
}

- (BRFieldCKInfo)initWithRecord:(id)a3
{
  id v4;
  BRFieldCKInfo *v5;
  void *v6;

  v4 = a3;
  v5 = -[BRFieldCKInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "etag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRFieldCKInfo setEtag:](v5, "setEtag:", v6);

    -[BRFieldCKInfo setKnownToServer:](v5, "setKnownToServer:", objc_msgSend(v4, "isKnownToServer"));
    -[BRFieldCKInfo setWasCached:](v5, "setWasCached:", objc_msgSend(v4, "wasCached"));
  }

  return v5;
}

- (void)markCrossZoneMoved
{
  void *v3;

  -[BRFieldCKInfo etag](self, "etag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldCKInfo setEtagBeforeCrossZoneMove:](self, "setEtagBeforeCrossZoneMove:", v3);

  -[BRFieldCKInfo setEtag:](self, "setEtag:", 0);
}

- (void)revertEtagsForOldZoneTombstone
{
  void *v3;
  NSObject *v4;
  void *v5;

  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRFieldCKInfo(BRCItemAdditions) revertEtagsForOldZoneTombstone].cold.1(self, (uint64_t)v3, v4);

  -[BRFieldCKInfo etagBeforeCrossZoneMove](self, "etagBeforeCrossZoneMove");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldCKInfo setEtag:](self, "setEtag:", v5);

  -[BRFieldCKInfo setEtagBeforeCrossZoneMove:](self, "setEtagBeforeCrossZoneMove:", 0);
}

- (void)clearCrossZoneMoveEtag
{
  -[BRFieldCKInfo setEtagBeforeCrossZoneMove:](self, "setEtagBeforeCrossZoneMove:", 0);
}

- (void)setCKInfoFieldsInRecord:(id)a3 includeCZMEtag:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[BRFieldCKInfo etag](self, "etag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEtag:", v6);

  objc_msgSend(v12, "setKnownToServer:", -[BRFieldCKInfo knownToServer](self, "knownToServer"));
  objc_msgSend(v12, "setWasCached:", -[BRFieldCKInfo wasCached](self, "wasCached"));
  -[BRFieldCKInfo etagBeforeCrossZoneMove](self, "etagBeforeCrossZoneMove");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    objc_msgSend(v12, "pluginFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v12, "pluginFields");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    }

    -[BRFieldCKInfo etagBeforeCrossZoneMove](self, "etagBeforeCrossZoneMove");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("br_etagInPreviousZone"));

    objc_msgSend(v12, "setPluginFields:", v10);
  }

}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6;

  -[BRFieldCKInfo data](self, "data");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(a3, a4, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  const void *v5;
  void *v6;
  void *v7;

  if (sqlite3_value_type(a3) != 4)
    return 0;
  v5 = sqlite3_value_blob(a3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v5, sqlite3_value_bytes(a3), 0);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v6);

  return v7;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  const void *v7;
  void *v8;
  void *v9;

  if (sqlite3_column_type(a3, a4) != 4)
    return 0;
  v7 = sqlite3_column_blob(a3, a4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v7, sqlite3_column_bytes(a3, a4), 0);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v8);

  return v9;
}

@end
