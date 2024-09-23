@implementation CorrectionsProfilesSyncHandler

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _BOOL4 v16;
  CorrectionsProfilesLastState *v17;
  CorrectionsProfilesLastState *lastState;
  _BOOL4 v19;
  void *v20;
  NSUInteger v21;
  NSObject *v22;
  CorrectionsProfilesLastState *v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *correctionProfiles;
  NSMutableArray *v30;
  NSMutableArray *correctionProfileKeysToSync;
  void *v32;
  NSMutableArray *v33;
  NSMutableArray *correctionProfileKeysToDelete;
  _QWORD v35[5];
  _QWORD v36[5];
  NSMutableArray *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  CorrectionsProfilesLastState *v43;
  __int16 v44;
  _BOOL4 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (self->_lastState)
  {
    v16 = 1;
  }
  else
  {
    v17 = objc_alloc_init(CorrectionsProfilesLastState);
    lastState = self->_lastState;
    self->_lastState = v17;

    v16 = -[CorrectionsProfilesLastState loadLastState](self->_lastState, "loadLastState");
  }
  -[CorrectionsProfilesSyncHandler _loadCorrectionProfiles](self, "_loadCorrectionProfiles");
  v19 = a5 <= 0 && -[NSDictionary count](self->_correctionProfiles, "count") == 0;
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CorrectionsProfiles-2.0")) & v16) != 1
    || -[CorrectionsProfilesLastState count](self->_lastState, "count") != a5)
  {
    goto LABEL_14;
  }
  -[CorrectionsProfilesLastState digest](self->_lastState, "digest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v20, "isEqualToString:", v12) | v19) & 1) != 0)
  {
    if (a5 <= 0)
    {

    }
    else
    {
      v21 = -[NSDictionary count](self->_correctionProfiles, "count");

      if (!v21)
        goto LABEL_14;
    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSDictionary count](self->_correctionProfiles, "count"));
    v28 = MEMORY[0x24BDAC760];
    correctionProfiles = self->_correctionProfiles;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = sub_2172C36C0;
    v36[3] = &unk_24D729788;
    v36[4] = self;
    v30 = v27;
    v37 = v30;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](correctionProfiles, "enumerateKeysAndObjectsUsingBlock:", v36);
    correctionProfileKeysToSync = self->_correctionProfileKeysToSync;
    self->_correctionProfileKeysToSync = v30;
    v24 = v30;

    -[CorrectionsProfilesLastState correctionKeys](self->_lastState, "correctionKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v32, "count"));
    correctionProfileKeysToDelete = self->_correctionProfileKeysToDelete;
    self->_correctionProfileKeysToDelete = v33;

    v35[0] = v28;
    v35[1] = 3221225472;
    v35[2] = sub_2172C3744;
    v35[3] = &unk_24D7297B0;
    v35[4] = self;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", v35);

    v26 = v37;
    goto LABEL_17;
  }

LABEL_14:
  v22 = *MEMORY[0x24BE08FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_INFO))
  {
    v23 = self->_lastState;
    *(_DWORD *)buf = 136315906;
    v39 = "-[CorrectionsProfilesSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]";
    v40 = 2112;
    v41 = v13;
    v42 = 2112;
    v43 = v23;
    v44 = 1024;
    v45 = v16;
    _os_log_impl(&dword_2172C1000, v22, OS_LOG_TYPE_INFO, "%s Reset sync for validity %@, last state: %@, loaded last state? %d", buf, 0x26u);
  }
  objc_msgSend(v15, "resetWithValidity:", CFSTR("CorrectionsProfiles-2.0"));
  -[NSDictionary allKeys](self->_correctionProfiles, "allKeys");
  v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v25 = (NSMutableArray *)-[NSMutableArray mutableCopy](v24, "mutableCopy");
  v26 = self->_correctionProfileKeysToSync;
  self->_correctionProfileKeysToSync = v25;
