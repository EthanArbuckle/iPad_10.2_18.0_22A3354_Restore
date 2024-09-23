@implementation UARPSuperBinary

- (UARPSuperBinary)initWithData:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  UARPSuperBinary *v11;
  UARPSuperBinary *v12;
  uint64_t v13;
  NSData *data;
  uint64_t v15;
  NSMutableArray *tlvs;
  uint64_t v17;
  NSMutableArray *trimmedTlvs;
  uint64_t v19;
  NSMutableArray *measurements;
  UARPSuperBinary *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UARPSuperBinary;
  v11 = -[UARPSuperBinary init](&v23, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_4;
  if (!v8)
    goto LABEL_5;
  objc_storeWeak((id *)&v11->_delegate, v9);
  objc_storeStrong((id *)&v12->_delegateQueue, a5);
  v13 = objc_msgSend(v8, "copy");
  data = v12->_data;
  v12->_data = (NSData *)v13;

  v15 = objc_opt_new();
  tlvs = v12->_tlvs;
  v12->_tlvs = (NSMutableArray *)v15;

  v17 = objc_opt_new();
  trimmedTlvs = v12->_trimmedTlvs;
  v12->_trimmedTlvs = (NSMutableArray *)v17;

  v19 = objc_opt_new();
  measurements = v12->_measurements;
  v12->_measurements = (NSMutableArray *)v19;

  v12->_totalLength = -[NSData length](v12->_data, "length");
  if (-[UARPSuperBinary expandSuperBinary](v12, "expandSuperBinary"))
LABEL_4:
    v21 = v12;
  else
LABEL_5:
    v21 = 0;

  return v21;
}

- (UARPSuperBinary)initWithFilePath:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  UARPSuperBinary *v13;

  v8 = (void *)MEMORY[0x24BDBCE50];
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "stringByExpandingTildeInPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataWithContentsOfFile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UARPSuperBinary initWithData:delegate:delegateQueue:](self, "initWithData:delegate:delegateQueue:", v12, v10, v9);

  return v13;
}

- (UARPSuperBinary)initWithURL:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  UARPSuperBinary *v12;

  v8 = (void *)MEMORY[0x24BDBCE50];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "dataWithContentsOfURL:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UARPSuperBinary initWithData:delegate:delegateQueue:](self, "initWithData:delegate:delegateQueue:", v11, v10, v9);

  return v12;
}

- (BOOL)expandSuperBinary
{
  NSMutableArray *v3;
  NSMutableArray *payloads;
  NSData *data;
  unint64_t v6;
  UARPAssetVersion *v7;
  UARPAssetVersion *v8;
  UARPAssetVersion *version;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[3];

  v3 = (NSMutableArray *)objc_opt_new();
  payloads = self->_payloads;
  self->_payloads = v3;

  data = self->_data;
  if (!data)
    return 0;
  if (-[NSData length](data, "length") < 0x2C)
    return 0;
  memset(v17, 0, 44);
  -[NSData getBytes:range:](self->_data, "getBytes:range:", v17, 0, 44);
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)v17, v17);
  v6 = DWORD2(v17[0]);
  if (-[NSData length](self->_data, "length") < v6)
    return 0;
  self->_formatVersion = v17[0];
  v7 = [UARPAssetVersion alloc];
  v8 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](v7, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", HIDWORD(v17[0]), LODWORD(v17[1]), DWORD1(v17[1]), DWORD2(v17[1]));
  version = self->_version;
  self->_version = v8;

  if (!-[UARPSuperBinary expandMetaData:](self, "expandMetaData:", v17))
    return 0;
  v10 = DWORD1(v17[2]);
  v11 = DWORD2(v17[2]);
  do
  {
    v12 = v11 >= 0x28;
    v11 -= 40;
    v13 = !v12;
    if (!v12)
      break;
    v16 = 0;
    memset(v15, 0, sizeof(v15));
    -[NSData getBytes:range:](self->_data, "getBytes:range:", v15, v10, 40);
    uarpPayloadHeaderEndianSwap((unsigned int *)v15, v15);
    v10 += 40;
  }
  while (-[UARPSuperBinary preparePayload:](self, "preparePayload:", v15));
  return v13;
}

