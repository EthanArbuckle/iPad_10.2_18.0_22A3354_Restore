@implementation BMPBAppLaunchEvent

- (BOOL)readFrom:(id)a3
{
  return BMPBAppLaunchEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)exactVersionString
{
  return self->_exactVersionString;
}

- (BOOL)starting
{
  return self->_starting;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (int)launchType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_launchType;
  else
    return 0;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (NSString)extensionHostID
{
  return self->_extensionHostID;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void)setStarting:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_starting = a3;
}

- (void)setShortVersionString:(id)a3
{
  objc_storeStrong((id *)&self->_shortVersionString, a3);
}

- (void)setParentBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_parentBundleID, a3);
}

- (void)setLaunchType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_launchType = a3;
}

- (void)setLaunchReason:(id)a3
{
  objc_storeStrong((id *)&self->_launchReason, a3);
}

- (void)setExtensionHostID:(id)a3
{
  objc_storeStrong((id *)&self->_extensionHostID, a3);
}

- (void)setExactVersionString:(id)a3
{
  objc_storeStrong((id *)&self->_exactVersionString, a3);
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_extensionHostID, 0);
  objc_storeStrong((id *)&self->_exactVersionString, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_launchReason)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_8:
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_parentBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_extensionHostID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_shortVersionString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_exactVersionString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (BOOL)hasLaunchReason
{
  return self->_launchReason != 0;
}

- (void)setHasLaunchType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLaunchType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)launchTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2648888[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLaunchType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unused")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Extension")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SystemUI")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasStarting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStarting
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasParentBundleID
{
  return self->_parentBundleID != 0;
}

- (BOOL)hasExtensionHostID
{
  return self->_extensionHostID != 0;
}

- (BOOL)hasShortVersionString
{
  return self->_shortVersionString != 0;
}

