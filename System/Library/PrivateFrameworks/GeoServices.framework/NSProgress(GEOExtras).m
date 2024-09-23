@implementation NSProgress(GEOExtras)

- (void)_geo_mirroredProgressReplaceObservedProgressWith:()GEOExtras
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "_replaceObservedProgressWith:", v4);

}

- (void)_geo_setUserInfo:()GEOExtras
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    objc_msgSend(a1, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToDictionary:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(a1, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __42__NSProgress_GEOExtras___geo_setUserInfo___block_invoke;
      v39[3] = &unk_1E1C0C998;
      v12 = v4;
      v40 = v12;
      objc_msgSend(v10, "_geo_filtered:", v39);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(a1, "setUserInfoObject:forKey:", 0, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        }
        while (v16);
      }

      objc_msgSend(v12, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v11;
      v33[1] = 3221225472;
      v33[2] = __42__NSProgress_GEOExtras___geo_setUserInfo___block_invoke_2;
      v33[3] = &unk_1E1C0C9C0;
      v33[4] = a1;
      v20 = v12;
      v34 = v20;
      objc_msgSend(v19, "_geo_filtered:", v33);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v30 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
            objc_msgSend(v20, "objectForKeyedSubscript:", v27, (_QWORD)v29);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "setUserInfoObject:forKey:", v28, v27);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        }
        while (v24);
      }

    }
  }

}

+ (_GEOMirroredProgress)_geo_progressMirroringProgress:()GEOExtras
{
  id v3;
  _GEOMirroredProgress *v4;

  v3 = a3;
  v4 = -[_GEOMirroredProgress initWithMirroredProgress:]([_GEOMirroredProgress alloc], "initWithMirroredProgress:", v3);

  return v4;
}

+ (id)_geo_newReportingXPCEndpointMirroringProgress:()GEOExtras
{
  id v3;
  _GEOProgressForSendingOverXPC *v4;
  void *v5;

  v3 = a3;
  v4 = -[_GEOProgressForSendingOverXPC initWithMirroredProgress:]([_GEOProgressForSendingOverXPC alloc], "initWithMirroredProgress:", v3);

  -[_GEOProgressForSendingOverXPC endpoint](v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (_GEOProgressForReceivingOverXPC)_geo_mirroredProgressFromReceivingXPCEndpoint:()GEOExtras
{
  id v3;
  _GEOProgressForReceivingOverXPC *v4;

  v3 = a3;
  v4 = -[_GEOProgressForReceivingOverXPC initWithEndpoint:]([_GEOProgressForReceivingOverXPC alloc], "initWithEndpoint:", v3);

  return v4;
}

+ (id)_geo_mirroredProgressForReceivingOverXPC:()GEOExtras
{
  return -[_GEOProgressForReceivingOverXPC initVendingEndpoint:]([_GEOProgressForReceivingOverXPC alloc], "initVendingEndpoint:", a3);
}

+ (id)_geo_mirroredProgressFromReportingXPCEndpoint:()GEOExtras totalUnitCount:
{
  void *v5;
  id v6;
  void *v7;
  _GEOProgressForSendingOverXPC *v8;

  v5 = (void *)MEMORY[0x1E0CB38A8];
  v6 = a3;
  objc_msgSend(v5, "discreteProgressWithTotalUnitCount:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_GEOProgressForSendingOverXPC initWithMirroredProgress:endpoint:]([_GEOProgressForSendingOverXPC alloc], "initWithMirroredProgress:endpoint:", v7, v6);

  return v7;
}

- (id)_geo_mirroredProgressXPCDictionary
{
  xpc_object_t v2;
  double v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "indeterminate", objc_msgSend(a1, "isIndeterminate"));
  objc_msgSend(a1, "fractionCompleted");
  xpc_dictionary_set_double(v2, "fraction_completed", v3);
  objc_msgSend(a1, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "kind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CB30F8]);

    if (v6)
    {
      xpc_dictionary_set_int64(v2, "kind_type", 1);
    }
    else
    {
      xpc_dictionary_set_int64(v2, "kind_type", 2);
      objc_msgSend(a1, "kind");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v2, "kind", (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4));

    }
  }
  objc_msgSend(a1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_msgSend(v8, "_geo_newXPCObject");
    if (v9)
      xpc_dictionary_set_value(v2, "user_info", v9);

  }
  return v2;
}

- (void)_geo_configureFromMirroredProgressXPCDictionary:()GEOExtras
{
  id v4;
  uint64_t v5;
  double v6;
  int64_t int64;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v4 = a3;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C812F8])
  {
    if (xpc_dictionary_get_BOOL(v4, "indeterminate"))
    {
      v5 = -1;
      objc_msgSend(a1, "setTotalUnitCount:", -1);
    }
    else
    {
      v6 = xpc_dictionary_get_double(v4, "fraction_completed");
      objc_msgSend(a1, "setTotalUnitCount:", 100);
      v5 = (uint64_t)(v6 * 100.0);
    }
    objc_msgSend(a1, "setCompletedUnitCount:", v5);
    int64 = xpc_dictionary_get_int64(v4, "kind_type");
    if (int64 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "kind"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (int64 != 1)
      {
        v9 = 0;
        goto LABEL_11;
      }
      v8 = (id)*MEMORY[0x1E0CB30F8];
    }
    v9 = v8;
LABEL_11:
    objc_msgSend(a1, "kind");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      objc_msgSend(a1, "kind");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "isEqualToString:", v12);

      if ((v13 & 1) == 0)
        objc_msgSend(a1, "setKind:", v9);
    }
    xpc_dictionary_get_value(v4, "user_info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "_geo_dictionaryFromXPCObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(a1, "_geo_setUserInfo:", v15);

    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: xpc_get_type(dictionary) == (&_xpc_type_dictionary)", v16, 2u);
  }
LABEL_20:

}

- (void)_geo_configureFromPairedDeviceProgress:()GEOExtras
{
  uint64_t v4;
  float v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "isIndeterminate"))
  {
    v4 = -1;
    objc_msgSend(a1, "setTotalUnitCount:", -1);
  }
  else
  {
    objc_msgSend(a1, "setTotalUnitCount:", 100);
    objc_msgSend(v14, "fractionCompleted");
    v4 = (uint64_t)(float)(v5 * 100.0);
  }
  objc_msgSend(a1, "setCompletedUnitCount:", v4);
  if (objc_msgSend(v14, "hasKind") && objc_msgSend(v14, "kind") == 1)
    v6 = (id)*MEMORY[0x1E0CB30F8];
  else
    v6 = 0;
  objc_msgSend(a1, "kind");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 == (id)v7)
  {

  }
  else
  {
    v8 = (void *)v7;
    objc_msgSend(a1, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
      objc_msgSend(a1, "setKind:", v6);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "hasByteTotalCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "byteTotalCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB3060]);

  }
  if (objc_msgSend(v14, "hasByteCompletedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "byteCompletedCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB3058]);

  }
  objc_msgSend(a1, "_geo_setUserInfo:", v11);

}

+ (_GEOAggregateProgress)_geo_progressAggregatingChildrenWithTotalUnitCount:()GEOExtras
{
  return -[_GEOAggregateProgress initWithTotalUnitCount:]([_GEOAggregateProgress alloc], "initWithTotalUnitCount:", a3);
}

@end
