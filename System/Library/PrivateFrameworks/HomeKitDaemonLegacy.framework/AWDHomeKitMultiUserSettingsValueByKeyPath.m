@implementation AWDHomeKitMultiUserSettingsValueByKeyPath

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0xB && ((0x7FBu >> v3) & 1) != 0)
  {
    v4 = off_1E89A2018[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypePrivateRootHomeHasAcknowledgedCameraRecordingOnboarding")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypePrivateRootHomeDismissedUserSplitMediaAccountWarning")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypePrivateRootHomeDismissedIdentifyVoiceOnboarding")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypePrivateRootHomeDismissedIdentifyVoiceSetupBanner")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypePrivateRootHomeDismissedTVViewingProfileOnboarding")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypePrivateRootHomeDismissedTVViewingProfileSetupBanner")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypePrivateRootHomeDismissedCameraRecordingOnboarding")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypePrivateRootHomeDismissedCameraRecordingSetupBanner")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypeSharedRootSiriIdentifyVoice")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMultiUserSettingsValueTypeSharedRootMusicPlaybackInfluencesForYou")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasHomeKitMultiUserSettingsValueString
{
  return self->_homeKitMultiUserSettingsValueString != 0;
}

- (void)setHomeKitMultiUserSettingsValueInteger:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_homeKitMultiUserSettingsValueInteger = a3;
}

- (void)setHasHomeKitMultiUserSettingsValueInteger:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHomeKitMultiUserSettingsValueInteger
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasHomeKitMultiUserSettingsValueData
{
  return self->_homeKitMultiUserSettingsValueData != 0;
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
  v8.super_class = (Class)AWDHomeKitMultiUserSettingsValueByKeyPath;
  -[AWDHomeKitMultiUserSettingsValueByKeyPath description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitMultiUserSettingsValueByKeyPath dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *homeKitMultiUserSettingsValueString;
  void *v7;
  NSData *homeKitMultiUserSettingsValueData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = self->_type - 1;
    if (v4 < 0xB && ((0x7FBu >> v4) & 1) != 0)
    {
      v5 = off_1E89A2018[v4];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  homeKitMultiUserSettingsValueString = self->_homeKitMultiUserSettingsValueString;
  if (homeKitMultiUserSettingsValueString)
    objc_msgSend(v3, "setObject:forKey:", homeKitMultiUserSettingsValueString, CFSTR("HomeKitMultiUserSettingsValueString"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_homeKitMultiUserSettingsValueInteger);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("HomeKitMultiUserSettingsValueInteger"));

  }
  homeKitMultiUserSettingsValueData = self->_homeKitMultiUserSettingsValueData;
  if (homeKitMultiUserSettingsValueData)
    objc_msgSend(v3, "setObject:forKey:", homeKitMultiUserSettingsValueData, CFSTR("HomeKitMultiUserSettingsValueData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitMultiUserSettingsValueByKeyPathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_homeKitMultiUserSettingsValueString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_homeKitMultiUserSettingsValueData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_type;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  v5 = v4;
  if (self->_homeKitMultiUserSettingsValueString)
  {
    objc_msgSend(v4, "setHomeKitMultiUserSettingsValueString:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_homeKitMultiUserSettingsValueInteger;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  if (self->_homeKitMultiUserSettingsValueData)
  {
    objc_msgSend(v5, "setHomeKitMultiUserSettingsValueData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_homeKitMultiUserSettingsValueString, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_homeKitMultiUserSettingsValueInteger;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  v9 = -[NSData copyWithZone:](self->_homeKitMultiUserSettingsValueData, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *homeKitMultiUserSettingsValueString;
  NSData *homeKitMultiUserSettingsValueData;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  homeKitMultiUserSettingsValueString = self->_homeKitMultiUserSettingsValueString;
  if ((unint64_t)homeKitMultiUserSettingsValueString | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](homeKitMultiUserSettingsValueString, "isEqual:"))
    {
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_homeKitMultiUserSettingsValueInteger != *((_QWORD *)v4 + 1))
      goto LABEL_17;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_17;
  }
  homeKitMultiUserSettingsValueData = self->_homeKitMultiUserSettingsValueData;
  if ((unint64_t)homeKitMultiUserSettingsValueData | *((_QWORD *)v4 + 2))
    v9 = -[NSData isEqual:](homeKitMultiUserSettingsValueData, "isEqual:");
  else
    v9 = 1;
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_homeKitMultiUserSettingsValueString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_homeKitMultiUserSettingsValueInteger;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSData hash](self->_homeKitMultiUserSettingsValueData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[AWDHomeKitMultiUserSettingsValueByKeyPath setHomeKitMultiUserSettingsValueString:](self, "setHomeKitMultiUserSettingsValueString:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_homeKitMultiUserSettingsValueInteger = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[AWDHomeKitMultiUserSettingsValueByKeyPath setHomeKitMultiUserSettingsValueData:](self, "setHomeKitMultiUserSettingsValueData:");
    v4 = v5;
  }

}

- (NSString)homeKitMultiUserSettingsValueString
{
  return self->_homeKitMultiUserSettingsValueString;
}

- (void)setHomeKitMultiUserSettingsValueString:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitMultiUserSettingsValueString, a3);
}

- (int64_t)homeKitMultiUserSettingsValueInteger
{
  return self->_homeKitMultiUserSettingsValueInteger;
}

- (NSData)homeKitMultiUserSettingsValueData
{
  return self->_homeKitMultiUserSettingsValueData;
}

- (void)setHomeKitMultiUserSettingsValueData:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitMultiUserSettingsValueData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitMultiUserSettingsValueString, 0);
  objc_storeStrong((id *)&self->_homeKitMultiUserSettingsValueData, 0);
}

@end
