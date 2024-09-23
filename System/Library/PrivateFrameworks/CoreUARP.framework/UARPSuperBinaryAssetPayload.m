@implementation UARPSuperBinaryAssetPayload

- (UARPSuperBinaryAssetPayload)init
{
  char *v2;
  os_log_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UARPSuperBinaryAssetPayload;
  v2 = -[UARPSuperBinaryAssetPayload init](&v12, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.accessoryupdater.uarp", "superbinarypayload");
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v5;

    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v7;

    *(_QWORD *)(v2 + 92) = 4096;
    *((_DWORD *)v2 + 42) = -1;
    v9 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v10 = (void *)*((_QWORD *)v2 + 20);
    *((_QWORD *)v2 + 20) = v9;

    *((_QWORD *)v2 + 25) = 3;
    v2[172] = 1;
  }
  return (UARPSuperBinaryAssetPayload *)v2;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4
{
  id v7;
  id v8;
  UARPSuperBinaryAssetPayload *v9;
  UARPSuperBinaryAssetPayload *v10;
  uint64_t v11;
  NSString *tag;

  v7 = a3;
  v8 = a4;
  v9 = -[UARPSuperBinaryAssetPayload init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payloadTag, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), -[UARPAssetTag char1](v10->_payloadTag, "char1"), -[UARPAssetTag char2](v10->_payloadTag, "char2"), -[UARPAssetTag char3](v10->_payloadTag, "char3"), -[UARPAssetTag char4](v10->_payloadTag, "char4"));
    v11 = objc_claimAutoreleasedReturnValue();
    tag = v10->_tag;
    v10->_tag = (NSString *)v11;

    objc_storeStrong((id *)&v10->_assetVersion, a4);
  }

  return v10;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4 writable:(BOOL)a5
{
  UARPSuperBinaryAssetPayload *v5;
  UARPSuperBinaryAssetPayload *v6;
  uint64_t v7;
  NSURL *url;

  v5 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:](self, "initWithPayloadTag:assetVersion:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->_isWritable = 1;
    UARPUtilsBuildURLForTemporaryFile();
    v7 = objc_claimAutoreleasedReturnValue();
    url = v6->_url;
    v6->_url = (NSURL *)v7;

  }
  return v6;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 majorVersion:(unint64_t)a4 minorVersion:(unint64_t)a5 releaseVersion:(unint64_t)a6 buildVersion:(unint64_t)a7
{
  id v11;
  UARPAssetVersion *v12;
  UARPSuperBinaryAssetPayload *v13;

  v11 = a3;
  v12 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", a4, a4, a6, a7);
  v13 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:](self, "initWithPayloadTag:assetVersion:", v11, v12);

  return v13;
}

- (UARPSuperBinaryAssetPayload)initWithTag:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  UARPSuperBinaryAssetPayload *v15;
  char *v16;
  UARPAssetTag *v17;
  UARPAssetVersion *v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if ((unint64_t)objc_msgSend(v11, "length") >= 4)
  {
    v16 = (char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    v17 = -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v16, v16[1], v16[2], v16[3]);
    v18 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", objc_msgSend(v12, "unsignedIntegerValue"), objc_msgSend(v12, "unsignedIntegerValue"), objc_msgSend(v13, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
    self = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:](self, "initWithPayloadTag:assetVersion:", v17, v18);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadHeader:(UARPPayloadHeader *)a3
{
  UARPSuperBinaryAssetPayload *v4;
  UARPSuperBinaryAssetPayload *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  NSString *tag;
  UARPAssetVersion *v10;
  UARPAssetVersion *assetVersion;
  char v13[4];

  v4 = -[UARPSuperBinaryAssetPayload init](self, "init");
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->payloadHeaderLength;
    v7 = *(_OWORD *)&a3->payloadVersion.release;
    *(_QWORD *)&v4->_payloadHeader.payloadOffset = *(_QWORD *)&a3->payloadOffset;
    *(_OWORD *)&v4->_payloadHeader.payloadVersion.release = v7;
    *(_OWORD *)&v4->_payloadHeader.payloadHeaderLength = v6;
    uarpPayloadTagUnpack(v4->_payloadHeader.payloadTag, v13);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), v13[0], v13[1], v13[2], v13[3]);
    v8 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (NSString *)v8;

    v5->_uarpVersion = v5->_payloadHeader.payloadVersion;
    v10 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", v5->_uarpVersion.major, v5->_uarpVersion.minor, v5->_uarpVersion.release, v5->_uarpVersion.build);
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = v10;

  }
  return v5;
}

