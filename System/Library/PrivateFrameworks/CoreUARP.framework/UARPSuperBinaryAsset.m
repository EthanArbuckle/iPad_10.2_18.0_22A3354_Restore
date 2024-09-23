@implementation UARPSuperBinaryAsset

- (UARPSuperBinaryAsset)init
{
  return -[UARPSuperBinaryAsset initWithFormatVersion:majorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithFormatVersion:majorVersion:minorVersion:releaseVersion:buildVersion:", &unk_24CEC0FB0, &unk_24CEC0FC8, &unk_24CEC0FC8, &unk_24CEC0FC8, &unk_24CEC0FC8);
}

- (UARPSuperBinaryAsset)initWithFormatVersion:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  UARPAssetVersion *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  UARPAssetVersion *v20;
  uint64_t v21;
  UARPSuperBinaryAsset *v22;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = [UARPAssetVersion alloc];
  v16 = objc_msgSend(v13, "unsignedIntegerValue");
  v17 = objc_msgSend(v13, "unsignedIntegerValue");

  v18 = objc_msgSend(v12, "unsignedIntegerValue");
  v19 = objc_msgSend(v11, "unsignedIntegerValue");

  v20 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](v15, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", v16, v17, v18, v19);
  v21 = objc_msgSend(v14, "unsignedIntegerValue");

  v22 = -[UARPSuperBinaryAsset initWithFormatVersion:assetVersion:](self, "initWithFormatVersion:assetVersion:", v21, v20);
  return v22;
}

- (UARPSuperBinaryAsset)initWithFormatVersion:(unint64_t)a3 assetVersion:(id)a4
{
  id v7;
  UARPSuperBinaryAsset *v8;
  UARPSuperBinaryAsset *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UARPSuperBinaryAsset;
  v8 = -[UARPSuperBinaryAsset init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_formatVersion = a3;
    objc_storeStrong((id *)&v8->_assetVersion, a4);
  }

  return v9;
}

- (UARPSuperBinaryAsset)initWithPlist:(id)a3 metadataPlist:(id)a4
{
  id v6;
  id v7;
  UARPSuperBinaryAsset *v8;
  uint64_t v9;
  NSURL *plist;
  uint64_t v11;
  NSURL *plistMetaData;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UARPSuperBinaryAsset;
  v8 = -[UARPSuperBinaryAsset init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    plist = v8->_plist;
    v8->_plist = (NSURL *)v9;

    if (v7)
    {
      v11 = objc_msgSend(v7, "copy");
      plistMetaData = v8->_plistMetaData;
      v8->_plistMetaData = (NSURL *)v11;

    }
  }

  return v8;
}

- (UARPSuperBinaryAsset)initWithURL:(id)a3
{
  id v4;
  UARPSuperBinaryAsset *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPSuperBinaryAsset;
  v5 = -[UARPSuperBinaryAsset init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

  }
  return v5;
}

- (UARPSuperBinaryAsset)initWithURL:(id)a3 assetTag:(id)a4
{
  id v6;
  id v7;
  UARPSuperBinaryAsset *v8;
  uint64_t v9;
  NSURL *url;
  uint64_t v11;
  UARPAssetTag *assetTag;
  uint64_t v13;
  NSDate *timeCreated;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UARPSuperBinaryAsset;
  v8 = -[UARPSuperBinaryAsset init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    assetTag = v8->_assetTag;
    v8->_assetTag = (UARPAssetTag *)v11;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    timeCreated = v8->_timeCreated;
    v8->_timeCreated = (NSDate *)v13;

  }
  return v8;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_tlvs);
}

- (NSArray)payloads
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_payloads);
}

- (void)addMetaDataTLV:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *tlvs;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  if (v4)
  {
    if (!self->_tlvs)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      tlvs = self->_tlvs;
      self->_tlvs = v5;

    }
    if (objc_msgSend(v4, "type") == 3166200581)
    {
      -[UARPSuperBinaryAsset processVersionString:](self, "processVersionString:", v4);
    }
    else if (objc_msgSend(v4, "type") == 3166200582)
    {
      -[UARPSuperBinaryAsset processBVERVersionString:](self, "processBVERVersionString:", v4);
    }
    else
    {
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAsset addMetaDataTLV:].cold.1((uint64_t)self, v7, v8);
  }

}

- (void)addPayload:(id)a3
{
  id v4;
  NSMutableArray *payloads;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  if (v4)
  {
    payloads = self->_payloads;
    if (!payloads)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->_payloads;
      self->_payloads = v6;

      payloads = self->_payloads;
    }
    -[NSMutableArray addObject:](payloads, "addObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAsset addPayload:].cold.1((uint64_t)self, v8, v9);
  }

}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:](self, "writeToURL:payloadStartOffset:error:", a3, 0, a4);
}

