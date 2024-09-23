@implementation C2MetricOptions

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testBehavior_reportMetric, 0);
  objc_storeStrong(&self->_didCompleteWithError, 0);
  objc_storeStrong((id *)&self->_clientOperations, 0);
  objc_storeStrong((id *)&self->_operationGroups, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_containerScopedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_containerScopedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_databaseScope, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_clientProcessBundleId, 0);
  objc_storeStrong((id *)&self->_clientProcessVersion, 0);
  objc_storeStrong((id *)&self->_c2MetricsEndpoint, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  C2MetricOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = +[C2MetricOptions allocWithZone:](C2MetricOptions, "allocWithZone:", a3);
  if (v4)
  {
    -[C2MetricOptions c2MetricsEndpoint](self, "c2MetricsEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setC2MetricsEndpoint:](v4, "setC2MetricsEndpoint:", v5);

    -[C2MetricOptions setReportFrequency:](v4, "setReportFrequency:", -[C2MetricOptions reportFrequency](self, "reportFrequency"));
    -[C2MetricOptions setReportFrequencyBase:](v4, "setReportFrequencyBase:", -[C2MetricOptions reportFrequencyBase](self, "reportFrequencyBase"));
    -[C2MetricOptions setReportClientOperationFrequency:](v4, "setReportClientOperationFrequency:", -[C2MetricOptions reportClientOperationFrequency](self, "reportClientOperationFrequency"));
    -[C2MetricOptions setReportClientOperationFrequencyBase:](v4, "setReportClientOperationFrequencyBase:", -[C2MetricOptions reportClientOperationFrequencyBase](self, "reportClientOperationFrequencyBase"));
    -[C2MetricOptions setReportOperationGroupFrequency:](v4, "setReportOperationGroupFrequency:", -[C2MetricOptions reportOperationGroupFrequency](self, "reportOperationGroupFrequency"));
    -[C2MetricOptions setReportOperationGroupFrequencyBase:](v4, "setReportOperationGroupFrequencyBase:", -[C2MetricOptions reportOperationGroupFrequencyBase](self, "reportOperationGroupFrequencyBase"));
    -[C2MetricOptions clientProcessVersion](self, "clientProcessVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setClientProcessVersion:](v4, "setClientProcessVersion:", v6);

    -[C2MetricOptions clientProcessBundleId](self, "clientProcessBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setClientProcessBundleId:](v4, "setClientProcessBundleId:", v7);

    -[C2MetricOptions container](self, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setContainer:](v4, "setContainer:", v8);

    -[C2MetricOptions environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setEnvironment:](v4, "setEnvironment:", v9);

    -[C2MetricOptions databaseScope](self, "databaseScope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setDatabaseScope:](v4, "setDatabaseScope:", v10);

    -[C2MetricOptions setAnonymous:](v4, "setAnonymous:", -[C2MetricOptions anonymous](self, "anonymous"));
    -[C2MetricOptions containerScopedUserIdentifier](self, "containerScopedUserIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setContainerScopedUserIdentifier:](v4, "setContainerScopedUserIdentifier:", v11);

    -[C2MetricOptions containerScopedDeviceIdentifier](self, "containerScopedDeviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setContainerScopedDeviceIdentifier:](v4, "setContainerScopedDeviceIdentifier:", v12);

    -[C2MetricOptions applicationBundleIdentifierOverrideForContainerAccess](self, "applicationBundleIdentifierOverrideForContainerAccess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setApplicationBundleIdentifierOverrideForContainerAccess:](v4, "setApplicationBundleIdentifierOverrideForContainerAccess:", v13);

    -[C2MetricOptions applicationBundleIdentifierOverrideForNetworkAttribution](self, "applicationBundleIdentifierOverrideForNetworkAttribution");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setApplicationBundleIdentifierOverrideForNetworkAttribution:](v4, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v14);

    -[C2MetricOptions operationGroups](self, "operationGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setOperationGroups:](v4, "setOperationGroups:", v15);

    -[C2MetricOptions clientOperations](self, "clientOperations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setClientOperations:](v4, "setClientOperations:", v16);

    -[C2MetricOptions setPushTrigger:](v4, "setPushTrigger:", -[C2MetricOptions pushTrigger](self, "pushTrigger"));
    -[C2MetricOptions didCompleteWithError](self, "didCompleteWithError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setDidCompleteWithError:](v4, "setDidCompleteWithError:", v17);

    -[C2MetricOptions testBehavior_reportMetric](self, "testBehavior_reportMetric");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOptions setTestBehavior_reportMetric:](v4, "setTestBehavior_reportMetric:", v18);

    -[C2MetricOptions setReportFrequencyRandomValue:](v4, "setReportFrequencyRandomValue:", -[C2MetricOptions reportFrequencyRandomValue](self, "reportFrequencyRandomValue"));
  }
  return v4;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

- (void)setC2MetricsEndpoint:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8
    || (objc_msgSend(v8, "scheme"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", CFSTR("https")),
        v5,
        v7 = v8,
        v6))
  {
    objc_storeStrong((id *)&self->_c2MetricsEndpoint, a3);
    v7 = v8;
  }

}

- (NSURL)c2MetricsEndpoint
{
  return self->_c2MetricsEndpoint;
}

- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3
{
  self->_reportOperationGroupFrequencyBase = a3;
}

- (void)setReportOperationGroupFrequency:(unint64_t)a3
{
  self->_reportOperationGroupFrequency = a3;
}

- (void)setReportClientOperationFrequencyBase:(unint64_t)a3
{
  self->_reportClientOperationFrequencyBase = a3;
}

- (void)setReportClientOperationFrequency:(unint64_t)a3
{
  self->_reportClientOperationFrequency = a3;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setClientProcessVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setClientProcessBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)generateCloudKitInfo
{
  C2MPCloudKitInfo *v3;
  C2MPCloudKitInfo *v4;
  void *v5;
  NSUInteger v6;
  uint64_t v7;
  NSArray *operationGroups;
  C2MPCloudKitInfo *v9;
  NSArray *clientOperations;
  C2MPCloudKitInfo *v11;
  C2MPCloudKitInfo *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  C2MetricOptions *v18;
  id v19;
  C2MPCloudKitInfo *v20;
  _QWORD v21[5];
  C2MPCloudKitInfo *v22;
  id v23;

  v3 = objc_alloc_init(C2MPCloudKitInfo);
  v4 = v3;
  if (v3)
  {
    -[C2MPCloudKitInfo setClientProcessVersion:](v3, "setClientProcessVersion:", self->_clientProcessVersion);
    -[C2MPCloudKitInfo setClientBundleId:](v4, "setClientBundleId:", self->_clientProcessBundleId);
    -[C2MPCloudKitInfo setContainer:](v4, "setContainer:", self->_container);
    -[C2MPCloudKitInfo setEnvironment:](v4, "setEnvironment:", self->_environment);
    -[C2MPCloudKitInfo setDatabaseScope:](v4, "setDatabaseScope:", self->_databaseScope);
    -[C2MPCloudKitInfo setAnonymous:](v4, "setAnonymous:", self->_anonymous);
    -[C2MPCloudKitInfo setContainerScopedUserIdentifier:](v4, "setContainerScopedUserIdentifier:", self->_containerScopedUserIdentifier);
    -[C2MPCloudKitInfo setContainerScopedDeviceIdentifier:](v4, "setContainerScopedDeviceIdentifier:", self->_containerScopedDeviceIdentifier);
    -[C2MPCloudKitInfo setApplicationBundleIdentifierOverrideForContainerAccess:](v4, "setApplicationBundleIdentifierOverrideForContainerAccess:", self->_applicationBundleIdentifierOverrideForContainerAccess);
    -[C2MPCloudKitInfo setApplicationBundleIdentifierOverrideForNetworkAttribution:](v4, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", self->_applicationBundleIdentifierOverrideForNetworkAttribution);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 1282, 0);
    v6 = -[NSArray count](self->_operationGroups, "count");
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      operationGroups = self->_operationGroups;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __39__C2MetricOptions_generateCloudKitInfo__block_invoke;
      v21[3] = &unk_1E9898630;
      v21[4] = self;
      v9 = v4;
      v22 = v9;
      v23 = v5;
      -[NSArray enumerateObjectsUsingBlock:](operationGroups, "enumerateObjectsUsingBlock:", v21);
      -[C2MPCloudKitInfo setReportOperationGroupFrequency:](v9, "setReportOperationGroupFrequency:", self->_reportOperationGroupFrequency);
      -[C2MPCloudKitInfo setReportOperationGroupFrequencyBase:](v9, "setReportOperationGroupFrequencyBase:", self->_reportOperationGroupFrequencyBase);

    }
    if (-[NSArray count](self->_clientOperations, "count"))
    {
      clientOperations = self->_clientOperations;
      v14 = v7;
      v15 = 3221225472;
      v16 = __39__C2MetricOptions_generateCloudKitInfo__block_invoke_2;
      v17 = &unk_1E9898658;
      v18 = self;
      v19 = v5;
      v11 = v4;
      v20 = v11;
      -[NSArray enumerateObjectsUsingBlock:](clientOperations, "enumerateObjectsUsingBlock:", &v14);
      -[C2MPCloudKitInfo setReportClientOperationFrequency:](v11, "setReportClientOperationFrequency:", self->_reportClientOperationFrequency, v14, v15, v16, v17, v18);
      -[C2MPCloudKitInfo setReportClientOperationFrequencyBase:](v11, "setReportClientOperationFrequencyBase:", self->_reportClientOperationFrequencyBase);

    }
    v12 = v4;

  }
  return v4;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  self->_reportFrequencyBase = a3;
}

- (void)setReportFrequency:(unint64_t)a3
{
  self->_reportFrequency = a3;
}

- (void)setOperationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setDatabaseScope:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setClientOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int)generateTriggerWithResponseHeader:(unsigned __int8)a3
{
  int v3;
  void *v5;
  int v6;
  unint64_t reportFrequencyBase;
  unint64_t reportFrequency;
  NSArray *clientOperations;
  uint64_t v10;
  NSArray *operationGroups;
  int v12;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "c2DefaultsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("C2Metrics"));

  if (v6)
    *((_DWORD *)v17 + 6) |= 1u;
  if (v3)
    *((_DWORD *)v17 + 6) |= 4u;
  if (self->_pushTrigger)
    *((_DWORD *)v17 + 6) |= 0x20u;
  reportFrequencyBase = self->_reportFrequencyBase;
  if (reportFrequencyBase)
  {
    reportFrequency = self->_reportFrequency;
    if (reportFrequency)
    {
      if (self->_reportFrequencyRandomValue % reportFrequencyBase < reportFrequency)
        *((_DWORD *)v17 + 6) |= 2u;
      clientOperations = self->_clientOperations;
      v10 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __53__C2MetricOptions_generateTriggerWithResponseHeader___block_invoke;
      v15[3] = &unk_1E9898680;
      v15[4] = self;
      v15[5] = &v16;
      -[NSArray enumerateObjectsUsingBlock:](clientOperations, "enumerateObjectsUsingBlock:", v15);
      operationGroups = self->_operationGroups;
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __53__C2MetricOptions_generateTriggerWithResponseHeader___block_invoke_2;
      v14[3] = &unk_1E98986A8;
      v14[4] = self;
      v14[5] = &v16;
      -[NSArray enumerateObjectsUsingBlock:](operationGroups, "enumerateObjectsUsingBlock:", v14);
    }
  }
  v12 = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return v12;
}

- (void)setPushTrigger:(BOOL)a3
{
  self->_pushTrigger = a3;
}

- (void)setContainerScopedUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setContainerScopedDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)didCompleteWithError
{
  return self->_didCompleteWithError;
}

- (void)setDidCompleteWithError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)testBehavior_reportMetric
{
  return self->_testBehavior_reportMetric;
}

- (void)setTestBehavior_reportMetric:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setReportFrequencyRandomValue:(unsigned int)a3
{
  self->_reportFrequencyRandomValue = a3;
}

- (unint64_t)reportOperationGroupFrequency
{
  return self->_reportOperationGroupFrequency;
}

- (unint64_t)reportOperationGroupFrequencyBase
{
  return self->_reportOperationGroupFrequencyBase;
}

- (unsigned)reportFrequencyRandomValue
{
  return self->_reportFrequencyRandomValue;
}

- (unint64_t)reportClientOperationFrequency
{
  return self->_reportClientOperationFrequency;
}

- (unint64_t)reportClientOperationFrequencyBase
{
  return self->_reportClientOperationFrequencyBase;
}

- (BOOL)pushTrigger
{
  return self->_pushTrigger;
}

- (NSArray)operationGroups
{
  return self->_operationGroups;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSString)databaseScope
{
  return self->_databaseScope;
}

- (NSString)container
{
  return self->_container;
}

- (NSString)containerScopedUserIdentifier
{
  return self->_containerScopedUserIdentifier;
}

- (NSString)containerScopedDeviceIdentifier
{
  return self->_containerScopedDeviceIdentifier;
}

- (NSString)clientProcessVersion
{
  return self->_clientProcessVersion;
}

- (NSString)clientProcessBundleId
{
  return self->_clientProcessBundleId;
}

- (NSArray)clientOperations
{
  return self->_clientOperations;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess;
}

void __39__C2MetricOptions_generateCloudKitInfo__block_invoke_2(uint64_t a1, void *a2)
{
  C2MPCloudKitOperationInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMapTable *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_alloc_init(C2MPCloudKitOperationInfo);
  objc_msgSend(v11, "operationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPCloudKitOperationInfo setOperationId:](v3, "setOperationId:", v4);

  objc_msgSend(v11, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPCloudKitOperationInfo setOperationType:](v3, "setOperationType:", v5);

  -[C2MPCloudKitOperationInfo setOperationTriggered:](v3, "setOperationTriggered:", objc_msgSend(*(id *)(a1 + 32), "clientOperationTriggered:", v11));
  objc_msgSend(v11, "operationGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(NSMapTable **)(a1 + 40);
    objc_msgSend(v11, "operationGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "operationGroupId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = NSMapGet(v7, v9);

    if (v10)
      -[C2MPCloudKitOperationInfo setOperationGroupIndex:](v3, "setOperationGroupIndex:", ((_DWORD)v10 - 1));
  }
  if (v3)
    objc_msgSend(*(id *)(a1 + 48), "addClientOperation:", v3);

}

- (BOOL)clientOperationTriggered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t reportClientOperationFrequency;
  unint64_t *p_reportClientOperationFrequency;
  unint64_t v11;
  BOOL v12;

  v4 = a3;
  v5 = v4;
  if (!self->_reportClientOperationFrequencyBase)
    goto LABEL_6;
  if (!self->_reportClientOperationFrequency)
    goto LABEL_6;
  objc_msgSend(v4, "operationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  objc_msgSend(v5, "operationId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "c2UniformlyDistributedIdentifier");
  p_reportClientOperationFrequency = &self->_reportClientOperationFrequency;
  reportClientOperationFrequency = self->_reportClientOperationFrequency;
  v11 = v8 % p_reportClientOperationFrequency[1];

  if (v11 < reportClientOperationFrequency)
    v12 = 1;
  else
LABEL_6:
    v12 = 0;

  return v12;
}

void __39__C2MetricOptions_generateCloudKitInfo__block_invoke(uint64_t a1, void *a2)
{
  C2MPCloudKitOperationGroupInfo *v3;
  void *v4;
  void *v5;
  NSMapTable *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_alloc_init(C2MPCloudKitOperationGroupInfo);
  objc_msgSend(v9, "operationGroupId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPCloudKitOperationGroupInfo setOperationGroupId:](v3, "setOperationGroupId:", v4);

  objc_msgSend(v9, "operationGroupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPCloudKitOperationGroupInfo setOperationGroupName:](v3, "setOperationGroupName:", v5);

  -[C2MPCloudKitOperationGroupInfo setOperationGroupTriggered:](v3, "setOperationGroupTriggered:", objc_msgSend(*(id *)(a1 + 32), "operationGroupTriggered:", v9));
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "addOperationGroup:", v3);
    v6 = *(NSMapTable **)(a1 + 48);
    objc_msgSend(v9, "operationGroupId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "operationGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSMapInsert(v6, v7, (const void *)objc_msgSend(v8, "count"));

  }
}

- (BOOL)operationGroupTriggered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t reportOperationGroupFrequency;
  unint64_t *p_reportOperationGroupFrequency;
  unint64_t v11;
  BOOL v12;

  v4 = a3;
  v5 = v4;
  if (!self->_reportOperationGroupFrequencyBase)
    goto LABEL_6;
  if (!self->_reportOperationGroupFrequency)
    goto LABEL_6;
  objc_msgSend(v4, "operationGroupId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  objc_msgSend(v5, "operationGroupId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "c2UniformlyDistributedIdentifier");
  p_reportOperationGroupFrequency = &self->_reportOperationGroupFrequency;
  reportOperationGroupFrequency = self->_reportOperationGroupFrequency;
  v11 = v8 % p_reportOperationGroupFrequency[1];

  if (v11 < reportOperationGroupFrequency)
    v12 = 1;
  else
LABEL_6:
    v12 = 0;

  return v12;
}

- (void)rollReportFrequencyRandomValue
{
  self->_reportFrequencyRandomValue = arc4random();
}

- (NSString)headerValueForTriggers
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), -[C2MetricOptions generateTriggerWithResponseHeader:](self, "generateTriggerWithResponseHeader:", 0));
}

- (C2MetricOptions)init
{
  C2MetricOptions *v2;
  C2MetricOptions *v3;
  NSURL *c2MetricsEndpoint;
  NSString *clientProcessVersion;
  NSString *clientProcessBundleId;
  NSString *container;
  NSString *environment;
  NSString *databaseScope;
  NSString *containerScopedUserIdentifier;
  NSString *containerScopedDeviceIdentifier;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  NSArray *operationGroups;
  NSArray *clientOperations;
  id didCompleteWithError;
  id testBehavior_reportMetric;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)C2MetricOptions;
  v2 = -[C2MetricOptions init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    c2MetricsEndpoint = v2->_c2MetricsEndpoint;
    v2->_c2MetricsEndpoint = 0;

    *(_OWORD *)&v3->_reportOperationGroupFrequency = 0u;
    *(_OWORD *)&v3->_reportClientOperationFrequency = 0u;
    *(_OWORD *)&v3->_reportFrequency = 0u;
    clientProcessVersion = v3->_clientProcessVersion;
    v3->_clientProcessVersion = 0;

    clientProcessBundleId = v3->_clientProcessBundleId;
    v3->_clientProcessBundleId = 0;

    container = v3->_container;
    v3->_container = 0;

    environment = v3->_environment;
    v3->_environment = 0;

    databaseScope = v3->_databaseScope;
    v3->_databaseScope = 0;

    v3->_anonymous = 1;
    containerScopedUserIdentifier = v3->_containerScopedUserIdentifier;
    v3->_containerScopedUserIdentifier = 0;

    containerScopedDeviceIdentifier = v3->_containerScopedDeviceIdentifier;
    v3->_containerScopedDeviceIdentifier = 0;

    applicationBundleIdentifierOverrideForContainerAccess = v3->_applicationBundleIdentifierOverrideForContainerAccess;
    v3->_applicationBundleIdentifierOverrideForContainerAccess = 0;

    applicationBundleIdentifierOverrideForNetworkAttribution = v3->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v3->_applicationBundleIdentifierOverrideForNetworkAttribution = 0;

    operationGroups = v3->_operationGroups;
    v3->_operationGroups = 0;

    clientOperations = v3->_clientOperations;
    v3->_clientOperations = 0;

    v3->_pushTrigger = 0;
    didCompleteWithError = v3->_didCompleteWithError;
    v3->_didCompleteWithError = 0;

    testBehavior_reportMetric = v3->_testBehavior_reportMetric;
    v3->_testBehavior_reportMetric = 0;

    v3->_reportFrequencyRandomValue = arc4random();
  }
  return v3;
}

uint64_t __53__C2MetricOptions_generateTriggerWithResponseHeader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "clientOperationTriggered:", a2);
  if ((_DWORD)result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 8u;
    if (a4)
      *a4 = 1;
  }
  return result;
}

