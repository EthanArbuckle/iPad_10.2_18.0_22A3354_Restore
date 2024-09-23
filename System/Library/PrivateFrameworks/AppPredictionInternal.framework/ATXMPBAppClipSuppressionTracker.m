@implementation ATXMPBAppClipSuppressionTracker

- (int)suppressionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_suppressionType;
  else
    return 0;
}

- (void)setSuppressionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_suppressionType = a3;
}

- (void)setHasSuppressionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuppressionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)suppressionTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E82E7C20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuppressionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GPS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Feedback")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Metadata")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasUrlHash
{
  return self->_urlHash != 0;
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
  v8.super_class = (Class)ATXMPBAppClipSuppressionTracker;
  -[ATXMPBAppClipSuppressionTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBAppClipSuppressionTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t suppressionType;
  __CFString *v5;
  NSString *bundleId;
  NSString *urlHash;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    suppressionType = self->_suppressionType;
    if (suppressionType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suppressionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E82E7C20[suppressionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("suppressionType"));

  }
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  urlHash = self->_urlHash;
  if (urlHash)
    objc_msgSend(v3, "setObject:forKey:", urlHash, CFSTR("urlHash"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAppClipSuppressionTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_urlHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_suppressionType;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v5;
  }
  if (self->_urlHash)
  {
    objc_msgSend(v5, "setUrlHash:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_suppressionType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_urlHash, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  NSString *urlHash;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_suppressionType != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](bundleId, "isEqual:"))
    goto LABEL_11;
  urlHash = self->_urlHash;
  if ((unint64_t)urlHash | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](urlHash, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_suppressionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_bundleId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_urlHash, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[8] & 1) != 0)
  {
    self->_suppressionType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBAppClipSuppressionTracker setBundleId:](self, "setBundleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBAppClipSuppressionTracker setUrlHash:](self, "setUrlHash:");
    v4 = v5;
  }

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (void)setUrlHash:(id)a3
{
  objc_storeStrong((id *)&self->_urlHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
