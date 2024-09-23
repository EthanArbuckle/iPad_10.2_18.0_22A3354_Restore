@implementation NMSMutableMediaSyncInfo

- (NMSMutableMediaSyncInfo)initWithTarget:(unint64_t)a3
{
  return (NMSMutableMediaSyncInfo *)-[NMSMediaSyncInfo _initWithTarget:readAndObserveChanges:](self, "_initWithTarget:readAndObserveChanges:", a3, 0);
}

- (unint64_t)statusForContainer:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v7.receiver = self;
  v7.super_class = (Class)NMSMutableMediaSyncInfo;
  v5 = -[NMSMediaSyncInfo statusForContainer:](&v7, sel_statusForContainer_, v4);

  return (unint64_t)v5;
}

- (unint64_t)playabilityForContainer:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v7.receiver = self;
  v7.super_class = (Class)NMSMutableMediaSyncInfo;
  v5 = -[NMSMediaSyncInfo playabilityForContainer:](&v7, sel_playabilityForContainer_, v4);

  return (unint64_t)v5;
}

- (float)progressForContainer:(id)a3
{
  id v4;
  float v5;
  float v6;
  objc_super v8;

  v4 = a3;
  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v8.receiver = self;
  v8.super_class = (Class)NMSMutableMediaSyncInfo;
  -[NMSMediaSyncInfo progressForContainer:](&v8, sel_progressForContainer_, v4);
  v6 = v5;

  return v6;
}

- (unint64_t)downloadPauseReasonForContainer:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v7.receiver = self;
  v7.super_class = (Class)NMSMutableMediaSyncInfo;
  v5 = -[NMSMediaSyncInfo downloadPauseReasonForContainer:](&v7, sel_downloadPauseReasonForContainer_, v4);

  return (unint64_t)v5;
}

- (BOOL)hasItemsOverStorageLimitForContainer:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v6.receiver = self;
  v6.super_class = (Class)NMSMutableMediaSyncInfo;
  LOBYTE(self) = -[NMSMediaSyncInfo hasItemsOverStorageLimitForContainer:](&v6, sel_hasItemsOverStorageLimitForContainer_, v4);

  return (char)self;
}

- (unint64_t)status
{
  objc_super v4;

  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  return -[NMSMediaSyncInfo status](&v4, sel_status);
}

- (float)progress
{
  float result;
  objc_super v4;

  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  -[NMSMediaSyncInfo progress](&v4, sel_progress);
  return result;
}

- (unint64_t)downloadPauseReason
{
  objc_super v4;

  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  return -[NMSMediaSyncInfo downloadPauseReason](&v4, sel_downloadPauseReason);
}

- (BOOL)hasItemsWaitingWithoutPauseReason
{
  objc_super v4;

  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  return -[NMSMediaSyncInfo hasItemsWaitingWithoutPauseReason](&v4, sel_hasItemsWaitingWithoutPauseReason);
}

- (BOOL)hasItemsOverStorageLimit
{
  objc_super v4;

  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)NMSMutableMediaSyncInfo;
  return -[NMSMediaSyncInfo hasItemsOverStorageLimit](&v4, sel_hasItemsOverStorageLimit);
}