- (BOOL)writeToURL:(id)a3 payloadStartOffset:(unint64_t)a4 error:(id *)a5
{
  id v6;
  void *v7;
  NSMutableArray **p_payloads;
  NSMutableArray *payloads;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  _BYTE *v18;
  void *v19;
  void *v20;
  char v21;
  id *v22;
  void *v23;
  unint64_t v24;
  _DWORD *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  int *v37;
  int v38;
  int v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  int *v61;
  int v62;
  int v63;
  void *v64;
  unint64_t v65;
  unsigned int *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  char v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  unsigned int *v84;
  void *v86;
  UARPSuperBinaryAsset *v88;
  void *v89;
  void *v90;
  unsigned int v91[2];
  __int128 v92;
  __int128 v93;
  int v94;
  uint8_t v95[4];
  _QWORD v96[3];

  *(_QWORD *)((char *)&v96[1] + 4) = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_plist)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfURL:");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("SuperBinary Payloads"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v89 = 0;
    v90 = 0;
  }
  v7 = (void *)objc_opt_new();
  v88 = self;
  payloads = self->_payloads;
  p_payloads = &self->_payloads;
  if (-[NSMutableArray count](payloads, "count"))
  {
    v10 = 0;
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDBD1C8];
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](*p_payloads, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isValid");

      if ((v14 & 1) != 0)
      {
        -[NSMutableArray objectAtIndexedSubscript:](*p_payloads, "objectAtIndexedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.12(v95, (id *)p_payloads, v10, v96);
        objc_msgSend(v90, "objectAtIndexedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("Payload Missing"));
      }

      ++v10;
    }
    while (v10 < -[NSMutableArray count](*p_payloads, "count"));
  }
  objc_storeStrong((id *)p_payloads, v7);
  v16 = v6;
  if (v6)
  {
    v17 = objc_retainAutorelease(v6);
    v18 = (_BYTE *)objc_msgSend(v17, "fileSystemRepresentation");
    if (v18 && *v18)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "createFileAtPath:contents:attributes:", v19, 0, 0);

      if ((v21 & 1) == 0)
      {
        v57 = v89;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.11((uint64_t)v19, v58, v59);
        v56 = 0;
        goto LABEL_78;
      }
      v22 = a5;
      objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v17, a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.3();
        v56 = 0;
        v57 = v89;
        goto LABEL_77;
      }
      v81 = v16;
      v82 = v19;
      v94 = 0;
      v93 = 0u;
      v92 = 0u;
      v91[0] = v88->_formatVersion;
      v91[1] = 44;
      DWORD1(v92) = -[UARPAssetVersion majorVersion](v88->_assetVersion, "majorVersion");
      DWORD2(v92) = -[UARPAssetVersion minorVersion](v88->_assetVersion, "minorVersion");
      HIDWORD(v92) = -[UARPAssetVersion releaseVersion](v88->_assetVersion, "releaseVersion");
      LODWORD(v93) = -[UARPAssetVersion buildVersion](v88->_assetVersion, "buildVersion");
      LODWORD(v92) = 44;
      v79 = 40 * -[NSMutableArray count](v88->_payloads, "count");
      v84 = (unsigned int *)malloc_type_calloc(-[NSMutableArray count](v88->_payloads, "count"), 0x28uLL, 0x10000400A747E1EuLL);
      if (-[NSMutableArray count](v88->_payloads, "count"))
      {
        v24 = 0;
        v25 = v84 + 7;
        v83 = v7;
        do
        {
          -[NSMutableArray objectAtIndex:](*p_payloads, "objectAtIndex:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(v25 - 7) = 40;
          *(v25 - 6) = objc_msgSend(v26, "preparePackedTag");
          objc_msgSend(v26, "prepareUarpVersion:", v25 - 5);
          objc_msgSend(v26, "prepareMetaData");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *v25 = objc_msgSend(v27, "length");
          v28 = (id)objc_msgSend(v26, "prepareData");
          v25[2] = objc_msgSend(v26, "preparedDataLength");
          objc_msgSend(v26, "hashMetaData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *v25 = objc_msgSend(v29, "length");
          if (objc_msgSend(v26, "needsCompression")
            && objc_msgSend(v26, "allowCompressionHeaders"))
          {
            if (v88->_formatVersion <= 2)
            {
              -[NSMutableArray objectAtIndex:](*p_payloads, "objectAtIndex:", objc_msgSend(v26, "compressionHeaderIndex"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "compressionHeaders");
              v31 = v22;
              v32 = v23;
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setPayloadToData:", v33);

              v23 = v32;
              v22 = v31;
              v7 = v83;

            }
            objc_msgSend(v26, "metaData");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *v25 = objc_msgSend(v34, "length");

          }
          ++v24;
          v25 += 10;
        }
        while (v24 < -[NSMutableArray count](*p_payloads, "count"));
      }
      HIDWORD(v93) = v92;
      v94 = v79;
      DWORD1(v93) = v92 + v79;
      -[UARPSuperBinaryAsset prepareMetaData](v88, "prepareMetaData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      DWORD2(v93) = objc_msgSend(v35, "length");
      LODWORD(v92) = v92 + v79 + DWORD2(v93);
      if (-[NSMutableArray count](v88->_payloads, "count"))
      {
        v36 = 0;
        v37 = (int *)(v84 + 7);
        do
        {
          v38 = v92;
          *(v37 - 1) = v92;
          v39 = *v37;
          v37 += 10;
          LODWORD(v92) = v39 + v38;
          ++v36;
        }
        while (v36 < -[NSMutableArray count](*p_payloads, "count"));
      }
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a4 - v92);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v92) = v92 + objc_msgSend(v86, "length");
      }
      else
      {
        v86 = 0;
      }
      v16 = v81;
      if (-[NSMutableArray count](*p_payloads, "count"))
      {
        v60 = 0;
        v61 = (int *)(v84 + 9);
        do
        {
          v62 = v92;
          *(v61 - 1) = v92;
          v63 = *v61;
          v61 += 10;
          LODWORD(v92) = v63 + v62;
          ++v60;
        }
        while (v60 < -[NSMutableArray count](*p_payloads, "count"));
      }
      uarpSuperBinaryHeaderEndianSwap(v91, v91);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v91, 44);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "uarpWriteData:error:", v64, v22))
      {
        v80 = v35;
        if (-[NSMutableArray count](*p_payloads, "count"))
        {
          v65 = 0;
          v66 = v84;
          while (1)
          {
            uarpPayloadHeaderEndianSwap(v66, v66);
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v66, 40);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v23, "uarpWriteData:error:", v67, v22) & 1) == 0)
              break;

            ++v65;
            v66 += 10;
            if (v65 >= -[NSMutableArray count](*p_payloads, "count"))
              goto LABEL_50;
          }
          free(v84);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.9();
          goto LABEL_74;
        }
