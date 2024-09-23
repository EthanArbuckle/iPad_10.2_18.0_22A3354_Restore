@implementation AWDHomeKitCameraSnapshot

- (BOOL)hasVendorDetails
{
  return self->_vendorDetails != 0;
}

- (int)certified
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_certified;
  else
    return 0;
}

- (void)setCertified:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_certified = a3;
}

- (void)setHasCertified:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCertified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)certifiedAsString:(int)a3
{
  if (a3 < 3)
    return off_24E7821F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCertified:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_NotCertified")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_Certified")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsLocal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isLocal = a3;
}

- (void)setHasIsLocal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsLocal
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setForNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_forNotification = a3;
}

- (void)setHasForNotification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasForNotification
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasIdsSessionSetup
{
  return self->_idsSessionSetup != 0;
}

- (void)setSentSnapshotRequestToAccessory:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sentSnapshotRequestToAccessory = a3;
}

- (void)setHasSentSnapshotRequestToAccessory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSentSnapshotRequestToAccessory
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setReceivedSnapshotFromAccessory:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_receivedSnapshotFromAccessory = a3;
}

- (void)setHasReceivedSnapshotFromAccessory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReceivedSnapshotFromAccessory
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasWatchMessaging
{
  return self->_watchMessaging != 0;
}

- (BOOL)hasControllerMessaging
{
  return self->_controllerMessaging != 0;
}

- (BOOL)hasResidentMessaging
{
  return self->_residentMessaging != 0;
}

- (BOOL)hasResidentToPhone
{
  return self->_residentToPhone != 0;
}

- (BOOL)hasPhoneToWatch
{
  return self->_phoneToWatch != 0;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return self->_underlyingErrorDomain != 0;
}

