@implementation IMMessagePartSyndicationAssetDescriptor

- (IMMessagePartSyndicationAssetDescriptor)initWithAssetSyndications:(id)a3
{
  id v5;
  IMMessagePartSyndicationAssetDescriptor *v6;
  IMMessagePartSyndicationAssetDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMMessagePartSyndicationAssetDescriptor;
  v6 = -[IMMessagePartSyndicationAssetDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetSyndications, a3);

  return v7;
}

- (id)syndicationForPartIndex:(unint64_t)a3 asset:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;

  -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v12 = v12;
        v13 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "intValue");

        IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_19E36CCAC(a3, v17, v18);

        v13 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");

      IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_19E36CC28(v15, v12);
      v13 = 0;
    }

  }
  else
  {
    IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_19E36CBAC(v8);
    v13 = 0;
  }

  return v13;
}

- (void)updateSyndicationAssetWithInfo:(id)a3 asset:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  NSString *serializedString;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  void *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSString *)objc_msgSend(v13, "mutableCopy");

      v15 = (void *)objc_msgSend(v7, "copy");
      if (v14 && v15)
      {
        v28 = v15;
        v29 = v10;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v16, "objectForKey:", v21, v28);
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v22;
              if (v21)
                v24 = v22 == 0;
              else
                v24 = 1;
              if (!v24)
                -[NSString setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v22, v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v18);
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v29;
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v14, v25);

        -[IMMessagePartSyndicationAssetDescriptor setAssetSyndications:](self, "setAssetSyndications:", v29);
        serializedString = self->_serializedString;
        self->_serializedString = 0;

        v15 = v28;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v27;
      v36[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMMessagePartSyndicationAssetDescriptor setAssetSyndications:](self, "setAssetSyndications:", v10);
      v14 = self->_serializedString;
      self->_serializedString = 0;
    }

  }
}

- (void)replaceSyndicationAssetsInfoWith:(id)a3 asset:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *serializedString;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v11);

      -[IMMessagePartSyndicationAssetDescriptor setAssetSyndications:](self, "setAssetSyndications:", v10);
      serializedString = self->_serializedString;
      self->_serializedString = 0;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13;
      v17[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMMessagePartSyndicationAssetDescriptor setAssetSyndications:](self, "setAssetSyndications:", v14);
      v15 = self->_serializedString;
      self->_serializedString = 0;

    }
  }

}

- (void)removeSyndicationAssetsInfoFor:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *serializedString;
  id v9;

  -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v7);

    -[IMMessagePartSyndicationAssetDescriptor setAssetSyndications:](self, "setAssetSyndications:", v9);
    serializedString = self->_serializedString;
    self->_serializedString = 0;

  }
}

- (NSString)serializedString
{
  NSString *serializedString;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSString *v22;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  serializedString = self->_serializedString;
  if (!serializedString)
  {
    v4 = (void *)-[NSDictionary copy](self->_assetSyndications, "copy");
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (v4 && objc_msgSend(v4, "count"))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v34;
        v24 = *(_QWORD *)v34;
        v25 = v6;
        do
        {
          v10 = 0;
          v26 = v8;
          do
          {
            if (*(_QWORD *)v34 != v9)
              objc_enumerationMutation(v6);
            v28 = v10;
            v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
            if (v11)
            {
              objc_msgSend(v5, "appendFormat:", CFSTR("%i"), objc_msgSend(v11, "intValue"));
              objc_msgSend(v5, "appendString:", CFSTR("="));
              objc_msgSend(v6, "objectForKey:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12;
              if (v12)
              {
                v27 = v12;
                v14 = objc_msgSend(v12, "count");
                v13 = v27;
                if (v14)
                {
                  objc_msgSend(v5, "appendString:", CFSTR("["));
                  v31 = 0u;
                  v32 = 0u;
                  v29 = 0u;
                  v30 = 0u;
                  v15 = v27;
                  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
                  if (v16)
                  {
                    v17 = v16;
                    v18 = *(_QWORD *)v30;
                    do
                    {
                      for (i = 0; i != v17; ++i)
                      {
                        if (*(_QWORD *)v30 != v18)
                          objc_enumerationMutation(v15);
                        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                        if (v20)
                        {
                          objc_msgSend(v15, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
                          v21 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v21)
                          {
                            objc_msgSend(v5, "appendFormat:", CFSTR("%i%@%i"), objc_msgSend(v20, "intValue"), CFSTR(":"), objc_msgSend(v21, "intValue"));
                            objc_msgSend(v5, "appendString:", CFSTR("-"));
                          }

                        }
                      }
                      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
                    }
                    while (v17);
                  }

                  objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
                  objc_msgSend(v5, "appendString:", CFSTR("]"));
                  objc_msgSend(v5, "appendString:", CFSTR(";"));
                  v6 = v25;
                  v8 = v26;
                  v9 = v24;
                  v13 = v27;
                }
              }

            }
            v10 = v28 + 1;
          }
          while (v28 + 1 != v8);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v8);
      }

      objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
    }
    v22 = self->_serializedString;
    self->_serializedString = (NSString *)v5;

    serializedString = self->_serializedString;
  }
  return serializedString;
}

