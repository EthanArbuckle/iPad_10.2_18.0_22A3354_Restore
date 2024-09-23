@implementation AWDHomeKitCameraStream

- (BOOL)hasVendorDetails
{
  return self->_vendorDetails != 0;
}

- (int)certified
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_certified;
  else
    return 0;
}

- (void)setCertified:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_certified = a3;
}

- (void)setHasCertified:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCertified
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)certifiedAsString:(int)a3
{
  if (a3 < 3)
    return off_24E7805B0[a3];
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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
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

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsLocal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isLocal = a3;
}

- (void)setHasIsLocal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsLocal
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasInitialConfiguration
{
  return self->_initialConfiguration != 0;
}

- (void)clearReconfigurations
{
  -[NSMutableArray removeAllObjects](self->_reconfigurations, "removeAllObjects");
}

- (void)addReconfigurations:(id)a3
{
  id v4;
  NSMutableArray *reconfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  reconfigurations = self->_reconfigurations;
  v8 = v4;
  if (!reconfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_reconfigurations;
    self->_reconfigurations = v6;

    v4 = v8;
    reconfigurations = self->_reconfigurations;
  }
  -[NSMutableArray addObject:](reconfigurations, "addObject:", v4);

}

- (unint64_t)reconfigurationsCount
{
  return -[NSMutableArray count](self->_reconfigurations, "count");
}

- (id)reconfigurationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_reconfigurations, "objectAtIndex:", a3);
}

- (BOOL)hasWatchIDSConnectionSetup
{
  return self->_watchIDSConnectionSetup != 0;
}

- (BOOL)hasPhoneIDSConnectionSetup
{
  return self->_phoneIDSConnectionSetup != 0;
}

- (BOOL)hasIdsSessionSetup
{
  return self->_idsSessionSetup != 0;
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

- (void)setReceivedFirstFrame:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_receivedFirstFrame = a3;
}

- (void)setHasReceivedFirstFrame:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReceivedFirstFrame
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)AWDHomeKitCameraStream;
  -[AWDHomeKitCameraStream description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraStream dictionaryRepresentation](self, "dictionaryRepresentation");
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
  AWDHomeKitCameraStreamConfigure *initialConfiguration;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  AWDHomeKitCameraStreamIDSConnSetup *watchIDSConnectionSetup;
  void *v23;
  AWDHomeKitCameraStreamIDSConnSetup *phoneIDSConnectionSetup;
  void *v25;
  AWDHomeKitCameraIDSSessionSetup *idsSessionSetup;
  void *v27;
  AWDHomeKitCameraStreamMessaging *watchMessaging;
  void *v29;
  AWDHomeKitCameraStreamMessaging *controllerMessaging;
  void *v31;
  AWDHomeKitCameraStreamMessaging *residentMessaging;
  void *v33;
  void *v34;
  NSString *underlyingErrorDomain;
  void *v36;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
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
  if ((has & 4) != 0)
  {
    certified = self->_certified;
    if (certified >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_certified);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_24E7805B0[certified];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("certified"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  v11 = (char)self->_has;
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("duration"));

    v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_14:
      if ((v11 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_errorCode);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("errorCode"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLocal);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("isLocal"));

  }
