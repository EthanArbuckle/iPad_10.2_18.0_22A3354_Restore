@implementation ATXMPBAppClipSessionEngagementTracker

- (int)interactionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_interactionType;
  else
    return 0;
}

- (void)setInteractionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_interactionType = a3;
}

- (void)setHasInteractionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInteractionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)interactionTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E82E74D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInteractionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Shown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Engaged")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Rejected")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
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
  v8.super_class = (Class)ATXMPBAppClipSessionEngagementTracker;
  -[ATXMPBAppClipSessionEngagementTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBAppClipSessionEngagementTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t interactionType;
  __CFString *v5;
  NSString *consumerSubType;
  NSString *bundleId;
  NSString *urlHash;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    interactionType = self->_interactionType;
    if (interactionType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interactionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E82E74D8[interactionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("interactionType"));

  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v3, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
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
  return ATXMPBAppClipSessionEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
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
    v4[6] = self->_interactionType;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_consumerSubType)
  {
    objc_msgSend(v4, "setConsumerSubType:");
    v4 = v5;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
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
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_interactionType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSString copyWithZone:](self->_urlHash, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *consumerSubType;
  NSString *bundleId;
  NSString *urlHash;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_interactionType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_13;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_13;
  }
  urlHash = self->_urlHash;
  if ((unint64_t)urlHash | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](urlHash, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_interactionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_consumerSubType, "hash") ^ v3;
  v5 = -[NSString hash](self->_bundleId, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_urlHash, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[10] & 1) != 0)
  {
    self->_interactionType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBAppClipSessionEngagementTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBAppClipSessionEngagementTracker setBundleId:](self, "setBundleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXMPBAppClipSessionEngagementTracker setUrlHash:](self, "setUrlHash:");
    v4 = v5;
  }

}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
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
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
