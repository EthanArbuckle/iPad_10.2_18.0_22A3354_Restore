@implementation BUZipEntry

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  void *v27;

  v3 = (void *)MEMORY[0x24BDD17C8];
  BUObjectReferenceDescription(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collapsedName(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_size(self, v11, v12);
  v16 = objc_msgSend_compressedSize(self, v14, v15);
  v19 = objc_msgSend_CRC(self, v17, v18);
  v22 = objc_msgSend_offset(self, v20, v21);
  v25 = objc_msgSend_extraFieldsLength(self, v23, v24);
  objc_msgSend_stringWithFormat_(v3, v26, (uint64_t)CFSTR("<%@> %@ (%@) size=%qu compressedSize=%qu CRC=0x%X offset=%qu extraFieldLength=%hu"), v4, v7, v10, v13, v16, v19, v22, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (BOOL)isSymLink
{
  uint64_t v2;

  return objc_msgSend_externalFileAttributes(self, a2, v2) >> 28 == 10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void)setLastModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unsigned)CRC
{
  return self->_CRC;
}

- (void)setCRC:(unsigned int)a3
{
  self->_CRC = a3;
}

- (NSString)collapsedName
{
  return self->_collapsedName;
}

- (void)setCollapsedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (unint64_t)compressedSize
{
  return self->_compressedSize;
}

- (void)setCompressedSize:(unint64_t)a3
{
  self->_compressedSize = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unsigned)nameLength
{
  return self->_nameLength;
}

- (void)setNameLength:(unsigned __int16)a3
{
  self->_nameLength = a3;
}

- (unsigned)extraFieldsLength
{
  return self->_extraFieldsLength;
}

- (void)setExtraFieldsLength:(unsigned __int16)a3
{
  self->_extraFieldsLength = a3;
}

- (unint64_t)fileHeaderLength
{
  return self->_fileHeaderLength;
}

- (void)setFileHeaderLength:(unint64_t)a3
{
  self->_fileHeaderLength = a3;
}

- (unsigned)externalFileAttributes
{
  return self->_externalFileAttributes;
}

- (void)setExternalFileAttributes:(unsigned int)a3
{
  self->_externalFileAttributes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapsedName, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)usableName
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend_collapsedName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend_name(self, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)_dataFromArchive:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  objc_msgSend_readChannelForEntry_(v6, v7, (uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_212E66170;
  v30 = sub_212E66180;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_212E66170;
  v24 = sub_212E66180;
  v25 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_212E66188;
  v16[3] = &unk_24CEDACD8;
  v18 = &v26;
  v19 = &v20;
  v10 = v9;
  v17 = v10;
  objc_msgSend_readWithHandler_(v8, v11, (uint64_t)v16);
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_close(v8, v12, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v14 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)stringFromArchive:(id)a3
{
  NSObject *v3;
  id v4;
  dispatch_data_t v5;
  id v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  size_t size_ptr;
  void *buffer_ptr;
  id v13;

  v13 = 0;
  objc_msgSend__dataFromArchive_error_(self, a2, (uint64_t)a3, &v13);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v5 = dispatch_data_create_map(v3, (const void **)&buffer_ptr, &size_ptr);
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = (void *)objc_msgSend_initWithBytes_length_encoding_(v6, v7, (uint64_t)buffer_ptr, size_ptr, 4);

  }
  else
  {
    BUZipLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_212E6D990();

    v8 = 0;
  }

  return v8;
}

- (id)dataFromArchive:(id)a3
{
  NSObject *v3;
  id v4;
  dispatch_data_t v5;
  id v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  size_t size_ptr;
  void *buffer_ptr;
  id v13;

  v13 = 0;
  objc_msgSend__dataFromArchive_error_(self, a2, (uint64_t)a3, &v13);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v5 = dispatch_data_create_map(v3, (const void **)&buffer_ptr, &size_ptr);
    v6 = objc_alloc(MEMORY[0x24BDBCE50]);
    v8 = (void *)objc_msgSend_initWithData_(v6, v7, (uint64_t)v5);

  }
  else
  {
    BUZipLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_212E6D990();

    v8 = 0;
  }

  return v8;
}

- (id)plistFromArchive:(id)a3
{
  NSObject *v3;
  id v4;
  dispatch_data_t v5;
  const char *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  size_t size_ptr;
  void *buffer_ptr;
  id v15;

  v15 = 0;
  objc_msgSend__dataFromArchive_error_(self, a2, (uint64_t)a3, &v15);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v3)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v5 = dispatch_data_create_map(v3, (const void **)&buffer_ptr, &size_ptr);
    v12 = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v6, (uint64_t)v5, 0, 0, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (v8)
    {
      BUZipLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_212E6D9F0();

      v7 = 0;
    }

  }
  else
  {
    BUZipLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_212E6D990();

    v7 = 0;
  }

  return v7;
}