- (BOOL)expandMetaData:(UARPSuperBinaryHeader *)a3
{
  unsigned int superBinaryMetadataLength;
  unint64_t v6;
  NSData *v8;
  NSData *metaData;

  superBinaryMetadataLength = a3->superBinaryMetadataLength;
  if (!superBinaryMetadataLength)
    return 1;
  v6 = a3->superBinaryMetadataOffset + superBinaryMetadataLength;
  if (-[NSData length](self->_data, "length") < v6)
    return 0;
  -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->superBinaryMetadataOffset, a3->superBinaryMetadataLength);
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  metaData = self->_metaData;
  self->_metaData = v8;

  return -[UARPSuperBinary expandTLVs](self, "expandTLVs");
}

- (BOOL)preparePayload:(UARPPayloadHeader2 *)a3
{
  UARPAssetTag *v5;
  UARPAssetVersion *v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  void *v11;
  UARPSuperBinaryPayload *v12;
  UARPSuperBinaryPayload *v13;

  v5 = -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", (char)a3->var1.char1, (char)a3->var1.char2, (char)a3->var1.char3, (char)a3->var1.char4);
  v6 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", a3->var2.major, a3->var2.minor, a3->var2.release, a3->var2.build);
  v7 = a3->var4 + a3->var3;
  if (-[NSData length](self->_data, "length") >= v7)
  {
    if (a3->var4)
    {
      -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = a3->var6 + a3->var5;
    if (-[NSData length](self->_data, "length") >= v10)
    {
      if (a3->var6)
      {
        -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      v12 = -[UARPSuperBinaryPayload initWithData:metaData:tag:version:]([UARPSuperBinaryPayload alloc], "initWithData:metaData:tag:version:", v11, v9, v5, v6);
      v13 = v12;
      if (v12 && -[UARPSuperBinaryPayload expandTLVs](v12, "expandTLVs"))
      {
        -[NSMutableArray addObject:](self->_payloads, "addObject:", v13);
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)payloadWith4ccTag:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_payloads;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "tag", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)payloadsWithout4ccTag:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_payloads;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "tag", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getTlvs
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_tlvs);
}

- (id)personalizedMetaData
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSData *manifest;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  UARPSuperBinary *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray removeAllObjects](self->_trimmedTlvs, "removeAllObjects");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self;
  v3 = self->_tlvs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      -[NSMutableArray addObject:](v20->_trimmedTlvs, "addObject:", v8);
                  }
                }
              }
            }
          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  manifest = v20->_manifest;
  if (manifest)
  {
    +[UARPMetaDataTLV tlvFromType:length:value:](UARPMetaDataTLV, "tlvFromType:length:value:", 2293403952, -[NSData length](manifest, "length"), -[NSData bytes](v20->_manifest, "bytes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[NSMutableArray addObject:](v20->_trimmedTlvs, "addObject:", v10);

  }
  v11 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v20->_trimmedTlvs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "generateTLV");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendData:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)getPayloads
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_payloads);
}

- (BOOL)expandTLVs
{
  char *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = -[NSData bytes](self->_metaData, "bytes");
  if (-[NSData length](self->_metaData, "length"))
  {
    v4 = 0;
    do
    {
      if (v4 + 4 > -[NSData length](self->_metaData, "length"))
        break;
      v5 = uarpHtonl(*(_DWORD *)&v3[v4]);
      v6 = v4 + 8;
      if (v4 + 8 > -[NSData length](self->_metaData, "length"))
        break;
      v7 = uarpHtonl(*(_DWORD *)&v3[v4 + 4]);
      v4 = v6 + v7;
      if (v4 > -[NSData length](self->_metaData, "length"))
        break;
      +[UARPMetaDataTLV tlvFromType:length:value:](UARPMetaDataTLV, "tlvFromType:length:value:", v5, v7, &v3[v6]);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        break;
      v9 = (void *)v8;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v8);

    }
    while (v4 < -[NSData length](self->_metaData, "length"));
  }
  -[UARPSuperBinary processTLVsForPersonalization](self, "processTLVsForPersonalization");
  return 1;
}

