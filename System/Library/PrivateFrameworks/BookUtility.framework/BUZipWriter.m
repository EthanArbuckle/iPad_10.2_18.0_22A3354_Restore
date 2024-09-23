@implementation BUZipWriter

- (BUZipWriter)init
{
  return (BUZipWriter *)MEMORY[0x24BEDD108](self, sel_initWithOptions_, 0);
}

- (BUZipWriter)initWithOptions:(unint64_t)a3
{
  BUZipWriter *v4;
  BUZipWriter *v5;
  uint64_t v6;
  NSMutableArray *entries;
  uint64_t v8;
  NSMutableDictionary *entriesMap;
  dispatch_queue_t v10;
  OS_dispatch_queue *channelQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *writeQueue;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSDate *updatedEntryLastModificationDate;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BUZipWriter;
  v4 = -[BUZipWriter init](&v19, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = objc_opt_new();
    entries = v5->_entries;
    v5->_entries = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = (NSMutableDictionary *)v8;

    v10 = dispatch_queue_create("BUZipWriter.Channel", 0);
    channelQueue = v5->_channelQueue;
    v5->_channelQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("BUZipWriter.Write", 0);
    writeQueue = v5->_writeQueue;
    v5->_writeQueue = (OS_dispatch_queue *)v12;

    objc_msgSend_date(MEMORY[0x24BDBCE60], v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    updatedEntryLastModificationDate = v5->_updatedEntryLastModificationDate;
    v5->_updatedEntryLastModificationDate = (NSDate *)v16;

  }
  return v5;
}

- (unint64_t)entriesCount
{
  uint64_t v2;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend_writeQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212E4E8FC;
  v7[3] = &unk_24CED9AC8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unint64_t)entriesCountImpl
{
  uint64_t v2;

  return objc_msgSend_count(self->_entriesMap, a2, v2);
}

- (id)p_writeChannel
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BURandomWriteChannel *writeChannel;
  id result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  BURandomWriteChannel *v21;
  BURandomWriteChannel *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  dispatch_group_t v31;

  objc_msgSend_channelQueue(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == (void *)MEMORY[0x24BDAC9B8])
    objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], v4, v5);

  writeChannel = self->_writeChannel;
  if (writeChannel)
    return writeChannel;
  if (!self->_writeChannelCompletionGroup)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = sub_212E4EAA0;
    v30 = sub_212E4EAB0;
    v31 = dispatch_group_create();
    dispatch_group_enter((dispatch_group_t)v27[5]);
    objc_msgSend_setWriteChannelCompletionGroup_(self, v19, v27[5]);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_212E4EAB8;
    v25[3] = &unk_24CED9AF0;
    v25[4] = &v26;
    objc_msgSend_prepareWriteChannelWithCloseCompletionHandler_(self, v20, (uint64_t)v25);
    v21 = (BURandomWriteChannel *)objc_claimAutoreleasedReturnValue();
    v22 = self->_writeChannel;
    self->_writeChannel = v21;

    _Block_object_dispose(&v26, 8);
    writeChannel = self->_writeChannel;
    return writeChannel;
  }
  BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 107, (uint64_t)"-[BUZipWriter p_writeChannel]", (uint64_t)"_writeChannelCompletionGroup == nil", CFSTR("Write channel dispatch group should not be initialized."), v7, v8, v9, v23);
  BUCrashBreakpoint();
  result = (id)BUIsRunningTests();
  if ((result & 1) != 0)
    BUCrashFinalThrow(CFSTR("Write channel dispatch group should not be initialized."), v12, v13, v14, v15, v16, v17, v18, v24);
  __break(1u);
  return result;
}

- (void)beginEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  unint64_t v24;
  unsigned int v25;
  BOOL v26;
  BOOL v27;

  v14 = a3;
  v15 = a5;
  objc_msgSend_writeQueue(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E4EBB0;
  block[3] = &unk_24CED9B18;
  block[4] = self;
  v22 = v14;
  v26 = a4;
  v23 = v15;
  v24 = a6;
  v25 = a7;
  v27 = a8;
  v19 = v15;
  v20 = v14;
  dispatch_async(v18, block);

}

