@implementation AWDHomeKitCloudSync

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPushCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_pushCount = a3;
}

- (void)setHasPushCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPushCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setFetchCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_fetchCount = a3;
}

- (void)setHasFetchCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasFetchCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setUploadCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_uploadCount = a3;
}

- (void)setHasUploadCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasUploadCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setUploadErrorCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_uploadErrorCount = a3;
}

- (void)setHasUploadErrorCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasUploadErrorCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)clearTopReasons
{
  -[NSMutableArray removeAllObjects](self->_topReasons, "removeAllObjects");
}

- (void)addTopReasons:(id)a3
{
  id v4;
  NSMutableArray *topReasons;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topReasons = self->_topReasons;
  v8 = v4;
  if (!topReasons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_topReasons;
    self->_topReasons = v6;

    v4 = v8;
    topReasons = self->_topReasons;
  }
  -[NSMutableArray addObject:](topReasons, "addObject:", v4);

}

- (unint64_t)topReasonsCount
{
  return -[NSMutableArray count](self->_topReasons, "count");
}

- (id)topReasonsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topReasons, "objectAtIndex:", a3);
}

- (void)clearTopErrors
{
  -[NSMutableArray removeAllObjects](self->_topErrors, "removeAllObjects");
}

- (void)addTopErrors:(id)a3
{
  id v4;
  NSMutableArray *topErrors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topErrors = self->_topErrors;
  v8 = v4;
  if (!topErrors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_topErrors;
    self->_topErrors = v6;

    v4 = v8;
    topErrors = self->_topErrors;
  }
  -[NSMutableArray addObject:](topErrors, "addObject:", v4);

}

- (unint64_t)topErrorsCount
{
  return -[NSMutableArray count](self->_topErrors, "count");
}

- (id)topErrorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topErrors, "objectAtIndex:", a3);
}

- (void)setUploadMaximumDelayReached:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_uploadMaximumDelayReached = a3;
}

- (void)setHasUploadMaximumDelayReached:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUploadMaximumDelayReached
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasDecryptionFailed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_hasDecryptionFailed = a3;
}

- (void)setHasHasDecryptionFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasHasDecryptionFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setLastDecryptionFailed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_lastDecryptionFailed = a3;
}

- (void)setHasLastDecryptionFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasLastDecryptionFailed
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (int)dataSyncState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_dataSyncState;
  else
    return 0;
}

- (void)setDataSyncState:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_dataSyncState = a3;
}

- (void)setHasDataSyncState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDataSyncState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)dataSyncStateAsString:(int)a3
{
  if (a3 < 6)
    return off_1E89AC4C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDataSyncState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitDataSyncState_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitDataSyncState_Good")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitDataSyncState_KeychainNotEnabled")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitDataSyncState_iCloudSwitchNotEnabled")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitDataSyncState_WaitingForCloudData")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitDataSyncState_RequiresConfigurationReset")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHomeManagerFetchCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_homeManagerFetchCount = a3;
}

- (void)setHasHomeManagerFetchCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHomeManagerFetchCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHomeZoneFetchCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_homeZoneFetchCount = a3;
}

- (void)setHasHomeZoneFetchCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHomeZoneFetchCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHomeManagerUploadCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_homeManagerUploadCount = a3;
}

- (void)setHasHomeManagerUploadCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHomeManagerUploadCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHomeZoneUploadCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_homeZoneUploadCount = a3;
}

- (void)setHasHomeZoneUploadCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHomeZoneUploadCount
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHomeDataMegabytesFetched:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_homeDataMegabytesFetched = a3;
}

- (void)setHasHomeDataMegabytesFetched:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHomeDataMegabytesFetched
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHomeDataMegabytesPushed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_homeDataMegabytesPushed = a3;
}

- (void)setHasHomeDataMegabytesPushed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHomeDataMegabytesPushed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setLegacyHomeDataMegabytesFetched:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_legacyHomeDataMegabytesFetched = a3;
}

- (void)setHasLegacyHomeDataMegabytesFetched:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLegacyHomeDataMegabytesFetched
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLegacyHomeDataMegabytesPushed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_legacyHomeDataMegabytesPushed = a3;
}

- (void)setHasLegacyHomeDataMegabytesPushed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($041F038B063069CF3B0992C8591E5F7D)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLegacyHomeDataMegabytesPushed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
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
  v8.super_class = (Class)AWDHomeKitCloudSync;
  -[AWDHomeKitCloudSync description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCloudSync dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $041F038B063069CF3B0992C8591E5F7D has;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  $041F038B063069CF3B0992C8591E5F7D v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t dataSyncState;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_pushCount);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("pushCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_fetchCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("fetchCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uploadCount);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("uploadCount"));

  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uploadErrorCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("uploadErrorCount"));

  }
