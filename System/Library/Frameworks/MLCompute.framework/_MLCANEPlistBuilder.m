@implementation _MLCANEPlistBuilder

- (_MLCANEPlistBuilder)init
{
  _MLCANEPlistBuilder *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *plist;
  uint64_t v9;
  _MLCANEWeightOps *weightOps;
  uint64_t v11;
  NSMutableSet *weightTensorsWithDeviceMemory;
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_MLCANEPlistBuilder;
  v2 = -[_MLCANEPlistBuilder init](&v14, sel_init);
  if (v2)
  {
    v16[0] = kMLCCurrentANEIRVersion[0];
    v15[0] = CFSTR("Version");
    v15[1] = CFSTR("Networks");
    v3 = (void *)MEMORY[0x1E0C9AA60];
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v16[1] = v4;
    v15[2] = CFSTR("ProcedureList");
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v16[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    plist = v2->_plist;
    v2->_plist = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    weightOps = v2->_weightOps;
    v2->_weightOps = (_MLCANEWeightOps *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    weightTensorsWithDeviceMemory = v2->_weightTensorsWithDeviceMemory;
    v2->_weightTensorsWithDeviceMemory = (NSMutableSet *)v11;

  }
  return v2;
}

+ (id)createUnitWithLayer:(id)a3 unitParams:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v47;
  void *v48;
  const char *aSelector;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id obj;
  NSObject *log;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE buf[12];
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", kMLCANENetUnitType[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    aSelector = a2;
    v9 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    objc_msgSend(v7, "objectForKeyedSubscript:", kMLCANENetUnitType[0]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:");
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v10, "removeObjectForKey:", kMLCANENetUnitType[0]);
    v50 = v10;
    v51 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v6, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v9;
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, CFSTR("Name"));

    v12 = (void *)MEMORY[0x1E0C9AA60];
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v14 = (void *)objc_msgSend(v12, "mutableCopy");
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v6, "sourceTensors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v61 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v20, "descriptor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "dataType");

          ANE_GetANECIRDataTypeWithMLCDataType(v22);
          v23 = objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            +[MLCLog framework](MLCLog, "framework");
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v47;
              v66 = 1024;
              v67 = v22;
              v68 = 2112;
              v69 = v20;
              _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d for source tensor=%@", buf, 0x1Cu);

            }
            v44 = 0;
LABEL_34:
            v39 = v52;
            v38 = v53;
            v42 = v50;
            v41 = v51;
            goto LABEL_35;
          }
          v24 = (void *)v23;
          objc_msgSend(v13, "addObject:", v23);
          objc_msgSend(v20, "label");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v25);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v17)
          continue;
        break;
      }
    }

    -[NSObject setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v13, CFSTR("InputType"));
    -[NSObject setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v14, CFSTR("Bottom"));
    v26 = (void *)MEMORY[0x1E0C9AA60];
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    log = objc_msgSend(v26, "mutableCopy");
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v6, "resultTensors");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v57;
      while (2)
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v57 != v29)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v31, "descriptor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "dataType");

          ANE_GetANECIRDataTypeWithMLCDataType(v33);
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
            +[MLCLog framework](MLCLog, "framework");
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v48;
              v66 = 1024;
              v67 = v33;
              v68 = 2112;
              v69 = v31;
              _os_log_error_impl(&dword_1D4999000, v45, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d for result tensor=%@", buf, 0x1Cu);

            }
            v44 = 0;
            goto LABEL_34;
          }
          v35 = (void *)v34;
          objc_msgSend(v15, "addObject:", v34);
          *(_QWORD *)buf = 1;
          ANE_GetTensorFeatureChannelsWithOnePrepended(v31, (uint64_t *)buf);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)buf);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](log, "addObject:", v36);

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        if (v28)
          continue;
        break;
      }
    }

    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v53;
    -[NSObject setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v37, CFSTR("OutputType"));

    v39 = v52;
    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("Broadcast")) & 1) == 0
      && (objc_msgSend(v52, "isEqualToString:", CFSTR("Reshape")) & 1) == 0
      && (objc_msgSend(v52, "isEqualToString:", CFSTR("InputView")) & 1) == 0)
    {
      -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v40, CFSTR("OutputChannels"));

    }
    v41 = v51;
    v42 = v50;
    if (objc_msgSend(v51, "count"))
    {
      v43 = (void *)objc_msgSend(v51, "mutableCopy");
      -[NSObject setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v43, CFSTR("Params"));

    }
    v44 = v53;
LABEL_35:

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:].cold.1();
    v44 = 0;
    v41 = v7;
  }

  return v44;
}

+ (id)buildBiasParamsWithBiases:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C9AA70];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("BiasMutable"));

  objc_msgSend(v4, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ANE_GetANECIRDataTypeWithMLCDataType(objc_msgSend(v9, "dataType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UInt8")) & 1) == 0
      && !objc_msgSend(v11, "isEqualToString:", CFSTR("Int8")))
    {
      objc_msgSend(v9, "shape");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("BiasCount"));

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("BiasScaleGroupData"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("GOC"), kMLCANENetUnitType[0]);
      v13 = v6;
      goto LABEL_9;
    }
    +[MLCLog framework](MLCLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_MLCANEPlistBuilder buildBiasParamsWithBiases:].cold.2(a2);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_MLCANEPlistBuilder buildBiasParamsWithBiases:].cold.1();
  }

  v13 = 0;
LABEL_9:

  return v13;
}

+ (id)createReshapeUnitWithSourceTensor:(id)a3 layer:(id)a4 resultShape:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "count") == 4)
  {
    v11 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", CFSTR("Reshape"), kMLCANENetUnitType[0]);
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, CFSTR("ReshapedBatch"));

    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, CFSTR("ReshapedChannel"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "unsignedIntegerValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v20, CFSTR("ReshapedHeight"));

    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "unsignedIntegerValue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v23, CFSTR("ReshapedWidth"));

    +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v9, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = ANE_ValidateReshapeUnit(v25, v24, 1);

    if ((v26 & 1) != 0)
    {
      v27 = v24;
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412802;
        v32 = v30;
        v33 = 2112;
        v34 = v24;
        v35 = 2112;
        v36 = v9;
        _os_log_error_impl(&dword_1D4999000, v28, OS_LOG_TYPE_ERROR, "%@: the reshape unit=%@ of layer=%@ failed validation", (uint8_t *)&v31, 0x20u);

      }
      v27 = 0;
    }

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[_MLCANEPlistBuilder createReshapeUnitWithSourceTensor:layer:resultShape:].cold.1(a2);
    v27 = 0;
  }

  return v27;
}

