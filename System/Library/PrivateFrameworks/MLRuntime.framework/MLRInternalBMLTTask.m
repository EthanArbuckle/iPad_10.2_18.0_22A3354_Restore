@implementation MLRInternalBMLTTask

- (MLRInternalBMLTTask)initWithTRIClientBackgroundMLTask:(id)a3 factorsState:(id)a4
{
  return -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:](self, "initWithTRIClientBackgroundMLTask:factorsState:recordSet:", a3, a4, 0);
}

- (MLRInternalBMLTTask)initWithTRIClientBackgroundMLTask:(id)a3 factorsState:(id)a4 recordSet:(id)a5
{
  id v9;
  id v10;
  id v11;
  MLRInternalBMLTTask *v12;
  void *v13;
  NSString *v14;
  NSString *pluginID;
  MLRBMLTSchedulingPolicy *v16;
  void *v17;
  MLRBMLTSchedulingPolicy *v18;
  MLRBMLTSchedulingPolicy *policy;
  NSObject *v20;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *syncQueue;
  void *v23;
  NSString *v24;
  NSString *taskID;
  MLRInternalBMLTTask *v26;
  NSObject *v27;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v9, "hasPluginId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.8();
    goto LABEL_28;
  }
  if ((objc_msgSend(v9, "hasTaskId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.7();
    goto LABEL_28;
  }
  if ((objc_msgSend(v9, "hasDeploymentId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.6();
    goto LABEL_28;
  }
  if ((objc_msgSend(v9, "hasProjectId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.5();
    goto LABEL_28;
  }
  if ((objc_msgSend(v9, "hasNamespaceId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.4();
    goto LABEL_28;
  }
  if ((objc_msgSend(v9, "hasSchedulingPolicy") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.3();
    goto LABEL_28;
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.1(v27);
    goto LABEL_28;
  }
  v29.receiver = self;
  v29.super_class = (Class)MLRInternalBMLTTask;
  v12 = -[MLRInternalBMLTTask init](&v29, sel_init);
  self = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_factorsState, a4);
    objc_msgSend(v9, "pluginId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSString *)objc_msgSend(v13, "copy");
    pluginID = self->_pluginID;
    self->_pluginID = v14;

    v16 = [MLRBMLTSchedulingPolicy alloc];
    objc_msgSend(v9, "schedulingPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MLRBMLTSchedulingPolicy initWithTRIPBStruct:](v16, "initWithTRIPBStruct:", v17);
    policy = self->_policy;
    self->_policy = v18;

    if (self->_policy)
    {
      objc_storeStrong((id *)&self->_recordSet, a5);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MLRuntime.MLRInternalBMLTTask.syncQueue", v20);
      syncQueue = self->_syncQueue;
      self->_syncQueue = v21;

      objc_msgSend(v9, "taskId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("_%u"), objc_msgSend(v9, "deploymentId"));
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      taskID = self->_taskID;
      self->_taskID = v24;

      objc_storeStrong((id *)&self->_triBMLT, a3);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.2();
LABEL_28:

    v26 = 0;
    goto LABEL_29;
  }
LABEL_11:
  self = self;
  v26 = self;
LABEL_29:

  return v26;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(BMLT=%@, recordSet=%@)"), v5, self->_triBMLT, self->_recordSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)attachmentsDirURL
{
  void *v3;
  TRIClient *triClient;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;

  -[MLRBMLTSchedulingPolicy attachmentsFactorName](self->_policy, "attachmentsFactorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  triClient = self->_triClient;
  -[TRIClientBackgroundMLTask namespaceId](self->_triBMLT, "namespaceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient levelForFactor:withNamespaceName:](triClient, "levelForFactor:withNamespaceName:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "levelOneOfCase") != 101)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask attachmentsDirURL].cold.3();
    goto LABEL_10;
  }
  objc_msgSend(v6, "directoryValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask attachmentsDirURL].cold.1();
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MLRInternalBMLTTask attachmentsDirURL].cold.2((uint64_t)v3, v6);

  v11 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v6, "directoryValue");
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSObject path](v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v13;
}

- (id)recipeURL
{
  void *v3;
  TRIClient *triClient;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;

  -[MLRBMLTSchedulingPolicy recipeFactorName](self->_policy, "recipeFactorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  triClient = self->_triClient;
  -[TRIClientBackgroundMLTask namespaceId](self->_triBMLT, "namespaceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient levelForFactor:withNamespaceName:](triClient, "levelForFactor:withNamespaceName:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "levelOneOfCase") != 100)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask attachmentsDirURL].cold.3();
    goto LABEL_10;
  }
  objc_msgSend(v6, "fileValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask recipeURL].cold.1();
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MLRInternalBMLTTask recipeURL].cold.2((uint64_t)v3, v6);

  v11 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v6, "fileValue");
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSObject path](v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v13;
}

- (id)taskParametersWithError:(id *)a3
{
  void *v4;
  MLRTaskParameters *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  -[MLRInternalBMLTTask recipeURL](self, "recipeURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = 0;
    v5 = -[MLRTaskParameters initWithURL:error:]([MLRTaskParameters alloc], "initWithURL:error:", v4, &v14);
    v6 = v14;
    if (!a3 || v5)
      goto LABEL_8;
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE2D188];
    v15[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to decode URL=(%@)"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = *MEMORY[0x24BDD1398];
    v16[0] = v9;
    v16[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 5006, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!a3)
    {
      v5 = 0;
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE2D188];
    v17 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to fetch recipeURL"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5003, v9);
    v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
LABEL_9:

  return v5;
}

- (id)taskAttachmentsWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[MLRInternalBMLTTask attachmentsDirURL](self, "attachmentsDirURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    a3 = -[MLRTaskAttachments initWithContentsOfURL:error:]([MLRTaskAttachments alloc], "initWithContentsOfURL:error:", v4, a3);
  }
  else if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BE2D188];
    v10 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to fetch attachmentsDirURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5004, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

- (id)MLRTaskWithError:(id *)a3
{
  void *v5;
  void *v6;
  MLRTask *v7;

  -[MLRInternalBMLTTask taskParametersWithError:](self, "taskParametersWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MLRInternalBMLTTask taskAttachmentsWithError:](self, "taskAttachmentsWithError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = -[MLRTask initWithParameters:attachments:internalTask:]([MLRTask alloc], "initWithParameters:attachments:internalTask:", v5, v6, self);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)fetchDataIfNecessaryWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  DESRecordSet *v8;
  DESRecordSet *recordSet;
  DESRecordSet *v10;
  void *v11;
  DESRecordSet *v12;
  DESRecordSet *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  if (!-[MLRBMLTSchedulingPolicy dodMLRequireDESRecordStore](self->_policy, "dodMLRequireDESRecordStore"))
    return 1;
  -[MLRBMLTSchedulingPolicy dodMLPredicate](self->_policy, "dodMLPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    if (!a3)
      return 0;
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BE2D188];
    v29 = *MEMORY[0x24BDD0FD8];
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[MLRBMLTSchedulingPolicy recipeID](self->_policy, "recipeID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Invalid DodML client predicate for recipeID=%@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    v22 = v16;
    v23 = 1513;
LABEL_8:
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, v20);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "fetchRecordSetSynchronouslyForBundleId:error:", self->_pluginID, a3);
  v8 = (DESRecordSet *)objc_claimAutoreleasedReturnValue();
  recordSet = self->_recordSet;
  self->_recordSet = v8;

  v10 = self->_recordSet;
  -[MLRBMLTSchedulingPolicy dodMLPredicate](self->_policy, "dodMLPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESRecordSet filteredRecordSetWithJSONPredicate:](v10, "filteredRecordSetWithJSONPredicate:", v11);
  v12 = (DESRecordSet *)objc_claimAutoreleasedReturnValue();
  v13 = self->_recordSet;
  self->_recordSet = v12;

  if (-[DESRecordSet count](self->_recordSet, "count"))
  {
    objc_msgSend(MEMORY[0x24BE2D108], "sendEventRecordsMatchedForBundleID:", self->_pluginID);
    return 1;
  }
  if (a3 && !*a3)
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BE2D188];
    v27 = *MEMORY[0x24BDD0FD8];
    v26 = (void *)MEMORY[0x24BDD17C8];
    -[MLRBMLTSchedulingPolicy recipeID](self->_policy, "recipeID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("No matched DES records for recipeID=%@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v22 = v25;
    v23 = 1532;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)downloadFactorsSynchronouslyWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  TRIClient *triClient;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, char, id);
  void *v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[4];

  v46[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_triClient)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("nil TRIClient"), 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v41 = 0;
  v42[0] = &v41;
  v42[1] = 0x3032000000;
  v42[2] = __Block_byref_object_copy_;
  v42[3] = __Block_byref_object_dispose_;
  v43 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v5 = dispatch_semaphore_create(0);
  triClient = self->_triClient;
  -[MLRBMLTSchedulingPolicy recipeFactorName](self->_policy, "recipeFactorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v7;
  -[MLRBMLTSchedulingPolicy attachmentsFactorName](self->_policy, "attachmentsFactorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClientBackgroundMLTask namespaceId](self->_triBMLT, "namespaceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __61__MLRInternalBMLTTask_downloadFactorsSynchronouslyWithError___block_invoke;
  v33 = &unk_24CB92550;
  v35 = &v37;
  v36 = &v41;
  v12 = v5;
  v34 = v12;
  -[TRIClient downloadLevelsForFactors:withNamespace:queue:options:progress:completion:](triClient, "downloadLevelsForFactors:withNamespace:queue:options:progress:completion:", v9, v10, 0, v11, 0, &v30);

  v13 = dispatch_time(0, 1800000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Timeout while downloading factors for task=%@"), self, v30, v31, v32, v33);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2D188], 5008, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v42[0] + 40);
    *(_QWORD *)(v42[0] + 40) = v17;

    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask downloadFactorsSynchronouslyWithError:].cold.2((uint64_t)v42, v19, v20, v21, v22, v23, v24, v25);

  }
  v26 = *((unsigned __int8 *)v38 + 24);
  if (*((_BYTE *)v38 + 24))
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[MLRInternalBMLTTask downloadFactorsSynchronouslyWithError:].cold.1((uint64_t)self, v27);

    -[TRIClient refresh](self->_triClient, "refresh");
  }
  else if (a3)
  {
    *a3 = objc_retainAutorelease(*(id *)(v42[0] + 40));
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v26 != 0;
}

void __61__MLRInternalBMLTTask_downloadFactorsSynchronouslyWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (TRIClient)triClient
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MLRInternalBMLTTask_triClient__block_invoke;
  block[3] = &unk_24CB92578;
  block[4] = self;
  dispatch_sync(syncQueue, block);
  return self->_triClient;
}

void __32__MLRInternalBMLTTask_triClient__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 32))
  {
    objc_msgSend(MEMORY[0x24BEBA900], "clientWithProjectId:factorsState:", objc_msgSend(*(id *)(v1 + 64), "projectId"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

  }
}

- (BOOL)evaluateTargetingExpressionWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  TRIClient *triClient;
  void *v8;
  void *v9;
  char v10;
  id v12;

  v6 = a3;
  triClient = self->_triClient;
  if (!triClient)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("use _triClient before initialization"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v8 = v6;
  -[TRIClientBackgroundMLTask customTargeting](self->_triBMLT, "customTargeting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TRIClient evaluateBMLTTargetingExpression:withParameters:error:](triClient, "evaluateBMLTTargetingExpression:withParameters:error:", v9, v8, a4);

  return v10;
}

- (BOOL)evaluateTargetingExpressionForPlugin:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((-[TRIClientBackgroundMLTask hasCustomTargeting](self->_triBMLT, "hasCustomTargeting") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[MLRInternalBMLTTask evaluateTargetingExpressionForPlugin:error:].cold.2(v9);
    goto LABEL_13;
  }
  -[TRIClientBackgroundMLTask customTargetingKeysArray](self->_triBMLT, "customTargetingKeysArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask evaluateTargetingExpressionForPlugin:error:].cold.1(self, v9);
LABEL_13:
    v13 = 1;
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = v6;
    -[TRIClientBackgroundMLTask customTargetingKeysArray](self->_triBMLT, "customTargetingKeysArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    -[NSObject targetingKeyValuePairsForKeys:error:](v9, "targetingKeyValuePairsForKeys:error:", v10, &v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v33;

    if (v11)
    {
      v32 = v12;
      v13 = -[MLRInternalBMLTTask evaluateTargetingExpressionWithParameters:error:](self, "evaluateTargetingExpressionWithParameters:error:", v11, &v32);
      v14 = v32;

      if (!a4 || v13)
      {
        v12 = v14;
        goto LABEL_28;
      }
      if (v14)
      {
        v15 = v14;
LABEL_21:
        v12 = objc_retainAutorelease(v15);
        v13 = 0;
        *a4 = v12;
LABEL_28:

        goto LABEL_14;
      }
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BE2D188];
      v34 = *MEMORY[0x24BDD0FC8];
      v21 = (void *)MEMORY[0x24BDD17C8];
      -[TRIClientBackgroundMLTask customTargeting](self->_triBMLT, "customTargeting");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Custom targeting evaluated as false, predicate=%@, parameters=%@"), v22, v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v19;
      v26 = v20;
      v27 = 8018;
    }
    else
    {
      if (!a4)
      {
LABEL_27:
        v13 = 0;
        goto LABEL_28;
      }
      if (v12)
      {
        v15 = v12;
        goto LABEL_21;
      }
      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BE2D188];
      v36 = *MEMORY[0x24BDD0FC8];
      v30 = (void *)MEMORY[0x24BDD17C8];
      -[TRIClientBackgroundMLTask customTargeting](self->_triBMLT, "customTargeting");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("Nil parameters returned for predicate=%@"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v28;
      v26 = v29;
      v27 = 8017;
    }
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v27, v24);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v31;

    v12 = 0;
    goto LABEL_27;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_15;
  }
  v17 = (void *)MEMORY[0x24BDD1540];
  v18 = *MEMORY[0x24BE2D188];
  v38 = *MEMORY[0x24BDD0FC8];
  v39[0] = CFSTR("dictionaryWithValuesForKeys:error: not implemented");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 8008, v9);
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
  return v13;
}

- (BOOL)submitTask:(id)a3 result:(id)a4 duration:(double)a5 errorToBeSubmitted:(id)a6 error:(id *)a7
{
  unint64_t v7;

  v7 = -[MLRBMLTSchedulingPolicy upload](self->_policy, "upload", a3, a4, a6, a5);
  if (v7 == 1)
    DESLogAndSetSunsetError();
  return v7 != 1;
}

- (id)performOnPlugin:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  TRIClient *v8;
  TRIClient *triClient;
  id *v10;
  BOOL v11;
  id *v12;
  BOOL v13;
  id *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  id v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  dispatch_semaphore_t v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  NSObject *v60;
  uint64_t *v61;
  uint64_t *v62;
  id v63;
  id v64;
  id v65;
  id obj;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  _QWORD v74[4];
  id v75;
  _BYTE v76[32];
  uint64_t v77;
  const __CFString *v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[2];

  v86[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v73 = 0;
  v74[0] = &v73;
  v74[1] = 0x3032000000;
  v74[2] = __Block_byref_object_copy_;
  v74[3] = __Block_byref_object_dispose_;
  v75 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy_;
  v71 = __Block_byref_object_dispose_;
  v72 = 0;
  v7 = objc_opt_respondsToSelector();
  if (((v7 | objc_opt_respondsToSelector()) & 1) == 0)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v85 = *MEMORY[0x24BDD0FC8];
    v86[0] = CFSTR("performTask:outError: not implemented");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2D188], 8008, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(void **)(v74[0] + 40);
    *(_QWORD *)(v74[0] + 40) = v25;

    v15 = 0;
    v27 = 0.0;
    goto LABEL_18;
  }
  -[MLRInternalBMLTTask triClient](self, "triClient");
  v8 = (TRIClient *)objc_claimAutoreleasedReturnValue();
  triClient = self->_triClient;
  self->_triClient = v8;

  if (!self->_triClient)
  {
    v28 = (void *)MEMORY[0x24BDD1540];
    v83 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nil TRIClient: missing entitlement?"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2D188], 5001, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(void **)(v74[0] + 40);
    *(_QWORD *)(v74[0] + 40) = v31;

    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    v27 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask performOnPlugin:error:].cold.2();
    goto LABEL_17;
  }
  v10 = (id *)(v74[0] + 40);
  obj = *(id *)(v74[0] + 40);
  v11 = -[MLRInternalBMLTTask evaluateTargetingExpressionForPlugin:error:](self, "evaluateTargetingExpressionForPlugin:error:", v6, &obj);
  objc_storeStrong(v10, obj);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    v27 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask performOnPlugin:error:].cold.7();
    goto LABEL_17;
  }
  v12 = (id *)(v74[0] + 40);
  v65 = *(id *)(v74[0] + 40);
  v13 = -[MLRInternalBMLTTask downloadFactorsSynchronouslyWithError:](self, "downloadFactorsSynchronouslyWithError:", &v65);
  objc_storeStrong(v12, v65);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    v27 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask performOnPlugin:error:].cold.6();
    goto LABEL_17;
  }
  v14 = (id *)(v74[0] + 40);
  v64 = *(id *)(v74[0] + 40);
  -[MLRInternalBMLTTask MLRTaskWithError:](self, "MLRTaskWithError:", &v64);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v14, v64);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    v27 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLRInternalBMLTTask performOnPlugin:error:].cold.3();
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "systemUptime");
  v18 = v17;

  v19 = (void *)MEMORY[0x212BD80FC]();
  if ((v7 & 1) != 0)
  {
    v20 = (id *)(v74[0] + 40);
    v63 = *(id *)(v74[0] + 40);
    objc_msgSend(v6, "performTask:outError:", v15, &v63);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v20, v63);
    v22 = v68[5];
    v68[5] = v21;
  }
  else
  {
    v44 = dispatch_semaphore_create(0);
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __45__MLRInternalBMLTTask_performOnPlugin_error___block_invoke;
    v59[3] = &unk_24CB925A0;
    v61 = &v67;
    v62 = &v73;
    v22 = v44;
    v60 = v22;
    objc_msgSend(v6, "performAsyncTask:completionHandler:", v15, v59);
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "systemUptime");
  v47 = v46;

  v27 = v47 - v18;
  if (*(_QWORD *)(v74[0] + 40))
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v48 = objc_opt_class();
      -[MLRInternalBMLTTask performOnPlugin:error:].cold.5(v48, (uint64_t)v74, (uint64_t)buf, v24);
    }
  }
  else
  {
    objc_msgSend((id)v68[5], "JSONResult");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49 == 0;

    if (v50)
    {
      objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = objc_opt_class();
        -[MLRInternalBMLTTask performOnPlugin:error:].cold.4(v54, (uint64_t)buf, v53);
      }

      v55 = (void *)MEMORY[0x24BDD1540];
      v77 = *MEMORY[0x24BDD0FC8];
      v78 = CFSTR("Plugin fail to return JSON result");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2D188], 1511, v24);
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = *(void **)(v74[0] + 40);
      *(_QWORD *)(v74[0] + 40) = v56;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v51 = objc_opt_class();
        v52 = v68[5];
        *(_DWORD *)buf = 138412546;
        v80 = v51;
        v81 = 2112;
        v82 = v52;
        _os_log_impl(&dword_2112F5000, v24, OS_LOG_TYPE_DEFAULT, "Plugin(%@) return result=%@", buf, 0x16u);
      }
    }
  }
