@implementation APConfigurationDecompressor

- (APConfigurationDecompressor)init
{
  const char *v2;
  uint64_t v3;
  APConfigurationDecompressor *v4;
  uint64_t v5;
  NSFileManager *filemanager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APConfigurationDecompressor;
  v4 = -[APConfigurationDecompressor init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    filemanager = v4->_filemanager;
    v4->_filemanager = (NSFileManager *)v5;

  }
  return v4;
}

- (int64_t)decompressTarAtPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;
  const char *v13;
  const char *v14;
  const char *v15;
  int64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend_filemanager(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v6);

  if ((v12 & 1) != 0)
  {
    if ((objc_msgSend_unzipContentsOfFileAtPath_toPath_(self, v13, (uint64_t)v6, v7) & 1) != 0)
    {
      if ((objc_msgSend_untarFileAtPath_(self, v14, (uint64_t)v7) & 1) != 0)
      {
        objc_msgSend_removeFileAtPath_(self, v15, (uint64_t)v7);
        v16 = 1200;
      }
      else
      {
        APLogForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_235C39000, v19, OS_LOG_TYPE_ERROR, "Error: Could not untar file.", v21, 2u);
        }

        v16 = 1506;
      }
    }
    else
    {
      APLogForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_235C39000, v18, OS_LOG_TYPE_ERROR, "Error: Could not decompress file.", v22, 2u);
      }

      v16 = 1505;
    }
  }
  else
  {
    APLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235C39000, v17, OS_LOG_TYPE_ERROR, "Error: File doesn't exist.", buf, 2u);
    }

    v16 = 1504;
  }

  return v16;
}

- (BOOL)unzipContentsOfFileAtPath:(id)a3 toPath:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v7, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unzipData_(self, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v10, v11, v12))
  {
    v22 = 0;
    objc_msgSend_writeToFile_options_error_(v10, v13, (uint64_t)v6, 0x10000000, &v22);
    v14 = v22;
    if (!v14)
    {
      v20 = 1;
      goto LABEL_8;
    }
    v15 = v14;
    APLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v15, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v24 = v6;
      v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_235C39000, v16, OS_LOG_TYPE_ERROR, "Error: Unable to create decompressed file: %{private}@, error: %{public}@.", buf, 0x16u);

    }
  }
  v20 = 0;
LABEL_8:

  return v20;
}

- (id)unzipData:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  uLong total_out;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  const char *v38;
  z_stream v40;
  uint8_t buf[4];
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  memset(&v40.avail_in, 0, 104);
  v40.avail_in = objc_msgSend_length(v3, v4, v5);
  v6 = objc_retainAutorelease(v3);
  v40.next_in = (Bytef *)objc_msgSend_bytes(v6, v7, v8);
  v40.avail_out = 0;
  v9 = inflateInit2_(&v40, 47, "1.2.12", 112);
  if (v9)
  {
    v12 = v9;
    APLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v42 = v12;
      _os_log_impl(&dword_235C39000, v13, OS_LOG_TYPE_ERROR, "Error: Could not unzip, error: %d", buf, 8u);
    }

    v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDBCEC8];
    v16 = objc_msgSend_length(v6, v10, v11);
    objc_msgSend_dataWithCapacity_(v15, v17, 2 * v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v19 = (void *)MEMORY[0x23B7DBF90]();
      total_out = v40.total_out;
      if (total_out >= objc_msgSend_length(v18, v21, v22))
      {
        v25 = objc_msgSend_length(v6, v23, v24);
        v28 = objc_msgSend_length(v18, v26, v27);
        objc_msgSend_setLength_(v18, v29, v28 + (v25 >> 1));
      }
      v14 = objc_retainAutorelease(v18);
      v32 = objc_msgSend_mutableBytes(v14, v30, v31);
      v40.next_out = (Bytef *)(v32 + v40.total_out);
      v35 = objc_msgSend_length(v14, v33, v34);
      v40.avail_out = v35 - LODWORD(v40.total_out);
      v36 = inflate(&v40, 2);
      objc_autoreleasePoolPop(v19);
    }
    while (!v36);
    v37 = inflateEnd(&v40);
    if (v36 == 1 && !v37)
      objc_msgSend_setLength_(v14, v38, v40.total_out);
  }

  return v14;
}