- (id)personalizeSuperBinary:(unint64_t)a3 signingServer:(id)a4 ssoOnly:(BOOL)a5
{
  _BOOL8 v5;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v22 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_payloads;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v13, "needsHostPersonalization") & 1) != 0)
        {
          objc_msgSend(v13, "setBoardID:", self->_boardID);
          objc_msgSend(v13, "setChipID:", self->_chipID);
          objc_msgSend(v13, "setEcID:", self->_ecID);
          objc_msgSend(v13, "setNonce:", self->_nonce);
          objc_msgSend(v13, "setProductionMode:", self->_productionMode);
          objc_msgSend(v13, "setSecurityDomain:", self->_securityDomain);
          objc_msgSend(v13, "setSecurityMode:", self->_securityMode);
          objc_msgSend(v13, "setTrustedOverride:", self->_trustedOverride);
          objc_msgSend(v13, "setDemote:", self->_demote);
          -[UARPSuperBinary log:](self, "log:", CFSTR("Personalizing %@"), v13);
          objc_msgSend(v13, "composeTSSRequest:", a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_17;
          objc_msgSend(v13, "tag");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UARPSuperBinary log:](self, "log:", CFSTR("TSS Request Options for payload %@"), v15);

          objc_msgSend(v13, "tssRequest");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UARPSuperBinary log:](self, "log:", CFSTR("%@"), v16);

          if (!objc_msgSend(v13, "queryTatsuSigningServer:ssoOnly:error:", v22, v5, 0))
          {
LABEL_17:

            v19 = 0;
            goto LABEL_18;
          }
        }
        else
        {
          objc_msgSend(v13, "tag");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UARPSuperBinary log:](self, "log:", CFSTR("Host Personalization not required for payload %@"), v14);
        }

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (!-[UARPSuperBinary needsHostPersonalization](self, "needsHostPersonalization")
    || (v17 = -[UARPSuperBinary composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 0),
        v18 = -[UARPSuperBinary queryTatsuSigningServer:ssoOnly:error:](self, "queryTatsuSigningServer:ssoOnly:error:", v22, v5, 0), v19 = 0, v18))
  {
    -[UARPSuperBinary generatePersonalizedSuperBinary](self, "generatePersonalizedSuperBinary");
    v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
    if (v20)
    {
      v8 = v20;
      v19 = v8;
    }
    else
    {
      v19 = 0;
    }
LABEL_18:

  }
  return v19;
}

- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  NSMutableDictionary *tssRequest;
  void *v9;
  void *v10;
  NSData *v11;
  NSData *manifest;

  v5 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://gs.apple.com:443"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  tssRequest = self->_tssRequest;
  if (v5)
    UARPPersonalizationTSSRequestWithSigningServerSSO(tssRequest, v7);
  else
    UARPPersonalizationTSSRequestWithSigningServer(tssRequest, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", self->_keyManifest);
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    manifest = self->_manifest;
    self->_manifest = v11;

  }
  return v10 != 0;
}

- (id)generatePersonalizedSuperBinary
{
  return -[UARPSuperBinary generatePersonalizedSuperBinaryInternal:](self, "generatePersonalizedSuperBinaryInternal:", self->_payloads);
}

