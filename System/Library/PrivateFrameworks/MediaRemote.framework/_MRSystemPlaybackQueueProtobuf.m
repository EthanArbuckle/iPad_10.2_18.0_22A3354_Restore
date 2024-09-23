@implementation _MRSystemPlaybackQueueProtobuf

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E30CC150[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SystemPlaybackQueueTypeUnknown")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SystemPlaybackQueueTypeGeneric")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SystemPlaybackQueueTypeCustom")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SystemPlaybackQueueTypeEmpty")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)replaceIntent
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_replaceIntent;
  else
    return 1;
}

- (void)setReplaceIntent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_replaceIntent = a3;
}

- (void)setHasReplaceIntent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReplaceIntent
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)replaceIntentAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E30CC170[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReplaceIntent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SystemPlaybackQueueReplaceIntentNonDestructive")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SystemPlaybackQueueReplaceIntentClearUpNext")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SystemPlaybackQueueReplaceIntentKeepUpNext")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SystemPlaybackQueueReplaceIntentLeaveSharedSession")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setIsRequestingImmediatePlayback:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isRequestingImmediatePlayback = a3;
}

- (void)setHasIsRequestingImmediatePlayback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsRequestingImmediatePlayback
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasFeatureName
{
  return self->_featureName != 0;
}

- (BOOL)hasCustomData
{
  return self->_customData != 0;
}

