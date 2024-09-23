@implementation BMDSLTransforms

+ (id)arrayTuplesToDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)durationForEventWithTimestamp:(id)a3 isStart:(id)a4 key:(id)a5 startEventsState:(id)a6
{
  return +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:](BMDSLTransforms, "durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:", a3, a4, a5, CFSTR("key"), a6, 0);
}

+ (id)durationForEventWithTimestamp:(id)a3 isStart:(id)a4 key:(id)a5 keyName:(id)a6 startEventsState:(id)a7 metadata:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v15)
  {
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:].cold.1();
    goto LABEL_16;
  }
  v19 = objc_msgSend(v14, "BOOLValue");
  objc_msgSend(v17, "objectForKeyedSubscript:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (v20)
    {
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:].cold.2();

    }
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v15);
    goto LABEL_17;
  }
  if (!v20)
  {
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:].cold.3();
    goto LABEL_16;
  }
  objc_msgSend(v13, "doubleValue");
  v24 = v23;
  objc_msgSend(v17, "objectForKeyedSubscript:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v24 - v26;

  if (v27 < 0.0)
  {
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:].cold.4();
LABEL_16:

LABEL_17:
    v28 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v17, "removeObjectForKey:", v15);
  if (v18)
  {
    v36[0] = v15;
    v35[0] = v16;
    v35[1] = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = CFSTR("metadata");
    v36[1] = v30;
    v36[2] = v18;
    v31 = (void *)MEMORY[0x1E0C99D80];
    v32 = v36;
    v33 = v35;
    v34 = 3;
  }
  else
  {
    v37[0] = v16;
    v37[1] = CFSTR("duration");
    v38[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v30;
    v31 = (void *)MEMORY[0x1E0C99D80];
    v32 = v38;
    v33 = v37;
    v34 = 2;
  }
  objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v28;
}

+ (id)firstEventOfDayWithEvent:(id)a3 timestamp:(id)a4 lastTimestampBuffer:(id)a5 dayStartOffset:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v12, "integerValue") < 0 || objc_msgSend(v12, "integerValue") >= 86400)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[BMDSLTransforms firstEventOfDayWithEvent:timestamp:lastTimestampBuffer:dayStartOffset:].cold.1((uint64_t)v12);
    v13 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("lastTimestamp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("lastTimestamp"));
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v10, "doubleValue");
      v17 = v16;
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:", v17 - v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v14, "doubleValue");
      v22 = v21;
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:", v22 - v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "isDate:inSameDayAsDate:", v19, v24) & 1) != 0)
        v13 = 0;
      else
        v13 = v9;

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (id)allowedTransforms
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E5E3BB70);
}

+ (id)allowedClasses
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E5E3BB88);
}

+ (void)durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB18000, v0, v1, "Duration transform: key is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB18000, v0, v1, "Duration transform: unexpected starting event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB18000, v0, v1, "Duration transform: unexpected non-starting event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB18000, v0, v1, "Duration transform: dropping invalid duration (<0).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)firstEventOfDayWithEvent:(uint64_t)a1 timestamp:lastTimestampBuffer:dayStartOffset:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1AEB18000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid dayStartOffset %@. It should be greater than or equal to 0 and less than 86400.", (uint8_t *)&v1, 0xCu);
}

@end