- (void)beginEntryWithNameImpl:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  _BOOL4 v8;
  uLong v9;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSDate *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  BUZipWriterEntry *v32;
  BUZipWriterEntry *currentEntry;
  const char *v34;
  const char *v35;
  const char *v36;
  _BOOL4 v37;
  const char *v38;
  BOOL v39;
  _BOOL4 v40;
  uLong v41;
  const char *v42;
  NSDate *v43;
  NSDate *lastModificationDateIfSizeAndCRCMatches;
  NSDate *updatedEntryLastModificationDate;
  const char *v46;
  const char *v47;
  void *v48;
  NSMutableArray *v49;
  NSMutableArray *entryDatas;
  OS_dispatch_data *localFileHeaderData;
  uint64_t v52;
  uint64_t v53;
  id v54;

  v8 = a8;
  v9 = *(_QWORD *)&a7;
  v54 = a3;
  v19 = (NSDate *)a5;
  if (self->_closed)
  {
    BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 133, (uint64_t)"-[BUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]", (uint64_t)"!self->_closed", CFSTR("Already closed."), v16, v17, v18, v52);
    BUCrashBreakpoint();
    if ((BUIsRunningTests() & 1) != 0)
      BUCrashFinalThrow(CFSTR("Already closed."), v20, v21, v22, v23, v24, v25, v26, v53);
    __break(1u);
  }
  else
  {
    objc_msgSend_error(self, v14, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      objc_msgSend_finishEntry(self, v28, v29);
      objc_msgSend_objectForKeyedSubscript_(self->_entriesMap, v30, (uint64_t)v54);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        v32 = objc_alloc_init(BUZipWriterEntry);
        currentEntry = self->_currentEntry;
        self->_currentEntry = v32;

        objc_msgSend_setName_(self->_currentEntry, v34, (uint64_t)v54);
        objc_msgSend_setOffset_(self->_currentEntry, v35, self->_currentOffset);
        if (a6)
          v37 = v8;
        else
          v37 = 1;
        self->_calculateSize = v37;
        if (v37)
          objc_msgSend_setSize_(self->_currentEntry, v36, 0);
        else
          objc_msgSend_setSize_(self->_currentEntry, v36, a6);
        v39 = self->_calculateSize && a4;
        self->_force32BitSize = v39;
        if ((_DWORD)v9)
          v40 = v8;
        else
          v40 = 1;
        self->_calculateCRC = v40;
        v41 = v9;
        if (v40)
          v41 = crc32(0, 0, 0);
        objc_msgSend_setCRC_(self->_currentEntry, v38, v41);
        if (v8)
        {
          objc_msgSend_setLastModificationDate_(self->_currentEntry, v42, (uint64_t)self->_updatedEntryLastModificationDate);
          self->_sizeToMatch = a6;
          self->_CRCToMatch = v9;
          v43 = v19;
          lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
          self->_lastModificationDateIfSizeAndCRCMatches = v43;
        }
        else
        {
          updatedEntryLastModificationDate = v19;
          if (!v19)
            updatedEntryLastModificationDate = self->_updatedEntryLastModificationDate;
          objc_msgSend_setLastModificationDate_(self->_currentEntry, v42, (uint64_t)updatedEntryLastModificationDate);
          lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
          self->_sizeToMatch = 0;
          self->_lastModificationDateIfSizeAndCRCMatches = 0;
          self->_CRCToMatch = 0;
        }

        objc_msgSend_localFileHeaderDataForEntry_(self, v46, (uint64_t)self->_currentEntry);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if ((self->_calculateSize || self->_calculateCRC) && (self->_options & 8) == 0)
        {
          objc_storeStrong((id *)&self->_localFileHeaderData, v48);
          v49 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
          entryDatas = self->_entryDatas;
          self->_entryDatas = v49;
        }
        else
        {
          objc_msgSend_writeData_(self, v47, (uint64_t)v48);
          localFileHeaderData = self->_localFileHeaderData;
          self->_localFileHeaderData = 0;

          entryDatas = self->_entryDatas;
          self->_entryDatas = 0;
        }

        self->_entryDataSize = 0;
      }
    }

  }
}

- (void)addData:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_addData_queue_completion_, a3);
}

- (void)addData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_writeQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_212E4EF00;
  v17[3] = &unk_24CED9B40;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)addDataImpl:(id)a3 queue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  const char *v26;
  size_t size;
  NSMutableArray *entryDatas;
  NSObject *localFileHeaderData;
  const char *v30;
  OS_dispatch_data *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void (**v36)(_QWORD, _QWORD);
  void *v37;
  BUZipWriterEntry *currentEntry;
  uint64_t v39;
  const char *v40;
  uint64_t v41[5];
  _QWORD v42[4];
  void (**v43)(_QWORD, _QWORD);
  _QWORD block[4];
  id v45;
  void (**v46)(_QWORD, _QWORD);

  v8 = a3;
  v9 = a4;
  v15 = a5;
  if (!self->_closed)
  {
    objc_msgSend_error(self, v10, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A7288](v15);
      v25 = v24;
      if (v24)
      {
        if (v9)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = sub_212E4F1C0;
          block[3] = &unk_24CED9B68;
          v46 = v24;
          v45 = v23;
          dispatch_async(v9, block);

        }
        else
        {
          ((void (**)(_QWORD, void *))v24)[2](v24, v23);
        }
      }