+ (BOOL)createReshapeUnitsWithLayer:(id)a3 reshapeUnits:(id *)a4 reshapeResultTensors:(id *)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  char v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v31;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v34 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v5, "sourceTensors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "dimensionCount");

  v11 = v8;
  v36 = v5;
  objc_msgSend(v5, "resultTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v10;
  v14 = v10 - 1;
  v15 = 1;
  v16 = v11;
  while (v14 <= 2)
  {
    v17 = v15;
    if ((v15 & 1) != 0)
    {
      v39 = 0;
      ANE_GetTensor4DShapeWithBatchFirst(v11, &v39);
      v18 = v39;
    }
    else
    {
      v38 = 0;
      ANE_GetTensor4DShapeWithBatchFirst(v13, &v38);
      v19 = v38;
      objc_msgSend(v11, "descriptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v19, objc_msgSend(v20, "dataType"));
      v21 = objc_claimAutoreleasedReturnValue();

      v37 = 0;
      ANE_GetTensor4DShapeWithOnePrepended(v13, &v37);
      v18 = v37;

      v16 = (void *)v21;
    }
    +[_MLCANEPlistBuilder createReshapeUnitWithSourceTensor:layer:resultShape:](_MLCANEPlistBuilder, "createReshapeUnitWithSourceTensor:layer:resultShape:", v16, v36, v18);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[MLCLog framework](MLCLog, "framework");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:].cold.1();

      v26 = 0;
      goto LABEL_15;
    }
    v23 = (void *)v22;
    objc_msgSend(v35, "addObject:", v22);
    objc_msgSend(v11, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v18, objc_msgSend(v24, "dataType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "addObject:", v25);
    v15 = 0;
    if ((v17 & 1) == 0)
    {
      *a4 = (id)objc_msgSend(v35, "copy");
      *a5 = (id)objc_msgSend(v34, "copy");
      v26 = 1;
      goto LABEL_15;
    }
  }
  +[MLCLog framework](MLCLog, "framework");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:].cold.2(v31, v27, v28);

  v26 = 0;
  v16 = v11;
LABEL_15:

  return v26;
}

+ (int)createBroadcastUnitWithSourceTensor:(id)a3 targetShape:(id)a4 layer:(id)a5 broadcastUnit:(id *)a6 broadcastResultTensor:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  int v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id *v44;
  id *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (objc_msgSend(v13, "count") == 4)
  {
    v49 = 0;
    ANE_GetTensor4DShapeWithOnePrepended(v12, &v49);
    v15 = v49;
    v48 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (objc_msgSend(v15, "count"))
    {
      v44 = a7;
      v45 = a6;
      v46 = v12;
      v47 = v14;
      v16 = 0;
      v17 = 1;
      do
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");

        objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "unsignedIntegerValue");

        if (v19 != 1 && v19 != v21)
        {
          +[MLCLog framework](MLCLog, "framework");
          v35 = objc_claimAutoreleasedReturnValue();
          v12 = v46;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "descriptor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "shape");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v56 = v40;
            v57 = 2112;
            v58 = v42;
            v59 = 2112;
            v60 = v13;
            _os_log_error_impl(&dword_1D4999000, v35, OS_LOG_TYPE_ERROR, "%@: the shape of source tensor is not broadcastable to the target shape. source shape=%@, target shape=%@", buf, 0x20u);

          }
          v32 = 0;
          v25 = 0;
          v17 = 0;
          *v45 = 0;
          *v44 = 0;
          goto LABEL_21;
        }
        if (v19 < v21)
        {
          v22 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
          ANE_GetANECIRDimension(v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("Dimension"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("Size"));

          objc_msgSend(v48, "addObject:", v22);
          v17 = 2;
        }
        ++v16;
      }
      while (v16 < objc_msgSend(v15, "count"));
      if (v17 != 2)
      {
        v32 = 0;
        v25 = 0;
        v12 = v46;
        goto LABEL_21;
      }
      v53[0] = kMLCANENetUnitType[0];
      v53[1] = CFSTR("BroadcastInfo");
      v54[0] = CFSTR("Broadcast");
      v54[1] = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
      v14 = v47;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v47);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v46;
      objc_msgSend(v46, "descriptor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "dataType");

      ANE_GetANECIRDataTypeWithMLCDataType(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v46, "label");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("Bottom"));

        v51 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, CFSTR("InputType"));

        objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("OutputType"));
        +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v13, v27);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v50 = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v30) = ANE_ValidateBroadcastUnit(v33, v32, v25, 1);

        if ((v30 & 1) != 0)
        {
          v25 = objc_retainAutorelease(v25);
          *a6 = v25;
          v32 = objc_retainAutorelease(v32);
          *v44 = v32;

          v17 = 2;
LABEL_21:
          v14 = v47;
          goto LABEL_22;
        }
        +[MLCLog framework](MLCLog, "framework");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v44;
        v39 = v43;
        v14 = v47;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:].cold.2();
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:].cold.1(a2);
        v32 = 0;
        v38 = v44;
        v39 = v43;
      }

      *v45 = 0;
      *v38 = 0;

      v17 = 2;
    }
    else
    {
      v32 = 0;
      v25 = 0;
      v17 = 1;
    }
LABEL_22:

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:].cold.3(a2);

    v17 = 0;
    *a6 = 0;
    *a7 = 0;
  }

  return v17;
}

+ (id)createConstantTensorUnitWithTensor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ConstantName"));

  objc_msgSend(v4, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "dataType");

  ANE_GetANECIRDataTypeWithMLCDataType(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("ConstantType"));
    v18 = 0;
    ANE_GetTensor4DShapeWithOnePrepended(v4, &v18);
    v10 = v18;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("ConstantWidth"));

    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("ConstantHeight"));

    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("ConstantChannels"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9844218, CFSTR("ConstantDepth"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9844218, CFSTR("ConstantInterleave"));
    v14 = v5;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v17;
      v21 = 1024;
      v22 = v8;
      v23 = 2112;
      v24 = v4;
      _os_log_error_impl(&dword_1D4999000, v15, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d of tensor=%@", buf, 0x1Cu);

    }
    v14 = 0;
  }

  return v14;
}

