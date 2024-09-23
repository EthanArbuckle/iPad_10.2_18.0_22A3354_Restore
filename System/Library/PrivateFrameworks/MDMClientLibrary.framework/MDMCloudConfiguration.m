@implementation MDMCloudConfiguration

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_1);
  return (id)sharedConfiguration_config;
}

void __47__MDMCloudConfiguration_refreshDetailsFromDisk__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1D4BF7000, v2, OS_LOG_TYPE_DEBUG, "Refreshing cloud config details.", v15, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MDMCloudConfigurationDetailsFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    MDMCloudConfigurationDetailsFilePath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithContentsOfFile:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMemberQueueDetails:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setMemberQueueDetails:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MDMCloudConfigurationSetAsideDetailsFilePath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0C99D80];
    MDMCloudConfigurationSetAsideDetailsFilePath();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithContentsOfFile:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSetAsideDetails:", v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSetAsideDetails:", 0);
  }
}

- (MDMCloudConfiguration)init
{
  MDMCloudConfiguration *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *memberQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MDMCloudConfiguration;
  v2 = -[MDMCloudConfiguration init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MDMCloudConfiguration member queue", v3);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

void __32__MDMCloudConfiguration_details__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueDetails");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)memberQueueDetails
{
  return self->_memberQueueDetails;
}

- (NSDictionary)details
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[MDMCloudConfiguration memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__MDMCloudConfiguration_details__block_invoke;
  v6[3] = &unk_1E98529A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

uint64_t __44__MDMCloudConfiguration_sharedConfiguration__block_invoke()
{
  MDMCloudConfiguration *v0;
  void *v1;
  const char *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[12];
  int out_token;

  v0 = objc_alloc_init(MDMCloudConfiguration);
  v1 = (void *)sharedConfiguration_config;
  sharedConfiguration_config = (uint64_t)v0;

  out_token = 0;
  v2 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D1BE90], "UTF8String");
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = notify_register_dispatch(v2, &out_token, v3, &__block_literal_global_2);

  if ((_DWORD)v2)
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Could not register for Cloud Configuration change notifications.", v6, 2u);
    }
  }
  return objc_msgSend((id)sharedConfiguration_config, "refreshDetailsFromDisk");
}

- (void)setMemberQueueSetAsideDetails:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueSetAsideDetails, a3);
}

- (void)setMemberQueueDetails:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueDetails, a3);
}

- (void)refreshDetailsFromDisk
{
  NSObject *v3;
  _QWORD block[5];

  -[MDMCloudConfiguration memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MDMCloudConfiguration_refreshDetailsFromDisk__block_invoke;
  block[3] = &unk_1E9852978;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isSupervised
{
  void *v2;
  void *v3;
  char v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BEF8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

void __44__MDMCloudConfiguration_sharedConfiguration__block_invoke_2()
{
  objc_msgSend((id)sharedConfiguration_config, "refreshDetailsFromDisk");
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_3);
}

void __44__MDMCloudConfiguration_sharedConfiguration__block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x1E0D1BE90], 0);

}

- (void)setDetails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MDMCloudConfiguration memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MDMCloudConfiguration_setDetails___block_invoke;
  v7[3] = &unk_1E98529C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __36__MDMCloudConfiguration_setDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueDetails:", *(_QWORD *)(a1 + 40));
}

- (NSDictionary)setAsideDetails
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[MDMCloudConfiguration memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__MDMCloudConfiguration_setAsideDetails__block_invoke;
  v6[3] = &unk_1E98529A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __40__MDMCloudConfiguration_setAsideDetails__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueSetAsideDetails");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSetAsideDetails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MDMCloudConfiguration memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MDMCloudConfiguration_setSetAsideDetails___block_invoke;
  v7[3] = &unk_1E98529C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __44__MDMCloudConfiguration_setSetAsideDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSetAsideDetails:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isTeslaEnrolled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BEB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue") == 1;

  return v4;
}

- (BOOL)isAwaitingConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[MDMCloudConfiguration details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BEB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
  {
    -[MDMCloudConfiguration details](self, "details");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BEC0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isMDMUnremovable
{
  void *v2;
  void *v3;
  char v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BEE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isStoredProfileInstalled
{
  void *v2;
  void *v3;
  char v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)mdmVersionProtocol
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[MDMCloudConfiguration details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D1BF28];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF28]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MDMCloudConfiguration details](self, "details");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &unk_1E985B0E0;
  }
  return v7;
}

- (int)userMode
{
  void *v2;
  void *v3;
  int v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BEF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)diagnosticsUploadURL
{
  return 0;
}

- (id)MAIDUsername
{
  void *v2;
  void *v3;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasMAIDCredential
{
  void *v2;
  void *v3;
  char v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)alreadySignedIntoFaceTime
{
  void *v2;
  void *v3;
  char v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BEA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)language
{
  void *v2;
  void *v3;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)region
{
  void *v2;
  void *v3;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)languageScript
{
  void *v2;
  void *v3;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isProvisionallyEnrolled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MDMCloudConfiguration provisionalEnrollmentExpirationDate](self, "provisionalEnrollmentExpirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "compare:", v2) == -1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)provisionalEnrollmentExpirationDate
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF38]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v4 / 1000.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tvProviderUserToken
{
  return 0;
}

- (id)skipSetupKeys
{
  void *v2;
  void *v3;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)enrollmentServerInfo
{
  void *v2;
  void *v3;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BED0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)enrollmentServerURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[MDMCloudConfiguration details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BED0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BED8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)enrollmentAnchorCertificates
{
  void *v2;
  void *v3;
  void *v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BED0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BEC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)enrollmentServerSupportedFeatures
{
  void *v2;
  void *v3;
  void *v4;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BED0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastDEPPushTokenHash
{
  void *v2;
  void *v3;

  -[MDMCloudConfiguration details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BF10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)canonicalConfigurationWithSupervision:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D1BEF8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D1BEA0];
  v10[0] = v3;
  v10[1] = MEMORY[0x1E0C9AAB0];
  v5 = *MEMORY[0x1E0D1BF30];
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = *MEMORY[0x1E0D1BEB8];
  v10[2] = MEMORY[0x1E0C9AAA0];
  v10[3] = &unk_1E985B0F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  return v7;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (NSDictionary)memberQueueSetAsideDetails
{
  return self->_memberQueueSetAsideDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueSetAsideDetails, 0);
  objc_storeStrong((id *)&self->_memberQueueDetails, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end