- (BOOL)updateFormatVersion:(unint64_t)a3
{
  if (a3 <= 3)
    self->_formatVersion = a3;
  return a3 < 4;
}

- (UARPAssetTag)payloadTag
{
  NSString *tag;
  UARPAssetTag *payloadTag;
  const char *v5;
  UARPAssetTag *v6;
  UARPAssetTag *v7;

  tag = self->_tag;
  if (tag)
  {
    if (-[NSString length](tag, "length") == 4)
    {
      payloadTag = self->_payloadTag;
      if (!payloadTag)
      {
        v5 = -[NSString UTF8String](self->_tag, "UTF8String");
        v6 = -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v5, v5[1], v5[2], v5[3]);
        v7 = self->_payloadTag;
        self->_payloadTag = v6;

        payloadTag = self->_payloadTag;
      }
      tag = payloadTag;
    }
    else
    {
      tag = 0;
    }
  }
  return (UARPAssetTag *)tag;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_tlvs);
}

- (NSData)metaData
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", self->_metaData);
}

- (void)addMetaDataTLV:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *composeTLVs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "type") == 3166200577
      || objc_msgSend(v5, "type") == 3166200578
      || objc_msgSend(v5, "type") == 3166200576
      || objc_msgSend(v5, "type") == 3166200579)
    {
      composeTLVs = self->_composeTLVs;
LABEL_7:
      -[NSMutableArray addObject:](composeTLVs, "addObject:", v5);
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "type") == 3166200581)
    {
      -[UARPSuperBinaryAssetPayload processVersionString:](self, "processVersionString:", v5);
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "type") == 3166200582)
    {
      -[UARPSuperBinaryAssetPayload processBVERVersionString:](self, "processBVERVersionString:", v5);
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "type") == 3436347660)
    {
      objc_msgSend(v5, "valueAsNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_compression = objc_msgSend(v14, "unsignedLongValue");
    }
    else if (objc_msgSend(v5, "type") == 3436347659)
    {
      objc_msgSend(v5, "valueAsNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_blockSize = objc_msgSend(v14, "unsignedShortValue");
    }
    else if (objc_msgSend(v5, "type") == 3436347663)
    {
      objc_msgSend(v5, "valueAsNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_compressionHeaderIndex = objc_msgSend(v14, "unsignedLongValue");
    }
    else
    {
      if (objc_msgSend(v5, "type") != 3436347674)
      {
LABEL_24:
        composeTLVs = self->_tlvs;
        goto LABEL_7;
      }
      objc_msgSend(v5, "valueAsNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_allowCompressionHeaders = objc_msgSend(v14, "BOOLValue");
    }

    goto LABEL_24;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[UARPSuperBinaryAssetPayload addMetaDataTLV:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
LABEL_10:

}

- (void)addMetaDataTLVs:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  +[UARPSuperBinaryAssetTLV decomposeTLVs:](UARPSuperBinaryAssetTLV, "decomposeTLVs:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_tlvs, v10);
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347659, self->_tlvs);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347660, self->_tlvs);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(v4, "valueAsNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_blockSize = objc_msgSend(v8, "unsignedIntValue");

    objc_msgSend(v6, "valueAsNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_compression = objc_msgSend(v9, "unsignedIntValue");

  }
}

- (BOOL)setPayloadToContentsOfFile:(id)a3 friendlyName:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BDBCF48];
  v8 = a4;
  objc_msgSend(a3, "stringByExpandingTildeInPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UARPSuperBinaryAssetPayload setPayloadToContentsOfURL:friendlyName:](self, "setPayloadToContentsOfURL:friendlyName:", v10, v8);

  return (char)self;
}

- (BOOL)setPayloadToContentsOfURL:(id)a3 friendlyName:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  NSString *friendlyName;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_url, a3);
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v8, "copy");
    friendlyName = self->_friendlyName;
    self->_friendlyName = v9;

  }
  return 1;
}

- (BOOL)setPayloadToData:(id)a3
{
  NSData *v4;
  NSData *payload;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  payload = self->_payload;
  self->_payload = v4;

  return 1;
}

