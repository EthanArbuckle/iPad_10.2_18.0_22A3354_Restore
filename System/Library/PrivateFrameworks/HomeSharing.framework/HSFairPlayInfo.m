@implementation HSFairPlayInfo

- (HSFairPlayInfo)init
{
  HSFairPlayInfo *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *sapQueue;
  void *v5;
  HSFairPlayInfo *v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HSFairPlayInfo;
  v2 = -[HSFairPlayInfo init](&v10, sel_init);
  if (v2
    && (v3 = dispatch_queue_create("com.apple.itunescloudd.fpsap", 0),
        sapQueue = v2->_sapQueue,
        v2->_sapQueue = (OS_dispatch_queue *)v3,
        sapQueue,
        v5 = malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL),
        v2->_hwInfo = v5,
        !-[HSFairPlayInfo _getHardwareInfo:](v2, "_getHardwareInfo:", v5)))
  {
    v7 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20AA9E000, v7, OS_LOG_TYPE_ERROR, "Error: Unable to determine hardware identifier.", v9, 2u);
    }

    v6 = 0;
  }
  else
  {
    v6 = v2;
  }

  return v6;
}

- (void)dealloc
{
  NSObject *sapQueue;
  void *hwInfo;
  objc_super v5;
  _QWORD block[5];

  sapQueue = self->_sapQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__HSFairPlayInfo_dealloc__block_invoke;
  block[3] = &unk_24C364D10;
  block[4] = self;
  dispatch_sync(sapQueue, block);
  hwInfo = self->_hwInfo;
  if (hwInfo)
    free(hwInfo);
  v5.receiver = self;
  v5.super_class = (Class)HSFairPlayInfo;
  -[HSFairPlayInfo dealloc](&v5, sel_dealloc);
}

- (NSString)deviceGUID
{
  return (NSString *)(id)MGCopyAnswer();
}

- (id)beginNegotiationWithSAPVersion:(unsigned int)a3
{
  NSObject *sapQueue;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[9];
  unsigned int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  sapQueue = self->_sapQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__HSFairPlayInfo_beginNegotiationWithSAPVersion___block_invoke;
  v9[3] = &unk_24C364778;
  v9[4] = self;
  v9[5] = &v11;
  v10 = a3;
  v9[6] = &v23;
  v9[7] = &v19;
  v9[8] = &v15;
  dispatch_sync(sapQueue, v9);
  if (*((_DWORD *)v12 + 6))
  {
    v5 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *((int *)v12 + 6);
      *(_DWORD *)buf = 134217984;
      v28 = v6;
      _os_log_impl(&dword_20AA9E000, v5, OS_LOG_TYPE_ERROR, "FairPlaySAPExchange returned %ld, bailing on SAP setup", buf, 0xCu);
    }

    -[HSFairPlayInfo endSecuritySession](self, "endSecuritySession");
    goto LABEL_7;
  }
  if (*((_BYTE *)v16 + 24) != 1)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v24[3], *((unsigned int *)v20 + 6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v7;
}

- (id)continueNegotationWithSAPVersion:(unsigned int)a3 data:(id)a4 isComplete:(BOOL *)a5
{
  id v8;
  NSObject *sapQueue;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  sapQueue = self->_sapQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HSFairPlayInfo_continueNegotationWithSAPVersion_data_isComplete___block_invoke;
  block[3] = &unk_24C3647A0;
  v22 = a3;
  v18 = &v23;
  block[4] = self;
  v10 = v8;
  v17 = v10;
  v19 = &v35;
  v20 = &v31;
  v21 = &v27;
  dispatch_sync(sapQueue, block);
  if (*((_DWORD *)v24 + 6))
  {
    v11 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *((int *)v24 + 6);
      *(_DWORD *)buf = 134217984;
      v40 = v12;
      _os_log_impl(&dword_20AA9E000, v11, OS_LOG_TYPE_ERROR, "FairPlaySAPExchange returned %ld, bailing on SAP setup", buf, 0xCu);
    }

    -[HSFairPlayInfo endSecuritySession](self, "endSecuritySession");
  }
  else
  {
    if (*((_BYTE *)v28 + 24) == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v36[3], *((unsigned int *)v32 + 6));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (a5 && !*((_BYTE *)v28 + 24))
      *a5 = 1;
    v15 = (void *)v36[3];
    if (v15)
      free(v15);
  }
  v13 = 0;