LABEL_7:
  if (-[NSMutableArray count](self->_topReasons, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_topReasons, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v7 = self->_topReasons;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v44;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v11), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("topReasons"));
  }
  if (-[NSMutableArray count](self->_topErrors, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_topErrors, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v14 = self->_topErrors;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v18), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("topErrors"));
  }
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_uploadMaximumDelayReached);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("uploadMaximumDelayReached"));

    v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v20 & 0x8000) == 0)
        goto LABEL_28;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v20 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasDecryptionFailed);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("hasDecryptionFailed"));

  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x8000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v20 & 2) == 0)
      goto LABEL_29;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastDecryptionFailed);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("lastDecryptionFailed"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 2) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v20 & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_51;
  }
LABEL_47:
  dataSyncState = self->_dataSyncState;
  if (dataSyncState >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dataSyncState);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_1E89AC4C0[dataSyncState];
  }
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("dataSyncState"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x20) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v20 & 0x80) == 0)
      goto LABEL_31;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_homeManagerFetchCount);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("homeManagerFetchCount"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x80) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v20 & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_homeZoneFetchCount);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("homeZoneFetchCount"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x40) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v20 & 0x100) == 0)
      goto LABEL_33;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_homeManagerUploadCount);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("homeManagerUploadCount"));

  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x100) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v20 & 8) == 0)
      goto LABEL_34;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_homeZoneUploadCount);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("homeZoneUploadCount"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 8) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v20 & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_homeDataMegabytesFetched);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("homeDataMegabytesFetched"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x10) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v20 & 0x200) == 0)
      goto LABEL_36;
LABEL_57:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_legacyHomeDataMegabytesFetched);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("legacyHomeDataMegabytesFetched"));

    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      return v3;
    goto LABEL_37;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_homeDataMegabytesPushed);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("homeDataMegabytesPushed"));

  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x200) != 0)
    goto LABEL_57;
LABEL_36:
  if ((*(_WORD *)&v20 & 0x400) != 0)
  {
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_legacyHomeDataMegabytesPushed);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("legacyHomeDataMegabytesPushed"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  uint64_t v3;
  int *v5;
  int *v6;
  int *v7;
  int *v9;
  int *v10;
  __objc2_class_ro **p_info;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  char v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  int v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
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
  unint64_t v47;
  char v48;
  uint64_t v49;
  int *v50;
  __objc2_class_ro **v51;
  id v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  char v91;
  unsigned int v92;
  uint64_t v93;
  unint64_t v94;
  char v95;
  char v96;
  unsigned int v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  char v101;
  unsigned int v102;
  uint64_t v103;
  unint64_t v104;
  char v105;
  char v106;
  unsigned int v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  char v111;
  unsigned int v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  uint64_t v116;
  BOOL v117;
  uint64_t v118;

  v5 = (int *)MEMORY[0x1E0D82BF0];
  v6 = (int *)MEMORY[0x1E0D82BD8];
  v7 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v9 = &OBJC_IVAR___HMDHAPAccessory__transportInformationInstances;
    v10 = (int *)MEMORY[0x1E0D82BB8];
    p_info = HMDAccessoryFirmwareUpdateSchedulerWingman.info;
    while (!*((_BYTE *)a3 + *v7))
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v5;
        v16 = *(_QWORD *)((char *)a3 + v15);
        if (v16 == -1 || v16 >= *(_QWORD *)((char *)a3 + *v6))
          break;
        v17 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v16);
        *(_QWORD *)((char *)a3 + v15) = v16 + 1;
        v14 |= (unint64_t)(v17 & 0x7F) << v12;
        if ((v17 & 0x80) == 0)
          goto LABEL_12;
        v12 += 7;
        v18 = v13++ >= 9;
        if (v18)
        {
          v14 = 0;
          v19 = *((unsigned __int8 *)a3 + *v7);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v7) = 1;
LABEL_12:
      v19 = *((unsigned __int8 *)a3 + *v7);
      if (*((_BYTE *)a3 + *v7))
        v14 = 0;
LABEL_14:
      if (v19 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 1u;
          while (1)
          {
            v24 = *v5;
            v25 = *(_QWORD *)((char *)a3 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + *v6))
              break;
            v26 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v25);
            *(_QWORD *)((char *)a3 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0)
              goto LABEL_146;
            v21 += 7;
            v18 = v22++ >= 9;
            if (v18)
            {
              v23 = 0;
              goto LABEL_148;
            }
          }
          *((_BYTE *)a3 + *v7) = 1;
LABEL_146:
          if (*((_BYTE *)a3 + *v7))
            v23 = 0;