+ (id)constantTensorWithShape:(id)a3 data:(id)a4 dataType:(int)a5 tensorLabel:(id)a6
{
  uint64_t v6;
  id v9;
  void *v10;
  void *v11;

  v6 = *(_QWORD *)&a5;
  v9 = a6;
  +[MLCTensor tensorWithShape:data:dataType:](MLCTensor, "tensorWithShape:data:dataType:", a3, a4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputeFlags:", objc_msgSend(v10, "computeFlags") | 2);
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("_const"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLabel:", v11);
  return v10;
}

- (BOOL)addInputs:(id)a3 ofUnit:(id)a4 ofOperation:(id)a5 toProcedure:(id)a6 toNetwork:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  NSObject *v39;
  void *v41;
  int v42;
  const char *aSelector;
  void *v44;
  id v45;
  id v46;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v50 = a4;
  v49 = a5;
  v13 = a6;
  v48 = a7;
  if (objc_msgSend(v12, "count"))
  {
    aSelector = a2;
    v44 = v13;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("InputList"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (!v15)
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v45 = v12;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v53;
      v46 = v16;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v53 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          if (ANE_CanProgramANECConstantTensorUnit(v21))
          {
            -[_MLCANEPlistBuilder addConstantTensor:toNetwork:](self, "addConstantTensor:toNetwork:", v21, v48);
          }
          else
          {
            objc_msgSend(v21, "setComputeFlags:", objc_msgSend(v21, "computeFlags") | 4);
            v22 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v49, CFSTR("OperationName"));
            objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("Name"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("Name"));

            objc_msgSend(v21, "label");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("InputName"));

            objc_msgSend(v21, "descriptor");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            ANE_GetANECIRDataTypeWithMLCDataType(objc_msgSend(v25, "dataType"));
            v26 = objc_claimAutoreleasedReturnValue();
            if (!v26)
            {
              +[MLCLog framework](MLCLog, "framework");
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(aSelector);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v25, "dataType");
                *(_DWORD *)buf = 138412802;
                v57 = v41;
                v58 = 1024;
                v59 = v42;
                v60 = 2112;
                v61 = v21;
                _os_log_error_impl(&dword_1D4999000, v39, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d for tensor=%@", buf, 0x1Cu);

              }
              v38 = 0;
              v13 = v44;
              v12 = v45;
              v37 = v46;
              goto LABEL_20;
            }
            v27 = (void *)v26;
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("InputType"));
            v51 = 0;
            ANE_GetTensor4DShapeWithOnePrepended(v21, &v51);
            v28 = v19;
            v29 = v51;
            objc_msgSend(v29, "objectAtIndexedSubscript:", 3);
            v30 = v15;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, CFSTR("InputWidth"));

            objc_msgSend(v29, "objectAtIndexedSubscript:", 2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("InputHeight"));

            objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E9844218, CFSTR("InputDepth"));
            objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v33, CFSTR("InputChannels"));

            v15 = v30;
            v34 = objc_msgSend(v21, "interleave");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v35, CFSTR("InputInterleave"));

            objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = v28;
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, CFSTR("BatchSize"));

            objc_msgSend(v30, "addObject:", v22);
            v16 = v46;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v18)
          continue;
        break;
      }
    }

    v37 = (void *)objc_msgSend(v15, "copy");
    v13 = v44;
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v37, CFSTR("InputList"));
    v38 = 1;
    v12 = v45;
LABEL_20:

  }
  else
  {
    v38 = 1;
  }

  return v38;
}

- (BOOL)addOutputs:(id)a3 ofOperation:(id)a4 toProcedure:(id)a5 toNetwork:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  uint64_t i;
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
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  __int128 v40;
  const char *aSelector;
  id v42;
  id v43;
  id obj;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v49 = a4;
  v11 = a5;
  v46 = a6;
  if (objc_msgSend(v10, "count"))
  {
    aSelector = a2;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("OutputList"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (!v13)
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v14 = v10;
    v48 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v52;
      *(_QWORD *)&v15 = 138412802;
      v40 = v15;
      v42 = v11;
      v43 = v10;
      obj = v14;
      v45 = v13;
      while (2)
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v52 != v47)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v17, "setComputeFlags:", objc_msgSend(v17, "computeFlags", v40) | 4);
          v18 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v49, CFSTR("OperationName"));
          objc_msgSend(v17, "parentLayers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!ANE_IsAneCompiledLayer(v20))
          {
            +[MLCLog framework](MLCLog, "framework");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:].cold.1();

LABEL_22:
            v37 = 0;
            v11 = v42;
            v10 = v43;
            v36 = obj;
            v13 = v45;
            goto LABEL_23;
          }
          objc_msgSend(v20, "deviceOps");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "units");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v23;
          objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v23, "count") - 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Name"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "label");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("Name"));
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, CFSTR("OutputName"));
          objc_msgSend(v17, "descriptor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          ANE_GetANECIRDataTypeWithMLCDataType(objc_msgSend(v27, "dataType"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("OutputType"));
            v29 = objc_msgSend(v17, "interleave");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v30, CFSTR("OutputInterleave"));

            objc_msgSend(v45, "addObject:", v18);
            v31 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
            -[NSObject setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v26, CFSTR("OutputName"));
            -[NSObject setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v25, CFSTR("Bottom"));
            -[NSObject setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v28, CFSTR("OutputType"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v32, CFSTR("OutputInterleave"));

            v33 = -[NSObject copy](v31, "copy");
            objc_msgSend(v46, "setObject:forKeyedSubscript:", v33, v26);

          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v27, "dataType");
              *(_DWORD *)buf = v40;
              v56 = v34;
              v57 = 1024;
              v58 = v35;
              v59 = 2112;
              v60 = v17;
              _os_log_error_impl(&dword_1D4999000, v31, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d for tensor=%@", buf, 0x1Cu);

            }
          }

          if (!v28)
            goto LABEL_22;
        }
        v14 = obj;
        v11 = v42;
        v10 = v43;
        v13 = v45;
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (v48)
          continue;
        break;
      }
    }

    v36 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v36, CFSTR("OutputList"));
    v37 = 1;
LABEL_23:

  }
  else
  {
    v37 = 1;
  }

  return v37;
}

- (void)unitBottomNamesWithSourceTensor:(id)a3 liveInputs:(id)a4 unitBottomNames:(id)a5 sourceTensorsToLiveUp:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  _MLCANEPlistBuilder *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "parentLayers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {

    goto LABEL_29;
  }
  v14 = objc_msgSend(v10, "containsObject:", v9);

  if ((v14 & 1) != 0)
  {
LABEL_29:
    objc_msgSend(v9, "label");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v30);

    objc_msgSend(v12, "addObject:", v9);
    goto LABEL_33;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v32 = v9;
  objc_msgSend(v9, "parentLayers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  v16 = self;
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v37;
    v34 = v12;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !ANE_IsAneCompiledLayer(v20)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v20, "sourceTensors");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[_MLCANEPlistBuilder unitBottomNamesWithSourceTensor:liveInputs:unitBottomNames:sourceTensorsToLiveUp:](v16, "unitBottomNamesWithSourceTensor:liveInputs:unitBottomNames:sourceTensorsToLiveUp:", v22, v10, v11, v12);
        }
        else
        {
          v23 = v10;
          v24 = v20;
          if (ANE_IsAneCompiledLayer(v24))
          {
            objc_msgSend(v24, "deviceOps");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "units");
            v27 = objc_claimAutoreleasedReturnValue();

            if (v27 && -[NSObject count](v27, "count"))
            {
              -[NSObject objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", -[NSObject count](v27, "count") - 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Name"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              +[MLCLog framework](MLCLog, "framework");
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v42 = "lastUnitNameOfLayer";
                v43 = 2112;
                v44 = v24;
                _os_log_error_impl(&dword_1D4999000, v29, OS_LOG_TYPE_ERROR, "%s: layer=%@ does not have any unit compiled", buf, 0x16u);
              }

              v22 = 0;
            }
            v16 = self;
          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v42 = "lastUnitNameOfLayer";
              v43 = 2112;
              v44 = v24;
              _os_log_error_impl(&dword_1D4999000, v27, OS_LOG_TYPE_ERROR, "%s: layer=%@ is not compiled with ANE device", buf, 0x16u);
            }
            v22 = 0;
          }

          if (!v22)
          {
            +[MLCLog framework](MLCLog, "framework");
            v31 = objc_claimAutoreleasedReturnValue();
            v10 = v23;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[_MLCANEPlistBuilder unitBottomNamesWithSourceTensor:liveInputs:unitBottomNames:sourceTensorsToLiveUp:].cold.1();

            v9 = v32;
            v12 = v34;
            goto LABEL_33;
          }
          objc_msgSend(v11, "addObject:", v22);
          v10 = v23;
          v12 = v34;
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v17)
        continue;
      break;
    }
  }

  v9 = v32;
