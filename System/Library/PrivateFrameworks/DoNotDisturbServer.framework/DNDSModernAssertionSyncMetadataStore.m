@implementation DNDSModernAssertionSyncMetadataStore

- (DNDSModernAssertionSyncMetadataStore)init
{
  return (DNDSModernAssertionSyncMetadataStore *)-[DNDSModernAssertionSyncMetadataStore _initWithStore:](self, "_initWithStore:", 0);
}

- (id)_initWithStore:(id)a3
{
  id v4;
  DNDSModernAssertionSyncMetadataStore *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lastReceivedStoreDate;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *lastSentStoreDate;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *pendingLastSentStoreDate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DNDSModernAssertionSyncMetadataStore;
  v5 = -[DNDSModernAssertionSyncMetadataStore init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "lastReceivedStoreDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    lastReceivedStoreDate = v5->_lastReceivedStoreDate;
    v5->_lastReceivedStoreDate = v8;

    objc_msgSend(v4, "lastSentStoreDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    lastSentStoreDate = v5->_lastSentStoreDate;
    v5->_lastSentStoreDate = v12;

    objc_msgSend(v4, "pendingLastSentStoreDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    pendingLastSentStoreDate = v5->_pendingLastSentStoreDate;
    v5->_pendingLastSentStoreDate = v16;

  }
  return v5;
}

- (id)_initWithLastReceivedStoreDate:(id)a3 lastSentStoreDate:(id)a4 pendingLastSentStoreDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  DNDSModernAssertionSyncMetadataStore *v11;
  uint64_t v12;
  NSMutableDictionary *lastReceivedStoreDate;
  uint64_t v14;
  NSMutableDictionary *lastSentStoreDate;
  uint64_t v16;
  NSMutableDictionary *pendingLastSentStoreDate;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSModernAssertionSyncMetadataStore;
  v11 = -[DNDSModernAssertionSyncMetadataStore init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "mutableCopy");
    lastReceivedStoreDate = v11->_lastReceivedStoreDate;
    v11->_lastReceivedStoreDate = (NSMutableDictionary *)v12;

    v14 = objc_msgSend(v9, "mutableCopy");
    lastSentStoreDate = v11->_lastSentStoreDate;
    v11->_lastSentStoreDate = (NSMutableDictionary *)v14;

    v16 = objc_msgSend(v10, "mutableCopy");
    pendingLastSentStoreDate = v11->_pendingLastSentStoreDate;
    v11->_pendingLastSentStoreDate = (NSMutableDictionary *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self, "lastReceivedStoreDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self, "lastSentStoreDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self, "pendingLastSentStoreDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDSModernAssertionSyncMetadataStore *v5;
  DNDSModernAssertionSyncMetadataStore *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = (DNDSModernAssertionSyncMetadataStore *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self, "lastReceivedStoreDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](v6, "lastReceivedStoreDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self, "lastReceivedStoreDate");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_37;
        }
        v10 = (void *)v9;
        -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](v6, "lastReceivedStoreDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self, "lastReceivedStoreDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](v6, "lastReceivedStoreDate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v3))
        {
          v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self, "lastSentStoreDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](v6, "lastSentStoreDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self, "lastSentStoreDate");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](v6, "lastSentStoreDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v35 = v14;
            -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self, "lastSentStoreDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](v6, "lastSentStoreDate");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqual:", v3) & 1) != 0)
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self, "pendingLastSentStoreDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](v6, "pendingLastSentStoreDate");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v20 == (void *)v21)
              {

                v13 = 1;
                v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self, "pendingLastSentStoreDate");
                v23 = objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = (void *)v23;
                  -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](v6, "pendingLastSentStoreDate");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    v30 = v25;
                    -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self, "pendingLastSentStoreDate");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](v6, "pendingLastSentStoreDate");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_msgSend(v29, "isEqual:", v26);

                    v25 = v30;
                  }
                  else
                  {
                    v13 = 0;
                  }

                }
                else
                {

                  v13 = 0;
                }
                v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {

              }