LABEL_148:
          self->_timestamp = v23;
          goto LABEL_215;
        case 2u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x800u;
          while (2)
          {
            v31 = *v5;
            v32 = *(_QWORD *)((char *)a3 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v32);
              *(_QWORD *)((char *)a3 + v31) = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v18 = v29++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_152:
          v116 = 56;
          goto LABEL_214;
        case 3u:
          v34 = 0;
          v35 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 4u;
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
              v38 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v37);
              *(_QWORD *)((char *)a3 + v36) = v37 + 1;
              v30 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v18 = v35++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_156:
          v116 = 20;
          goto LABEL_214;
        case 4u:
          v39 = 0;
          v40 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x1000u;
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
              v43 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v42);
              *(_QWORD *)((char *)a3 + v41) = v42 + 1;
              v30 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                v18 = v40++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_160:
          v116 = 80;
          goto LABEL_214;
        case 5u:
          v44 = 0;
          v45 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x2000u;
          while (2)
          {
            v46 = *v5;
            v47 = *(_QWORD *)((char *)a3 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v47);
              *(_QWORD *)((char *)a3 + v46) = v47 + 1;
              v30 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v18 = v45++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_164:
          v116 = 84;
          goto LABEL_214;
        case 6u:
          v49 = v3;
          v50 = v9;
          v51 = p_info;
          v52 = objc_alloc_init((Class)(p_info + 376));
          -[AWDHomeKitCloudSync addTopReasons:](self, "addTopReasons:", v52);
          goto LABEL_58;
        case 7u:
          v49 = v3;
          v50 = v9;
          v51 = p_info;
          v52 = objc_alloc_init((Class)(p_info + 376));
          -[AWDHomeKitCloudSync addTopErrors:](self, "addTopErrors:", v52);
LABEL_58:
          if (!PBReaderPlaceMark()
            || (AWDHomeKitCloudSyncInfoTupleReadFrom((uint64_t)v52, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v27) = 0;
            return v27;
          }
          PBReaderRecallMark();

          p_info = v51;
          v9 = v50;
          v3 = v49;
LABEL_215:
          if (*(_QWORD *)((char *)a3 + *v5) >= *(_QWORD *)((char *)a3 + *v6))
            goto LABEL_216;
          break;
        case 8u:
          v53 = 0;
          v54 = 0;
          v55 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x10000u;
          while (2)
          {
            v56 = *v5;
            v57 = *(_QWORD *)((char *)a3 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v57);
              *(_QWORD *)((char *)a3 + v56) = v57 + 1;
              v55 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                v18 = v54++ >= 9;
                if (v18)
                {
                  v55 = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            v55 = 0;
LABEL_168:
          v117 = v55 != 0;
          v118 = 90;
          goto LABEL_177;
        case 9u:
          v59 = 0;
          v60 = 0;
          v61 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x4000u;
          while (2)
          {
            v62 = *v5;
            v63 = *(_QWORD *)((char *)a3 + v62);
            if (v63 == -1 || v63 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v63);
              *(_QWORD *)((char *)a3 + v62) = v63 + 1;
              v61 |= (unint64_t)(v64 & 0x7F) << v59;
              if (v64 < 0)
              {
                v59 += 7;
                v18 = v60++ >= 9;
                if (v18)
                {
                  v61 = 0;
                  goto LABEL_172;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            v61 = 0;
LABEL_172:
          v117 = v61 != 0;
          v118 = 88;
          goto LABEL_177;
        case 0xAu:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x8000u;
          while (2)
          {
            v68 = *v5;
            v69 = *(_QWORD *)((char *)a3 + v68);
            if (v69 == -1 || v69 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v69);
              *(_QWORD *)((char *)a3 + v68) = v69 + 1;
              v67 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                v18 = v66++ >= 9;
                if (v18)
                {
                  v67 = 0;
                  goto LABEL_176;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            v67 = 0;
LABEL_176:
          v117 = v67 != 0;
          v118 = 89;
LABEL_177:
          *((_BYTE *)&self->super.super.isa + v118) = v117;
          goto LABEL_215;
        case 0xBu:
          v71 = 0;
          v72 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 2u;
          while (2)
          {
            v73 = *v5;
            v74 = *(_QWORD *)((char *)a3 + v73);
            if (v74 == -1 || v74 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v75 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v74);
              *(_QWORD *)((char *)a3 + v73) = v74 + 1;
              v30 |= (unint64_t)(v75 & 0x7F) << v71;
              if (v75 < 0)
              {
                v71 += 7;
                v18 = v72++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_181;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_181:
          v116 = 16;
          goto LABEL_214;
        case 0xCu:
          v76 = 0;
          v77 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x20u;
          while (2)
          {
            v78 = *v5;
            v79 = *(_QWORD *)((char *)a3 + v78);
            if (v79 == -1 || v79 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v80 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v79);
              *(_QWORD *)((char *)a3 + v78) = v79 + 1;
              v30 |= (unint64_t)(v80 & 0x7F) << v76;
              if (v80 < 0)
              {
                v76 += 7;
                v18 = v77++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_185;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_185:
          v116 = 32;
          goto LABEL_214;
        case 0xDu:
          v81 = 0;
          v82 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x80u;
          while (2)
          {
            v83 = *v5;
            v84 = *(_QWORD *)((char *)a3 + v83);
            if (v84 == -1 || v84 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v84);
              *(_QWORD *)((char *)a3 + v83) = v84 + 1;
              v30 |= (unint64_t)(v85 & 0x7F) << v81;
              if (v85 < 0)
              {
                v81 += 7;
                v18 = v82++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_189;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_189:
          v116 = 40;
          goto LABEL_214;
        case 0xEu:
          v86 = 0;
          v87 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x40u;
          while (2)
          {
            v88 = *v5;
            v89 = *(_QWORD *)((char *)a3 + v88);
            if (v89 == -1 || v89 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v90 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v89);
              *(_QWORD *)((char *)a3 + v88) = v89 + 1;
              v30 |= (unint64_t)(v90 & 0x7F) << v86;
              if (v90 < 0)
              {
                v86 += 7;
                v18 = v87++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_193:
          v116 = 36;
          goto LABEL_214;
        case 0xFu:
          v91 = 0;
          v92 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x100u;
          while (2)
          {
            v93 = *v5;
            v94 = *(_QWORD *)((char *)a3 + v93);
            if (v94 == -1 || v94 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v95 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v94);
              *(_QWORD *)((char *)a3 + v93) = v94 + 1;
              v30 |= (unint64_t)(v95 & 0x7F) << v91;
              if (v95 < 0)
              {
                v91 += 7;
                v18 = v92++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_197:
          v116 = 44;
          goto LABEL_214;
        case 0x10u:
          v96 = 0;
          v97 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 8u;
          while (2)
          {
            v98 = *v5;
            v99 = *(_QWORD *)((char *)a3 + v98);
            if (v99 == -1 || v99 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v100 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v99);
              *(_QWORD *)((char *)a3 + v98) = v99 + 1;
              v30 |= (unint64_t)(v100 & 0x7F) << v96;
              if (v100 < 0)
              {
                v96 += 7;
                v18 = v97++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_201;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_201:
          v116 = 24;
          goto LABEL_214;
        case 0x11u:
          v101 = 0;
          v102 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x10u;
          while (2)
          {
            v103 = *v5;
            v104 = *(_QWORD *)((char *)a3 + v103);
            if (v104 == -1 || v104 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v105 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v104);
              *(_QWORD *)((char *)a3 + v103) = v104 + 1;
              v30 |= (unint64_t)(v105 & 0x7F) << v101;
              if (v105 < 0)
              {
                v101 += 7;
                v18 = v102++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_205;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_205:
          v116 = 28;
          goto LABEL_214;
        case 0x12u:
          v106 = 0;
          v107 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x200u;
          while (2)
          {
            v108 = *v5;
            v109 = *(_QWORD *)((char *)a3 + v108);
            if (v109 == -1 || v109 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v110 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v109);
              *(_QWORD *)((char *)a3 + v108) = v109 + 1;
              v30 |= (unint64_t)(v110 & 0x7F) << v106;
              if (v110 < 0)
              {
                v106 += 7;
                v18 = v107++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_209:
          v116 = 48;
          goto LABEL_214;
        case 0x13u:
          v111 = 0;
          v112 = 0;
          v30 = 0;
          *(_DWORD *)((char *)&self->super.super.isa + v9[185]) |= 0x400u;
          while (2)
          {
            v113 = *v5;
            v114 = *(_QWORD *)((char *)a3 + v113);
            if (v114 == -1 || v114 >= *(_QWORD *)((char *)a3 + *v6))
            {
              *((_BYTE *)a3 + *v7) = 1;
            }
            else
            {
              v115 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v10) + v114);
              *(_QWORD *)((char *)a3 + v113) = v114 + 1;
              v30 |= (unint64_t)(v115 & 0x7F) << v111;
              if (v115 < 0)
              {
                v111 += 7;
                v18 = v112++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v7))
            LODWORD(v30) = 0;
LABEL_213:
          v116 = 52;
LABEL_214:
          *(_DWORD *)((char *)&self->super.super.isa + v116) = v30;
          goto LABEL_215;
        default:
          v27 = PBReaderSkipValueWithTag();
          if (!v27)
            return v27;
          goto LABEL_215;
      }
    }
  }
LABEL_216:
  LOBYTE(v27) = *((_BYTE *)a3 + *v7) == 0;
  return v27;
}

- (void)writeTo:(id)a3
{
  id v4;
  $041F038B063069CF3B0992C8591E5F7D has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $041F038B063069CF3B0992C8591E5F7D v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_topReasons;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_topErrors;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x4000) == 0)
    {
LABEL_23:
      if ((*(_WORD *)&v16 & 0x8000) == 0)
        goto LABEL_24;
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v16 & 2) == 0)
      goto LABEL_25;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 2) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v16 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v16 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x80) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v16 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x40) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v16 & 0x100) == 0)
      goto LABEL_29;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x100) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v16 & 8) == 0)
      goto LABEL_30;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 8) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v16 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v16 & 0x200) == 0)
      goto LABEL_32;
LABEL_50:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) != 0)
    goto LABEL_50;
LABEL_32:
  if ((*(_WORD *)&v16 & 0x400) != 0)
LABEL_33:
    PBDataWriterWriteUint32Field();
LABEL_34:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $041F038B063069CF3B0992C8591E5F7D has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  $041F038B063069CF3B0992C8591E5F7D v14;
  id v15;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 23) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 14) = self->_pushCount;
  *((_DWORD *)v4 + 23) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
LABEL_32:
    *((_DWORD *)v4 + 20) = self->_uploadCount;
    *((_DWORD *)v4 + 23) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_31:
  *((_DWORD *)v4 + 5) = self->_fetchCount;
  *((_DWORD *)v4 + 23) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
    goto LABEL_32;
LABEL_5:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 21) = self->_uploadErrorCount;
    *((_DWORD *)v4 + 23) |= 0x2000u;
  }
LABEL_7:
  v15 = v4;
  if (-[AWDHomeKitCloudSync topReasonsCount](self, "topReasonsCount"))
  {
    objc_msgSend(v15, "clearTopReasons");
    v6 = -[AWDHomeKitCloudSync topReasonsCount](self, "topReasonsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDHomeKitCloudSync topReasonsAtIndex:](self, "topReasonsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTopReasons:", v9);

      }
    }
  }
  if (-[AWDHomeKitCloudSync topErrorsCount](self, "topErrorsCount"))
  {
    objc_msgSend(v15, "clearTopErrors");
    v10 = -[AWDHomeKitCloudSync topErrorsCount](self, "topErrorsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[AWDHomeKitCloudSync topErrorsAtIndex:](self, "topErrorsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTopErrors:", v13);

      }
    }
  }
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    *((_BYTE *)v15 + 90) = self->_uploadMaximumDelayReached;
    *((_DWORD *)v15 + 23) |= 0x10000u;
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x4000) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v14 & 0x8000) == 0)
        goto LABEL_18;
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
    goto LABEL_17;
  }
  *((_BYTE *)v15 + 88) = self->_hasDecryptionFailed;
  *((_DWORD *)v15 + 23) |= 0x4000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v14 & 2) == 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  *((_BYTE *)v15 + 89) = self->_lastDecryptionFailed;
  *((_DWORD *)v15 + 23) |= 0x8000u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 2) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v14 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v15 + 4) = self->_dataSyncState;
  *((_DWORD *)v15 + 23) |= 2u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v14 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v15 + 8) = self->_homeManagerFetchCount;
  *((_DWORD *)v15 + 23) |= 0x20u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x80) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v14 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v15 + 10) = self->_homeZoneFetchCount;
  *((_DWORD *)v15 + 23) |= 0x80u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v14 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v15 + 9) = self->_homeManagerUploadCount;
  *((_DWORD *)v15 + 23) |= 0x40u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v14 & 8) == 0)
      goto LABEL_24;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v15 + 11) = self->_homeZoneUploadCount;
  *((_DWORD *)v15 + 23) |= 0x100u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v14 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v15 + 6) = self->_homeDataMegabytesFetched;
  *((_DWORD *)v15 + 23) |= 8u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x10) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v14 & 0x200) == 0)
      goto LABEL_26;
