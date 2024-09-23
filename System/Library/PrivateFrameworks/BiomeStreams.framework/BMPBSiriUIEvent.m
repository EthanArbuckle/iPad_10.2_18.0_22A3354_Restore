@implementation BMPBSiriUIEvent

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasViewMode
{
  return self->_viewMode != 0;
}

- (BOOL)hasDismissalReason
{
  return self->_dismissalReason != 0;
}

- (void)setStarting:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_starting = a3;
}

- (void)setHasStarting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStarting
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
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
  v8.super_class = (Class)BMPBSiriUIEvent;
  -[BMPBSiriUIEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSiriUIEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionID;
  NSString *uuid;
  NSString *viewMode;
  NSString *dismissalReason;
  char has;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v4, "setObject:forKey:", uuid, CFSTR("uuid"));
  viewMode = self->_viewMode;
  if (viewMode)
    objc_msgSend(v4, "setObject:forKey:", viewMode, CFSTR("viewMode"));
  dismissalReason = self->_dismissalReason;
  if (dismissalReason)
    objc_msgSend(v4, "setObject:forKey:", dismissalReason, CFSTR("dismissalReason"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("starting"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("absoluteTimestamp"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriUIEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_viewMode)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_dismissalReason)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v6;
  }
  if (self->_uuid)
  {
    objc_msgSend(v6, "setUuid:");
    v4 = v6;
  }
  if (self->_viewMode)
  {
    objc_msgSend(v6, "setViewMode:");
    v4 = v6;
  }
  if (self->_dismissalReason)
  {
    objc_msgSend(v6, "setDismissalReason:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_starting;
    *((_BYTE *)v4 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 52) |= 1u;
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
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_viewMode, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_dismissalReason, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_starting;
    *(_BYTE *)(v5 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionID;
  NSString *uuid;
  NSString *viewMode;
  NSString *dismissalReason;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:"))
      goto LABEL_22;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_22;
  }
  viewMode = self->_viewMode;
  if ((unint64_t)viewMode | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](viewMode, "isEqual:"))
      goto LABEL_22;
  }
  dismissalReason = self->_dismissalReason;
  if ((unint64_t)dismissalReason | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](dismissalReason, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) != 0)
    {
      if (self->_starting)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_18;
    }
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
    goto LABEL_22;
LABEL_18:
  v9 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_22;
    v9 = 1;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  double absoluteTimestamp;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  v3 = -[NSString hash](self->_sessionID, "hash");
  v4 = -[NSString hash](self->_uuid, "hash");
  v5 = -[NSString hash](self->_viewMode, "hash");
  v6 = -[NSString hash](self->_dismissalReason, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_starting;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  absoluteTimestamp = self->_absoluteTimestamp;
  v9 = -absoluteTimestamp;
  if (absoluteTimestamp >= 0.0)
    v9 = self->_absoluteTimestamp;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBSiriUIEvent setSessionID:](self, "setSessionID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBSiriUIEvent setUuid:](self, "setUuid:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBSiriUIEvent setViewMode:](self, "setViewMode:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBSiriUIEvent setDismissalReason:](self, "setDismissalReason:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_starting = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 52);
  }
  if ((v5 & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (void)setViewMode:(id)a3
{
  objc_storeStrong((id *)&self->_viewMode, a3);
}

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (void)setDismissalReason:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalReason, a3);
}

- (BOOL)starting
{
  return self->_starting;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_dismissalReason, 0);
}

@end