- (BOOL)untarFileAtPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  unint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  int v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  unint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  id v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  __int128 v60;
  void *v61;
  void *v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_stringByDeletingLastPathComponent(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_sizeForFileAtPath_(self, v8, (uint64_t)v4);
  v61 = v4;
  objc_msgSend_fileHandleForReadingAtPath_(MEMORY[0x24BDD1578], v10, (uint64_t)v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v15 = 0;
    *(_QWORD *)&v14 = 138478083;
    v60 = v14;
    v62 = v7;
    while (1)
    {
      v16 = (void *)MEMORY[0x23B7DBF90]();
      v18 = objc_msgSend_typeForObject_atOffset_(self, v17, (uint64_t)v13, v15);
      if (v18 <= 52)
        break;
      if (v18 == 53)
      {
        objc_msgSend_nameForObject_atOffset_(self, v19, (uint64_t)v13, v15);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathComponent_(v7, v41, (uint64_t)v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByStandardizingPath(v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByResolvingSymlinksInPath(v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_hasPrefix_(v48, v49, (uint64_t)v7))
        {
          objc_msgSend_filemanager(self, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0;
          objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v52, v53, (uint64_t)v48, 1, 0, &v63);
          v54 = v63;

          if (v54)
          {
            APLogForCategory();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_description(v54, v56, v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v60;
              v65 = v48;
              v66 = 2114;
              v67 = v58;
              _os_log_impl(&dword_235C39000, v55, OS_LOG_TYPE_ERROR, "Error: Unable to create directory: %{private}@, error: %{public}@.", buf, 0x16u);

            }
          }
        }
        else
        {
          v54 = 0;
        }

        v39 = 1;
        goto LABEL_25;
      }
      if (v18 != 120)
        goto LABEL_14;
      v39 = 2;
LABEL_26:
      v15 += v39 << 9;
      objc_autoreleasePoolPop(v16);
      if (v15 >= v9)
        goto LABEL_27;
    }
    if (!v18)
    {
      v39 = 1;
      goto LABEL_26;
    }
    if (v18 == 48)
    {
      objc_msgSend_nameForObject_atOffset_(self, v19, (uint64_t)v13, v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v7, v21, (uint64_t)v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByStandardizingPath(v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByResolvingSymlinksInPath(v25, v26, v27);
      v28 = (uint64_t)v7;
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend_sizeForObject_atOffset_(self, v30, (uint64_t)v13, v15);
      if (v31 && (v33 = v31, objc_msgSend_hasPrefix_(v29, v32, v28)))
      {
        objc_msgSend_lastPathComponent(v20, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v36, v37, (uint64_t)CFSTR("ConfigurationNode.json")))
          objc_msgSend_writeFileDataForFile_atLocation_withLength_atPath_(self, v38, (uint64_t)v13, v15 + 512, v33, v29);
        v39 = ((unint64_t)(v33 - 1) >> 9) + 2;

      }
      else
      {
        v39 = 1;
      }

LABEL_25:
      v7 = v62;
      goto LABEL_26;
    }
LABEL_14:
    v39 = (unint64_t)((double)((unint64_t)objc_msgSend_sizeForObject_atOffset_(self, v19, (uint64_t)v13, v15, v60) >> 9)+ 1.0);
    goto LABEL_26;
  }
LABEL_27:
  objc_msgSend_closeFile(v13, v11, v12, v60);

  return 1;
}

- (unint64_t)sizeForFileAtPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_filemanager(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend_attributesOfItemAtPath_error_(v7, v8, (uint64_t)v4, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;

  if (v10)
  {
    APLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v10, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v22 = v4;
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_235C39000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to get attributes for decompressed file: %{private}@, error: %{public}@.", buf, 0x16u);

    }
    v16 = 0;
  }
  else
  {
    objc_msgSend_objectForKey_(v9, v11, *MEMORY[0x24BDD0D08]);
    v12 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_unsignedLongLongValue(v12, v17, v18);
  }

  return v16;
}

- (void)removeFileAtPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_filemanager(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend_removeItemAtPath_error_(v7, v8, (uint64_t)v4, &v14);
  v9 = v14;

  if (v9)
  {
    APLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v16 = v4;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_235C39000, v10, OS_LOG_TYPE_ERROR, "Error: Unable to remove file: %{private}@, error: %{public}@.", buf, 0x16u);

    }
  }

}

- (char)typeForObject:(id)a3 atOffset:(unint64_t)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  char v10;

  objc_msgSend_dataForObject_inLocation_andLength_(self, a2, (uint64_t)a3, a4 + 156, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v4, v5, v6))
  {
    v7 = objc_retainAutorelease(v4);
    v10 = *(_BYTE *)objc_msgSend_bytes(v7, v8, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)nameForObject:(id)a3 atOffset:(unint64_t)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  const char *v13;
  void *v14;
  _OWORD v16[6];
  int v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dataForObject_inLocation_andLength_(self, a2, (uint64_t)a3, a4, 100);
  v18 = 0;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend_bytes(v4, v5, v6);
  v9 = *(_OWORD *)(v7 + 16);
  v8 = *(_OWORD *)(v7 + 32);
  v16[0] = *(_OWORD *)v7;
  v16[1] = v9;
  v16[2] = v8;
  v11 = *(_OWORD *)(v7 + 64);
  v10 = *(_OWORD *)(v7 + 80);
  v12 = *(_OWORD *)(v7 + 48);
  v17 = *(_DWORD *)(v7 + 96);
  v16[4] = v11;
  v16[5] = v10;
  v16[3] = v12;
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v13, (uint64_t)v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)sizeForObject:(id)a3 atOffset:(unint64_t)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char __str[8];
  int v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dataForObject_inLocation_andLength_(self, a2, (uint64_t)a3, a4 + 124, 12);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend_bytes(v4, v5, v6);
  v12 = 0;
  *(_QWORD *)__str = *(_QWORD *)v7;
  v11 = *(_DWORD *)(v7 + 8);
  v8 = strtol(__str, 0, 8);

  return v8;
}