- (id)prepareMetaData
{
  NSMutableData *v3;
  NSMutableData *metaData;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSData *payload;
  uint64_t v10;
  UARPSuperBinaryAssetTLV *v11;
  void *v12;

  v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  metaData = self->_metaData;
  self->_metaData = v3;

  if (-[NSMutableArray count](self->_tlvs, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_tlvs, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "generateTLV:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableData appendData:](self->_metaData, "appendData:", v7);

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_tlvs, "count"));
  }
  if (self->_compression)
  {
    if (self->_url)
    {
      v8 = -[UARPSuperBinaryAssetPayload unpreparedDataLength](self, "unpreparedDataLength");
    }
    else
    {
      payload = self->_payload;
      if (!payload)
      {
        v10 = 0;
        goto LABEL_10;
      }
      v8 = -[NSData length](payload, "length");
    }
    v10 = v8;
LABEL_10:
    v11 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt32:", 3436347673, v10);
    -[UARPSuperBinaryAssetTLV generateTLV:](v11, "generateTLV:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableData appendData:](self->_metaData, "appendData:", v12);

  }
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", self->_metaData);
}

- (id)hashMetaData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", self->_metaData);
}

- (id)compressPayloadChunk:(id)a3 offset:(unsigned int)a4 error:(id *)a5
{
  return a3;
}

- (BOOL)compressPayloadURLToFileHandle:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableData *v7;
  NSMutableData *compressionHeaders;
  void *v9;
  uint64_t v10;
  uint64_t blockSize;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;

  v6 = a3;
  v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  compressionHeaders = self->_compressionHeaders;
  self->_compressionHeaders = v7;

  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", self->_url, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 0;
    blockSize = self->_blockSize;
    while (1)
    {
      objc_msgSend(v9, "uarpReadDataUpToLength:error:", blockSize, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12 || !objc_msgSend(v12, "length"))
      {

LABEL_9:
        objc_msgSend(v9, "uarpCloseAndReturnError:", a4);
        v16 = 1;
        goto LABEL_12;
      }
      v14 = objc_msgSend(v13, "length");
      -[UARPSuperBinaryAssetPayload compressPayloadChunk:offset:error:](self, "compressPayloadChunk:offset:error:", v13, v10, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "uarpWriteData:error:", v15, a4) & 1) == 0)
        break;
      v10 = (v10 + v14);

      blockSize = self->_blockSize;
      if (v14 != blockSize)
        goto LABEL_9;
    }
    objc_msgSend(v9, "uarpCloseAndReturnError:", a4);

  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)prepareData
{
  NSMutableData *v3;
  NSMutableData *compressionHeaders;
  NSURL *v5;
  NSURL *compressedPayloadURL;
  id *p_compressedPayloadURL;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  id v28;
  BOOL v29;
  id v30;
  void *v31;
  NSData *payload;
  char v33;
  id v34;
  NSMutableData *metaData;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  compressionHeaders = self->_compressionHeaders;
  self->_compressionHeaders = v3;

  UARPUtilsBuildURLForTemporaryFile();
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  p_compressedPayloadURL = (id *)&self->_compressedPayloadURL;
  compressedPayloadURL = self->_compressedPayloadURL;
  self->_compressedPayloadURL = v5;

  if (!self->_compressedPayloadURL)
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      -[UARPSuperBinaryAssetPayload prepareData].cold.6(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v46 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (v16)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = self->_tlvs;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v43;
LABEL_7:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v18);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v22), "type") == 3166200583)
          break;
        if (v20 == ++v22)
        {
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (v20)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfURL:", self->_url);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_21;
      v41 = v17;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 0, &v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v41;

      if (!v24
        || (v40 = 0,
            v26 = objc_msgSend(v16, "uarpWriteData:error:", v24, &v40),
            v27 = v40,
            v25,
            v25 = v27,
            (v26 & 1) == 0))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[UARPSuperBinaryAssetPayload prepareData].cold.5();
        v28 = *p_compressedPayloadURL;
        *p_compressedPayloadURL = 0;

      }
      goto LABEL_38;
    }
LABEL_13:

LABEL_21:
    if (self->_url)
    {
      v39 = v17;
      v29 = -[UARPSuperBinaryAssetPayload compressPayloadURLToFileHandle:error:](self, "compressPayloadURLToFileHandle:error:", v16, &v39);
      v25 = v39;

      if (!v29)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[UARPSuperBinaryAssetPayload prepareData].cold.4();
LABEL_32:
        v34 = *p_compressedPayloadURL;
        *p_compressedPayloadURL = 0;

      }
    }
    else
    {
      payload = self->_payload;
      if (!payload)
      {
        metaData = self->_metaData;
        if ((!metaData || !-[NSMutableData length](metaData, "length"))
          && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[UARPSuperBinaryAssetPayload prepareData].cold.2();
        }
        v25 = v17;
        goto LABEL_38;
      }
      v38 = 0;
      v33 = objc_msgSend(v16, "uarpWriteData:error:", payload, &v38);
      v25 = v38;

      if ((v33 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[UARPSuperBinaryAssetPayload prepareData].cold.3();
        goto LABEL_32;
      }
    }
LABEL_38:
    v37 = 0;
    objc_msgSend(v16, "uarpCloseAndReturnError:", &v37);
    v17 = v37;

    v31 = (void *)objc_msgSend(*p_compressedPayloadURL, "copy");
    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[UARPSuperBinaryAssetPayload prepareData].cold.1();
  v30 = *p_compressedPayloadURL;
  *p_compressedPayloadURL = 0;

  v31 = 0;
LABEL_39:

  return v31;
}