LABEL_23:
      return;
    }
    size = dispatch_data_get_size(v8);
    entryDatas = self->_entryDatas;
    if (entryDatas)
    {
      localFileHeaderData = self->_localFileHeaderData;
      if (dispatch_data_get_size(localFileHeaderData) + size + self->_entryDataSize < 0x40000)
      {
        objc_msgSend_addObject_(entryDatas, v30, (uint64_t)v8);
        self->_entryDataSize += size;
        v36 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A7288](v15);
        v37 = v36;
        if (v36)
        {
          if (v9)
          {
            v42[0] = MEMORY[0x24BDAC760];
            v42[1] = 3221225472;
            v42[2] = sub_212E4F1D0;
            v42[3] = &unk_24CED9B90;
            v43 = v36;
            dispatch_async(v9, v42);

          }
          else
          {
            v36[2](v36, 0);
          }
        }

        goto LABEL_19;
      }
      objc_msgSend_writeData_(self, v30, (uint64_t)localFileHeaderData);
      v31 = self->_localFileHeaderData;
      self->_localFileHeaderData = 0;

      objc_msgSend_flushEntryData(self, v32, v33);
    }
    objc_msgSend_writeData_queue_completion_(self, v26, (uint64_t)v8, v9, v15);
LABEL_19:
    if (self->_calculateSize)
    {
      currentEntry = self->_currentEntry;
      v39 = objc_msgSend_size(currentEntry, v34, v35);
      objc_msgSend_setSize_(currentEntry, v40, v39 + size);
    }
    if (self->_calculateCRC)
    {
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = (uint64_t)sub_212E4F1E0;
      v41[3] = (uint64_t)&unk_24CED9BB8;
      v41[4] = (uint64_t)self;
      dispatch_data_apply(v8, v41);
    }
    goto LABEL_23;
  }
  BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 202, (uint64_t)"-[BUZipWriter addDataImpl:queue:completion:]", (uint64_t)"!self->_closed", CFSTR("Already closed."), v12, v13, v14, v41[0]);
  BUCrashBreakpoint();
  if ((BUIsRunningTests() & 1) != 0)
    BUCrashFinalThrow(CFSTR("Already closed."), v16, v17, v18, v19, v20, v21, v22, v41[0]);
  __break(1u);
}

- (void)flushEntryData
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *entryDatas;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_entryDatas;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, v15, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend_writeData_(self, v6, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v11, v15, 16);
    }
    while (v7);
  }

  entryDatas = self->_entryDatas;
  self->_entryDatas = 0;

  self->_entryDataSize = 0;
}