LABEL_33:

}

- (BOOL)addUnitsAndInputsAndOutpusOfLayer:(id)a3 toNetwork:(id)a4 toProcedure:(id)a5 operationName:(id)a6 liveInputs:(id)a7 liveOutputs:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  BOOL v55;
  NSObject *v56;
  NSObject *v57;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  os_log_t log;
  const char *aSelector;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t v87[128];
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v74 = a7;
  v18 = a8;
  if (ANE_IsAneCompiledLayer(v14))
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Units"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mutableCopy");

    if (!v20)
      v20 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    aSelector = a2;
    objc_msgSend(v14, "deviceOps");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "units");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v23;
    if (!v23 || !objc_msgSend(v23, "count"))
    {
      +[MLCLog framework](MLCLog, "framework");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_MLCANEPlistBuilder addUnitsAndInputsAndOutpusOfLayer:toNetwork:toProcedure:operationName:liveInputs:liveOutputs:].cold.1();
      v55 = 0;
      goto LABEL_54;
    }
    v64 = v22;
    v65 = v16;
    v69 = v15;
    v70 = v20;
    v66 = v17;
    v24 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(v14, "sourceTensors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v84 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          objc_msgSend(v30, "label");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v30, v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
      }
      while (v27);
    }

    v32 = v71;
    if (objc_msgSend(v71, "count"))
    {
      v33 = 0;
      v34 = (void *)MEMORY[0x1E0C9AA60];
      v63 = v14;
      while (1)
      {
        v62 = v33;
        objc_msgSend(v32, "objectAtIndexedSubscript:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Name"));
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v70, "addObject:");
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Bottom"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v34, "mutableCopy");
        v72 = (void *)objc_msgSend(v34, "mutableCopy");
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v38 = v36;
        v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v80;
          while (2)
          {
            for (j = 0; j != v40; ++j)
            {
              if (*(_QWORD *)v80 != v41)
                objc_enumerationMutation(v38);
              v43 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
              -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (v44)
              {
                v45 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
                -[_MLCANEPlistBuilder unitBottomNamesWithSourceTensor:liveInputs:unitBottomNames:sourceTensorsToLiveUp:](self, "unitBottomNamesWithSourceTensor:liveInputs:unitBottomNames:sourceTensorsToLiveUp:", v44, v74, v45, v72);
                if (!objc_msgSend(v45, "count"))
                {
                  +[MLCLog framework](MLCLog, "framework");
                  v56 = objc_claimAutoreleasedReturnValue();
                  v14 = v63;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(aSelector);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v89 = v59;
                    v90 = 2112;
                    v91 = v35;
                    v92 = 2112;
                    v93 = v63;
                    _os_log_error_impl(&dword_1D4999000, v56, OS_LOG_TYPE_ERROR, "%@: failed to get the unit bottom names for the unit=%@ of layer=%@", buf, 0x20u);

                  }
                  v57 = v38;
                  v15 = v69;
                  goto LABEL_48;
                }
                objc_msgSend(v37, "addObjectsFromArray:", v45);

              }
              else
              {
                objc_msgSend(v37, "addObject:", v43);
              }

            }
            v40 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
            if (v40)
              continue;
            break;
          }
        }

        v46 = (void *)objc_msgSend(v37, "copy");
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v46, CFSTR("Bottom"));

        v16 = v65;
        v15 = v69;
        if (!-[_MLCANEPlistBuilder addInputs:ofUnit:ofOperation:toProcedure:toNetwork:](self, "addInputs:ofUnit:ofOperation:toProcedure:toNetwork:", v72, v35, v66, v65, v69))break;
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v35, log);

        v33 = v62 + 1;
        v32 = v71;
        v47 = objc_msgSend(v71, "count");
        v14 = v63;
        v34 = (void *)MEMORY[0x1E0C9AA60];
        if (v62 + 1 >= v47)
          goto LABEL_28;
      }
      +[MLCLog framework](MLCLog, "framework");
      v57 = objc_claimAutoreleasedReturnValue();
      v14 = v63;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v89 = v60;
        v90 = 2112;
        v91 = v72;
        v92 = 2112;
        v93 = v35;
        v94 = 2112;
        v95 = v63;
        _os_log_error_impl(&dword_1D4999000, v57, OS_LOG_TYPE_ERROR, "%@: failed to add live inputs=%@ of the unit=%@ of layer=%@", buf, 0x2Au);

LABEL_48:
        v16 = v65;
      }

      v55 = 0;
      v17 = v66;
    }
    else
    {
LABEL_28:
      v48 = -[NSObject copy](v70, "copy");
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v48, CFSTR("Units"));

      v35 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      objc_msgSend(v14, "resultTensors");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v76;
        do
        {
          for (k = 0; k != v51; ++k)
          {
            if (*(_QWORD *)v76 != v52)
              objc_enumerationMutation(v49);
            v54 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
            if (objc_msgSend(v18, "containsObject:", v54))
              objc_msgSend(v35, "addObject:", v54);
          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
        }
        while (v51);
      }

      v16 = v65;
      v17 = v66;
      v15 = v69;
      v55 = -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:](self, "addOutputs:ofOperation:toProcedure:toNetwork:", v35, v66, v65, v69);
      if (v55)
      {
        v20 = v70;
LABEL_53:

        v22 = v64;
LABEL_54:

        goto LABEL_55;
      }
      +[MLCLog framework](MLCLog, "framework");
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v89 = v61;
        v90 = 2112;
        v91 = v35;
        v92 = 2112;
        v93 = v14;
        _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%@: failed to add live outputs=%@ of layer=%@", buf, 0x20u);

      }
    }
    v20 = v70;

    goto LABEL_53;
  }
  +[MLCLog framework](MLCLog, "framework");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:].cold.1();
  v55 = 0;
LABEL_55:

  return v55;
}

- (BOOL)addConstantTensor:(id)a3 toNetwork:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  char isKindOfClass;
  void *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend((id)objc_opt_class(), "createConstantTensorUnitWithTensor:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_MLCANEPlistBuilder addConstantTensor:toNetwork:].cold.1();
      v10 = 0;
      goto LABEL_25;
    }
    objc_msgSend(v6, "deviceMemory");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "deviceIndex");
    if (-[NSObject count](v12, "count") <= v13)
      goto LABEL_16;
    -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count") == 2)
      {
        -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v13);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v37 = v16;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v13);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            -[_MLCANEPlistBuilder weightOps](self, "weightOps");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "addWeightData:hash:", v21, v19);

            -[_MLCANEPlistBuilder weightTensorsWithDeviceMemory](self, "weightTensorsWithDeviceMemory");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v6);