LABEL_18:

  v33 = v68[5];
  v34 = *(_QWORD *)(v74[0] + 40);
  v58 = 0;
  v35 = -[MLRInternalBMLTTask submitTask:result:duration:errorToBeSubmitted:error:](self, "submitTask:result:duration:errorToBeSubmitted:error:", v15, v33, v34, &v58, v27);
  v36 = v58;
  v37 = v58;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_opt_class();
      -[MLRInternalBMLTTask performOnPlugin:error:].cold.1(v39, (uint64_t)v37, (uint64_t)v76, v38);
    }

    v40 = (void *)v68[5];
    v68[5] = 0;

    if (!*(_QWORD *)(v74[0] + 40))
      objc_storeStrong((id *)(v74[0] + 40), v36);
  }
  if (a4)
  {
    v41 = *(void **)(v74[0] + 40);
    if (v41)
      *a4 = objc_retainAutorelease(v41);
  }
  objc_msgSend((id)v68[5], "JSONResult");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  return v42;
}

void __45__MLRInternalBMLTTask_performOnPlugin_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)MLRSandboxExtensionRequests
{
  MLRSandboxExtensionRequest *v3;
  void *v4;
  void *v5;
  MLRSandboxExtensionRequest *v6;
  MLRSandboxExtensionRequest *v7;
  void *v8;
  void *v9;
  MLRSandboxExtensionRequest *v10;
  void *v11;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = [MLRSandboxExtensionRequest alloc];
  DESSubmissionLogDirectoryURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLRSandboxExtensionRequest initWithURLs:requireWrite:](v3, "initWithURLs:requireWrite:", v5, 1);
  v14[0] = v6;
  v7 = [MLRSandboxExtensionRequest alloc];
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "recordDirURLsForBundleId:", self->_pluginID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MLRSandboxExtensionRequest initWithURLs:requireWrite:](v7, "initWithURLs:requireWrite:", v9, 1);
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  DESRecordSet *recordSet;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_triBMLT, CFSTR("TRIMLRuntimeEvaluation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_factorsState, CFSTR("TRIFactorsState"));
  recordSet = self->_recordSet;
  if (recordSet)
    objc_msgSend(v5, "encodeObject:forKey:", recordSet, CFSTR("RecordSet"));

}