- (void)flushCurrentEntryWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_writeQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E4F41C;
  block[3] = &unk_24CED9C30;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)finishEntry
{
  BUZipWriterEntry *currentEntry;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  OS_dispatch_data *localFileHeaderData;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  BUZipWriterEntry *v25;
  NSMutableDictionary *entriesMap;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSArray *sortedEntries;
  BUZipWriterEntry *v32;

  currentEntry = self->_currentEntry;
  if (!currentEntry)
    return;
  if (!self->_calculateSize && !self->_calculateCRC)
  {
LABEL_19:
    objc_msgSend_addObject_(self->_entries, a2, (uint64_t)currentEntry);
    entriesMap = self->_entriesMap;
    v25 = self->_currentEntry;
    objc_msgSend_name(v25, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(entriesMap, v30, (uint64_t)v25, v29);

    sortedEntries = self->_sortedEntries;
    self->_sortedEntries = 0;

    v32 = self->_currentEntry;
    self->_currentEntry = 0;

    return;
  }
  if (!self->_force32BitSize)
  {
LABEL_11:
    if (self->_lastModificationDateIfSizeAndCRCMatches)
    {
      v15 = objc_msgSend_size(currentEntry, a2, (uint64_t)currentEntry);
      currentEntry = self->_currentEntry;
      if (v15 == self->_sizeToMatch)
      {
        v16 = objc_msgSend_CRC(self->_currentEntry, a2, (uint64_t)currentEntry);
        currentEntry = self->_currentEntry;
        if (v16 == self->_CRCToMatch)
        {
          objc_msgSend_setLastModificationDate_(self->_currentEntry, a2, (uint64_t)self->_lastModificationDateIfSizeAndCRCMatches);
          currentEntry = self->_currentEntry;
        }
      }
    }
    objc_msgSend_localFileHeaderDataForEntry_(self, a2, (uint64_t)currentEntry);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_entryDatas)
    {
      objc_msgSend_writeData_(self, v17, (uint64_t)v19);
      localFileHeaderData = self->_localFileHeaderData;
      self->_localFileHeaderData = 0;

      objc_msgSend_flushEntryData(self, v21, v22);
    }
    else
    {
      v23 = objc_msgSend_offset(self->_currentEntry, v17, v18);
      objc_msgSend_writeData_offset_(self, v24, (uint64_t)v19, v23);
    }

    currentEntry = self->_currentEntry;
    goto LABEL_19;
  }
  if (!((unint64_t)objc_msgSend_size(self->_currentEntry, a2, (uint64_t)currentEntry) >> 32))
  {
    currentEntry = self->_currentEntry;
    goto LABEL_11;
  }
  BUZipLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_212E6C0A8(v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleWriteError_(self, v14, (uint64_t)v13);

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 completion:(id)a9
{
  uint64_t v10;
  _BOOL8 v13;
  id v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;

  v10 = *(_QWORD *)&a7;
  v13 = a4;
  v16 = a9;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_212E4F9B4;
  v19[3] = &unk_24CED9C58;
  v20 = v16;
  v17 = v16;
  objc_msgSend_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler_(self, v18, (uint64_t)a3, v13, a5, a6, v10, a8, v19);

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 writeHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  unsigned int v32;
  BOOL v33;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  objc_msgSend_writeQueue(self, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E4FB48;
  block[3] = &unk_24CED9CA8;
  block[4] = self;
  v27 = v15;
  v33 = a4;
  v32 = a7;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = a6;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  dispatch_async(v21, block);

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 fromReadChannel:(id)a5 completion:(id)a6
{
  objc_msgSend_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_completion_(self, a2, (uint64_t)a3, a4, 0, 0, 0, a5, a6);
}

- (void)addExistingEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend_writeQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E4FE2C;
  block[3] = &unk_24CED9CD0;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (void)addExistingEntryImpl:(id)a3
{
  BUZipWriterEntry *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  NSMutableDictionary *entriesMap;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  NSArray *sortedEntries;
  id v34;

  v34 = a3;
  v4 = objc_alloc_init(BUZipWriterEntry);
  objc_msgSend_name(v34, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  objc_msgSend_lastModificationDate(v34, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastModificationDate_(v4, v12, (uint64_t)v11);

  if (objc_msgSend_isCompressed(v34, v13, v14))
    v17 = objc_msgSend_compressedSize(v34, v15, v16);
  else
    v17 = objc_msgSend_size(v34, v15, v16);
  objc_msgSend_setSize_(v4, v18, v17);
  v21 = objc_msgSend_offset(v34, v19, v20);
  objc_msgSend_setOffset_(v4, v22, v21);
  v25 = objc_msgSend_CRC(v34, v23, v24);
  objc_msgSend_setCRC_(v4, v26, v25);
  objc_msgSend_addObject_(self->_entries, v27, (uint64_t)v4);
  entriesMap = self->_entriesMap;
  objc_msgSend_name(v34, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(entriesMap, v32, (uint64_t)v4, v31);

  sortedEntries = self->_sortedEntries;
  self->_sortedEntries = 0;

}

- (void)setEntryInsertionOffset:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  objc_msgSend_writeQueue(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212E4FFD0;
  v6[3] = &unk_24CED9CF8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)setEntryInsertionOffsetImpl:(int64_t)a3
{
  self->_currentOffset = a3;
  self->_writtenOffset = a3;
}

- (void)addBarrier:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_writeQueue(self, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_212E50084;
    v8[3] = &unk_24CED9D20;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (void)closeWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_writeQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E502E0;
  block[3] = &unk_24CED9C30;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)writeCentralDirectory
{
  int64_t currentOffset;
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  currentOffset = self->_currentOffset;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_entries;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, v20, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend_writeCentralFileHeaderDataForEntry_(self, v7, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++), (_QWORD)v16);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, v20, 16);
    }
    while (v8);
  }

  v11 = self->_currentOffset - currentOffset;
  v14 = objc_msgSend_count(self->_entries, v12, v13);
  objc_msgSend_writeEndOfCentralDirectoryDataWithOffset_size_entryCount_(self, v15, currentOffset, v11, v14);
}

- (id)localFileHeaderDataForEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  size_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _BOOL4 v24;
  unsigned int v25;
  _DWORD *v26;
  char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  int v39;
  int v40;
  const char *v41;
  uint64_t v42;
  char *v43;
  const char *v44;
  uint64_t v45;
  dispatch_data_t v46;
  _BOOL4 v48;
  const char *__src;

  v4 = a3;
  objc_msgSend_name(v4, v5, v6);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);

  __src = v10;
  v13 = strlen(v10);
  if (v13 >= 0x10000)
  {
    BUZipLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_212E6C0D8(v14, v15, v16, v17, v18, v19, v20, v21);

    v13 = 0xFFFFLL;
  }
  v22 = self->_options & 1;
  v23 = v22 | ((unint64_t)objc_msgSend_size(v4, v11, v12) >> 32);
  v24 = v23 != 0;
  if (v23 || self->_calculateSize)
  {
    v48 = !self->_force32BitSize;
    if (self->_force32BitSize)
      v25 = 0;
    else
      v25 = 20;
  }
  else
  {
    v48 = 0;
    v25 = 0;
  }
  v26 = malloc_type_malloc(v13 + v25 + 30, 0xEBFD76E7uLL);
  v27 = (char *)v26 + 30;
  *v26 = 67324752;
  v26[1] = 20;
  *((_WORD *)v26 + 4) = 0;
  objc_msgSend_lastModificationDate(v4, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_bu_DOSTime(v30, v31, v32);

  HIDWORD(v34) = v33;
  LODWORD(v34) = v33;
  *(_DWORD *)((char *)v26 + 10) = v34 >> 16;
  *(_DWORD *)((char *)v26 + 14) = objc_msgSend_CRC(v4, v35, v36);
  if (!v24)
  {
    *(_DWORD *)((char *)v26 + 18) = objc_msgSend_size(v4, v37, v38);
LABEL_17:
    v40 = objc_msgSend_size(v4, v37, v38);
    goto LABEL_18;
  }
  if (self->_force32BitSize)
    v39 = objc_msgSend_size(v4, v37, v38);
  else
    v39 = -1;
  *(_DWORD *)((char *)v26 + 18) = v39;
  if (self->_force32BitSize)
    goto LABEL_17;
  v40 = -1;
LABEL_18:
  *(_DWORD *)((char *)v26 + 22) = v40;
  *((_WORD *)v26 + 13) = v13;
  *((_WORD *)v26 + 14) = v25;
  memcpy(v27, __src, v13);
  if (v48)
  {
    v43 = &v27[v13];
    *(_WORD *)v43 = BUZip64ExtraFieldSignature;
    *((_WORD *)v43 + 1) = 16;
    *(_QWORD *)(v43 + 4) = objc_msgSend_size(v4, v41, v42);
    *(_QWORD *)(v43 + 12) = objc_msgSend_size(v4, v44, v45);
  }
  v46 = dispatch_data_create(v26, v13 + v25 + 30, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);

  return v46;
}

- (void)writeCentralFileHeaderDataForEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  size_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int v27;
  _BOOL4 v28;
  uint64_t v29;
  char *v30;
  char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t *v48;
  char *v49;
  char *v50;
  const char *v51;
  uint64_t v52;
  dispatch_data_t v53;
  const char *v54;
  uint64_t size;
  BUZipWriter *v56;

  v4 = a3;
  objc_msgSend_name(v4, v5, v6);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);

  v13 = strlen(v10);
  if (v13 >= 0x10000)
  {
    BUZipLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_212E6C0D8(v14, v15, v16, v17, v18, v19, v20, v21);

    v13 = 0xFFFFLL;
  }
  v56 = self;
  v22 = self->_options & 2;
  v23 = v22 | ((unint64_t)objc_msgSend_size(v4, v11, v12) >> 32);
  v26 = v22 | ((unint64_t)objc_msgSend_offset(v4, v24, v25) >> 32);
  v27 = 4 * ((v23 | v26) != 0);
  if (v23)
    v27 = 20;
  v28 = v26 != 0;
  if (v26)
    v29 = v27 | 8;
  else
    v29 = v27;
  size = v13 + v29 + 46;
  v30 = (char *)malloc_type_malloc(size, 0x6AC2CF73uLL);
  v31 = v30 + 46;
  *(_DWORD *)v30 = 33639248;
  *(_QWORD *)(v30 + 4) = 1310782;
  objc_msgSend_lastModificationDate(v4, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_bu_DOSTime(v34, v35, v36);

  HIDWORD(v38) = v37;
  LODWORD(v38) = v37;
  *((_DWORD *)v30 + 3) = v38 >> 16;
  *((_DWORD *)v30 + 4) = objc_msgSend_CRC(v4, v39, v40);
  if (v23)
  {
    v43 = -1;
    *((_DWORD *)v30 + 5) = -1;
  }
  else
  {
    *((_DWORD *)v30 + 5) = objc_msgSend_size(v4, v41, v42);
    v43 = objc_msgSend_size(v4, v44, v45);
  }
  *((_DWORD *)v30 + 6) = v43;
  *((_WORD *)v30 + 14) = v13;
  *((_WORD *)v30 + 15) = v29;
  *((_QWORD *)v30 + 4) = 0;
  *((_WORD *)v30 + 20) = 0;
  if (v28)
  {
    *(_DWORD *)(v30 + 42) = -1;
    memcpy(v31, v10, v13);
    *(_WORD *)&v31[v13] = BUZip64ExtraFieldSignature;
    v48 = (uint64_t *)&v31[v13 + 4];
    *(_WORD *)&v31[v13 + 2] = 0;
    v49 = &v31[v13 + 2];
    if (!v23)
      goto LABEL_20;
  }
  else
  {
    *(_DWORD *)(v30 + 42) = objc_msgSend_offset(v4, v41, v42);
    memcpy(v31, v10, v13);
    if (!v23)
      goto LABEL_21;
    v48 = (uint64_t *)&v31[v13 + 4];
    *(_WORD *)&v31[v13] = BUZip64ExtraFieldSignature;
    v49 = &v31[v13 + 2];
  }
  v50 = &v31[v13];
  *(_WORD *)v49 = 16;
  *v48 = objc_msgSend_size(v4, v46, v47);
  *(_QWORD *)(v50 + 12) = objc_msgSend_size(v4, v51, v52);
  if (v28)
  {
    v48 = (uint64_t *)(v50 + 20);
LABEL_20:
    *(_WORD *)v49 += 8;
    *v48 = objc_msgSend_offset(v4, v46, v47);
  }
LABEL_21:
  v53 = dispatch_data_create(v30, size, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  objc_msgSend_writeData_(v56, v54, (uint64_t)v53);

}

- (void)writeEndOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  __int16 v5;
  int v6;
  int v7;
  int v9;
  int v10;
  int v11;
  int64_t currentOffset;
  const char *v13;
  _WORD *v14;
  __int16 v15;
  int v16;
  int v17;
  const char *v18;
  dispatch_data_t v19;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (a5 > 0xFFFE)
    v9 = 1;
  else
    v9 = (LOBYTE(self->_options) >> 2) & 1;
  if (a4 > 4294967294)
    v10 = 1;
  else
    v10 = (LOBYTE(self->_options) >> 2) & 1;
  if (a3 > 4294967294)
    v11 = 1;
  else
    v11 = (LOBYTE(self->_options) >> 2) & 1;
  if ((v9 & 1) != 0 || (v10 & 1) != 0 || v11)
  {
    currentOffset = self->_currentOffset;
    objc_msgSend_writeZip64EndOfCentralDirectoryWithOffset_size_entryCount_(self, a2, a3, a4, a5);
    objc_msgSend_writeZip64EndOfCentralDirectoryLocatorWithOffset_(self, v13, currentOffset);
  }
  v14 = malloc_type_malloc(0x16uLL, 0x33859FF3uLL);
  *(_QWORD *)v14 = 101010256;
  if (v9)
    v15 = -1;
  else
    v15 = v5;
  v14[4] = v15;
  v14[5] = v15;
  if (v10)
    v16 = -1;
  else
    v16 = v6;
  if (v11)
    v17 = -1;
  else
    v17 = v7;
  *((_DWORD *)v14 + 3) = v16;
  *((_DWORD *)v14 + 4) = v17;
  v14[10] = 0;
  v19 = dispatch_data_create(v14, 0x16uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  objc_msgSend_writeData_(self, v18, (uint64_t)v19);

}

- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  _QWORD *v9;
  const char *v10;
  dispatch_data_t v11;

  v9 = malloc_type_malloc(0x38uLL, 0xA2BE1896uLL);
  *(_DWORD *)v9 = 101075792;
  *(_QWORD *)((char *)v9 + 4) = 44;
  v9[2] = 0;
  v9[3] = a5;
  *((_DWORD *)v9 + 3) = 1310782;
  v9[4] = a5;
  v9[5] = a4;
  v9[6] = a3;
  v11 = dispatch_data_create(v9, 0x38uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  objc_msgSend_writeData_(self, v10, (uint64_t)v11);

}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  _DWORD *v5;
  const char *v6;
  dispatch_data_t v7;

  v5 = malloc_type_malloc(0x14uLL, 0xD99594C3uLL);
  *v5 = 117853008;
  v5[1] = 0;
  *((_QWORD *)v5 + 1) = a3;
  v5[4] = 1;
  v7 = dispatch_data_create(v5, 0x14uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  objc_msgSend_writeData_(self, v6, (uint64_t)v7);

}

- (void)writeData:(id)a3
{
  objc_msgSend_writeData_queue_completion_(self, a2, (uint64_t)a3, 0, 0);
}

- (void)writeData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  size_t size;
  int64_t writtenOffset;
  id v12;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  size = dispatch_data_get_size((dispatch_data_t)a3);
  self->_currentOffset += size;
  writtenOffset = self->_writtenOffset;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_212E51068;
  v15[3] = &unk_24CED9D70;
  v16 = v8;
  v17 = v9;
  v12 = v8;
  v13 = v9;
  objc_msgSend_p_writeData_offset_completion_(self, v14, (uint64_t)a3, writtenOffset, v15);
  self->_writtenOffset += size;

}

- (void)writeData:(id)a3 offset:(int64_t)a4
{
  objc_msgSend_p_writeData_offset_completion_(self, a2, (uint64_t)a3, a4, 0);
}

- (void)p_writeData:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend_channelQueue(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_212E51210;
  v15[3] = &unk_24CED9DE8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = a4;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("%@: %s"), CFSTR("Abstract method"), "-[BUZipWriter prepareWriteChannelWithCloseCompletionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v4, v8, v5, v7, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (unint64_t)archiveLength
{
  uint64_t v2;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend_writeQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212E5159C;
  v7[3] = &unk_24CED9AC8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)handleWriteError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char isEqualToString;
  const char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  _QWORD block[5];

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    if (objc_msgSend_code(v4, v5, v6) != 3072
      || (objc_msgSend_domain(v7, v8, v9),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToString = objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x24BDD0B88]),
          v10,
          (isEqualToString & 1) == 0))
    {
      BUZipLog();
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        sub_212E6C108(v7, v15, v16);

    }
    objc_msgSend_error(self, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend_channelQueue(self, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_212E516E0;
      block[3] = &unk_24CED9E10;
      block[4] = self;
      dispatch_async(v20, block);

      objc_msgSend_setError_(self, v21, (uint64_t)v7);
    }
  }

}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend_writeQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E517A8;
  block[3] = &unk_24CED9D20;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (id)sortedEntriesImpl
{
  NSArray *sortedEntries;
  NSArray *v4;
  NSArray *v5;

  sortedEntries = self->_sortedEntries;
  if (!sortedEntries)
  {
    objc_msgSend_sortedArrayUsingComparator_(self->_entries, a2, (uint64_t)&unk_24CED9E50);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sortedEntries;
    self->_sortedEntries = v4;

    sortedEntries = self->_sortedEntries;
  }
  return sortedEntries;
}