LABEL_6:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v13;
}

- (void)endSecuritySession
{
  NSObject *sapQueue;
  _QWORD block[5];

  if (self->_session)
  {
    sapQueue = self->_sapQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__HSFairPlayInfo_endSecuritySession__block_invoke;
    block[3] = &unk_24C364D10;
    block[4] = self;
    dispatch_sync(sapQueue, block);
  }
}

- (id)securityInfoForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const void *v10;
  CC_LONG v11;
  NSObject *sapQueue;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD block[9];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v34 = malloc_type_malloc(0x10uLL, 0x2DC8B3A9uLL);
  v9 = objc_retainAutorelease(v8);
  v10 = (const void *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  CC_MD5(v10, v11, (unsigned __int8 *)v32[3]);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  sapQueue = self->_sapQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HSFairPlayInfo_securityInfoForURL___block_invoke;
  block[3] = &unk_24C3647C8;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v31;
  block[7] = &v27;
  block[8] = &v23;
  dispatch_sync(sapQueue, block);
  free((void *)v32[3]);
  if (*((_DWORD *)v20 + 6))
  {
    v13 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *((int *)v20 + 6);
      *(_DWORD *)buf = 134217984;
      v36 = v14;
      _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_ERROR, "FairPlaySAPEncrypt returned %ld, bailing on SAP setup", buf, 0xCu);
    }

    -[HSFairPlayInfo endSecuritySession](self, "endSecuritySession");
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v28[3], *((unsigned int *)v24 + 6));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSFairPlayInfo _hexStringForData:](self, "_hexStringForData:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3
{
  void *v3;
  int HardwareInfoFromDeviceUDID;

  if (!a3)
    return 0;
  v3 = (void *)MGCopyAnswer();
  HardwareInfoFromDeviceUDID = ICFairPlayGetHardwareInfoFromDeviceUDID();

  return HardwareInfoFromDeviceUDID == 0;
}

- (id)_hexStringForData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned int v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 2 * objc_msgSend(v3, "length"));
  v5 = objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v3);
  v7 = objc_msgSend(v6, "bytes");
  if (v5)
  {
    v8 = (unsigned __int8 *)v7;
    do
    {
      v9 = *v8++;
      objc_msgSend(v4, "appendFormat:", CFSTR("%02X"), v9);
      --v5;
    }
    while (v5);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sapQueue, 0);
}

void __37__HSFairPlayInfo_securityInfoForURL___block_invoke(_QWORD *a1)
{
  int v2;

  U4HBs(*(_QWORD *)(a1[4] + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), 16, *(_QWORD *)(a1[7] + 8) + 24, *(_QWORD *)(a1[8] + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v2;
}

void __36__HSFairPlayInfo_endSecuritySession__block_invoke(uint64_t a1)
{
  IPaI1oem5iL(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
}

void __67__HSFairPlayInfo_continueNegotationWithSAPVersion_data_isComplete___block_invoke(uint64_t a1)
{
  int v2;

  Mib5yocT(*(unsigned int *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
}

void __49__HSFairPlayInfo_beginNegotiationWithSAPVersion___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  cp2g1b9ro(*(_QWORD *)(a1 + 32) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v3 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v6 = 134217984;
      v7 = v4;
      _os_log_impl(&dword_20AA9E000, v3, OS_LOG_TYPE_ERROR, "Error: Unable to create security session: %li", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    Mib5yocT(*(unsigned int *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }
}

void __25__HSFairPlayInfo_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
    IPaI1oem5iL(v1);
}

@end