LABEL_16:
  initialConfiguration = self->_initialConfiguration;
  if (initialConfiguration)
  {
    -[AWDHomeKitCameraStreamConfigure dictionaryRepresentation](initialConfiguration, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("initialConfiguration"));

  }
  if (-[NSMutableArray count](self->_reconfigurations, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_reconfigurations, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v16 = self->_reconfigurations;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("reconfigurations"));
  }
  watchIDSConnectionSetup = self->_watchIDSConnectionSetup;
  if (watchIDSConnectionSetup)
  {
    -[AWDHomeKitCameraStreamIDSConnSetup dictionaryRepresentation](watchIDSConnectionSetup, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("watchIDSConnectionSetup"));

  }
  phoneIDSConnectionSetup = self->_phoneIDSConnectionSetup;
  if (phoneIDSConnectionSetup)
  {
    -[AWDHomeKitCameraStreamIDSConnSetup dictionaryRepresentation](phoneIDSConnectionSetup, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("phoneIDSConnectionSetup"));

  }
  idsSessionSetup = self->_idsSessionSetup;
  if (idsSessionSetup)
  {
    -[AWDHomeKitCameraIDSSessionSetup dictionaryRepresentation](idsSessionSetup, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("idsSessionSetup"));

  }
  watchMessaging = self->_watchMessaging;
  if (watchMessaging)
  {
    -[AWDHomeKitCameraStreamMessaging dictionaryRepresentation](watchMessaging, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("watchMessaging"));

  }
  controllerMessaging = self->_controllerMessaging;
  if (controllerMessaging)
  {
    -[AWDHomeKitCameraStreamMessaging dictionaryRepresentation](controllerMessaging, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("controllerMessaging"));

  }
  residentMessaging = self->_residentMessaging;
  if (residentMessaging)
  {
    -[AWDHomeKitCameraStreamMessaging dictionaryRepresentation](residentMessaging, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("residentMessaging"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_receivedFirstFrame);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("receivedFirstFrame"));

  }
  underlyingErrorDomain = self->_underlyingErrorDomain;
  if (underlyingErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", underlyingErrorDomain, CFSTR("underlyingErrorDomain"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_underlyingErrorCode);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("underlyingErrorCode"));

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
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  int v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  objc_class *v42;
  uint64_t v43;
  AWDHomeKitVendorInformation *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  void *v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;

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
          *(_BYTE *)&self->_has |= 2u;
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
              goto LABEL_97;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_99;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_97:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_99:
          v63 = 16;
          goto LABEL_104;
        case 2u:
          v24 = 0;
          v25 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v26 = *v4;
            v27 = *(_QWORD *)((char *)a3 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v27);
              *(_QWORD *)((char *)a3 + v26) = v27 + 1;
              v20 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v15 = v25++ >= 9;
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
          v63 = 8;
LABEL_104:
          *(Class *)((char *)&self->super.super.isa + v63) = (Class)v20;
          goto LABEL_126;
        case 4u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          *(_BYTE *)&self->_has |= 8u;
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
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                v15 = v31++ >= 9;
                if (v15)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v32) = 0;
LABEL_108:
          v64 = 40;
          goto LABEL_125;
        case 6u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          *(_BYTE *)&self->_has |= 0x40u;
          while (2)
          {
            v39 = *v4;
            v40 = *(_QWORD *)((char *)a3 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v40);
              *(_QWORD *)((char *)a3 + v39) = v40 + 1;
              v38 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                v15 = v37++ >= 9;
                if (v15)
                {
                  v38 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v38 = 0;
LABEL_112:
          self->_isLocal = v38 != 0;
          goto LABEL_126;
        case 9u:
          PBReaderReadString();
          v42 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v43 = 96;
          goto LABEL_81;
        case 0xAu:
          v44 = objc_alloc_init(AWDHomeKitVendorInformation);
          objc_storeStrong((id *)&self->_vendorDetails, v44);
          if (!PBReaderPlaceMark() || !AWDHomeKitVendorInformationReadFrom((uint64_t)v44, (uint64_t)a3))
            goto LABEL_128;
          goto LABEL_72;
        case 0xBu:
          v44 = objc_alloc_init(AWDHomeKitCameraStreamConfigure);
          objc_storeStrong((id *)&self->_initialConfiguration, v44);
          if (!PBReaderPlaceMark() || !AWDHomeKitCameraStreamConfigureReadFrom((uint64_t)v44, (uint64_t)a3))
            goto LABEL_128;
          goto LABEL_72;
        case 0xCu:
          v44 = objc_alloc_init(AWDHomeKitCameraStreamReconfigure);
          -[AWDHomeKitCameraStream addReconfigurations:](self, "addReconfigurations:", v44);
          if (!PBReaderPlaceMark()
            || !AWDHomeKitCameraStreamReconfigureReadFrom((uint64_t)v44, (uint64_t)a3))
          {
            goto LABEL_128;
          }
          goto LABEL_72;
        case 0xDu:
          v44 = objc_alloc_init(AWDHomeKitCameraStreamIDSConnSetup);
          v45 = 128;
          goto LABEL_61;
        case 0xEu:
          v44 = objc_alloc_init(AWDHomeKitCameraStreamIDSConnSetup);
          v45 = 64;
LABEL_61:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v45), v44);
          if (!PBReaderPlaceMark()
            || !AWDHomeKitCameraStreamIDSConnSetupReadFrom((uint64_t)v44, (uint64_t)a3))
          {
            goto LABEL_128;
          }
          goto LABEL_72;
        case 0xFu:
          v44 = objc_alloc_init(AWDHomeKitCameraIDSSessionSetup);
          objc_storeStrong((id *)&self->_idsSessionSetup, v44);
          if (!PBReaderPlaceMark() || !AWDHomeKitCameraIDSSessionSetupReadFrom((uint64_t)v44, (uint64_t)a3))
            goto LABEL_128;
          goto LABEL_72;
        case 0x10u:
          v44 = objc_alloc_init(AWDHomeKitCameraStreamMessaging);
          v46 = 136;
          goto LABEL_70;
        case 0x11u:
          v44 = objc_alloc_init(AWDHomeKitCameraStreamMessaging);
          v46 = 32;
          goto LABEL_70;
        case 0x12u:
          v44 = objc_alloc_init(AWDHomeKitCameraStreamMessaging);
          v46 = 88;