- (NSArray)sortedEntries
{
  uint64_t v2;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_212E4EAA0;
  v12 = sub_212E4EAB0;
  v13 = 0;
  objc_msgSend_writeQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212E51B10;
  v7[3] = &unk_24CED9AC8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (BOOL)isClosed
{
  uint64_t v2;
  BUZipWriter *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = self;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend_writeQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212E51C04;
  v6[3] = &unk_24CED9AC8;
  v6[4] = v3;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (id)entryWithName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_212E4EAA0;
  v18 = sub_212E4EAB0;
  v19 = 0;
  objc_msgSend_writeQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E51D20;
  block[3] = &unk_24CED9E78;
  v12 = v4;
  v13 = &v14;
  block[4] = self;
  v8 = v4;
  dispatch_sync(v7, block);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)truncateToNumberOfEntries:(unint64_t)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;

  v6 = a4;
  objc_msgSend_writeQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E51E18;
  block[3] = &unk_24CED9EA0;
  v12 = v6;
  v13 = a3;
  block[4] = self;
  v10 = v6;
  dispatch_async(v9, block);

}

- (void)truncateToNumberOfEntriesImpl:(unint64_t)a3 completion:(id)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  NSMutableDictionary *entriesMap;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  id v34;

  v34 = a4;
  if (objc_msgSend_entriesCountImpl(self, v6, v7) <= a3)
  {
    v33 = MEMORY[0x2199A7288](v34);
    v10 = (void *)v33;
    if (v33)
      (*(void (**)(uint64_t, _QWORD))(v33 + 16))(v33, 0);
  }
  else
  {
    objc_msgSend_sortedEntriesImpl(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v10, v11, v12) > a3)
    {
      v14 = a3;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v10, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(self->_entries, v16, (uint64_t)v15);
        entriesMap = self->_entriesMap;
        objc_msgSend_name(v15, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectForKey_(entriesMap, v21, (uint64_t)v20);

        ++v14;
      }
      while (v14 < objc_msgSend_count(v10, v22, v23));
    }
    objc_msgSend_objectAtIndexedSubscript_(v10, v13, a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_offset(v24, v25, v26);
    objc_msgSend_setEntryInsertionOffsetImpl_(self, v28, v27);
    v31 = objc_msgSend_offset(v24, v29, v30);
    objc_msgSend_truncateToOffsetImpl_completion_(self, v32, v31, v34);

  }
}