LABEL_44:
    *((_DWORD *)v15 + 12) = self->_legacyHomeDataMegabytesFetched;
    *((_DWORD *)v15 + 23) |= 0x200u;
    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_43:
  *((_DWORD *)v15 + 7) = self->_homeDataMegabytesPushed;
  *((_DWORD *)v15 + 23) |= 0x10u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) != 0)
    goto LABEL_44;
LABEL_26:
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
LABEL_27:
    *((_DWORD *)v15 + 13) = self->_legacyHomeDataMegabytesPushed;
    *((_DWORD *)v15 + 23) |= 0x400u;
  }
LABEL_28:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $041F038B063069CF3B0992C8591E5F7D has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  $041F038B063069CF3B0992C8591E5F7D v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 92) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 56) = self->_pushCount;
  *(_DWORD *)(v5 + 92) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 20) = self->_fetchCount;
  *(_DWORD *)(v5 + 92) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_38:
  *(_DWORD *)(v5 + 80) = self->_uploadCount;
  *(_DWORD *)(v5 + 92) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 84) = self->_uploadErrorCount;
    *(_DWORD *)(v5 + 92) |= 0x2000u;
  }
LABEL_7:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = self->_topReasons;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTopReasons:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_topErrors;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v6, "addTopErrors:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) != 0)
  {
    *(_BYTE *)(v6 + 90) = self->_uploadMaximumDelayReached;
    *(_DWORD *)(v6 + 92) |= 0x10000u;
    v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x4000) == 0)
    {
LABEL_23:
      if ((*(_WORD *)&v20 & 0x8000) == 0)
        goto LABEL_24;
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&v20 & 0x4000) == 0)
  {
    goto LABEL_23;
  }
  *(_BYTE *)(v6 + 88) = self->_hasDecryptionFailed;
  *(_DWORD *)(v6 + 92) |= 0x4000u;
  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v20 & 2) == 0)
      goto LABEL_25;
    goto LABEL_43;
  }
