@implementation MPCScriptedSceneCollectionParser

+ (id)sceneCollectionForMetadataItems:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  NSObject *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a3;
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "key", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("com.apple.music.scenes"));

        if (v11)
        {
          objc_msgSend(v9, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_NSIsNSString() & 1) != 0)
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
            objc_msgSend(a1, "sceneCollectionForScriptData:", v15);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v4;
            goto LABEL_15;
          }

        }
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v6)
        continue;
      break;
    }
  }

  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v22 = CFSTR("com.apple.music.scenes");
    v23 = 2114;
    v24 = v4;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "MPCScriptedSceneCollectionParser: sceneCollectionForMetadataItems: Well-defined string script data corresponding to %{public}@ not found [returning nil] metadataItems=%{public}@", buf, 0x16u);
  }
  v14 = 0;
LABEL_15:

  return v14;
}

+ (id)sceneCollectionForScriptData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  NSObject *v20;
  MPCSceneCollection *v21;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v34;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v6;
      v38 = 2114;
      v39 = v4;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "Error serializing JSONObject with scriptData. error=%{public}@ scriptData=%{public}@", buf, 0x16u);
    }

  }
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("motion-timeline"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("versions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSArray())
      {
        v24 = a1;
        v25 = v9;
        v26 = v8;
        v27 = v6;
        v28 = v5;
        v29 = v4;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              if (_NSIsNSDictionary())
              {
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("version"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (_NSIsNSString() && objc_msgSend(v16, "isEqual:", CFSTR("1.0")))
                {
                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("fps"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (_NSIsNSNumber())
                  {
                    objc_msgSend(v17, "doubleValue");
                    if (v18 > 0.0)
                    {
                      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("scenes"));
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((_NSIsNSArray() & 1) != 0)
                      {
                        objc_msgSend(v24, "_instructionsForSceneDictionaries:", v19);
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        v21 = objc_alloc_init(MPCSceneCollection);
                        -[MPCSceneCollection setVersion:](v21, "setVersion:", v16);
                        objc_msgSend(v17, "doubleValue");
                        -[MPCSceneCollection setFrameRate:](v21, "setFrameRate:");
                        -[MPCSceneCollection setScenes:](v21, "setScenes:", v23);

                        v5 = v28;
                        v4 = v29;
                        v20 = v26;
                        v6 = v27;
                        goto LABEL_30;
                      }

                    }
                  }

                }
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
            if (v12)
              continue;
            break;
          }
        }

        v5 = v28;
        v4 = v29;
        v8 = v26;
        v6 = v27;
        v9 = v25;
      }

    }
  }
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v5;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_ERROR, "MPCScriptedSceneCollectionParser: sceneCollectionForScriptData: Well-formatted V1 scene script not found [returning nil] JSONObject=%{public}@", buf, 0xCu);
  }
  v21 = 0;
LABEL_30:

  return v21;
}

+ (id)_instructionsForSceneDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MPCScene *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if (_NSIsNSDictionary())
        {
          v11 = objc_alloc_init(MPCScene);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("start_frame"), (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSNumber())
            -[MPCScene setStartFrame:](v11, "setStartFrame:", objc_msgSend(v12, "integerValue"));
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("end_frame"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSNumber())
            -[MPCScene setEndFrame:](v11, "setEndFrame:", objc_msgSend(v13, "integerValue"));
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("iterations"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSNumber())
            -[MPCScene setIterations:](v11, "setIterations:", objc_msgSend(v14, "integerValue"));
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

@end
