@implementation LBFBiomeManager

- (id)init:(id)a3
{
  id v5;
  LBFBiomeManager *v6;
  BMSource *biomeSource;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LBFBiomeManager;
  v6 = -[LBFBiomeManager init](&v9, sel_init);
  if (v6)
  {
    LBFLoggingUtilsInit();
    objc_storeStrong((id *)&v6->_biomeStream, a3);
    biomeSource = v6->_biomeSource;
    v6->_biomeSource = 0;

  }
  return v6;
}

- (BOOL)writeData:(id)a3
{
  id v4;
  BMSource *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2402F1A24;
  block[3] = &unk_251095338;
  block[4] = self;
  if (onceTokenBiomeSource != -1)
    dispatch_once(&onceTokenBiomeSource, block);
  v5 = self->_biomeSource;
  objc_sync_enter(v5);
  objc_msgSend_sendEvent_(self->_biomeSource, v6, (uint64_t)v4, v7, v8);
  objc_sync_exit(v5);

  return 1;
}

- (id)readData:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *started;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  id v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *, uint64_t, uint64_t, uint64_t);
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)LBFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend_timeIntervalSince1970(v6, v10, v11, v12, v13);
    v15 = v14;
    objc_msgSend_timeIntervalSince1970(v7, v16, v17, v18, v19);
    *(_DWORD *)buf = 134218240;
    v48 = v15;
    v49 = 2048;
    v50 = v20;
    _os_log_impl(&dword_2402DE000, v9, OS_LOG_TYPE_INFO, "Reading Biome events from %f to %f.", buf, 0x16u);

  }
  v21 = objc_alloc(MEMORY[0x24BE0CC98]);
  started = (void *)objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v21, v22, (uint64_t)v6, (uint64_t)v7, -1, -1, 0);
  objc_msgSend_publisherWithOptions_(self->_biomeStream, v24, (uint64_t)started, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = sub_2402F1C88;
  v45[3] = &unk_251095360;
  v46 = v28;
  v40 = v29;
  v41 = 3221225472;
  v42 = sub_2402F1D40;
  v43 = &unk_251095388;
  v44 = v46;
  v30 = v46;
  v33 = (id)objc_msgSend_sinkWithCompletion_receiveInput_(v27, v31, (uint64_t)v45, (uint64_t)&v40, v32);
  v34 = objc_alloc(MEMORY[0x24BDBCE30]);
  v38 = (void *)objc_msgSend_initWithArray_(v34, v35, (uint64_t)v30, v36, v37, v40, v41, v42, v43);

  return v38;
}

- (BOOL)enumerateData:(id)a3 endDate:(id)a4 reversed:(BOOL)a5 shouldContinue:(id)a6
{
  _BOOL8 v6;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *started;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  id v24;
  _QWORD v26[4];
  id v27;

  v6 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BE0CC98];
  v12 = a4;
  v13 = a3;
  v14 = [v11 alloc];
  started = (void *)objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v14, v15, (uint64_t)v13, (uint64_t)v12, -1, -1, v6);

  objc_msgSend_publisherWithOptions_(self->_biomeStream, v17, (uint64_t)started, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_2402F1EF4;
  v26[3] = &unk_2510953D0;
  v27 = v10;
  v21 = v10;
  v24 = (id)objc_msgSend_sinkWithCompletion_shouldContinue_(v20, v22, (uint64_t)&unk_251095070, (uint64_t)v26, v23);

  return 1;
}

- (BMStream)biomeStream
{
  return self->_biomeStream;
}

- (BMSource)biomeSource
{
  return self->_biomeSource;
}

- (void)setBiomeSource:(id)a3
{
  objc_storeStrong((id *)&self->_biomeSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeSource, 0);
  objc_storeStrong((id *)&self->_biomeStream, 0);
}

@end