- (MLRInternalBMLTTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MLRInternalBMLTTask *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRIMLRuntimeEvaluation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRIFactorsState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecordSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:](self, "initWithTRIClientBackgroundMLTask:factorsState:recordSet:", v5, v6, v7);
  return v8;
}

- (NSString)pluginID
{
  return self->_pluginID;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (TRIFactorsState)factorsState
{
  return self->_factorsState;
}

- (MLRBMLTSchedulingPolicy)policy
{
  return self->_policy;
}

- (DESRecordSet)recordSet
{
  return self->_recordSet;
}

- (TRIClientBackgroundMLTask)triBMLT
{
  return self->_triBMLT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triBMLT, 0);
  objc_storeStrong((id *)&self->_recordSet, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_factorsState, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_pluginID, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

- (void)initWithTRIClientBackgroundMLTask:(os_log_t)log factorsState:recordSet:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2112F5000, log, OS_LOG_TYPE_ERROR, "Invalid TRIFactorsState: nil factorsState", v1, 2u);
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Failed to create MLRBMLTSchedulingPolicy with TRIClientBackgroundMLTask=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Invalid TRIClientBackgroundMLTask: no schedulingPolicy, TRIClientBackgroundMLTask=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Invalid TRIClientBackgroundMLTask: no NamespaceId with bmlt=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Invalid TRIClientBackgroundMLTask: no ProjectId with bmlt=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Invalid TRIClientBackgroundMLTask: no DeploymentId with bmlt=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Invalid TRIClientBackgroundMLTask: no TaskId with bmlt=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Invalid TRIClientBackgroundMLTask: no PluginId with bmlt=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)attachmentsDirURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Unexpected type for factor %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)recipeURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a2, "fileValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_2112F5000, v4, v5, "path for %@: (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)downloadFactorsSynchronouslyWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 24);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_2112F5000, a2, OS_LOG_TYPE_DEBUG, "Finish downloading factors for %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)downloadFactorsSynchronouslyWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, a2, a3, "Fail to download factors with error=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)evaluateTargetingExpressionForPlugin:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "triBMLT");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customTargeting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_2112F5000, a2, v5, "Ignore customTargeting=(%@) with empty customTargetingKeysArray", v6);

  OUTLINED_FUNCTION_7();
}

