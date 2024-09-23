@implementation AWDHomeKitCameraRecordingClipNotification

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDuration:(unint64_t)a3
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

- (BOOL)hasCameraUUID
{
  return self->_cameraUUID != 0;
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (void)setRecordingEventTriggers:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recordingEventTriggers = a3;
}

- (void)setHasRecordingEventTriggers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordingEventTriggers
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)AWDHomeKitCameraRecordingClipNotification;
  -[AWDHomeKitCameraRecordingClipNotification description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraRecordingClipNotification dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *cameraUUID;
  NSString *sessionUUID;
  char v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_duration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration"));

  }
  cameraUUID = self->_cameraUUID;
  if (cameraUUID)
    objc_msgSend(v3, "setObject:forKey:", cameraUUID, CFSTR("cameraUUID"));
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    objc_msgSend(v3, "setObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  v9 = (char)self->_has;
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_recordingEventTriggers);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("recordingEventTriggers"));

    v9 = (char)self->_has;
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sequenceNumber);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sequenceNumber"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  objc_class *v30;
  uint64_t v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_53;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_55;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_53:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_55:
          v43 = 32;
          goto LABEL_68;
        case 2u:
          v25 = 0;
          v26 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v27 = *v4;
            v28 = *(_QWORD *)((char *)a3 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v28);
              *(_QWORD *)((char *)a3 + v27) = v28 + 1;
              v20 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_59:
          v43 = 8;
          goto LABEL_68;
        case 3u:
          PBReaderReadString();
          v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v31 = 40;
          goto LABEL_37;
        case 4u:
          PBReaderReadString();
          v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v31 = 48;
LABEL_37:
          v32 = *(Class *)((char *)&self->super.super.isa + v31);
          *(Class *)((char *)&self->super.super.isa + v31) = v30;

          continue;
        case 5u:
          v33 = 0;
          v34 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v35 = *v4;
            v36 = *(_QWORD *)((char *)a3 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v36);
              *(_QWORD *)((char *)a3 + v35) = v36 + 1;
              v20 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v15 = v34++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_63:
          v43 = 16;
          goto LABEL_68;
        case 6u:
          v38 = 0;
          v39 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 4u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v40 = *v4;
        v41 = *(_QWORD *)((char *)a3 + v40);
        if (v41 == -1 || v41 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v42 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v41);
        *(_QWORD *)((char *)a3 + v40) = v41 + 1;
        v20 |= (unint64_t)(v42 & 0x7F) << v38;
        if ((v42 & 0x80) == 0)
          goto LABEL_65;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_67;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_65:
      if (*((_BYTE *)a3 + *v6))
        v20 = 0;
LABEL_67:
      v43 = 24;
LABEL_68:
      *(Class *)((char *)&self->super.super.isa + v43) = (Class)v20;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_cameraUUID)
    PBDataWriterWriteStringField();
  if (self->_sessionUUID)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_timestamp;
    *((_BYTE *)v4 + 56) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[1] = self->_duration;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v7 = v4;
  if (self->_cameraUUID)
  {
    objc_msgSend(v4, "setCameraUUID:");
    v4 = v7;
  }
  if (self->_sessionUUID)
  {
    objc_msgSend(v7, "setSessionUUID:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    v4[2] = self->_recordingEventTriggers;
    *((_BYTE *)v4 + 56) |= 2u;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[3] = self->_sequenceNumber;
    *((_BYTE *)v4 + 56) |= 4u;
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
  char v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_cameraUUID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v10;

  v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_recordingEventTriggers;
    *(_BYTE *)(v6 + 56) |= 2u;
    v12 = (char)self->_has;
  }
  if ((v12 & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_sequenceNumber;
    *(_BYTE *)(v6 + 56) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *cameraUUID;
  NSString *sessionUUID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
LABEL_25:
    v7 = 0;
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_duration != *((_QWORD *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_25;
  }
  cameraUUID = self->_cameraUUID;
  if ((unint64_t)cameraUUID | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](cameraUUID, "isEqual:"))
    goto LABEL_25;
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_recordingEventTriggers != *((_QWORD *)v4 + 2))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_25;
  }
  v7 = (*((_BYTE *)v4 + 56) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_sequenceNumber != *((_QWORD *)v4 + 3))
      goto LABEL_25;
    v7 = 1;
  }
LABEL_26:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_duration;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_cameraUUID, "hash");
  v6 = -[NSString hash](self->_sessionUUID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761u * self->_recordingEventTriggers;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v8 = 2654435761u * self->_sequenceNumber;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 1) != 0)
  {
    self->_duration = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[AWDHomeKitCameraRecordingClipNotification setCameraUUID:](self, "setCameraUUID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[AWDHomeKitCameraRecordingClipNotification setSessionUUID:](self, "setSessionUUID:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 2) != 0)
  {
    self->_recordingEventTriggers = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 56);
  }
  if ((v6 & 4) != 0)
  {
    self->_sequenceNumber = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSString)cameraUUID
{
  return self->_cameraUUID;
}

- (void)setCameraUUID:(id)a3
{
  objc_storeStrong((id *)&self->_cameraUUID, a3);
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (unint64_t)recordingEventTriggers
{
  return self->_recordingEventTriggers;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_cameraUUID, 0);
}

@end
