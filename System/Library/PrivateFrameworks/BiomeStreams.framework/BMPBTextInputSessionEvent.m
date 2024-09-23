@implementation BMPBTextInputSessionEvent

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (int)sessionType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_sessionType;
  else
    return 0;
}

- (void)setSessionType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sessionType = a3;
}

- (void)setHasSessionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)sessionTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2647950[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSessionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Keyboard")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ThirdPartyKeyboard")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pencil")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Dictation")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
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
  v8.super_class = (Class)BMPBTextInputSessionEvent;
  -[BMPBTextInputSessionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBTextInputSessionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *bundleID;
  uint64_t sessionType;
  __CFString *v9;
  NSString *sessionID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("duration"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timestamp"));

  }
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    sessionType = self->_sessionType;
    if (sessionType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sessionType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E2647950[sessionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sessionType"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBTextInputSessionEventReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_duration;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 44) |= 2u;
  }
  v6 = v4;
  if (self->_bundleID)
  {
    objc_msgSend(v4, "setBundleID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_sessionType;
    *((_BYTE *)v4 + 44) |= 4u;
  }
  if (self->_sessionID)
  {
    objc_msgSend(v6, "setSessionID:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_sessionType;
    *(_BYTE *)(v6 + 44) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *bundleID;
  NSString *sessionID;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_duration != *((double *)v4 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_22;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
    {
LABEL_22:
      v8 = 0;
      goto LABEL_23;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_sessionType != *((_DWORD *)v4 + 10))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](sessionID, "isEqual:");
  else
    v8 = 1;
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double duration;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double timestamp;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    duration = self->_duration;
    v6 = -duration;
    if (duration >= 0.0)
      v6 = self->_duration;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    timestamp = self->_timestamp;
    v11 = -timestamp;
    if (timestamp >= 0.0)
      v11 = self->_timestamp;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_sessionType;
  else
    v15 = 0;
  return v9 ^ v4 ^ v15 ^ v14 ^ -[NSString hash](self->_sessionID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_duration = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBTextInputSessionEvent setBundleID:](self, "setBundleID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    self->_sessionType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBTextInputSessionEvent setSessionID:](self, "setSessionID:");
    v4 = v6;
  }

}

- (double)duration
{
  return self->_duration;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
