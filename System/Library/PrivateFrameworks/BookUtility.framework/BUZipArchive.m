@implementation BUZipArchive

- (BUZipArchive)init
{
  return (BUZipArchive *)MEMORY[0x24BEDD108](self, sel_initWithOptions_, 0);
}

- (BUZipArchive)initWithOptions:(unint64_t)a3
{
  BUZipArchive *v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *entriesMap;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *entries;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BUZipArchive;
  v4 = -[BUZipArchive init](&v11, sel_init);
  if (v4)
  {
    BUZipLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_212E6CB34();

    v4->_options = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    entriesMap = v4->_entriesMap;
    v4->_entriesMap = v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    entries = v4->_entries;
    v4->_entries = v8;

  }
  return v4;
}

+ (void)test_setForceZipEntriesRecalculationOnRead:(BOOL)a3
{
  byte_254B69FD8 = a3;
}

- (void)test_removeEntryWithName:(id)a3
{
  objc_msgSend_removeObjectForKey_(self->_entriesMap, a2, (uint64_t)a3);
}

- (unint64_t)entriesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_entries, a2, v2);
}

- (BOOL)hasNonEmptyEntries
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_212E5B80C;
  v4[3] = &unk_24CEDA5A0;
  v4[4] = &v5;
  objc_msgSend_enumerateEntriesUsingBlock_(self, a2, (uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *Channel;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  _QWORD block[4];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  _QWORD v31[2];
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  id v35;

  v6 = a3;
  v7 = a4;
  BUZipLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_212E6CBA0();

  v11 = objc_msgSend_archiveLength(self, v9, v10);
  Channel = (void *)objc_msgSend_newArchiveReadChannel(self, v12, v13);
  v15 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_212E5BAA4;
  v34[3] = &unk_24CEDA5C8;
  v16 = v7;
  v35 = v16;
  v17 = (void *)MEMORY[0x2199A7288](v34);
  v18 = v17;
  if (Channel)
  {
    v30[0] = v15;
    v30[1] = 3221225472;
    v30[2] = sub_212E5BB7C;
    v30[3] = &unk_24CEDA618;
    v19 = (id *)v31;
    v20 = Channel;
    v31[0] = v20;
    v31[1] = self;
    v32 = v6;
    v33 = v18;
    v22 = (void *)MEMORY[0x2199A7288](v30);
    if (byte_254B69FD8 && BUIsRunningTests() || (self->_options & 8) != 0)
    {
      objc_msgSend_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion_(self, v21, (uint64_t)v20, 0, 0, 0, 0, v22);
    }
    else
    {
      v26[0] = v15;
      v26[1] = 3221225472;
      v26[2] = sub_212E5BC70;
      v26[3] = &unk_24CEDA668;
      v26[4] = self;
      v29 = v11 - 22;
      v27 = v20;
      v28 = v22;
      objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v23, (uint64_t)v27, v11 - 22, 22, v26);

    }
  }
  else
  {
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = sub_212E5BE74;
    block[3] = &unk_24CED9B90;
    v19 = &v25;
    v25 = v17;
    dispatch_async(v6, block);
  }

}

- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  const char *v12;
  dispatch_data_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  size_ptr = 0;
  buffer_ptr = 0;
  v13 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x15)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v29 = CFSTR("BUZipArchiveErrorDescription");
    v30[0] = CFSTR("Wrong data size for BUZipEndOfCentralDirectoryRecord");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v30, &v29, 1);
    goto LABEL_8;
  }
  if (*(_DWORD *)buffer_ptr != 101010256)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v27 = CFSTR("BUZipArchiveErrorDescription");
    v28 = CFSTR("Don't support end of central directory comments");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)&v28, &v27, 1);
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v14, v16, (uint64_t)v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v11[2](v11, v17);

    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v19);

    }
    goto LABEL_11;
  }
  if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v25 = CFSTR("BUZipArchiveErrorDescription");
    v26 = CFSTR("Don't support multi-disk");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)&v26, &v25, 1);
    goto LABEL_8;
  }
  v20 = *((unsigned __int16 *)buffer_ptr + 5);
  if (v20 == 0xFFFF || *((_DWORD *)buffer_ptr + 4) == -1 || *((_DWORD *)buffer_ptr + 3) == -1)
    objc_msgSend_readZip64EndOfCentralDirectoryLocatorWithChannel_eocdOffset_completion_(self, v12, (uint64_t)v10, a4, v11);
  else
    objc_msgSend_readCentralDirectoryWithEntryCount_offset_size_channel_completion_(self, v12, v20);
LABEL_11:

}

- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5
{
  id v8;
  const char *v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v10 = a5;
  if ((unint64_t)a4 > 0x13)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_212E5C24C;
    v16[3] = &unk_24CEDA690;
    v16[4] = self;
    v17 = v8;
    v18 = v10;
    objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v15, (uint64_t)v17, a4 - 20, 20, v16);

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v19 = CFSTR("BUZipArchiveErrorDescription");
    v20[0] = CFSTR("File isn't long enough for Zip64 locator");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v11, v13, (uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v14);

  }
}

- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  const char *v10;
  dispatch_data_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v11 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x13)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v24 = CFSTR("BUZipArchiveErrorDescription");
    v25[0] = CFSTR("Wrong data size for BUZip64EndOfCentralDirectoryLocatorRecord");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v25, &v24, 1);
  }
  else if (*(_DWORD *)buffer_ptr == 117853008)
  {
    if (!*((_DWORD *)buffer_ptr + 1) && *((_DWORD *)buffer_ptr + 4) == 1)
    {
      objc_msgSend_readZip64EndOfCentralDirectoryWithChannel_offset_completion_(self, v10, (uint64_t)v8, *((_QWORD *)buffer_ptr + 1), v9);
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("BUZipArchiveErrorDescription");
    v21 = CFSTR("Multi-disk is not supported");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v21, &v20, 1);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("BUZipArchiveErrorDescription");
    v23 = CFSTR("Zip64 end of central directory locator record signature not found");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v23, &v22, 1);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v12, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v9[2](v9, v15);

  }
  else
  {
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v17);

  }
LABEL_12:

}

- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212E5C51C;
  v13[3] = &unk_24CEDA690;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v12, (uint64_t)v11, a4, 56, v13);

}

- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  const char *v10;
  dispatch_data_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v11 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x37)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v24 = CFSTR("BUZipArchiveErrorDescription");
    v25[0] = CFSTR("Wrong data size for BUZip64EndOfCentralDirectoryRecord");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v25, &v24, 1);
  }
  else if (*(_DWORD *)buffer_ptr == 101075792)
  {
    if (!*((_DWORD *)buffer_ptr + 4) && !*((_DWORD *)buffer_ptr + 5))
    {
      objc_msgSend_readCentralDirectoryWithEntryCount_offset_size_channel_completion_(self, v10, *((_QWORD *)buffer_ptr + 4), *((_QWORD *)buffer_ptr + 6), *((_QWORD *)buffer_ptr + 5), v8, v9);
      goto LABEL_11;
    }
    v12 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("BUZipArchiveErrorDescription");
    v21 = CFSTR("Multi-disk is not supported");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v21, &v20, 1);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("BUZipArchiveErrorDescription");
    v23 = CFSTR("Zip64 end of central directory record signature not found");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v23, &v22, 1);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v12, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v9[2](v9, v15);

  }
  else
  {
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v17);

  }
LABEL_11:

}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  const char *v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  BUZipArchive *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  v13 = a6;
  BUZipLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v21 = self;
    v22 = 2048;
    v23 = a5;
    v24 = 2048;
    v25 = a3;
    _os_log_debug_impl(&dword_212E45000, v14, OS_LOG_TYPE_DEBUG, "%@: reading central directory of size %zu with %tu entries", buf, 0x20u);
  }

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_212E5C88C;
  v17[3] = &unk_24CEDA6B8;
  v18 = v12;
  v19 = a3;
  v17[4] = self;
  v15 = v12;
  objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v16, (uint64_t)v13, a4, a5, v17);

}

- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, id);
  const char *v9;
  dispatch_data_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  int v14;
  id v16;
  size_t size_ptr;
  void *buffer_ptr;

  v8 = (void (**)(id, id))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v11 = 0;
  if (!a4)
    goto LABEL_7;
  v12 = 1;
  do
  {
    v13 = v11;
    v16 = v11;
    v14 = objc_msgSend_readCentralFileHeaderWithBuffer_dataSize_error_(self, v9, (uint64_t)&buffer_ptr, &size_ptr, &v16);
    v11 = v16;

    if (!v14)
      break;
  }
  while (v12++ < a4);
  if ((v14 & 1) == 0)
  {
    if (!v11)
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v9, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8[2](v8, v11);
  }
  else
  {
LABEL_7:
    v8[2](v8, 0);
  }

}

- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5
{
  BUZipEntry *v9;
  const char *v10;
  BUZipEntry *v11;
  unsigned __int16 *v12;
  char *v13;
  int v14;
  void *v15;
  void *v16;
  const char *v17;
  id v18;
  BOOL v19;
  int v21;
  BOOL v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  id v36;
  const char *v37;
  int ExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error;
  id v39;
  int FileCommentFromBuffer_fileCommentLength_entry_dataSize_error;
  id v41;
  void *v42;
  id v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v9 = objc_alloc_init(BUZipEntry);
  v11 = v9;
  if (*a4 <= 0x2D)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v52 = CFSTR("BUZipArchiveErrorDescription");
    v53[0] = CFSTR("Central directory too short");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v53, &v52, 1);
    goto LABEL_9;
  }
  v12 = (unsigned __int16 *)*a3;
  v13 = (char *)*a3 + 46;
  v14 = *(_DWORD *)*a3;
  *a4 -= 46;
  *a3 = v13;
  if (v14 != 33639248)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v50 = CFSTR("BUZipArchiveErrorDescription");
    v51 = CFSTR("Central directory file header has bad signature");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v51, &v50, 1);
    goto LABEL_9;
  }
  if ((v12[4] & 1) != 0)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v48 = CFSTR("BUZipArchiveErrorDescription");
    v49 = CFSTR("Encrypted files are not supported");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v49, &v48, 1);
    goto LABEL_9;
  }
  if (v12[17])
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v46 = CFSTR("BUZipArchiveErrorDescription");
    v47 = CFSTR("No multi-disk support");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v47, &v46, 1);
LABEL_9:
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v15, v17, (uint64_t)v16);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v21 = v12[5];
  if (v12[5])
    v22 = v21 == (unsigned __int16)BUZipDeflateCompressionMethod;
  else
    v22 = 1;
  if (!v22)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v44 = CFSTR("BUZipArchiveErrorDescription");
    v45 = CFSTR("Unsupported compression method");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v45, &v44, 1);
    goto LABEL_9;
  }
  objc_msgSend_setCompressed_(v9, v10, v21 == (unsigned __int16)BUZipDeflateCompressionMethod);
  v23 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend_bu_initWithDOSTime_(v23, v24, v12[7] | ((unint64_t)v12[6] << 16));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastModificationDate_(v11, v26, (uint64_t)v25);

  objc_msgSend_setCRC_(v11, v27, *((unsigned int *)v12 + 4));
  objc_msgSend_setCompressedSize_(v11, v28, *((unsigned int *)v12 + 5));
  objc_msgSend_setSize_(v11, v29, *((unsigned int *)v12 + 6));
  objc_msgSend_setOffset_(v11, v30, *(unsigned int *)(v12 + 21));
  objc_msgSend_setNameLength_(v11, v31, v12[14]);
  objc_msgSend_setExtraFieldsLength_(v11, v32, v12[15]);
  objc_msgSend_setExternalFileAttributes_(v11, v33, *(unsigned int *)(v12 + 19));
  v34 = v12[14];
  v43 = 0;
  LODWORD(v25) = objc_msgSend_readFilenameFromBuffer_nameLength_entry_dataSize_error_(self, v35, (uint64_t)a3, v34, v11, a4, &v43);
  v36 = v43;
  v18 = v36;
  if ((_DWORD)v25)
  {
    if (!v12[15]
      || (v42 = v36,
          ExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error = objc_msgSend_readExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error_(self, v37, (uint64_t)a3), v39 = v42, v18, v18 = v39, ExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error))
    {
      if (!v12[16]
        || (FileCommentFromBuffer_fileCommentLength_entry_dataSize_error = objc_msgSend_readFileCommentFromBuffer_fileCommentLength_entry_dataSize_error_(self, v37, (uint64_t)a3), v41 = v18, v18, v18 = v41, FileCommentFromBuffer_fileCommentLength_entry_dataSize_error))
      {
        objc_msgSend_addEntry_(self, v37, (uint64_t)v11);
        v19 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_10:
  if (a5)
  {
    v18 = objc_retainAutorelease(v18);
    v19 = 0;
    *a5 = v18;
  }
  else
  {
    v19 = 0;
  }
LABEL_13:

  return v19;
}

- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  const char *v20;
  const char *v21;
  BOOL v22;
  void *v23;
  void *v24;
  const char *v25;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v9 = a4;
  v30[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  if (*a6 < v9)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v27 = CFSTR("BUZipArchiveErrorDescription");
    v28 = CFSTR("Central directory too short");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)&v28, &v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v13, v15, (uint64_t)v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v22 = 0;
    goto LABEL_7;
  }
  v17 = v9;
  v18 = objc_alloc(MEMORY[0x24BDD17C8]);
  v14 = (void *)objc_msgSend_initWithBytes_length_encoding_(v18, v19, (uint64_t)*a3, v9, 4);
  objc_msgSend_setName_(v12, v20, (uint64_t)v14);
  *a6 -= v17;
  *a3 = (char *)*a3 + v17;
  v22 = v14 != 0;
  if (!v14)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v29 = CFSTR("BUZipArchiveErrorDescription");
    v30[0] = CFSTR("Couldn't read name");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v21, (uint64_t)v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v23, v25, (uint64_t)v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v16 = 0;
LABEL_7:

  if (a7 && !v22)
    *a7 = objc_retainAutorelease(v16);

  return v22;
}

- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v8;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  BOOL v16;
  char *v17;
  char Zip64ExtraFieldFromBuffer_dataLength_entry_error;
  unsigned __int16 *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v8 = a4;
  v33[1] = *MEMORY[0x24BDAC8D0];
  v29 = a5;
  if (*a6 >= v8)
  {
    v15 = 0;
    v17 = (char *)*a3 + v8;
    Zip64ExtraFieldFromBuffer_dataLength_entry_error = 1;
    do
    {
      v19 = (unsigned __int16 *)*a3;
      v20 = (char *)*a3 + 4;
      v16 = v20 > v17;
      if (v20 > v17)
        break;
      v21 = *a6 - 4;
      *a6 = v21;
      *a3 = v20;
      v22 = v19[1];
      if (&v20[v22] > v17)
      {
        v24 = (void *)MEMORY[0x24BDD1540];
        v32 = CFSTR("BUZipArchiveErrorDescription");
        v33[0] = CFSTR("Invalid Zip entry extra field length");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v33, &v32, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v24, v25, (uint64_t)v13);
        v26 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v26;
        goto LABEL_11;
      }
      if (*v19 == (unsigned __int16)BUZip64ExtraFieldSignature)
      {
        Zip64ExtraFieldFromBuffer_dataLength_entry_error = objc_msgSend_readZip64ExtraFieldFromBuffer_dataLength_entry_error_(self, v11, (uint64_t)v20);
        v23 = v15;

        v22 = v19[1];
        v21 = *a6;
        v15 = v23;
        v20 = (char *)*a3;
      }
      *a6 = v21 - v22;
      *a3 = &v20[v22];
    }
    while ((Zip64ExtraFieldFromBuffer_dataLength_entry_error & 1) != 0);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v30 = CFSTR("BUZipArchiveErrorDescription");
    v31 = CFSTR("Central directory too short");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)&v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v12, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
LABEL_11:

  }
  if (a7 && !v16)
    *a7 = objc_retainAutorelease(v15);

  return v16;
}

- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6
{
  unsigned int v7;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  const char *v24;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v7 = a4;
  v31[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  if (objc_msgSend_size(v9, v10, v11) == 0xFFFFFFFFLL)
  {
    v14 = v7 >= 8;
    LOWORD(v7) = v7 - 8;
    if (!v14)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v30 = CFSTR("BUZipArchiveErrorDescription");
      v31[0] = CFSTR("Not enough room for Zip64 uncompressed size");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v31, &v30, 1);
      goto LABEL_14;
    }
    v15 = *(_QWORD *)a3;
    a3 = (char *)a3 + 8;
    objc_msgSend_setSize_(v9, v12, v15);
  }
  if (objc_msgSend_compressedSize(v9, v12, v13) == 0xFFFFFFFFLL)
  {
    if ((unsigned __int16)v7 < 8u)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v28 = CFSTR("BUZipArchiveErrorDescription");
      v29 = CFSTR("Not enough room for Zip64 compressed size");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)&v29, &v28, 1);
      goto LABEL_14;
    }
    v18 = *(_QWORD *)a3;
    a3 = (char *)a3 + 8;
    objc_msgSend_setCompressedSize_(v9, v16, v18);
    LOWORD(v7) = v7 - 8;
  }
  if (objc_msgSend_offset(v9, v16, v17) != 0xFFFFFFFFLL)
  {
LABEL_11:
    v20 = 0;
    v21 = 1;
    goto LABEL_17;
  }
  if ((unsigned __int16)v7 >= 8u)
  {
    objc_msgSend_setOffset_(v9, v19, *(_QWORD *)a3);
    goto LABEL_11;
  }
  v22 = (void *)MEMORY[0x24BDD1540];
  v26 = CFSTR("BUZipArchiveErrorDescription");
  v27 = CFSTR("Not enough room for Zip64 offset");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)&v27, &v26, 1);