- (void)evaluateTargetingExpressionForPlugin:(os_log_t)log error:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2112F5000, log, OS_LOG_TYPE_DEBUG, "Skip targeting expression evaluation: no predicate", v1, 2u);
}

- (void)performOnPlugin:(uint64_t)a3 error:(NSObject *)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_5(&dword_2112F5000, a4, a3, "Fail to submit result for plugin(%@) with error=%@", (uint8_t *)a3);
}

- (void)performOnPlugin:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_2112F5000, v0, v1, "Fail to create TRIClient: task=%@, error=%@");
  OUTLINED_FUNCTION_2();
}

- (void)performOnPlugin:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_2112F5000, v0, v1, "Fail to load task parameters for task=%@ with error=%@");
  OUTLINED_FUNCTION_2();
}

- (void)performOnPlugin:(NSObject *)a3 error:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_2112F5000, a3, (uint64_t)a3, "Plugin(%@) fail to return JSON result.", (uint8_t *)a2);
}

- (void)performOnPlugin:(uint64_t)a3 error:(NSObject *)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v4;
  OUTLINED_FUNCTION_5(&dword_2112F5000, a4, a3, "Plugin(%@) return error=%@", (uint8_t *)a3);
}

- (void)performOnPlugin:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_2112F5000, v0, v1, "Fail to download factors for task=%@ with error=%@");
  OUTLINED_FUNCTION_2();
}

- (void)performOnPlugin:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_2112F5000, v0, v1, "Fail to evaluate custom targeting expression for task=%@ with error=%@");
  OUTLINED_FUNCTION_2();
}

@end
