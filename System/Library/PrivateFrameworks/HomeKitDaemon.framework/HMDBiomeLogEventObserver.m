@implementation HMDBiomeLogEventObserver

- (HMDBiomeLogEventObserver)initWithBiomeEventManager:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  HMDBiomeLogEventObserver *v9;
  HMDBiomeLogEventObserver *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDBiomeLogEventObserver;
  v9 = -[HMDBiomeLogEventObserver init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biomeEventManager, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
  }

  return v10;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  id Property;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  HMDBiomeLogEventObserver *v26;
  NSObject *v27;
  uint64_t v28;
  __int128 v29;
  id v30;
  void *v31;
  void *context;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v30 = v4;
    objc_msgSend(v4, "biomeEventsRepresentationForLogObserver:", self);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v35;
      *(_QWORD *)&v7 = 138543874;
      v29 = v7;
      v33 = v5;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v5);
          v11 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          if (v13)
          {
            if (self)
              Property = objc_getProperty(self, v14, 8, 1);
            else
              Property = 0;
            objc_msgSend(Property, "submitActionSetEvent:", v13, v29);
          }
          else
          {
            v16 = v11;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v17 = v16;
            else
              v17 = 0;
            v18 = v17;

            if (v18)
            {
              if (self)
                v20 = objc_getProperty(self, v19, 8, 1);
              else
                v20 = 0;
              objc_msgSend(v20, "submitAccessoryEvent:", v18, v29);
            }
            else
            {
              v21 = v16;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v22 = v21;
              else
                v22 = 0;
              v23 = v22;

              if (v23)
              {
                if (self)
                  v25 = objc_getProperty(self, v24, 8, 1);
                else
                  v25 = 0;
                v5 = v33;
                objc_msgSend(v25, "submitMediaAccessoryEvent:", v23, v29);
              }
              else
              {
                context = (void *)MEMORY[0x227676638]();
                v26 = self;
                HMFGetOSLogHandle();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v29;
                  v39 = v31;
                  v40 = 2112;
                  v41 = v21;
                  v42 = 2112;
                  v43 = v30;
                  _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Skipping submission of unknown biome event: %@ for event: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(context);
                v5 = v33;
              }

            }
          }

          ++v10;
        }
        while (v8 != v10);
        v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        v8 = v28;
      }
      while (v28);
    }

    v4 = v30;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_biomeEventManager, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