- (void)setUnderlyingErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_underlyingErrorCode = a3;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUnderlyingErrorCode
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitCameraSnapshot;
  -[AWDHomeKitCameraSnapshot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraSnapshot dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDHomeKitVendorInformation *vendorDetails;
  void *v5;
  char has;
  uint64_t certified;
  __CFString *v8;
  void *v9;
  NSString *sessionID;
  char v11;
  void *v12;
  AWDHomeKitCameraIDSSessionSetup *idsSessionSetup;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  AWDHomeKitCameraSnapshotMessaging *watchMessaging;
  void *v19;
  AWDHomeKitCameraSnapshotMessaging *controllerMessaging;
  void *v21;
  AWDHomeKitCameraSnapshotMessaging *residentMessaging;
  void *v23;
  AWDHomeKitCameraSnapshotIDSTransfer *residentToPhone;
  void *v25;
  AWDHomeKitCameraSnapshotIDSTransfer *phoneToWatch;
  void *v27;
  NSString *underlyingErrorDomain;
  void *v29;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  vendorDetails = self->_vendorDetails;
  if (vendorDetails)
  {
    -[AWDHomeKitVendorInformation dictionaryRepresentation](vendorDetails, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("vendorDetails"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    certified = self->_certified;
    if (certified >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_certified);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_24E7821F8[certified];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("certified"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_errorCode);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("errorCode"));

    v11 = (char)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_14:
      if ((v11 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLocal);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("isLocal"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_forNotification);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("forNotification"));

  }
LABEL_16:
  idsSessionSetup = self->_idsSessionSetup;
  if (idsSessionSetup)
  {
    -[AWDHomeKitCameraIDSSessionSetup dictionaryRepresentation](idsSessionSetup, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("idsSessionSetup"));

  }
  v15 = (char)self->_has;
  if ((v15 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sentSnapshotRequestToAccessory);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("sentSnapshotRequestToAccessory"));

    v15 = (char)self->_has;
  }
  if ((v15 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_receivedSnapshotFromAccessory);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("receivedSnapshotFromAccessory"));

  }
  watchMessaging = self->_watchMessaging;
  if (watchMessaging)
  {
    -[AWDHomeKitCameraSnapshotMessaging dictionaryRepresentation](watchMessaging, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("watchMessaging"));

  }
  controllerMessaging = self->_controllerMessaging;
  if (controllerMessaging)
  {
    -[AWDHomeKitCameraSnapshotMessaging dictionaryRepresentation](controllerMessaging, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("controllerMessaging"));

  }
  residentMessaging = self->_residentMessaging;
  if (residentMessaging)
  {
    -[AWDHomeKitCameraSnapshotMessaging dictionaryRepresentation](residentMessaging, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("residentMessaging"));

  }
  residentToPhone = self->_residentToPhone;
  if (residentToPhone)
  {
    -[AWDHomeKitCameraSnapshotIDSTransfer dictionaryRepresentation](residentToPhone, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("residentToPhone"));

  }
  phoneToWatch = self->_phoneToWatch;
  if (phoneToWatch)
  {
    -[AWDHomeKitCameraSnapshotIDSTransfer dictionaryRepresentation](phoneToWatch, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("phoneToWatch"));

  }
  underlyingErrorDomain = self->_underlyingErrorDomain;
  if (underlyingErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", underlyingErrorDomain, CFSTR("underlyingErrorDomain"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_underlyingErrorCode);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("underlyingErrorCode"));

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
  uint64_t v34;
  unint64_t v35;
  char v36;
  objc_class *v37;
  uint64_t v38;
  AWDHomeKitVendorInformation *v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
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
  uint64_t v69;
  BOOL v70;
  uint64_t v71;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
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
              goto LABEL_98;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_100;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_98:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_100:
          self->_timestamp = v20;
          goto LABEL_131;
        case 4u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 4u;
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
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_104:
          v69 = 32;
          goto LABEL_130;
        case 6u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)&self->_has |= 0x80u;
          while (2)
          {
            v34 = *v4;
            v35 = *(_QWORD *)((char *)a3 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v35);
              *(_QWORD *)((char *)a3 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  v33 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v33 = 0;
LABEL_108:
          v70 = v33 != 0;
          v71 = 129;
          goto LABEL_113;
        case 9u:
          PBReaderReadString();
          v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v38 = 88;
          goto LABEL_82;
        case 0xAu:
          v39 = objc_alloc_init(AWDHomeKitVendorInformation);
          objc_storeStrong((id *)&self->_vendorDetails, v39);
          if (!PBReaderPlaceMark() || !AWDHomeKitVendorInformationReadFrom((uint64_t)v39, (uint64_t)a3))
            goto LABEL_133;
          goto LABEL_80;
        case 0xBu:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          *(_BYTE *)&self->_has |= 0x40u;
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
              v42 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                v15 = v41++ >= 9;
                if (v15)
                {
                  v42 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v42 = 0;
LABEL_112:
          v70 = v42 != 0;
          v71 = 128;
LABEL_113:
          *((_BYTE *)&self->super.super.isa + v71) = v70;
          goto LABEL_131;
        case 0xCu:
          v39 = objc_alloc_init(AWDHomeKitCameraIDSSessionSetup);
          objc_storeStrong((id *)&self->_idsSessionSetup, v39);
          if (!PBReaderPlaceMark() || !AWDHomeKitCameraIDSSessionSetupReadFrom((uint64_t)v39, (uint64_t)a3))
            goto LABEL_133;
          goto LABEL_80;
        case 0xDu:
          v46 = 0;
          v47 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
          while (2)
          {
            v48 = *v4;
            v49 = *(_QWORD *)((char *)a3 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v49);
              *(_QWORD *)((char *)a3 + v48) = v49 + 1;
              v27 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                v15 = v47++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_117:
          v69 = 80;
          goto LABEL_130;
        case 0xEu:
          v51 = 0;
          v52 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v53 = *v4;
            v54 = *(_QWORD *)((char *)a3 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v54);
              *(_QWORD *)((char *)a3 + v53) = v54 + 1;
              v27 |= (unint64_t)(v55 & 0x7F) << v51;
              if (v55 < 0)
              {
                v51 += 7;
                v15 = v52++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_121:
          v69 = 56;
          goto LABEL_130;
        case 0xFu:
          v39 = objc_alloc_init(AWDHomeKitCameraSnapshotMessaging);
          v56 = 120;
          goto LABEL_73;
        case 0x10u:
          v39 = objc_alloc_init(AWDHomeKitCameraSnapshotMessaging);
          v56 = 24;
          goto LABEL_73;
        case 0x11u:
          v39 = objc_alloc_init(AWDHomeKitCameraSnapshotMessaging);
          v56 = 64;
LABEL_73:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v56), v39);
          if (!PBReaderPlaceMark()
            || !AWDHomeKitCameraSnapshotMessagingReadFrom((uint64_t)v39, (uint64_t)a3))
          {
            goto LABEL_133;
          }
          goto LABEL_80;
        case 0x12u:
          v39 = objc_alloc_init(AWDHomeKitCameraSnapshotIDSTransfer);
          v57 = 72;
          goto LABEL_78;
        case 0x13u:
          v39 = objc_alloc_init(AWDHomeKitCameraSnapshotIDSTransfer);
          v57 = 48;
LABEL_78:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v57), v39);
          if (!PBReaderPlaceMark()
            || !AWDHomeKitCameraSnapshotIDSTransferReadFrom((uint64_t)v39, (uint64_t)a3))
          {
LABEL_133:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_80:
          PBReaderRecallMark();

LABEL_131:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_132;
          break;
        case 0x14u:
          PBReaderReadString();
          v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v38 = 104;
LABEL_82:
          v58 = *(Class *)((char *)&self->super.super.isa + v38);
          *(Class *)((char *)&self->super.super.isa + v38) = v37;

          goto LABEL_131;
        case 0x15u:
          v59 = 0;
          v60 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 0x20u;
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
              v27 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                v15 = v60++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_125:
          v69 = 96;
          goto LABEL_130;
        case 0x16u:
          v64 = 0;
          v65 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 2u;
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
              v27 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                v15 = v65++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_129:
          v69 = 16;
LABEL_130:
          *(_DWORD *)((char *)&self->super.super.isa + v69) = v27;
          goto LABEL_131;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_131;
      }
    }
  }