LABEL_42:
  *(_BYTE *)(v6 + 89) = self->_lastDecryptionFailed;
  *(_DWORD *)(v6 + 92) |= 0x8000u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 2) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v20 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v6 + 16) = self->_dataSyncState;
  *(_DWORD *)(v6 + 92) |= 2u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v20 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 32) = self->_homeManagerFetchCount;
  *(_DWORD *)(v6 + 92) |= 0x20u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x80) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v20 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 40) = self->_homeZoneFetchCount;
  *(_DWORD *)(v6 + 92) |= 0x80u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x40) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v20 & 0x100) == 0)
      goto LABEL_29;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 36) = self->_homeManagerUploadCount;
  *(_DWORD *)(v6 + 92) |= 0x40u;
  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x100) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v20 & 8) == 0)
      goto LABEL_30;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 44) = self->_homeZoneUploadCount;
  *(_DWORD *)(v6 + 92) |= 0x100u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 8) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v20 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 24) = self->_homeDataMegabytesFetched;
  *(_DWORD *)(v6 + 92) |= 8u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v20 & 0x200) == 0)
      goto LABEL_32;
LABEL_50:
    *(_DWORD *)(v6 + 48) = self->_legacyHomeDataMegabytesFetched;
    *(_DWORD *)(v6 + 92) |= 0x200u;
    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      return (id)v6;
    goto LABEL_33;
  }
