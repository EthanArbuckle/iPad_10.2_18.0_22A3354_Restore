@implementation ATXAnchorModelPBLinkActionMetadata

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasActionId
{
  return self->_actionId != 0;
}

- (BOOL)hasActionHistory
{
  return self->_actionHistory != 0;
}

- (void)setRelativeTimeSinceAnchorInSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_relativeTimeSinceAnchorInSeconds = a3;
}

- (void)setHasRelativeTimeSinceAnchorInSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRelativeTimeSinceAnchorInSeconds
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)ATXAnchorModelPBLinkActionMetadata;
  -[ATXAnchorModelPBLinkActionMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPBLinkActionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
  NSString *actionId;
  ATXAnchorModelPBLaunchHistoryMetadata *actionHistory;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  actionId = self->_actionId;
  if (actionId)
    objc_msgSend(v4, "setObject:forKey:", actionId, CFSTR("actionId"));
  actionHistory = self->_actionHistory;
  if (actionHistory)
  {
    -[ATXAnchorModelPBLaunchHistoryMetadata dictionaryRepresentation](actionHistory, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("actionHistory"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_relativeTimeSinceAnchorInSeconds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("relativeTimeSinceAnchorInSeconds"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBLinkActionMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionHistory)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v5;
  }
  if (self->_actionId)
  {
    objc_msgSend(v5, "setActionId:");
    v4 = v5;
  }
  if (self->_actionHistory)
  {
    objc_msgSend(v5, "setActionHistory:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_relativeTimeSinceAnchorInSeconds;
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_actionId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[ATXAnchorModelPBLaunchHistoryMetadata copyWithZone:](self->_actionHistory, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_relativeTimeSinceAnchorInSeconds;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  NSString *actionId;
  ATXAnchorModelPBLaunchHistoryMetadata *actionHistory;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_12;
  }
  actionId = self->_actionId;
  if ((unint64_t)actionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionId, "isEqual:"))
      goto LABEL_12;
  }
  actionHistory = self->_actionHistory;
  if ((unint64_t)actionHistory | *((_QWORD *)v4 + 1))
  {
    if (!-[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](actionHistory, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_relativeTimeSinceAnchorInSeconds == *((_DWORD *)v4 + 8))
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
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSString hash](self->_actionId, "hash");
  v5 = -[ATXAnchorModelPBLaunchHistoryMetadata hash](self->_actionHistory, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_relativeTimeSinceAnchorInSeconds;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  ATXAnchorModelPBLaunchHistoryMetadata *actionHistory;
  uint64_t v6;
  int *v7;

  v4 = (int *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXAnchorModelPBLinkActionMetadata setBundleId:](self, "setBundleId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXAnchorModelPBLinkActionMetadata setActionId:](self, "setActionId:");
    v4 = v7;
  }
  actionHistory = self->_actionHistory;
  v6 = *((_QWORD *)v4 + 1);
  if (actionHistory)
  {
    if (!v6)
      goto LABEL_11;
    -[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](actionHistory, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[ATXAnchorModelPBLinkActionMetadata setActionHistory:](self, "setActionHistory:");
  }
  v4 = v7;
LABEL_11:
  if ((v4[9] & 1) != 0)
  {
    self->_relativeTimeSinceAnchorInSeconds = v4[8];
    *(_BYTE *)&self->_has |= 1u;
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

- (NSString)actionId
{
  return self->_actionId;
}

- (void)setActionId:(id)a3
{
  objc_storeStrong((id *)&self->_actionId, a3);
}

- (ATXAnchorModelPBLaunchHistoryMetadata)actionHistory
{
  return self->_actionHistory;
}

- (void)setActionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_actionHistory, a3);
}

- (int)relativeTimeSinceAnchorInSeconds
{
  return self->_relativeTimeSinceAnchorInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
  objc_storeStrong((id *)&self->_actionHistory, 0);
}

@end
