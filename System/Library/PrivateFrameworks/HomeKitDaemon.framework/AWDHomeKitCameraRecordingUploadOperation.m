@implementation AWDHomeKitCameraRecordingUploadOperation

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasClipModelUUID
{
  return self->_clipModelUUID != 0;
}

- (void)setDidCausePreviousClipToFinalizeBecauseMaxDurationExceeded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded = a3;
}

- (void)setHasDidCausePreviousClipToFinalizeBecauseMaxDurationExceeded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasDidCausePreviousClipToFinalizeBecauseMaxDurationExceeded
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTotalClipDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_totalClipDuration = a3;
}

- (void)setHasTotalClipDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTotalClipDuration
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRunTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_runTime = a3;
}

- (void)setHasRunTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRunTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRetryCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_retryCount = a3;
}

- (void)setHasRetryCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRetryCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)operationType
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_operationType;
  else
    return 1;
}

- (void)setOperationType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_operationType = a3;
}

- (void)setHasOperationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasOperationType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)operationTypeAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_24E790800[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOperationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCameraRecordingUploadOperationTypeCreate")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCameraRecordingUploadOperationTypeSegmentUpload")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCameraRecordingUploadOperationTypePosterFrameUpload")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCameraRecordingUploadOperationTypeFinalize")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCameraRecordingUploadOperationTypeNotification")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setOperationStartTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_operationStartTime = a3;
}

- (void)setHasOperationStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOperationStartTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitCameraRecordingUploadOperation;
  -[AWDHomeKitCameraRecordingUploadOperation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraRecordingUploadOperation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clipModelUUID;
  $14396B8FA49161770661C33F34ADEF04 has;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  void *v13;
  NSString *errorDomain;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  clipModelUUID = self->_clipModelUUID;
  if (clipModelUUID)
    objc_msgSend(v3, "setObject:forKey:", clipModelUUID, CFSTR("clipModelUUID"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("didCausePreviousClipToFinalizeBecauseMaxDurationExceeded"));

  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_errorCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorCode"));

    *(_BYTE *)&has = self->_has;
  }
LABEL_8:
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalClipDuration);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("totalClipDuration"));

    *(_BYTE *)&has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_11;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_runTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("runTime"));

  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_retryCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("retryCount"));

  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_22;
LABEL_16:
  v11 = self->_operationType - 1;
  if (v11 >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_operationType);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_24E790800[v11];
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("operationType"));

LABEL_22:
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_operationStartTime);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("operationStartTime"));

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
  objc_class *v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
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
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  void *v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
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
          *(_BYTE *)&self->_has |= 0x10u;
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
              goto LABEL_81;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_83;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_81:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_83:
          v65 = 40;
          goto LABEL_112;
        case 2u:
          PBReaderReadString();
          v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v26 = 56;
          goto LABEL_72;
        case 3u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)&self->_has |= 0x80u;
          while (2)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v31);
              *(_QWORD *)((char *)a3 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v15 = v28++ >= 9;
                if (v15)
                {
                  v29 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v29 = 0;
LABEL_87:
          self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded = v29 != 0;
          continue;
        case 4u:
          v33 = 0;
          v34 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
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
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_91:
          v65 = 8;
          goto LABEL_112;
        case 5u:
          v38 = 0;
          v39 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 0x20u;
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
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_95:
          v65 = 48;
          goto LABEL_112;
        case 6u:
          v43 = 0;
          v44 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 8u;
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
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_99:
          v65 = 32;
          goto LABEL_112;
        case 7u:
          v48 = 0;
          v49 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v50 = *v4;
            v51 = *(_QWORD *)((char *)a3 + v50);
            if (v51 == -1 || v51 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v51);
              *(_QWORD *)((char *)a3 + v50) = v51 + 1;
              v20 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                v15 = v49++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_103:
          v65 = 24;
          goto LABEL_112;
        case 8u:
          v53 = 0;
          v54 = 0;
          v55 = 0;
          *(_BYTE *)&self->_has |= 0x40u;
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
              v55 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                v15 = v54++ >= 9;
                if (v15)
                {
                  LODWORD(v55) = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v55) = 0;
LABEL_107:
          self->_operationType = v55;
          continue;
        case 9u:
          PBReaderReadString();
          v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v26 = 64;
LABEL_72:
          v59 = *(Class *)((char *)&self->super.super.isa + v26);
          *(Class *)((char *)&self->super.super.isa + v26) = v25;

          continue;
        case 0xAu:
          v60 = 0;
          v61 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 2u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v62 = *v4;
        v63 = *(_QWORD *)((char *)a3 + v62);
        if (v63 == -1 || v63 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v64 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v63);
        *(_QWORD *)((char *)a3 + v62) = v63 + 1;
        v20 |= (unint64_t)(v64 & 0x7F) << v60;
        if ((v64 & 0x80) == 0)
          goto LABEL_109;
        v60 += 7;
        v15 = v61++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_111;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_109:
      if (*((_BYTE *)a3 + *v6))
        v20 = 0;
LABEL_111:
      v65 = 16;
LABEL_112:
      *(Class *)((char *)&self->super.super.isa + v65) = (Class)v20;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  $14396B8FA49161770661C33F34ADEF04 has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_clipModelUUID)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt64Field();
    *(_BYTE *)&has = self->_has;
  }
