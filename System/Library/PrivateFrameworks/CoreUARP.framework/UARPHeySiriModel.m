@implementation UARPHeySiriModel

- (UARPHeySiriModel)initWithURL:(id)a3
{
  id v4;
  UARPHeySiriModel *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPHeySiriModel;
  v5 = -[UARPHeySiriModel init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

  }
  return v5;
}

- (NSArray)newModels
{
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_newModels);
  return (NSArray *)objc_claimAutoreleasedReturnValue();
}

- (NSArray)fallbackModels
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_fallbackModels);
}

- (NSArray)downloadedModels
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_downloadedModels);
}

- (NSArray)preInstalledModels
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_preInstalledModels);
}

- (void)addHeySiriPrimaryModel:(id)a3
{
  id v4;
  NSMutableArray *newModels;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  newModels = self->_newModels;
  v8 = v4;
  if (!newModels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_newModels;
    self->_newModels = v6;

    v4 = v8;
    newModels = self->_newModels;
  }
  -[NSMutableArray addObject:](newModels, "addObject:", v4);

}

- (void)addHeySiriFallbackModel:(id)a3
{
  id v4;
  NSMutableArray *fallbackModels;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fallbackModels = self->_fallbackModels;
  v8 = v4;
  if (!fallbackModels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_fallbackModels;
    self->_fallbackModels = v6;

    v4 = v8;
    fallbackModels = self->_fallbackModels;
  }
  -[NSMutableArray addObject:](fallbackModels, "addObject:", v4);

}

- (void)addHeySiriDownloadedModel:(id)a3
{
  id v4;
  NSMutableArray *downloadedModels;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  downloadedModels = self->_downloadedModels;
  v8 = v4;
  if (!downloadedModels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_downloadedModels;
    self->_downloadedModels = v6;

    v4 = v8;
    downloadedModels = self->_downloadedModels;
  }
  -[NSMutableArray addObject:](downloadedModels, "addObject:", v4);

}

- (void)addHeySiriPreinstalledModel:(id)a3
{
  id v4;
  NSMutableArray *preInstalledModels;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preInstalledModels = self->_preInstalledModels;
  v8 = v4;
  if (!preInstalledModels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_preInstalledModels;
    self->_preInstalledModels = v6;

    v4 = v8;
    preInstalledModels = self->_preInstalledModels;
  }
  -[NSMutableArray addObject:](preInstalledModels, "addObject:", v4);

}

- (void)expandSuperBinaryMetaData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725832, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueAsNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_engineType = objc_msgSend(v5, "unsignedShortValue");
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725831, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueAsVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_majorVersion = objc_msgSend(v7, "majorVersion");
  self->_minorVersion = objc_msgSend(v7, "minorVersion");

}

- (void)expandSuperBinaryPayloads:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
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
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        +[UARPHeySiriModel hsModelWithUarpPayload:](UARPHeySiriModel, "hsModelWithUarpPayload:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "tlvs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725824, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "valueAsNumber");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "unsignedShortValue") == 1)
          -[UARPHeySiriModel addHeySiriPreinstalledModel:](self, "addHeySiriPreinstalledModel:", v9);
        else
          -[UARPHeySiriModel addHeySiriDownloadedModel:](self, "addHeySiriDownloadedModel:", v9);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (BOOL)expandURL:(id *)a3
{
  UARPSuperBinaryAsset *v5;
  UARPSuperBinaryAsset *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  void *v26;
  void *v27;
  UARPSuperBinaryAsset *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", self->_url);
  v6 = v5;
  if (v5 && -[UARPSuperBinaryAsset expandHeadersAndTLVs:](v5, "expandHeadersAndTLVs:", a3))
  {
    -[UARPSuperBinaryAsset tlvs](v6, "tlvs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725831, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "valueAsVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_majorVersion = objc_msgSend(v9, "majorVersion");
      self->_minorVersion = objc_msgSend(v9, "minorVersion");

    }
    v27 = v8;
    -[UARPSuperBinaryAsset tlvs](v6, "tlvs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725832, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "valueAsNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_engineType = objc_msgSend(v12, "unsignedShortValue");

    }
    v26 = v11;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = v6;
    -[UARPSuperBinaryAsset payloads](v6, "payloads");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          +[UARPHeySiriModel hsModelWithUarpPayload:](UARPHeySiriModel, "hsModelWithUarpPayload:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tlvs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725824, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21
            && (objc_msgSend(v21, "valueAsNumber"),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v23 = objc_msgSend(v22, "unsignedShortValue"),
                v22,
                v23 == 1))
          {
            -[UARPHeySiriModel addHeySiriPreinstalledModel:](self, "addHeySiriPreinstalledModel:", v19);
          }
          else
          {
            -[UARPHeySiriModel addHeySiriDownloadedModel:](self, "addHeySiriDownloadedModel:", v19);
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

    v24 = 1;
    v6 = v28;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)uarpPayloadWithHSModel:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  void *v5;
  UARPSuperBinaryAssetPayload *v6;
  void *v7;
  UARPSuperBinaryAssetTLV *v8;
  void *v9;
  UARPSuperBinaryAssetTLV *v10;
  void *v11;
  UARPSuperBinaryAssetTLV *v12;
  void *v13;
  UARPSuperBinaryAssetTLV *v14;
  void *v15;
  UARPSuperBinaryAssetTLV *v16;
  void *v17;
  UARPSuperBinaryAssetTLV *v18;
  void *v19;
  UARPSuperBinaryAssetTLV *v20;
  void *v21;
  UARPSuperBinaryAssetTLV *v22;
  void *v23;
  UARPSuperBinaryAssetTLV *v24;
  void *v25;
  UARPSuperBinaryAssetTLV *v26;
  void *v27;
  void *v28;

  v3 = a3;
  v4 = (unsigned __int8 *)uarpAssetTagHeySiriModel4cc();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%c%c%c%c"), *v4, v4[1], v4[2], v4[3]);
  v6 = -[UARPSuperBinaryAssetPayload initWithTag:majorVersion:minorVersion:releaseVersion:buildVersion:]([UARPSuperBinaryAssetPayload alloc], "initWithTag:majorVersion:minorVersion:releaseVersion:buildVersion:", v5, &unk_24CEC0FE0, &unk_24CEC0FE0, &unk_24CEC0FE0, &unk_24CEC0FE0);
  objc_msgSend(v3, "modelLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v3, "modelLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v8, "initWithType:stringValue:", 1619725825, v9);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v10);
  }
  objc_msgSend(v3, "modelHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v3, "modelHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v12, "initWithType:stringValue:", 1619725826, v13);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v14);
  }
  objc_msgSend(v3, "digest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v3, "digest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v16, "initWithType:dataValue:", 1619725828, v17);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v18);
  }
  objc_msgSend(v3, "signature");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v3, "signature");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v20, "initWithType:dataValue:", 1619725829, v21);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v22);
  }
  objc_msgSend(v3, "certificate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v3, "certificate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v24, "initWithType:dataValue:", 1619725830, v25);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v26);
  }
  objc_msgSend(v3, "modelData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v3, "modelData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSuperBinaryAssetPayload setPayloadToData:](v6, "setPayloadToData:", v28);

  }
  return v6;
}