+ (id)descriptorFromSerializedString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  IMMessagePartSyndicationAssetDescriptor *v34;
  NSObject *v35;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  os_log_t log;
  void *v47;
  uint64_t v48;
  NSObject *obj;
  NSObject *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(";"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  v38 = v4;
  if (!v4 || !objc_msgSend(v4, "count", v3))
  {
    IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_19E36CD44();
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
  v50 = objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v5 = v38;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (!v6)
    goto LABEL_36;
  v7 = v6;
  v8 = *(_QWORD *)v57;
  v39 = *(_QWORD *)v57;
  v40 = v5;
  do
  {
    v9 = 0;
    v41 = v7;
    do
    {
      if (*(_QWORD *)v57 != v8)
      {
        v10 = v9;
        objc_enumerationMutation(v5);
        v9 = v10;
      }
      v45 = v9;
      v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v9);
      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("="));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v12;
      if (objc_msgSend(v12, "count") == 2)
      {
        objc_msgSend(v12, "objectAtIndex:", 0);
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject integerValue](log, "integerValue"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("["), &stru_1E3FBBA48);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("]"), &stru_1E3FBBA48);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = v15;
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("-"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v16;
        if (v16 && (v17 = v16, objc_msgSend(v16, "count")))
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          obj = v17;
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          if (v18)
          {
            v42 = v13;
            v19 = *(_QWORD *)v53;
            v20 = v18;
            v21 = v47;
            do
            {
              v22 = 0;
              v48 = v20;
              do
              {
                if (*(_QWORD *)v53 != v19)
                  objc_enumerationMutation(obj);
                v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v22);
                objc_msgSend(v23, "componentsSeparatedByString:", CFSTR(":"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v24, "count") == 2)
                {
                  objc_msgSend(v24, "objectAtIndex:", 0);
                  v25 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "objectAtIndex:", 1);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSObject intValue](v25, "intValue"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v26, "intValue"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject objectForKey:](v50, "objectForKey:", v21);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = v21;
                  v31 = v29;
                  if (v29)
                  {
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v27);
                    -[NSObject setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v31, v30);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSObject count](obj, "count"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setObject:forKeyedSubscript:", v28, v27);
                    -[NSObject setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v33, v30);

                  }
                  v32 = v51;
                  v21 = v47;
                  v20 = v48;
                }
                else
                {
                  IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v62 = "+[IMMessagePartSyndicationAssetDescriptor descriptorFromSerializedString:]";
                    v63 = 2112;
                    v64 = v23;
                    _os_log_error_impl(&dword_19E239000, v25, OS_LOG_TYPE_ERROR, "%s invalid number of tokens present in keyValuePair string %@", buf, 0x16u);
                  }
                  v32 = v51;
                }

                ++v22;
              }
              while (v20 != v22);
              v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            }
            while (v20);
            v8 = v39;
            v5 = v40;
            v7 = v41;
            v13 = v42;
            goto LABEL_33;
          }
        }
        else
        {
          IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
          obj = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "+[IMMessagePartSyndicationAssetDescriptor descriptorFromSerializedString:]";
            v63 = 2112;
            v64 = v15;
            _os_log_error_impl(&dword_19E239000, obj, OS_LOG_TYPE_ERROR, "%s no asset info key value pairs present in string %@, skipping", buf, 0x16u);
          }
        }
        v32 = v51;
LABEL_33:

        goto LABEL_34;
      }
      IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "+[IMMessagePartSyndicationAssetDescriptor descriptorFromSerializedString:]";
        v63 = 2112;
        v64 = v11;
        _os_log_error_impl(&dword_19E239000, log, OS_LOG_TYPE_ERROR, "%s invalid token for asset to asset info dictionary, could not parse %@", buf, 0x16u);
      }
      v32 = v12;
LABEL_34:

      v9 = v45 + 1;
    }
    while (v45 + 1 != v7);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  }
  while (v7);
LABEL_36:

  if (!-[NSObject count](v50, "count"))
  {
    IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_19E36CDB0();

LABEL_43:
    v34 = 0;
    goto LABEL_44;
  }
  v34 = -[IMMessagePartSyndicationAssetDescriptor initWithAssetSyndications:]([IMMessagePartSyndicationAssetDescriptor alloc], "initWithAssetSyndications:", v50);
LABEL_44:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAssetSyndications:", v5);

  return v6;
}

- (IMMessagePartSyndicationAssetDescriptor)initWithCoder:(id)a3
{
  id v4;
  IMMessagePartSyndicationAssetDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *assetSyndications;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMMessagePartSyndicationAssetDescriptor;
  v5 = -[IMMessagePartSyndicationAssetDescriptor init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("assetSyndications"));
    v9 = objc_claimAutoreleasedReturnValue();
    assetSyndications = v5->_assetSyndications;
    v5->_assetSyndications = (NSDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetSyndications"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[IMMessagePartSyndicationAssetDescriptor serializedString](self, "serializedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("serializedString: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    -[IMMessagePartSyndicationAssetDescriptor assetSyndications](self, "assetSyndications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSyndications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToDictionary:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)assetSyndications
{
  return self->_assetSyndications;
}

- (void)setAssetSyndications:(id)a3
{
  objc_storeStrong((id *)&self->_assetSyndications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSyndications, 0);
  objc_storeStrong((id *)&self->_serializedString, 0);
}

@end
