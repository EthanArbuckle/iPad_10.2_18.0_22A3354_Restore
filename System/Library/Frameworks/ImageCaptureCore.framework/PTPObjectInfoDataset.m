@implementation PTPObjectInfoDataset

- (PTPObjectInfoDataset)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PTPObjectInfoDataset;
  return -[PTPObjectInfoDataset init](&v3, sel_init);
}

- (PTPObjectInfoDataset)initWithData:(id)a3
{
  return -[PTPObjectInfoDataset initWithData:contentType:](self, "initWithData:contentType:", a3, 0);
}

- (PTPObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4
{
  return -[PTPObjectInfoDataset initWithBytes:length:contentType:](self, "initWithBytes:length:contentType:", a3, *(_QWORD *)&a4, 0);
}

- (PTPObjectInfoDataset)initWithData:(id)a3 contentType:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a4;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  return -[PTPObjectInfoDataset initWithBytes:length:contentType:](self, "initWithBytes:length:contentType:", v7, v8, v4);
}

- (PTPObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4 contentType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  PTPObjectInfoDataset *v8;
  PTPObjectInfoDataset *v9;
  char *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  NSString *filename;
  uint64_t v21;
  void *modificationDate;
  NSString *captureDate;
  uint64_t v24;
  NSString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  objc_super v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v42 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)PTPObjectInfoDataset;
  v8 = -[PTPObjectInfoDataset init](&v37, sel_init);
  v9 = v8;
  if (!v8)
    return v9;
  if (-[PTPObjectInfoDataset contentLengthValid:forContentType:](v8, "contentLengthValid:forContentType:", v6, v5))
  {
    v10 = &a3[v6];
    v36 = a3;
    if ((_DWORD)v5)
    {
      v9->_objectHandle = ReadUInt32(&v36);
      if (v5 > 2)
        v6 = 0;
      else
        v6 = ReadUInt32(&v36);
    }
    v9->_storageID = ReadUInt32(&v36);
    v9->_objectFormat = ReadUInt16(&v36);
    v9->_protectionStatus = ReadUInt16(&v36);
    if (v5 > 1)
    {
      if ((v5 & 0xFFFFFFFE) == 2)
        v9->_objectCompressedSize = ReadUInt64((_QWORD **)&v36);
      v18 = (_DWORD)v5 == 3;
      if ((v5 - 5) > 0xFFFFFFFD)
        goto LABEL_18;
    }
    else
    {
      v18 = 0;
      v9->_objectCompressedSize = ReadUInt32(&v36);
    }
    v9->_thumbFormat = ReadUInt16(&v36);
    v9->_thumbCompressedSize = ReadUInt32(&v36);
    v9->_thumbPixWidth = ReadUInt32(&v36);
    v9->_thumbPixHeight = ReadUInt32(&v36);
    v9->_imagePixWidth = ReadUInt32(&v36);
    v9->_imagePixHeight = ReadUInt32(&v36);
    v9->_imageBitDepth = ReadUInt32(&v36);
LABEL_18:
    v9->_parentObject = ReadUInt32(&v36);
    v9->_associationType = ReadUInt16(&v36);
    v9->_associationDesc = ReadUInt32(&v36);
    v9->_sequenceNumber = ReadUInt32(&v36);
    CopyUnicodeStringWithLengthByteFromBufferMaxSize((const void **)&v36, (unint64_t)v10);
    v19 = objc_claimAutoreleasedReturnValue();
    filename = v9->_filename;
    v9->_filename = (NSString *)v19;

    CopyUnicodeStringWithLengthByteFromBufferMaxSize((const void **)&v36, (unint64_t)v10);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      modificationDate = v9->_modificationDate;
      v9->_modificationDate = (NSString *)v21;
    }
    else
    {
      captureDate = v9->_captureDate;
      v9->_captureDate = (NSString *)v21;

      CopyUnicodeStringWithLengthByteFromBufferMaxSize((const void **)&v36, (unint64_t)v10);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v9->_modificationDate;
      v9->_modificationDate = (NSString *)v24;

      CopyUnicodeStringWithLengthByteFromBufferMaxSize((const void **)&v36, (unint64_t)v10);
      modificationDate = (void *)objc_claimAutoreleasedReturnValue();
      -[PTPObjectInfoDataset setKeywords:](v9, "setKeywords:", modificationDate);
    }

    v35 = 0;
    -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](v9, "contentLength:bufferLength:contentType:", (char *)&v35 + 4, &v35, v5);
    if (HIDWORD(v35) != (_DWORD)v6)
    {
      __ICOSLogCreate();
      -[PTPObjectInfoDataset filename](v9, "filename");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v26, "length") >= 0x15)
      {
        objc_msgSend(v26, "substringWithRange:", 0, 18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByAppendingString:", CFSTR(".."));
        v28 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v28;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output Content Length Mismatch: contentLength: %d  datasetLength: %d\n"), HIDWORD(v35), v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_retainAutorelease(v26);
        v32 = v30;
        v33 = objc_msgSend(v31, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v39 = v33;
        v40 = 2114;
        v41 = v29;
        _os_log_impl(&dword_1B98FC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    return v9;
  }
  __ICOSLogCreate();
  v11 = CFSTR("PTPObjInfo");
  if ((unint64_t)objc_msgSend(CFSTR("PTPObjInfo"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("PTPObjInfo"), "substringWithRange:", 0, 18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input Content Length Mismatch: contentLength: %d"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v11);
    v16 = v14;
    v17 = -[__CFString UTF8String](v15, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v39 = v17;
    v40 = 2114;
    v41 = v13;
    _os_log_impl(&dword_1B98FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return 0;
}

- (id)content
{
  return -[PTPObjectInfoDataset content:](self, "content:", 0);
}

- (void)contentLength:(unsigned int *)a3 bufferLength:(unsigned int *)a4 contentType:(int)a5
{
  NSUInteger v9;
  int v10;
  NSUInteger v11;
  int v12;
  NSUInteger v13;
  int v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;

  v9 = -[NSString length](self->_filename, "length");
  if (v9)
    v10 = v9 + 1;
  else
    v10 = 0;
  v11 = -[NSString length](self->_captureDate, "length");
  if (v11)
    v12 = v11 + 1;
  else
    v12 = 0;
  v13 = -[NSString length](self->_modificationDate, "length");
  if (v13)
    v14 = v13 + 1;
  else
    v14 = 0;
  v15 = -[NSMutableString length](self->_keywords, "length");
  if (v15)
    v16 = v15 + 1;
  else
    v16 = 0;
  if (a5 == 2)
  {
    v18 = 2 * (v14 + v10 + v12 + v16);
    *a3 = v18 + 60;
    v17 = v18 + 68;
  }
  else if (a5 == 1)
  {
    v19 = 2 * (v14 + v10 + v12 + v16);
    *a3 = v19 + 56;
    v17 = v19 + 64;
  }
  else
  {
    if (a5)
    {
      if ((a5 - 3) > 1)
        return;
      v17 = 2 * (v14 + v10) + 36;
    }
    else
    {
      v17 = 2 * (v14 + v10 + v12 + v16) + 56;
    }
    *a3 = v17;
  }
  *a4 = v17;
}

- (BOOL)contentLengthValid:(unsigned int)a3 forContentType:(int)a4
{
  uint64_t v6;

  v6 = 0;
  -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](self, "contentLength:bufferLength:contentType:", (char *)&v6 + 4, &v6, *(_QWORD *)&a4);
  return HIDWORD(v6) <= a3;
}

- (id)content:(int)a3
{
  id v5;
  id v6;
  int objectCompressedSize;
  id *p_modificationDate;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _WORD *v16;

  v15 = 0;
  -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](self, "contentLength:bufferLength:contentType:", (char *)&v15 + 4, &v15, *(_QWORD *)&a3);
  v5 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v6 = objc_retainAutorelease((id)objc_msgSend(v5, "initWithLength:", v15));
  v16 = (_WORD *)objc_msgSend(v6, "mutableBytes");
  if (a3)
  {
    WriteUInt32((_DWORD **)&v16, self->_objectHandle);
    if (a3 <= 2)
      WriteUInt32((_DWORD **)&v16, SHIDWORD(v15));
  }
  WriteUInt32((_DWORD **)&v16, self->_storageID);
  WriteUInt16(&v16, self->_objectFormat);
  WriteUInt16(&v16, self->_protectionStatus);
  if (a3 <= 1)
  {
    if (HIDWORD(self->_objectCompressedSize))
      objectCompressedSize = -1;
    else
      objectCompressedSize = self->_objectCompressedSize;
    WriteUInt32((_DWORD **)&v16, objectCompressedSize);
  }
  if ((a3 & 0xFFFFFFFE) == 2)
    WriteUInt64((_QWORD **)&v16, self->_objectCompressedSize);
  if ((a3 - 5) <= 0xFFFFFFFD)
  {
    WriteUInt16(&v16, self->_thumbFormat);
    WriteUInt32((_DWORD **)&v16, self->_thumbCompressedSize);
    WriteUInt32((_DWORD **)&v16, self->_thumbPixWidth);
    WriteUInt32((_DWORD **)&v16, self->_thumbPixHeight);
    WriteUInt32((_DWORD **)&v16, self->_imagePixWidth);
    WriteUInt32((_DWORD **)&v16, self->_imagePixHeight);
    WriteUInt32((_DWORD **)&v16, self->_imageBitDepth);
  }
  WriteUInt32((_DWORD **)&v16, self->_parentObject);
  WriteUInt16(&v16, self->_associationType);
  WriteUInt32((_DWORD **)&v16, self->_associationDesc);
  WriteUInt32((_DWORD **)&v16, self->_sequenceNumber);
  WriteUnicodeStringWithLengthByteToBuffer((_BYTE **)&v16, self->_filename);
  if (a3 == 3)
  {
    p_modificationDate = (id *)&self->_modificationDate;
  }
  else
  {
    WriteUnicodeStringWithLengthByteToBuffer((_BYTE **)&v16, self->_captureDate);
    WriteUnicodeStringWithLengthByteToBuffer((_BYTE **)&v16, self->_modificationDate);
    p_modificationDate = (id *)&self->_keywords;
    if ((unint64_t)-[NSMutableString length](self->_keywords, "length") >= 0x100)
    {
      __ICOSLogCreate();
      -[PTPObjectInfoDataset filename](self, "filename");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "length") >= 0x15)
      {
        objc_msgSend(v9, "substringWithRange:", 0, 18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingString:", CFSTR(".."));
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keywords length of: %lu is larger than a uint8 and cannot be written."), objc_msgSend(*p_modificationDate, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
        -[PTPObjectInfoDataset content:].cold.1(v9, v13);

    }
  }
  WriteUnicodeStringWithLengthByteToBuffer((_BYTE **)&v16, *p_modificationDate);
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t thumbPixWidth;
  uint64_t thumbPixHeight;
  uint64_t imagePixWidth;
  uint64_t imagePixHeight;
  uint64_t imageBitDepth;
  uint64_t parentObject;
  void *v11;
  void *v12;
  uint64_t thumbCompressedSize;
  unint64_t objectCompressedSize;
  void *v16;
  uint64_t storageID;
  uint64_t objectHandle;
  void *v19;

  objectHandle = self->_objectHandle;
  v19 = (void *)MEMORY[0x1E0CB37A0];
  storageID = self->_storageID;
  stringForObjectFormatCode(self->_objectFormat);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  stringForProtectionStatus(self->_protectionStatus);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objectCompressedSize = self->_objectCompressedSize;
  stringForObjectFormatCode(self->_thumbFormat);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  thumbCompressedSize = self->_thumbCompressedSize;
  thumbPixWidth = self->_thumbPixWidth;
  thumbPixHeight = self->_thumbPixHeight;
  imagePixWidth = self->_imagePixWidth;
  imagePixHeight = self->_imagePixHeight;
  imageBitDepth = self->_imageBitDepth;
  parentObject = self->_parentObject;
  stringForAssociationType(self->_associationType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<PTPObjectInfoDataset %p>{\n  _objectHandle:            0x%08lX\n  _storageID:            0x%08lX\n  _objectFormat:         %@\n  _protectionStatus:     %@\n  _objectCompressedSize: %llu\n  _thumbFormat:          %@\n  _thumbCompressedSize:  %lu\n  _thumbPixWidth:        %lu\n  _thumbPixHeight:       %lu\n  _imagePixWidth:        %lu\n  _imagePixHeight:       %lu\n  _imageBitDepth:        %lu\n  _parentObject:         0x%08lX\n  _associationType:      %@\n  _associationDesc:      0x%08lX\n  _sequenceNumber:       %lu\n  _filename:             %@\n  _captureDate:          %@\n  _modificationDate:     %@\n  _keywords:             %@\n}"), self, objectHandle, storageID, v16, v3, objectCompressedSize, v4, thumbCompressedSize, thumbPixWidth, thumbPixHeight, imagePixWidth, imagePixHeight, imageBitDepth, parentObject, v11, self->_associationDesc,
    self->_sequenceNumber,
    self->_filename,
    self->_captureDate,
    self->_modificationDate,
    self->_keywords);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)objectCompressedSize64
{
  return self->_objectCompressedSize;
}

- (unsigned)objectCompressedSize
{
  if (HIDWORD(self->_objectCompressedSize))
    return -1;
  else
    return self->_objectCompressedSize;
}

- (void)setObjectCompressedSize:(unint64_t)a3
{
  self->_objectCompressedSize = a3;
}

- (id)keywords
{
  return (id)-[NSMutableString copy](self->_keywords, "copy");
}

- (void)setKeywords:(id)a3
{
  NSMutableString *v4;
  NSMutableString *keywords;
  id v6;

  v6 = a3;
  if ((-[NSMutableString isEqualToString:](self->_keywords, "isEqualToString:") & 1) == 0)
  {
    v4 = (NSMutableString *)objc_msgSend(v6, "mutableCopy");
    keywords = self->_keywords;
    self->_keywords = v4;

  }
}

- (void)addCustomKeyword:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableString *v9;
  NSMutableString *keywords;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (!self->_keywords)
    {
      v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
      keywords = self->_keywords;
      self->_keywords = v9;

    }
    v11 = objc_msgSend(v6, "length");
    v12 = objc_msgSend(v8, "length");
    v13 = v11 + v12 + -[NSMutableString length](self->_keywords, "length") + 3;
    if (v13 > 0xFF)
    {
      __ICOSLogCreate();
      -[PTPObjectInfoDataset filename](self, "filename");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v16, "length") >= 0x15)
      {
        objc_msgSend(v16, "substringWithRange:", 0, 18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingString:", CFSTR(".."));
        v18 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dropping keyword: %@ identifier: %@ -- Would create string of illegal length: 0x%llx > 0xFF"), v6, v8, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
        -[PTPObjectInfoDataset content:].cold.1(v16, v20);

    }
    else
    {
      v14 = -[NSMutableString length](self->_keywords, "length");
      v15 = CFSTR("&");
      if (!v14)
        v15 = &stru_1E70C89C0;
      -[NSMutableString appendFormat:](self->_keywords, "appendFormat:", CFSTR("%@%@^%@"), v15, v8, v6);
    }
  }

}

- (unsigned)objectContentSizeForContentType:(int)a3
{
  int v4;
  unsigned int v5;

  v5 = 0;
  v4 = 0;
  -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](self, "contentLength:bufferLength:contentType:", &v5, &v4, *(_QWORD *)&a3);
  return v5;
}

- (unsigned)objectBufferSizeForContentType:(int)a3
{
  unsigned int v4;
  int v5;

  v5 = 0;
  v4 = 0;
  -[PTPObjectInfoDataset contentLength:bufferLength:contentType:](self, "contentLength:bufferLength:contentType:", &v5, &v4, *(_QWORD *)&a3);
  return v4;
}

- (id)relatedUUID
{
  char *v3;
  char *v4;
  id v5;
  void *v6;
  NSUUID *v7;
  NSUUID *relatedUUID;
  void *v9;
  NSUUID *v10;
  NSUUID *v11;
  char __dst[37];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_relatedUUID)
  {
    v3 = strstr((char *)-[NSMutableString UTF8String](self->_keywords, "UTF8String"), "RUUID^");
    if (v3 && (v4 = v3, strlen(v3) >= 0x2A))
    {
      __dst[36] = 0;
      strncpy(__dst, v4 + 6, 0x24uLL);
      v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __dst);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (NSUUID *)objc_msgSend(v5, "initWithUUIDString:", v6);
      relatedUUID = self->_relatedUUID;
      self->_relatedUUID = v7;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (NSUUID *)objc_msgSend(v9, "copy");
      v11 = self->_relatedUUID;
      self->_relatedUUID = v10;

    }
  }
  return self->_relatedUUID;
}

