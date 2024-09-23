@implementation CKDPShareUsage

- (int)version
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_version;
  else
    return 1;
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasUserIdentifier
{
  return self->_userIdentifier != 0;
}

- (BOOL)hasShareIdentifier
{
  return self->_shareIdentifier != 0;
}

- (BOOL)hasParticipantHandle
{
  return self->_participantHandle != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPShareUsage;
  -[CKDPShareUsage description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  CKDPDate *time;
  void *v10;
  const char *v11;
  CKDPIdentifier *deviceIdentifier;
  void *v13;
  const char *v14;
  CKDPIdentifier *userIdentifier;
  void *v16;
  const char *v17;
  CKDPShareIdentifier *shareIdentifier;
  void *v19;
  const char *v20;
  NSString *participantHandle;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_version);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, CFSTR("version"));

  }
  time = self->_time;
  if (time)
  {
    objc_msgSend_dictionaryRepresentation(time, v4, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("time"));

  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(deviceIdentifier, v4, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("deviceIdentifier"));

  }
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(userIdentifier, v4, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("userIdentifier"));

  }
  shareIdentifier = self->_shareIdentifier;
  if (shareIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(shareIdentifier, v4, v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, CFSTR("shareIdentifier"));

  }
  participantHandle = self->_participantHandle;
  if (participantHandle)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)participantHandle, CFSTR("participantHandle"));
  return v6;
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
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  CKDPShareIdentifier *v25;
  uint64_t v26;
  NSString *v27;
  NSString *participantHandle;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
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
              goto LABEL_41;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_43;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_41:
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v20) = 0;
LABEL_43:
          self->_version = v20;
          goto LABEL_44;
        case 2u:
          v25 = (CKDPShareIdentifier *)objc_alloc_init(MEMORY[0x1E0C94C60]);
          objc_storeStrong((id *)&self->_time, v25);
          if (!PBReaderPlaceMark() || (CKDPDateReadFrom() & 1) == 0)
            goto LABEL_46;
          goto LABEL_38;
        case 3u:
          v25 = (CKDPShareIdentifier *)objc_alloc_init(MEMORY[0x1E0C94C70]);
          v26 = 8;
          goto LABEL_33;
        case 4u:
          v25 = (CKDPShareIdentifier *)objc_alloc_init(MEMORY[0x1E0C94C70]);
          v26 = 40;
LABEL_33:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v26), v25);
          if (!PBReaderPlaceMark() || (CKDPIdentifierReadFrom() & 1) == 0)
            goto LABEL_46;
          goto LABEL_38;
        case 5u:
          v25 = objc_alloc_init(CKDPShareIdentifier);
          objc_storeStrong((id *)&self->_shareIdentifier, v25);
          if (!PBReaderPlaceMark() || !CKDPShareIdentifierReadFrom((uint64_t)v25, (uint64_t)a3))
          {
LABEL_46:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_38:
          PBReaderRecallMark();

LABEL_44:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_45;
          break;
        case 6u:
          PBReaderReadString();
          v27 = (NSString *)objc_claimAutoreleasedReturnValue();
          participantHandle = self->_participantHandle;
          self->_participantHandle = v27;

          goto LABEL_44;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_44;
      }
    }
  }