LABEL_132:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  char v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_34:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_4;
    goto LABEL_35;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_34;
LABEL_3:
  if ((has & 0x80) == 0)
    goto LABEL_4;
LABEL_35:
  PBDataWriterWriteBOOLField();
LABEL_4:
  if (self->_sessionID)
    PBDataWriterWriteStringField();
  if (self->_vendorDetails)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_idsSessionSetup)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 8) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_watchMessaging)
    PBDataWriterWriteSubmessage();
  if (self->_controllerMessaging)
    PBDataWriterWriteSubmessage();
  if (self->_residentMessaging)
    PBDataWriterWriteSubmessage();
  if (self->_residentToPhone)
    PBDataWriterWriteSubmessage();
  if (self->_phoneToWatch)
    PBDataWriterWriteSubmessage();
  if (self->_underlyingErrorDomain)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  char v7;
  _DWORD *v8;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_34:
    v4[8] = self->_errorCode;
    *((_BYTE *)v4 + 132) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_4;
    goto LABEL_35;
  }
  *((_QWORD *)v4 + 1) = self->_timestamp;
  *((_BYTE *)v4 + 132) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_34;
LABEL_3:
  if ((has & 0x80) == 0)
    goto LABEL_4;
LABEL_35:
  *((_BYTE *)v4 + 129) = self->_isLocal;
  *((_BYTE *)v4 + 132) |= 0x80u;
LABEL_4:
  v8 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v8;
  }
  if (self->_vendorDetails)
  {
    objc_msgSend(v8, "setVendorDetails:");
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_BYTE *)v4 + 128) = self->_forNotification;
    *((_BYTE *)v4 + 132) |= 0x40u;
  }
  if (self->_idsSessionSetup)
  {
    objc_msgSend(v8, "setIdsSessionSetup:");
    v4 = v8;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    v4[20] = self->_sentSnapshotRequestToAccessory;
    *((_BYTE *)v4 + 132) |= 0x10u;
    v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
  {
    v4[14] = self->_receivedSnapshotFromAccessory;
    *((_BYTE *)v4 + 132) |= 8u;
  }
  if (self->_watchMessaging)
  {
    objc_msgSend(v8, "setWatchMessaging:");
    v4 = v8;
  }
  if (self->_controllerMessaging)
  {
    objc_msgSend(v8, "setControllerMessaging:");
    v4 = v8;
  }
  if (self->_residentMessaging)
  {
    objc_msgSend(v8, "setResidentMessaging:");
    v4 = v8;
  }
  if (self->_residentToPhone)
  {
    objc_msgSend(v8, "setResidentToPhone:");
    v4 = v8;
  }
  if (self->_phoneToWatch)
  {
    objc_msgSend(v8, "setPhoneToWatch:");
    v4 = v8;
  }
  if (self->_underlyingErrorDomain)
  {
    objc_msgSend(v8, "setUnderlyingErrorDomain:");
    v4 = v8;
  }
  v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    v4[24] = self->_underlyingErrorCode;
    *((_BYTE *)v4 + 132) |= 0x20u;
    v7 = (char)self->_has;
  }
  if ((v7 & 2) != 0)
  {
    v4[4] = self->_certified;
    *((_BYTE *)v4 + 132) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_16:
    *(_DWORD *)(v5 + 32) = self->_errorCode;
    *(_BYTE *)(v5 + 132) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_4;
    goto LABEL_17;
  }
  *(_QWORD *)(v5 + 8) = self->_timestamp;
  *(_BYTE *)(v5 + 132) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_16;