LABEL_8:
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    *(_BYTE *)&has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_11;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $14396B8FA49161770661C33F34ADEF04 has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[5] = self->_timestamp;
    *((_BYTE *)v4 + 80) |= 0x10u;
  }
  v6 = v4;
  if (self->_clipModelUUID)
  {
    objc_msgSend(v4, "setClipModelUUID:");
    v4 = v6;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 76) = self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded;
  *((_BYTE *)v4 + 80) |= 0x80u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_7:
    v4[1] = self->_errorCode;
    *((_BYTE *)v4 + 80) |= 1u;
    *(_BYTE *)&has = self->_has;
  }
LABEL_8:
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    v4[6] = self->_totalClipDuration;
    *((_BYTE *)v4 + 80) |= 0x20u;
    *(_BYTE *)&has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_11;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_10;
  }
  v4[4] = self->_runTime;
  *((_BYTE *)v4 + 80) |= 8u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_20:
  v4[3] = self->_retryCount;
  *((_BYTE *)v4 + 80) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 18) = self->_operationType;
    *((_BYTE *)v4 + 80) |= 0x40u;
  }
LABEL_13:
  if (self->_errorDomain)
  {
    objc_msgSend(v6, "setErrorDomain:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_operationStartTime;
    *((_BYTE *)v4 + 80) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  $14396B8FA49161770661C33F34ADEF04 has;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_timestamp;
    *(_BYTE *)(v5 + 80) |= 0x10u;
  }
  v7 = -[NSString copyWithZone:](self->_clipModelUUID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v7;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 76) = self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded;
  *(_BYTE *)(v6 + 80) |= 0x80u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_5:
    *(_QWORD *)(v6 + 8) = self->_errorCode;
    *(_BYTE *)(v6 + 80) |= 1u;
    *(_BYTE *)&has = self->_has;
  }
LABEL_6:
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_totalClipDuration;
    *(_BYTE *)(v6 + 80) |= 0x20u;
    *(_BYTE *)&has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_8;
  }
  *(_QWORD *)(v6 + 32) = self->_runTime;
  *(_BYTE *)(v6 + 80) |= 8u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_16:
  *(_QWORD *)(v6 + 24) = self->_retryCount;
  *(_BYTE *)(v6 + 80) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 72) = self->_operationType;
    *(_BYTE *)(v6 + 80) |= 0x40u;
  }
