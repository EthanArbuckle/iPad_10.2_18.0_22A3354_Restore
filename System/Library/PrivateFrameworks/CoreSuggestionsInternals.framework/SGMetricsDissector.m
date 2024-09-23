@implementation SGMetricsDissector

- (SGMetricsDissector)initWithEntityStore:(id)a3
{
  id v5;
  SGMetricsDissector *v6;
  SGMetricsDissector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMetricsDissector;
  v6 = -[SGMetricsDissector init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (BOOL)_shouldSampleMessage
{
  void *v2;
  BOOL v3;

  v2 = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  v3 = (float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) <= 0.00001;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  SGMetricsDissector *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  if (-[SGMetricsDissector _shouldSampleMessage](self, "_shouldSampleMessage"))
  {
    objc_msgSend(v8, "from");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v8, "to");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v9, "duplicateKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bundleId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          if ((objc_msgSend(v8, "isSent") & 1) != 0)
          {
            v27 = v10;
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            objc_msgSend(v8, "to");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v30 != v19)
                    objc_enumerationMutation(obj);
                  v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                  v22 = (void *)MEMORY[0x1C3BD4F6C]();
                  objc_msgSend(v21, "emailAddress");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  +[SGMetricsHelper recordConversationTurnWithDetail:received:throughApp:withStore:](SGMetricsHelper, "recordConversationTurnWithDetail:received:throughApp:withStore:", v23, 0, v16, v11->_store);

                  objc_autoreleasePoolPop(v22);
                }
                v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              }
              while (v18);
            }

            v10 = v27;
          }
          else
          {
            v24 = (void *)MEMORY[0x1C3BD4F6C]();
            objc_msgSend(v8, "from");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "emailAddress");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[SGMetricsHelper recordConversationTurnWithDetail:received:throughApp:withStore:](SGMetricsHelper, "recordConversationTurnWithDetail:received:throughApp:withStore:", v26, 1, v16, v11->_store);

            objc_autoreleasePoolPop(v24);
          }
        }

      }
    }
  }

}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  id v29;
  SGMetricsDissector *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30 = self;
  if (-[SGMetricsDissector _shouldSampleMessage](self, "_shouldSampleMessage"))
  {
    objc_msgSend(v8, "sender");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "count"))
    {

LABEL_16:
      goto LABEL_17;
    }
    objc_msgSend(v8, "recipients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "duplicateKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v15 = objc_msgSend(v8, "isSent");
        v16 = MEMORY[0x1C3BD4F6C]();
        v17 = (void *)v16;
        if ((v15 & 1) != 0)
        {
          context = (void *)v16;
          v29 = v10;
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v8, "recipients");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v32 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "handles");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                +[SGMetricsHelper recordConversationTurnWithDetail:received:throughApp:withStore:](SGMetricsHelper, "recordConversationTurnWithDetail:received:throughApp:withStore:", v24, 0, v11, v30->_store);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
            }
            while (v20);
          }

          objc_autoreleasePoolPop(context);
          v10 = v29;
        }
        else
        {
          objc_msgSend(v8, "sender");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handles");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGMetricsHelper recordConversationTurnWithDetail:received:throughApp:withStore:](SGMetricsHelper, "recordConversationTurnWithDetail:received:throughApp:withStore:", v27, 1, v11, v30->_store);

          objc_autoreleasePoolPop(v17);
        }
      }
      goto LABEL_16;
    }
  }
LABEL_17:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
