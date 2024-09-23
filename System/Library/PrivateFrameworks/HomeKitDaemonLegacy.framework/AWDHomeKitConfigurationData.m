@implementation AWDHomeKitConfigurationData

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

- (void)setDatabaseSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_databaseSize = a3;
}

- (void)setHasDatabaseSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDatabaseSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMetadataVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_metadataVersion = a3;
}

- (void)setHasMetadataVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMetadataVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsResidentCapable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isResidentCapable = a3;
}

- (void)setHasIsResidentCapable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsResidentCapable
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsResidentEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isResidentEnabled = a3;
}

- (void)setHasIsResidentEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsResidentEnabled
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)clearHomeConfigurations
{
  -[NSMutableArray removeAllObjects](self->_homeConfigurations, "removeAllObjects");
}

- (void)addHomeConfigurations:(id)a3
{
  id v4;
  NSMutableArray *homeConfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  homeConfigurations = self->_homeConfigurations;
  v8 = v4;
  if (!homeConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_homeConfigurations;
    self->_homeConfigurations = v6;

    v4 = v8;
    homeConfigurations = self->_homeConfigurations;
  }
  -[NSMutableArray addObject:](homeConfigurations, "addObject:", v4);

}

- (unint64_t)homeConfigurationsCount
{
  return -[NSMutableArray count](self->_homeConfigurations, "count");
}

- (id)homeConfigurationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_homeConfigurations, "objectAtIndex:", a3);
}

- (void)setIsDemoConfiguration:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isDemoConfiguration = a3;
}

- (void)setHasIsDemoConfiguration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsDemoConfiguration
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasWatchDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_hasWatchDevice = a3;
}

- (void)setHasHasWatchDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHasWatchDevice
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasActiveWatchDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_hasActiveWatchDevice = a3;
}

- (void)setHasHasActiveWatchDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasActiveWatchDevice
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)AWDHomeKitConfigurationData;
  -[AWDHomeKitConfigurationData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitConfigurationData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_databaseSize);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("databaseSize"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isResidentCapable);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("isResidentCapable"));

    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_metadataVersion);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("metadataVersion"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_23;
LABEL_5:
  if ((has & 0x80) == 0)
    goto LABEL_6;
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isResidentEnabled);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("isResidentEnabled"));

LABEL_6:
  if (-[NSMutableArray count](self->_homeConfigurations, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_homeConfigurations, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = self->_homeConfigurations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("homeConfigurations"));
  }
  v12 = (char)self->_has;
  if ((v12 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_17;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWatchDevice, (_QWORD)v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("hasWatchDevice"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDemoConfiguration);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("isDemoConfiguration"));

  v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
    goto LABEL_26;
LABEL_17:
  if ((v12 & 8) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasActiveWatchDevice, (_QWORD)v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("hasActiveWatchDevice"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  __int16 *v3;
  int *v5;
  int *v6;
  int *v7;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  int v20;
  char v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  __int16 *v28;
  int *v29;
  int *v30;
  int *v31;
  int v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  int *v56;
  AWDHomeKitConfigurationData *v57;
  AWDHomeKitHomeConfiguration *v58;
  AWDHomeKitConfigurationData *v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  BOOL v79;
  uint64_t v80;

  v5 = (int *)MEMORY[0x1E0D82BF0];
  v6 = (int *)MEMORY[0x1E0D82BD8];
  v7 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v9 = &OBJC_IVAR___HMDHAPAccessory__transportInformationInstances;
    v10 = &OBJC_IVAR___HMDHAPAccessory__transportInformationInstances;
    v11 = (int *)MEMORY[0x1E0D82BB8];
    v12 = &OBJC_IVAR___HMDHAPAccessory__transportInformationInstances;
    while (!*((_BYTE *)a3 + *v7))
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v5;
        v17 = *(_QWORD *)((char *)a3 + v16);
        if (v17 == -1 || v17 >= *(_QWORD *)((char *)a3 + *v6))
          break;
        v18 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v17);
        *(_QWORD *)((char *)a3 + v16) = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0)
          goto LABEL_12;
        v13 += 7;
        v19 = v14++ >= 9;
        if (v19)
        {
          v15 = 0;
          v20 = *((unsigned __int8 *)a3 + *v7);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v7) = 1;
LABEL_12:
      v20 = *((unsigned __int8 *)a3 + *v7);
      if (*((_BYTE *)a3 + *v7))
        v15 = 0;
LABEL_14:
      if (v20 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *((_BYTE *)&self->super.super.isa + v9[131]) |= 1u;
          while (1)
          {
            v25 = *v5;
            v26 = *(_QWORD *)((char *)a3 + v25);
            if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + *v6))
              break;
            v27 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v26);
            *(_QWORD *)((char *)a3 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if ((v27 & 0x80) == 0)
              goto LABEL_81;
            v22 += 7;
            v19 = v23++ >= 9;
            if (v19)
            {
              v24 = 0;
              goto LABEL_83;
            }
          }
          *((_BYTE *)a3 + *v7) = 1;
