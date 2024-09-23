@implementation UARPDyanamicAssetLogManager

- (UARPDyanamicAssetLogManager)init
{
  -[UARPDyanamicAssetLogManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDyanamicAssetLogManager)initWithBaseURL:(id)a3
{
  id v4;
  UARPDyanamicAssetLogManager *v5;
  uint64_t v6;
  NSURL *baseURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPDyanamicAssetLogManager;
  v5 = -[UARPDyanamicAssetLogManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v6;

  }
  return v5;
}

- (BOOL)newLog:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  UARPSuperBinaryAsset *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  __CFString *v44;
  UARPSuperBinaryAsset *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_baseURL)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BDBCE48]);
    v51 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(v51, "components:fromDate:", 252, v7);
    v53 = a4;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.04d-%.02d-%.02d-%.02d%.02d%.02d"), objc_msgSend(v50, "year"), objc_msgSend(v50, "month"), objc_msgSend(v50, "day"), objc_msgSend(v50, "hour"), objc_msgSend(v50, "minute"), objc_msgSend(v50, "second"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", v6);
    if (-[UARPSuperBinaryAsset expandHeadersAndTLVs:](v10, "expandHeadersAndTLVs:", v53))
    {
      v42 = v7;
      v52 = v6;
      -[UARPSuperBinaryAsset tlvs](v10, "tlvs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 272691969, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = v12;
      if (v12)
      {
        objc_msgSend(v12, "valueAsString");
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = CFSTR("UnknownAppleModelNumber");
      }
      -[UARPSuperBinaryAsset tlvs](v10, "tlvs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 272691970, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v15;
      if (v15)
      {
        objc_msgSend(v15, "valueAsString");
        v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = CFSTR("UnknownSerialNumber");
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v44, 1, self->_baseURL);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (__CFString *)v16;
      if (v17)
      {
        v38 = v17;
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v16, 1, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18
          && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20 = objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, v53), v19, v20))
        {
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          -[UARPSuperBinaryAsset payloads](v10, "payloads");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
          if (v49)
          {
            v45 = v10;
            v46 = *(_QWORD *)v55;
            v47 = v18;
            v48 = v9;
            while (2)
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v55 != v46)
                  objc_enumerationMutation(obj);
                v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                v23 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v22, "payloadTag");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "char1");
                objc_msgSend(v22, "payloadTag");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "char2");
                objc_msgSend(v22, "payloadTag");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "char3");
                objc_msgSend(v22, "payloadTag");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = v25;
                v9 = v48;
                objc_msgSend(v23, "stringWithFormat:", CFSTR("%@-%c%c%c%c.uarplog"), v48, v37, v27, v29, (int)objc_msgSend(v30, "char4"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                v32 = objc_msgSend(v22, "rangePayload");
                v34 = v33;
                objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v52, v53);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v47;
                LODWORD(v32) = objc_msgSend(v22, "expandPayloadToURL:payloadFilename:superbinary:offset:length:error:", v47, v31, v35, v32, v34, v53);

                if (!(_DWORD)v32)
                {
                  v13 = 0;
                  v7 = v42;
                  v10 = v45;
                  goto LABEL_27;
                }
                v10 = v45;
              }
              v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
              if (v49)
                continue;
              break;
            }
            v13 = 1;
            v7 = v42;
          }
          else
          {
            v13 = 1;
          }
LABEL_27:

        }
        else
        {
          v13 = 0;
        }
        v6 = v52;

        v17 = v38;
      }
      else
      {
        v13 = 0;
        v6 = v52;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
