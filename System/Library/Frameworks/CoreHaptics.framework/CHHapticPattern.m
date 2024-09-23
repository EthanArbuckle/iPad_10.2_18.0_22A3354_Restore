@implementation CHHapticPattern

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterCurves, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_embeddedResourceInfo, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
  objc_storeStrong((id *)&self->_patternID, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_ahapBaseURL, 0);
}

- (NSArray)parameterCurves
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_parameterCurves);
}

- (id)resolveExternalResources:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  __int128 v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSURL *v16;
  void *v17;
  void *v18;
  CHHapticEvent *v19;
  void *v20;
  unint64_t v21;
  CHHapticEvent *v22;
  void *v23;
  CHHapticEvent *v24;
  char v25;
  char v26;
  NSObject *v27;
  id v28;
  CHHapticEvent *v29;
  CHHapticEventType v30;
  void *v31;
  __int128 v33;
  int v34;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v36, "serverConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v6, "supportsAudioPlayback");

  v7 = 0;
  *(_QWORD *)&v8 = 136315650;
  v33 = v8;
  while (1)
  {
    -[CHHapticPattern events](self, "events", v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7 < objc_msgSend(v9, "count");

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    -[CHHapticPattern events](self, "events");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CHHapticEventTypeAudioResourceIndex))
      break;
    if (objc_msgSend(v13, "isEqualToString:", CHHapticEventTypeAudioCustom))
    {
      v25 = objc_msgSend(v36, "doReferenceAudioResourceByID:", objc_msgSend(v12, "audioResID"));
      v26 = a4 ? v25 : 1;
      if ((v26 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4824, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
    }
    objc_msgSend(v5, "addObject:", v12);
LABEL_22:

    ++v7;
  }
  if (!v34)
  {
    if (kHAPIScope)
    {
      v27 = *(id *)kHAPIScope;
      if (!v27)
      {
LABEL_20:
        v29 = [CHHapticEvent alloc];
        v30 = CHHapticEventTypeAudioContinuous;
        objc_msgSend(v12, "eventParameters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "relativeTime");
        v19 = -[CHHapticEvent initWithEventType:parameters:relativeTime:duration:](v29, "initWithEventType:parameters:relativeTime:duration:", v30, v17);
        objc_msgSend(v5, "addObject:", v19);
        goto LABEL_21;
      }
    }
    else
    {
      v27 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v33;
      v38 = "CHHapticPattern.mm";
      v39 = 1024;
      v40 = 365;
      v41 = 2080;
      v42 = "-[CHHapticPattern resolveExternalResources:error:]";
      _os_log_impl(&dword_1B573F000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Skipping Custom Audio event - server does not support audio", buf, 0x1Cu);
    }

    goto LABEL_20;
  }
  v14 = objc_msgSend(v12, "audioResID");
  -[NSMutableArray objectAtIndexedSubscript:](self->_embeddedResourceInfo, "objectAtIndexedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "url");
  v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
  FullURLPathFromURL(v16, self->_ahapBaseURL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray objectAtIndexedSubscript:](self->_embeddedResourceInfo, "objectAtIndexedSubscript:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "options");
  v19 = (CHHapticEvent *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[CHHapticEngine doRegisterAudioResource:options:fromPattern:player:error:](CHHapticEngine, "doRegisterAudioResource:options:fromPattern:player:error:", v17, v19, 1, v20, a4);

  if (v21)
  {
    v22 = [CHHapticEvent alloc];
    objc_msgSend(v12, "eventParameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "relativeTime");
    v24 = -[CHHapticEvent initWithAudioResourceID:parameters:relativeTime:](v22, "initWithAudioResourceID:parameters:relativeTime:", v21, v23);
    objc_msgSend(v5, "addObject:", v24);

LABEL_21:
    goto LABEL_22;
  }

LABEL_26:
  v31 = 0;
LABEL_27:

  return v31;
}

- (NSArray)events
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_events);
}

- (NSString)patternID
{
  return self->_patternID;
}

- (NSArray)parameters
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_parameters);
}

+ (id)eventListFromEvents:(id)a3 parameters:(id)a4 parameterCurves:(id)a5 engine:(id)a6 privileged:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  HapticCommandConverter *v14;
  void *v15;
  HapticCommandConverter *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v7 = a7;
  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v35 = a4;
  v34 = a5;
  v12 = a6;
  v32 = v11;
  if (v7)
  {
    +[CHHapticPattern addHapticsForWheelsOfTime:](CHHapticPattern, "addHapticsForWheelsOfTime:", v11);
    v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = v11;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count") + objc_msgSend(v33, "count") + objc_msgSend(v34, "count"));
  v14 = [HapticCommandConverter alloc];
  objc_msgSend(v12, "serverConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HapticCommandConverter initWithServerConfig:](v14, "initWithServerConfig:", v15);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v35;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v46;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(obj);
        -[HapticCommandConverter eventForDynamicParameterEntry:](v16, "eventForDynamicParameterEntry:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v19));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v13, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v17);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v21 = v34;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v42;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v21);
        -[HapticCommandConverter eventForParameterCurveEntry:](v16, "eventForParameterCurveEntry:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v24));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v13, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v22);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v26 = v33;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v38;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v26);
        -[HapticCommandConverter eventForEventEntry:engine:privileged:](v16, "eventForEventEntry:engine:privileged:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v29), v12, v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend(v13, "addObject:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v27);
  }

  return v13;
}

- (CHHapticPattern)initWithEvents:(NSArray *)events parameters:(NSArray *)parameters error:(NSError *)outError
{
  NSArray *v7;
  NSArray *v8;
  CHHapticPattern *v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  NSMutableArray *v13;
  objc_super v15;

  v7 = events;
  v8 = parameters;
  setupHapticLogScopes();
  v15.receiver = self;
  v15.super_class = (Class)CHHapticPattern;
  v9 = -[CHHapticPattern init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
    v11 = v9->_events;
    v9->_events = (NSMutableArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v8);
    v13 = v9->_parameters;
    v9->_parameters = (NSMutableArray *)v12;

  }
  return v9;
}

- (NSTimeInterval)duration
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  double v18;
  double v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  double v32;
  double v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v3 = self->_events;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v48;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v48 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v8, "fullDuration");
        v10 = v9;
        objc_msgSend(v8, "relativeTime");
        if (v10 + v11 > v6)
        {
          objc_msgSend(v8, "relativeTime");
          v6 = v10 + v12;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = self->_parameters;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v17, "relativeTime");
        if (v18 > v6)
        {
          objc_msgSend(v17, "relativeTime");
          v6 = v19;
        }
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v14);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v20 = self->_parameterCurves;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
        objc_msgSend(v24, "relativeTime");
        v26 = v25;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v24, "controlPoints", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v36;
          do
          {
            for (m = 0; m != v28; ++m)
            {
              if (*(_QWORD *)v36 != v29)
                objc_enumerationMutation(v27);
              v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * m);
              objc_msgSend(v31, "relativeTime");
              if (v26 + v32 > v6)
              {
                objc_msgSend(v31, "relativeTime");
                v6 = v26 + v33;
              }
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
          }
          while (v28);
        }

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v21);
  }

  return v6;
}