- (void)truncateToOffset:(int64_t)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int64_t v13;

  v6 = a4;
  objc_msgSend_writeQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E52008;
  block[3] = &unk_24CED9EA0;
  v12 = v6;
  v13 = a3;
  block[4] = self;
  v10 = v6;
  dispatch_async(v9, block);

}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;

  v4 = a4;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("%@: %s"), CFSTR("Abstract method"), "-[BUZipWriter truncateToOffsetImpl:completion:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v5, v9, v6, v8, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (OS_dispatch_queue)channelQueue
{
  return self->_channelQueue;
}

- (void)setChannelQueue:(id)a3
{
  objc_storeStrong((id *)&self->_channelQueue, a3);
}

- (BURandomWriteChannel)writeChannel
{
  return self->_writeChannel;
}

- (void)setWriteChannel:(id)a3
{
  objc_storeStrong((id *)&self->_writeChannel, a3);
}

- (OS_dispatch_group)writeChannelCompletionGroup
{
  return self->_writeChannelCompletionGroup;
}

- (void)setWriteChannelCompletionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_writeChannelCompletionGroup, a3);
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (NSMutableDictionary)entriesMap
{
  return self->_entriesMap;
}

- (void)setEntriesMap:(id)a3
{
  objc_storeStrong((id *)&self->_entriesMap, a3);
}