LABEL_70:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v46), v44);
          if (!PBReaderPlaceMark() || !AWDHomeKitCameraStreamMessagingReadFrom((uint64_t)v44, (uint64_t)a3))
          {
LABEL_128:

            LOBYTE(v29) = 0;
            return v29;
          }
LABEL_72:
          PBReaderRecallMark();

LABEL_126:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_127;
          break;
        case 0x13u:
          v47 = 0;
          v48 = 0;
          v32 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
          while (2)
          {
            v49 = *v4;
            v50 = *(_QWORD *)((char *)a3 + v49);
            if (v50 == -1 || v50 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v51 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v50);
              *(_QWORD *)((char *)a3 + v49) = v50 + 1;
              v32 |= (unint64_t)(v51 & 0x7F) << v47;
              if (v51 < 0)
              {
                v47 += 7;
                v15 = v48++ >= 9;
                if (v15)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v32) = 0;
LABEL_116:
          v64 = 72;
          goto LABEL_125;
        case 0x14u:
          PBReaderReadString();
          v42 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v43 = 112;
LABEL_81:
          v52 = *(Class *)((char *)&self->super.super.isa + v43);
          *(Class *)((char *)&self->super.super.isa + v43) = v42;

          goto LABEL_126;
        case 0x15u:
          v53 = 0;
          v54 = 0;
          v32 = 0;
          *(_BYTE *)&self->_has |= 0x20u;
          while (2)
          {
            v55 = *v4;
            v56 = *(_QWORD *)((char *)a3 + v55);
            if (v56 == -1 || v56 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v56);
              *(_QWORD *)((char *)a3 + v55) = v56 + 1;
              v32 |= (unint64_t)(v57 & 0x7F) << v53;
              if (v57 < 0)
              {
                v53 += 7;
                v15 = v54++ >= 9;
                if (v15)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v32) = 0;
LABEL_120:
          v64 = 104;
          goto LABEL_125;
        case 0x16u:
          v58 = 0;
          v59 = 0;
          v32 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v60 = *v4;
            v61 = *(_QWORD *)((char *)a3 + v60);
            if (v61 == -1 || v61 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v62 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v61);
              *(_QWORD *)((char *)a3 + v60) = v61 + 1;
              v32 |= (unint64_t)(v62 & 0x7F) << v58;
              if (v62 < 0)
              {
                v58 += 7;
                v15 = v59++ >= 9;
                if (v15)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v32) = 0;
LABEL_124:
          v64 = 24;
LABEL_125:
          *(_DWORD *)((char *)&self->super.super.isa + v64) = v32;
          goto LABEL_126;
        default:
          v29 = PBReaderSkipValueWithTag();
          if (!v29)
            return v29;
          goto LABEL_126;
      }
    }
  }