LABEL_3:
  if ((has & 0x80) == 0)
    goto LABEL_4;
LABEL_17:
  *(_BYTE *)(v5 + 129) = self->_isLocal;
  *(_BYTE *)(v5 + 132) |= 0x80u;
LABEL_4:
  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v8;

  v10 = -[AWDHomeKitVendorInformation copyWithZone:](self->_vendorDetails, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v10;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 128) = self->_forNotification;
    *(_BYTE *)(v6 + 132) |= 0x40u;
  }
  v12 = -[AWDHomeKitCameraIDSSessionSetup copyWithZone:](self->_idsSessionSetup, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v12;

  v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_sentSnapshotRequestToAccessory;
    *(_BYTE *)(v6 + 132) |= 0x10u;
    v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_receivedSnapshotFromAccessory;
    *(_BYTE *)(v6 + 132) |= 8u;
  }
  v15 = -[AWDHomeKitCameraSnapshotMessaging copyWithZone:](self->_watchMessaging, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v15;

  v17 = -[AWDHomeKitCameraSnapshotMessaging copyWithZone:](self->_controllerMessaging, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v17;

  v19 = -[AWDHomeKitCameraSnapshotMessaging copyWithZone:](self->_residentMessaging, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v19;

  v21 = -[AWDHomeKitCameraSnapshotIDSTransfer copyWithZone:](self->_residentToPhone, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v21;

  v23 = -[AWDHomeKitCameraSnapshotIDSTransfer copyWithZone:](self->_phoneToWatch, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v23;

  v25 = -[NSString copyWithZone:](self->_underlyingErrorDomain, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v25;

  v27 = (char)self->_has;
  if ((v27 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_underlyingErrorCode;
    *(_BYTE *)(v6 + 132) |= 0x20u;
    v27 = (char)self->_has;
  }
  if ((v27 & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_certified;
    *(_BYTE *)(v6 + 132) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionID;
  AWDHomeKitVendorInformation *vendorDetails;
  char has;
  char v8;
  AWDHomeKitCameraIDSSessionSetup *idsSessionSetup;
  AWDHomeKitCameraSnapshotMessaging *watchMessaging;
  AWDHomeKitCameraSnapshotMessaging *controllerMessaging;
  AWDHomeKitCameraSnapshotMessaging *residentMessaging;
  AWDHomeKitCameraSnapshotIDSTransfer *residentToPhone;
  AWDHomeKitCameraSnapshotIDSTransfer *phoneToWatch;
  NSString *underlyingErrorDomain;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 132) & 1) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 4) == 0 || self->_errorCode != *((_DWORD *)v4 + 8))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 132) & 4) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 0x80) == 0)
      goto LABEL_67;
    if (self->_isLocal)
    {
      if (!*((_BYTE *)v4 + 129))
        goto LABEL_67;
    }
    else if (*((_BYTE *)v4 + 129))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_BYTE *)v4 + 132) & 0x80) != 0)
  {
    goto LABEL_67;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](sessionID, "isEqual:"))
    goto LABEL_67;
  vendorDetails = self->_vendorDetails;
  if ((unint64_t)vendorDetails | *((_QWORD *)v4 + 14))
  {
    if (!-[AWDHomeKitVendorInformation isEqual:](vendorDetails, "isEqual:"))
      goto LABEL_67;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 132);
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 0x40) == 0)
      goto LABEL_67;
    if (self->_forNotification)
    {
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_67;
    }
    else if (*((_BYTE *)v4 + 128))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_BYTE *)v4 + 132) & 0x40) != 0)
  {
    goto LABEL_67;
  }
  idsSessionSetup = self->_idsSessionSetup;
  if (!((unint64_t)idsSessionSetup | *((_QWORD *)v4 + 5)))
    goto LABEL_35;
  if (!-[AWDHomeKitCameraIDSSessionSetup isEqual:](idsSessionSetup, "isEqual:"))
  {
LABEL_67:
    v16 = 0;
    goto LABEL_68;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 132);