+ (id)addHapticsForWheelsOfTime:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  int v18;
  float v19;
  CHHapticEvent *v20;
  CHHapticEventType v21;
  CHHapticEventParameter *v22;
  double v23;
  CHHapticEventParameter *v24;
  double v25;
  CHHapticEventParameter *v26;
  double v27;
  uint64_t v28;
  CHHapticEventParameter *v29;
  double v30;
  float v31;
  CHHapticEvent *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  _QWORD v56[2];
  _QWORD v57[3];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v55 = 0;
  v37 = a3;
  +[CHHapticEvent parameterValuesFromLegacyEventType:sharpness:fullness:error:](CHHapticEvent, "parameterValuesFromLegacyEventType:sharpness:fullness:error:", 26453, (char *)&v55 + 4, &v55, 0);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = (id)objc_msgSend(v37, "mutableCopy");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v4)
  {
    v44 = *(_QWORD *)v52;
    do
    {
      v45 = v4;
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v52 != v44)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v6, "type");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CHHapticEventTypeWheelsOfTime);

        if (v8)
        {
          objc_msgSend(v6, "relativeTime");
          v10 = v9;
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v6, "eventParameters");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
          v13 = -1.0;
          if (v12)
          {
            v14 = *(_QWORD *)v48;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v48 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                objc_msgSend(v16, "parameterID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqualToString:", CHHapticEventParameterIDHapticIntensity);

                if (v18)
                {
                  objc_msgSend(v16, "value");
                  v13 = v19;
                  goto LABEL_17;
                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_17:

          v20 = [CHHapticEvent alloc];
          v21 = CHHapticEventTypeHapticTransient;
          v22 = [CHHapticEventParameter alloc];
          if (v13 < 0.0)
          {
            LODWORD(v23) = HIDWORD(v55);
            v42 = -[CHHapticEventParameter initWithParameterID:value:](v22, "initWithParameterID:value:", CHHapticEventParameterIDHapticSharpnessSelect, v23);
            v56[0] = v42;
            v29 = [CHHapticEventParameter alloc];
            LODWORD(v30) = v55;
            v41 = -[CHHapticEventParameter initWithParameterID:value:](v29, "initWithParameterID:value:", CHHapticEventParameterIDHapticFullnessSelect, v30);
            v56[1] = v41;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
            v28 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v28;
          }
          else
          {
            *(float *)&v23 = v13;
            v43 = -[CHHapticEventParameter initWithParameterID:value:](v22, "initWithParameterID:value:", CHHapticEventParameterIDHapticIntensity, v23);
            v57[0] = v43;
            v24 = [CHHapticEventParameter alloc];
            LODWORD(v25) = HIDWORD(v55);
            v40 = -[CHHapticEventParameter initWithParameterID:value:](v24, "initWithParameterID:value:", CHHapticEventParameterIDHapticSharpnessSelect, v25);
            v57[1] = v40;
            v26 = [CHHapticEventParameter alloc];
            LODWORD(v27) = v55;
            v39 = -[CHHapticEventParameter initWithParameterID:value:](v26, "initWithParameterID:value:", CHHapticEventParameterIDHapticFullnessSelect, v27);
            v57[2] = v39;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
            v28 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v28;
          }
          v31 = v10;
          v32 = -[CHHapticEvent initWithEventType:parameters:relativeTime:](v20, "initWithEventType:parameters:relativeTime:", v21, v28, v31);
          v33 = v3;
          v35 = (void *)v41;
          v34 = (void *)v42;
          if (v13 >= 0.0)
          {

            v33 = (void *)v39;
            v35 = (void *)v40;
            v34 = (void *)v43;
          }

          objc_msgSend(obj, "addObject:", v32);
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v4);
  }

  return obj;
}