- (BUZipWriterEntry)currentEntry
{
  return self->_currentEntry;
}

- (void)setCurrentEntry:(id)a3
{
  objc_storeStrong((id *)&self->_currentEntry, a3);
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (BOOL)calculateSize
{
  return self->_calculateSize;
}

- (void)setCalculateSize:(BOOL)a3
{
  self->_calculateSize = a3;
}

- (BOOL)force32BitSize
{
  return self->_force32BitSize;
}

- (void)setForce32BitSize:(BOOL)a3
{
  self->_force32BitSize = a3;
}

- (BOOL)calculateCRC
{
  return self->_calculateCRC;
}

- (void)setCalculateCRC:(BOOL)a3
{
  self->_calculateCRC = a3;
}

- (unint64_t)sizeToMatch
{
  return self->_sizeToMatch;
}

- (void)setSizeToMatch:(unint64_t)a3
{
  self->_sizeToMatch = a3;
}

- (unsigned)CRCToMatch
{
  return self->_CRCToMatch;
}

- (void)setCRCToMatch:(unsigned int)a3
{
  self->_CRCToMatch = a3;
}

- (NSDate)lastModificationDateIfSizeAndCRCMatches
{
  return self->_lastModificationDateIfSizeAndCRCMatches;
}

- (void)setLastModificationDateIfSizeAndCRCMatches:(id)a3
{
  objc_storeStrong((id *)&self->_lastModificationDateIfSizeAndCRCMatches, a3);
}

- (NSDate)updatedEntryLastModificationDate
{
  return self->_updatedEntryLastModificationDate;
}

- (void)setUpdatedEntryLastModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_updatedEntryLastModificationDate, a3);
}