LABEL_35:
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_sentSnapshotRequestToAccessory != *((_DWORD *)v4 + 20))
      goto LABEL_67;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_receivedSnapshotFromAccessory != *((_DWORD *)v4 + 14))
      goto LABEL_67;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_67;
  }
  watchMessaging = self->_watchMessaging;
  if ((unint64_t)watchMessaging | *((_QWORD *)v4 + 15)
    && !-[AWDHomeKitCameraSnapshotMessaging isEqual:](watchMessaging, "isEqual:"))
  {
    goto LABEL_67;
  }
  controllerMessaging = self->_controllerMessaging;
  if ((unint64_t)controllerMessaging | *((_QWORD *)v4 + 3))
  {
    if (!-[AWDHomeKitCameraSnapshotMessaging isEqual:](controllerMessaging, "isEqual:"))
      goto LABEL_67;
  }
  residentMessaging = self->_residentMessaging;
  if ((unint64_t)residentMessaging | *((_QWORD *)v4 + 8))
  {
    if (!-[AWDHomeKitCameraSnapshotMessaging isEqual:](residentMessaging, "isEqual:"))
      goto LABEL_67;
  }
  residentToPhone = self->_residentToPhone;
  if ((unint64_t)residentToPhone | *((_QWORD *)v4 + 9))
  {
    if (!-[AWDHomeKitCameraSnapshotIDSTransfer isEqual:](residentToPhone, "isEqual:"))
      goto LABEL_67;
  }
  phoneToWatch = self->_phoneToWatch;
  if ((unint64_t)phoneToWatch | *((_QWORD *)v4 + 6))
  {
    if (!-[AWDHomeKitCameraSnapshotIDSTransfer isEqual:](phoneToWatch, "isEqual:"))
      goto LABEL_67;
  }
  underlyingErrorDomain = self->_underlyingErrorDomain;
  if ((unint64_t)underlyingErrorDomain | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](underlyingErrorDomain, "isEqual:"))
      goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 0x20) == 0 || self->_underlyingErrorCode != *((_DWORD *)v4 + 24))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 132) & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 2) == 0 || self->_certified != *((_DWORD *)v4 + 4))
      goto LABEL_67;
    v16 = 1;
  }
  else
  {
    v16 = (*((_BYTE *)v4 + 132) & 2) == 0;
  }
LABEL_68:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSUInteger v23;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v20 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v20 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v19 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    v3 = 2654435761 * self->_isLocal;
    goto LABEL_8;
  }
LABEL_7:
  v3 = 0;