- (BOOL)hasTracklist
{
  return self->_tracklist != 0;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (BOOL)hasMetrics
{
  return self->_metrics != 0;
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
  v8.super_class = (Class)_MRSystemPlaybackQueueProtobuf;
  -[_MRSystemPlaybackQueueProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSystemPlaybackQueueProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  unsigned int v7;
  __CFString *v8;
  void *v9;
  NSString *featureName;
  _MRSystemPlaybackCustomDataQueueProtobuf *customData;
  void *v12;
  _MRSystemPlaybackGenericTracklistQueueProtobuf *tracklist;
  void *v14;
  NSData *userInfo;
  NSData *metrics;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_type - 1;
  if (v4 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E30CC150[v4];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = self->_replaceIntent - 1;
    if (v7 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_replaceIntent);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E30CC170[v7];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("replaceIntent"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRequestingImmediatePlayback);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isRequestingImmediatePlayback"));

  }
  featureName = self->_featureName;
  if (featureName)
    objc_msgSend(v3, "setObject:forKey:", featureName, CFSTR("featureName"));
  customData = self->_customData;
  if (customData)
  {
    -[_MRSystemPlaybackCustomDataQueueProtobuf dictionaryRepresentation](customData, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("customData"));

  }
  tracklist = self->_tracklist;
  if (tracklist)
  {
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf dictionaryRepresentation](tracklist, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("tracklist"));

  }
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v3, "setObject:forKey:", userInfo, CFSTR("userInfo"));
  metrics = self->_metrics;
  if (metrics)
    objc_msgSend(v3, "setObject:forKey:", metrics, CFSTR("metrics"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSystemPlaybackQueueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v5 = v6;
  if (self->_featureName)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_customData)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_tracklist)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_userInfo)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_metrics)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  v4[12] = self->_type;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[8] = self->_replaceIntent;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_isRequestingImmediatePlayback;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  v6 = v4;
  if (self->_featureName)
  {
    objc_msgSend(v4, "setFeatureName:");
    v4 = v6;
  }
  if (self->_customData)
  {
    objc_msgSend(v6, "setCustomData:");
    v4 = v6;
  }
  if (self->_tracklist)
  {
    objc_msgSend(v6, "setTracklist:");
    v4 = v6;
  }
  if (self->_userInfo)
  {
    objc_msgSend(v6, "setUserInfo:");
    v4 = v6;
  }
  if (self->_metrics)
  {
    objc_msgSend(v6, "setMetrics:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  *(_DWORD *)(v5 + 48) = self->_type;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_replaceIntent;
    *(_BYTE *)(v5 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_isRequestingImmediatePlayback;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_featureName, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = -[_MRSystemPlaybackCustomDataQueueProtobuf copyWithZone:](self->_customData, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  v12 = -[_MRSystemPlaybackGenericTracklistQueueProtobuf copyWithZone:](self->_tracklist, "copyWithZone:", a3);
  v13 = (void *)v6[5];
  v6[5] = v12;

  v14 = -[NSData copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v15 = (void *)v6[7];
  v6[7] = v14;

  v16 = -[NSData copyWithZone:](self->_metrics, "copyWithZone:", a3);
  v17 = (void *)v6[3];
  v6[3] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *featureName;
  _MRSystemPlaybackCustomDataQueueProtobuf *customData;
  _MRSystemPlaybackGenericTracklistQueueProtobuf *tracklist;
  NSData *userInfo;
  NSData *metrics;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_type != *((_DWORD *)v4 + 12))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_replaceIntent != *((_DWORD *)v4 + 8))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) != 0)
    {
      if (self->_isRequestingImmediatePlayback)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_26;
        goto LABEL_16;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_16;
    }
LABEL_26:
    v10 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
    goto LABEL_26;
LABEL_16:
  featureName = self->_featureName;
  if ((unint64_t)featureName | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](featureName, "isEqual:"))
  {
    goto LABEL_26;
  }
  customData = self->_customData;
  if ((unint64_t)customData | *((_QWORD *)v4 + 1))
  {
    if (!-[_MRSystemPlaybackCustomDataQueueProtobuf isEqual:](customData, "isEqual:"))
      goto LABEL_26;
  }
  tracklist = self->_tracklist;
  if ((unint64_t)tracklist | *((_QWORD *)v4 + 5))
  {
    if (!-[_MRSystemPlaybackGenericTracklistQueueProtobuf isEqual:](tracklist, "isEqual:"))
      goto LABEL_26;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](userInfo, "isEqual:"))
      goto LABEL_26;
  }
  metrics = self->_metrics;
  if ((unint64_t)metrics | *((_QWORD *)v4 + 3))
    v10 = -[NSData isEqual:](metrics, "isEqual:");
  else
    v10 = 1;
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_replaceIntent;
  else
    v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_isRequestingImmediatePlayback;
  else
    v4 = 0;
  v5 = 2654435761 * self->_type;
  v6 = v3 ^ v4 ^ -[NSString hash](self->_featureName, "hash");
  v7 = v6 ^ -[_MRSystemPlaybackCustomDataQueueProtobuf hash](self->_customData, "hash");
  v8 = v7 ^ -[_MRSystemPlaybackGenericTracklistQueueProtobuf hash](self->_tracklist, "hash");
  v9 = v8 ^ -[NSData hash](self->_userInfo, "hash") ^ v5;
  return v9 ^ -[NSData hash](self->_metrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  _MRSystemPlaybackCustomDataQueueProtobuf *customData;
  uint64_t v8;
  _MRSystemPlaybackGenericTracklistQueueProtobuf *tracklist;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  v5 = v4;
  self->_type = *((_DWORD *)v4 + 12);
  v6 = *((_BYTE *)v4 + 68);
  if ((v6 & 1) != 0)
  {
    self->_replaceIntent = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((v6 & 2) != 0)
  {
    self->_isRequestingImmediatePlayback = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 2u;
  }
  v11 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRSystemPlaybackQueueProtobuf setFeatureName:](self, "setFeatureName:");
    v5 = v11;
  }
  customData = self->_customData;
  v8 = v5[1];
  if (customData)
  {
    if (!v8)
      goto LABEL_13;
    -[_MRSystemPlaybackCustomDataQueueProtobuf mergeFrom:](customData, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[_MRSystemPlaybackQueueProtobuf setCustomData:](self, "setCustomData:");
  }
  v5 = v11;
LABEL_13:
  tracklist = self->_tracklist;
  v10 = v5[5];
  if (tracklist)
  {
    if (!v10)
      goto LABEL_19;
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf mergeFrom:](tracklist, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[_MRSystemPlaybackQueueProtobuf setTracklist:](self, "setTracklist:");
  }
  v5 = v11;
LABEL_19:
  if (v5[7])
  {
    -[_MRSystemPlaybackQueueProtobuf setUserInfo:](self, "setUserInfo:");
    v5 = v11;
  }
  if (v5[3])
  {
    -[_MRSystemPlaybackQueueProtobuf setMetrics:](self, "setMetrics:");
    v5 = v11;
  }

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)isRequestingImmediatePlayback
{
  return self->_isRequestingImmediatePlayback;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_featureName, a3);
}

- (_MRSystemPlaybackCustomDataQueueProtobuf)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
  objc_storeStrong((id *)&self->_customData, a3);
}

- (_MRSystemPlaybackGenericTracklistQueueProtobuf)tracklist
{
  return self->_tracklist;
}

- (void)setTracklist:(id)a3
{
  objc_storeStrong((id *)&self->_tracklist, a3);
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSData)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_tracklist, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_customData, 0);
}

@end
