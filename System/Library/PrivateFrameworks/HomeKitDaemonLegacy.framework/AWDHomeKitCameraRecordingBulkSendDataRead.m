@implementation AWDHomeKitCameraRecordingBulkSendDataRead

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTimestamp
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasCameraUUID
{
  return self->_cameraUUID != 0;
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setChunkSequenceNumber:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_chunkSequenceNumber = a3;
}

- (void)setHasChunkSequenceNumber:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasChunkSequenceNumber
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBytesRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bytesRead = a3;
}

- (void)setHasBytesRead:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBytesRead
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBitRate:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bitRate = a3;
}

- (void)setHasBitRate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBitRate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setImageHeight:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_imageHeight = a3;
}

- (void)setHasImageHeight:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasImageHeight
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setImageWidth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_imageWidth = a3;
}

- (void)setHasImageWidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasImageWidth
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIFrameInterval:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_iFrameInterval = a3;
}

- (void)setHasIFrameInterval:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIFrameInterval
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)AWDHomeKitCameraRecordingBulkSendDataRead;
  -[AWDHomeKitCameraRecordingBulkSendDataRead description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraRecordingBulkSendDataRead dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  NSString *cameraUUID;
  NSString *sessionUUID;
  __int16 v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
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
  v9 = (__int16)self->_has;
  if ((v9 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sequenceNumber);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sequenceNumber"));

    v9 = (__int16)self->_has;
    if ((v9 & 4) == 0)
    {
LABEL_11:
      if ((v9 & 2) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_chunkSequenceNumber);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("chunkSequenceNumber"));

  v9 = (__int16)self->_has;
  if ((v9 & 2) == 0)
  {
LABEL_12:
    if ((v9 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_bytesRead);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("bytesRead"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x200) == 0)
  {
LABEL_13:
    if ((v9 & 1) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_status);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("status"));

  v9 = (__int16)self->_has;
  if ((v9 & 1) == 0)
  {
LABEL_14:
    if ((v9 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_bitRate);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("bitRate"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x20) == 0)
  {
LABEL_15:
    if ((v9 & 0x40) == 0)
      goto LABEL_16;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_imageWidth);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("imageWidth"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_17;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_imageHeight);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("imageHeight"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
    goto LABEL_25;
LABEL_16:
  if ((v9 & 0x10) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_iFrameInterval);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("IFrameInterval"));

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
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  uint64_t v74;

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
          *(_WORD *)&self->_has |= 0x100u;
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
              goto LABEL_95;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_97;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_95:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_97:
          v74 = 72;
          goto LABEL_134;
        case 2u:
          v25 = 0;
          v26 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 8u;
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
                  goto LABEL_101;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_101:
          v74 = 32;
          goto LABEL_134;
        case 3u:
          PBReaderReadString();
          v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v31 = 80;
          goto LABEL_37;
        case 4u:
          PBReaderReadString();
          v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v31 = 88;
LABEL_37:
          v32 = *(Class *)((char *)&self->super.super.isa + v31);
          *(Class *)((char *)&self->super.super.isa + v31) = v30;

          continue;
        case 5u:
          v33 = 0;
          v34 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 0x80u;
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
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_105:
          v74 = 64;
          goto LABEL_134;
        case 6u:
          v38 = 0;
          v39 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 4u;
          while (2)
          {
            v40 = *v4;
            v41 = *(_QWORD *)((char *)a3 + v40);
            if (v41 == -1 || v41 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v41);
              *(_QWORD *)((char *)a3 + v40) = v41 + 1;
              v20 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                v15 = v39++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_109:
          v74 = 24;
          goto LABEL_134;
        case 7u:
          v43 = 0;
          v44 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 2u;
          while (2)
          {
            v45 = *v4;
            v46 = *(_QWORD *)((char *)a3 + v45);
            if (v46 == -1 || v46 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v46);
              *(_QWORD *)((char *)a3 + v45) = v46 + 1;
              v20 |= (unint64_t)(v47 & 0x7F) << v43;
              if (v47 < 0)
              {
                v43 += 7;
                v15 = v44++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_113:
          v74 = 16;
          goto LABEL_134;
        case 8u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          *(_WORD *)&self->_has |= 0x200u;
          while (2)
          {
            v51 = *v4;
            v52 = *(_QWORD *)((char *)a3 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v52);
              *(_QWORD *)((char *)a3 + v51) = v52 + 1;
              v50 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                v15 = v49++ >= 9;
                if (v15)
                {
                  LODWORD(v50) = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v50) = 0;
LABEL_117:
          self->_status = v50;
          continue;
        case 9u:
          v54 = 0;
          v55 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 1u;
          while (2)
          {
            v56 = *v4;
            v57 = *(_QWORD *)((char *)a3 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v57);
              *(_QWORD *)((char *)a3 + v56) = v57 + 1;
              v20 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                v15 = v55++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_121:
          v74 = 8;
          goto LABEL_134;
        case 0xAu:
          v59 = 0;
          v60 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 0x20u;
          while (2)
          {
            v61 = *v4;
            v62 = *(_QWORD *)((char *)a3 + v61);
            if (v62 == -1 || v62 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v62);
              *(_QWORD *)((char *)a3 + v61) = v62 + 1;
              v20 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                v15 = v60++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_125:
          v74 = 48;
          goto LABEL_134;
        case 0xBu:
          v64 = 0;
          v65 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 0x40u;
          while (2)
          {
            v66 = *v4;
            v67 = *(_QWORD *)((char *)a3 + v66);
            if (v67 == -1 || v67 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v67);
              *(_QWORD *)((char *)a3 + v66) = v67 + 1;
              v20 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                v15 = v65++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_129:
          v74 = 56;
          goto LABEL_134;
        case 0xCu:
          v69 = 0;
          v70 = 0;
          v20 = 0;
          *(_WORD *)&self->_has |= 0x10u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v71 = *v4;
        v72 = *(_QWORD *)((char *)a3 + v71);
        if (v72 == -1 || v72 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v73 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v72);
        *(_QWORD *)((char *)a3 + v71) = v72 + 1;
        v20 |= (unint64_t)(v73 & 0x7F) << v69;
        if ((v73 & 0x80) == 0)
          goto LABEL_131;
        v69 += 7;
        v15 = v70++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_133;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_131:
      if (*((_BYTE *)a3 + *v6))
        v20 = 0;
LABEL_133:
      v74 = 40;
LABEL_134:
      *(Class *)((char *)&self->super.super.isa + v74) = (Class)v20;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  id v6;

  v6 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_cameraUUID)
    PBDataWriterWriteStringField();
  if (self->_sessionUUID)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (__int16)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_11:
      if ((v5 & 2) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 1) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_15:
    if ((v5 & 0x40) == 0)
      goto LABEL_16;
LABEL_25:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x40) != 0)
    goto LABEL_25;
LABEL_16:
  if ((v5 & 0x10) != 0)
LABEL_17:
    PBDataWriterWriteUint64Field();
LABEL_18:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  __int16 v6;
  _QWORD *v7;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[9] = self->_timestamp;
    *((_WORD *)v4 + 50) |= 0x100u;
    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[4] = self->_duration;
    *((_WORD *)v4 + 50) |= 8u;
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
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    v4[8] = self->_sequenceNumber;
    *((_WORD *)v4 + 50) |= 0x80u;
    v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_11:
      if ((v6 & 2) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_11;
  }
  v4[3] = self->_chunkSequenceNumber;
  *((_WORD *)v4 + 50) |= 4u;
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((v6 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  v4[2] = self->_bytesRead;
  *((_WORD *)v4 + 50) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_13:
    if ((v6 & 1) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 24) = self->_status;
  *((_WORD *)v4 + 50) |= 0x200u;
  v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_14:
    if ((v6 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  v4[1] = self->_bitRate;
  *((_WORD *)v4 + 50) |= 1u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_15:
    if ((v6 & 0x40) == 0)
      goto LABEL_16;
LABEL_25:
    v4[7] = self->_imageWidth;
    *((_WORD *)v4 + 50) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_24:
  v4[6] = self->_imageHeight;
  *((_WORD *)v4 + 50) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
    goto LABEL_25;
LABEL_16:
  if ((v6 & 0x10) != 0)
  {
LABEL_17:
    v4[5] = self->_iFrameInterval;
    *((_WORD *)v4 + 50) |= 0x10u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int16 v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_timestamp;
    *(_WORD *)(v5 + 100) |= 0x100u;
    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_duration;
    *(_WORD *)(v5 + 100) |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_cameraUUID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v8;

  v10 = -[NSString copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v10;

  v12 = (__int16)self->_has;
  if ((v12 & 0x80) != 0)
  {
    *(_QWORD *)(v6 + 64) = self->_sequenceNumber;
    *(_WORD *)(v6 + 100) |= 0x80u;
    v12 = (__int16)self->_has;
    if ((v12 & 4) == 0)
    {
LABEL_7:
      if ((v12 & 2) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v6 + 24) = self->_chunkSequenceNumber;
  *(_WORD *)(v6 + 100) |= 4u;
  v12 = (__int16)self->_has;
  if ((v12 & 2) == 0)
  {
LABEL_8:
    if ((v12 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *(_QWORD *)(v6 + 16) = self->_bytesRead;
  *(_WORD *)(v6 + 100) |= 2u;
  v12 = (__int16)self->_has;
  if ((v12 & 0x200) == 0)
  {
LABEL_9:
    if ((v12 & 1) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v6 + 96) = self->_status;
  *(_WORD *)(v6 + 100) |= 0x200u;
  v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
LABEL_10:
    if ((v12 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  *(_QWORD *)(v6 + 8) = self->_bitRate;
  *(_WORD *)(v6 + 100) |= 1u;
  v12 = (__int16)self->_has;
  if ((v12 & 0x20) == 0)
  {
LABEL_11:
    if ((v12 & 0x40) == 0)
      goto LABEL_12;
LABEL_21:
    *(_QWORD *)(v6 + 56) = self->_imageWidth;
    *(_WORD *)(v6 + 100) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return (id)v6;
    goto LABEL_13;
  }
LABEL_20:
  *(_QWORD *)(v6 + 48) = self->_imageHeight;
  *(_WORD *)(v6 + 100) |= 0x20u;
  v12 = (__int16)self->_has;
  if ((v12 & 0x40) != 0)
    goto LABEL_21;
LABEL_12:
  if ((v12 & 0x10) != 0)
  {
LABEL_13:
    *(_QWORD *)(v6 + 40) = self->_iFrameInterval;
    *(_WORD *)(v6 + 100) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *cameraUUID;
  NSString *sessionUUID;
  __int16 v9;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_56;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 50);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) == 0 || self->_timestamp != *((_QWORD *)v4 + 9))
      goto LABEL_56;
  }
  else if ((*((_WORD *)v4 + 50) & 0x100) != 0)
  {
LABEL_56:
    v11 = 0;
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_duration != *((_QWORD *)v4 + 4))
      goto LABEL_56;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_56;
  }
  cameraUUID = self->_cameraUUID;
  if ((unint64_t)cameraUUID | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](cameraUUID, "isEqual:"))
  {
    goto LABEL_56;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:"))
      goto LABEL_56;
  }
  v9 = (__int16)self->_has;
  v10 = *((_WORD *)v4 + 50);
  if ((v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_sequenceNumber != *((_QWORD *)v4 + 8))
      goto LABEL_56;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_56;
  }
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_chunkSequenceNumber != *((_QWORD *)v4 + 3))
      goto LABEL_56;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_bytesRead != *((_QWORD *)v4 + 2))
      goto LABEL_56;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0 || self->_status != *((_DWORD *)v4 + 24))
      goto LABEL_56;
  }
  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_56;
  }
  if ((v9 & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_bitRate != *((_QWORD *)v4 + 1))
      goto LABEL_56;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_56;
  }
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_imageHeight != *((_QWORD *)v4 + 6))
      goto LABEL_56;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_imageWidth != *((_QWORD *)v4 + 7))
      goto LABEL_56;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_56;
  }
  if ((v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_iFrameInterval != *((_QWORD *)v4 + 5))
      goto LABEL_56;
    v11 = 1;
  }
  else
  {
    v11 = (v10 & 0x10) == 0;
  }
LABEL_57:

  return v11;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  __int16 v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_duration;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_cameraUUID, "hash");
  v7 = -[NSString hash](self->_sessionUUID, "hash");
  v8 = (__int16)self->_has;
  if ((v8 & 0x80) != 0)
  {
    v9 = 2654435761u * self->_sequenceNumber;
    if ((v8 & 4) != 0)
    {
LABEL_8:
      v10 = 2654435761u * self->_chunkSequenceNumber;
      if ((v8 & 2) != 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else
  {
    v9 = 0;
    if ((v8 & 4) != 0)
      goto LABEL_8;
  }
  v10 = 0;
  if ((v8 & 2) != 0)
  {
LABEL_9:
    v11 = 2654435761u * self->_bytesRead;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v12 = 2654435761 * self->_status;
    if ((v8 & 1) != 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  v12 = 0;
  if ((v8 & 1) != 0)
  {
LABEL_11:
    v13 = 2654435761u * self->_bitRate;
    if ((v8 & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  v13 = 0;
  if ((v8 & 0x20) != 0)
  {
LABEL_12:
    v14 = 2654435761u * self->_imageHeight;
    if ((v8 & 0x40) != 0)
      goto LABEL_13;
LABEL_21:
    v15 = 0;
    if ((v8 & 0x10) != 0)
      goto LABEL_14;
LABEL_22:
    v16 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_20:
  v14 = 0;
  if ((v8 & 0x40) == 0)
    goto LABEL_21;
LABEL_13:
  v15 = 2654435761u * self->_imageWidth;
  if ((v8 & 0x10) == 0)
    goto LABEL_22;
LABEL_14:
  v16 = 2654435761u * self->_iFrameInterval;
  return v5 ^ v4 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x100) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)v4 + 50);
  }
  if ((v5 & 8) != 0)
  {
    self->_duration = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 10))
  {
    -[AWDHomeKitCameraRecordingBulkSendDataRead setCameraUUID:](self, "setCameraUUID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[AWDHomeKitCameraRecordingBulkSendDataRead setSessionUUID:](self, "setSessionUUID:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 50);
  if ((v6 & 0x80) != 0)
  {
    self->_sequenceNumber = *((_QWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    v6 = *((_WORD *)v4 + 50);
    if ((v6 & 4) == 0)
    {
LABEL_11:
      if ((v6 & 2) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_chunkSequenceNumber = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 50);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((v6 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  self->_bytesRead = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 50);
  if ((v6 & 0x200) == 0)
  {
LABEL_13:
    if ((v6 & 1) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  self->_status = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x200u;
  v6 = *((_WORD *)v4 + 50);
  if ((v6 & 1) == 0)
  {
LABEL_14:
    if ((v6 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  self->_bitRate = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v6 = *((_WORD *)v4 + 50);
  if ((v6 & 0x20) == 0)
  {
LABEL_15:
    if ((v6 & 0x40) == 0)
      goto LABEL_16;
LABEL_25:
    self->_imageWidth = *((_QWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    if ((*((_WORD *)v4 + 50) & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_24:
  self->_imageHeight = *((_QWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 50);
  if ((v6 & 0x40) != 0)
    goto LABEL_25;
LABEL_16:
  if ((v6 & 0x10) != 0)
  {
LABEL_17:
    self->_iFrameInterval = *((_QWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_18:

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

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unint64_t)chunkSequenceNumber
{
  return self->_chunkSequenceNumber;
}

- (unint64_t)bytesRead
{
  return self->_bytesRead;
}

- (unsigned)status
{
  return self->_status;
}

- (unint64_t)bitRate
{
  return self->_bitRate;
}

- (unint64_t)imageHeight
{
  return self->_imageHeight;
}

- (unint64_t)imageWidth
{
  return self->_imageWidth;
}

- (unint64_t)iFrameInterval
{
  return self->_iFrameInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_cameraUUID, 0);
}

@end