- (_xmlDoc)xmlDocumentFromArchive:(id)a3
{
  id v4;
  const char *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  int v13;
  int v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  xmlParserCtxtPtr PushParserCtxt;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  _xmlDoc *myDoc;
  NSObject *v34;
  size_t size_ptr;
  void *buffer_ptr;
  id v38;

  v4 = a3;
  v38 = 0;
  objc_msgSend__dataFromArchive_error_(self, v5, (uint64_t)v4, &v38);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v38;
  if (v6)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v8 = dispatch_data_create_map(v6, (const void **)&buffer_ptr, &size_ptr);
    v11 = objc_msgSend_length(v8, v9, v10);
    v13 = v11;
    if (v11 >= 4)
      v14 = 4;
    else
      v14 = v11;
    if (size_ptr >> 31)
      objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v12, (uint64_t)CFSTR("BUDataRepresentationError"), CFSTR("Overflow in xmlDocument %ld"), size_ptr);
    v15 = objc_retainAutorelease(v8);
    v18 = (const char *)objc_msgSend_bytes(v15, v16, v17);
    PushParserCtxt = xmlCreatePushParserCtxt(0, 0, v18, v14, 0);
    if (!PushParserCtxt)
      objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v19, (uint64_t)CFSTR("BUDataRepresentationError"), CFSTR("xmlCreatePushParserCtxt() failed"));
    if (size_ptr)
    {
      v21 = objc_retainAutorelease(v15);
      v24 = objc_msgSend_bytes(v21, v22, v23);
      v25 = xmlParseChunk(PushParserCtxt, (const char *)(v24 + v14), v13 - v14, 0);
      if ((_DWORD)v25)
        objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v26, (uint64_t)CFSTR("BUDataRepresentationError"), CFSTR("xmlParseChunk() failed: %d"), v25);
    }
    v27 = objc_retainAutorelease(v15);
    v30 = (const char *)objc_msgSend_bytes(v27, v28, v29);
    v31 = xmlParseChunk(PushParserCtxt, v30, 0, 1);
    if ((_DWORD)v31)
      objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v32, (uint64_t)CFSTR("BUDataRepresentationError"), CFSTR("xmlParseChunk() failed: %d"), v31);
    myDoc = PushParserCtxt->myDoc;
    if (!PushParserCtxt->wellFormed)
      objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v32, (uint64_t)CFSTR("BUDataRepresentationError"), CFSTR("XML document is not well formed."));
    xmlFreeParserCtxt(PushParserCtxt);

  }
  else
  {
    BUZipLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_212E6D990();

    myDoc = 0;
  }

  return myDoc;
}