+ (id)hsModelWithUarpPayload:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend(v24, "tlvs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v25 = 0;
    v26 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        switch(objc_msgSend(v11, "type"))
        {
          case 0x608B0E01u:
            objc_msgSend(v11, "valueAsString");
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = v8;
            v8 = (void *)v12;
            goto LABEL_12;
          case 0x608B0E02u:
            objc_msgSend(v11, "valueAsString");
            v15 = objc_claimAutoreleasedReturnValue();
            v13 = v7;
            v7 = (void *)v15;
            goto LABEL_12;
          case 0x608B0E04u:
            objc_msgSend(v11, "valueAsData");
            v14 = objc_claimAutoreleasedReturnValue();
            v13 = v6;
            v6 = (void *)v14;
            goto LABEL_12;
          case 0x608B0E05u:
            objc_msgSend(v11, "valueAsData");
            v16 = objc_claimAutoreleasedReturnValue();
            v13 = v26;
            v26 = (void *)v16;
            goto LABEL_12;
          case 0x608B0E06u:
            objc_msgSend(v11, "valueAsData");
            v17 = objc_claimAutoreleasedReturnValue();
            v13 = v25;
            v25 = (void *)v17;
LABEL_12:

            break;
          default:
            continue;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  objc_msgSend(v24, "payload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc((Class)getCSVoiceTriggerRTModelClass());
  if (v18)
  {
    v21 = v25;
    v20 = v26;
    v22 = (void *)objc_msgSend(v19, "initWithData:hash:locale:digest:signature:certificate:", v18, v7, v8, v6, v26, v25);
  }
  else
  {
    v22 = (void *)objc_msgSend(v19, "initWithHash:locale:", v7, v8);
    v21 = v25;
    v20 = v26;
  }

  return v22;
}

- (id)exportAsSuperBinary:(id *)a3
{
  UARPAssetVersion *v4;
  UARPSuperBinaryAsset *v5;
  void *v6;
  void *v7;
  UARPSuperBinaryAssetTLV *v8;
  void *v9;
  void *v10;
  UARPSuperBinaryAssetTLV *v11;

  v4 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", 0, 0, 0, 0);
  v5 = -[UARPSuperBinaryAsset initWithFormatVersion:assetVersion:]([UARPSuperBinaryAsset alloc], "initWithFormatVersion:assetVersion:", 3, v4);
  if (-[NSMutableArray count](self->_newModels, "count"))
  {
    -[NSMutableArray firstObject](self->_newModels, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPHeySiriModel uarpPayloadWithHSModel:](UARPHeySiriModel, "uarpPayloadWithHSModel:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", 1619725827, 0);
    objc_msgSend(v7, "addMetaDataTLV:", v8);
    -[UARPSuperBinaryAsset addPayload:](v5, "addPayload:", v7);

  }
  if (-[NSMutableArray count](self->_fallbackModels, "count"))
  {
    -[NSMutableArray firstObject](self->_fallbackModels, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPHeySiriModel uarpPayloadWithHSModel:](UARPHeySiriModel, "uarpPayloadWithHSModel:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", 1619725827, 1);
    objc_msgSend(v10, "addMetaDataTLV:", v11);
    -[UARPSuperBinaryAsset addPayload:](v5, "addPayload:", v10);

  }
  return v5;
}

- (unint64_t)engineType
{
  return self->_engineType;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preInstalledModels, 0);
  objc_storeStrong((id *)&self->_downloadedModels, 0);
  objc_storeStrong((id *)&self->_fallbackModels, 0);
  objc_storeStrong((id *)&self->_newModels, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