LABEL_50:
        free(v84);
        if (!objc_msgSend(v23, "uarpWriteData:error:", v88->_metaData, v22))
        {
          v35 = v80;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.8();
          v56 = 0;
          v57 = v89;
          goto LABEL_75;
        }
        if (-[NSMutableArray count](*p_payloads, "count"))
        {
          v68 = 0;
          while (1)
          {
            -[NSMutableArray objectAtIndex:](*p_payloads, "objectAtIndex:", v68);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "metaData");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v23, "uarpWriteData:error:", v69, v22);

            if ((v70 & 1) == 0)
              break;

            if (++v68 >= (unint64_t)-[NSMutableArray count](*p_payloads, "count"))
              goto LABEL_55;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.7();
LABEL_74:

          v56 = 0;
          v57 = v89;
          v35 = v80;
LABEL_75:
          v71 = v86;
          goto LABEL_76;
        }
LABEL_55:
        v35 = v80;
        v71 = v86;
        if (v86 && (objc_msgSend(v23, "uarpWriteData:error:", v86, v22) & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.6();
        }
        else
        {
          if (!-[NSMutableArray count](*p_payloads, "count"))
          {
LABEL_61:
            v57 = v89;
            if (v89)
            {
              if (v88->_plistMetaData)
              {
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfURL:");
                v74 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v74 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                -[UARPSuperBinaryMetaDataTable formatVersion](v88->_metaDataTable, "formatVersion");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "setObject:forKeyedSubscript:", v76, CFSTR("MetaData Format Version"));

                -[UARPSuperBinaryMetaDataTable values](v88->_metaDataTable, "values");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "setObject:forKeyedSubscript:", v77, CFSTR("MetaData Values"));

              }
              if (v74)
                objc_msgSend(v89, "setObject:forKey:", v74, CFSTR("MetaData plist"));
              objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v89, 0, a5);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v23, "uarpWriteData:error:", v78, a5))
              {
                v71 = v86;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.4();

                v56 = 0;
                v35 = v80;
                goto LABEL_76;
              }

              v35 = v80;
              v71 = v86;
            }
            objc_msgSend(v23, "uarpCloseAndReturnError:", a5);
            v56 = 1;
LABEL_76:

            v19 = v82;
LABEL_77:

LABEL_78:
            goto LABEL_79;
          }
          v72 = 0;
          while (1)
          {
            -[NSMutableArray objectAtIndex:](*p_payloads, "objectAtIndex:", v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v73, "appendCompressedPayloadToFile:error:", v23, v22) & 1) == 0)
              break;

            if (++v72 >= (unint64_t)-[NSMutableArray count](*p_payloads, "count"))
              goto LABEL_61;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.5();

        }
      }
      else
      {
        free(v84);
        v71 = v86;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.10();
      }
      v56 = 0;
      v57 = v89;
      goto LABEL_76;
    }
    v40 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v40)
      -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.2(v40, v41, v42, v43, v44, v45, v46, v47);
  }
  else
  {
    v48 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v48)
      -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1(v48, v49, v50, v51, v52, v53, v54, v55);
  }
  v56 = 0;
  v57 = v89;
LABEL_79:

  return v56;
}