- (void)setItems:(id)a3 forContainer:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  -[NMSMutableMediaSyncInfo _infoForContainer:](self, "_infoForContainer:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("itemsIdentifiers"));
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v6, "count");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("itemCount"));

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setOverStorageLimitBehavior:(unint64_t)a3 forContainer:(id)a4
{
  void *v6;
  id v7;

  -[NMSMutableMediaSyncInfo _infoForContainer:](self, "_infoForContainer:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("overStorageLimitBehavior"));

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setStatus:(unint64_t)a3 forItem:(id)a4
{
  void *v6;
  id v7;

  -[NMSMutableMediaSyncInfo _infoForItem:](self, "_infoForItem:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("status"));

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setProgressBytes:(unint64_t)a3 totalBytes:(unint64_t)a4 forItem:(id)a5
{
  void *v8;
  void *v9;
  id v10;

  -[NMSMutableMediaSyncInfo _infoForItem:](self, "_infoForItem:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("totalBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("progressBytes"));

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setDownloadPauseReason:(unint64_t)a3 forItem:(id)a4
{
  void *v6;
  id v7;

  -[NMSMutableMediaSyncInfo _infoForItem:](self, "_infoForItem:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("downloadPauseReason"));

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setOverStorageLimit:(BOOL)a3 forItem:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[NMSMutableMediaSyncInfo _infoForItem:](self, "_infoForItem:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("overStorageLimit"));

  self->_needsUpdateAggregateInfo = 1;
}

- (void)setUserInfo:(id)a3 forContainer:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[NMSMutableMediaSyncInfo _infoForContainer:](self, "_infoForContainer:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("userInfo"));

}

- (void)setUserInfo:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[NMSMutableMediaSyncInfo _infoForItem:](self, "_infoForItem:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("userInfo"));

}

- (void)synchronize
{
  -[NMSMutableMediaSyncInfo _updateAggregateInfoIfNeeded](self, "_updateAggregateInfoIfNeeded");
  -[NMSMutableMediaSyncInfo _writeInfo](self, "_writeInfo");
  -[NMSMutableMediaSyncInfo _notifyInfoChanged](self, "_notifyInfoChanged");
}

- (id)_info
{
  void *v3;
  void *v4;

  -[NMSMediaSyncInfo info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncInfo setInfo:](self, "setInfo:", v4);

  }
  return -[NMSMediaSyncInfo info](self, "info");
}

- (id)_infoForContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[NMSMediaSyncInfo info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("containers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMutableMediaSyncInfo _info](self, "_info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("containers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("containers"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("containers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v4);

  }
  return v7;
}

- (id)_infoForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[NMSMediaSyncInfo info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMutableMediaSyncInfo _info](self, "_info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("items"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("items"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("items"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v4);

  }
  return v7;
}

- (void)_updateAggregateInfoIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[10];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;

  if (self->_needsUpdateAggregateInfo)
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    -[NMSMediaSyncInfo info](self, "info");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("containers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke;
    v47[3] = &unk_24D6475F8;
    v47[4] = self;
    v47[5] = &v48;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v47);

    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 1;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    -[NMSMediaSyncInfo info](self, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke_3;
    v22[3] = &unk_24D647620;
    v22[4] = &v43;
    v22[5] = &v39;
    v22[6] = &v35;
    v22[7] = &v31;
    v22[8] = &v27;
    v22[9] = &v23;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v22);

    if (*((_BYTE *)v44 + 24))
      v8 = 4;
    else
      v8 = v40[3];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncInfo info](self, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("status"));

    v12 = v36[3];
    if (v12)
    {
      v13 = (double)(unint64_t)v32[3] / (double)v12;
    }
    else
    {
      LOBYTE(v11) = *((_BYTE *)v44 + 24);
      v13 = (double)v11;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncInfo info](self, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("cachedProgress"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v28[3]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncInfo info](self, "info");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("downloadPauseReason"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v24 + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncInfo info](self, "info");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("hasItemsWaitingWithoutPauseReason"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v49 + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncInfo info](self, "info");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("hasItemsOverStorageLimit"));

    self->_needsUpdateAggregateInfo = 0;
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v48, 8);
  }
}

void __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  _QWORD v25[15];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;

  v5 = a2;
  v6 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 1;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("overStorageLimitBehavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  if (v8 == 2)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemsIdentifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "count") != 0;

  }
  v29 = v9;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemsIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke_2;
  v25[3] = &unk_24D6475D0;
  v25[4] = *(_QWORD *)(a1 + 32);
  v25[5] = &v58;
  v25[6] = &v54;
  v25[7] = &v50;
  v25[8] = &v46;
  v25[9] = &v42;
  v25[10] = &v38;
  v25[11] = &v34;
  v25[12] = &v26;
  v25[13] = &v30;
  v25[14] = v8;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v25);

  if (*((_BYTE *)v59 + 24))
    v12 = 4;
  else
    v12 = v55[3];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("status"));

  v15 = v47[3];
  if (v15)
  {
    v16 = (double)(unint64_t)v43[3] / (double)v15;
  }
  else
  {
    LOBYTE(v14) = *((_BYTE *)v59 + 24);
    v16 = (double)v14;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("cachedProgress"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v39[3]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("downloadPauseReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v35 + 24));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("hasItemsWaitingWithoutPauseReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v51[3]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("playability"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v27 + 24));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("hasItemsOverStorageLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v31 + 24));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("hasDownloadableItemsWithinStorageLimitKey"));

  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v23 + 24))
    v24 = 1;
  else
    v24 = *((_BYTE *)v27 + 24) != 0;
  *(_BYTE *)(v23 + 24) = v24;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

}