- (id)extractFromArchive:(id)a3
{
  id v4;
  BUTemporaryDirectory *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  char v31;
  id v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  char *v38;
  uint64_t v39;
  NSObject *v40;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;

  v4 = a3;
  v5 = [BUTemporaryDirectory alloc];
  v46 = 0;
  v7 = (void *)objc_msgSend_initWithError_(v5, v6, (uint64_t)&v46);
  v10 = v46;
  if (v7)
  {
    objc_msgSend_URL(v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_options(v4, v12, v13);
    v15 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend_usableName(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_relativeToURL_(v15, v19, (uint64_t)v18, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v14 & 0x10) != 0 || objc_msgSend_bu_isContainedWithinFileURL_(v20, v21, (uint64_t)v11))
    {
      v45 = v10;
      objc_msgSend__dataFromArchive_error_(self, v21, (uint64_t)v4, &v45);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v45;

      if (v22)
      {
        v42 = v23;
        objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v20;
        objc_msgSend_URLByDeletingLastPathComponent(v20, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        v31 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v26, v30, (uint64_t)v29, 1, 0, &v44);
        v32 = v44;

        if ((v31 & 1) != 0)
        {
          objc_msgSend__extractFromArchiveData_destinationURL_allowEntriesOutsideRoot_error_(self, v33, (uint64_t)v22, v11, (v14 >> 4) & 1, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
            objc_msgSend_leakTemporaryDirectory(v7, v35, v36);
        }
        else
        {
          BUZipLog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_212E6DB10(v43, (const char *)v32, v40);

          v34 = 0;
        }
        v23 = v42;
        v20 = v43;
      }
      else
      {
        BUZipLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          sub_212E6D990();

        v34 = 0;
      }
    }
    else
    {
      BUZipLog();
      v38 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
        sub_212E6DBA8(self, v38, v39);

      v34 = 0;
      v23 = v10;
    }

    v10 = v23;
  }
  else
  {
    BUZipLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_212E6DAB0();
    v34 = 0;
  }

  return v34;
}

- (id)_extractFromArchiveData:(id)a3 destinationURL:(id)a4 allowEntriesOutsideRoot:(BOOL)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  const char *v22;
  char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  int v39;
  id v40;
  id v41;
  id v42;
  char v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  void *v59;
  void *v60;
  id v61;
  id v62;
  size_t size_ptr;
  void *buffer_ptr;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  char *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  size_ptr = 0;
  buffer_ptr = 0;
  v11 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v12 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend_usableName(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_relativeToURL_(v12, v16, (uint64_t)v15, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isSymLink(self, v18, v19))
  {
    v21 = objc_alloc(MEMORY[0x24BDD17C8]);
    v23 = (char *)objc_msgSend_initWithData_encoding_(v21, v22, (uint64_t)v11, 4);
    if (objc_msgSend_length(v23, v24, v25))
    {
      objc_msgSend_URLByDeletingLastPathComponent(v17, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x24BDBCF48], v29, (uint64_t)v23, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v30;
      if (a5 || objc_msgSend_bu_isContainedWithinFileURL_(v30, v31, (uint64_t)v10))
      {
        v60 = v33;
        objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(v17, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        v39 = objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(v34, v38, (uint64_t)v37, v23, &v62);
        v40 = v62;

        if (v39)
        {
          v41 = v17;
          v42 = 0;
        }
        else
        {
          BUZipLog();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_path(v17, v54, v55);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v66 = v59;
            v67 = 2112;
            v68 = v23;
            v69 = 2112;
            v70 = v40;
            _os_log_error_impl(&dword_212E45000, v53, OS_LOG_TYPE_ERROR, "Error creating symlink at %@ with destination %@: %@", buf, 0x20u);

          }
          v40 = v40;
          v41 = 0;
          v42 = v40;
        }
        v33 = v60;
      }
      else
      {
        BUZipLog();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          sub_212E6DCA0(self, v23, v56);

        v40 = 0;
        v42 = 0;
        v41 = 0;
      }

    }
    else
    {
      BUZipLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_212E6DC38(v28, v46, v47, v48, v49, v50, v51, v52);
      v40 = 0;
      v42 = 0;
      v41 = 0;
    }

    v44 = 0;
  }
  else
  {
    v61 = 0;
    v43 = objc_msgSend_writeToURL_options_error_(v11, v20, (uint64_t)v17, 268435457, &v61);
    v44 = v61;
    if ((v43 & 1) != 0)
    {
      v41 = v17;
      v42 = 0;
    }
    else
    {
      BUZipLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_212E6DD28();

      v42 = v44;
      v41 = 0;
      v44 = v42;
    }
  }
  if (a6)
    *a6 = objc_retainAutorelease(v42);
  v57 = v41;

  return v57;
}

- (BOOL)extractFromArchive:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *inited;
  unint64_t v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  BOOL v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_212E66170;
  v48 = sub_212E66180;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v10 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend_path(v9, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_(v10, v14, v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v13) = objc_msgSend_options(v8, v16, v17);
  v18 = objc_alloc(MEMORY[0x24BDBCF48]);
  objc_msgSend_usableName(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (void *)objc_msgSend_initFileURLWithPath_relativeToURL_(v18, v22, (uint64_t)v21, v15);
  v24 = v13 & 0x10;

  if ((v13 & 0x10) != 0 || (objc_msgSend_bu_isContainedWithinFileURL_(inited, v25, (uint64_t)v15) & 1) != 0)
  {
    BUZipLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v8;
      _os_log_impl(&dword_212E45000, v26, OS_LOG_TYPE_DEFAULT, "Beginning streaming extraction for archive %@", buf, 0xCu);
    }

    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = sub_212E67134;
    v34[3] = &unk_24CEDAD00;
    v37 = &v44;
    v34[4] = self;
    v35 = inited;
    v39 = v24 >> 4;
    v36 = v15;
    v38 = &v40;
    objc_msgSend__beginStreamingWriteForArchive_forDestinationURL_completion_(self, v27, (uint64_t)v8, v35, v34);
    if (a5)
      *a5 = objc_retainAutorelease((id)v45[5]);
    v28 = *((_BYTE *)v41 + 24) != 0;

  }
  else
  {
    BUZipLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_name(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v32;
      _os_log_impl(&dword_212E45000, v29, OS_LOG_TYPE_DEFAULT, "Skipping entry because it is outside the root of the zip: %@", buf, 0xCu);

    }
    v28 = 0;
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v28;
}

- (void)_beginStreamingWriteForArchive:(id)a3 forDestinationURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  BUTemporaryDirectory *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  BUFileIOChannel *v22;
  const char *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v45 = a5;
  v10 = [BUTemporaryDirectory alloc];
  v63 = 0;
  v12 = (void *)objc_msgSend_initForWritingToURL_error_(v10, v11, (uint64_t)v9, &v63);
  v44 = v63;
  if (v12)
  {
    objc_msgSend_URL(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastPathComponent(v9, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v15, v19, (uint64_t)v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_readChannelForEntry_(v8, v21, (uint64_t)self);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = sub_212E66170;
    v61 = sub_212E66180;
    v22 = [BUFileIOChannel alloc];
    v56 = 0;
    v24 = (void *)objc_msgSend_initForStreamWritingURL_error_(v22, v23, (uint64_t)v20, &v56);
    v25 = v56;
    v62 = v24;
    if (v58[5])
    {
      v50 = 0;
      v51 = &v50;
      v52 = 0x3032000000;
      v53 = sub_212E66170;
      v54 = sub_212E66180;
      v55 = 0;
      v26 = dispatch_group_create();
      dispatch_group_enter(v26);
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = sub_212E67914;
      v46[3] = &unk_24CEDAD28;
      v48 = &v50;
      v27 = v26;
      v47 = v27;
      v49 = &v57;
      objc_msgSend_readWithHandler_(v43, v28, (uint64_t)v46);
      dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend_close(v43, v29, v30);
      objc_msgSend_close((void *)v58[5], v31, v32);
      if (v51[5])
      {
        BUZipLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v42 = v51[5];
          *(_DWORD *)buf = 138412802;
          v65 = v8;
          v66 = 2112;
          v67 = v20;
          v68 = 2112;
          v69 = v42;
          _os_log_error_impl(&dword_212E45000, v33, OS_LOG_TYPE_ERROR, "Failed to write archive %@ to URL %@. Error: %@", buf, 0x20u);
        }

        v34 = MEMORY[0x2199A7288](v45);
        v35 = (void *)v34;
        if (v34)
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v34 + 16))(v34, 0, v51[5]);
      }
      else
      {
        v41 = MEMORY[0x2199A7288](v45);
        v35 = (void *)v41;
        if (v41)
          (*(void (**)(uint64_t, void *, _QWORD))(v41 + 16))(v41, v20, 0);
      }

      _Block_object_dispose(&v50, 8);
    }
    else
    {
      BUZipLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_212E6DEDC();

      v39 = MEMORY[0x2199A7288](v45);
      v40 = (void *)v39;
      if (v39)
        (*(void (**)(uint64_t, _QWORD, id))(v39 + 16))(v39, 0, v25);

    }
    _Block_object_dispose(&v57, 8);

  }
  else
  {
    BUZipLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_212E6DE7C();

    v37 = MEMORY[0x2199A7288](v45);
    v20 = (void *)v37;
    if (v37)
      (*(void (**)(uint64_t, _QWORD, id))(v37 + 16))(v37, 0, v44);
  }

}

@end