LABEL_11:
  v10 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_operationStartTime;
    *(_BYTE *)(v6 + 80) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *clipModelUUID;
  NSString *errorDomain;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 80);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) == 0 || self->_timestamp != *((_QWORD *)v4 + 5))
      goto LABEL_50;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_50;
  }
  clipModelUUID = self->_clipModelUUID;
  if ((unint64_t)clipModelUUID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](clipModelUUID, "isEqual:"))
      goto LABEL_50;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 80);
  }
  if (has < 0)
  {
    if ((v6 & 0x80) == 0)
      goto LABEL_50;
    if (self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_50;
    }
  }
  else if (v6 < 0)
  {
    goto LABEL_50;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 1))
      goto LABEL_50;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_50;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_totalClipDuration != *((_QWORD *)v4 + 6))
      goto LABEL_50;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_50;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_runTime != *((_QWORD *)v4 + 4))
      goto LABEL_50;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_50;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_retryCount != *((_QWORD *)v4 + 3))
      goto LABEL_50;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_50;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_operationType != *((_DWORD *)v4 + 18))
      goto LABEL_50;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_50;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 8))
  {
    if (-[NSString isEqual:](errorDomain, "isEqual:"))
    {
      has = (char)self->_has;
      v6 = *((_BYTE *)v4 + 80);
      goto LABEL_46;
    }
LABEL_50:
    v9 = 0;
    goto LABEL_51;
  }
LABEL_46:
  v9 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_operationStartTime != *((_QWORD *)v4 + 2))
      goto LABEL_50;
    v9 = 1;
  }
LABEL_51:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  unint64_t v13;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v13 = 2654435761u * self->_timestamp;
  else
    v13 = 0;
  v3 = -[NSString hash](self->_clipModelUUID, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    v4 = 2654435761 * self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded;
    if ((*(_BYTE *)&self->_has & 1) == 0)
    {
LABEL_6:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_6;
  }
  v5 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v6 = 2654435761u * self->_totalClipDuration;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    v7 = 2654435761u * self->_runTime;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_15:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_10;
    goto LABEL_16;
  }
LABEL_14:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_9:
  v8 = 2654435761u * self->_retryCount;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    v9 = 2654435761 * self->_operationType;
    goto LABEL_17;
  }
LABEL_16:
  v9 = 0;
LABEL_17:
  v10 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761u * self->_operationStartTime;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  int v5;
  char *v6;

  v4 = (char *)a3;
  if ((v4[80] & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[AWDHomeKitCameraRecordingUploadOperation setClipModelUUID:](self, "setClipModelUUID:");
    v4 = v6;
  }
  v5 = v4[80];
  if ((v5 & 0x80000000) == 0)
  {
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded = v4[76];
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v5) = v4[80];
  if ((v5 & 1) != 0)
  {
LABEL_7:
    self->_errorCode = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    LOBYTE(v5) = v4[80];
  }
LABEL_8:
  if ((v5 & 0x20) != 0)
  {
    self->_totalClipDuration = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
    LOBYTE(v5) = v4[80];
    if ((v5 & 8) == 0)
    {
LABEL_10:
      if ((v5 & 4) == 0)
        goto LABEL_11;
      goto LABEL_20;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_10;
  }
  self->_runTime = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  LOBYTE(v5) = v4[80];
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_20:
  self->_retryCount = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((v4[80] & 0x40) != 0)
  {
LABEL_12:
    self->_operationType = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 8))
  {
    -[AWDHomeKitCameraRecordingUploadOperation setErrorDomain:](self, "setErrorDomain:");
    v4 = v6;
  }
  if ((v4[80] & 2) != 0)
  {
    self->_operationStartTime = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)clipModelUUID
{
  return self->_clipModelUUID;
}

- (void)setClipModelUUID:(id)a3
{
  objc_storeStrong((id *)&self->_clipModelUUID, a3);
}

- (BOOL)didCausePreviousClipToFinalizeBecauseMaxDurationExceeded
{
  return self->_didCausePreviousClipToFinalizeBecauseMaxDurationExceeded;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (unint64_t)totalClipDuration
{
  return self->_totalClipDuration;
}

- (unint64_t)runTime
{
  return self->_runTime;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (unint64_t)operationStartTime
{
  return self->_operationStartTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_clipModelUUID, 0);
}

@end