- (unint64_t)unpreparedDataLength
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  if (!self->_url)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_url, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "fileSize");
  return v6;
}

- (unint64_t)preparedDataLength
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  if (!self->_compressedPayloadURL)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_compressedPayloadURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "fileSize");
  return v6;
}

- (unint64_t)preparePackedTag
{
  char *v3;

  v3 = -[NSString UTF8String](self->_tag, "UTF8String");
  if (-[NSString length](self->_tag, "length") == 4)
    return uarpPayloadTagPack((unsigned int *)v3);
  else
    return 0;
}

- (BOOL)prepareUarpVersion:(UARPVersion *)a3
{
  a3->major = -[UARPAssetVersion majorVersion](self->_assetVersion, "majorVersion");
  a3->minor = -[UARPAssetVersion minorVersion](self->_assetVersion, "minorVersion");
  a3->release = -[UARPAssetVersion releaseVersion](self->_assetVersion, "releaseVersion");
  a3->build = -[UARPAssetVersion buildVersion](self->_assetVersion, "buildVersion");
  return 1;
}

- (BOOL)appendPayloadToFile:(id)a3 bytesWritten:(unint64_t *)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)appendCompressedPayloadToFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t blockSize;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", self->_compressedPayloadURL, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    blockSize = self->_blockSize;
    while (1)
    {
      objc_msgSend(v7, "uarpReadDataUpToLength:error:", blockSize, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");
      if ((objc_msgSend(v6, "uarpWriteData:error:", v9, a4) & 1) == 0)
        break;

      blockSize = self->_blockSize;
      if (v10 != blockSize)
      {
        objc_msgSend(v7, "uarpCloseAndReturnError:", a4);
        v11 = 1;
        goto LABEL_12;
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UARPSuperBinaryAssetPayload appendCompressedPayloadToFile:error:].cold.2();
    objc_msgSend(v7, "uarpCloseAndReturnError:", a4);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAssetPayload appendCompressedPayloadToFile:error:].cold.1();
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (id)hashPayloadWithAlgorithm:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  CC_SHA512_CTX *p_c;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t blockSize;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CC_SHA512_CTX c;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  unsigned __int8 md[64];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!self->_url)
  {
LABEL_14:
    v7 = 0;
    return v7;
  }
  v5 = *(_QWORD *)&a3;
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  memset(&c, 0, sizeof(c));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (a3 == 1)
  {
    p_c = (CC_SHA512_CTX *)&v29;
    v9 = 32;
  }
  else if (a3 == 3)
  {
    p_c = (CC_SHA512_CTX *)&v15;
    v9 = 64;
  }
  else
  {
    v7 = 0;
    if (a3 != 2)
      return v7;
    p_c = &c;
    v9 = 48;
  }
  uarpPlatformDarwinHashInit(*(uint64_t *)&a3, p_c);
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", self->_url, a4, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, c.count[0], c.count[1],
    c.hash[0],
    c.hash[1],
    c.hash[2],
    c.hash[3],
    c.hash[4],
    c.hash[5],
    c.hash[6],
    c.hash[7],
    c.wbuf[0],
    c.wbuf[1],
    c.wbuf[2],
    c.wbuf[3],
    c.wbuf[4],
    c.wbuf[5],
    c.wbuf[6],
    c.wbuf[7],
    c.wbuf[8],
    c.wbuf[9],
    c.wbuf[10],
    c.wbuf[11],
    c.wbuf[12],
    c.wbuf[13],
    c.wbuf[14],
    c.wbuf[15],
    v29,
    v30,
    v31,
    (_QWORD)v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = v7;
    while (1)
    {
      objc_msgSend(v10, "uarpReadDataUpToLength:error:", self->_blockSize, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {

        goto LABEL_14;
      }
      v12 = objc_retainAutorelease(v11);
      uarpPlatformDarwinHashUpdate(v5, p_c, (void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
      blockSize = self->_blockSize;
      if (objc_msgSend(v12, "length") < blockSize)
        break;

    }
    objc_msgSend(v10, "uarpCloseAndReturnError:", a4);

    uarpPlatformDarwinHashFinal(v5, p_c, md, v9);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)hashMetaDataWithAlgorithm:(int)a3 error:(id *)a4
{
  uint64_t v4;
  void *v6;
  CC_SHA512_CTX *p_c;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CC_SHA512_CTX c;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  unsigned __int8 md[64];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!self->_url)
    return 0;
  v4 = *(_QWORD *)&a3;
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  memset(&c, 0, sizeof(c));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  if (a3 == 1)
  {
    p_c = (CC_SHA512_CTX *)&v24;
    v8 = 32;
    goto LABEL_9;
  }
  if (a3 == 3)
  {
    p_c = (CC_SHA512_CTX *)&v10;
    v8 = 64;
    goto LABEL_9;
  }
  v6 = 0;
  if (a3 == 2)
  {
    p_c = &c;
    v8 = 48;
LABEL_9:
    uarpPlatformDarwinHashInit(*(uint64_t *)&a3, p_c);
    uarpPlatformDarwinHashUpdate(v4, p_c, (void *)-[NSMutableData bytes](self->_metaData, "bytes", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, c.count[0],
                c.count[1],
                c.hash[0],
                c.hash[1],
                c.hash[2],
                c.hash[3],
                c.hash[4],
                c.hash[5],
                c.hash[6],
                c.hash[7],
                c.wbuf[0],
                c.wbuf[1],
                c.wbuf[2],
                c.wbuf[3],
                c.wbuf[4],
                c.wbuf[5],
                c.wbuf[6],
                c.wbuf[7],
                c.wbuf[8],
                c.wbuf[9],
                c.wbuf[10],
                c.wbuf[11],
                c.wbuf[12],
                c.wbuf[13],
                c.wbuf[14],
                c.wbuf[15],
                v24,
                v25,
                v26,
                v27,
                (_QWORD)v28),
      -[NSMutableData length](self->_metaData, "length"));
    uarpPlatformDarwinHashFinal(v4, p_c, md, v8);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)processVersionString:(id)a3
{
  void *v4;
  void *v5;
  UARPAssetVersion *v6;
  UARPAssetVersion *assetVersion;
  id v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "valueAsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithContentsOfURL:encoding:error:", v5, 4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[UARPAssetVersion initWithVersionString:]([UARPAssetVersion alloc], "initWithVersionString:", v8);
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;

}

- (void)processBVERVersionString:(id)a3
{
  void *v4;
  void *v5;
  UARPAssetVersion *v6;
  UARPAssetVersion *assetVersion;
  id v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "valueAsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithContentsOfURL:encoding:error:", v5, 4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[UARPAssetVersion initWithBVERString:]([UARPAssetVersion alloc], "initWithBVERString:", v8);
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;

}

- (UARPSuperBinaryAssetPayload)initWithDictionary:(id)a3
{
  id v4;
  UARPSuperBinaryAssetPayload *v5;
  uint64_t v6;
  NSDictionary *dict;

  v4 = a3;
  v5 = -[UARPSuperBinaryAssetPayload init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)expandDictionaryWithPayloadsFolder:(id)a3 metaDataTable:(id)a4 error:(id *)a5
{
  id v8;
  NSDictionary *dict;
  id v10;
  void *v11;
  NSString *v12;
  NSString *tag;
  void *v14;
  void *v15;
  NSURL *v16;
  NSURL *url;
  uint64_t v18;
  NSString *v19;
  NSString *friendlyName;
  BOOL v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = a3;
  dict = self->_dict;
  v10 = a4;
  -[NSDictionary objectForKey:](dict, "objectForKey:", CFSTR("Payload 4CC"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)objc_msgSend(v11, "copy");
  tag = self->_tag;
  self->_tag = v12;

  -[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("Payload Filepath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:relativeToURL:", v15, v8);
    v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v16;

  }
  -[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("Payload Long Name"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (NSString *)objc_msgSend((id)v18, "copy");
  friendlyName = self->_friendlyName;
  self->_friendlyName = v19;

  LOBYTE(v18) = -[UARPSuperBinaryAssetPayload parseFromPlistPayloadMetaDataTLVs:payloadsURL:error:](self, "parseFromPlistPayloadMetaDataTLVs:payloadsURL:error:", v10, v8, a5);
  if ((v18 & 1) == 0)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      -[UARPSuperBinaryAssetPayload expandDictionaryWithPayloadsFolder:metaDataTable:error:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_9;
  }
  if (!self->_assetVersion
    && !-[UARPSuperBinaryAssetPayload parseFromPlistVersion:](self, "parseFromPlistVersion:", a5))
  {
    v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v31)
      -[UARPSuperBinaryAssetPayload expandDictionaryWithPayloadsFolder:metaDataTable:error:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);
LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  v21 = 1;
LABEL_10:

  return v21;
}

- (BOOL)parseFromPlistVersion:(id *)a3
{
  void *v4;
  UARPAssetVersion *v5;
  UARPAssetVersion *assetVersion;
  BOOL v7;
  UARPVersion v9;

  v9 = (UARPVersion)0;
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("Payload Version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && +[UARPSuperBinaryAsset versionFromString:version:](UARPSuperBinaryAsset, "versionFromString:version:", v4, &v9))
  {
    self->_uarpVersion = v9;
    v5 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", self->_uarpVersion.major, self->_uarpVersion.minor, self->_uarpVersion.release, self->_uarpVersion.build);
    assetVersion = self->_assetVersion;
    self->_assetVersion = v5;

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)parseFromPlistPayloadMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  UARPSuperBinaryAssetPayload *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("Payload MetaData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__UARPSuperBinaryAssetPayload_parseFromPlistPayloadMetaDataTLVs_payloadsURL_error___block_invoke;
  v14[3] = &unk_24CEA3988;
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v17 = self;
  v18 = &v19;
  v16 = v12;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
  *a5 = objc_retainAutorelease((id)v20[5]);

  _Block_object_dispose(&v19, 8);
  return 1;
}

void __83__UARPSuperBinaryAssetPayload_parseFromPlistPayloadMetaDataTLVs_payloadsURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id obj;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v4, "tlvArrayWithKey:keyValue:payloadsURL:error:", a2, a3, v5, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v6, obj);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 48), "addMetaDataTLV:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (BOOL)expandPayloadToURL:(id)a3 superbinary:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 error:(id *)a7
{
  return -[UARPSuperBinaryAssetPayload expandPayloadToURL:payloadFilename:superbinary:offset:length:error:](self, "expandPayloadToURL:payloadFilename:superbinary:offset:length:error:", a3, 0, a4, a5, a6, a7);
}

- (BOOL)expandPayloadToURL:(id)a3 payloadFilename:(id)a4 superbinary:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 error:(id *)a8
{
  id v14;
  NSString *v15;
  id v16;
  id v17;
  NSString *tag;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  NSObject *log;
  unint64_t v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  unsigned int v43;
  NSObject *v44;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  UARPSuperBinaryAssetPayload *v68;
  unint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  unint64_t v76;
  __int16 v77;
  unint64_t v78;
  __int16 v79;
  unint64_t v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = (NSString *)a4;
  v16 = a5;
  v17 = objc_alloc(MEMORY[0x24BDBCF48]);
  if (v15)
    tag = v15;
  else
    tag = self->_tag;
  v19 = (void *)objc_msgSend(v17, "initFileURLWithPath:relativeToURL:", tag, v14);
  objc_msgSend(v19, "URLByDeletingLastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20
    && (v69 = a6,
        v70 = a7,
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, a8),
        v21,
        v22)
    && objc_msgSend(v16, "uarpSeekToOffset:error:", v69, a8))
  {
    v67 = v16;
    v68 = self;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v23 = self->_tlvs;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v72;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v72 != v26)
            objc_enumerationMutation(v23);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "type") == 3166200583)
          {

            v16 = v67;
            objc_msgSend(v67, "uarpReadDataUpToLength:error:", v70, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)MEMORY[0x24BDBCF20];
            v47 = objc_opt_class();
            v48 = objc_opt_class();
            v49 = objc_opt_class();
            objc_msgSend(v46, "setWithObjects:", v47, v48, v49, objc_opt_class(), 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v34, v30, 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "writeToURL:error:", v19, 0);

            v59 = 1;
            goto LABEL_36;
          }
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
        if (v25)
          continue;
        break;
      }
    }

    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = objc_retainAutorelease(v19);
    objc_msgSend(v28, "stringWithUTF8String:", objc_msgSend(v29, "fileSystemRepresentation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "createFileAtPath:contents:attributes:", v30, 0, 0);

    if ((v32 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v29, a8);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      if (v33)
      {
        v65 = (void *)v33;
        log = self->_log;
        v16 = v67;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v76 = v70;
          _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Decomposing Payload of length <%lu>", buf, 0xCu);
        }
        v64 = v30;
        v36 = v70;
        if (v70)
        {
          v37 = 0;
          v66 = 0;
          v38 = 0;
          while (1)
          {
            if (v36 - v37 >= 0x1000)
              v39 = 4096;
            else
              v39 = v36 - v37;
            objc_msgSend(v67, "uarpReadDataUpToLength:error:", v39, a8);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v40;
            if (!v40 || !objc_msgSend(v40, "length"))
            {
              v42 = v68->_log;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218496;
                v76 = v70;
                v77 = 2048;
                v78 = v69;
                v79 = 2048;
                v80 = v37;
                _os_log_error_impl(&dword_212D08000, v42, OS_LOG_TYPE_ERROR, "Could not read payload data; payload length is <%lu>, Payload Offset is <%lu>, Bytes Read is <%lu>",
                  buf,
                  0x20u);
              }
            }
            v38 += v39;
            v43 = objc_msgSend(v41, "length");
            if ((objc_msgSend(v65, "uarpWriteData:error:", v41, a8) & 1) == 0)
              break;
            v66 += objc_msgSend(v41, "length");
            v44 = v68->_log;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v76 = v66;
              _os_log_impl(&dword_212D08000, v44, OS_LOG_TYPE_INFO, "Bytes Written <%lu>", buf, 0xCu);
            }
            v37 += v43;

            v36 = v70;
            if (v37 >= v70)
            {
              v59 = 1;
              goto LABEL_44;
            }
          }
          v51 = v68->_log;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            -[UARPSuperBinaryAssetPayload expandPayloadToURL:payloadFilename:superbinary:offset:length:error:].cold.1(v51, v52, v53, v54, v55, v56, v57, v58);

          v59 = 0;
LABEL_44:
          v16 = v67;
        }
        else
        {
          v38 = 0;
          v59 = 1;
        }
        objc_msgSend(v65, "uarpCloseAndReturnError:", 0);
        v60 = v68->_log;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = 0;
          _os_log_impl(&dword_212D08000, v60, OS_LOG_TYPE_INFO, "Total Headers <%u>\n", buf, 8u);
        }
        v61 = v68->_log;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = 0;
          _os_log_impl(&dword_212D08000, v61, OS_LOG_TYPE_INFO, "Total Header Bytes <%u>\n", buf, 8u);
        }
        v62 = v68->_log;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = 0;
          _os_log_impl(&dword_212D08000, v62, OS_LOG_TYPE_INFO, "Total Compressed Bytes <%u>\n", buf, 8u);
        }
        v63 = v68->_log;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = v38;
          _os_log_impl(&dword_212D08000, v63, OS_LOG_TYPE_INFO, "Total Uncompressed Bytes <%u>\n", buf, 8u);
        }
        v30 = v64;
        v34 = v65;
      }
      else
      {
        v59 = 0;
        v16 = v67;
      }