LABEL_49:
  *(_DWORD *)(v6 + 28) = self->_homeDataMegabytesPushed;
  *(_DWORD *)(v6 + 92) |= 0x10u;
  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x200) != 0)
    goto LABEL_50;
LABEL_32:
  if ((*(_WORD *)&v20 & 0x400) != 0)
  {
LABEL_33:
    *(_DWORD *)(v6 + 52) = self->_legacyHomeDataMegabytesPushed;
    *(_DWORD *)(v6 + 92) |= 0x400u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $041F038B063069CF3B0992C8591E5F7D has;
  int v6;
  NSMutableArray *topReasons;
  NSMutableArray *topErrors;
  $041F038B063069CF3B0992C8591E5F7D v9;
  int v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_100;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 23);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_100;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_pushCount != *((_DWORD *)v4 + 14))
      goto LABEL_100;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_fetchCount != *((_DWORD *)v4 + 5))
      goto LABEL_100;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_uploadCount != *((_DWORD *)v4 + 20))
      goto LABEL_100;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_uploadErrorCount != *((_DWORD *)v4 + 21))
      goto LABEL_100;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_100;
  }
  topReasons = self->_topReasons;
  if ((unint64_t)topReasons | *((_QWORD *)v4 + 9)
    && !-[NSMutableArray isEqual:](topReasons, "isEqual:"))
  {
    goto LABEL_100;
  }
  topErrors = self->_topErrors;
  if ((unint64_t)topErrors | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](topErrors, "isEqual:"))
      goto LABEL_100;
  }
  v9 = self->_has;
  v10 = *((_DWORD *)v4 + 23);
  if ((*(_DWORD *)&v9 & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0)
      goto LABEL_100;
    if (self->_uploadMaximumDelayReached)
    {
      if (!*((_BYTE *)v4 + 90))
        goto LABEL_100;
    }
    else if (*((_BYTE *)v4 + 90))
    {
      goto LABEL_100;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0)
      goto LABEL_100;
    if (self->_hasDecryptionFailed)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_100;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_100;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    if ((v10 & 0x8000) != 0)
    {
      if (self->_lastDecryptionFailed)
      {
        if (!*((_BYTE *)v4 + 89))
          goto LABEL_100;
        goto LABEL_55;
      }
      if (!*((_BYTE *)v4 + 89))
        goto LABEL_55;
    }
LABEL_100:
    v11 = 0;
    goto LABEL_101;
  }
  if ((v10 & 0x8000) != 0)
    goto LABEL_100;
LABEL_55:
  if ((*(_BYTE *)&v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_dataSyncState != *((_DWORD *)v4 + 4))
      goto LABEL_100;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_homeManagerFetchCount != *((_DWORD *)v4 + 8))
      goto LABEL_100;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_homeZoneFetchCount != *((_DWORD *)v4 + 10))
      goto LABEL_100;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_homeManagerUploadCount != *((_DWORD *)v4 + 9))
      goto LABEL_100;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_homeZoneUploadCount != *((_DWORD *)v4 + 11))
      goto LABEL_100;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&v9 & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_homeDataMegabytesFetched != *((_DWORD *)v4 + 6))
      goto LABEL_100;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_homeDataMegabytesPushed != *((_DWORD *)v4 + 7))
      goto LABEL_100;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_legacyHomeDataMegabytesFetched != *((_DWORD *)v4 + 12))
      goto LABEL_100;
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_legacyHomeDataMegabytesPushed != *((_DWORD *)v4 + 13))
      goto LABEL_100;
    v11 = 1;
  }
  else
  {
    v11 = (*((_DWORD *)v4 + 23) & 0x400) == 0;
  }