- (id)generatePersonalizedSuperBinaryWithoutRRKO
{
  UARPAssetTag *v3;
  UARPAssetTag *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  UARPSuperBinary *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = -[UARPAssetTag initWithString:]([UARPAssetTag alloc], "initWithString:", CFSTR("RRKO"));
  v4 = -[UARPAssetTag initWithString:]([UARPAssetTag alloc], "initWithString:", CFSTR("rrko"));
  v16 = self;
  v17 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_payloads;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "tag", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v3))
        {

        }
        else
        {
          objc_msgSend(v10, "tag");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if ((v13 & 1) == 0)
            objc_msgSend(v17, "addObject:", v10);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  -[UARPSuperBinary generatePersonalizedSuperBinaryInternal:](v16, "generatePersonalizedSuperBinaryInternal:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)generatePersonalizedSuperBinaryInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  unsigned int *v10;
  unint64_t v11;
  _DWORD *v12;
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
  int v23;
  unint64_t v24;
  _DWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  unint64_t v30;
  void *v32;
  void *v33;
  unsigned int v34[2];
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  v34[0] = self->_formatVersion;
  v34[1] = 44;
  v36 = -[UARPAssetVersion majorVersion](self->_version, "majorVersion");
  v37 = -[UARPAssetVersion minorVersion](self->_version, "minorVersion");
  v38 = -[UARPAssetVersion releaseVersion](self->_version, "releaseVersion");
  v39 = -[UARPAssetVersion buildVersion](self->_version, "buildVersion");
  v42 = 44;
  v43 = 40 * objc_msgSend(v4, "count");
  -[UARPSuperBinary personalizedMetaData](self, "personalizedMetaData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v43 + 44;
  v8 = objc_msgSend(v7, "length");
  v9 = v43 + 44 + v8;
  v41 = v8;
  v35 = v9;
  v32 = v7;
  objc_msgSend(v6, "appendData:", v7);
  v10 = (unsigned int *)malloc_type_calloc(objc_msgSend(v4, "count"), 0x28uLL, 0x10000400A747E1EuLL);
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = v10 + 4;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "personalizedMetaData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(v12 - 4) = 40;
      objc_msgSend(v13, "tag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 - 12) = objc_msgSend(v15, "char1");

      objc_msgSend(v13, "tag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 - 11) = objc_msgSend(v16, "char2");

      objc_msgSend(v13, "tag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 - 10) = objc_msgSend(v17, "char3");

      objc_msgSend(v13, "tag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 - 9) = objc_msgSend(v18, "char4");

      objc_msgSend(v13, "version");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(v12 - 2) = objc_msgSend(v19, "majorVersion");

      objc_msgSend(v13, "version");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(v12 - 1) = objc_msgSend(v20, "minorVersion");

      objc_msgSend(v13, "version");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *v12 = objc_msgSend(v21, "releaseVersion");

      objc_msgSend(v13, "version");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = objc_msgSend(v22, "buildVersion");

      v12[2] = v9;
      v23 = objc_msgSend(v14, "length");
      v12[3] = v23;
      v9 += v23;
      objc_msgSend(v6, "appendData:", v14);

      ++v11;
      v12 += 10;
    }
    while (v11 < objc_msgSend(v4, "count"));
  }
  if (objc_msgSend(v4, "count"))
  {
    v24 = 0;
    v25 = v10 + 9;
    v26 = v33;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "personalizedData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(v25 - 1) = v9;
      v29 = objc_msgSend(v28, "length");
      *v25 = v29;
      v25 += 10;
      v9 += v29;
      objc_msgSend(v33, "appendData:", v28);

      ++v24;
    }
    while (v24 < objc_msgSend(v4, "count"));
  }
  else
  {
    v26 = v33;
  }
  v35 = v9;
  uarpSuperBinaryHeaderEndianSwap(v34, v34);
  objc_msgSend(v5, "appendBytes:length:", v34, 44);
  if (objc_msgSend(v4, "count"))
  {
    v30 = 0;
    do
    {
      uarpPayloadHeaderEndianSwap(v10, v10);
      objc_msgSend(v5, "appendBytes:length:", v10, 40);
      ++v30;
      v10 += 10;
    }
    while (v30 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(v5, "appendData:", v6);
  objc_msgSend(v5, "appendData:", v26);

  return v5;
}

- (BOOL)generateTatsuMeasurements:(unint64_t)a3 relativeURL:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *tatsuMeasurements;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v6 = a4;
  v7 = (NSMutableDictionary *)objc_opt_new();
  tatsuMeasurements = self->_tatsuMeasurements;
  self->_tatsuMeasurements = v7;

  if (-[UARPSuperBinary expandTLVs](self, "expandTLVs"))
    -[UARPSuperBinary processTLVsForPersonalization](self, "processTLVsForPersonalization");
  if (self->_needsHostPersonalization)
    -[UARPSuperBinary generateTatsuMeasurements:](self, "generateTatsuMeasurements:", a3);
  else
    -[UARPSuperBinary generateTatsuMeasurementsPerPayload:](self, "generateTatsuMeasurementsPerPayload:", a3);
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.plist"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fileURLWithPath:isDirectory:relativeToURL:", v11, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[NSMutableDictionary writeToURL:error:](self->_tatsuMeasurements, "writeToURL:error:", v14, 0);
  return v15;
}

- (void)generateTatsuMeasurementsPerPayload:(unint64_t)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_payloads;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if (a3)
        {
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
          v11 = 1;
          do
          {
            objc_msgSend(v10, "tatsuMeasurements:", v11, (_QWORD)v13);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              -[NSMutableDictionary addEntriesFromDictionary:](self->_tatsuMeasurements, "addEntriesFromDictionary:", v12);

            ++v11;
          }
          while (v11 <= a3);
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)generateTatsuMeasurements:(unint64_t)a3
{
  NSData *manifest;
  NSMutableDictionary *v6;
  NSMutableDictionary *tssRequest;
  uint64_t v8;
  void *v9;

  manifest = self->_manifest;
  self->_manifest = 0;

  v6 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v6;

  if (a3)
  {
    v8 = 0;
    do
    {
      -[UARPSuperBinary tatsuMeasurements:](self, "tatsuMeasurements:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        -[NSMutableDictionary addEntriesFromDictionary:](self->_tatsuMeasurements, "addEntriesFromDictionary:", v9);

      ++v8;
    }
    while (a3 != v8);
  }
}

- (void)processTLVsForPersonalization
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString *v10;
  NSString *ticketPrefix;
  NSString *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_tlvs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self->_needsHostPersonalization = objc_msgSend(v8, "isRequired") != 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "ticketPrefix");
          v10 = (NSString *)objc_claimAutoreleasedReturnValue();
          ticketPrefix = self->_ticketPrefix;
          self->_ticketPrefix = v10;
LABEL_12:

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "manifestSuffix");
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          ticketPrefix = self->_ticketSuffix;
          self->_ticketSuffix = v12;
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self->_ticketNeedsUnitNumber = objc_msgSend(v8, "ticketNeedsLogicalUnitNumber") != 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            self->_prefixNeedsUnitNumber = objc_msgSend(v8, "prefixNeedsLogicalUnitNumber") != 0;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              self->_suffixNeedsUnitNumber = objc_msgSend(v8, "suffixNeedsLogicalUnitNumber", (_QWORD)v14) != 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[NSMutableArray addObject:](self->_measurements, "addObject:", v8, (_QWORD)v14);
            }
          }
        }
