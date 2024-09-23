@implementation UARPDynamicAssetPersonalization

- (UARPDynamicAssetPersonalization)init
{
  -[UARPDynamicAssetPersonalization doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetPersonalization)initWithEndpoint:(id)a3 url:(id)a4 tatsuServerURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  UARPDynamicAssetPersonalization *v12;
  UARPDynamicAssetPersonalization *v13;
  os_log_t v14;
  OS_os_log *log;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  char *v18;
  UARPAssetTag *v19;
  UARPAssetTag *tagIM4M;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)UARPDynamicAssetPersonalization;
  v12 = -[UARPDynamicAssetPersonalization init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpoint, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_tatsuServerURL, a5);
    v14 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    v16 = dispatch_queue_create("com.apple.UARP.UARPPersonalization", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v18 = (char *)uarpAssetTagStructPersonalization();
    v19 = -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v18, v18[1], v18[2], v18[3]);
    tagIM4M = v13->_tagIM4M;
    v13->_tagIM4M = v19;

  }
  return v13;
}

- (int64_t)assetNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[UARPSuperBinaryAsset tlvs](self->_im4mAsset, "tlvs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403906, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "valueAsNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "integerValue");
    else
      v6 = -1;

  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (NSDictionary)options
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[NSMutableArray firstObject](self->_options, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (id)buildTicketPrefixForPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "tlvs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403907, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "valueAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "tlvs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403942, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "valueAsNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedCharValue") != 0;

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v3, "tlvs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403941, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "valueAsNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongValue");

  }
  else
  {
    v14 = 1;
  }
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@"), v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10)
    objc_msgSend(v15, "appendFormat:", CFSTR("%lu"), v14);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)buildKey:(id)a3 forPayload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "tlvs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403907, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "valueAsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v26 = v5;
  objc_msgSend(v6, "tlvs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403937, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "valueAsNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedCharValue") != 0;

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v6, "tlvs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403938, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "valueAsNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedCharValue") != 0;

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v6, "tlvs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403941, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "valueAsNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedLongValue");

  }
  else
  {
    v21 = 1;
  }
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@"), v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v13)
    objc_msgSend(v22, "appendFormat:", CFSTR("%lu"), v21);
  objc_msgSend(v23, "appendFormat:", CFSTR(",%@"), v26);
  if (v17)
    objc_msgSend(v23, "appendFormat:", CFSTR(",%lu"), v21);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  UARPDynamicAssetPersonalization *v4;
  UARPSuperBinaryAsset *v5;
  UARPSuperBinaryAsset *im4mAsset;
  _BOOL4 v7;
  NSMutableArray *v8;
  NSMutableArray *options;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString *keyNameManifest;
  uint64_t v16;
  NSString *keyNameTicket;
  uint64_t v18;
  NSString *keyNameBoardID;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *keyNameChipID;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *keyNameECID;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *keyNameNonce;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *keyNameProductionMode;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSString *keyNameSecurityDomain;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSString *keyNameSecurityMode;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSString *keyNameSoCLiveNonce;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t i;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  NSObject *log;
  NSObject *v87;
  void *v88;
  BOOL v90;
  id obj;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  id v96;
  UARPDynamicAssetPersonalization *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint8_t v103;
  char v104[15];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t buf[4];
  id v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v4 = self;
  v117 = *MEMORY[0x24BDAC8D0];
  v5 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", self->_url);
  im4mAsset = v4->_im4mAsset;
  v4->_im4mAsset = v5;

  v7 = -[UARPSuperBinaryAsset expandHeadersAndTLVs:](v4->_im4mAsset, "expandHeadersAndTLVs:", a3);
  if (v7)
  {
    v90 = v7;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    options = v4->_options;
    v4->_options = v8;

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    -[UARPSuperBinaryAsset payloads](v4->_im4mAsset, "payloads");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
    if (v93)
    {
      v92 = *(_QWORD *)v110;
      v97 = v4;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v110 != v92)
            objc_enumerationMutation(obj);
          v95 = v10;
          v11 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v10);
          v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v100 = v11;
          -[UARPDynamicAssetPersonalization buildTicketPrefixForPayload:](v4, "buildTicketPrefixForPayload:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@"), v13, CFSTR("Ticket"));
            v14 = objc_claimAutoreleasedReturnValue();
            keyNameManifest = v4->_keyNameManifest;
            v4->_keyNameManifest = (NSString *)v14;

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@%@"), v4->_keyNameManifest);
            v16 = objc_claimAutoreleasedReturnValue();
            keyNameTicket = v4->_keyNameTicket;
            v4->_keyNameTicket = (NSString *)v16;

            objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v4->_keyNameTicket);
          }
          v94 = (void *)v13;
          -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", CFSTR("BoardID"), v11);
          v18 = objc_claimAutoreleasedReturnValue();
          keyNameBoardID = v4->_keyNameBoardID;
          v4->_keyNameBoardID = (NSString *)v18;

          objc_msgSend(v11, "tlvs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403908, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameBoardID && v21)
          {
            objc_msgSend(v21, "valueAsNumber");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v4->_keyNameBoardID);

          }
          -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", CFSTR("ChipID"), v100);
          v23 = objc_claimAutoreleasedReturnValue();
          keyNameChipID = v4->_keyNameChipID;
          v4->_keyNameChipID = (NSString *)v23;

          objc_msgSend(v100, "tlvs");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403909, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameChipID && v26)
          {
            objc_msgSend(v26, "valueAsNumber");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, v4->_keyNameChipID);

          }
          -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", CFSTR("ECID"), v100);
          v28 = objc_claimAutoreleasedReturnValue();
          keyNameECID = v4->_keyNameECID;
          v4->_keyNameECID = (NSString *)v28;

          objc_msgSend(v100, "tlvs");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403910, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameECID && v31)
          {
            objc_msgSend(v31, "valueAsNumber");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v32, v4->_keyNameECID);

          }
          -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", CFSTR("Nonce"), v100);
          v33 = objc_claimAutoreleasedReturnValue();
          keyNameNonce = v4->_keyNameNonce;
          v4->_keyNameNonce = (NSString *)v33;

          objc_msgSend(v100, "tlvs");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403912, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameNonce && v36)
          {
            objc_msgSend(v36, "valueAsData");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v37, v4->_keyNameNonce);

          }
          -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", CFSTR("ProductionMode"), v100);
          v38 = objc_claimAutoreleasedReturnValue();
          keyNameProductionMode = v4->_keyNameProductionMode;
          v4->_keyNameProductionMode = (NSString *)v38;

          objc_msgSend(v100, "tlvs");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403915, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameProductionMode && v41)
          {
            objc_msgSend(v41, "valueAsNumber");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v42, "BOOLValue"))
              v43 = MEMORY[0x24BDBD1C8];
            else
              v43 = MEMORY[0x24BDBD1C0];
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v43, v4->_keyNameProductionMode);

          }
          -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", CFSTR("SecurityDomain"), v100);
          v44 = objc_claimAutoreleasedReturnValue();
          keyNameSecurityDomain = v4->_keyNameSecurityDomain;
          v4->_keyNameSecurityDomain = (NSString *)v44;

          objc_msgSend(v100, "tlvs");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403913, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameSecurityDomain && v47)
          {
            objc_msgSend(v47, "valueAsNumber");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v48, v4->_keyNameSecurityDomain);

          }
          -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", CFSTR("SecurityMode"), v100);
          v49 = objc_claimAutoreleasedReturnValue();
          keyNameSecurityMode = v4->_keyNameSecurityMode;
          v4->_keyNameSecurityMode = (NSString *)v49;

          objc_msgSend(v100, "tlvs");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403914, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameSecurityMode && v52)
          {
            objc_msgSend(v52, "valueAsNumber");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v53, "BOOLValue"))
              v54 = MEMORY[0x24BDBD1C8];
            else
              v54 = MEMORY[0x24BDBD1C0];
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v54, v4->_keyNameSecurityMode);

          }
          -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", CFSTR("SocLiveNonce"), v100);
          v55 = objc_claimAutoreleasedReturnValue();
          keyNameSoCLiveNonce = v4->_keyNameSoCLiveNonce;
          v4->_keyNameSoCLiveNonce = (NSString *)v55;

          objc_msgSend(v100, "tlvs");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403928, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameSoCLiveNonce && v58)
          {
            objc_msgSend(v58, "valueAsNumber");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v59, "BOOLValue"))
              v60 = MEMORY[0x24BDBD1C8];
            else
              v60 = MEMORY[0x24BDBD1C0];
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v60, v4->_keyNameSoCLiveNonce);

          }
          objc_msgSend(v100, "tlvs");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVsWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVsWithType:tlvs:", 2293403920, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v96 = v62;
          v101 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
          if (v101)
          {
            v98 = *(_QWORD *)v106;
            v99 = v12;
            do
            {
              for (i = 0; i != v101; ++i)
              {
                if (*(_QWORD *)v106 != v98)
                  objc_enumerationMutation(v96);
                objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "valueAsTLVs");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403922, v64);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "valueAsString");
                v102 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("Digest"));
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403923, v64);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "valueAsData");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "setObject:forKeyedSubscript:", v69, v67);

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("EPRO"));
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403926, v64);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = v71;
                if (v71)
                {
                  objc_msgSend(v71, "valueAsNumber");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v73, "BOOLValue"))
                    v74 = MEMORY[0x24BDBD1C8];
                  else
                    v74 = MEMORY[0x24BDBD1C0];
                  objc_msgSend(v65, "setObject:forKeyedSubscript:", v74, v70);

                }
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("ESEC"));
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403925, v64);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = v76;
                if (v76)
                {
                  objc_msgSend(v76, "valueAsNumber");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v78, "BOOLValue"))
                    v79 = MEMORY[0x24BDBD1C8];
                  else
                    v79 = MEMORY[0x24BDBD1C0];
                  objc_msgSend(v65, "setObject:forKeyedSubscript:", v79, v75);

                }
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("Trusted"));
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 2293403927, v64);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = v81;
                if (v81)
                {
                  objc_msgSend(v81, "valueAsNumber");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v83, "BOOLValue"))
                    v84 = MEMORY[0x24BDBD1C8];
                  else
                    v84 = MEMORY[0x24BDBD1C0];
                  objc_msgSend(v65, "setObject:forKeyedSubscript:", v84, v80);

                }
                v4 = v97;
                -[UARPDynamicAssetPersonalization buildKey:forPayload:](v97, "buildKey:forPayload:", v102, v100);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = v99;
                objc_msgSend(v99, "setObject:forKeyedSubscript:", v65, v85);

              }
              v101 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
            }
            while (v101);
          }

          log = v4->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            -[UARPDynamicAssetPersonalization processDynamicAsset:].cold.1(&v103, v104, log);
          v87 = v4->_log;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v12;
            _os_log_debug_impl(&dword_212D08000, v87, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v12);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v4->_options, "addObject:", v88);

          v10 = v95 + 1;
        }
        while (v95 + 1 != v93);
        v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
      }
      while (v93);
    }

    LOBYTE(v7) = v90;
  }
  return v7;
}