LABEL_101:

  return v11;
}

- (unint64_t)hash
{
  $041F038B063069CF3B0992C8591E5F7D has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $041F038B063069CF3B0992C8591E5F7D v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x800) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_pushCount;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_fetchCount;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_uploadCount;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_uploadErrorCount;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = -[NSMutableArray hash](self->_topReasons, "hash");
  v10 = -[NSMutableArray hash](self->_topErrors, "hash");
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) != 0)
  {
    v12 = 2654435761 * self->_uploadMaximumDelayReached;
    if ((*(_WORD *)&v11 & 0x4000) != 0)
    {
LABEL_14:
      v13 = 2654435761 * self->_hasDecryptionFailed;
      if ((*(_WORD *)&v11 & 0x8000) != 0)
        goto LABEL_15;
      goto LABEL_27;
    }
  }
  else
  {
    v12 = 0;
    if ((*(_WORD *)&v11 & 0x4000) != 0)
      goto LABEL_14;
  }
  v13 = 0;
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
LABEL_15:
    v14 = 2654435761 * self->_lastDecryptionFailed;
    if ((*(_BYTE *)&v11 & 2) != 0)
      goto LABEL_16;
    goto LABEL_28;
  }
LABEL_27:
  v14 = 0;
  if ((*(_BYTE *)&v11 & 2) != 0)
  {
LABEL_16:
    v15 = 2654435761 * self->_dataSyncState;
    if ((*(_BYTE *)&v11 & 0x20) != 0)
      goto LABEL_17;
    goto LABEL_29;
  }
LABEL_28:
  v15 = 0;
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
LABEL_17:
    v16 = 2654435761 * self->_homeManagerFetchCount;
    if ((*(_BYTE *)&v11 & 0x80) != 0)
      goto LABEL_18;
    goto LABEL_30;
  }
LABEL_29:
  v16 = 0;
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
LABEL_18:
    v17 = 2654435761 * self->_homeZoneFetchCount;
    if ((*(_BYTE *)&v11 & 0x40) != 0)
      goto LABEL_19;
    goto LABEL_31;
  }
LABEL_30:
  v17 = 0;
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
LABEL_19:
    v18 = 2654435761 * self->_homeManagerUploadCount;
    if ((*(_WORD *)&v11 & 0x100) != 0)
      goto LABEL_20;
    goto LABEL_32;
  }
LABEL_31:
  v18 = 0;
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
LABEL_20:
    v19 = 2654435761 * self->_homeZoneUploadCount;
    if ((*(_BYTE *)&v11 & 8) != 0)
      goto LABEL_21;
    goto LABEL_33;
  }
LABEL_32:
  v19 = 0;
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
LABEL_21:
    v20 = 2654435761 * self->_homeDataMegabytesFetched;
    if ((*(_BYTE *)&v11 & 0x10) != 0)
      goto LABEL_22;
    goto LABEL_34;
  }
LABEL_33:
  v20 = 0;
  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
LABEL_22:
    v21 = 2654435761 * self->_homeDataMegabytesPushed;
    if ((*(_WORD *)&v11 & 0x200) != 0)
      goto LABEL_23;
LABEL_35:
    v22 = 0;
    if ((*(_WORD *)&v11 & 0x400) != 0)
      goto LABEL_24;
LABEL_36:
    v23 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_34:
  v21 = 0;
  if ((*(_WORD *)&v11 & 0x200) == 0)
    goto LABEL_35;
LABEL_23:
  v22 = 2654435761 * self->_legacyHomeDataMegabytesFetched;
  if ((*(_WORD *)&v11 & 0x400) == 0)
    goto LABEL_36;
LABEL_24:
  v23 = 2654435761 * self->_legacyHomeDataMegabytesPushed;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 23);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 23);
    if ((v6 & 0x800) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_pushCount = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 23);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  self->_fetchCount = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v4 + 23);
  if ((v6 & 0x1000) == 0)
  {
LABEL_5:
    if ((v6 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_38:
  self->_uploadCount = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 23) & 0x2000) != 0)
  {
LABEL_6:
    self->_uploadErrorCount = *((_DWORD *)v4 + 21);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_7:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *((id *)v4 + 9);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[AWDHomeKitCloudSync addTopReasons:](self, "addTopReasons:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *((id *)v5 + 8);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[AWDHomeKitCloudSync addTopErrors:](self, "addTopErrors:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), (_QWORD)v18);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 0x10000) != 0)
  {
    self->_uploadMaximumDelayReached = *((_BYTE *)v5 + 90);
    *(_DWORD *)&self->_has |= 0x10000u;
    v17 = *((_DWORD *)v5 + 23);
    if ((v17 & 0x4000) == 0)
    {
LABEL_23:
      if ((v17 & 0x8000) == 0)
        goto LABEL_24;
      goto LABEL_42;
    }
  }
  else if ((v17 & 0x4000) == 0)
  {
    goto LABEL_23;
  }
  self->_hasDecryptionFailed = *((_BYTE *)v5 + 88);
  *(_DWORD *)&self->_has |= 0x4000u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 0x8000) == 0)
  {
LABEL_24:
    if ((v17 & 2) == 0)
      goto LABEL_25;
    goto LABEL_43;
  }