+ (BOOL)versionFromString:(id)a3 version:(UARPVersion *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 4)
  {
    a4->build = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a4->build = objc_msgSend(v6, "integerValue");

  }
  if ((unint64_t)objc_msgSend(v5, "count") < 3)
  {
    a4->release = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a4->release = objc_msgSend(v7, "integerValue");

  }
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    a4->minor = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a4->minor = objc_msgSend(v8, "integerValue");

  }
  v9 = objc_msgSend(v5, "count");
  if (v9)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a4->major = objc_msgSend(v10, "integerValue");

  }
  else
  {
    a4->major = 0;
  }

  return v9 != 0;
}

+ (BOOL)versionFromBNIString:(id)a3 version:(UARPVersion *)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 3)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%d.%d.%@"), v9, HIDWORD(v7), v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = +[UARPSuperBinaryAsset versionFromString:version:](UARPSuperBinaryAsset, "versionFromString:version:", v11, a4);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)expandPlistWithPayloadsFolder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfURL:", self->_plist);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UARPSuperBinaryAsset parseFromPlistFormatVersion:error:](self, "parseFromPlistFormatVersion:error:", v7, a4)
    && -[UARPSuperBinaryAsset parseFromPlistSuperBinaryMetaDataValuesTable:](self, "parseFromPlistSuperBinaryMetaDataValuesTable:", a4)&& -[UARPSuperBinaryAsset parseFromPlistSuperBinaryMetaDataTLVs:payloadsURL:error:](self, "parseFromPlistSuperBinaryMetaDataTLVs:payloadsURL:error:", v7, v6, a4)&& (self->_assetVersion|| -[UARPSuperBinaryAsset parseFromPlistSuperBinaryVersion:error:](self, "parseFromPlistSuperBinaryVersion:error:", v7, a4))&& -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:](self, "parseFromPlistSuperBinaryPayloads:payloadsURL:error:", v7,
         v6,
         a4);

  return v8;
}

- (BOOL)parseFromPlistFormatVersion:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SuperBinary Format Version"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    self->_formatVersion = objc_msgSend(v5, "unsignedIntegerValue");

  return v6 != 0;
}

- (BOOL)parseFromPlistSuperBinaryVersion:(id)a3 error:(id *)a4
{
  void *v5;
  _BOOL4 v6;
  UARPAssetVersion *v7;
  UARPAssetVersion *v8;
  UARPAssetVersion *assetVersion;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SuperBinary Firmware Version"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = 0;
    v12 = 0;
    v6 = +[UARPSuperBinaryAsset versionFromString:version:](UARPSuperBinaryAsset, "versionFromString:version:", v5, &v11);
    if (v6)
    {
      v7 = [UARPAssetVersion alloc];
      v8 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](v7, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", v11, HIDWORD(v11), v12, HIDWORD(v12));
      assetVersion = self->_assetVersion;
      self->_assetVersion = v8;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)parseFromPlistSuperBinaryMetaDataValuesTable:(id *)a3
{
  NSURL *plistMetaData;
  UARPSuperBinaryMetaDataTable *v6;
  UARPSuperBinaryMetaDataTable *v7;
  UARPSuperBinaryMetaDataTable *v8;
  UARPSuperBinaryMetaDataTable *metaDataTable;
  void *v11;
  UARPSuperBinaryMetaDataTable *v12;
  UARPSuperBinaryMetaDataTable *v13;

  plistMetaData = self->_plistMetaData;
  v6 = [UARPSuperBinaryMetaDataTable alloc];
  v7 = v6;
  if (plistMetaData)
  {
    v8 = -[UARPSuperBinaryMetaDataTable initWithPlist:](v6, "initWithPlist:", self->_plistMetaData);
    metaDataTable = self->_metaDataTable;
    self->_metaDataTable = v8;

    return -[UARPSuperBinaryMetaDataTable expandPlist:](self->_metaDataTable, "expandPlist:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_formatVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UARPSuperBinaryMetaDataTable initAppleSpecificWithFormatVersion:](v7, "initAppleSpecificWithFormatVersion:", v11);
    v13 = self->_metaDataTable;
    self->_metaDataTable = v12;

    return 1;
  }
}

- (BOOL)parseFromPlistSuperBinaryMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v9 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SuperBinary MetaData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__UARPSuperBinaryAsset_parseFromPlistSuperBinaryMetaDataTLVs_payloadsURL_error___block_invoke;
  v13[3] = &unk_24CEA3828;
  v13[4] = self;
  v11 = v9;
  v14 = v11;
  v15 = &v16;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);
  *a5 = objc_retainAutorelease((id)v17[5]);

  _Block_object_dispose(&v16, 8);
  return 1;
}

void __80__UARPSuperBinaryAsset_parseFromPlistSuperBinaryMetaDataTLVs_payloadsURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id obj;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  objc_msgSend(v7, "tlvArrayWithKey:keyValue:payloadsURL:error:", a2, a3, v6, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(a1 + 32), "addMetaDataTLV:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v12);
  }

  if (!v10 || !objc_msgSend(v10, "count"))
    *a4 = 1;

}