LABEL_127:
  LOBYTE(v29) = *((_BYTE *)a3 + *v6) == 0;
  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:
  if (self->_sessionID)
    PBDataWriterWriteStringField();
  if (self->_vendorDetails)
    PBDataWriterWriteSubmessage();
  if (self->_initialConfiguration)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_reconfigurations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (self->_watchIDSConnectionSetup)
    PBDataWriterWriteSubmessage();
  if (self->_phoneIDSConnectionSetup)
    PBDataWriterWriteSubmessage();
  if (self->_idsSessionSetup)
    PBDataWriterWriteSubmessage();
  if (self->_watchMessaging)
    PBDataWriterWriteSubmessage();
  if (self->_controllerMessaging)
    PBDataWriterWriteSubmessage();
  if (self->_residentMessaging)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_underlyingErrorDomain)
    PBDataWriterWriteStringField();
  v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;
  char v11;
  id v12;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 148) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = self->_duration;
  *((_BYTE *)v4 + 148) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_39:
  *((_DWORD *)v4 + 10) = self->_errorCode;
  *((_BYTE *)v4 + 148) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    *((_BYTE *)v4 + 144) = self->_isLocal;
    *((_BYTE *)v4 + 148) |= 0x40u;
  }
LABEL_6:
  v12 = v4;
  if (self->_sessionID)
    objc_msgSend(v4, "setSessionID:");
  if (self->_vendorDetails)
    objc_msgSend(v12, "setVendorDetails:");
  if (self->_initialConfiguration)
    objc_msgSend(v12, "setInitialConfiguration:");
  if (-[AWDHomeKitCameraStream reconfigurationsCount](self, "reconfigurationsCount"))
  {
    objc_msgSend(v12, "clearReconfigurations");
    v6 = -[AWDHomeKitCameraStream reconfigurationsCount](self, "reconfigurationsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDHomeKitCameraStream reconfigurationsAtIndex:](self, "reconfigurationsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addReconfigurations:", v9);

      }
    }
  }
  if (self->_watchIDSConnectionSetup)
    objc_msgSend(v12, "setWatchIDSConnectionSetup:");
  v10 = v12;
  if (self->_phoneIDSConnectionSetup)
  {
    objc_msgSend(v12, "setPhoneIDSConnectionSetup:");
    v10 = v12;
  }
  if (self->_idsSessionSetup)
  {
    objc_msgSend(v12, "setIdsSessionSetup:");
    v10 = v12;
  }
  if (self->_watchMessaging)
  {
    objc_msgSend(v12, "setWatchMessaging:");
    v10 = v12;
  }
  if (self->_controllerMessaging)
  {
    objc_msgSend(v12, "setControllerMessaging:");
    v10 = v12;
  }
  if (self->_residentMessaging)
  {
    objc_msgSend(v12, "setResidentMessaging:");
    v10 = v12;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v10[18] = self->_receivedFirstFrame;
    *((_BYTE *)v10 + 148) |= 0x10u;
  }
  if (self->_underlyingErrorDomain)
  {
    objc_msgSend(v12, "setUnderlyingErrorDomain:");
    v10 = v12;
  }
  v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    v10[26] = self->_underlyingErrorCode;
    *((_BYTE *)v10 + 148) |= 0x20u;
    v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    v10[6] = self->_certified;
    *((_BYTE *)v10 + 148) |= 4u;
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 148) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_duration;
  *(_BYTE *)(v5 + 148) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_22:
  *(_DWORD *)(v5 + 40) = self->_errorCode;
  *(_BYTE *)(v5 + 148) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 144) = self->_isLocal;
    *(_BYTE *)(v5 + 148) |= 0x40u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v8;

  v10 = -[AWDHomeKitVendorInformation copyWithZone:](self->_vendorDetails, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v10;

  v12 = -[AWDHomeKitCameraStreamConfigure copyWithZone:](self->_initialConfiguration, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v12;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = self->_reconfigurations;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend((id)v6, "addReconfigurations:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v16);
  }

  v20 = -[AWDHomeKitCameraStreamIDSConnSetup copyWithZone:](self->_watchIDSConnectionSetup, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v20;

  v22 = -[AWDHomeKitCameraStreamIDSConnSetup copyWithZone:](self->_phoneIDSConnectionSetup, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v22;

  v24 = -[AWDHomeKitCameraIDSSessionSetup copyWithZone:](self->_idsSessionSetup, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v24;

  v26 = -[AWDHomeKitCameraStreamMessaging copyWithZone:](self->_watchMessaging, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v26;

  v28 = -[AWDHomeKitCameraStreamMessaging copyWithZone:](self->_controllerMessaging, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v28;

  v30 = -[AWDHomeKitCameraStreamMessaging copyWithZone:](self->_residentMessaging, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v30;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_receivedFirstFrame;
    *(_BYTE *)(v6 + 148) |= 0x10u;
  }
  v32 = -[NSString copyWithZone:](self->_underlyingErrorDomain, "copyWithZone:", a3, (_QWORD)v36);
  v33 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v32;

  v34 = (char)self->_has;
  if ((v34 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_underlyingErrorCode;
    *(_BYTE *)(v6 + 148) |= 0x20u;
    v34 = (char)self->_has;
  }
  if ((v34 & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_certified;
    *(_BYTE *)(v6 + 148) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionID;
  AWDHomeKitVendorInformation *vendorDetails;
  AWDHomeKitCameraStreamConfigure *initialConfiguration;
  NSMutableArray *reconfigurations;
  AWDHomeKitCameraStreamIDSConnSetup *watchIDSConnectionSetup;
  AWDHomeKitCameraStreamIDSConnSetup *phoneIDSConnectionSetup;
  AWDHomeKitCameraIDSSessionSetup *idsSessionSetup;
  AWDHomeKitCameraStreamMessaging *watchMessaging;
  AWDHomeKitCameraStreamMessaging *controllerMessaging;
  AWDHomeKitCameraStreamMessaging *residentMessaging;
  char has;
  char v16;
  NSString *underlyingErrorDomain;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 148) & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 1) == 0 || self->_duration != *((_QWORD *)v4 + 1))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 8) == 0 || self->_errorCode != *((_DWORD *)v4 + 10))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 148) & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x40) == 0)
      goto LABEL_63;
    if (self->_isLocal)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_63;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_63;
    }
  }
  else if ((*((_BYTE *)v4 + 148) & 0x40) != 0)
  {
    goto LABEL_63;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 12) && !-[NSString isEqual:](sessionID, "isEqual:"))
    goto LABEL_63;
  vendorDetails = self->_vendorDetails;
  if ((unint64_t)vendorDetails | *((_QWORD *)v4 + 15))
  {
    if (!-[AWDHomeKitVendorInformation isEqual:](vendorDetails, "isEqual:"))
      goto LABEL_63;
  }
  initialConfiguration = self->_initialConfiguration;
  if ((unint64_t)initialConfiguration | *((_QWORD *)v4 + 7))
  {
    if (!-[AWDHomeKitCameraStreamConfigure isEqual:](initialConfiguration, "isEqual:"))
      goto LABEL_63;
  }
  reconfigurations = self->_reconfigurations;
  if ((unint64_t)reconfigurations | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](reconfigurations, "isEqual:"))
      goto LABEL_63;
  }
  watchIDSConnectionSetup = self->_watchIDSConnectionSetup;
  if ((unint64_t)watchIDSConnectionSetup | *((_QWORD *)v4 + 16))
  {
    if (!-[AWDHomeKitCameraStreamIDSConnSetup isEqual:](watchIDSConnectionSetup, "isEqual:"))
      goto LABEL_63;
  }
  phoneIDSConnectionSetup = self->_phoneIDSConnectionSetup;
  if ((unint64_t)phoneIDSConnectionSetup | *((_QWORD *)v4 + 8))
  {
    if (!-[AWDHomeKitCameraStreamIDSConnSetup isEqual:](phoneIDSConnectionSetup, "isEqual:"))
      goto LABEL_63;
  }
  idsSessionSetup = self->_idsSessionSetup;
  if ((unint64_t)idsSessionSetup | *((_QWORD *)v4 + 6))
  {
    if (!-[AWDHomeKitCameraIDSSessionSetup isEqual:](idsSessionSetup, "isEqual:"))
      goto LABEL_63;
  }
  watchMessaging = self->_watchMessaging;
  if ((unint64_t)watchMessaging | *((_QWORD *)v4 + 17))
  {
    if (!-[AWDHomeKitCameraStreamMessaging isEqual:](watchMessaging, "isEqual:"))
      goto LABEL_63;
  }
  controllerMessaging = self->_controllerMessaging;
  if ((unint64_t)controllerMessaging | *((_QWORD *)v4 + 4))
  {
    if (!-[AWDHomeKitCameraStreamMessaging isEqual:](controllerMessaging, "isEqual:"))
      goto LABEL_63;
  }
  residentMessaging = self->_residentMessaging;
  if ((unint64_t)residentMessaging | *((_QWORD *)v4 + 11))
  {
    if (!-[AWDHomeKitCameraStreamMessaging isEqual:](residentMessaging, "isEqual:"))
      goto LABEL_63;
  }
  has = (char)self->_has;
  v16 = *((_BYTE *)v4 + 148);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x10) == 0 || self->_receivedFirstFrame != *((_DWORD *)v4 + 18))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 148) & 0x10) != 0)
  {
    goto LABEL_63;
  }
  underlyingErrorDomain = self->_underlyingErrorDomain;
  if ((unint64_t)underlyingErrorDomain | *((_QWORD *)v4 + 14))
  {
    if (-[NSString isEqual:](underlyingErrorDomain, "isEqual:"))
    {
      has = (char)self->_has;
      v16 = *((_BYTE *)v4 + 148);
      goto LABEL_53;
    }
LABEL_63:
    v18 = 0;
    goto LABEL_64;
  }