LABEL_42:
  self->_lastDecryptionFailed = *((_BYTE *)v5 + 89);
  *(_DWORD *)&self->_has |= 0x8000u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 2) == 0)
  {
LABEL_25:
    if ((v17 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_44;
  }
LABEL_43:
  self->_dataSyncState = *((_DWORD *)v5 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 0x20) == 0)
  {
LABEL_26:
    if ((v17 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_45;
  }
LABEL_44:
  self->_homeManagerFetchCount = *((_DWORD *)v5 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 0x80) == 0)
  {
LABEL_27:
    if ((v17 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_46;
  }
LABEL_45:
  self->_homeZoneFetchCount = *((_DWORD *)v5 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 0x40) == 0)
  {
LABEL_28:
    if ((v17 & 0x100) == 0)
      goto LABEL_29;
    goto LABEL_47;
  }
LABEL_46:
  self->_homeManagerUploadCount = *((_DWORD *)v5 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 0x100) == 0)
  {
LABEL_29:
    if ((v17 & 8) == 0)
      goto LABEL_30;
    goto LABEL_48;
  }
LABEL_47:
  self->_homeZoneUploadCount = *((_DWORD *)v5 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 8) == 0)
  {
LABEL_30:
    if ((v17 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_49;
  }
LABEL_48:
  self->_homeDataMegabytesFetched = *((_DWORD *)v5 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 0x10) == 0)
  {
LABEL_31:
    if ((v17 & 0x200) == 0)
      goto LABEL_32;
LABEL_50:
    self->_legacyHomeDataMegabytesFetched = *((_DWORD *)v5 + 12);
    *(_DWORD *)&self->_has |= 0x200u;
    if ((*((_DWORD *)v5 + 23) & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_49:
  self->_homeDataMegabytesPushed = *((_DWORD *)v5 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v17 = *((_DWORD *)v5 + 23);
  if ((v17 & 0x200) != 0)
    goto LABEL_50;
LABEL_32:
  if ((v17 & 0x400) != 0)
  {
LABEL_33:
    self->_legacyHomeDataMegabytesPushed = *((_DWORD *)v5 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_34:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)pushCount
{
  return self->_pushCount;
}

- (unsigned)fetchCount
{
  return self->_fetchCount;
}

- (unsigned)uploadCount
{
  return self->_uploadCount;
}

- (unsigned)uploadErrorCount
{
  return self->_uploadErrorCount;
}

- (NSMutableArray)topReasons
{
  return self->_topReasons;
}

- (void)setTopReasons:(id)a3
{
  objc_storeStrong((id *)&self->_topReasons, a3);
}

- (NSMutableArray)topErrors
{
  return self->_topErrors;
}

- (void)setTopErrors:(id)a3
{
  objc_storeStrong((id *)&self->_topErrors, a3);
}

- (BOOL)uploadMaximumDelayReached
{
  return self->_uploadMaximumDelayReached;
}

- (BOOL)hasDecryptionFailed
{
  return self->_hasDecryptionFailed;
}

- (BOOL)lastDecryptionFailed
{
  return self->_lastDecryptionFailed;
}

- (unsigned)homeManagerFetchCount
{
  return self->_homeManagerFetchCount;
}

- (unsigned)homeZoneFetchCount
{
  return self->_homeZoneFetchCount;
}

- (unsigned)homeManagerUploadCount
{
  return self->_homeManagerUploadCount;
}

- (unsigned)homeZoneUploadCount
{
  return self->_homeZoneUploadCount;
}

- (unsigned)homeDataMegabytesFetched
{
  return self->_homeDataMegabytesFetched;
}

- (unsigned)homeDataMegabytesPushed
{
  return self->_homeDataMegabytesPushed;
}

- (unsigned)legacyHomeDataMegabytesFetched
{
  return self->_legacyHomeDataMegabytesFetched;
}

- (unsigned)legacyHomeDataMegabytesPushed
{
  return self->_legacyHomeDataMegabytesPushed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topReasons, 0);
  objc_storeStrong((id *)&self->_topErrors, 0);
}

+ (Class)topReasonsType
{
  return (Class)objc_opt_class();
}

+ (Class)topErrorsType
{
  return (Class)objc_opt_class();
}

@end