- (int64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(int64_t)a3
{
  self->_currentOffset = a3;
}

- (OS_dispatch_data)localFileHeaderData
{
  return self->_localFileHeaderData;
}

- (void)setLocalFileHeaderData:(id)a3
{
  objc_storeStrong((id *)&self->_localFileHeaderData, a3);
}

- (NSMutableArray)entryDatas
{
  return self->_entryDatas;
}

- (void)setEntryDatas:(id)a3
{
  objc_storeStrong((id *)&self->_entryDatas, a3);
}

- (unint64_t)entryDataSize
{
  return self->_entryDataSize;
}

- (void)setEntryDataSize:(unint64_t)a3
{
  self->_entryDataSize = a3;
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_writeQueue, a3);
}

- (int64_t)writtenOffset
{
  return self->_writtenOffset;
}

- (void)setWrittenOffset:(int64_t)a3
{
  self->_writtenOffset = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_entryDatas, 0);
  objc_storeStrong((id *)&self->_localFileHeaderData, 0);
  objc_storeStrong((id *)&self->_updatedEntryLastModificationDate, 0);
  objc_storeStrong((id *)&self->_lastModificationDateIfSizeAndCRCMatches, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_writeChannelCompletionGroup, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
  objc_storeStrong((id *)&self->_channelQueue, 0);
  objc_storeStrong((id *)&self->_sortedEntries, 0);
}

@end