LABEL_13:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          self->_life = objc_msgSend(v8, "life");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          self->_provisioning = objc_msgSend(v8, "provisioning") != 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          self->_manifestEpoch = objc_msgSend(v8, "manifestEpoch");
        ++v7;
      }
      while (v5 != v7);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v5 = v13;
    }
    while (v13);
  }

}

- (id)tatsuMeasurements:(unint64_t)a3
{
  void *v5;

  v5 = (void *)-[NSMutableArray count](self->_tlvs, "count");
  if (v5)
  {
    -[UARPSuperBinary composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4
{
  NSData *manifest;
  NSMutableDictionary *v7;
  NSMutableDictionary *tssRequest;
  void *v9;
  NSMutableString *v10;
  NSMutableString *keyManifest;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  NSData *ecidData;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  _BOOL4 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v30 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  manifest = self->_manifest;
  self->_manifest = 0;

  v7 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v7;

  -[UARPSuperBinary requiredTSSOptions](self, "requiredTSSOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSMutableString *)objc_opt_new();
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR("%@"), self->_ticketPrefix);
  if (self->_ticketNeedsUnitNumber)
    -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR("%lu"), a3);
  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR(",Ticket"));
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "appendFormat:", CFSTR("@%@"), self->_keyManifest);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v12);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "unsignedLongValue"))
        {
          case 4u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("BoardID"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)MEMORY[0x24BDD16E0];
            v20 = -[UARPSuperBinary boardID](self, "boardID");
            goto LABEL_13;
          case 5u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ChipID"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)MEMORY[0x24BDD16E0];
            v20 = -[UARPSuperBinary chipID](self, "chipID");
LABEL_13:
            objc_msgSend(v19, "numberWithUnsignedInt:", v20);
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_28;
          case 7u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ECID"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[UARPSuperBinary ecID](self, "ecID"));
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_28;
          case 8u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("SecurityDomain"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)MEMORY[0x24BDD16E0];
            v25 = -[UARPSuperBinary securityDomain](self, "securityDomain");
            goto LABEL_27;
          case 9u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("SecurityMode"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[UARPSuperBinary securityMode](self, "securityMode");
            goto LABEL_17;
          case 0xAu:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ProductionMode"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[UARPSuperBinary productionMode](self, "productionMode");
LABEL_17:
            if (v21)
              ecidData = (NSData *)MEMORY[0x24BDBD1C8];
            else
              ecidData = (NSData *)MEMORY[0x24BDBD1C0];
            goto LABEL_20;
          case 0x18u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("Nonce"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[UARPSuperBinary nonce](self, "nonce");
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_28;
          case 0x19u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("Life"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)MEMORY[0x24BDD16E0];
            v25 = -[UARPSuperBinary life](self, "life");
            goto LABEL_27;
          case 0x1Au:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("Provisioning"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[UARPSuperBinary provisioning](self, "provisioning"))
              goto LABEL_29;
            v26 = self->_tssRequest;
            ecidData = (NSData *)MEMORY[0x24BDBD1C8];
            goto LABEL_21;
          case 0x1Bu:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ManifestEpoch"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)MEMORY[0x24BDD16E0];
            v25 = -[UARPSuperBinary manifestEpoch](self, "manifestEpoch");
LABEL_27:
            objc_msgSend(v24, "numberWithUnsignedChar:", v25);
            v23 = objc_claimAutoreleasedReturnValue();
LABEL_28:
            v27 = (void *)v23;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v23, v18);

            goto LABEL_29;
          case 0x1Du:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ECID"), a3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            ecidData = self->_ecidData;
LABEL_20:
            v26 = self->_tssRequest;
LABEL_21:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", ecidData, v18);
LABEL_29:

            break;
          default:
            continue;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  -[UARPSuperBinary processMeasurementsForTSSOptions:unitNumber:asMeasurement:](self, "processMeasurementsForTSSOptions:unitNumber:asMeasurement:", self->_tssRequest, a3, v30);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_tssRequest);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@"), self->_ticketPrefix);
  if (self->_prefixNeedsUnitNumber)
    objc_msgSend(v7, "appendFormat:", CFSTR("%lu"), a4);
  objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v6);
  if (self->_suffixNeedsUnitNumber)
    objc_msgSend(v7, "appendFormat:", CFSTR(",%lu"), a4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5
{
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v25;
  NSMutableArray *obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  UARPSuperBinary *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v34 = self;
  v35 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = self->_payloads;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "measurements");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v30 = v7;
        v32 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v32)
        {
          v29 = i;
          v8 = 0;
          v9 = 0;
          v31 = *(_QWORD *)v42;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v42 != v31)
                objc_enumerationMutation(v30);
              v33 = v10;
              v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v10);
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              objc_msgSend(v11, "tlvs");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v38;
                do
                {
                  for (j = 0; j != v14; ++j)
                  {
                    if (*(_QWORD *)v38 != v15)
                      objc_enumerationMutation(v12);
                    v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v18 = v17;
                      objc_msgSend(v18, "longname");
                      v19 = objc_claimAutoreleasedReturnValue();

                      v9 = (void *)v19;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v20 = v17;
                        objc_msgSend(v20, "digest");
                        v21 = objc_claimAutoreleasedReturnValue();

                        v8 = (void *)v21;
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0 && !a5)
                        {
                          if (-[UARPSuperBinary productionMode](v34, "productionMode"))
                            v22 = MEMORY[0x24BDBD1C8];
                          else
                            v22 = MEMORY[0x24BDBD1C0];
                          objc_msgSend(v35, "setObject:forKeyedSubscript:", v22, CFSTR("EPRO"));
                        }
                      }
                    }
                  }
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                }
                while (v14);
              }

              v10 = v33 + 1;
            }
            while (v33 + 1 != v32);
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v32);
          if (v9)
          {
            i = v29;
            if (v8)
              objc_msgSend(v35, "setObject:forKeyedSubscript:", v8, v9);
          }
          else
          {
            i = v29;
          }
        }
        else
        {
          v9 = 0;
          v8 = 0;
        }

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v28);
  }

  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "appendFormat:", CFSTR("%@"), v34->_ticketPrefix);
  if (v34->_prefixNeedsUnitNumber)
    objc_msgSend(v23, "appendFormat:", CFSTR("%lu"), a4);
  objc_msgSend(v23, "appendFormat:", CFSTR(",%@"), v34->_ticketSuffix);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, v23);

}