LABEL_8:
  v4 = -[NSString hash](self->_sessionID, "hash");
  v22 = -[AWDHomeKitVendorInformation hash](self->_vendorDetails, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v18 = 2654435761 * self->_forNotification;
  else
    v18 = 0;
  v5 = -[AWDHomeKitCameraIDSSessionSetup hash](self->_idsSessionSetup, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v6 = 2654435761 * self->_sentSnapshotRequestToAccessory;
  else
    v6 = 0;
  v23 = v4;
  v21 = v6;
  v7 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v8 = 2654435761 * self->_receivedSnapshotFromAccessory;
  else
    v8 = 0;
  v9 = -[AWDHomeKitCameraSnapshotMessaging hash](self->_watchMessaging, "hash");
  v10 = -[AWDHomeKitCameraSnapshotMessaging hash](self->_controllerMessaging, "hash");
  v11 = -[AWDHomeKitCameraSnapshotMessaging hash](self->_residentMessaging, "hash");
  v12 = -[AWDHomeKitCameraSnapshotIDSTransfer hash](self->_residentToPhone, "hash");
  v13 = -[AWDHomeKitCameraSnapshotIDSTransfer hash](self->_phoneToWatch, "hash");
  v14 = -[NSString hash](self->_underlyingErrorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v15 = 2654435761 * self->_underlyingErrorCode;
  else
    v15 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v16 = 2654435761 * self->_certified;
  else
    v16 = 0;
  return v19 ^ v20 ^ v3 ^ v23 ^ v22 ^ v18 ^ v7 ^ v21 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  AWDHomeKitVendorInformation *vendorDetails;
  uint64_t v8;
  AWDHomeKitCameraIDSSessionSetup *idsSessionSetup;
  uint64_t v10;
  char v11;
  AWDHomeKitCameraSnapshotMessaging *watchMessaging;
  uint64_t v13;
  AWDHomeKitCameraSnapshotMessaging *controllerMessaging;
  uint64_t v15;
  AWDHomeKitCameraSnapshotMessaging *residentMessaging;
  uint64_t v17;
  AWDHomeKitCameraSnapshotIDSTransfer *residentToPhone;
  uint64_t v19;
  AWDHomeKitCameraSnapshotIDSTransfer *phoneToWatch;
  uint64_t v21;
  char v22;
  id v23;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 132);
  if ((v6 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 132) & 4) == 0)
      goto LABEL_3;
LABEL_10:
    self->_errorCode = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 132) & 0x80) == 0)
      goto LABEL_4;
    goto LABEL_11;
  }
  self->_timestamp = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v6 = *((_BYTE *)v4 + 132);
  if ((v6 & 4) != 0)
    goto LABEL_10;
LABEL_3:
  if ((v6 & 0x80) == 0)
    goto LABEL_4;
LABEL_11:
  self->_isLocal = *((_BYTE *)v4 + 129);
  *(_BYTE *)&self->_has |= 0x80u;