- (void)writeFileDataForFile:(id)a3 atLocation:(unint64_t)a4 withLength:(unint64_t)a5 atPath:(id)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  id v28;

  v28 = a3;
  v9 = a6;
  objc_msgSend_data(MEMORY[0x24BDBCE50], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_writeToFile_atomically_(v12, v13, (uint64_t)v9, 0);

  if (v14)
  {
    objc_msgSend_fileHandleForWritingAtPath_(MEMORY[0x24BDD1578], v15, (uint64_t)v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_seekToFileOffset_(v28, v17, a4);
    if (a5 >= 0xC801)
    {
      do
      {
        v20 = (void *)MEMORY[0x23B7DBF90](v18);
        objc_msgSend_readDataOfLength_(v28, v21, 51200);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_writeData_(v16, v23, (uint64_t)v22);

        a5 -= 51200;
        objc_autoreleasePoolPop(v20);
      }
      while (a5 > 0xC800);
    }
    objc_msgSend_readDataOfLength_(v28, v19, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v16, v25, (uint64_t)v24);

    objc_msgSend_closeFile(v16, v26, v27);
  }

}

- (id)dataForObject:(id)a3 inLocation:(unint64_t)a4 andLength:(unint64_t)a5
{
  id v7;
  const char *v8;
  const char *v9;
  void *v10;

  v7 = a3;
  objc_msgSend_seekToFileOffset_(v7, v8, a4);
  objc_msgSend_readDataOfLength_(v7, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSFileManager)filemanager
{
  return self->_filemanager;
}

- (void)setFilemanager:(id)a3
{
  objc_storeStrong((id *)&self->_filemanager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filemanager, 0);
}

@end