- (id)requiredTSSOptions
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_tlvs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          if (objc_msgSend(v10, "tssOption", (_QWORD)v14) == -2001563388)
          {
            v11 = 4;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563387)
          {
            v11 = 5;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563386)
          {
            v11 = 7;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563339)
          {
            v11 = 29;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563385)
          {
            v11 = 24;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563383)
          {
            v11 = 8;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563382)
          {
            v11 = 9;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563381)
          {
            v11 = 10;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563343)
          {
            v11 = 25;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563342)
          {
            v11 = 26;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563341)
          {
            v11 = 27;
LABEL_29:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

          }
          continue;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)getDataBlock:(unint64_t)a3 offset:(unint64_t)a4
{
  void *v5;

  -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_totalBytesRequested += objc_msgSend(v5, "length");
  return v5;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id WeakRetained;
  NSObject *delegateQueue;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = (objc_class *)MEMORY[0x24BDD16A8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, a4);

  objc_msgSend(v8, "appendString:", CFSTR("\n"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    delegateQueue = self->_delegateQueue;
    if (delegateQueue)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __41__UARPSuperBinary_logInternal_arguments___block_invoke;
      v12[3] = &unk_24CEA2488;
      v12[4] = self;
      v13 = v8;
      dispatch_async(delegateQueue, v12);

    }
    else
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "superbinary:logString:", self, v8);

    }
  }

}