LABEL_14:
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v22, v24, (uint64_t)v23);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    v20 = objc_retainAutorelease(v20);
    v21 = 0;
    *a6 = v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_17:

  return v21;
}

- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9;
  const char *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  const char *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v9 = a4;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = *a6;
  v14 = v9;
  if (*a6 < v9)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("BUZipArchiveErrorDescription");
    v21[0] = CFSTR("Central directory too short");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v21, &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v16, v18, (uint64_t)v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a7)
    {
      v15 = objc_retainAutorelease(v15);
      *a7 = v15;
    }
  }
  else
  {
    v15 = 0;
    *a6 = v13 - v14;
    *a3 = (char *)*a3 + v14;
  }

  return v13 >= v14;
}

- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  unsigned int v26;
  BOOL v27;

  v14 = a3;
  v15 = a5;
  v16 = a8;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_212E5D510;
  v21[3] = &unk_24CEDA708;
  v24 = v16;
  v25 = a4;
  v21[4] = self;
  v22 = v14;
  v27 = a7;
  v26 = a6;
  v23 = v15;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v20, (uint64_t)v19, a4, 30, v21);

}

- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  dispatch_data_t v13;
  unsigned __int16 *v14;
  __int16 v15;
  BOOL v16;
  BUZipEntry *v17;
  const char *v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  unint64_t v29;
  const char *v30;
  int64_t v31;
  BUZipEntry *v32;
  const char *v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  void *v42;
  const char *v43;
  _QWORD v44[5];
  BUZipEntry *v45;
  id v46;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  size_ptr = 0;
  buffer_ptr = 0;
  v13 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x1D)
  {
    v34 = (void *)MEMORY[0x24BDD1540];
    v57 = CFSTR("BUZipArchiveErrorDescription");
    v58[0] = CFSTR("Wrong data size for BUZipLocalFileHeaderRecord");
    v35 = 1;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v58, &v57, 1);
    goto LABEL_13;
  }
  v14 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    v35 = *(_DWORD *)buffer_ptr == 33639248;
    v34 = (void *)MEMORY[0x24BDD1540];
    v55 = CFSTR("BUZipArchiveErrorDescription");
    v56 = CFSTR("Local file header has bad signature");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)&v56, &v55, 1);
LABEL_13:
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v34, v37, (uint64_t)v36);
    v32 = (BUZipEntry *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(self->_entries, v38, v39))
    {
      (*((void (**)(id, _QWORD, _QWORD, _BOOL8))v11 + 2))(v11, 0, 0, v35);
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v15 = *((_WORD *)buffer_ptr + 3);
  if ((v15 & 1) != 0)
  {
    v41 = (void *)MEMORY[0x24BDD1540];
    v53 = CFSTR("BUZipArchiveErrorDescription");
    v54 = CFSTR("Encrypted files are not supported");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)&v54, &v53, 1);
  }
  else if ((v15 & 8) != 0)
  {
    v41 = (void *)MEMORY[0x24BDD1540];
    v51 = CFSTR("BUZipArchiveErrorDescription");
    v52 = CFSTR("Local file header does not have the entry CRC and size");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)&v52, &v51, 1);
  }
  else
  {
    if (*((_WORD *)buffer_ptr + 4))
      v16 = *((unsigned __int16 *)buffer_ptr + 4) == (unsigned __int16)BUZipDeflateCompressionMethod;
    else
      v16 = 1;
    if (v16)
    {
      v17 = objc_alloc_init(BUZipEntry);
      objc_msgSend_setCompressed_(v17, v18, v14[4] == (unsigned __int16)BUZipDeflateCompressionMethod);
      v19 = objc_alloc(MEMORY[0x24BDBCE60]);
      objc_msgSend_bu_initWithDOSTime_(v19, v20, v14[6] | ((unint64_t)v14[5] << 16));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastModificationDate_(v17, v22, (uint64_t)v21);

      objc_msgSend_setCRC_(v17, v23, *(unsigned int *)(v14 + 7));
      objc_msgSend_setCompressedSize_(v17, v24, *(unsigned int *)(v14 + 9));
      objc_msgSend_setSize_(v17, v25, *(unsigned int *)(v14 + 11));
      objc_msgSend_setOffset_(v17, v26, a4);
      objc_msgSend_setNameLength_(v17, v27, v14[13]);
      objc_msgSend_setExtraFieldsLength_(v17, v28, v14[14]);
      v29 = v14[14] + (unint64_t)v14[13];
      objc_msgSend_setFileHeaderLength_(v17, v30, v29 + 30);
      v31 = a4 + 30;
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = sub_212E5DC3C;
      v44[3] = &unk_24CEDA690;
      v44[4] = self;
      v45 = v17;
      v46 = v11;
      v32 = v17;
      objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v33, (uint64_t)v10, v31, v29, v44);

      goto LABEL_21;
    }
    v41 = (void *)MEMORY[0x24BDD1540];
    v49 = CFSTR("BUZipArchiveErrorDescription");
    v50 = CFSTR("Unsupported compression method");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)&v50, &v49, 1);
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v41, v43, (uint64_t)v42);
  v32 = (BUZipEntry *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (!v32)
  {
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v40, 0);
    v32 = (BUZipEntry *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(id, _QWORD, BUZipEntry *, _QWORD))v11 + 2))(v11, 0, v32, 0);
