@implementation HapticDictionaryWriter

- (id)patternToDictionary:(id)a3 events:(id)a4 parameters:(id)a5 parameterCurves:(id)a6 embeddedResourceInfo:(id)a7 configuration:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
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
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v44 = a4;
  v43 = a5;
  v42 = a6;
  v15 = a7;
  v45 = a8;
  v41 = v14;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CHHapticPatternKeyVersion);
  if (v45)
  {
    v17 = (void *)objc_msgSend(v45, "copy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CHHapticPatternKeyConfiguration);

  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CHHapticPatternKeyPattern);

  if (objc_msgSend(v44, "count"))
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v19 = v44;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v55;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v55 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v22);
          objc_msgSend(v16, "objectForKeyedSubscript:", CHHapticPatternKeyPattern);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HapticDictionaryWriter eventToDictionary:embeddedResourceInfo:](self, "eventToDictionary:embeddedResourceInfo:", v23, v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v20);
    }

  }
  if (objc_msgSend(v43, "count"))
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v26 = v43;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v51;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v51 != v28)
            objc_enumerationMutation(v26);
          v30 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v29);
          objc_msgSend(v16, "objectForKeyedSubscript:", CHHapticPatternKeyPattern);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[HapticDictionaryWriter paramToDictionary:](self, "paramToDictionary:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v32);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v27);
    }

  }
  if (objc_msgSend(v42, "count"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v33 = v42;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v47;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v47 != v35)
            objc_enumerationMutation(v33);
          v37 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v36);
          objc_msgSend(v16, "objectForKeyedSubscript:", CHHapticPatternKeyPattern);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[HapticDictionaryWriter paramCurveToDictionary:](self, "paramCurveToDictionary:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v39);

          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v34);
    }

  }
  return v16;
}

- (id)eventToDictionary:(id)a3 embeddedResourceInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CHHapticPatternKeyEvent);

  objc_msgSend(v8, "objectForKeyedSubscript:", CHHapticPatternKeyEvent);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CHHapticEventTypeAudioCustom);

  if (v12)
  {
    if (kHAPIScope)
    {
      v13 = *(id *)kHAPIScope;
      if (!v13)
        goto LABEL_9;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v31 = 136315650;
      v32 = "HapticDictionaryWriter.mm";
      v33 = 1024;
      v34 = 74;
      v35 = 2080;
      v36 = "-[HapticDictionaryWriter eventToDictionary:embeddedResourceInfo:]";
      _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Cannot export AudioCustom events", (uint8_t *)&v31, 0x1Cu);
    }

LABEL_9:
    Haptic_RaiseException(CFSTR("CoreHapticsOperationNotPermittedException"), CFSTR("Cannot export AudioCustom events"), -4806);
  }
  objc_msgSend(v6, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CHHapticEventTypeAudioResourceIndex);

  if (v16)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CHHapticEventTypeAudioCustom, CHHapticPatternKeyEventType);
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "audioResID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CHHapticPatternKeyEventWaveformPath);

    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "audioResID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "options");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "objectForKey:", CHHapticPatternKeyEventWaveformUseVolumeEnvelope);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "BOOLValue") & 1) == 0)
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CHHapticPatternKeyEventWaveformUseVolumeEnvelope);
      objc_msgSend(v21, "objectForKey:", CHHapticPatternKeyEventWaveformLoopEnabled);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "BOOLValue"))
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CHHapticPatternKeyEventWaveformLoopEnabled);

    }
  }
  else
  {
    objc_msgSend(v6, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CHHapticPatternKeyEventType);
  }

  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "relativeTime");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CHHapticPatternKeyTime);

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "duration");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CHHapticPatternKeyEventDuration);

  objc_msgSend(v6, "eventParameters");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HapticDictionaryWriter eventParamsToArray:](self, "eventParamsToArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CHHapticPatternKeyEventParameters);

  return v8;
}

- (id)eventParamsToArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v13;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16, v13);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v7, "parameterID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CHHapticPatternKeyParameterID);

        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "value");
        objc_msgSend(v10, "numberWithFloat:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CHHapticPatternKeyParameterValue);

        objc_msgSend(v3, "addObject:", v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  return v3;
}

- (id)paramToDictionary:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CHHapticPatternKeyParameter);

  objc_msgSend(v4, "objectForKeyedSubscript:", CHHapticPatternKeyParameter);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CHHapticPatternKeyParameterID);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "relativeTime");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CHHapticPatternKeyTime);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "value");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CHHapticPatternKeyParameterValue);

  return v4;
}

- (id)paramCurveToDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CHHapticPatternKeyParameterCurve);

  objc_msgSend(v5, "objectForKeyedSubscript:", CHHapticPatternKeyParameterCurve);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CHHapticPatternKeyParameterID);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "relativeTime");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CHHapticPatternKeyTime);

  objc_msgSend(v4, "controlPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HapticDictionaryWriter paramCurveControlPointsToArray:](self, "paramCurveControlPointsToArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CHHapticPatternKeyParameterCurveControlPoints);

  return v5;
}

- (id)paramCurveControlPointsToArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v14;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16, v14);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v20[0] = CHHapticPatternKeyTime;
        v8 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "relativeTime");
        objc_msgSend(v8, "numberWithDouble:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = CHHapticPatternKeyParameterValue;
        v21[0] = v9;
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "value");
        objc_msgSend(v10, "numberWithFloat:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v12);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v4);
  }

  return v3;
}

@end
