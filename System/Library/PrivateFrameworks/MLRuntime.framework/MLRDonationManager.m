@implementation MLRDonationManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_0);
  return (id)defaultManager_donationManagerClient;
}

void __36__MLRDonationManager_defaultManager__block_invoke()
{
  MLRDonationManager *v0;
  void *v1;

  v0 = objc_alloc_init(MLRDonationManager);
  v1 = (void *)defaultManager_donationManagerClient;
  defaultManager_donationManagerClient = (uint64_t)v0;

}

- (MLRDonationManager)init
{
  MLRDonationManager *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MLRDonationManager;
  v2 = -[MLRDonationManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)encodeAndUploadToDediscoWithIdentifier:(id)a3 measurements:(id)a4 withEncodingSchemas:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString **v29;
  uint64_t *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD block[5];
  id v50;
  id v51;
  id v52;
  id v53;
  void (**v54)(id, void *);
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLRDonationManager encodeAndUploadToDediscoWithIdentifier:measurements:withEncodingSchemas:metadata:completion:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BE2D188];
    v59 = *MEMORY[0x24BDD0FC8];
    v60[0] = CFSTR("identifier must not be nil.");
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = (const __CFString **)v60;
    v30 = &v59;
    goto LABEL_14;
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MLRDonationManager encodeAndUploadToDediscoWithIdentifier:measurements:withEncodingSchemas:metadata:completion:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);

    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BE2D188];
    v57 = *MEMORY[0x24BDD0FC8];
    v58 = CFSTR("measurements must be not be nil.");
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = &v58;
    v30 = &v57;
    goto LABEL_14;
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MLRDonationManager encodeAndUploadToDediscoWithIdentifier:measurements:withEncodingSchemas:metadata:completion:].cold.3(v39, v40, v41, v42, v43, v44, v45, v46);

    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BE2D188];
    v55 = *MEMORY[0x24BDD0FC8];
    v56 = CFSTR("encodingSchemas must be not be nil.");
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = &v56;
    v30 = &v55;
LABEL_14:
    objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 1400, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v48);

    goto LABEL_15;
  }
  -[MLRDonationManager queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __114__MLRDonationManager_encodeAndUploadToDediscoWithIdentifier_measurements_withEncodingSchemas_metadata_completion___block_invoke;
  block[3] = &unk_24CB92528;
  block[4] = self;
  v50 = v12;
  v51 = v13;
  v52 = v14;
  v53 = v15;
  v54 = v16;
  dispatch_async(v17, block);

LABEL_15:
}

void __114__MLRDonationManager_encodeAndUploadToDediscoWithIdentifier_measurements_withEncodingSchemas_metadata_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v11[0] = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[7];
  v6 = a1[8];
  v10 = 0;
  v7 = objc_msgSend(v2, "record:data:encodingSchema:metadata:errorOut:", v3, v4, v5, v6, &v10);
  v8 = v10;

  if (v8 || (v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __114__MLRDonationManager_encodeAndUploadToDediscoWithIdentifier_measurements_withEncodingSchemas_metadata_completion___block_invoke_cold_1((uint64_t)v8, v9);

  }
  (*(void (**)(void))(a1[9] + 16))();

}

- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v14;
    _os_log_debug_impl(&dword_2112F5000, v15, OS_LOG_TYPE_DEBUG, "Recording key=%@, data=%@, encodingSchema=%@, metadata=%@", buf, 0x2Au);
  }

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", CFSTR("decimal"));

  if (v17
    || (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "isEqual:", CFSTR("fedstats")),
        v18,
        v19))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("encodingParameters"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_opt_new();
    v22 = objc_msgSend(v21, "record:data:encodingSchema:metadata:errorOut:", v11, v12, v20, v14, a7);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MLRDonationManager record:data:encodingSchema:metadata:errorOut:].cold.1(v23);

    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BE2D188];
    v27 = *MEMORY[0x24BDD0FC8];
    v28 = CFSTR("The encodingSchema type has to be either decimal or fedstats.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 1400, v20);
    v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)encodeAndUploadToDediscoWithIdentifier:(uint64_t)a3 measurements:(uint64_t)a4 withEncodingSchemas:(uint64_t)a5 metadata:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "The identifier must not be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)encodeAndUploadToDediscoWithIdentifier:(uint64_t)a3 measurements:(uint64_t)a4 withEncodingSchemas:(uint64_t)a5 metadata:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "measurements must be not be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)encodeAndUploadToDediscoWithIdentifier:(uint64_t)a3 measurements:(uint64_t)a4 withEncodingSchemas:(uint64_t)a5 metadata:(uint64_t)a6 completion:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "encodingSchemas must be not be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __114__MLRDonationManager_encodeAndUploadToDediscoWithIdentifier_measurements_withEncodingSchemas_metadata_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2112F5000, a2, OS_LOG_TYPE_ERROR, "dedisco donation hit error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)record:(os_log_t)log data:encodingSchema:metadata:errorOut:.cold.1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 138412546;
  v2 = CFSTR("decimal");
  v3 = 2112;
  v4 = CFSTR("fedstats");
  _os_log_error_impl(&dword_2112F5000, log, OS_LOG_TYPE_ERROR, "The encodingSchema type has to be either %@ or %@.", (uint8_t *)&v1, 0x16u);
}

@end