LABEL_45:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_time)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deviceIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_participantHandle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  CKDPDate *time;
  CKDPIdentifier *deviceIdentifier;
  CKDPIdentifier *userIdentifier;
  CKDPShareIdentifier *shareIdentifier;
  NSString *participantHandle;
  _DWORD *v11;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_version;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  time = self->_time;
  v11 = v4;
  if (time)
  {
    objc_msgSend_setTime_(v4, v5, (uint64_t)time);
    v4 = v11;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    objc_msgSend_setDeviceIdentifier_(v11, v5, (uint64_t)deviceIdentifier);
    v4 = v11;
  }
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
  {
    objc_msgSend_setUserIdentifier_(v11, v5, (uint64_t)userIdentifier);
    v4 = v11;
  }
  shareIdentifier = self->_shareIdentifier;
  if (shareIdentifier)
  {
    objc_msgSend_setShareIdentifier_(v11, v5, (uint64_t)shareIdentifier);
    v4 = v11;
  }
  participantHandle = self->_participantHandle;
  if (participantHandle)
  {
    objc_msgSend_setParticipantHandle_(v11, v5, (uint64_t)participantHandle);
    v4 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 48) = self->_version;
    *(_BYTE *)(v10 + 52) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_time, v11, (uint64_t)a3);
  v14 = (void *)v12[4];
  v12[4] = v13;

  v16 = objc_msgSend_copyWithZone_(self->_deviceIdentifier, v15, (uint64_t)a3);
  v17 = (void *)v12[1];
  v12[1] = v16;

  v19 = objc_msgSend_copyWithZone_(self->_userIdentifier, v18, (uint64_t)a3);
  v20 = (void *)v12[5];
  v12[5] = v19;

  v22 = objc_msgSend_copyWithZone_(self->_shareIdentifier, v21, (uint64_t)a3);
  v23 = (void *)v12[3];
  v12[3] = v22;

  v25 = objc_msgSend_copyWithZone_(self->_participantHandle, v24, (uint64_t)a3);
  v26 = (void *)v12[2];
  v12[2] = v25;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPDate *time;
  uint64_t v9;
  CKDPIdentifier *deviceIdentifier;
  uint64_t v11;
  CKDPIdentifier *userIdentifier;
  uint64_t v13;
  CKDPShareIdentifier *shareIdentifier;
  uint64_t v15;
  NSString *participantHandle;
  uint64_t v17;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_version != *((_DWORD *)v4 + 12))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_17:
    isEqual = 0;
    goto LABEL_18;
  }
  time = self->_time;
  v9 = v4[4];
  if ((unint64_t)time | v9 && !objc_msgSend_isEqual_(time, v7, v9))
    goto LABEL_17;
  deviceIdentifier = self->_deviceIdentifier;
  v11 = v4[1];
  if ((unint64_t)deviceIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(deviceIdentifier, v7, v11))
      goto LABEL_17;
  }
  userIdentifier = self->_userIdentifier;
  v13 = v4[5];
  if ((unint64_t)userIdentifier | v13)
  {
    if (!objc_msgSend_isEqual_(userIdentifier, v7, v13))
      goto LABEL_17;
  }
  shareIdentifier = self->_shareIdentifier;
  v15 = v4[3];
  if ((unint64_t)shareIdentifier | v15)
  {
    if (!objc_msgSend_isEqual_(shareIdentifier, v7, v15))
      goto LABEL_17;
  }
  participantHandle = self->_participantHandle;
  v17 = v4[2];
  if ((unint64_t)participantHandle | v17)
    isEqual = objc_msgSend_isEqual_(participantHandle, v7, v17);
  else
    isEqual = 1;
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_version;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_time, a2, v2) ^ v4;
  v8 = objc_msgSend_hash(self->_deviceIdentifier, v6, v7);
  v11 = v5 ^ v8 ^ objc_msgSend_hash(self->_userIdentifier, v9, v10);
  v14 = objc_msgSend_hash(self->_shareIdentifier, v12, v13);
  return v11 ^ v14 ^ objc_msgSend_hash(self->_participantHandle, v15, v16);
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  CKDPDate *time;
  uint64_t v7;
  CKDPIdentifier *deviceIdentifier;
  uint64_t v9;
  CKDPIdentifier *userIdentifier;
  uint64_t v11;
  CKDPShareIdentifier *shareIdentifier;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v4 = a3;
  v5 = v4;
  if ((v4[13] & 1) != 0)
  {
    self->_version = v4[12];
    *(_BYTE *)&self->_has |= 1u;
  }
  time = self->_time;
  v7 = v5[4];
  v15 = v5;
  if (time)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(time, (const char *)v5, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_setTime_(self, (const char *)v5, v7);
  }
  v5 = v15;
LABEL_9:
  deviceIdentifier = self->_deviceIdentifier;
  v9 = v5[1];
  if (deviceIdentifier)
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_mergeFrom_(deviceIdentifier, (const char *)v5, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_setDeviceIdentifier_(self, (const char *)v5, v9);
  }
  v5 = v15;
LABEL_15:
  userIdentifier = self->_userIdentifier;
  v11 = v5[5];
  if (userIdentifier)
  {
    if (!v11)
      goto LABEL_21;
    objc_msgSend_mergeFrom_(userIdentifier, (const char *)v5, v11);
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    objc_msgSend_setUserIdentifier_(self, (const char *)v5, v11);
  }
  v5 = v15;
LABEL_21:
  shareIdentifier = self->_shareIdentifier;
  v13 = v5[3];
  if (shareIdentifier)
  {
    if (!v13)
      goto LABEL_27;
    objc_msgSend_mergeFrom_(shareIdentifier, (const char *)v5, v13);
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    objc_msgSend_setShareIdentifier_(self, (const char *)v5, v13);
  }
  v5 = v15;
LABEL_27:
  v14 = v5[2];
  if (v14)
  {
    objc_msgSend_setParticipantHandle_(self, (const char *)v5, v14);
    v5 = v15;
  }

}

- (CKDPDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (CKDPIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (CKDPIdentifier)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentifier, a3);
}

- (CKDPShareIdentifier)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shareIdentifier, a3);
}

- (NSString)participantHandle
{
  return self->_participantHandle;
}

- (void)setParticipantHandle:(id)a3
{
  objc_storeStrong((id *)&self->_participantHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
  objc_storeStrong((id *)&self->_participantHandle, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