LABEL_21:

}

- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5
{
  id v8;
  dispatch_data_t v9;
  size_t v10;
  const char *v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  id v21;
  char v22;
  uint64_t v23;
  const char *v24;
  int v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  id v33;
  id v34;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  size_ptr = 0;
  buffer_ptr = 0;
  v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v10 = size_ptr;
  v13 = objc_msgSend_nameLength(v8, v11, v12);
  if (v10 >= objc_msgSend_extraFieldsLength(v8, v14, v15) + (unint64_t)v13)
  {
    v23 = objc_msgSend_nameLength(v8, v16, v17);
    v34 = 0;
    v25 = objc_msgSend_readFilenameFromBuffer_nameLength_entry_dataSize_error_(self, v24, (uint64_t)&buffer_ptr, v23, v8, &size_ptr, &v34);
    v19 = v34;
    if (!v25)
    {
      v22 = 0;
      if (!a5)
        goto LABEL_11;
      goto LABEL_9;
    }
    if (!objc_msgSend_extraFieldsLength(v8, v26, v27))
    {
      v22 = 1;
      goto LABEL_11;
    }
    v30 = objc_msgSend_extraFieldsLength(v8, v28, v29);
    v33 = v19;
    v22 = objc_msgSend_readExtraFieldsFromBuffer_extraFieldsLength_entry_dataSize_error_(self, v31, (uint64_t)&buffer_ptr, v30, v8, &size_ptr, &v33);
    v21 = v33;
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = CFSTR("BUZipArchiveErrorDescription");
    v38[0] = CFSTR("Wrong data size for BUZipLocalFileHeaderRecord filename and extra fields");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v38, &v37, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v18, v20, (uint64_t)v19);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
  }

  v19 = v21;
  if (!a5)
    goto LABEL_11;
LABEL_9:
  if ((v22 & 1) == 0)
  {
    v19 = objc_retainAutorelease(v19);
    v22 = 0;
    *a5 = v19;
  }
LABEL_11:

  return v22;
}

- (void)addEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    objc_msgSend_name(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_normalizeEntryName_(self, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(self->_entriesMap, v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      BUZipLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_212E6CE78();

    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(self->_entriesMap, v13, (uint64_t)v7, v10);
      objc_msgSend_addObject_(self->_entries, v15, (uint64_t)v7);
    }

  }
}

