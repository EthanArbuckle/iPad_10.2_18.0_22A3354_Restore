@implementation _CDVisionSignalGradingDataCollectionTask

- (_CDVisionSignalGradingDataCollectionTask)initWithFile:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  _CDVisionSignalGradingDataCollectionTask *v9;
  _CDVisionSignalGradingDataCollectionTask *v10;
  uint64_t v11;
  VisionSignalGradingVisionGradeEvent *event;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CDVisionSignalGradingDataCollectionTask;
  v9 = -[_CDVisionSignalGradingDataCollectionTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_file, a3);
    -[_CDVisionSignalGradingDataCollectionTask eventFromFile:](v10, "eventFromFile:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    event = v10->_event;
    v10->_event = (VisionSignalGradingVisionGradeEvent *)v11;

    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[objc_class sharedInstance](getPETEventTracker2Class(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_event)
  {
    v6 = v3;
    objc_msgSend(v3, "logMessage:");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDVisionSignalGradingDataCollectionTask file](self, "file");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v5, 0);

    v3 = v6;
  }

}

- (id)eventFromFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v12;
  id v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 2, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_CDVisionSignalGradingDataCollectionTask eventFromFile:].cold.2((uint64_t)v4, (uint64_t)v6, v7);
    v8 = 0;
  }
  else
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v7)
    {
      +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_CDVisionSignalGradingDataCollectionTask eventFromFile:].cold.1((uint64_t)v7, v10);

      v8 = 0;
    }
    else
    {
      -[_CDVisionSignalGradingDataCollectionTask eventFromDict:](self, "eventFromDict:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

- (id)eventFromDict:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  _UNKNOWN **v8;
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
  _UNKNOWN **v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  uint64_t v40;
  id obj;
  void *v42;
  void *context;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v38 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v42 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("visionGrades"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  v39 = v4;
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("identifier");
    v8 = &off_1E26E0000;
    v9 = *(_QWORD *)v53;
    do
    {
      v10 = 0;
      v40 = v6;
      do
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v10);
        context = (void *)MEMORY[0x193FEE914]();
        v12 = (void *)objc_opt_new();
        objc_msgSend(v11, "objectForKeyedSubscript:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIdentifier:", v13);

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("imageGrade"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setImageGrade:", objc_msgSend(v14, "BOOLValue"));

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("numPeople"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setNumPeople:", objc_msgSend(v15, "intValue"));

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cameraRollGrade"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCameraRollGrade:", objc_msgSend(v16, "BOOLValue"));

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("extractedGrade"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setExtractedGrade:", objc_msgSend(v17, "BOOLValue"));

        if (objc_msgSend(v12, "extractedGrade"))
        {
          v18 = v9;
          v19 = v8;
          v20 = v7;
          v21 = (void *)objc_opt_new();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("extractedIds"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v49;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v49 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(v21, "addObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v26++), v38);
              }
              while (v24 != v26);
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            }
            while (v24);
          }

          objc_msgSend(v12, "setExtractedSignals:", v21);
          v7 = v20;
          v8 = v19;
          v9 = v18;
          v4 = v39;
          v6 = v40;
        }
        objc_msgSend(v4, "addObject:", v12, v38);

        objc_autoreleasePoolPop(context);
        ++v10;
      }
      while (v10 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v6);
  }

  objc_msgSend(v38, "setVisionGrades:", v4);
  v27 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("popularityDict"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v45;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v32);
        v34 = (void *)objc_opt_new();
        objc_msgSend(v34, "setIdentifier:", v33);
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("popularityDict"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setCount:", objc_msgSend(v36, "intValue"));

        objc_msgSend(v27, "addObject:", v34);
        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v30);
  }

  objc_msgSend(v38, "setPopularityEntries:", v27);
  return v38;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (NSString)file
{
  return self->_file;
}

- (VisionSignalGradingVisionGradeEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)eventFromFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving vision siginal grading data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)eventFromFile:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Error reading vision signal grading data from file %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
