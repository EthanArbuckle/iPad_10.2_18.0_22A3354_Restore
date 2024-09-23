@implementation POBasicPodcastAppSearch

- (id)_validate
{
  return 0;
}

- (id)modelObjectsAsSAMPCollections:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v3;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v11)
  {
    v16 = v11;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v9);
        objc_msgSend_SAMPCollection(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v18), v12, v13, v14, v15, (_QWORD)v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v8, v20, (uint64_t)v19, v21, v22);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v16);
  }

  return v8;
}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  POBasicPodcastAppSearchCompleted *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  POLogInitIfNeeded();
  v5 = MEMORY[0x24BDACB70];
  if (POLogContextCommand)
    v6 = POLogContextCommand;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend_query(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 138412290;
    v72 = v12;
    _os_log_impl(&dword_217352000, v7, OS_LOG_TYPE_INFO, "Going to do a basic search for %@", (uint8_t *)&v71, 0xCu);

  }
  v13 = objc_alloc_init(POBasicPodcastAppSearchCompleted);
  if (objc_msgSend_acceptPodcastCollections(self, v14, v15, v16, v17))
  {
    objc_msgSend_sharedInstance(PODataSource, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_query(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_maxResults(self, v28, v29, v30, v31);
    objc_msgSend_podcastCollectionsMatchingString_maxResults_(v22, v33, (uint64_t)v27, v32, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    POLogInitIfNeeded();
    if (POLogContextCommand)
      v36 = POLogContextCommand;
    else
      v36 = v5;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v71 = 138412290;
      v72 = v35;
      _os_log_impl(&dword_217352000, v36, OS_LOG_TYPE_INFO, "Data source podcasts are %@", (uint8_t *)&v71, 0xCu);
    }
    objc_msgSend_modelObjectsAsSAMPCollections_(self, v37, (uint64_t)v35, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPodcastCollections_(v13, v41, (uint64_t)v40, v42, v43);

  }
  if (objc_msgSend_acceptPodcastStations(self, v18, v19, v20, v21))
  {
    objc_msgSend_sharedInstance(PODataSource, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_query(self, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_maxResults(self, v54, v55, v56, v57);
    objc_msgSend_podcastStationsMatchingString_maxResults_(v48, v59, (uint64_t)v53, v58, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    POLogInitIfNeeded();
    if (POLogContextCommand)
      v62 = POLogContextCommand;
    else
      v62 = v5;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      v71 = 138412290;
      v72 = v61;
      _os_log_impl(&dword_217352000, v62, OS_LOG_TYPE_INFO, "Data source stations are %@", (uint8_t *)&v71, 0xCu);
    }
    objc_msgSend_modelObjectsAsSAMPCollections_(self, v63, (uint64_t)v61, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPodcastStations_(v13, v67, (uint64_t)v66, v68, v69);

  }
  objc_msgSend_dictionary(v13, v44, v45, v46, v47);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v70);

}

- (id)_perform
{
  return 0;
}

@end