uint64_t __53__C2MetricOptions_generateTriggerWithResponseHeader___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "operationGroupTriggered:", a2);
  if ((_DWORD)result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x10u;
    if (a4)
      *a4 = 1;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  C2MetricOptions *v4;
  C2MetricOptions *v5;
  NSURL *c2MetricsEndpoint;
  uint64_t v7;
  void *v8;
  NSURL *v9;
  void *v10;
  int v11;
  BOOL v12;
  unint64_t reportFrequency;
  unint64_t reportFrequencyBase;
  unint64_t reportClientOperationFrequency;
  unint64_t reportClientOperationFrequencyBase;
  unint64_t reportOperationGroupFrequency;
  unint64_t reportOperationGroupFrequencyBase;
  NSString *clientProcessVersion;
  uint64_t v20;
  NSString *v21;
  void *v22;
  int v23;
  NSString *clientProcessBundleId;
  uint64_t v25;
  NSString *v26;
  void *v27;
  int v28;
  NSString *container;
  uint64_t v30;
  NSString *v31;
  void *v32;
  int v33;
  NSString *environment;
  uint64_t v35;
  NSString *v36;
  void *v37;
  int v38;
  NSString *databaseScope;
  uint64_t v40;
  NSString *v41;
  void *v42;
  int v43;
  _BOOL4 anonymous;
  NSString *containerScopedUserIdentifier;
  uint64_t v46;
  NSString *v47;
  void *v48;
  int v49;
  NSString *containerScopedDeviceIdentifier;
  uint64_t v51;
  NSString *v52;
  void *v53;
  int v54;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  uint64_t v56;
  NSString *v57;
  void *v58;
  int v59;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  uint64_t v61;
  NSString *v62;
  void *v63;
  int v64;
  NSArray *operationGroups;
  uint64_t v66;
  NSArray *v67;
  void *v68;
  int v69;
  NSArray *clientOperations;
  uint64_t v71;
  NSArray *v72;
  void *v73;
  int v74;
  _BOOL4 pushTrigger;
  id didCompleteWithError;
  id v78;
  id testBehavior_reportMetric;
  id v80;
  unsigned int reportFrequencyRandomValue;

  v4 = (C2MetricOptions *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      c2MetricsEndpoint = self->_c2MetricsEndpoint;
      -[C2MetricOptions c2MetricsEndpoint](v5, "c2MetricsEndpoint");
      v7 = objc_claimAutoreleasedReturnValue();
      if (c2MetricsEndpoint == (NSURL *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_c2MetricsEndpoint;
        if (!v9)
          goto LABEL_71;
        -[C2MetricOptions c2MetricsEndpoint](v5, "c2MetricsEndpoint");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSURL isEqual:](v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_72;
      }
      reportFrequency = self->_reportFrequency;
      if (reportFrequency != -[C2MetricOptions reportFrequency](v5, "reportFrequency"))
        goto LABEL_72;
      reportFrequencyBase = self->_reportFrequencyBase;
      if (reportFrequencyBase != -[C2MetricOptions reportFrequencyBase](v5, "reportFrequencyBase"))
        goto LABEL_72;
      reportClientOperationFrequency = self->_reportClientOperationFrequency;
      if (reportClientOperationFrequency != -[C2MetricOptions reportClientOperationFrequency](v5, "reportClientOperationFrequency"))goto LABEL_72;
      reportClientOperationFrequencyBase = self->_reportClientOperationFrequencyBase;
      if (reportClientOperationFrequencyBase != -[C2MetricOptions reportClientOperationFrequencyBase](v5, "reportClientOperationFrequencyBase"))goto LABEL_72;
      reportOperationGroupFrequency = self->_reportOperationGroupFrequency;
      if (reportOperationGroupFrequency != -[C2MetricOptions reportOperationGroupFrequency](v5, "reportOperationGroupFrequency"))goto LABEL_72;
      reportOperationGroupFrequencyBase = self->_reportOperationGroupFrequencyBase;
      if (reportOperationGroupFrequencyBase != -[C2MetricOptions reportOperationGroupFrequencyBase](v5, "reportOperationGroupFrequencyBase"))goto LABEL_72;
      clientProcessVersion = self->_clientProcessVersion;
      -[C2MetricOptions clientProcessVersion](v5, "clientProcessVersion");
      v20 = objc_claimAutoreleasedReturnValue();
      if (clientProcessVersion == (NSString *)v20)
      {

      }
      else
      {
        v8 = (void *)v20;
        v21 = self->_clientProcessVersion;
        if (!v21)
          goto LABEL_71;
        -[C2MetricOptions clientProcessVersion](v5, "clientProcessVersion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[NSString isEqual:](v21, "isEqual:", v22);

        if (!v23)
          goto LABEL_72;
      }
      clientProcessBundleId = self->_clientProcessBundleId;
      -[C2MetricOptions clientProcessBundleId](v5, "clientProcessBundleId");
      v25 = objc_claimAutoreleasedReturnValue();
      if (clientProcessBundleId == (NSString *)v25)
      {

      }
      else
      {
        v8 = (void *)v25;
        v26 = self->_clientProcessBundleId;
        if (!v26)
          goto LABEL_71;
        -[C2MetricOptions clientProcessBundleId](v5, "clientProcessBundleId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[NSString isEqual:](v26, "isEqual:", v27);

        if (!v28)
          goto LABEL_72;
      }
      container = self->_container;
      -[C2MetricOptions container](v5, "container");
      v30 = objc_claimAutoreleasedReturnValue();
      if (container == (NSString *)v30)
      {

      }
      else
      {
        v8 = (void *)v30;
        v31 = self->_container;
        if (!v31)
          goto LABEL_71;
        -[C2MetricOptions container](v5, "container");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[NSString isEqual:](v31, "isEqual:", v32);

        if (!v33)
          goto LABEL_72;
      }
      environment = self->_environment;
      -[C2MetricOptions environment](v5, "environment");
      v35 = objc_claimAutoreleasedReturnValue();
      if (environment == (NSString *)v35)
      {

      }
      else
      {
        v8 = (void *)v35;
        v36 = self->_environment;
        if (!v36)
          goto LABEL_71;
        -[C2MetricOptions environment](v5, "environment");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[NSString isEqual:](v36, "isEqual:", v37);

        if (!v38)
          goto LABEL_72;
      }
      databaseScope = self->_databaseScope;
      -[C2MetricOptions databaseScope](v5, "databaseScope");
      v40 = objc_claimAutoreleasedReturnValue();
      if (databaseScope == (NSString *)v40)
      {

      }
      else
      {
        v8 = (void *)v40;
        v41 = self->_databaseScope;
        if (!v41)
          goto LABEL_71;
        -[C2MetricOptions databaseScope](v5, "databaseScope");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[NSString isEqual:](v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_72;
      }
      anonymous = self->_anonymous;
      if (anonymous != -[C2MetricOptions anonymous](v5, "anonymous"))
        goto LABEL_72;
      containerScopedUserIdentifier = self->_containerScopedUserIdentifier;
      -[C2MetricOptions containerScopedUserIdentifier](v5, "containerScopedUserIdentifier");
      v46 = objc_claimAutoreleasedReturnValue();
      if (containerScopedUserIdentifier == (NSString *)v46)
      {

      }
      else
      {
        v8 = (void *)v46;
        v47 = self->_containerScopedUserIdentifier;
        if (!v47)
          goto LABEL_71;
        -[C2MetricOptions containerScopedUserIdentifier](v5, "containerScopedUserIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[NSString isEqual:](v47, "isEqual:", v48);

        if (!v49)
          goto LABEL_72;
      }
      containerScopedDeviceIdentifier = self->_containerScopedDeviceIdentifier;
      -[C2MetricOptions containerScopedDeviceIdentifier](v5, "containerScopedDeviceIdentifier");
      v51 = objc_claimAutoreleasedReturnValue();
      if (containerScopedDeviceIdentifier == (NSString *)v51)
      {

      }
      else
      {
        v8 = (void *)v51;
        v52 = self->_containerScopedDeviceIdentifier;
        if (!v52)
          goto LABEL_71;
        -[C2MetricOptions containerScopedDeviceIdentifier](v5, "containerScopedDeviceIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[NSString isEqual:](v52, "isEqual:", v53);

        if (!v54)
          goto LABEL_72;
      }
      applicationBundleIdentifierOverrideForContainerAccess = self->_applicationBundleIdentifierOverrideForContainerAccess;
      -[C2MetricOptions applicationBundleIdentifierOverrideForContainerAccess](v5, "applicationBundleIdentifierOverrideForContainerAccess");
      v56 = objc_claimAutoreleasedReturnValue();
      if (applicationBundleIdentifierOverrideForContainerAccess == (NSString *)v56)
      {

      }
      else
      {
        v8 = (void *)v56;
        v57 = self->_applicationBundleIdentifierOverrideForContainerAccess;
        if (!v57)
          goto LABEL_71;
        -[C2MetricOptions applicationBundleIdentifierOverrideForContainerAccess](v5, "applicationBundleIdentifierOverrideForContainerAccess");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = -[NSString isEqual:](v57, "isEqual:", v58);

        if (!v59)
          goto LABEL_72;
      }
      applicationBundleIdentifierOverrideForNetworkAttribution = self->_applicationBundleIdentifierOverrideForNetworkAttribution;
      -[C2MetricOptions applicationBundleIdentifierOverrideForNetworkAttribution](v5, "applicationBundleIdentifierOverrideForNetworkAttribution");
      v61 = objc_claimAutoreleasedReturnValue();
      if (applicationBundleIdentifierOverrideForNetworkAttribution == (NSString *)v61)
      {

      }
      else
      {
        v8 = (void *)v61;
        v62 = self->_applicationBundleIdentifierOverrideForNetworkAttribution;
        if (!v62)
          goto LABEL_71;
        -[C2MetricOptions applicationBundleIdentifierOverrideForNetworkAttribution](v5, "applicationBundleIdentifierOverrideForNetworkAttribution");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = -[NSString isEqual:](v62, "isEqual:", v63);

        if (!v64)
          goto LABEL_72;
      }
      operationGroups = self->_operationGroups;
      -[C2MetricOptions operationGroups](v5, "operationGroups");
      v66 = objc_claimAutoreleasedReturnValue();
      if (operationGroups == (NSArray *)v66)
      {

      }
      else
      {
        v8 = (void *)v66;
        v67 = self->_operationGroups;
        if (!v67)
          goto LABEL_71;
        -[C2MetricOptions operationGroups](v5, "operationGroups");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = -[NSArray isEqual:](v67, "isEqual:", v68);

        if (!v69)
          goto LABEL_72;
      }
      clientOperations = self->_clientOperations;
      -[C2MetricOptions clientOperations](v5, "clientOperations");
      v71 = objc_claimAutoreleasedReturnValue();
      if (clientOperations == (NSArray *)v71)
      {

LABEL_76:
        pushTrigger = self->_pushTrigger;
        if (pushTrigger == -[C2MetricOptions pushTrigger](v5, "pushTrigger"))
        {
          didCompleteWithError = self->_didCompleteWithError;
          -[C2MetricOptions didCompleteWithError](v5, "didCompleteWithError");
          v78 = (id)objc_claimAutoreleasedReturnValue();

          if (didCompleteWithError == v78)
          {
            testBehavior_reportMetric = self->_testBehavior_reportMetric;
            -[C2MetricOptions testBehavior_reportMetric](v5, "testBehavior_reportMetric");
            v80 = (id)objc_claimAutoreleasedReturnValue();

            if (testBehavior_reportMetric == v80)
            {
              reportFrequencyRandomValue = self->_reportFrequencyRandomValue;
              v12 = reportFrequencyRandomValue == -[C2MetricOptions reportFrequencyRandomValue](v5, "reportFrequencyRandomValue");
              goto LABEL_73;
            }
          }
        }
LABEL_72:
        v12 = 0;
LABEL_73:

        goto LABEL_74;
      }
      v8 = (void *)v71;
      v72 = self->_clientOperations;
      if (v72)
      {
        -[C2MetricOptions clientOperations](v5, "clientOperations");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = -[NSArray isEqual:](v72, "isEqual:", v73);

        if (!v74)
          goto LABEL_72;
        goto LABEL_76;
      }
LABEL_71:

      goto LABEL_72;
    }
    v12 = 0;
  }
LABEL_74:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  _BOOL8 anonymous;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  int8x16_t v13;
  NSUInteger v15;
  int8x16_t v16;
  int8x16_t v17;
  unint64_t reportOperationGroupFrequencyBase;
  unint64_t reportOperationGroupFrequency;
  NSUInteger v20;
  uint64_t v21;

  v21 = -[NSURL hash](self->_c2MetricsEndpoint, "hash");
  v16 = *(int8x16_t *)&self->_reportFrequency;
  v17 = *(int8x16_t *)&self->_reportClientOperationFrequency;
  reportOperationGroupFrequencyBase = self->_reportOperationGroupFrequencyBase;
  reportOperationGroupFrequency = self->_reportOperationGroupFrequency;
  v20 = -[NSString hash](self->_clientProcessVersion, "hash");
  v15 = -[NSString hash](self->_clientProcessBundleId, "hash");
  v3 = -[NSString hash](self->_container, "hash");
  v4 = -[NSString hash](self->_environment, "hash");
  v5 = -[NSString hash](self->_databaseScope, "hash");
  anonymous = self->_anonymous;
  v7 = -[NSString hash](self->_containerScopedUserIdentifier, "hash");
  v8 = -[NSString hash](self->_containerScopedDeviceIdentifier, "hash");
  v9 = -[NSString hash](self->_applicationBundleIdentifierOverrideForContainerAccess, "hash");
  v10 = -[NSString hash](self->_applicationBundleIdentifierOverrideForNetworkAttribution, "hash");
  v11 = -[NSArray hash](self->_operationGroups, "hash");
  v12 = -[NSArray hash](self->_clientOperations, "hash");
  v13 = veorq_s8(v16, v17);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)) ^ reportOperationGroupFrequency ^ reportOperationGroupFrequencyBase ^ anonymous ^ v12 ^ v11 ^ self->_reportFrequencyRandomValue ^ self->_pushTrigger ^ v10 ^ v9 ^ v8 ^ v7 ^ v5 ^ v4 ^ v3 ^ v15 ^ v20 ^ v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *c2MetricsEndpoint;
  id v5;

  c2MetricsEndpoint = self->_c2MetricsEndpoint;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", c2MetricsEndpoint, CFSTR("c2MetricsEndpoint"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_reportFrequency, CFSTR("reportFrequency"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_reportFrequencyBase, CFSTR("reportFrequencyBase"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_reportClientOperationFrequency, CFSTR("reportClientOperationFrequency"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_reportClientOperationFrequencyBase, CFSTR("reportClientOperationFrequencyBase"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_reportOperationGroupFrequency, CFSTR("reportOperationGroupFrequency"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_reportOperationGroupFrequencyBase, CFSTR("reportOperationGroupFrequencyBase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientProcessVersion, CFSTR("clientProcessVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientProcessBundleId, CFSTR("clientProcessBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_container, CFSTR("container"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_databaseScope, CFSTR("databaseScope"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_anonymous, CFSTR("anonymous"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerScopedUserIdentifier, CFSTR("containerScopedUserIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerScopedDeviceIdentifier, CFSTR("containerScopedDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationBundleIdentifierOverrideForContainerAccess, CFSTR("applicationBundleIdentifierOverrideForContainerAccess"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationBundleIdentifierOverrideForNetworkAttribution, CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationGroups, CFSTR("operationGroups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientOperations, CFSTR("clientOperations"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pushTrigger, CFSTR("pushTrigger"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_reportFrequencyRandomValue, CFSTR("reportFrequencyRandomValue"));

}

- (C2MetricOptions)initWithCoder:(id)a3
{
  id v4;
  C2MetricOptions *v5;
  uint64_t v6;
  NSURL *c2MetricsEndpoint;
  uint64_t v8;
  NSString *clientProcessVersion;
  uint64_t v10;
  NSString *clientProcessBundleId;
  uint64_t v12;
  NSString *container;
  uint64_t v14;
  NSString *environment;
  uint64_t v16;
  NSString *databaseScope;
  uint64_t v18;
  NSString *containerScopedUserIdentifier;
  uint64_t v20;
  NSString *containerScopedDeviceIdentifier;
  uint64_t v22;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  uint64_t v24;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *operationGroups;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *clientOperations;
  id didCompleteWithError;
  id testBehavior_reportMetric;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)C2MetricOptions;
  v5 = -[C2MetricOptions init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c2MetricsEndpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    c2MetricsEndpoint = v5->_c2MetricsEndpoint;
    v5->_c2MetricsEndpoint = (NSURL *)v6;

    v5->_reportFrequency = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reportFrequency"));
    v5->_reportFrequencyBase = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reportFrequencyBase"));
    v5->_reportClientOperationFrequency = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reportClientOperationFrequency"));
    v5->_reportClientOperationFrequencyBase = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reportClientOperationFrequencyBase"));
    v5->_reportOperationGroupFrequency = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reportOperationGroupFrequency"));
    v5->_reportOperationGroupFrequencyBase = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reportOperationGroupFrequencyBase"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientProcessVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientProcessVersion = v5->_clientProcessVersion;
    v5->_clientProcessVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientProcessBundleId"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientProcessBundleId = v5->_clientProcessBundleId;
    v5->_clientProcessBundleId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("container"));
    v12 = objc_claimAutoreleasedReturnValue();
    container = v5->_container;
    v5->_container = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
    v14 = objc_claimAutoreleasedReturnValue();
    environment = v5->_environment;
    v5->_environment = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("databaseScope"));
    v16 = objc_claimAutoreleasedReturnValue();
    databaseScope = v5->_databaseScope;
    v5->_databaseScope = (NSString *)v16;

    v5->_anonymous = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("anonymous"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerScopedUserIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    containerScopedUserIdentifier = v5->_containerScopedUserIdentifier;
    v5->_containerScopedUserIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerScopedDeviceIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    containerScopedDeviceIdentifier = v5->_containerScopedDeviceIdentifier;
    v5->_containerScopedDeviceIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifierOverrideForContainerAccess"));
    v22 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForContainerAccess = v5->_applicationBundleIdentifierOverrideForContainerAccess;
    v5->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"));
    v24 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForNetworkAttribution = v5->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("operationGroups"));
    v29 = objc_claimAutoreleasedReturnValue();
    operationGroups = v5->_operationGroups;
    v5->_operationGroups = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("clientOperations"));
    v34 = objc_claimAutoreleasedReturnValue();
    clientOperations = v5->_clientOperations;
    v5->_clientOperations = (NSArray *)v34;

    v5->_pushTrigger = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pushTrigger"));
    v5->_reportFrequencyRandomValue = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("reportFrequencyRandomValue"));
    didCompleteWithError = v5->_didCompleteWithError;
    v5->_didCompleteWithError = 0;

    testBehavior_reportMetric = v5->_testBehavior_reportMetric;
    v5->_testBehavior_reportMetric = 0;

  }
  return v5;
}

@end