- (BOOL)parseFromPlistSuperBinaryPayloads:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  UARPSuperBinaryAssetPayload *v14;
  UARPSuperBinaryAssetPayload *v15;
  char v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  UARPSuperBinaryAssetPayload *v32;
  UARPSuperBinaryAssetTLV *v33;
  BOOL v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[4];
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SuperBinary Payloads"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v9);
        v14 = -[UARPSuperBinaryAssetPayload initWithDictionary:]([UARPSuperBinaryAssetPayload alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
        v15 = v14;
        if (!v14)
          goto LABEL_14;
        -[UARPSuperBinaryAssetPayload updateFormatVersion:](v14, "updateFormatVersion:", self->_formatVersion);
        -[UARPSuperBinaryAsset addPayload:](self, "addPayload:", v15);
        if (!-[UARPSuperBinaryAssetPayload expandDictionaryWithPayloadsFolder:metaDataTable:error:](v15, "expandDictionaryWithPayloadsFolder:metaDataTable:error:", v8, self->_metaDataTable, a5))
        {
          v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v17)
            -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_14:

          v16 = 0;
          goto LABEL_15;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      v16 = 1;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_15:
  v35 = v16;
  v36 = v9;
  v37 = v8;

  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v26 = self->_payloads;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        if (objc_msgSend(v31, "needsCompression") && self->_formatVersion <= 2)
        {
          v32 = -[UARPSuperBinaryAssetPayload initWithTag:majorVersion:minorVersion:releaseVersion:buildVersion:]([UARPSuperBinaryAssetPayload alloc], "initWithTag:majorVersion:minorVersion:releaseVersion:buildVersion:", CFSTR("CHDR"), &unk_24CEC0FC8, &unk_24CEC0FC8, 0, 0);
          if (v32)
          {
            v33 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt32:", 3436347663, objc_msgSend(v25, "count")+ -[NSMutableArray count](self->_payloads, "count"));
            objc_msgSend(v31, "addMetaDataTLV:", v33);
            objc_msgSend(v25, "addObject:", v32);

          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:].cold.1(v46, (uint64_t)self, &v47);
          }

        }
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v28);
  }

  -[NSMutableArray addObjectsFromArray:](self->_payloads, "addObjectsFromArray:", v25);
  return v35;
}

- (BOOL)expandHeadersAndTLVs:(id *)a3
{
  return -[UARPSuperBinaryAsset decomposeToURL:error:](self, "decomposeToURL:error:", 0, a3);
}