- (float)version
{
  float result;

  -[NSNumber floatValue](self->_version, "floatValue");
  return result;
}

- (NSString)locality
{
  return (NSString *)-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("Locality"));
}

- (NSString)priority
{
  return (NSString *)-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("Priority"));
}

- (NSString)hapticPowerUsage
{
  return (NSString *)-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("HapticPowerUsage"));
}

- (NSString)audioPowerUsage
{
  return (NSString *)-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("AudioPowerUsage"));
}

- (NSString)usageCategory
{
  return (NSString *)-[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("UsageCategory"));
}

- (CHHapticPattern)init
{

  return 0;
}

- (CHHapticPattern)initWithEvents:(NSArray *)events parameterCurves:(NSArray *)parameterCurves error:(NSError *)outError
{
  NSArray *v7;
  NSArray *v8;
  CHHapticPattern *v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  NSMutableArray *v13;
  objc_super v15;

  v7 = events;
  v8 = parameterCurves;
  setupHapticLogScopes();
  v15.receiver = self;
  v15.super_class = (Class)CHHapticPattern;
  v9 = -[CHHapticPattern init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
    v11 = v9->_events;
    v9->_events = (NSMutableArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v8);
    v13 = v9->_parameterCurves;
    v9->_parameterCurves = (NSMutableArray *)v12;

  }
  return v9;
}