LABEL_36:

    }
    else
    {
      v59 = 0;
      v16 = v67;
    }

  }
  else
  {
    v59 = 0;
  }

  return v59;
}

- (id)description
{
  id v3;
  uint64_t i;
  void *v5;
  id v6;
  unsigned __int16 *v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSMutableArray *obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31[4];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("--------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Payload Header\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("---------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Header Length   - %u\n"), self->_payloadHeader.payloadHeaderLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("Tag             - "));
  uarpPayloadTagUnpack(self->_payloadHeader.payloadTag, v31);
  objc_msgSend(v3, "appendFormat:", CFSTR("%c%c%c%c\n"), v31[0], v31[1], v31[2], v31[3]);
  objc_msgSend(v3, "appendFormat:", CFSTR("Version         - <"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%u."), self->_payloadHeader.payloadVersion.major);
  objc_msgSend(v3, "appendFormat:", CFSTR("%u."), self->_payloadHeader.payloadVersion.minor);
  objc_msgSend(v3, "appendFormat:", CFSTR("%u."), self->_payloadHeader.payloadVersion.release);
  objc_msgSend(v3, "appendFormat:", CFSTR("%u"), self->_payloadHeader.payloadVersion.build);
  objc_msgSend(v3, "appendFormat:", CFSTR(">\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("MetaData Offset - %u\n"), self->_payloadHeader.payloadMetadataOffset);
  objc_msgSend(v3, "appendFormat:", CFSTR("MetaData Length - %u\n"), self->_payloadHeader.payloadMetadataLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("Payload Offset  - %u\n"), self->_payloadHeader.payloadOffset);
  objc_msgSend(v3, "appendFormat:", CFSTR("Payload Length  - %u\n"), self->_payloadHeader.payloadLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("---------------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Payload MetaData TLVs\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("---------------------\n"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_tlvs;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v5);
        if (objc_msgSend(v5, "type") == 3436347667)
        {
          objc_msgSend(v5, "valueAsData");
          v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v7 = (unsigned __int16 *)objc_msgSend(v6, "bytes");
          v8 = objc_msgSend(v6, "length");
          objc_msgSend(v3, "appendFormat:", CFSTR("<Compression Header>\n"));
          if (v8 >= 0xA)
          {
            do
            {
              v9 = uarpHtons(*v7);
              v10 = uarpHtonl(*(_DWORD *)(v7 + 1));
              v11 = uarpHtons(v7[3]);
              objc_msgSend(v3, "appendFormat:", CFSTR("    Algorithm <%u>, Actual Offset <%u>, Compressed Length <%u>, Uncompressed Length <%u>\n"), v9, v10, v11, uarpHtons(v7[4]));
              v8 -= 10;
              v7 += 5;
            }
            while (v8 > 9);
          }
          objc_msgSend(v3, "appendFormat:", CFSTR("</Compression Header>\n"));

        }
        if (objc_msgSend(v5, "type") == 2293403920 || objc_msgSend(v5, "type") == 2293403932)
        {
          objc_msgSend(v5, "valueAsData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV decomposeTLVs:](UARPSuperBinaryAssetTLV, "decomposeTLVs:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("<Nested TLVs>\n"));
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v24 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            }
            while (v16);
          }

          objc_msgSend(v3, "appendFormat:", CFSTR("</Nested TLVs>\n"));
        }
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v22);
  }

  return v3;
}

- (_NSRange)rangeMetadata
{
  NSUInteger payloadMetadataLength;
  NSUInteger payloadMetadataOffset;
  _NSRange result;

  payloadMetadataLength = self->_payloadHeader.payloadMetadataLength;
  payloadMetadataOffset = self->_payloadHeader.payloadMetadataOffset;
  result.length = payloadMetadataLength;
  result.location = payloadMetadataOffset;
  return result;
}

- (_NSRange)rangePayload
{
  NSUInteger payloadLength;
  NSUInteger payloadOffset;
  _NSRange result;

  payloadLength = self->_payloadHeader.payloadLength;
  payloadOffset = self->_payloadHeader.payloadOffset;
  result.length = payloadLength;
  result.location = payloadOffset;
  return result;
}

- (void)setSuperBinaryURL:(id)a3
{
  objc_storeStrong((id *)&self->_superBinaryURL, a3);
}

- (BOOL)needsCompression
{
  return self->_compression != 0;
}

- (BOOL)allowCompressionHeaders
{
  return self->_allowCompressionHeaders;
}

- (NSData)compressionHeaders
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", self->_compressionHeaders);
}

- (unint64_t)compressionHeaderIndex
{
  return self->_compressionHeaderIndex;
}

- (BOOL)writePayloadData:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSURL *url;
  void *v10;
  char v11;

  v8 = a3;
  if (self->_isWritable && (url = self->_url) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForUpdatingURL:error:", url, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "uarpSeekToOffset:error:", a4, a5)
      && objc_msgSend(v10, "uarpWriteData:error:", v8, a5))
    {
      v11 = objc_msgSend(v10, "uarpCloseAndReturnError:", a5);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  char v5;
  NSData *payload;
  BOOL v8;

  if (self->_url)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_url, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    return v5;
  }
  payload = self->_payload;
  if (payload)
  {
    v8 = -[NSData length](payload, "length") == 0;
  }
  else
  {
    if (self->_tlvs)
      return 1;
    v8 = self->_composeTLVs == 0;
  }
  return !v8;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_compressedPayloadURL, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_compressionHeaders, 0);
  objc_storeStrong((id *)&self->_dict, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_superBinaryURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_composeTLVs, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_payloadTag, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)addMetaDataTLV:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], a3, "attempting to add a nil tlv to payload %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)prepareData
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "UARPUtilsBuildURLForTemporaryFile() returned nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)appendCompressedPayloadToFile:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Could not open file handle for reading %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)appendCompressedPayloadToFile:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Could not write data to %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)expandDictionaryWithPayloadsFolder:(uint64_t)a3 metaDataTable:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Failed to parse superbinary payload version", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandDictionaryWithPayloadsFolder:(uint64_t)a3 metaDataTable:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Failed to parse superbinary payload metadata tlvs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandPayloadToURL:(uint64_t)a3 payloadFilename:(uint64_t)a4 superbinary:(uint64_t)a5 offset:(uint64_t)a6 length:(uint64_t)a7 error:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Error writing decomposed payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