- (BOOL)decomposeToURL:(id)a3 error:(id *)a4
{
  id v6;
  NSURL *url;
  void *v8;
  id v9;
  void *v10;
  UARPAssetVersion *v11;
  UARPAssetVersion *assetVersion;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *tlvs;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  UARPSuperBinaryMetaDataTable *v26;
  UARPSuperBinaryMetaDataTable *metaDataTable;
  NSDictionary *v28;
  NSDictionary *plistDictionary;
  void *v30;
  _BOOL4 v31;
  NSMutableArray *v32;
  NSMutableArray *payloads;
  unsigned int payloadHeadersLength;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  UARPSuperBinaryAssetPayload *v51;
  UARPSuperBinaryAssetPayload *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSURL **p_url;
  id v97;
  void *v98;
  uint64_t v99;
  id *v100;
  int v101;
  int v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  uint8_t v111[4];
  uint64_t v112;
  uint8_t v113[4];
  uint64_t v114;
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  url = self->_url;
  p_url = &self->_url;
  v110 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", url, &v110);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v110;
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[UARPSuperBinaryAsset decomposeToURL:error:].cold.1((uint64_t)p_url, (uint64_t)v9, v75, v76, v77, v78, v79, v80);
      if (a4)
        goto LABEL_84;
    }
    else if (a4)
    {
LABEL_84:
      v74 = 0;
      *a4 = objc_retainAutorelease(v9);
      goto LABEL_87;
    }
    v74 = 0;
    goto LABEL_87;
  }
  objc_msgSend(v8, "uarpReadDataUpToLength:error:", 44, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getBytes:length:", &self->_superBinaryHeader, 44);
  uarpSuperBinaryHeaderEndianSwap(&self->_superBinaryHeader.superBinaryFormatVersion, &self->_superBinaryHeader.superBinaryFormatVersion);
  self->_formatVersion = self->_superBinaryHeader.superBinaryFormatVersion;
  v100 = a4;
  v11 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", self->_superBinaryHeader.superBinaryVersion.major, self->_superBinaryHeader.superBinaryVersion.minor, self->_superBinaryHeader.superBinaryVersion.release, self->_superBinaryHeader.superBinaryVersion.build);
  assetVersion = self->_assetVersion;
  self->_assetVersion = v11;

  if (self->_superBinaryHeader.superBinaryMetadataLength)
  {
    if (!objc_msgSend(v8, "uarpSeekToOffset:error:", self->_superBinaryHeader.superBinaryMetadataOffset, a4))
    {
      v74 = 0;
      goto LABEL_86;
    }
    objc_msgSend(v8, "uarpReadDataUpToLength:error:", self->_superBinaryHeader.superBinaryMetadataLength, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV decomposeTLVs:](UARPSuperBinaryAssetTLV, "decomposeTLVs:", v13);
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    tlvs = self->_tlvs;
    self->_tlvs = v14;

  }
  objc_msgSend(v8, "uarpSeekToOffset:error:", self->_superBinaryHeader.superBinaryLength, a4);
  v89 = v8;
  objc_msgSend(v8, "uarpReadDataToEndOfFileAndReturnError:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v21, v16, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("MetaData plist"));
  v87 = v9;
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v23 = v22;
    if (v6)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:relativeToURL:", CFSTR("MetaData.plist"), v6);
      v25 = objc_msgSend(v88, "writeToURL:error:", v24, v100);

      if (!v25)
      {
        v74 = 0;
        v22 = v23;
        v9 = v87;
        goto LABEL_81;
      }
    }
    v26 = -[UARPSuperBinaryMetaDataTable initWithDictionary:]([UARPSuperBinaryMetaDataTable alloc], "initWithDictionary:", v88);
    metaDataTable = self->_metaDataTable;
    self->_metaDataTable = v26;

    v22 = v23;
    v9 = v87;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v22);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    objc_msgSend(v86, "removeObjectForKey:", CFSTR("MetaData plist"));
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v86);
    v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    plistDictionary = self->_plistDictionary;
    self->_plistDictionary = v28;

    if (v6)
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:relativeToURL:", CFSTR("SuperBinary.plist"), v6);
      v31 = -[NSDictionary writeToURL:error:](self->_plistDictionary, "writeToURL:error:", v30, v100);

      if (!v31)
      {
        v74 = 0;
        goto LABEL_80;
      }
    }
  }
  v83 = v21;
  v84 = v16;
  v85 = v10;
  v97 = v6;
  v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  payloads = self->_payloads;
  self->_payloads = v32;

  payloadHeadersLength = self->_superBinaryHeader.payloadHeadersLength;
  v82 = v22;
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("SuperBinary Payloads"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v37 = v35;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v107 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("Payload Missing"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "BOOLValue"))
          objc_msgSend(v36, "removeObject:", v42);

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
    }
    while (v39);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v36);
  v44 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v44;
  v6 = v97;
  v8 = v89;
  v46 = v100;
  v98 = v45;
  if (payloadHeadersLength < 0x28)
  {
LABEL_78:
    v74 = objc_msgSend(v8, "uarpCloseAndReturnError:", v46);
    goto LABEL_79;
  }
  v47 = 0;
  v48 = 0;
  LODWORD(v49) = payloadHeadersLength / 0x28;
  if (payloadHeadersLength / 0x28 <= 1)
    v49 = 1;
  else
    v49 = v49;
  v99 = v49;
  while (1)
  {
    objc_msgSend(v8, "uarpSeekToOffset:error:", v47 + self->_superBinaryHeader.payloadHeadersOffset, v46);
    v105 = 0;
    v103 = 0u;
    v104 = 0u;
    objc_msgSend(v8, "uarpReadDataUpToLength:error:", 40, v46);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "getBytes:length:", &v103, 40);
    uarpPayloadHeaderEndianSwap((unsigned int *)&v103, &v103);
    v51 = -[UARPSuperBinaryAssetPayload initWithPayloadHeader:]([UARPSuperBinaryAssetPayload alloc], "initWithPayloadHeader:", &v103);
    if (!v51)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[UARPSuperBinaryAsset decomposeToURL:error:].cold.2(v113, (uint64_t)self, &v114);
      goto LABEL_77;
    }
    v52 = v51;
    v102 = 0;
    uarpTagStructUnpack32(DWORD1(v103), &v102);
    v101 = 1380206659;
    if (uarp4ccCompare((unsigned __int8 *)&v102, (unsigned __int8 *)&v101))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[UARPSuperBinaryAsset decomposeToURL:error:].cold.3(v111, (uint64_t)self, &v112);
      goto LABEL_76;
    }
    -[UARPSuperBinaryAssetPayload setSuperBinaryURL:](v52, "setSuperBinaryURL:", *p_url);
    if (HIDWORD(v104))
    {
      if (!objc_msgSend(v8, "uarpSeekToOffset:error:", DWORD2(v104), v46))
        goto LABEL_93;
      objc_msgSend(v8, "uarpReadDataUpToLength:error:", HIDWORD(v104), v46);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPSuperBinaryAssetPayload addMetaDataTLVs:](v52, "addMetaDataTLVs:", v53);

      v45 = v98;
    }
    if (v6)
      break;
LABEL_75:
    -[NSMutableArray addObject:](self->_payloads, "addObject:", v52);
LABEL_76:

LABEL_77:
    ++v48;
    v47 += 40;
    if (v99 == v48)
      goto LABEL_78;
  }
  if (objc_msgSend(v45, "count"))
  {
    objc_msgSend(v45, "objectAtIndex:", v48);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Payload Filepath"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
      goto LABEL_44;
  }
  else
  {
    v95 = 0;
  }
  -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347665, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v55, "valueAsString");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v94 = 0;
  }

  v46 = v100;
  v45 = v98;