LABEL_81:
          if (*((_BYTE *)a3 + *v7))
            v24 = 0;
LABEL_83:
          *(Class *)((char *)&self->super.super.isa + v10[132]) = (Class)v24;
          goto LABEL_114;
        case 2u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          *((_BYTE *)&self->super.super.isa + v9[131]) |= 2u;
          while (2)
          {
            v36 = *v5;
            v37 = *(_QWORD *)((char *)a3 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v37);
              *(_QWORD *)((char *)a3 + v36) = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v19 = v34++ >= 9;
                if (v19)
                {
                  LODWORD(v35) = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v35) = 0;
LABEL_87:
          v78 = v12[133];
          goto LABEL_92;
        case 3u:
          v39 = 0;
          v40 = 0;
          v35 = 0;
          *((_BYTE *)&self->super.super.isa + v9[131]) |= 4u;
          while (2)
          {
            v41 = *v5;
            v42 = *(_QWORD *)((char *)a3 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v42);
              *(_QWORD *)((char *)a3 + v41) = v42 + 1;
              v35 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                v19 = v40++ >= 9;
                if (v19)
                {
                  LODWORD(v35) = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v35) = 0;
LABEL_91:
          v78 = 32;
LABEL_92:
          *(_DWORD *)((char *)&self->super.super.isa + v78) = v35;
          goto LABEL_114;
        case 4u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *((_BYTE *)&self->super.super.isa + v9[131]) |= 0x40u;
          while (2)
          {
            v47 = *v5;
            v48 = *(_QWORD *)((char *)a3 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v48);
              *(_QWORD *)((char *)a3 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v19 = v45++ >= 9;
                if (v19)
                {
                  v46 = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            v46 = 0;
LABEL_96:
          v79 = v46 != 0;
          v80 = 39;
          goto LABEL_113;
        case 5u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *((_BYTE *)&self->super.super.isa + v9[131]) |= 0x80u;
          while (2)
          {
            v53 = *v5;
            v54 = *(_QWORD *)((char *)a3 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v54);
              *(_QWORD *)((char *)a3 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v19 = v51++ >= 9;
                if (v19)
                {
                  v52 = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            v52 = 0;
LABEL_100:
          v79 = v52 != 0;
          v80 = 40;
          goto LABEL_113;
        case 6u:
          v56 = v12;
          v57 = self;
          v58 = objc_alloc_init(AWDHomeKitHomeConfiguration);
          v59 = v57;
          -[AWDHomeKitConfigurationData addHomeConfigurations:](v57, "addHomeConfigurations:", v58);
          if (!PBReaderPlaceMark()
            || (AWDHomeKitHomeConfigurationReadFrom((uint64_t)v58, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v32) = 0;
            return v32;
          }
          PBReaderRecallMark();

          v12 = v56;
          v3 = &jpt_1CD46C154;
          v7 = (int *)MEMORY[0x1E0D82BC8];
          self = v59;
LABEL_114:
          if (*(_QWORD *)((char *)a3 + *v5) >= *(_QWORD *)((char *)a3 + *v6))
            goto LABEL_115;
          break;
        case 7u:
          v60 = 0;
          v61 = 0;
          v62 = 0;
          *((_BYTE *)&self->super.super.isa + v9[131]) |= 0x20u;
          while (2)
          {
            v63 = *v5;
            v64 = *(_QWORD *)((char *)a3 + v63);
            if (v64 == -1 || v64 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v64);
              *(_QWORD *)((char *)a3 + v63) = v64 + 1;
              v62 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                v19 = v61++ >= 9;
                if (v19)
                {
                  v62 = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            v62 = 0;
LABEL_104:
          v79 = v62 != 0;
          v80 = 38;
          goto LABEL_113;
        case 8u:
          v66 = 0;
          v67 = 0;
          v68 = 0;
          *((_BYTE *)&self->super.super.isa + v9[131]) |= 0x10u;
          while (2)
          {
            v69 = *v5;
            v70 = *(_QWORD *)((char *)a3 + v69);
            if (v70 == -1 || v70 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v70);
              *(_QWORD *)((char *)a3 + v69) = v70 + 1;
              v68 |= (unint64_t)(v71 & 0x7F) << v66;
              if (v71 < 0)
              {
                v66 += 7;
                v19 = v67++ >= 9;
                if (v19)
                {
                  v68 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            v68 = 0;
LABEL_108:
          v79 = v68 != 0;
          v80 = 37;
          goto LABEL_113;
        case 9u:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          *((_BYTE *)&self->super.super.isa + v9[131]) |= 8u;
          while (2)
          {
            v75 = *v5;
            v76 = *(_QWORD *)((char *)a3 + v75);
            if (v76 == -1 || v76 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v76);
              *(_QWORD *)((char *)a3 + v75) = v76 + 1;
              v74 |= (unint64_t)(v77 & 0x7F) << v72;
              if (v77 < 0)
              {
                v72 += 7;
                v19 = v73++ >= 9;
                if (v19)
                {
                  v74 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            v74 = 0;
LABEL_112:
          v79 = v74 != 0;
          v80 = 36;
LABEL_113:
          *((_BYTE *)&self->super.super.isa + v80) = v79;
          goto LABEL_114;
        default:
          v28 = v3;
          v29 = v9;
          v30 = v10;
          v31 = v12;
          v32 = PBReaderSkipValueWithTag();
          v12 = v31;
          v10 = v30;
          v9 = v29;
          v3 = v28;
          if (!v32)
            return v32;
          goto LABEL_114;
      }
    }
  }
LABEL_115:
  LOBYTE(v32) = *((_BYTE *)a3 + *v7) == 0;
  return v32;
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

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
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
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
LABEL_21:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_21;
LABEL_5:
  if ((has & 0x80) == 0)
    goto LABEL_6;
LABEL_22:
  PBDataWriterWriteBOOLField();
LABEL_6:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_homeConfigurations;
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

  v11 = (char)self->_has;
  if ((v11 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_15;
LABEL_24:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
    goto LABEL_24;
LABEL_15:
  if ((v11 & 8) != 0)
LABEL_16:
    PBDataWriterWriteBOOLField();
LABEL_17:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  _BYTE *v11;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_databaseSize;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
LABEL_18:
    *((_BYTE *)v4 + 39) = self->_isResidentCapable;
    *((_BYTE *)v4 + 44) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_6;
LABEL_19:
    *((_BYTE *)v4 + 40) = self->_isResidentEnabled;
    *((_BYTE *)v4 + 44) |= 0x80u;
    goto LABEL_6;
  }
LABEL_17:
  *((_DWORD *)v4 + 8) = self->_metadataVersion;
  *((_BYTE *)v4 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_18;
LABEL_5:
  if (has < 0)
    goto LABEL_19;
LABEL_6:
  v11 = v4;
  if (-[AWDHomeKitConfigurationData homeConfigurationsCount](self, "homeConfigurationsCount"))
  {
    objc_msgSend(v11, "clearHomeConfigurations");
    v6 = -[AWDHomeKitConfigurationData homeConfigurationsCount](self, "homeConfigurationsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDHomeKitConfigurationData homeConfigurationsAtIndex:](self, "homeConfigurationsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addHomeConfigurations:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  if ((v10 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_12;
LABEL_21:
    v11[37] = self->_hasWatchDevice;
    v11[44] |= 0x10u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  v11[38] = self->_isDemoConfiguration;
  v11[44] |= 0x20u;
  v10 = (char)self->_has;
  if ((v10 & 0x10) != 0)
    goto LABEL_21;
LABEL_12:
  if ((v10 & 8) != 0)
  {
LABEL_13:
    v11[36] = self->_hasActiveWatchDevice;
    v11[44] |= 8u;
  }
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _BYTE *v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_BYTE *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_databaseSize;
  *(_BYTE *)(v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
LABEL_21:
    *(_BYTE *)(v5 + 39) = self->_isResidentCapable;
    *(_BYTE *)(v5 + 44) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_20:
  *(_DWORD *)(v5 + 32) = self->_metadataVersion;
  *(_BYTE *)(v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_21;
LABEL_5:
  if ((has & 0x80) == 0)
    goto LABEL_6;
LABEL_22:
  *(_BYTE *)(v5 + 40) = self->_isResidentEnabled;
  *(_BYTE *)(v5 + 44) |= 0x80u;
LABEL_6:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_homeConfigurations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v6, "addHomeConfigurations:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (char)self->_has;
  if ((v14 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_15;
LABEL_24:
    v6[37] = self->_hasWatchDevice;
    v6[44] |= 0x10u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v6;
    goto LABEL_16;
  }
  v6[38] = self->_isDemoConfiguration;
  v6[44] |= 0x20u;
  v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
    goto LABEL_24;
LABEL_15:
  if ((v14 & 8) != 0)
  {
LABEL_16:
    v6[36] = self->_hasActiveWatchDevice;
    v6[44] |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *homeConfigurations;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 44);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_databaseSize != *((_DWORD *)v4 + 4))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_metadataVersion != *((_DWORD *)v4 + 8))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x40) == 0)
      goto LABEL_54;
    if (self->_isResidentCapable)
    {
      if (!*((_BYTE *)v4 + 39))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 39))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x40) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x80) == 0)
      goto LABEL_54;
    if (self->_isResidentEnabled)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x80) != 0)
  {
    goto LABEL_54;
  }
  homeConfigurations = self->_homeConfigurations;
  if ((unint64_t)homeConfigurations | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](homeConfigurations, "isEqual:"))
      goto LABEL_54;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_54;
    if (self->_isDemoConfiguration)
    {
      if (!*((_BYTE *)v4 + 38))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 38))
    {
      goto LABEL_54;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_54;
    if (self->_hasWatchDevice)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_54;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_54;
  }
  v8 = (v6 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_hasActiveWatchDevice)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_54;
      }
      else if (*((_BYTE *)v4 + 36))
      {
        goto LABEL_54;
      }
      v8 = 1;
      goto LABEL_55;
    }
LABEL_54:
    v8 = 0;
  }
LABEL_55:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_databaseSize;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_metadataVersion;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_isResidentCapable;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_isResidentEnabled;
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
LABEL_12:
  v8 = -[NSMutableArray hash](self->_homeConfigurations, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_14;
LABEL_17:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_15;
LABEL_18:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v8;
  }
  v9 = 2654435761 * self->_isDemoConfiguration;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_14:
  v10 = 2654435761 * self->_hasWatchDevice;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_18;
LABEL_15:
  v11 = 2654435761 * self->_hasActiveWatchDevice;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BOOL *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (BOOL *)v4;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 44);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_databaseSize = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0)
      goto LABEL_5;
LABEL_21:
    self->_isResidentCapable = *((_BYTE *)v4 + 39);
    *(_BYTE *)&self->_has |= 0x40u;
    if ((*((_BYTE *)v4 + 44) & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_20:
  self->_metadataVersion = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 0x40) != 0)
    goto LABEL_21;
LABEL_5:
  if ((v6 & 0x80) == 0)
    goto LABEL_6;
LABEL_22:
  self->_isResidentEnabled = *((_BYTE *)v4 + 40);
  *(_BYTE *)&self->_has |= 0x80u;
LABEL_6:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[AWDHomeKitConfigurationData addHomeConfigurations:](self, "addHomeConfigurations:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = v5[44];
  if ((v12 & 0x20) == 0)
  {
    if ((v5[44] & 0x10) == 0)
      goto LABEL_15;
LABEL_24:
    self->_hasWatchDevice = v5[37];
    *(_BYTE *)&self->_has |= 0x10u;
    if ((v5[44] & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  self->_isDemoConfiguration = v5[38];
  *(_BYTE *)&self->_has |= 0x20u;
  v12 = v5[44];
  if ((v12 & 0x10) != 0)
    goto LABEL_24;
LABEL_15:
  if ((v12 & 8) != 0)
  {
LABEL_16:
    self->_hasActiveWatchDevice = v5[36];
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_17:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)databaseSize
{
  return self->_databaseSize;
}

- (unsigned)metadataVersion
{
  return self->_metadataVersion;
}

- (BOOL)isResidentCapable
{
  return self->_isResidentCapable;
}

- (BOOL)isResidentEnabled
{
  return self->_isResidentEnabled;
}

- (NSMutableArray)homeConfigurations
{
  return self->_homeConfigurations;
}

- (void)setHomeConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_homeConfigurations, a3);
}

- (BOOL)isDemoConfiguration
{
  return self->_isDemoConfiguration;
}

- (BOOL)hasWatchDevice
{
  return self->_hasWatchDevice;
}

- (BOOL)hasActiveWatchDevice
{
  return self->_hasActiveWatchDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeConfigurations, 0);
}

+ (Class)homeConfigurationsType
{
  return (Class)objc_opt_class();
}

@end