LABEL_17:

            v10 = v23 != -1;
            if (v23 == -1)
            {
              +[MLCLog framework](MLCLog, "framework");
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                -[_MLCANEPlistBuilder addConstantTensor:toNetwork:].cold.2();
            }
            else
            {
              objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E9844230, CFSTR("ConstantByteOffset"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("ConstantIndex"));

              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Constants"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "mutableCopy");

              objc_msgSend(v6, "label");
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = (void *)v28;
              if (v27)
              {
                -[NSObject addObject:](v27, "addObject:", v28);
              }
              else
              {
                v38[0] = v28;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v30, "mutableCopy");

              }
              objc_msgSend(v6, "label");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v31);

              v32 = -[NSObject copy](v27, "copy");
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("Constants"));

            }
LABEL_25:

            goto LABEL_26;
          }
LABEL_16:
          -[_MLCANEPlistBuilder weightOps](self, "weightOps");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "data");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "descriptor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v19, "addWeightData:weightDataType:", v21, objc_msgSend(v24, "dataType"));
          goto LABEL_17;
        }

      }
    }

    goto LABEL_16;
  }
  v10 = 1;
LABEL_26:

  return v10;
}

- (BOOL)queryAndAddConstantTensors:(id)a3 ofLayer:(id)a4 toNetwork:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  char v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  unint64_t v30;
  char v31;
  void *v32;
  void *v33;
  NSObject *v34;
  BOOL v35;
  NSObject *v36;
  void *v38;
  void *v39;
  void *v40;
  const char *aSelector;
  void *v42;
  _MLCANEPlistBuilder *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *obj;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  NSObject *v71;
  uint64_t v72;

  aSelector = a2;
  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (ANE_IsAneCompiledLayer(v9))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v8;
    v47 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (!v47)
    {
      v35 = 1;
      goto LABEL_43;
    }
    v48 = *(_QWORD *)v56;
    v11 = CFSTR("Bottom");
    v44 = v8;
    v45 = v10;
    v46 = v9;
    v43 = self;
LABEL_4:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v48)
        objc_enumerationMutation(obj);
      v51 = v12;
      v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v12);
      -[_MLCANEPlistBuilder weightOps](self, "weightOps", aSelector);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "queryConstantTensor:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        +[MLCLog framework](MLCLog, "framework");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[_MLCANEPlistBuilder queryAndAddConstantTensors:ofLayer:toNetwork:].cold.1();
        goto LABEL_41;
      }
      if (v15 != v13)
      {
        objc_msgSend(v9, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "units");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = v13;
        objc_msgSend(v13, "label");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v15;
        objc_msgSend(v15, "label");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v18;
        v22 = v19;
        v23 = v20;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v52 = v21;
        v54 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v59, buf, 16);
        if (!v54)
        {

          v34 = v21;
LABEL_38:
          +[MLCLog framework](MLCLog, "framework");
          v36 = objc_claimAutoreleasedReturnValue();
          v15 = v50;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "label");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "label");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v65 = v38;
            v66 = 2112;
            v67 = v39;
            v68 = 2112;
            v69 = v40;
            v70 = 2112;
            v71 = v52;
            _os_log_error_impl(&dword_1D4999000, v36, OS_LOG_TYPE_ERROR, "%@: failed to replace unit bottom name %@ with %@ in units=%@", buf, 0x2Au);

            v34 = v52;
          }

          v10 = v45;
          v9 = v46;
LABEL_41:

          goto LABEL_42;
        }
        v24 = 0;
        v53 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v60 != v53)
              objc_enumerationMutation(v52);
            v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_msgSend(v26, "objectForKeyedSubscript:", v11);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v27, "mutableCopy");

            if (objc_msgSend(v28, "count"))
            {
              v29 = v11;
              v30 = 0;
              v31 = 0;
              do
              {
                objc_msgSend(v28, "objectAtIndexedSubscript:", v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v32, "isEqualToString:", v22))
                {
                  objc_msgSend(v28, "replaceObjectAtIndex:withObject:", v30, v23);
                  v31 = 1;
                  v24 = 1;
                }

                ++v30;
              }
              while (v30 < objc_msgSend(v28, "count"));
              if ((v31 & 1) != 0)
              {
                v33 = (void *)objc_msgSend(v28, "copy");
                v11 = v29;
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v33, v29);

              }
              else
              {
                v11 = v29;
              }
            }

          }
          v54 = -[NSObject countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v59, buf, 16);
        }
        while (v54);

        v34 = v52;
        v8 = v44;
        if ((v24 & 1) == 0)
          goto LABEL_38;

        v10 = v45;
        v9 = v46;
        v15 = v50;
        self = v43;
      }
      if (!-[_MLCANEPlistBuilder addConstantTensor:toNetwork:](self, "addConstantTensor:toNetwork:", v15, v10))
      {
        +[MLCLog framework](MLCLog, "framework");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[_MLCANEPlistBuilder addConstantTensor:toNetwork:].cold.2();
        goto LABEL_41;
      }

      v12 = v51 + 1;
      if (v51 + 1 == v47)
      {
        v35 = 1;
        v47 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        if (v47)
          goto LABEL_4;
        goto LABEL_43;
      }
    }
  }
  +[MLCLog framework](MLCLog, "framework");
  obj = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:].cold.1();
LABEL_42:
  v35 = 0;
LABEL_43:

  return v35;
}