void __41__UARPSuperBinary_logInternal_arguments___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "superbinary:logString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)log:(id)a3
{
  uint64_t v3;

  -[UARPSuperBinary logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(unsigned int)a3
{
  self->_boardID = a3;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (void)setChipID:(unsigned int)a3
{
  self->_chipID = a3;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

- (void)setEcID:(unint64_t)a3
{
  self->_ecID = a3;
}

- (NSData)ecidData
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setEcidData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setNonce:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (unsigned)productionMode
{
  return self->_productionMode;
}

- (void)setProductionMode:(unsigned __int8)a3
{
  self->_productionMode = a3;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(unsigned __int8)a3
{
  self->_securityDomain = a3;
}

- (unsigned)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(unsigned __int8)a3
{
  self->_securityMode = a3;
}

- (unsigned)life
{
  return self->_life;
}

- (void)setLife:(unsigned __int8)a3
{
  self->_life = a3;
}

- (BOOL)provisioning
{
  return self->_provisioning;
}

- (void)setProvisioning:(BOOL)a3
{
  self->_provisioning = a3;
}

- (unsigned)manifestEpoch
{
  return self->_manifestEpoch;
}

- (void)setManifestEpoch:(unsigned __int8)a3
{
  self->_manifestEpoch = a3;
}

- (NSNumber)trustedOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setTrustedOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)demote
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDemote:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (BOOL)needsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)payloads
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)layer2Context
{
  return self->_layer2Context;
}

- (void)setLayer2Context:(void *)a3
{
  self->_layer2Context = a3;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (unint64_t)totalBytesRequested
{
  return self->_totalBytesRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demote, 0);
  objc_storeStrong((id *)&self->_trustedOverride, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ecidData, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_ticketSuffix, 0);
  objc_storeStrong((id *)&self->_ticketPrefix, 0);
  objc_storeStrong((id *)&self->_keyManifest, 0);
  objc_storeStrong((id *)&self->_tssRequest, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_tatsuMeasurements, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_trimmedTlvs, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