void __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8)
  {
    if (v8 == 4)
    {
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
      v9 = *(_QWORD *)(a1[6] + 8);
      v10 = *(_QWORD *)(v9 + 24);
      if (v10 != 3)
      {
        if (v10 <= v8)
          v10 = v8;
        if (v8 == 3)
          v10 = 3;
        *(_QWORD *)(v9 + 24) = v10;
      }
    }
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("totalBytes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) += objc_msgSend(v11, "unsignedLongLongValue");

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("progressBytes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) += objc_msgSend(v12, "unsignedLongLongValue");

  }
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("downloadPauseReason"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) |= v14;
  if (v8 == 2 && v14 == 0)
    *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = 1;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("overStorageLimit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = a1[14];
  if (v18 == 2)
  {
    v19 = v21;
    if ((v17 & 1) != 0)
      goto LABEL_28;
    *(_BYTE *)(*(_QWORD *)(a1[12] + 8) + 24) = 0;
  }
  else if (v18 == 1)
  {
    v19 = v21;
    if (v17)
    {
      v20 = a1[12];
LABEL_27:
      *(_BYTE *)(*(_QWORD *)(v20 + 8) + 24) = 1;
      goto LABEL_28;
    }
  }
  else
  {
    v19 = v21;
    if ((v17 & 1) != 0)
      goto LABEL_28;
  }
  if ((v8 | 4) != 4)
  {
    v20 = a1[13];
    goto LABEL_27;
  }
LABEL_28:

}

void __55__NMSMutableMediaSyncInfo__updateAggregateInfoIfNeeded__block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5)
  {
    if (v5 != 4)
    {
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
      v6 = *(_QWORD *)(a1[5] + 8);
      v7 = *(_QWORD *)(v6 + 24);
      if (v7 != 3)
      {
        if (v7 <= v5)
          v7 = v5;
        if (v5 == 3)
          v7 = 3;
        *(_QWORD *)(v6 + 24) = v7;
      }
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("totalBytes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v8, "unsignedLongLongValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("progressBytes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v9, "unsignedLongLongValue");

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("downloadPauseReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) |= v11;
  if (v5 == 2 && !v11)
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;

}

- (void)_writeInfo
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  unint64_t v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NMSMutableMediaSyncInfo _persistingOptions](self, "_persistingOptions");
  -[NMSMediaSyncInfo info](self, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __37__NMSMutableMediaSyncInfo__writeInfo__block_invoke;
  v34[3] = &unk_24D647648;
  v36 = v5;
  v8 = v4;
  v35 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v34);

  if (objc_msgSend(v8, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("containers"));
  if ((v5 & 4) != 0)
  {
    -[NMSMediaSyncInfo info](self, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("status"));

    -[NMSMediaSyncInfo info](self, "info");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cachedProgress"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cachedProgress"));

    -[NMSMediaSyncInfo info](self, "info");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("downloadPauseReason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("downloadPauseReason"));

    -[NMSMediaSyncInfo info](self, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hasItemsWaitingWithoutPauseReason"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasItemsWaitingWithoutPauseReason"));

    v17 = (void *)MEMORY[0x24BDD16E0];
    -[NMSMediaSyncInfo info](self, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("items"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("itemCount"));

    -[NMSMediaSyncInfo info](self, "info");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("hasItemsOverStorageLimit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("hasItemsOverStorageLimit"));

  }
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "debugSyncInfoEnabled");

  if (v24)
  {
    -[NMSMediaSyncInfo info](self, "info");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("debug-info"));

  }
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[NMSMediaSyncInfo target](self, "target"))
  {
    case 0uLL:
      objc_msgSend(v26, "setMusicSyncInfo:", v3);
      break;
    case 1uLL:
      objc_msgSend(v26, "setPodcastsSyncInfo:", v3);
      -[NMSMediaSyncInfo info](self, "info");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("items"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v37 = CFSTR("items");
        -[NMSMediaSyncInfo info](self, "info");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("items"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = (void *)MEMORY[0x24BDBD1B8];
      }

      -[NMSMediaSyncInfo _syncInfoFilePath](self, "_syncInfoFilePath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "writeToFile:atomically:", v33, 1);

      break;
    case 2uLL:
      objc_msgSend(v26, "setAudiobooksSyncInfo:", v3);
      break;
    case 3uLL:
    case 4uLL:
      -[NMSMediaSyncInfo _syncInfoFilePath](self, "_syncInfoFilePath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writeToFile:atomically:", v27, 1);

      break;
    default:
      break;
  }

}

void __37__NMSMutableMediaSyncInfo__writeInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemsIdentifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("itemsIdentifiers"));

    v7 = *(_QWORD *)(a1 + 40);
  }
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("status"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("playability"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("playability"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cachedProgress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("cachedProgress"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("downloadPauseReason"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("downloadPauseReason"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasItemsWaitingWithoutPauseReason"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("hasItemsWaitingWithoutPauseReason"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("itemCount"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasItemsOverStorageLimit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("hasItemsOverStorageLimit"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasDownloadableItemsWithinStorageLimitKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("hasDownloadableItemsWithinStorageLimitKey"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("userInfo"));

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v18);

}

- (unint64_t)_persistingOptions
{
  unint64_t v2;

  v2 = -[NMSMediaSyncInfo target](self, "target");
  if (v2 > 4)
    return 0;
  else
    return qword_216E74590[v2];
}

- (void)_notifyInfoChanged
{
  id v2;

  -[NMSMediaSyncInfo _notificationName](self, "_notificationName");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v2, "UTF8String"));

}

+ (id)requiredUserInfoPropertiesForModelKind:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identityKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDDCB30];
    v8 = *MEMORY[0x24BDDBD88];
    v19[0] = *MEMORY[0x24BDDBDA0];
    v19[1] = v8;
    v9 = (void *)MEMORY[0x24BDBCE30];
    v10 = v19;
  }
  else
  {
    objc_msgSend(v3, "identityKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    v7 = (void *)MEMORY[0x24BDDCB30];
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v14 = *MEMORY[0x24BDDBF40];
    v18[0] = *MEMORY[0x24BDDBF50];
    v18[1] = v14;
    v9 = (void *)MEMORY[0x24BDBCE30];
    v10 = v18;
  }
  objc_msgSend(v9, "arrayWithObjects:count:", v10, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertySetWithProperties:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v16;
}

- (void)setUserInfoForModelObject:(id)a3 manuallyPinned:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v33;
    v8 = (void *)MEMORY[0x24BE6B170];
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "midDataFromAlbumPID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("midData"));

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "keepLocalEnableState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("keepLocal"));

    }
    else
    {
      objc_msgSend(v6, "setObject:forKey:", &unk_24D655B78, CFSTR("keepLocal"));
    }
    objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncInfo _syncInfoModelKindForMPModelKind:](self, "_syncInfoModelKindForMPModelKind:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v24, CFSTR("modelKind"));

    objc_msgSend(v7, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_14;
    objc_msgSend(v7, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("title");
LABEL_13:
    objc_msgSend(v6, "setObject:forKey:", v26, v27);

LABEL_14:
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v33;
    v16 = (void *)MEMORY[0x24BE6B170];
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "identifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "library");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v19, "persistentID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "midDataFromPlaylistPID:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v21, CFSTR("midData"));

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "keepLocalEnableState"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v22, CFSTR("keepLocal"));

    }
    else
    {
      objc_msgSend(v6, "setObject:forKey:", &unk_24D655B78, CFSTR("keepLocal"));
    }
    objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncInfo _syncInfoModelKindForMPModelKind:](self, "_syncInfoModelKindForMPModelKind:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v29, CFSTR("modelKind"));

    objc_msgSend(v15, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_14;
    objc_msgSend(v15, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("name");
    goto LABEL_13;
  }
LABEL_15:
  v31 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v33, "nms_syncInfoContainerIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMutableMediaSyncInfo setUserInfo:forContainer:](self, "setUserInfo:forContainer:", v31, v32);

}

@end