- (BOOL)tssRequest:(id)a3 error:(id *)a4
{
  NSMutableArray *options;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  options = self->_options;
  v6 = a3;
  -[NSMutableArray firstObject](options, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UARPPersonalizationTSSRequestWithSigningServer(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = -[UARPDynamicAssetPersonalization processTssResponse:](self, "processTssResponse:", v8);
  else
    v9 = 0;

  return v9;
}

- (BOOL)processTssResponse:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSString *v9;
  NSObject *log;
  NSObject *v11;
  NSString *keyNameManifest;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  NSString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_im4mAsset, "payloads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v4)
  {
    v5 = v4;
    v34 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[UARPDynamicAssetPersonalization buildTicketPrefixForPayload:](self, "buildTicketPrefixForPayload:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@"), v8, CFSTR("Ticket"));
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[UARPDynamicAssetPersonalization processTssResponse:]";
          v42 = 2112;
          v43 = v9;
          _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: rebuilt ticket name is %@", buf, 0x16u);
        }
        v11 = self->_log;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          keyNameManifest = self->_keyNameManifest;
          *(_DWORD *)buf = 136315394;
          v41 = "-[UARPDynamicAssetPersonalization processTssResponse:]";
          v42 = 2112;
          v43 = keyNameManifest;
          _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "%s: composed ticket name is %@", buf, 0x16u);
        }
        objc_msgSend(v35, "objectForKeyedSubscript:", v9);
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        v14 = self->_log;
        if (!v13)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetPersonalization processTssResponse:].cold.1(v14, v17, v18, v19, v20, v21, v22, v23);
          goto LABEL_24;
        }
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_212D08000, v14, OS_LOG_TYPE_INFO, "IM4M: TSS Response Bundle is ", buf, 2u);
        }
        v15 = self->_log;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v13;
          _os_log_impl(&dword_212D08000, v15, OS_LOG_TYPE_INFO, "IM4M: %@", buf, 0xCu);
        }
        if ((objc_msgSend(v7, "setPayloadToData:", v13) & 1) == 0)
        {
          v24 = self->_log;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetPersonalization processTssResponse:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
LABEL_24:

          v16 = 0;
          goto LABEL_25;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v16 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_25:

  return v16;
}

