@implementation BUZipReadChannel

- (BUZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5
{
  id v9;
  id v10;
  BUZipReadChannel *v11;
  BUZipReadChannel *v12;
  const char *v13;
  uint64_t v14;
  uint64_t Channel;
  BUReadChannel *archiveReadChannel;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BUZipReadChannel;
  v11 = -[BUZipReadChannel init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entry, a3);
    objc_storeStrong((id *)&v12->_archive, a4);
    v12->_validateCRC = a5;
    Channel = objc_msgSend_newArchiveReadChannel(v10, v13, v14);
    archiveReadChannel = v12->_archiveReadChannel;
    v12->_archiveReadChannel = (BUReadChannel *)Channel;

    if (!v12->_archiveReadChannel)
    {

      v12 = 0;
    }
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUZipReadChannel;
  -[BUZipReadChannel dealloc](&v4, sel_dealloc);
}

- (void)readWithHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  id v18;
  BUReadChannel *archiveReadChannel;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD v31[3];
  int v32;
  _QWORD v33[3];
  char v34;
  _QWORD v35[3];
  char v36;
  _QWORD v37[5];
  id v38;

  v4 = a3;
  v7 = objc_msgSend_compressedSize(self->_entry, v5, v6);
  v10 = objc_msgSend_fileHeaderLength(self->_entry, v8, v9);
  if (v10)
  {
    objc_msgSend_readWithFileHeaderLength_handler_(self, v11, v10, v4);
  }
  else
  {
    v13 = objc_msgSend_nameLength(self->_entry, v11, v12);
    v16 = objc_msgSend_extraFieldsLength(self->_entry, v14, v15);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_212E61850;
    v37[4] = sub_212E61860;
    v17 = (void *)MEMORY[0x24BDAC990];
    v18 = MEMORY[0x24BDAC990];
    v38 = v17;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v34 = 1;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 0;
    v32 = crc32(0, 0, 0);
    archiveReadChannel = self->_archiveReadChannel;
    v22 = objc_msgSend_offset(self->_entry, v20, v21);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_212E61868;
    v24[3] = &unk_24CEDA8B8;
    v26 = v33;
    v24[4] = self;
    v25 = v4;
    v27 = v37;
    v28 = v35;
    v29 = v31;
    v30 = v13 + (unint64_t)v16 + 30;
    objc_msgSend_readFromOffset_length_handler_(archiveReadChannel, v23, v22, v30 + v7, v24);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);

  }
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  BUReadChannel *archiveReadChannel;
  uint64_t v23;
  const char *v24;
  BUReadChannel *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  int64_t v31;
  unint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v11 = objc_msgSend_compressedSize(self->_entry, v9, v10);
  v14 = v11;
  if (a3 < 0 || v11 < a3)
  {
    BUZipLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_name(self->_entry, v16, v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v28;
      v35 = 2048;
      v36 = v14;
      v37 = 2048;
      v38 = a3;
      _os_log_error_impl(&dword_212E45000, v15, OS_LOG_TYPE_ERROR, "Requested range is not within the entry: %@. Size: %llu. Requested offset: %llu", buf, 0x20u);

    }
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, 1, MEMORY[0x24BDAC990], 0);
  }
  else
  {
    if (v11 - a3 < a4)
      a4 = v11 - a3;
    if (a3 || a4 != v11)
    {
      v18 = objc_msgSend_fileHeaderLength(self->_entry, v12, v13);
      if (v18)
      {
        v21 = v18;
        archiveReadChannel = self->_archiveReadChannel;
        v23 = objc_msgSend_offset(self->_entry, v19, v20);
        objc_msgSend_readFromOffset_length_handler_(archiveReadChannel, v24, v21 + a3 + v23, a4, v8);
      }
      else
      {
        v25 = self->_archiveReadChannel;
        v26 = objc_msgSend_offset(self->_entry, v19, v20);
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = sub_212E61CB4;
        v29[3] = &unk_24CEDA8E0;
        v29[4] = self;
        v31 = a3;
        v32 = a4;
        v30 = v8;
        objc_msgSend_readAllFromChannel_offset_length_completion_(BUIOUtils, v27, (uint64_t)v25, v26, 30, v29);

      }
    }
    else
    {
      objc_msgSend_readWithHandler_(self, v12, (uint64_t)v8);
    }
  }

}

- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4
{
  NSObject *v6;
  size_t size;
  NSObject *subrange;
  char *v9;
  const char *v10;
  uint64_t v11;
  dispatch_data_t v12;
  unsigned __int16 *v13;
  int v14;
  BOOL v15;
  const char *v16;
  unint64_t v17;
  BOOL v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t v24;
  void *buffer_ptr;

  v6 = a3;
  size = dispatch_data_get_size(v6);
  if (size == 30)
  {
    subrange = v6;
    goto LABEL_5;
  }
  if (size >= 0x1F)
  {
    subrange = dispatch_data_create_subrange(v6, 0, 0x1EuLL);
LABEL_5:
    v9 = (char *)subrange;
    v24 = 0;
    buffer_ptr = 0;
    v12 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &v24);
    v13 = (unsigned __int16 *)buffer_ptr;
    if (*(_DWORD *)buffer_ptr == 67324752)
    {
      v14 = *((unsigned __int16 *)buffer_ptr + 4);
      if (*((_WORD *)buffer_ptr + 4))
        v15 = v14 == (unsigned __int16)BUZipDeflateCompressionMethod;
      else
        v15 = 1;
      if (v15
        && (((v14 != (unsigned __int16)BUZipDeflateCompressionMethod) ^ objc_msgSend_isCompressed(self->_entry, v10, v11)) & 1) != 0)
      {
        v17 = v13[13] + (unint64_t)v13[14] + 30;
        *a4 = v17;
        objc_msgSend_setFileHeaderLength_(self->_entry, v16, v17);
        v18 = 1;
LABEL_18:

        goto LABEL_22;
      }
      BUZipLog();
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        sub_212E6D2CC((uint64_t)self, v19, v21);
    }
    else
    {
      BUZipLog();
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        sub_212E6D348((uint64_t)self, v19, v20);
    }

    v18 = 0;
    goto LABEL_18;
  }
  BUZipLog();
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    sub_212E6D3C4((uint64_t)self, v9, v22);
  v18 = 0;
LABEL_22:

  return v18;
}

- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4
{
  id v6;
  BUReadChannel *archiveReadChannel;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[3];
  int v21;
  _QWORD v22[3];
  char v23;

  v6 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 1;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v21 = crc32(0, 0, 0);
  archiveReadChannel = self->_archiveReadChannel;
  v10 = objc_msgSend_offset(self->_entry, v8, v9);
  v13 = objc_msgSend_compressedSize(self->_entry, v11, v12);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_212E62060;
  v16[3] = &unk_24CEDA908;
  v18 = v22;
  v16[4] = self;
  v14 = v6;
  v17 = v14;
  v19 = v20;
  objc_msgSend_readFromOffset_length_handler_(archiveReadChannel, v15, v10 + a3, v13, v16);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

}

- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v7;
  NSObject *v10;
  void (**v11)(id, _BOOL8, NSObject *, _QWORD);
  const char *v12;
  uint64_t v13;
  BOOL v14;
  char *v16;
  uint64_t v17;
  const char *v18;
  _QWORD applier[5];

  v7 = a5;
  v10 = a3;
  v11 = (void (**)(id, _BOOL8, NSObject *, _QWORD))a6;
  if (a4
    && self->_validateCRC
    && (applier[0] = MEMORY[0x24BDAC760],
        applier[1] = 3221225472,
        applier[2] = sub_212E62228,
        applier[3] = &unk_24CEDA928,
        applier[4] = a4,
        dispatch_data_apply(v10, applier),
        v7)
    && objc_msgSend_CRC(self->_entry, v12, v13) != *a4)
  {
    BUZipLog();
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      sub_212E6D440((void **)&self->_entry, v16, v17);

    objc_msgSend_handleFailureWithHandler_error_(self, v18, (uint64_t)v11, 0);
    v14 = 0;
  }
  else
  {
    v11[2](v11, v7, v10, 0);
    v14 = 1;
  }

  return v14;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  void (*v5)(void);
  void *v6;
  id v7;
  const char *v8;
  id v9;

  if (a4)
  {
    v5 = (void (*)(void))*((_QWORD *)a3 + 2);
    v9 = a3;
    v5();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = a3;
    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(v6, v8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v7, 1, 0);

  }
}

- (void)close
{
  uint64_t v2;
  BUReadChannel *archiveReadChannel;
  BUZipEntry *entry;
  BUZipArchive *archive;

  objc_msgSend_close(self->_archiveReadChannel, a2, v2);
  archiveReadChannel = self->_archiveReadChannel;
  self->_archiveReadChannel = 0;

  entry = self->_entry;
  self->_entry = 0;

  archive = self->_archive;
  self->_archive = 0;

}

- (void)setLowWater:(unint64_t)a3
{
  objc_msgSend_setLowWater_(self->_archiveReadChannel, a2, a3);
}

- (void)addBarrier:(id)a3
{
  objc_msgSend_addBarrier_(self->_archiveReadChannel, a2, (uint64_t)a3);
}

- (BOOL)isValid
{
  return ((uint64_t (*)(BUReadChannel *, char *))MEMORY[0x24BEDD108])(self->_archiveReadChannel, sel_isValid);
}

- (BUZipEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (BUZipArchive)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
  objc_storeStrong((id *)&self->_archive, a3);
}

- (BOOL)validateCRC
{
  return self->_validateCRC;
}

- (void)setValidateCRC:(BOOL)a3
{
  self->_validateCRC = a3;
}

- (BUReadChannel)archiveReadChannel
{
  return self->_archiveReadChannel;
}

- (void)setArchiveReadChannel:(id)a3
{
  objc_storeStrong((id *)&self->_archiveReadChannel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