- (int64_t)intervalSince1970
{
  int64_t result;

  result = self->_intervalSince1970;
  if (!result)
  {
    result = ICTimeIntervalSince1970FromPTPString(self->_captureDate);
    self->_intervalSince1970 = result;
  }
  return result;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)parentObject
{
  return self->_parentObject;
}

- (void)setParentObject:(unsigned int)a3
{
  self->_parentObject = a3;
}

- (unsigned)associationType
{
  return self->_associationType;
}

- (void)setAssociationType:(unsigned __int16)a3
{
  self->_associationType = a3;
}

- (unsigned)associationDesc
{
  return self->_associationDesc;
}

- (void)setAssociationDesc:(unsigned int)a3
{
  self->_associationDesc = a3;
}

- (unsigned)objectFormat
{
  return self->_objectFormat;
}

- (void)setObjectFormat:(unsigned __int16)a3
{
  self->_objectFormat = a3;
}

- (unsigned)protectionStatus
{
  return self->_protectionStatus;
}

- (void)setProtectionStatus:(unsigned __int16)a3
{
  self->_protectionStatus = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unsigned)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (void)setThumbCompressedSize:(unsigned int)a3
{
  self->_thumbCompressedSize = a3;
}

- (unsigned)thumbFormat
{
  return self->_thumbFormat;
}