LABEL_44:
  if (!HIDWORD(v105)
    || -[UARPSuperBinaryAssetPayload expandPayloadToURL:payloadFilename:superbinary:offset:length:error:](v52, "expandPayloadToURL:payloadFilename:superbinary:offset:length:error:", v6, v94, v8, v105))
  {
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Payload MetaData"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Payload Signature"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v56;
    if (v92)
    {
      -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347654, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        objc_msgSend(v58, "valueAsData");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v92, v97);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60 && v59)
          objc_msgSend(v59, "writeToURL:atomically:", v60, 1);

        v56 = v93;
      }

      v46 = v100;
      v45 = v98;
    }
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Payload Signature (Development)"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v91)
    {
      -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347669, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        objc_msgSend(v62, "valueAsData");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v91, v97);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64 && v63)
          objc_msgSend(v63, "writeToURL:atomically:", v64, 1);

        v56 = v93;
      }

      v46 = v100;
      v45 = v98;
    }
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Payload Hash"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347655, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        objc_msgSend(v66, "valueAsData");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v90, v97);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (v68 && v67)
          objc_msgSend(v67, "writeToURL:atomically:", v68, 1);

        v56 = v93;
      }

      v46 = v100;
      v45 = v98;
    }
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Payload Certificate"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347653, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        objc_msgSend(v71, "valueAsData");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v69, v97);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (v73 && v72)
          objc_msgSend(v72, "writeToURL:atomically:", v73, 1);

      }
      v46 = v100;
      v45 = v98;
      v56 = v93;
    }

    v6 = v97;
    v8 = v89;
    goto LABEL_75;
  }

LABEL_93:
  v74 = 0;
LABEL_79:

  v9 = v87;
  v16 = v84;
  v10 = v85;
  v22 = v82;
  v21 = v83;
LABEL_80:

LABEL_81:
LABEL_86:

LABEL_87:
  return v74;
}