- (CHHapticPattern)initWithDictionary:(NSDictionary *)patternDict error:(NSError *)outError
{
  NSDictionary *v6;
  CHHapticPattern *v7;
  CHHapticPattern *v8;
  objc_super v10;

  v6 = patternDict;
  setupHapticLogScopes();
  v10.receiver = self;
  v10.super_class = (Class)CHHapticPattern;
  v7 = -[CHHapticPattern init](&v10, sel_init);
  v8 = v7;
  if (v7 && !-[CHHapticPattern doInitWithDictionary:error:](v7, "doInitWithDictionary:error:", v6, outError))
  {

    v8 = 0;
  }

  return v8;
}

- (BOOL)doInitWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  HapticDictionaryReader *v7;
  NSNumber *v8;
  NSNumber *version;
  float v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  NSDictionary *v14;
  NSDictionary *configurationDictionary;
  NSMutableArray *v16;
  NSMutableArray *embeddedResourceInfo;
  NSURL *ahapBaseURL;
  void *v19;
  _QWORD v21[6];
  _BYTE buf[40];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(HapticDictionaryReader);
  -[HapticDictionaryReader readAndVerifyVersion:error:](v7, "readAndVerifyVersion:error:", v6, a4);
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  self->_version = v8;

  if (!self->_version)
  {
    v12 = 0;
    goto LABEL_16;
  }
  -[CHHapticPattern version](self, "version");
  if (v10 > 1.0)
  {
    if (kHAPIScope)
    {
      v11 = *(id *)kHAPIScope;
      if (!v11)
      {
LABEL_11:
        -[HapticDictionaryReader parseConfiguration:error:](v7, "parseConfiguration:error:", v6, a4);
        v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        configurationDictionary = self->_configurationDictionary;
        self->_configurationDictionary = v14;

        goto LABEL_12;
      }
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)&buf[4] = "CHHapticPattern.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 151;
      *(_WORD *)&buf[18] = 2080;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[20] = "-[CHHapticPattern doInitWithDictionary:error:]";
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = 0x3FF0000000000000;
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Pattern version > %.1f - looking for config dictionary", buf, 0x26u);
    }

    goto LABEL_11;
  }
LABEL_12:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__2;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__2;
  v23 = 0;
  -[HapticDictionaryReader scanForEmbeddedResources:](v7, "scanForEmbeddedResources:", v6);
  v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  embeddedResourceInfo = self->_embeddedResourceInfo;
  self->_embeddedResourceInfo = v16;

  ahapBaseURL = self->_ahapBaseURL;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__CHHapticPattern_doInitWithDictionary_error___block_invoke;
  v21[3] = &unk_1E6960578;
  v21[4] = self;
  v21[5] = buf;
  -[HapticDictionaryReader parseEventsAndParameters:withBaseURL:reply:](v7, "parseEventsAndParameters:withBaseURL:reply:", v6, ahapBaseURL, v21);
  v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v12 = v19 == 0;
  if (a4 && v19)
    *a4 = objc_retainAutorelease(v19);
  _Block_object_dispose(buf, 8);

LABEL_16:
  return v12;
}

void __46__CHHapticPattern_doInitWithDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 48);
  *(_QWORD *)(v13 + 48) = v9;
  v23 = v9;

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 56);
  *(_QWORD *)(v15 + 56) = v10;
  v17 = v10;

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 64);
  *(_QWORD *)(v18 + 64) = v11;
  v20 = v11;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v12;

}