LABEL_53:
  if ((has & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0 || self->_underlyingErrorCode != *((_DWORD *)v4 + 26))
      goto LABEL_63;
  }
  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 4) != 0)
  {
    if ((v16 & 4) == 0 || self->_certified != *((_DWORD *)v4 + 6))
      goto LABEL_63;
    v18 = 1;
  }
  else
  {
    v18 = (v16 & 4) == 0;
  }
LABEL_64:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v21 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v20 = 2654435761u * self->_duration;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v19 = 0;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v20 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v19 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v18 = 2654435761 * self->_isLocal;
    goto LABEL_10;
  }
LABEL_9:
  v18 = 0;
LABEL_10:
  v17 = -[NSString hash](self->_sessionID, "hash");
  v16 = -[AWDHomeKitVendorInformation hash](self->_vendorDetails, "hash");
  v15 = -[AWDHomeKitCameraStreamConfigure hash](self->_initialConfiguration, "hash");
  v14 = -[NSMutableArray hash](self->_reconfigurations, "hash");
  v3 = -[AWDHomeKitCameraStreamIDSConnSetup hash](self->_watchIDSConnectionSetup, "hash");
  v4 = -[AWDHomeKitCameraStreamIDSConnSetup hash](self->_phoneIDSConnectionSetup, "hash");
  v5 = -[AWDHomeKitCameraIDSSessionSetup hash](self->_idsSessionSetup, "hash");
  v6 = -[AWDHomeKitCameraStreamMessaging hash](self->_watchMessaging, "hash");
  v7 = -[AWDHomeKitCameraStreamMessaging hash](self->_controllerMessaging, "hash");
  v8 = -[AWDHomeKitCameraStreamMessaging hash](self->_residentMessaging, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v9 = 2654435761 * self->_receivedFirstFrame;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_underlyingErrorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v11 = 2654435761 * self->_underlyingErrorCode;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_15;
LABEL_17:
    v12 = 0;
    return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_17;
LABEL_15:
  v12 = 2654435761 * self->_certified;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  AWDHomeKitVendorInformation *vendorDetails;
  uint64_t v8;
  AWDHomeKitCameraStreamConfigure *initialConfiguration;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  AWDHomeKitCameraStreamIDSConnSetup *watchIDSConnectionSetup;
  uint64_t v17;
  AWDHomeKitCameraStreamIDSConnSetup *phoneIDSConnectionSetup;
  uint64_t v19;
  AWDHomeKitCameraIDSSessionSetup *idsSessionSetup;
  uint64_t v21;
  AWDHomeKitCameraStreamMessaging *watchMessaging;
  uint64_t v23;
  AWDHomeKitCameraStreamMessaging *controllerMessaging;
  uint64_t v25;
  AWDHomeKitCameraStreamMessaging *residentMessaging;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 148);
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 148);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 148) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v6 = *((_BYTE *)v4 + 148);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  self->_errorCode = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 148) & 0x40) != 0)
  {
LABEL_5:
    self->_isLocal = *((_BYTE *)v4 + 144);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_6:
  if (*((_QWORD *)v4 + 12))
    -[AWDHomeKitCameraStream setSessionID:](self, "setSessionID:");
  vendorDetails = self->_vendorDetails;
  v8 = *((_QWORD *)v5 + 15);
  if (vendorDetails)
  {
    if (v8)
      -[AWDHomeKitVendorInformation mergeFrom:](vendorDetails, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDHomeKitCameraStream setVendorDetails:](self, "setVendorDetails:");
  }
  initialConfiguration = self->_initialConfiguration;
  v10 = *((_QWORD *)v5 + 7);
  if (initialConfiguration)
  {
    if (v10)
      -[AWDHomeKitCameraStreamConfigure mergeFrom:](initialConfiguration, "mergeFrom:");
  }
  else if (v10)
  {
    -[AWDHomeKitCameraStream setInitialConfiguration:](self, "setInitialConfiguration:");
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = *((id *)v5 + 10);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        -[AWDHomeKitCameraStream addReconfigurations:](self, "addReconfigurations:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), (_QWORD)v29);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }

  watchIDSConnectionSetup = self->_watchIDSConnectionSetup;
  v17 = *((_QWORD *)v5 + 16);
  if (watchIDSConnectionSetup)
  {
    if (v17)
      -[AWDHomeKitCameraStreamIDSConnSetup mergeFrom:](watchIDSConnectionSetup, "mergeFrom:");
  }
  else if (v17)
  {
    -[AWDHomeKitCameraStream setWatchIDSConnectionSetup:](self, "setWatchIDSConnectionSetup:");
  }
  phoneIDSConnectionSetup = self->_phoneIDSConnectionSetup;
  v19 = *((_QWORD *)v5 + 8);
  if (phoneIDSConnectionSetup)
  {
    if (v19)
      -[AWDHomeKitCameraStreamIDSConnSetup mergeFrom:](phoneIDSConnectionSetup, "mergeFrom:");
  }
  else if (v19)
  {
    -[AWDHomeKitCameraStream setPhoneIDSConnectionSetup:](self, "setPhoneIDSConnectionSetup:");
  }
  idsSessionSetup = self->_idsSessionSetup;
  v21 = *((_QWORD *)v5 + 6);
  if (idsSessionSetup)
  {
    if (v21)
      -[AWDHomeKitCameraIDSSessionSetup mergeFrom:](idsSessionSetup, "mergeFrom:");
  }
  else if (v21)
  {
    -[AWDHomeKitCameraStream setIdsSessionSetup:](self, "setIdsSessionSetup:");
  }
  watchMessaging = self->_watchMessaging;
  v23 = *((_QWORD *)v5 + 17);
  if (watchMessaging)
  {
    if (v23)
      -[AWDHomeKitCameraStreamMessaging mergeFrom:](watchMessaging, "mergeFrom:");
  }
  else if (v23)
  {
    -[AWDHomeKitCameraStream setWatchMessaging:](self, "setWatchMessaging:");
  }
  controllerMessaging = self->_controllerMessaging;
  v25 = *((_QWORD *)v5 + 4);
  if (controllerMessaging)
  {
    if (v25)
      -[AWDHomeKitCameraStreamMessaging mergeFrom:](controllerMessaging, "mergeFrom:");
  }
  else if (v25)
  {
    -[AWDHomeKitCameraStream setControllerMessaging:](self, "setControllerMessaging:");
  }
  residentMessaging = self->_residentMessaging;
  v27 = *((_QWORD *)v5 + 11);
  if (residentMessaging)
  {
    if (v27)
      -[AWDHomeKitCameraStreamMessaging mergeFrom:](residentMessaging, "mergeFrom:");
  }
  else if (v27)
  {
    -[AWDHomeKitCameraStream setResidentMessaging:](self, "setResidentMessaging:");
  }
  if ((*((_BYTE *)v5 + 148) & 0x10) != 0)
  {
    self->_receivedFirstFrame = *((_DWORD *)v5 + 18);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v5 + 14))
    -[AWDHomeKitCameraStream setUnderlyingErrorDomain:](self, "setUnderlyingErrorDomain:");
  v28 = *((_BYTE *)v5 + 148);
  if ((v28 & 0x20) != 0)
  {
    self->_underlyingErrorCode = *((_DWORD *)v5 + 26);
    *(_BYTE *)&self->_has |= 0x20u;
    v28 = *((_BYTE *)v5 + 148);
  }
  if ((v28 & 4) != 0)
  {
    self->_certified = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 4u;
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

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (AWDHomeKitCameraStreamConfigure)initialConfiguration
{
  return self->_initialConfiguration;
}

- (void)setInitialConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_initialConfiguration, a3);
}

- (NSMutableArray)reconfigurations
{
  return self->_reconfigurations;
}

- (void)setReconfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_reconfigurations, a3);
}