- (id)readChannelForEntry:(id)a3
{
  return (id)objc_msgSend_readChannelForEntry_validateCRC_(self, a2, (uint64_t)a3, 1);
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  unsigned int isCompressed;
  BUZipReadChannel *v11;
  const char *v12;
  void *v13;
  BUBufferedReadChannel *v14;
  const char *v15;
  uint64_t ChannelBlock;
  _QWORD v18[4];
  id v19;
  BOOL v20;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend_containsObject_(self->_entries, v7, (uint64_t)v6))
  {
    isCompressed = objc_msgSend_isCompressed(v6, v8, v9);
    v11 = [BUZipReadChannel alloc];
    isCompressed ^= 1u;
    v13 = (void *)objc_msgSend_initWithEntry_archive_validateCRC_(v11, v12, (uint64_t)v6, self, v4 & isCompressed);
    if ((isCompressed & 1) == 0)
    {
      v14 = [BUBufferedReadChannel alloc];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = sub_212E5E0B4;
      v18[3] = &unk_24CEDA730;
      v19 = v6;
      v20 = v4;
      ChannelBlock = objc_msgSend_initWithReadChannel_blockInfos_streamReadChannelBlock_(v14, v15, (uint64_t)v13, 0, v18);

      v13 = (void *)ChannelBlock;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)streamReadChannelForEntry:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_streamReadChannelForEntry_validateCRC_, a3);
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  int isCompressed;
  BUZipReadChannel *v11;
  const char *v12;
  void *v13;
  BUZipInflateReadChannel *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t Channel_uncompressedSize_CRC_validateCRC;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend_containsObject_(self->_entries, v7, (uint64_t)v6))
  {
    isCompressed = objc_msgSend_isCompressed(v6, v8, v9);
    v11 = [BUZipReadChannel alloc];
    isCompressed ^= 1u;
    v13 = (void *)objc_msgSend_initWithEntry_archive_validateCRC_(v11, v12, (uint64_t)v6, self, v4 & isCompressed);
    if ((isCompressed & 1) == 0)
    {
      v14 = [BUZipInflateReadChannel alloc];
      objc_msgSend_size(v6, v15, v16);
      v19 = objc_msgSend_size(v6, v17, v18);
      v22 = objc_msgSend_CRC(v6, v20, v21);
      Channel_uncompressedSize_CRC_validateCRC = objc_msgSend_initWithReadChannel_uncompressedSize_CRC_validateCRC_(v14, v23, (uint64_t)v13, v19, v22, v4);

      v13 = (void *)Channel_uncompressedSize_CRC_validateCRC;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (id)MEMORY[0x24BEDD108](BUContainedZipArchive, sel_zipArchiveFromEntry_zipArchive_options_error_, a3);
}

- (id)normalizeEntryName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v7 = v4;
  if ((self->_options & 2) != 0)
  {
    objc_msgSend_lowercaseString(v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend_precomposedStringWithCanonicalMapping(v7, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)entryForName:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    objc_msgSend_normalizeEntryName_(self, v5, (uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(self->_entriesMap, v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  NSMutableOrderedSet *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_entries;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v15, v20, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
      objc_msgSend_usableName(v13, v8, v9, (_QWORD)v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14, v13, &v19);

      if (v19)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v15, v20, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)collapseCommonRootDirectory
{
  void *v3;
  NSMutableDictionary *entriesMap;
  unint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  const char *v26;
  NSMutableDictionary *v27;
  _QWORD v28[4];
  NSMutableDictionary *v29;
  BUZipArchive *v30;
  uint64_t v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_212E5E5FC;
  v37 = sub_212E5E60C;
  v38 = 0;
  v3 = (void *)MEMORY[0x2199A70C0](self, a2);
  entriesMap = self->_entriesMap;
  v5 = (self->_options >> 1) & 1 | 2;
  v6 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_212E5E614;
  v32[3] = &unk_24CEDA758;
  v32[4] = &v33;
  v32[5] = v5;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(entriesMap, v7, (uint64_t)v32);
  objc_autoreleasePoolPop(v3);
  if (objc_msgSend_count((void *)v34[5], v8, v9))
  {
    objc_msgSend_pathWithComponents_(MEMORY[0x24BDD17C8], v10, v34[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_length(v12, v13, v14);
  }
  else
  {
    v12 = 0;
    v15 = objc_msgSend_length(0, v10, v11);
  }
  v16 = v15;
  if (v15)
  {
    v17 = objc_alloc(MEMORY[0x24BDBCED8]);
    v20 = objc_msgSend_count(self->_entriesMap, v18, v19);
    v22 = (void *)objc_msgSend_initWithCapacity_(v17, v21, v20);
    v23 = (void *)MEMORY[0x2199A70C0]();
    v24 = self->_entriesMap;
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = sub_212E5E7DC;
    v28[3] = &unk_24CEDA780;
    v31 = v16;
    v25 = v22;
    v29 = v25;
    v30 = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v24, v26, (uint64_t)v28);

    objc_autoreleasePoolPop(v23);
    v27 = self->_entriesMap;
    self->_entriesMap = v25;

  }
  _Block_object_dispose(&v33, 8);

}

- (unint64_t)archiveLength
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@: %s"), CFSTR("Abstract method"), "-[BUZipArchive archiveLength]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)newArchiveReadChannel
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@: %s"), CFSTR("Abstract method"), "-[BUZipArchive newArchiveReadChannel]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isValid
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@: %s"), CFSTR("Abstract method"), "-[BUZipArchive isValid]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)debugDescription
{
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v3 = objc_opt_class();
  objc_msgSend_descriptionWithObject_class_(BUDescription, v4, (uint64_t)self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(self->_entries, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BUArrayDescription(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addField_value_(v5, v10, (uint64_t)CFSTR("entries"), v9);

  objc_msgSend_descriptionString(v5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)totalSize
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_212E5EB68;
  v4[3] = &unk_24CEDA5A0;
  v4[4] = &v5;
  objc_msgSend_enumerateEntriesUsingBlock_(self, a2, (uint64_t)v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)extractToURL:(id)a3 error:(id *)a4
{
  return objc_msgSend_extractToURL_error_shouldExtractEntry_didExtractEntry_(self, a2, (uint64_t)a3, a4, 0, 0);
}

- (BOOL)extractToURL:(id)a3 error:(id *)a4 shouldExtractEntry:(id)a5 didExtractEntry:(id)a6
{
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  id v14;
  BOOL v15;
  char v16;
  id v17;
  id v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *inited;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  const char *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  id v55;
  id v56;
  id obj;
  void *v58;
  void *v59;
  id v60;
  unsigned int (**v62)(id, void *, void *);
  id v63;
  char v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _BYTE v74[17];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v56 = a3;
  v62 = (unsigned int (**)(id, void *, void *))a5;
  v55 = a6;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v56, v10, v11);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = 0;
  if ((objc_msgSend_fileExistsAtPath_isDirectory_(v58, v12, (uint64_t)v59, v74) & 1) != 0)
  {
    v14 = 0;
    if (!v74[0])
    {
      v15 = 0;
      v60 = 0;
      goto LABEL_36;
    }
    goto LABEL_5;
  }
  v73 = 0;
  v16 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v58, v13, (uint64_t)v59, 1, 0, &v73);
  v14 = v73;
  if ((v16 & 1) != 0)
  {
LABEL_5:
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = sub_212E5F180;
    v71[3] = &unk_24CEDA448;
    v18 = v17;
    v72 = v18;
    objc_msgSend_enumerateEntriesUsingBlock_(self, v19, (uint64_t)v71);
    objc_msgSend_sortUsingSelector_(v18, v20, (uint64_t)sel_compare_);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v18;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v67, v75, 16);
    if (v23)
    {
      v60 = 0;
      v24 = *(_QWORD *)v68;
      v25 = 1;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v68 != v24)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend_entryForName_(self, v22, (uint64_t)v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingPathComponent_(v59, v29, (uint64_t)v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_alloc(MEMORY[0x24BDBCF48]);
          inited = (void *)objc_msgSend_initFileURLWithPath_(v31, v32, (uint64_t)v30);
          if (!v62 || v62[2](v62, v28, inited))
          {
            v36 = objc_msgSend_length(v27, v33, v34);
            if (objc_msgSend_characterAtIndex_(v27, v37, v36 - 1) == 47)
            {
              objc_msgSend_path(inited, v38, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v14;
              v25 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v58, v41, (uint64_t)v40, 1, 0, &v66);
              v42 = v66;

              if (v42)
                v43 = v42;
              else
                v43 = v60;
              v44 = v43;

              v60 = v44;
              v14 = v42;
            }
            else
            {
              objc_msgSend_stringByDeletingLastPathComponent(v30, v38, v39);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v14;
              v25 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v58, v46, (uint64_t)v45, 1, 0, &v65);
              v47 = v65;

              v64 = 0;
              v63 = v47;
              LODWORD(v45) = objc_msgSend_extractFromArchive_destinationURL_error_(v28, v48, (uint64_t)self, v56, &v63);
              v14 = v63;

              if ((_DWORD)v45)
              {
                v49 = MEMORY[0x2199A7288](v55);
                v50 = (void *)v49;
                if (v49)
                  (*(void (**)(uint64_t, void *, void *, char *))(v49 + 16))(v49, v28, inited, &v64);
              }
              else
              {
                v50 = v60;
                v60 = v14;
              }

              if (v64)
              {

                goto LABEL_30;
              }
            }
          }

        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v67, v75, 16);
        if (v23)
          continue;
        break;
      }
    }
    else
    {
      v60 = 0;
      v25 = 1;
    }
LABEL_30:

    v15 = v25 & 1;
    goto LABEL_31;
  }
  BUZipLog();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    sub_212E6CFBC(v51);

  v14 = v14;
  v15 = 0;
  v60 = v14;
LABEL_31:
  if (v60)
  {
    BUZipLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      sub_212E6CEDC();

  }
  else
  {
    v60 = 0;
  }
LABEL_36:
  if (a4)
    *a4 = objc_retainAutorelease(v60);

  return v15;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSMutableDictionary)entriesMap
{
  return self->_entriesMap;
}

- (void)setEntriesMap:(id)a3
{
  objc_storeStrong((id *)&self->_entriesMap, a3);
}

- (NSMutableOrderedSet)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (int64_t)endOfLastEntry
{
  return self->_endOfLastEntry;
}

- (void)setEndOfLastEntry:(int64_t)a3
{
  self->_endOfLastEntry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
}

@end