- (BOOL)addWeightsOfConvolutionLayer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  const char *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;

  v5 = a3;
  v6 = (void *)MEMORY[0x1D8263D2C]();
  objc_msgSend(v5, "deviceOps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "units");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "weights");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "biases");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ANE_FindUnitWithType(CFSTR("Conv"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      +[MLCLog framework](MLCLog, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.1();
      v26 = 0;
      goto LABEL_43;
    }
    v49 = a2;
    v52 = v6;
    v53 = v11;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Params"));
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject descriptor](v10, "descriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "dataType");

    -[NSObject deviceMemory](v10, "deviceMemory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    v19 = -[NSObject deviceIndex](v10, "deviceIndex");

    if (v18 <= v19)
    {
      -[NSObject data](v10, "data");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSObject deviceMemory](v10, "deviceMemory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", -[NSObject deviceIndex](v10, "deviceIndex"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        v11 = v53;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.8();
        v26 = 0;
        v6 = v52;
        goto LABEL_42;
      }
      -[NSObject deviceMemory](v10, "deviceMemory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", -[NSObject deviceIndex](v10, "deviceIndex"));
      v24 = objc_claimAutoreleasedReturnValue();

      -[_MLCANEPlistBuilder weightTensorsWithDeviceMemory](self, "weightTensorsWithDeviceMemory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v10);

    }
    v55 = 0;
    v56 = 0;
    v54 = 0;
    v27 = ANE_CompressSparseKernel(v24, v16, &v55, &v54, &v56, 0.000060976);
    v51 = v55;
    v50 = v54;
    if (v56)
    {
      if (v27)
      {
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", CFSTR("Sparse"), CFSTR("KernelMode"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v56);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v28, CFSTR("KernelCoeffCount"));

        -[_MLCANEPlistBuilder weightOps](self, "weightOps");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "addWeightData:weightDataType:", v51, 6);

        if (v30 == -1)
        {
          +[MLCLog framework](MLCLog, "framework");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.3(v49);
        }
        else
        {
          -[_MLCANEPlistBuilder weightOps](self, "weightOps");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "addWeightData:weightDataType:", v50, v16);

          if (v32 != -1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v33, CFSTR("KernelMaskIndex"));

            -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &unk_1E9844230, CFSTR("KernelMaskByteOffset"));
            goto LABEL_25;
          }
          +[MLCLog framework](MLCLog, "framework");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.4(v49);
        }
      }
      else
      {
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", CFSTR("Dense"), CFSTR("KernelMode"));
        -[_MLCANEPlistBuilder weightOps](self, "weightOps");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v36, "addWeightData:weightDataType:", v24, v16);

        if (v32 != -1)
        {
LABEL_25:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v37, CFSTR("KernelIndex"));

          -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &unk_1E9844230, CFSTR("KernelOffset"));
          v11 = v53;
          if (!v53)
          {
            v26 = 1;
            v6 = v52;
LABEL_41:

LABEL_42:
LABEL_43:

            goto LABEL_44;
          }
          ANE_FindUnitWithType(CFSTR("GOC"), v9);
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            -[_MLCANEPlistBuilder weightOps](self, "weightOps");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "data");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "descriptor");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v48, "addWeightData:weightDataType:", v38, objc_msgSend(v39, "dataType"));

            v41 = v40;
            if (v40 != -1)
            {
              -[NSObject objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", CFSTR("Params"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("BiasScaleGroupData"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("BiasIndex"));

              objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("BiasScaleGroupData"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setObject:forKeyedSubscript:", &unk_1E9844230, CFSTR("BiasOffset"));

              v26 = 1;
LABEL_39:
              v6 = v52;
              v11 = v53;
LABEL_40:

              goto LABEL_41;
            }
            +[MLCLog framework](MLCLog, "framework");
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v11 = v53;
              -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.6();
              v6 = v52;
            }
            else
            {
              v6 = v52;
              v11 = v53;
            }
          }
          else
          {
            +[MLCLog framework](MLCLog, "framework");
            v46 = objc_claimAutoreleasedReturnValue();
            v6 = v52;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.5();
          }

          v26 = 0;
          goto LABEL_40;
        }
        +[MLCLog framework](MLCLog, "framework");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.7();
      }
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.2((uint64_t)v10, v34, v35, 0.000060976);
    }
    v26 = 0;
    goto LABEL_39;
  }
  +[MLCLog framework](MLCLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.9();
  v26 = 0;
LABEL_44:

  objc_autoreleasePoolPop(v6);
  return v26;
}

- (BOOL)addWeightsOfFullyConnectedLayer:(id)a3 toNetwork:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (ANE_IsAneCompiledLayer(v6))
  {
    objc_msgSend(v6, "deviceOps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject constantTensors](v9, "constantTensors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_MLCANEPlistBuilder queryAndAddConstantTensors:ofLayer:toNetwork:](self, "queryAndAddConstantTensors:ofLayer:toNetwork:", v10, v6, v7);
    if (v11)
    {
      objc_msgSend(v10, "removeAllObjects");
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_MLCANEPlistBuilder addWeightsOfFullyConnectedLayer:toNetwork:].cold.1();

    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:].cold.1();
    v11 = 0;
  }

  return v11;
}

- (BOOL)addScalesAndBiasesOfGocUnit:(id)a3 tensorWithBiases:(id)a4 tensorWithScales:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  void *v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D8263D2C]();
  objc_msgSend(v9, "deviceMemory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v9, "deviceIndex");

  if (v13 <= v14)
  {
    objc_msgSend(v9, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "deviceMemory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v9, "deviceIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MLCANEPlistBuilder weightTensorsWithDeviceMemory](self, "weightTensorsWithDeviceMemory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v9);

  }
  -[_MLCANEPlistBuilder weightOps](self, "weightOps");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "addWeightData:weightDataType:", v16, objc_msgSend(v19, "dataType"));

  if (v20 == -1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:].cold.1();
    goto LABEL_15;
  }
  objc_msgSend(v10, "deviceMemory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  v23 = objc_msgSend(v10, "deviceIndex");

  if (v22 <= v23)
  {
    objc_msgSend(v10, "data");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "deviceMemory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v10, "deviceIndex"));
    v25 = objc_claimAutoreleasedReturnValue();

    -[_MLCANEPlistBuilder weightTensorsWithDeviceMemory](self, "weightTensorsWithDeviceMemory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v10);

  }
  -[_MLCANEPlistBuilder weightOps](self, "weightOps");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "addWeightData:weightDataType:", v25, objc_msgSend(v28, "dataType"));

  if (v29 == -1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:].cold.2();

LABEL_15:
    v37 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Params"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("BiasScaleGroupData"));
  v40 = v11;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("BiasIndex"));

  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("BiasScaleGroupData"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E9844230, CFSTR("BiasOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("BiasScaleGroupData"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("ScaleIndex"));

  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("BiasScaleGroupData"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", &unk_1E9844230, CFSTR("ScaleOffset"));

  v11 = v40;
  v37 = 1;
LABEL_16:

  objc_autoreleasePoolPop(v11);
  return v37;
}

- (BOOL)addWeightsOfNormalizationLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;

  v4 = a3;
  objc_msgSend(v4, "deviceOps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "units");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v4;
      ANE_FindUnitWithType(CFSTR("GOC"), v7);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(v14, "mean");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v14, "variance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v14, "mean");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "variance");
            v21 = objc_claimAutoreleasedReturnValue();
LABEL_13:
            v23 = (void *)v21;
            v13 = -[_MLCANEPlistBuilder addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:](self, "addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:", v16, v20, v21);

            goto LABEL_22;
          }
        }
LABEL_12:
        objc_msgSend(v14, "beta");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "gamma");
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:].cold.9();

        goto LABEL_21;
      }
      v14 = v4;
      ANE_FindUnitWithType(CFSTR("GOC"), v7);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v16 = (void *)v22;
        goto LABEL_12;
      }
    }

    v13 = 1;
    goto LABEL_22;
  }
  v8 = v4;
  ANE_FindUnitWithType(CFSTR("GOC"), v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[MLCLog framework](MLCLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder addWeightsOfNormalizationLayer:].cold.1();

LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  v10 = (void *)v9;
  objc_msgSend(v8, "mean");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "variance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_MLCANEPlistBuilder addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:](self, "addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:", v10, v11, v12);

LABEL_22:
  return v13;
}

- (BOOL)addWeightsOfLayerNormalizationLayer:(id)a3 toNetwork:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (ANE_IsAneCompiledLayer(v6))
  {
    objc_msgSend(v6, "deviceOps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject constantTensors](v9, "constantTensors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_MLCANEPlistBuilder queryAndAddConstantTensors:ofLayer:toNetwork:](self, "queryAndAddConstantTensors:ofLayer:toNetwork:", v10, v6, v7);
    if (v11)
    {
      objc_msgSend(v10, "removeAllObjects");
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_MLCANEPlistBuilder addWeightsOfFullyConnectedLayer:toNetwork:].cold.1();

    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder addOutputs:ofOperation:toProcedure:toNetwork:].cold.1();
    v11 = 0;
  }

  return v11;
}

