@implementation AWDHomeKitPresenceReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)authStatus
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_authStatus;
  else
    return 0;
}

- (void)setAuthStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_authStatus = a3;
}

- (void)setHasAuthStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAuthStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)authStatusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E89A5780[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAuthStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceAuthorizationStatusNotDetermined")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceAuthorizationStatusAuthorized")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceAuthorizationStatusDenied")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)computeStatus
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_computeStatus;
  else
    return 0;
}

- (void)setComputeStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_computeStatus = a3;
}

- (void)setHasComputeStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasComputeStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)computeStatusAsString:(int)a3
{
  if (a3 < 5)
    return off_1E89A5798[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsComputeStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceComputeStatusNotDetermined")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceComputeStatusNoPresenceAuthorization")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceComputeStatusNoLocationAuthorization")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceComputeStatusNoFMFDevice")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceComputeStatusEnabled")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)reason
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_reason;
  else
    return 2;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReason
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)reasonAsString:(int)a3
{
  if ((a3 - 2) < 9)
    return off_1E89A57C0[a3 - 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusChange")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusReportInitial")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusReportFMFChanged")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusReportLocationAuthChanged")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusReportRetry")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusReportPeriodicUpdate")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusReportResidentChange")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusReportPresenceAuthChanged")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitUserPresenceUpdateReasonStatusReportAccountStatusChanged")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (int)direction
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_direction;
  else
    return 1;
}

- (void)setDirection:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDirection
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)directionAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("HomeKitPresenceReportDirectionSend");
  if (a3 == 2)
  {
    v3 = CFSTR("HomeKitPresenceReportDirectionReceive");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitPresenceReportDirectionSend")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitPresenceReportDirectionReceive")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setResultErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_resultErrorCode = a3;
}

- (void)setHasResultErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasResultErrorCode
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)AWDHomeKitPresenceReport;
  -[AWDHomeKitPresenceReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitPresenceReport dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  uint64_t authStatus;
  __CFString *v9;
  uint64_t computeStatus;
  __CFString *v11;
  unsigned int v12;
  __CFString *v13;
  int direction;
  __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  authStatus = self->_authStatus;
  if (authStatus >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_authStatus);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E89A5780[authStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("authStatus"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_14:
  computeStatus = self->_computeStatus;
  if (computeStatus >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_computeStatus);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E89A5798[computeStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("computeStatus"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_22:
    direction = self->_direction;
    if (direction == 1)
    {
      v15 = CFSTR("HomeKitPresenceReportDirectionSend");
    }
    else if (direction == 2)
    {
      v15 = CFSTR("HomeKitPresenceReportDirectionReceive");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_direction);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("direction"));

    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    return v3;
  }
LABEL_18:
  v12 = self->_reason - 2;
  if (v12 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reason);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E89A57C0[v12];
  }
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("reason"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_22;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_resultErrorCode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("resultErrorCode"));

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
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;

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
          *(_BYTE *)&self->_has |= 1u;
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
              goto LABEL_64;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_66;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_64:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_66:
          self->_timestamp = v20;
          continue;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v28 = *v4;
            v29 = *(_QWORD *)((char *)a3 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v29);
              *(_QWORD *)((char *)a3 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_70:
          v51 = 16;
          goto LABEL_87;
        case 3u:
          v31 = 0;
          v32 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v33 = *v4;
            v34 = *(_QWORD *)((char *)a3 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v34);
              *(_QWORD *)((char *)a3 + v33) = v34 + 1;
              v27 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_74:
          v51 = 20;
          goto LABEL_87;
        case 4u:
          v36 = 0;
          v37 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
          while (2)
          {
            v38 = *v4;
            v39 = *(_QWORD *)((char *)a3 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v39);
              *(_QWORD *)((char *)a3 + v38) = v39 + 1;
              v27 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v15 = v37++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_78:
          v51 = 28;
          goto LABEL_87;
        case 5u:
          v41 = 0;
          v42 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v43 = *v4;
            v44 = *(_QWORD *)((char *)a3 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v44);
              *(_QWORD *)((char *)a3 + v43) = v44 + 1;
              v27 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v15 = v42++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_82:
          v51 = 24;
          goto LABEL_87;
        case 6u:
          v46 = 0;
          v47 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 0x20u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v48 = *v4;
        v49 = *(_QWORD *)((char *)a3 + v48);
        if (v49 == -1 || v49 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v50 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v49);
        *(_QWORD *)((char *)a3 + v48) = v49 + 1;
        v27 |= (unint64_t)(v50 & 0x7F) << v46;
        if ((v50 & 0x80) == 0)
          goto LABEL_84;
        v46 += 7;
        v15 = v47++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_86;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_84:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v27) = 0;
LABEL_86:
      v51 = 32;
LABEL_87:
      *(_DWORD *)((char *)&self->super.super.isa + v51) = v27;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_authStatus;
  *((_BYTE *)v4 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)v4 + 5) = self->_computeStatus;
  *((_BYTE *)v4 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    *((_DWORD *)v4 + 6) = self->_direction;
    *((_BYTE *)v4 + 36) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_DWORD *)v4 + 7) = self->_reason;
  *((_BYTE *)v4 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_resultErrorCode;
    *((_BYTE *)v4 + 36) |= 0x20u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_authStatus;
  *((_BYTE *)result + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_computeStatus;
  *((_BYTE *)result + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 7) = self->_reason;
  *((_BYTE *)result + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 6) = self->_direction;
  *((_BYTE *)result + 36) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 8) = self->_resultErrorCode;
  *((_BYTE *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_authStatus != *((_DWORD *)v4 + 4))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_computeStatus != *((_DWORD *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_reason != *((_DWORD *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_direction != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 36) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0 || self->_resultErrorCode != *((_DWORD *)v4 + 8))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_authStatus;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_computeStatus;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_reason;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_direction;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_resultErrorCode;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_authStatus = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_computeStatus = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
LABEL_13:
    self->_direction = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_reason = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    self->_resultErrorCode = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_8:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)resultErrorCode
{
  return self->_resultErrorCode;
}

@end