- (CHHapticPattern)initWithContentsOfURL:(NSURL *)ahapURL error:(NSError *)outError
{
  NSURL *v6;
  CHHapticPattern *v7;
  uint64_t v8;
  NSURL *ahapBaseURL;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = ahapURL;
  setupHapticLogScopes();
  v31.receiver = self;
  v31.super_class = (Class)CHHapticPattern;
  v7 = -[CHHapticPattern init](&v31, sel_init);
  if (v7)
  {
    -[NSURL URLByDeletingLastPathComponent](v6, "URLByDeletingLastPathComponent");
    v8 = objc_claimAutoreleasedReturnValue();
    ahapBaseURL = v7->_ahapBaseURL;
    v7->_ahapBaseURL = (NSURL *)v8;

    if (-[NSURL isFileURL](v6, "isFileURL"))
    {
      -[NSURL path](v6, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("json")))
      {

        goto LABEL_9;
      }
      -[NSURL path](v6, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("ahap"));

      if (v16)
      {
LABEL_9:
        v17 = (void *)MEMORY[0x1E0C99D50];
        -[NSURL path](v6, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dataWithContentsOfFile:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v19, 0, &v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v30;

        if (v20)
        {
          v29 = v21;
          v22 = -[CHHapticPattern doInitWithDictionary:error:](v7, "doInitWithDictionary:error:", v20, &v29);
          v23 = v29;

          v21 = v23;
          if (v22)
          {
            if (!outError)
              goto LABEL_29;
            goto LABEL_28;
          }
LABEL_27:

          v7 = 0;
          if (!outError)
          {
LABEL_29:

            goto LABEL_30;
          }
LABEL_28:
          *outError = (NSError *)objc_retainAutorelease(v21);
          goto LABEL_29;
        }
LABEL_19:
        if (kHAPIScope)
        {
          v25 = *(id *)kHAPIScope;
          if (!v25)
          {
LABEL_26:
            v20 = 0;
            goto LABEL_27;
          }
        }
        else
        {
          v25 = MEMORY[0x1E0C81028];
          v26 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v33 = "CHHapticPattern.mm";
          v34 = 1024;
          v35 = 212;
          v36 = 2080;
          v37 = "-[CHHapticPattern initWithContentsOfURL:error:]";
          v38 = 2112;
          v39 = v21;
          _os_log_impl(&dword_1B573F000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: AHAP dictionary is corrupt: %@", buf, 0x26u);
        }

        goto LABEL_26;
      }
      if (kHAPIScope)
      {
        v12 = *(id *)kHAPIScope;
        if (!v12)
        {
          v13 = -4809;
          goto LABEL_18;
        }
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v28 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "CHHapticPattern.mm";
        v34 = 1024;
        v35 = 197;
        v36 = 2080;
        v37 = "-[CHHapticPattern initWithContentsOfURL:error:]";
        _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: File type is not supported", buf, 0x1Cu);
      }
      v13 = -4809;
    }
    else
    {
      if (kHAPIScope)
      {
        v12 = *(id *)kHAPIScope;
        if (!v12)
        {
          v13 = -4851;
LABEL_18:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v13, 0);
          v21 = (id)objc_claimAutoreleasedReturnValue();

          v7 = 0;
          goto LABEL_19;
        }
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v24 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "CHHapticPattern.mm";
        v34 = 1024;
        v35 = 202;
        v36 = 2080;
        v37 = "-[CHHapticPattern initWithContentsOfURL:error:]";
        _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Incoming URL not a valid file path", buf, 0x1Cu);
      }
      v13 = -4851;
    }

    goto LABEL_18;
  }
LABEL_30:

  return v7;
}