- (BOOL)addWeightsOfLayer:(id)a3 toNetwork:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:](self, "addWeightsOfConvolutionLayer:", v6);
LABEL_10:
    v14 = v8;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = -[_MLCANEPlistBuilder addWeightsOfNormalizationLayer:](self, "addWeightsOfNormalizationLayer:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = 1;
        goto LABEL_13;
      }
      v8 = -[_MLCANEPlistBuilder addWeightsOfLayerNormalizationLayer:toNetwork:](self, "addWeightsOfLayerNormalizationLayer:toNetwork:", v6, v7);
    }
    goto LABEL_10;
  }
  objc_msgSend(v6, "deviceOps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "units");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ANE_FindUnitWithType(CFSTR("Conv"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = -[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:](self, "addWeightsOfConvolutionLayer:", v6);
  else
    v13 = -[_MLCANEPlistBuilder addWeightsOfFullyConnectedLayer:toNetwork:](self, "addWeightsOfFullyConnectedLayer:toNetwork:", v6, v7);
  v14 = v13;

LABEL_13:
  return v14;
}

- (BOOL)buildProcedureWithLayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!ANE_IsAneCompiledLayer(v4))
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder buildProcedureWithLayer:].cold.4();
    goto LABEL_7;
  }
  objc_msgSend(v4, "fusedLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder buildProcedureWithLayer:].cold.3();
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v10 = (void *)MEMORY[0x1E0C9AA70];
  v7 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), CFSTR("procedure_"), v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v10, "mutableCopy");
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "label");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v13;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@"), CFSTR("network_"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v13, CFSTR("Name"));
  v44[0] = CFSTR("OperationName");
  v44[1] = CFSTR("NetworkName");
  v45[0] = CFSTR("op0");
  v45[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v19, CFSTR("OperationList"));

  if (-[_MLCANEPlistBuilder addWeightsOfLayer:toNetwork:](self, "addWeightsOfLayer:toNetwork:", v4, v14))
  {
    v40 = (void *)v13;
    v20 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "sourceTensors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "resultTensors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v25;
    v8 = -[_MLCANEPlistBuilder addUnitsAndInputsAndOutpusOfLayer:toNetwork:toProcedure:operationName:liveInputs:liveOutputs:](self, "addUnitsAndInputsAndOutpusOfLayer:toNetwork:toProcedure:operationName:liveInputs:liveOutputs:", v4, v14, v7, CFSTR("op0"), v22, v25);
    if (v8)
    {
      -[_MLCANEPlistBuilder weightOps](self, "weightOps");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "weightFiles");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v28)
      {
        -[_MLCANEPlistBuilder weightOps](self, "weightOps");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "weightFiles");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v31, CFSTR("Weights"));

      }
      -[_MLCANEPlistBuilder plist](self, "plist");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Networks"));
      v33 = objc_claimAutoreleasedReturnValue();

      -[NSObject addObject:](v33, "addObject:", v18);
      -[_MLCANEPlistBuilder plist](self, "plist");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v14, v18);

      -[_MLCANEPlistBuilder plist](self, "plist");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ProcedureList"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "addObject:", v7);
      objc_msgSend(v4, "deviceOps");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v40;
      objc_msgSend(v38, "setProcedureName:", v40);
      objc_msgSend(v38, "setProcedureIndex:", objc_msgSend(v36, "count") - 1);

    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[_MLCANEPlistBuilder buildProcedureWithLayer:].cold.1();
      v17 = v40;
    }
    v39 = (void *)v42;

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder buildProcedureWithLayer:].cold.2();
    v8 = 0;
    v39 = (void *)v42;
  }

LABEL_8:
  return v8;
}

- (BOOL)buildProcedureWithRootLayer:(id)a3 aneSubgraphLayerList:(id)a4 liveInputs:(id)a5 liveOutputs:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _MLCANEPlistBuilder *v24;
  id v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  char isKindOfClass;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _MLCANEPlistBuilder *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  void *v66;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  void *v86;
  _QWORD v87[2];
  _QWORD v88[4];

  v88[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v70 = a5;
  v68 = a6;
  if (!ANE_IsAneCompiledLayer(v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_MLCANEPlistBuilder buildProcedureWithRootLayer:aneSubgraphLayerList:liveInputs:liveOutputs:].cold.3();
    v27 = 0;
    goto LABEL_33;
  }
  v11 = (void *)MEMORY[0x1E0C9AA70];
  v12 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), CFSTR("procedure_"), v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v66 = (void *)objc_msgSend(v11, "mutableCopy");
  v16 = (void *)MEMORY[0x1E0CB3940];
  v62 = v9;
  objc_msgSend(v9, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@"), CFSTR("network_"), v17);
  v19 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v15;
  v20 = v15;
  v21 = (void *)v19;
  -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v20, CFSTR("Name"));
  v87[0] = CFSTR("OperationName");
  v87[1] = CFSTR("NetworkName");
  v88[0] = CFSTR("op0");
  v88[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v22, CFSTR("OperationList"));

  v23 = objc_msgSend(v10, "count");
  v24 = self;
  v25 = v70;
  if (!v23)
  {
LABEL_26:
    -[_MLCANEPlistBuilder weightOps](v24, "weightOps");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "weightFiles");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v24;
    v48 = objc_msgSend(v46, "count");

    v44 = v66;
    if (v48)
    {
      -[_MLCANEPlistBuilder weightOps](v47, "weightOps");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "weightFiles");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v50, "copy");
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v51, CFSTR("Weights"));

    }
    -[_MLCANEPlistBuilder plist](v47, "plist");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("Networks"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "addObject:", v21);
    -[_MLCANEPlistBuilder plist](v47, "plist");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v66, v21);

    -[_MLCANEPlistBuilder plist](v47, "plist");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ProcedureList"));
    v55 = objc_claimAutoreleasedReturnValue();

    -[NSObject addObject:](v55, "addObject:", v18);
    objc_msgSend(v62, "deviceOps");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v60;
    objc_msgSend(v57, "setProcedureName:", v60);
    objc_msgSend(v57, "setProcedureIndex:", -[NSObject count](v55, "count") - 1);

    v27 = 1;
    goto LABEL_29;
  }
  v26 = v23;
  v27 = 0;
  v28 = 0;
  v64 = v12;
  v65 = v10;
  v63 = v21;
  v69 = v23;
  while (1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_25;
    v71 = v28;
    if (ANE_IsPaddingLayerAndNotCompiledForANE(v29))
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(v29, "resultTensors");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      if (v74)
      {
        v73 = *(_QWORD *)v81;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v81 != v73)
              objc_enumerationMutation(obj);
            v75 = v30;
            v31 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v30);
            v76 = 0u;
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            objc_msgSend(v31, "childLayers");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v77;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v77 != v35)
                    objc_enumerationMutation(v32);
                  objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "deviceOps");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();
                  v40 = CFSTR("Pooling");
                  if ((isKindOfClass & 1) != 0)
                    v40 = CFSTR("Conv");
                  v41 = v40;
                  objc_msgSend(v38, "units");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  ANE_FindUnitWithType(v41, v42);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  ANE_ApplyPaddingSizes(v29, v43);
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
              }
              while (v34);
            }

            v30 = v75 + 1;
          }
          while (v75 + 1 != v74);
          v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
        }
        while (v74);
      }

      v18 = v64;
      v10 = v65;
      v26 = v69;
      v25 = v70;
      v21 = v63;
      v24 = self;
      v28 = v71;
      goto LABEL_25;
    }
    v44 = v66;
    if (!-[_MLCANEPlistBuilder addWeightsOfLayer:toNetwork:](v24, "addWeightsOfLayer:toNetwork:", v29, v66))
      break;
    v26 = v69;
    if (!-[_MLCANEPlistBuilder addUnitsAndInputsAndOutpusOfLayer:toNetwork:toProcedure:operationName:liveInputs:liveOutputs:](v24, "addUnitsAndInputsAndOutpusOfLayer:toNetwork:toProcedure:operationName:liveInputs:liveOutputs:", v29, v66, v18, CFSTR("op0"), v25, v68))
    {
      +[MLCLog framework](MLCLog, "framework");
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        -[_MLCANEPlistBuilder buildProcedureWithLayer:].cold.1();
      v58 = v60;
      v44 = v66;
      goto LABEL_29;
    }