LABEL_34:
              v11 = v38;
              v10 = v39;
              v3 = v36;
              v12 = v37;
              if (v7 != v8)
                goto LABEL_35;
LABEL_37:

              goto LABEL_38;
            }

            v14 = v35;
          }

        }
        v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    v13 = 0;
  }
LABEL_38:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSModernAssertionSyncMetadataStore lastReceivedStoreDate](self, "lastReceivedStoreDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModernAssertionSyncMetadataStore lastSentStoreDate](self, "lastSentStoreDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModernAssertionSyncMetadataStore pendingLastSentStoreDate](self, "pendingLastSentStoreDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; lastReceivedStoreDate: %@; lastSentStoreDate: %@; pendingLastSentStoreDate: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _DNDSPendingMessageRecipients *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("lastReceivedStoreDate"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(obj, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v8);
  }
  v44 = v6;

  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("lastSentStoreDate"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v47 = v15;
  v17 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(v47);
        v21 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
        v22 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v47, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, v21);

      }
      v18 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v18);
  }
  v43 = v16;

  v46 = v4;
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("pendingLastSentStoreDate"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v27 = v25;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v50 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k);
        objc_msgSend(v27, "objectForKeyedSubscript:", v32, v43);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("lastUpdateDate"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("deviceIdentifiers"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setWithArray:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = -[_DNDSPendingMessageRecipients initWithLastUpdateDate:deviceIdentifiers:]([_DNDSPendingMessageRecipients alloc], "initWithLastUpdateDate:deviceIdentifiers:", v36, v39);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v40, v32);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v29);
  }

  v41 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithLastReceivedStoreDate:lastSentStoreDate:pendingLastSentStoreDate:", v44, v43, v26);
  return v41;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  NSMutableDictionary *obj;
  void *v45;
  DNDSModernAssertionSyncMetadataStore *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_lastReceivedStoreDate, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v46 = self;
  v6 = self->_lastReceivedStoreDate;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[NSMutableDictionary objectForKeyedSubscript:](v46->_lastReceivedStoreDate, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceReferenceDate");
        objc_msgSend(v12, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v8);
  }

  v42 = v5;
  v15 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("lastReceivedStoreDate"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](v46->_lastSentStoreDate, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v17 = v46->_lastSentStoreDate;
  v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v52 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
        v23 = (void *)MEMORY[0x1E0CB37E8];
        -[NSMutableDictionary objectForKeyedSubscript:](v46->_lastSentStoreDate, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSinceReferenceDate");
        objc_msgSend(v23, "numberWithDouble:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, v22);

      }
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v19);
  }

  v41 = v16;
  v26 = (void *)objc_msgSend(v16, "copy");
  v43 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("lastSentStoreDate"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](v46->_pendingLastSentStoreDate, "count"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v46->_pendingLastSentStoreDate;
  v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v48 != v29)
          objc_enumerationMutation(obj);
        v31 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
        -[NSMutableDictionary objectForKeyedSubscript:](v46->_pendingLastSentStoreDate, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = CFSTR("lastUpdateDate");
        v33 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v32, "lastUpdateDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSinceReferenceDate");
        objc_msgSend(v33, "numberWithDouble:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = CFSTR("deviceIdentifiers");
        v60[0] = v35;
        objc_msgSend(v32, "deviceIdentifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "allObjects");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v38, v31);

      }
      v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v28);
  }

  v39 = (void *)objc_msgSend(v45, "copy");
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v39, CFSTR("pendingLastSentStoreDate"));

  return v43;
}

- (NSMutableDictionary)lastReceivedStoreDate
{
  return self->_lastReceivedStoreDate;
}

- (NSMutableDictionary)lastSentStoreDate
{
  return self->_lastSentStoreDate;
}

- (NSMutableDictionary)pendingLastSentStoreDate
{
  return self->_pendingLastSentStoreDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingLastSentStoreDate, 0);
  objc_storeStrong((id *)&self->_lastSentStoreDate, 0);
  objc_storeStrong((id *)&self->_lastReceivedStoreDate, 0);
}

@end