- (void)setThumbFormat:(unsigned __int16)a3
{
  self->_thumbFormat = a3;
}

- (unsigned)thumbOffset
{
  return self->_thumbOffset;
}

- (void)setThumbOffset:(unsigned int)a3
{
  self->_thumbOffset = a3;
}

- (unsigned)thumbPixWidth
{
  return self->_thumbPixWidth;
}

- (void)setThumbPixWidth:(unsigned int)a3
{
  self->_thumbPixWidth = a3;
}

- (unsigned)thumbPixHeight
{
  return self->_thumbPixHeight;
}

- (void)setThumbPixHeight:(unsigned int)a3
{
  self->_thumbPixHeight = a3;
}

- (unsigned)imagePixWidth
{
  return self->_imagePixWidth;
}

- (void)setImagePixWidth:(unsigned int)a3
{
  self->_imagePixWidth = a3;
}

- (unsigned)imagePixHeight
{
  return self->_imagePixHeight;
}

- (void)setImagePixHeight:(unsigned int)a3
{
  self->_imagePixHeight = a3;
}

- (unsigned)imageBitDepth
{
  return self->_imageBitDepth;
}

- (void)setImageBitDepth:(unsigned int)a3
{
  self->_imageBitDepth = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)captureDate
{
  return self->_captureDate;
}

- (void)setCaptureDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
}

- (void)content:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B98FC000, v5, v6, "%{public}20s ! %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end