LABEL_25:

    v27 = ++v28 >= v26;
    if (v28 == v26)
      goto LABEL_26;
  }
  +[MLCLog framework](MLCLog, "framework");
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    -[_MLCANEPlistBuilder buildProcedureWithLayer:].cold.2();
  v58 = v60;
LABEL_29:

  v9 = v62;
LABEL_33:

  return v27;
}

- (void)releaseWeights
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D8263D2C](self, a2);
  -[_MLCANEPlistBuilder weightOps](self, "weightOps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_MLCANEPlistBuilder weightTensorsWithDeviceMemory](self, "weightTensorsWithDeviceMemory", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "deviceMemory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAllObjects");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[_MLCANEPlistBuilder weightTensorsWithDeviceMemory](self, "weightTensorsWithDeviceMemory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  objc_autoreleasePoolPop(v3);
}

- (NSMutableDictionary)plist
{
  return self->_plist;
}

- (_MLCANEWeightOps)weightOps
{
  return self->_weightOps;
}

- (NSMutableSet)weightTensorsWithDeviceMemory
{
  return self->_weightTensorsWithDeviceMemory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightTensorsWithDeviceMemory, 0);
  objc_storeStrong((id *)&self->_weightOps, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

+ (void)createUnitWithLayer:unitParams:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  SEL v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_9_0();
  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = v1;
  OUTLINED_FUNCTION_8_0(&dword_1D4999000, v0, v5, "%@: missing the key of %@ in %@", v6);

}

+ (void)buildBiasParamsWithBiases:.cold.1()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dataType");
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v3, v4, "%@: unsupported data type=%d", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4_1();
}

+ (void)buildBiasParamsWithBiases:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: 8-bit data type for biases is not supported on Apple Neural Engine", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)createReshapeUnitWithSourceTensor:(const char *)a1 layer:resultShape:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: the result shape should be 4D", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, v0, v1, "%s: failed to create the reshape unit for layer=%@", (uint8_t *)v2);
}

+ (void)createReshapeUnitsWithLayer:(uint64_t)a1 reshapeUnits:(NSObject *)a2 reshapeResultTensors:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "+[_MLCANEPlistBuilder createReshapeUnitsWithLayer:reshapeUnits:reshapeResultTensors:]";
  v5 = 2048;
  v6 = a1;
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, a2, a3, "%s: unsupported source shape count=%lu", (uint8_t *)&v3);
}

+ (void)createBroadcastUnitWithSourceTensor:(const char *)a1 targetShape:layer:broadcastUnit:broadcastResultTensor:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: failed to get the ANEC IR data type from data type=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

+ (void)createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_10();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_8_0(&dword_1D4999000, v2, (uint64_t)v2, "%s: the broadcast unit=%@ for layer=%@ failed validation", (uint8_t *)v3);
}

+ (void)createBroadcastUnitWithSourceTensor:(const char *)a1 targetShape:layer:broadcastUnit:broadcastResultTensor:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: target shape has to be 4 dimensions", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)addOutputs:ofOperation:toProcedure:toNetwork:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: layer=%@ is not compiled with ANE device", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)unitBottomNamesWithSourceTensor:liveInputs:unitBottomNames:sourceTensorsToLiveUp:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: cannot get the last unit name from layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addUnitsAndInputsAndOutpusOfLayer:toNetwork:toProcedure:operationName:liveInputs:liveOutputs:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: layer=%@ does not have any unit compiled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addConstantTensor:toNetwork:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to create the constant tensor unit for tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addConstantTensor:toNetwork:.cold.2()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to add the data of the constant tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)queryAndAddConstantTensors:ofLayer:toNetwork:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to query constant tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addWeightsOfConvolutionLayer:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: convolution unit is not found. layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addWeightsOfConvolutionLayer:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, float a4)
{
  int v4;
  const char *v5;
  __int16 v6;
  double v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 136315650;
  v5 = "-[_MLCANEPlistBuilder addWeightsOfConvolutionLayer:]";
  v6 = 2048;
  v7 = a4;
  v8 = 2112;
  v9 = a1;
  OUTLINED_FUNCTION_8_0(&dword_1D4999000, a2, a3, "%s: the absolute values of all weights are below %.8f and considered to be all 0's. weight tensor=%@", (uint8_t *)&v4);
}

- (void)addWeightsOfConvolutionLayer:(const char *)a1 .cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failed to add the mask of a sparse kernel", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)addWeightsOfConvolutionLayer:(const char *)a1 .cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failed to add the non-zero values of a sparse kernel", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)addWeightsOfConvolutionLayer:.cold.5()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: GOC unit is not found. layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addWeightsOfConvolutionLayer:.cold.6()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to add the biases of tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addWeightsOfConvolutionLayer:.cold.7()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to add the weights of tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addWeightsOfConvolutionLayer:.cold.8()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: NSData not found in the device memory of weights=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addWeightsOfConvolutionLayer:.cold.9()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: unsupported layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addWeightsOfFullyConnectedLayer:toNetwork:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to add the constant tensors programmed for layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to add the computed biases of tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addScalesAndBiasesOfGocUnit:tensorWithBiases:tensorWithScales:.cold.2()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to write the computed scales of tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addWeightsOfNormalizationLayer:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: cannot find a GOC unit for batch normalization layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)buildProcedureWithLayer:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to add units of layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)buildProcedureWithLayer:.cold.2()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to add the weights, biases, or sacles of layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)buildProcedureWithLayer:.cold.3()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: layer=%@ should not have fused layers", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)buildProcedureWithLayer:.cold.4()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: laye=%@ is not compiled with ANE device", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)buildProcedureWithRootLayer:aneSubgraphLayerList:liveInputs:liveOutputs:.cold.3()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: layer = %@ is not compiled for ANE device", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

@end