- (id)description
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("------------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("SuperBinary Header\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("------------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Format Version  - %u\n"), self->_superBinaryHeader.superBinaryFormatVersion);
  objc_msgSend(v3, "appendFormat:", CFSTR("Header Length   - %u\n"), self->_superBinaryHeader.superBinaryHeaderLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("Length          - %u\n"), self->_superBinaryHeader.superBinaryLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("Version         - <"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%u."), self->_superBinaryHeader.superBinaryVersion.major);
  objc_msgSend(v3, "appendFormat:", CFSTR("%u."), self->_superBinaryHeader.superBinaryVersion.minor);
  objc_msgSend(v3, "appendFormat:", CFSTR("%u."), self->_superBinaryHeader.superBinaryVersion.release);
  objc_msgSend(v3, "appendFormat:", CFSTR("%u"), self->_superBinaryHeader.superBinaryVersion.build);
  objc_msgSend(v3, "appendFormat:", CFSTR(">\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("SuperBinary MetaData Offset - %u\n"), self->_superBinaryHeader.superBinaryMetadataOffset);
  objc_msgSend(v3, "appendFormat:", CFSTR("SuperBinary MetaData Length - %u\n"), self->_superBinaryHeader.superBinaryMetadataLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("Payloads Headers Offset - %u\n"), self->_superBinaryHeader.payloadHeadersOffset);
  objc_msgSend(v3, "appendFormat:", CFSTR("Payloads Headers Length - %u\n"), self->_superBinaryHeader.payloadHeadersLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("-------------------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("SuperBinary MetaData TLVs\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("-------------------------\n"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_tlvs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_payloads;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("-----------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("SuperBinary Plist\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("-----------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), self->_plistDictionary);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("--------------\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("MetaData Plist\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("--------------\n"));
  -[UARPSuperBinaryMetaDataTable dict](self->_metaDataTable, "dict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v14);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  return v3;
}

- (id)computeHash
{
  void *v3;
  NSURL *url;
  void *v5;
  id v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t i;
  id v15;
  id v16;
  CC_SHA256_CTX c;
  id v18;
  id v19;
  unsigned __int8 md[32];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  url = self->_url;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", url, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v18 = 0;
  v7 = objc_msgSend(v5, "uarpSeekToOffset:error:", 0, &v18);
  v8 = v18;

  if (v7)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v9 = 0;
    do
    {
      v10 = v8;
      v16 = 0;
      objc_msgSend(v5, "uarpReadDataUpToLength:error:", 4096, &v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v16;

      v9 = objc_retainAutorelease(v11);
      CC_SHA256_Update(&c, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    }
    while (objc_msgSend(v9, "length") == 4096);
    v15 = 0;
    objc_msgSend(v5, "uarpCloseAndReturnError:", &v15);
    v12 = v15;

    CC_SHA256_Final(md, &c);
    for (i = 0; i != 32; ++i)
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);

  }
  else
  {
    v12 = v8;
  }

  return v3;
}

- (_NSRange)rangeMetadata
{
  NSUInteger superBinaryMetadataLength;
  NSUInteger superBinaryMetadataOffset;
  _NSRange result;

  superBinaryMetadataLength = self->_superBinaryHeader.superBinaryMetadataLength;
  superBinaryMetadataOffset = self->_superBinaryHeader.superBinaryMetadataOffset;
  result.length = superBinaryMetadataLength;
  result.location = superBinaryMetadataOffset;
  return result;
}

- (BOOL)exportSuperBinaryContentToFilepath:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", self->_url, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "uarpSeekToOffset:error:", location, a5))
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;
    if (v12)
    {
      do
      {
        if (length >= 0x1000)
          v14 = 4096;
        else
          v14 = length;
        objc_msgSend(v11, "uarpReadDataUpToLength:error:", v14, a5);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
          break;
        v16 = (void *)v15;
        v17 = objc_msgSend(v12, "uarpWriteData:error:", v15, a5);
        if (!v17)
          v14 = 0;

        if (!v17)
          break;
        length -= v14;
      }
      while (length);
      objc_msgSend(v11, "uarpCloseAndReturnError:", a5);
      objc_msgSend(v12, "uarpCloseAndReturnError:", a5);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)prepareMetaData
{
  NSMutableData *v3;
  NSMutableData *metaData;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  metaData = self->_metaData;
  self->_metaData = v3;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_tlvs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "generateTLV:", 0, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableData appendData:](self->_metaData, "appendData:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", self->_metaData);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)payloadData:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  id v12;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  if (-[NSMutableArray containsObject:](self->_payloads, "containsObject:", v9))
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", self->_url, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && objc_msgSend(v10, "uarpSeekToOffset:error:", objc_msgSend(v9, "rangePayload") + location, a5))
    {
      objc_msgSend(v10, "uarpReadDataUpToLength:error:", length, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && objc_msgSend(v10, "uarpCloseAndReturnError:", a5))
        v12 = v11;
      else
        v12 = 0;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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

- (UARPAssetVersion)assetVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 120, 1);
}

- (UARPAssetTag)assetTag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)timeCreated
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_timeCreated, 0);
  objc_storeStrong((id *)&self->_assetTag, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_plistDictionary, 0);
  objc_storeStrong((id *)&self->_metaDataTable, 0);
  objc_storeStrong((id *)&self->_plistMetaData, 0);
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);
}

- (void)addMetaDataTLV:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_212D08000, MEMORY[0x24BDACB70], a3, "attempting to add a nil tlv to superbinary %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)addPayload:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_212D08000, MEMORY[0x24BDACB70], a3, "attempting to add a nil payload to superbinary %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:(uint64_t)a3 payloadStartOffset:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Failed to create file for composing superbinary, url is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeToURL:(uint64_t)a3 payloadStartOffset:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Failed to create file for composing superbinary, filename is NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeToURL:payloadStartOffset:error:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Failed to open file for composing superbinary at %@; %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:payloadStartOffset:error:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Failed to write to superbinary (7) at %@; %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:payloadStartOffset:error:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Failed to write to superbinary (6) at %@; %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:payloadStartOffset:error:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Failed to write to superbinary (5) at %@; %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:payloadStartOffset:error:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Failed to write to superbinary (4) at %@; %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:payloadStartOffset:error:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Failed to write to superbinary (3) at %@; %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:payloadStartOffset:error:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Failed to write to superbinary (2) at %@; %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:payloadStartOffset:error:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Failed to write to superbinary (1) at %@; %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:(uint64_t)a1 payloadStartOffset:(uint64_t)a2 error:(uint64_t)a3 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Failed to create file for composing superbinary at %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)writeToURL:(uint64_t)a3 payloadStartOffset:(_QWORD *)a4 error:.cold.12(uint8_t *a1, id *a2, uint64_t a3, _QWORD *a4)
{
  void *v6;

  objc_msgSend(*a2, "objectAtIndexedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v6;
  _os_log_error_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Missing payload\n%@", a1, 0xCu);

}

- (void)parseFromPlistSuperBinaryPayloads:(uint8_t *)a1 payloadsURL:(uint64_t)a2 error:(_QWORD *)a3 .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_212D08000, MEMORY[0x24BDACB70], (uint64_t)a3, "attempting to add a nil header payload to payload %@", a1);
}

- (void)parseFromPlistSuperBinaryPayloads:(uint64_t)a3 payloadsURL:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Failed to expand superbinary payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)decomposeToURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Error opening URL %@ to decompose superbinary; error is %@",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)decomposeToURL:(_QWORD *)a3 error:.cold.2(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_212D08000, MEMORY[0x24BDACB70], (uint64_t)a3, "attempting to decompose a nil payload for superbinary %@", a1);
}

- (void)decomposeToURL:(_QWORD *)a3 error:.cold.3(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_212D08000, MEMORY[0x24BDACB70], (uint64_t)a3, "skipping CHDR payload for superbinary %@", a1);
}

@end