- (BOOL)prepareDynamicAsset:(id)a3 error:(id *)a4
{
  UARPSuperBinaryAsset *im4mAsset;

  im4mAsset = self->_im4mAsset;
  if (im4mAsset)
    LOBYTE(im4mAsset) = -[UARPSuperBinaryAsset writeToURL:error:](im4mAsset, "writeToURL:error:", a3, a4);
  return (char)im4mAsset;
}

- (BOOL)compareTssResponse:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *keyNameBoardID;
  NSObject *v14;
  NSString *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSString *keyNameChipID;
  NSObject *v23;
  NSString *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  NSString *v29;
  BOOL v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSString *keyNameECID;
  NSObject *v35;
  NSString *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  NSObject *v40;
  NSString *v41;
  void *v42;
  NSObject *v43;
  NSString *keyNameNonce;
  NSObject *v45;
  NSString *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  NSObject *v50;
  NSString *v51;
  void *v52;
  NSObject *v53;
  NSString *keyNameTicket;
  NSObject *v55;
  NSString *v56;
  const char *v57;
  NSObject *v58;
  uint32_t v59;
  NSObject *v60;
  NSString *v61;
  NSObject *v62;
  NSString *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  NSString *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  -[NSMutableArray firstObject](self->_options, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    v71 = 2112;
    v72 = v7;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s TSS Options %@", buf, 0x16u);
  }
  v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    v71 = 2112;
    v72 = v4;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "%s TSS Response %@", buf, 0x16u);
  }
  -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameBoardID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameBoardID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    keyNameBoardID = self->_keyNameBoardID;
    *(_DWORD *)buf = 136315906;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    v71 = 2112;
    v72 = keyNameBoardID;
    v73 = 2112;
    v74 = v10;
    v75 = 2112;
    v76 = v11;
    _os_log_impl(&dword_212D08000, v12, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
  }
  if (v10 && !v11)
  {
    v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = self->_keyNameBoardID;
      *(_DWORD *)buf = 136315650;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = v15;
      v73 = 2112;
      v74 = v10;
      v16 = "%s %@; %@, missing in TSS response";
      v17 = v14;
      v18 = 32;
LABEL_20:
      _os_log_impl(&dword_212D08000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if ((objc_msgSend(v10, "isEqualToNumber:", v11) & 1) != 0)
  {
    -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameChipID);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameChipID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      keyNameChipID = self->_keyNameChipID;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = keyNameChipID;
      v73 = 2112;
      v74 = v19;
      v75 = 2112;
      v76 = v20;
      _os_log_impl(&dword_212D08000, v21, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }
    if (v19 && !v20)
    {
      v23 = self->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v24;
        v73 = 2112;
        v74 = v19;
        v25 = "%s %@; %@, missing in TSS response";
        v26 = v23;
        v27 = 32;
LABEL_31:
        _os_log_impl(&dword_212D08000, v26, OS_LOG_TYPE_INFO, v25, buf, v27);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if ((objc_msgSend(v19, "isEqualToNumber:", v20) & 1) == 0)
    {
      v40 = self->_log;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = self->_keyNameChipID;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v41;
        v73 = 2112;
        v74 = v19;
        v75 = 2112;
        v76 = v20;
        v25 = "%s %@; NOT EQUAL %@ vs %@";
        v26 = v40;
        v27 = 42;
        goto LABEL_31;
      }
LABEL_32:
      v30 = 0;
LABEL_66:

      goto LABEL_67;
    }
    -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameECID);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameECID);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = self->_log;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      keyNameECID = self->_keyNameECID;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = keyNameECID;
      v73 = 2112;
      v74 = v31;
      v75 = 2112;
      v76 = v32;
      _os_log_impl(&dword_212D08000, v33, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }
    if (v31 && !v32)
    {
      v35 = self->_log;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v36;
        v73 = 2112;
        v74 = v31;
        v37 = "%s %@; %@, missing in TSS response";
        v38 = v35;
        v39 = 32;
LABEL_42:
        _os_log_impl(&dword_212D08000, v38, OS_LOG_TYPE_INFO, v37, buf, v39);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    if ((objc_msgSend(v31, "isEqualToNumber:", v32) & 1) == 0)
    {
      v50 = self->_log;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = self->_keyNameECID;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v51;
        v73 = 2112;
        v74 = v31;
        v75 = 2112;
        v76 = v32;
        v37 = "%s %@; NOT EQUAL %@ vs %@";
        v38 = v50;
        v39 = 42;
        goto LABEL_42;
      }
LABEL_43:
      v30 = 0;
LABEL_65:

      goto LABEL_66;
    }
    v67 = v32;
    -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameNonce);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameNonce);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = self->_log;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      keyNameNonce = self->_keyNameNonce;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = keyNameNonce;
      v73 = 2112;
      v74 = v42;
      v75 = 2112;
      v76 = v68;
      _os_log_impl(&dword_212D08000, v43, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }
    if (v42 && !v68)
    {
      v45 = self->_log;
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
LABEL_54:
        v30 = 0;
LABEL_64:

        v32 = v67;
        goto LABEL_65;
      }
      v46 = self->_keyNameBoardID;
      *(_DWORD *)buf = 136315650;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = v46;
      v73 = 2112;
      v74 = v42;
      v47 = "%s %@; %@, missing in TSS response";
      v48 = v45;
      v49 = 32;