- (BOOL)hasExactVersionString
{
  return self->_exactVersionString != 0;
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
  v8.super_class = (Class)BMPBAppLaunchEvent;
  -[BMPBAppLaunchEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBAppLaunchEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *launchReason;
  char has;
  uint64_t launchType;
  __CFString *v8;
  void *v9;
  NSString *bundleID;
  NSString *parentBundleID;
  NSString *extensionHostID;
  NSString *shortVersionString;
  NSString *exactVersionString;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  launchReason = self->_launchReason;
  if (launchReason)
    objc_msgSend(v3, "setObject:forKey:", launchReason, CFSTR("launchReason"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    launchType = self->_launchType;
    if (launchType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_launchType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E2648888[launchType];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("launchType"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("starting"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 2) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("absoluteTimestamp"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("duration"));

  }
LABEL_12:
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  parentBundleID = self->_parentBundleID;
  if (parentBundleID)
    objc_msgSend(v4, "setObject:forKey:", parentBundleID, CFSTR("parentBundleID"));
  extensionHostID = self->_extensionHostID;
  if (extensionHostID)
    objc_msgSend(v4, "setObject:forKey:", extensionHostID, CFSTR("extensionHostID"));
  shortVersionString = self->_shortVersionString;
  if (shortVersionString)
    objc_msgSend(v4, "setObject:forKey:", shortVersionString, CFSTR("shortVersionString"));
  exactVersionString = self->_exactVersionString;
  if (exactVersionString)
    objc_msgSend(v4, "setObject:forKey:", exactVersionString, CFSTR("exactVersionString"));
  return v4;
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_launchReason)
  {
    objc_msgSend(v4, "setLaunchReason:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_launchType;
    *((_BYTE *)v4 + 84) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 80) = self->_starting;
  *((_BYTE *)v4 + 84) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
  *((_BYTE *)v4 + 84) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_duration;
    *((_BYTE *)v4 + 84) |= 2u;
  }
LABEL_8:
  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    v4 = v6;
  }
  if (self->_parentBundleID)
  {
    objc_msgSend(v6, "setParentBundleID:");
    v4 = v6;
  }
  if (self->_extensionHostID)
  {
    objc_msgSend(v6, "setExtensionHostID:");
    v4 = v6;
  }
  if (self->_shortVersionString)
  {
    objc_msgSend(v6, "setShortVersionString:");
    v4 = v6;
  }
  if (self->_exactVersionString)
  {
    objc_msgSend(v6, "setExactVersionString:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_launchReason, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_launchType;
    *(_BYTE *)(v5 + 84) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(double *)(v5 + 8) = self->_absoluteTimestamp;
      *(_BYTE *)(v5 + 84) |= 1u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 80) = self->_starting;
  *(_BYTE *)(v5 + 84) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(double *)(v5 + 16) = self->_duration;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
LABEL_6:
  v9 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_parentBundleID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[NSString copyWithZone:](self->_extensionHostID, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[NSString copyWithZone:](self->_shortVersionString, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v15;

  v17 = -[NSString copyWithZone:](self->_exactVersionString, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *launchReason;
  NSString *bundleID;
  NSString *parentBundleID;
  NSString *extensionHostID;
  NSString *shortVersionString;
  NSString *exactVersionString;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  launchReason = self->_launchReason;
  if ((unint64_t)launchReason | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](launchReason, "isEqual:"))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0 || self->_launchType != *((_DWORD *)v4 + 14))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 8) != 0)
    {
      if (self->_starting)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_37;
        goto LABEL_17;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_17;
    }
LABEL_37:
    v11 = 0;
    goto LABEL_38;
  }
  if ((*((_BYTE *)v4 + 84) & 8) != 0)
    goto LABEL_37;
LABEL_17:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_duration != *((double *)v4 + 2))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_37;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](bundleID, "isEqual:"))
    goto LABEL_37;
  parentBundleID = self->_parentBundleID;
  if ((unint64_t)parentBundleID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](parentBundleID, "isEqual:"))
      goto LABEL_37;
  }
  extensionHostID = self->_extensionHostID;
  if ((unint64_t)extensionHostID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](extensionHostID, "isEqual:"))
      goto LABEL_37;
  }
  shortVersionString = self->_shortVersionString;
  if ((unint64_t)shortVersionString | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](shortVersionString, "isEqual:"))
      goto LABEL_37;
  }
  exactVersionString = self->_exactVersionString;
  if ((unint64_t)exactVersionString | *((_QWORD *)v4 + 4))
    v11 = -[NSString isEqual:](exactVersionString, "isEqual:");
  else
    v11 = 1;
LABEL_38:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  uint64_t v6;
  double absoluteTimestamp;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double duration;
  double v14;
  long double v15;
  double v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;

  v3 = -[NSString hash](self->_launchReason, "hash");
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  v5 = 2654435761 * self->_launchType;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_3:
  v6 = 2654435761 * self->_starting;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  absoluteTimestamp = self->_absoluteTimestamp;
  v8 = -absoluteTimestamp;
  if (absoluteTimestamp >= 0.0)
    v8 = self->_absoluteTimestamp;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_13:
  if ((has & 2) != 0)
  {
    duration = self->_duration;
    v14 = -duration;
    if (duration >= 0.0)
      v14 = self->_duration;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  v17 = v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ -[NSString hash](self->_bundleID, "hash");
  v18 = -[NSString hash](self->_parentBundleID, "hash");
  v19 = v18 ^ -[NSString hash](self->_extensionHostID, "hash");
  v20 = v17 ^ v19 ^ -[NSString hash](self->_shortVersionString, "hash");
  return v20 ^ -[NSString hash](self->_exactVersionString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBAppLaunchEvent setLaunchReason:](self, "setLaunchReason:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_launchType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 84);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_starting = *((_BYTE *)v4 + 80);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  self->_absoluteTimestamp = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
LABEL_7:
    self->_duration = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBAppLaunchEvent setBundleID:](self, "setBundleID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[BMPBAppLaunchEvent setParentBundleID:](self, "setParentBundleID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBAppLaunchEvent setExtensionHostID:](self, "setExtensionHostID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[BMPBAppLaunchEvent setShortVersionString:](self, "setShortVersionString:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBAppLaunchEvent setExactVersionString:](self, "setExactVersionString:");
    v4 = v6;
  }

}

@end
