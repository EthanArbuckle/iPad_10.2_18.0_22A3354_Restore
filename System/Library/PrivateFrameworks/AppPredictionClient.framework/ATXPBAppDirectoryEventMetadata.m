@implementation ATXPBAppDirectoryEventMetadata

- (uint64_t)setBundleIdInTopAppsVisible:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 12) |= 1u;
    *(_BYTE *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasBundleIdInTopAppsVisible:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 12) = *(_BYTE *)(result + 12) & 0xFE | a2;
  return result;
}

- (uint64_t)hasBundleIdInTopAppsVisible
{
  if (result)
    return *(_BYTE *)(result + 12) & 1;
  return result;
}

- (uint64_t)setUserLaunchedAppBeforeLeaving:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 12) |= 2u;
    *(_BYTE *)(result + 9) = a2;
  }
  return result;
}

- (uint64_t)setHasUserLaunchedAppBeforeLeaving:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 12) = *(_BYTE *)(result + 12) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasUserLaunchedAppBeforeLeaving
{
  if (result)
    return (*(unsigned __int8 *)(result + 12) >> 1) & 1;
  return result;
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
  v8.super_class = (Class)ATXPBAppDirectoryEventMetadata;
  -[ATXPBAppDirectoryEventMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBAppDirectoryEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_bundleIdInTopAppsVisible);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bundleIdInTopAppsVisible"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userLaunchedAppBeforeLeaving);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("userLaunchedAppBeforeLeaving"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBAppDirectoryEventMetadataReadFrom((uint64_t)self, (uint64_t)a3);
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

}

- (void)copyTo:(_BYTE *)a1
{
  _BYTE *v3;
  char v4;

  v3 = a2;
  if (a1)
  {
    v4 = a1[12];
    if ((v4 & 1) != 0)
    {
      v3[8] = a1[8];
      v3[12] |= 1u;
      v4 = a1[12];
    }
    if ((v4 & 2) != 0)
    {
      v3[9] = a1[9];
      v3[12] |= 2u;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_bundleIdInTopAppsVisible;
    *((_BYTE *)result + 12) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 9) = self->_userLaunchedAppBeforeLeaving;
    *((_BYTE *)result + 12) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_12;
    if (self->_bundleIdInTopAppsVisible)
    {
      if (!v4[8])
        goto LABEL_12;
    }
    else if (v4[8])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_12;
  }
  v5 = (v4[12] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_userLaunchedAppBeforeLeaving)
      {
        if (!v4[9])
          goto LABEL_12;
      }
      else if (v4[9])
      {
        goto LABEL_12;
      }
      v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_bundleIdInTopAppsVisible;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_userLaunchedAppBeforeLeaving;
  return v3 ^ v2;
}

- (void)mergeFrom:(_BYTE *)a1
{
  _BYTE *v3;
  char v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3[12];
    if ((v4 & 1) != 0)
    {
      a1[8] = v3[8];
      a1[12] |= 1u;
      v4 = v3[12];
    }
    if ((v4 & 2) != 0)
    {
      a1[9] = v3[9];
      a1[12] |= 2u;
    }
  }

}

- (BOOL)bundleIdInTopAppsVisible
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (BOOL)userLaunchedAppBeforeLeaving
{
  if (result)
    return *(_BYTE *)(result + 9) != 0;
  return result;
}

@end