LABEL_4:
  v23 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[AWDHomeKitCameraSnapshot setSessionID:](self, "setSessionID:");
    v5 = v23;
  }
  vendorDetails = self->_vendorDetails;
  v8 = *((_QWORD *)v5 + 14);
  if (vendorDetails)
  {
    if (!v8)
      goto LABEL_15;
    -[AWDHomeKitVendorInformation mergeFrom:](vendorDetails, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[AWDHomeKitCameraSnapshot setVendorDetails:](self, "setVendorDetails:");
  }
  v5 = v23;
LABEL_15:
  if ((*((_BYTE *)v5 + 132) & 0x40) != 0)
  {
    self->_forNotification = *((_BYTE *)v5 + 128);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  idsSessionSetup = self->_idsSessionSetup;
  v10 = *((_QWORD *)v5 + 5);
  if (idsSessionSetup)
  {
    if (!v10)
      goto LABEL_23;
    -[AWDHomeKitCameraIDSSessionSetup mergeFrom:](idsSessionSetup, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    -[AWDHomeKitCameraSnapshot setIdsSessionSetup:](self, "setIdsSessionSetup:");
  }
  v5 = v23;
LABEL_23:
  v11 = *((_BYTE *)v5 + 132);
  if ((v11 & 0x10) != 0)
  {
    self->_sentSnapshotRequestToAccessory = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 0x10u;
    v11 = *((_BYTE *)v5 + 132);
  }
  if ((v11 & 8) != 0)
  {
    self->_receivedSnapshotFromAccessory = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 8u;
  }
  watchMessaging = self->_watchMessaging;
  v13 = *((_QWORD *)v5 + 15);
  if (watchMessaging)
  {
    if (!v13)
      goto LABEL_33;
    -[AWDHomeKitCameraSnapshotMessaging mergeFrom:](watchMessaging, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_33;
    -[AWDHomeKitCameraSnapshot setWatchMessaging:](self, "setWatchMessaging:");
  }
  v5 = v23;
LABEL_33:
  controllerMessaging = self->_controllerMessaging;
  v15 = *((_QWORD *)v5 + 3);
  if (controllerMessaging)
  {
    if (!v15)
      goto LABEL_39;
    -[AWDHomeKitCameraSnapshotMessaging mergeFrom:](controllerMessaging, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_39;
    -[AWDHomeKitCameraSnapshot setControllerMessaging:](self, "setControllerMessaging:");
  }
  v5 = v23;
LABEL_39:
  residentMessaging = self->_residentMessaging;
  v17 = *((_QWORD *)v5 + 8);
  if (residentMessaging)
  {
    if (!v17)
      goto LABEL_45;
    -[AWDHomeKitCameraSnapshotMessaging mergeFrom:](residentMessaging, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_45;
    -[AWDHomeKitCameraSnapshot setResidentMessaging:](self, "setResidentMessaging:");
  }
  v5 = v23;
LABEL_45:
  residentToPhone = self->_residentToPhone;
  v19 = *((_QWORD *)v5 + 9);
  if (residentToPhone)
  {
    if (!v19)
      goto LABEL_51;
    -[AWDHomeKitCameraSnapshotIDSTransfer mergeFrom:](residentToPhone, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_51;
    -[AWDHomeKitCameraSnapshot setResidentToPhone:](self, "setResidentToPhone:");
  }
  v5 = v23;
LABEL_51:
  phoneToWatch = self->_phoneToWatch;
  v21 = *((_QWORD *)v5 + 6);
  if (phoneToWatch)
  {
    if (!v21)
      goto LABEL_57;
    -[AWDHomeKitCameraSnapshotIDSTransfer mergeFrom:](phoneToWatch, "mergeFrom:");
  }
  else
  {
    if (!v21)
      goto LABEL_57;
    -[AWDHomeKitCameraSnapshot setPhoneToWatch:](self, "setPhoneToWatch:");
  }
  v5 = v23;
LABEL_57:
  if (*((_QWORD *)v5 + 13))
  {
    -[AWDHomeKitCameraSnapshot setUnderlyingErrorDomain:](self, "setUnderlyingErrorDomain:");
    v5 = v23;
  }
  v22 = *((_BYTE *)v5 + 132);
  if ((v22 & 0x20) != 0)
  {
    self->_underlyingErrorCode = *((_DWORD *)v5 + 24);
    *(_BYTE *)&self->_has |= 0x20u;
    v22 = *((_BYTE *)v5 + 132);
  }
  if ((v22 & 2) != 0)
  {
    self->_certified = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (AWDHomeKitVendorInformation)vendorDetails
{
  return self->_vendorDetails;
}

- (void)setVendorDetails:(id)a3
{
  objc_storeStrong((id *)&self->_vendorDetails, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (BOOL)forNotification
{
  return self->_forNotification;
}

- (AWDHomeKitCameraIDSSessionSetup)idsSessionSetup
{
  return self->_idsSessionSetup;
}

- (void)setIdsSessionSetup:(id)a3
{
  objc_storeStrong((id *)&self->_idsSessionSetup, a3);
}

- (unsigned)sentSnapshotRequestToAccessory
{
  return self->_sentSnapshotRequestToAccessory;
}

- (unsigned)receivedSnapshotFromAccessory
{
  return self->_receivedSnapshotFromAccessory;
}

- (AWDHomeKitCameraSnapshotMessaging)watchMessaging
{
  return self->_watchMessaging;
}

- (void)setWatchMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_watchMessaging, a3);
}

- (AWDHomeKitCameraSnapshotMessaging)controllerMessaging
{
  return self->_controllerMessaging;
}

- (void)setControllerMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_controllerMessaging, a3);
}

- (AWDHomeKitCameraSnapshotMessaging)residentMessaging
{
  return self->_residentMessaging;
}

- (void)setResidentMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_residentMessaging, a3);
}

- (AWDHomeKitCameraSnapshotIDSTransfer)residentToPhone
{
  return self->_residentToPhone;
}

- (void)setResidentToPhone:(id)a3
{
  objc_storeStrong((id *)&self->_residentToPhone, a3);
}

- (AWDHomeKitCameraSnapshotIDSTransfer)phoneToWatch
{
  return self->_phoneToWatch;
}

- (void)setPhoneToWatch:(id)a3
{
  objc_storeStrong((id *)&self->_phoneToWatch, a3);
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingErrorDomain, a3);
}

- (unsigned)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchMessaging, 0);
  objc_storeStrong((id *)&self->_vendorDetails, 0);
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_residentToPhone, 0);
  objc_storeStrong((id *)&self->_residentMessaging, 0);
  objc_storeStrong((id *)&self->_phoneToWatch, 0);
  objc_storeStrong((id *)&self->_idsSessionSetup, 0);
  objc_storeStrong((id *)&self->_controllerMessaging, 0);
}

@end
