@implementation LBFExperimentEventsHolder

- (LBFExperimentEventsHolder)initWithExperimentOrTaskId:(id)a3
{
  id v5;
  LBFExperimentEventsHolder *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *deploymentEventsHolders;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LBFExperimentEventsHolder;
  v6 = -[LBFExperimentEventsHolder init](&v10, sel_init);
  if (v6)
  {
    LBFLoggingUtilsInit();
    objc_storeStrong((id *)&v6->_experimentOrTaskId, a3);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deploymentEventsHolders = v6->_deploymentEventsHolders;
    v6->_deploymentEventsHolders = v7;

  }
  return v6;
}

- (id)ensureDeploymentEventsHolder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  LBFDeploymentEventsHolder *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  objc_msgSend_objectForKey_(self->_deploymentEventsHolders, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = [LBFDeploymentEventsHolder alloc];
    v8 = (void *)objc_msgSend_initWithExperimentOrTaskId_deploymentId_(v9, v10, (uint64_t)self->_experimentOrTaskId, (uint64_t)v4, v11);
    objc_msgSend_setValue_forKey_(self->_deploymentEventsHolders, v12, (uint64_t)v8, (uint64_t)v4, v13);
  }
  v14 = v8;

  return v14;
}

- (BOOL)dumpFetchedEvents
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *experimentOrTaskId;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = LBFLogContextEventsHolder;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
  {
    experimentOrTaskId = self->_experimentOrTaskId;
    *(_DWORD *)buf = 138412290;
    v26 = experimentOrTaskId;
    _os_log_impl(&dword_2402DE000, v3, OS_LOG_TYPE_INFO, "dumpFetchedEvents experimentId %@", buf, 0xCu);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend_allValues(self->_deploymentEventsHolders, v4, v5, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v11)
  {
    v16 = v11;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v9);
        objc_msgSend_dumpFetchedEvents(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v18++), v12, v13, v14, v15);
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v16);
  }

  return 1;
}

- (id)fetchedEventsInDictionaries
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *experimentOrTaskId;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = LBFLogContextEventsHolder;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
  {
    experimentOrTaskId = self->_experimentOrTaskId;
    *(_DWORD *)buf = 138412290;
    v31 = experimentOrTaskId;
    _os_log_impl(&dword_2402DE000, v4, OS_LOG_TYPE_INFO, "dumpFetchedEvents experimentId %@", buf, 0xCu);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend_allValues(self->_deploymentEventsHolders, v5, v6, v7, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v12)
  {
    v17 = v12;
    v18 = *(_QWORD *)v26;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v10);
        objc_msgSend_fetchedEventsInDictionaries(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v19), v13, v14, v15, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v3, v21, (uint64_t)v20, v22, v23);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v17);
  }

  return v3;
}

- (NSString)experimentOrTaskId
{
  return self->_experimentOrTaskId;
}

- (NSMutableDictionary)deploymentEventsHolders
{
  return self->_deploymentEventsHolders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentEventsHolders, 0);
  objc_storeStrong((id *)&self->_experimentOrTaskId, 0);
}

@end
