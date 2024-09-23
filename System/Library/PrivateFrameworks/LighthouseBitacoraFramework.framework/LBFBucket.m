@implementation LBFBucket

- (LBFBucket)initWithInterval:(id)a3 endTimestamp:(id)a4 index:(unint64_t)a5
{
  id v9;
  id v10;
  LBFBucket *v11;
  LBFBucket *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *eventTree;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LBFBucket;
  v11 = -[LBFBucket init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startTime, a3);
    objc_storeStrong((id *)&v12->_endTime, a4);
    v12->_bucketIndex = a5;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    eventTree = v12->_eventTree;
    v12->_eventTree = v13;

  }
  return v12;
}

- (id)flattenEvents
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id obj;
  uint64_t v54;
  id v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v56 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend_allKeys(self->_eventTree, v2, v3, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v63, (uint64_t)v68, 16);
  if (v57)
  {
    v54 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v64 != v54)
          objc_enumerationMutation(obj);
        v58 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend_objectForKey_(self->_eventTree, v7, v58, v8, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend_deploymentEventsHolders(v11, v13, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v17, v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v59, (uint64_t)v67, 16);
        if (v24)
        {
          v29 = v24;
          v30 = *(_QWORD *)v60;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v60 != v30)
                objc_enumerationMutation(v22);
              v32 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
              objc_msgSend_deploymentEventsHolders(v11, v25, v26, v27, v28);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v33, v34, v32, v35, v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_getSortedEvents(v37, v38, v39, v40, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v12, v43, (uint64_t)v42, v32, v44);

            }
            v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v59, (uint64_t)v67, 16);
          }
          while (v29);
        }

        objc_msgSend_setObject_forKey_(v56, v45, (uint64_t)v12, v58, v46);
      }
      v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v63, (uint64_t)v68, 16);
    }
    while (v57);
  }

  v51 = (void *)objc_msgSend_copy(v56, v47, v48, v49, v50);
  return v51;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (unint64_t)bucketIndex
{
  return self->_bucketIndex;
}

- (void)setBucketIndex:(unint64_t)a3
{
  self->_bucketIndex = a3;
}

- (NSMutableDictionary)eventTree
{
  return self->_eventTree;
}

- (void)setEventTree:(id)a3
{
  objc_storeStrong((id *)&self->_eventTree, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTree, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