LABEL_17:

}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  NSMutableArray *correctionProfileKeysToSync;
  NSMutableArray **p_correctionProfileKeysToSync;
  id v8;
  uint64_t v9;
  NSMutableArray **p_correctionProfileKeysToDelete;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSMutableArray **v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  p_correctionProfileKeysToSync = &self->_correctionProfileKeysToSync;
  correctionProfileKeysToSync = self->_correctionProfileKeysToSync;
  v8 = a3;
  v9 = -[NSMutableArray count](correctionProfileKeysToSync, "count");
  p_correctionProfileKeysToDelete = &self->_correctionProfileKeysToDelete;
  if (v9 + -[NSMutableArray count](self->_correctionProfileKeysToDelete, "count"))
  {
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("Correction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CorrectionsProfilesLastState digest](self->_lastState, "digest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0 || !objc_msgSend(v12, "length"))
      v14 = 0;
    else
      v14 = objc_msgSend(v12, "integerValue") + 1;
    -[NSMutableArray lastObject](*p_correctionProfileKeysToSync, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[NSDictionary objectForKey:](self->_correctionProfiles, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x24BE810D0]);
      objc_msgSend(v17, "setIdentifier:", v15);
      objc_msgSend(v17, "setCorrectionEntryData:", v16);
      objc_msgSend(v22, "setObject:", v17);
      v18 = &self->_correctionProfileKeysToSync;
    }
    else
    {
      -[NSMutableArray lastObject](*p_correctionProfileKeysToDelete, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x24BE810D0]);
      objc_msgSend(v17, "setIdentifier:", v16);
      objc_msgSend(v22, "setObject:", v17);
      objc_msgSend(v22, "setIsDelete:", 1);
      v18 = &self->_correctionProfileKeysToDelete;
    }
    -[NSMutableArray removeLastObject](*v18, "removeLastObject");

    if (-[NSMutableArray count](*p_correctionProfileKeysToSync, "count")
      || -[NSMutableArray count](*p_correctionProfileKeysToDelete, "count"))
    {
      v19 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v11, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@%@%tu"), v20, CFSTR("Correction"), v14);

    }
    else
    {
      CorrectionsProfilesDigest(self->_correctionProfiles);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "setPostAnchor:", v21);

  }
  else
  {
    objc_msgSend(v22, "setPostAnchor:", v8);

    objc_msgSend(v22, "setObject:", 0);
  }

}

- (void)syncDidEnd
{
  NSDictionary *correctionProfiles;
  NSMutableArray *correctionProfileKeysToSync;

  -[CorrectionsProfilesLastState saveNewState:](self->_lastState, "saveNewState:", self->_correctionProfiles);
  correctionProfiles = self->_correctionProfiles;
  self->_correctionProfiles = 0;

  correctionProfileKeysToSync = self->_correctionProfileKeysToSync;
  self->_correctionProfileKeysToSync = 0;

}

- (void)_loadCorrectionProfiles
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSDictionary *correctionProfiles;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  CorrectionsProfilesSyncHandler *v24;
  void *v25;
  NSDictionary *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1E2D0], "defaultSynchedKnowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v3, "dictionaryRepresentationAndReturnError:", &v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v32;
  v5 = *MEMORY[0x24BE08FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[CorrectionsProfilesSyncHandler _loadCorrectionProfiles]";
    v35 = 2112;
    v36 = v27;
    _os_log_debug_impl(&dword_2172C1000, v5, OS_LOG_TYPE_DEBUG, "%s Loaded data from db: %@", buf, 0x16u);
    if (v4)
      goto LABEL_3;
  }
  else if (v4)
  {
LABEL_3:
    v6 = (void *)*MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
    {
      v22 = v6;
      objc_msgSend(v3, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v34 = "-[CorrectionsProfilesSyncHandler _loadCorrectionProfiles]";
      v35 = 2112;
      v36 = v4;
      v37 = 2112;
      v38 = v23;
      _os_log_error_impl(&dword_2172C1000, v22, OS_LOG_TYPE_ERROR, "%s Failed to load corrections profiles %@ for name %@", buf, 0x20u);

    }
    correctionProfiles = self->_correctionProfiles;
    self->_correctionProfiles = 0;
    goto LABEL_21;
  }
  v24 = self;
  v25 = v3;
  v26 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v27, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v27, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v13);
        objc_msgSend(v14, "scheme");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Correction"));

        if (v16)
        {
          objc_msgSend(v27, "objectForKey:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSDictionary setObject:forKey:](v26, "setObject:forKey:", v17, v14);
          }
          else
          {
            v18 = (void *)*MEMORY[0x24BE08FE8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (void *)objc_opt_class();
              *(_DWORD *)buf = 136315906;
              v34 = "-[CorrectionsProfilesSyncHandler _loadCorrectionProfiles]";
              v35 = 2112;
              v36 = v13;
              v37 = 2112;
              v38 = v17;
              v39 = 2112;
              v40 = v20;
              v21 = v20;
              _os_log_error_impl(&dword_2172C1000, v19, OS_LOG_TYPE_ERROR, "%s Unexpected value type for key %@: %@ of type %@", buf, 0x2Au);

            }
          }

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    }
    while (v10);
  }

  v3 = v25;
  correctionProfiles = v24->_correctionProfiles;
  v24->_correctionProfiles = v26;
LABEL_21:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastState, 0);
  objc_storeStrong((id *)&self->_correctionProfileKeysToDelete, 0);
  objc_storeStrong((id *)&self->_correctionProfileKeysToSync, 0);
  objc_storeStrong((id *)&self->_correctionProfiles, 0);
}

@end