- (AWDHomeKitCameraStreamIDSConnSetup)watchIDSConnectionSetup
{
  return self->_watchIDSConnectionSetup;
}

- (void)setWatchIDSConnectionSetup:(id)a3
{
  objc_storeStrong((id *)&self->_watchIDSConnectionSetup, a3);
}

- (AWDHomeKitCameraStreamIDSConnSetup)phoneIDSConnectionSetup
{
  return self->_phoneIDSConnectionSetup;
}

- (void)setPhoneIDSConnectionSetup:(id)a3
{
  objc_storeStrong((id *)&self->_phoneIDSConnectionSetup, a3);
}

- (AWDHomeKitCameraIDSSessionSetup)idsSessionSetup
{
  return self->_idsSessionSetup;
}

- (void)setIdsSessionSetup:(id)a3
{
  objc_storeStrong((id *)&self->_idsSessionSetup, a3);
}

- (AWDHomeKitCameraStreamMessaging)watchMessaging
{
  return self->_watchMessaging;
}

- (void)setWatchMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_watchMessaging, a3);
}

- (AWDHomeKitCameraStreamMessaging)controllerMessaging
{
  return self->_controllerMessaging;
}

- (void)setControllerMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_controllerMessaging, a3);
}

- (AWDHomeKitCameraStreamMessaging)residentMessaging
{
  return self->_residentMessaging;
}

- (void)setResidentMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_residentMessaging, a3);
}

- (unsigned)receivedFirstFrame
{
  return self->_receivedFirstFrame;
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
  objc_storeStrong((id *)&self->_watchIDSConnectionSetup, 0);
  objc_storeStrong((id *)&self->_vendorDetails, 0);
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_residentMessaging, 0);
  objc_storeStrong((id *)&self->_reconfigurations, 0);
  objc_storeStrong((id *)&self->_phoneIDSConnectionSetup, 0);
  objc_storeStrong((id *)&self->_initialConfiguration, 0);
  objc_storeStrong((id *)&self->_idsSessionSetup, 0);
  objc_storeStrong((id *)&self->_controllerMessaging, 0);
}

+ (Class)reconfigurationsType
{
  return (Class)objc_opt_class();
}

@end
