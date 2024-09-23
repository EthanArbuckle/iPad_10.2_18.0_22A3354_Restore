@implementation LCFCoreMLBatchProvider

- (id)init:(id)a3 featureProviders:(id)a4
{
  id v7;
  id v8;
  LCFCoreMLBatchProvider *v9;
  LCFCoreMLBatchProvider *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSDate *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDate *timeFirst;
  NSDate *v25;
  NSDate *timeLast;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)LCFCoreMLBatchProvider;
  v9 = -[LCFCoreMLBatchProvider init](&v34, sel_init);
  v10 = v9;
  if (v9)
  {
    v29 = v7;
    objc_storeStrong((id *)&v9->_featureStoreKey, a3);
    v10->_count = objc_msgSend(v8, "count");
    objc_storeStrong((id *)&v10->_featureProviders, a4);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (!v12)
    {
      v14 = 0;
      v15 = 0;
      goto LABEL_22;
    }
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v31;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
        if (v14)
        {
          if (v15)
            goto LABEL_9;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v17), "timestamp");
          v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
          if (v15)
            goto LABEL_9;
        }
        objc_msgSend(v18, "timestamp", v28);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        objc_msgSend(v18, "timestamp", v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[NSDate compare:](v14, "compare:", v19);

        objc_msgSend(v18, "timestamp");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v20 == -1)
          v22 = (void *)v15;
        else
          v22 = v14;
        if (v20 == -1)
          v15 = v21;
        else
          v14 = (NSDate *)v21;

        ++v17;
      }
      while (v13 != v17);
      v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      v13 = v23;
      if (!v23)
      {
LABEL_22:

        timeFirst = v10->_timeFirst;
        v10->_timeFirst = v14;
        v25 = v14;

        timeLast = v10->_timeLast;
        v10->_timeLast = (NSDate *)v15;

        v8 = v28;
        v7 = v29;
        break;
      }
    }
  }

  return v10;
}

- (id)featuresAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_featureProviders, "objectAtIndexedSubscript:", a3);
}

+ (id)fromMLProvider:(id)a3
{
  return a3;
}

- (NSString)featureStoreKey
{
  return self->_featureStoreKey;
}

- (NSDate)timeFirst
{
  return self->_timeFirst;
}

- (NSDate)timeLast
{
  return self->_timeLast;
}

- (int64_t)count
{
  return self->_count;
}

- (NSArray)featureProviders
{
  return self->_featureProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureProviders, 0);
  objc_storeStrong((id *)&self->_timeLast, 0);
  objc_storeStrong((id *)&self->_timeFirst, 0);
  objc_storeStrong((id *)&self->_featureStoreKey, 0);
}

@end