LABEL_53:
      _os_log_impl(&dword_212D08000, v48, OS_LOG_TYPE_INFO, v47, buf, v49);
      goto LABEL_54;
    }
    v66 = v42;
    if ((objc_msgSend(v42, "isEqualToData:", v68) & 1) == 0)
    {
      v60 = self->_log;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = self->_keyNameNonce;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v61;
        v73 = 2112;
        v74 = v42;
        v75 = 2112;
        v76 = v68;
        v47 = "%s %@; NOT EQUAL %@ vs %@";
        v48 = v60;
        v49 = 42;
        goto LABEL_53;
      }
      v30 = 0;
LABEL_63:
      v42 = v66;
      goto LABEL_64;
    }
    -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameTicket);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameTicket);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = self->_log;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      keyNameTicket = self->_keyNameTicket;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = keyNameTicket;
      v73 = 2112;
      v74 = v52;
      v75 = 2112;
      v76 = v65;
      _os_log_impl(&dword_212D08000, v53, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }
    if (!v52 || v65)
    {
      if ((objc_msgSend(v52, "isEqualToNumber:", v65, v65) & 1) != 0)
      {
        v30 = 1;
LABEL_62:

        goto LABEL_63;
      }
      v62 = self->_log;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        v63 = self->_keyNameTicket;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v63;
        v73 = 2112;
        v74 = v52;
        v75 = 2112;
        v76 = v65;
        v57 = "%s %@; NOT EQUAL %@ vs %@";
        v58 = v62;
        v59 = 42;
        goto LABEL_60;
      }
    }
    else
    {
      v55 = self->_log;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v56;
        v73 = 2112;
        v74 = v52;
        v57 = "%s %@; %@, missing in TSS response";
        v58 = v55;
        v59 = 32;
LABEL_60:
        _os_log_impl(&dword_212D08000, v58, OS_LOG_TYPE_INFO, v57, buf, v59);
      }
    }
    v30 = 0;
    goto LABEL_62;
  }
  v28 = self->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = self->_keyNameBoardID;
    *(_DWORD *)buf = 136315906;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    v71 = 2112;
    v72 = v29;
    v73 = 2112;
    v74 = v10;
    v75 = 2112;
    v76 = v11;
    v16 = "%s %@; NOT EQUAL %@ vs %@";
    v17 = v28;
    v18 = 42;
    goto LABEL_20;
  }