- (NSDictionary)exportDictionaryAndReturnError:(NSError *)outError
{
  HapticDictionaryWriter *v4;
  void *v5;

  v4 = objc_alloc_init(HapticDictionaryWriter);
  -[HapticDictionaryWriter patternToDictionary:events:parameters:parameterCurves:embeddedResourceInfo:configuration:](v4, "patternToDictionary:events:parameters:parameterCurves:embeddedResourceInfo:configuration:", self->_version, self->_events, self->_parameters, self->_parameterCurves, self->_embeddedResourceInfo, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (id)exportDictionaryWithConfigurationAndReturnError:(id *)a3
{
  HapticDictionaryWriter *v4;
  void *v5;

  v4 = objc_alloc_init(HapticDictionaryWriter);
  -[HapticDictionaryWriter patternToDictionary:events:parameters:parameterCurves:embeddedResourceInfo:configuration:](v4, "patternToDictionary:events:parameters:parameterCurves:embeddedResourceInfo:configuration:", self->_version, self->_events, self->_parameters, self->_parameterCurves, self->_embeddedResourceInfo, self->_configurationDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)eventListFromDictionary:(id)a3 error:(id *)a4
{
  return 0;
}

+ (id)patternForKey:(id)a3 error:(id *)a4
{
  __CFString *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  __CFString *v17;
  CHHapticPattern *v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  __CFString *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v49 = "CHHapticPattern.mm";
    v50 = 1024;
    v51 = 482;
    v52 = 2080;
    v53 = "+[CHHapticPattern patternForKey:error:]";
    v54 = 2112;
    v55 = v6;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Creating pattern for key '%@'", buf, 0x26u);
  }

LABEL_8:
  if (kHAPIScope)
  {
    v9 = *(id *)kHAPIScope;
    if (!v9)
      goto LABEL_15;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v49 = "CHHapticPattern.mm";
    v50 = 1024;
    v51 = 484;
    v52 = 2080;
    v53 = "+[CHHapticPattern patternForKey:error:]";
    v54 = 2112;
    v55 = CFSTR("/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist");
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern library path: %@", buf, 0x26u);
  }

LABEL_15:
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", CFSTR("/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist"), 0, &v47);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (__CFString *)v47;
  if (!v12)
  {
    if (kHAPIScope)
    {
      v15 = *(id *)kHAPIScope;
      if (!v15)
        goto LABEL_31;
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v49 = "CHHapticPattern.mm";
      v50 = 1024;
      v51 = 491;
      v52 = 2080;
      v53 = "+[CHHapticPattern patternForKey:error:]";
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Read pattern library data", buf, 0x1Cu);
    }

LABEL_31:
    v46 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, &v46);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = (__CFString *)v46;
    if (v21)
    {
      v22 = v21;
      if (kHAPIScope)
      {
        v23 = *(id *)kHAPIScope;
        if (!v23)
        {
LABEL_42:
          v17 = objc_retainAutorelease(v22);
          v18 = 0;
          *a4 = v17;
LABEL_101:

          goto LABEL_102;
        }
      }
      else
      {
        v23 = MEMORY[0x1E0C81028];
        v25 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v49 = "CHHapticPattern.mm";
        v50 = 1024;
        v51 = 495;
        v52 = 2080;
        v53 = "+[CHHapticPattern patternForKey:error:]";
        v54 = 2112;
        v55 = v22;
        _os_log_impl(&dword_1B573F000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to load pattern library: %@", buf, 0x26u);
      }

      goto LABEL_42;
    }
    if (kHAPIScope)
    {
      v24 = *(id *)kHAPIScope;
      if (!v24)
        goto LABEL_47;
    }
    else
    {
      v24 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v49 = "CHHapticPattern.mm";
      v50 = 1024;
      v51 = 499;
      v52 = 2080;
      v53 = "+[CHHapticPattern patternForKey:error:]";
      v54 = 2112;
      v55 = v20;
      _os_log_impl(&dword_1B573F000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Loaded pattern library dict:\n%@", buf, 0x26u);
    }

LABEL_47:
    -[__CFString objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if (kHAPIScope)
      {
        v28 = *(id *)kHAPIScope;
        if (!v28)
          goto LABEL_58;
      }
      else
      {
        v28 = MEMORY[0x1E0C81028];
        v30 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        v49 = "CHHapticPattern.mm";
        v50 = 1024;
        v51 = 507;
        v52 = 2080;
        v53 = "+[CHHapticPattern patternForKey:error:]";
        v54 = 2112;
        v55 = v6;
        v56 = 2112;
        v57 = v27;
        _os_log_impl(&dword_1B573F000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: '%@' path: %@", buf, 0x30u);
      }

LABEL_58:
      v45 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v27, 0, &v45);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (__CFString *)v45;
      if (!v32 && v31)
      {
        if (kHAPIScope)
        {
          v33 = *(id *)kHAPIScope;
          if (!v33)
            goto LABEL_75;
        }
        else
        {
          v33 = MEMORY[0x1E0C81028];
          v36 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v49 = "CHHapticPattern.mm";
          v50 = 1024;
          v51 = 515;
          v52 = 2080;
          v53 = "+[CHHapticPattern patternForKey:error:]";
          v54 = 2112;
          v55 = v6;
          _os_log_impl(&dword_1B573F000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Read '%@' pattern data", buf, 0x26u);
        }

LABEL_75:
        v44 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v31, 0, &v44);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (__CFString *)v44;
        if (!v17 && v37)
        {
          if (kHAPIScope)
          {
            v38 = *(id *)kHAPIScope;
            if (!v38)
            {
LABEL_92:
              v18 = -[CHHapticPattern initWithDictionary:error:]([CHHapticPattern alloc], "initWithDictionary:error:", v37, a4);
              objc_storeStrong((id *)&v18->_patternID, a3);
LABEL_98:

              goto LABEL_99;
            }
          }
          else
          {
            v38 = MEMORY[0x1E0C81028];
            v41 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v49 = "CHHapticPattern.mm";
            v50 = 1024;
            v51 = 523;
            v52 = 2080;
            v53 = "+[CHHapticPattern patternForKey:error:]";
            v54 = 2112;
            v55 = v6;
            _os_log_impl(&dword_1B573F000, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Serialized '%@' pattern dict", buf, 0x26u);
          }

          goto LABEL_92;
        }
        if (kHAPIScope)
        {
          v39 = *(id *)kHAPIScope;
          if (!v39)
          {
LABEL_97:
            v18 = 0;
            *a4 = objc_retainAutorelease(v17);
            goto LABEL_98;
          }
        }
        else
        {
          v39 = MEMORY[0x1E0C81028];
          v42 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v49 = "CHHapticPattern.mm";
          v50 = 1024;
          v51 = 519;
          v52 = 2080;
          v53 = "+[CHHapticPattern patternForKey:error:]";
          v54 = 2112;
          v55 = v17;
          _os_log_impl(&dword_1B573F000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to serialize pattern data: %@", buf, 0x26u);
        }

        goto LABEL_97;
      }
      if (kHAPIScope)
      {
        v34 = *(id *)kHAPIScope;
        if (!v34)
        {
LABEL_87:
          v17 = objc_retainAutorelease(v32);
          v18 = 0;
          *a4 = v17;
LABEL_99:

          goto LABEL_100;
        }
      }
      else
      {
        v34 = MEMORY[0x1E0C81028];
        v40 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v49 = "CHHapticPattern.mm";
        v50 = 1024;
        v51 = 511;
        v52 = 2080;
        v53 = "+[CHHapticPattern patternForKey:error:]";
        v54 = 2112;
        v55 = v32;
        _os_log_impl(&dword_1B573F000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to read pattern data: %@", buf, 0x26u);
      }

      goto LABEL_87;
    }
    if (kHAPIScope)
    {
      v29 = *(id *)kHAPIScope;
      if (!v29)
      {
LABEL_70:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4851, 0);
        v17 = 0;
        v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_100:

        goto LABEL_101;
      }
    }
    else
    {
      v29 = MEMORY[0x1E0C81028];
      v35 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v49 = "CHHapticPattern.mm";
      v50 = 1024;
      v51 = 503;
      v52 = 2080;
      v53 = "+[CHHapticPattern patternForKey:error:]";
      v54 = 2112;
      v55 = v6;
      _os_log_impl(&dword_1B573F000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Haptic pattern with key '%@' not found", buf, 0x26u);
    }

    goto LABEL_70;
  }
  v13 = v12;
  if (!kHAPIScope)
  {
    v14 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  v14 = *(id *)kHAPIScope;
  if (v14)
  {
LABEL_23:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v49 = "CHHapticPattern.mm";
      v50 = 1024;
      v51 = 487;
      v52 = 2080;
      v53 = "+[CHHapticPattern patternForKey:error:]";
      v54 = 2112;
      v55 = v13;
      _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to read pattern library data: %@", buf, 0x26u);
    }

  }
  v17 = objc_retainAutorelease(v13);
  v18 = 0;
  *a4 = v17;
LABEL_102:

  return v18;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

@end