LABEL_21:
  v30 = 0;
LABEL_67:

  return v30;
}

- (UARPUploaderEndpoint)endpoint
{
  return (UARPUploaderEndpoint *)objc_getProperty(self, a2, 120, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (NSURL)tatsuServerURL
{
  return (NSURL *)objc_getProperty(self, a2, 136, 1);
}

- (UARPAssetTag)tagIM4M
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIM4M, 0);
  objc_storeStrong((id *)&self->_tatsuServerURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_keyNameSoCLiveNonce, 0);
  objc_storeStrong((id *)&self->_keyNameSecurityMode, 0);
  objc_storeStrong((id *)&self->_keyNameSecurityDomain, 0);
  objc_storeStrong((id *)&self->_keyNameProductionMode, 0);
  objc_storeStrong((id *)&self->_keyNameNonce, 0);
  objc_storeStrong((id *)&self->_keyNameECID, 0);
  objc_storeStrong((id *)&self->_keyNameChipID, 0);
  objc_storeStrong((id *)&self->_keyNameBoardID, 0);
  objc_storeStrong((id *)&self->_keyNameTicket, 0);
  objc_storeStrong((id *)&self->_keyNameManifest, 0);
  objc_storeStrong((id *)&self->_im4mAsset, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)processDynamicAsset:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_212D08000, log, OS_LOG_TYPE_DEBUG, "Personalization Options", buf, 2u);
}

- (void)processTssResponse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a1, a3, "%s: tatsu response provides no manifest", a5, a6, a7, a8, 2u);
}

- (void)processTssResponse:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a1, a3, "%s: could not set payload data to bundle", a5, a6, a7, a8, 2u);
}

@end
