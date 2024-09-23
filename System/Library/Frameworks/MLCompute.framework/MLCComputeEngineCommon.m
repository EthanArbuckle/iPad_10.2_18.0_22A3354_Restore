@implementation MLCComputeEngineCommon

+ (BOOL)doesActivationRequireInput:(id)a3 forInference:(BOOL)a4
{
  id v5;
  BOOL v6;
  void *v7;
  unsigned int v8;
  float v10;
  BOOL v11;
  float v12;
  float v13;
  float v14;

  v5 = a3;
  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && !a4)
  {
    objc_msgSend(v5, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "activationType");
    if (v8 <= 0x14)
    {
      if (((1 << v8) & 0x10FBBD) != 0)
      {
        v6 = 0;
LABEL_6:

        goto LABEL_7;
      }
      if (((1 << v8) & 0x402) != 0)
      {
        objc_msgSend(v7, "a");
        v11 = v10 < 0.0;
        goto LABEL_12;
      }
      if (v8 == 17)
      {
        objc_msgSend(v7, "a");
        v13 = v12;
        objc_msgSend(v7, "b");
        v11 = v13 < v14;
LABEL_12:
        v6 = v11;
        goto LABEL_6;
      }
    }
    v6 = 1;
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

+ (BOOL)isResultTensorInStopGradientTensorList:(id)a3 resultTensor:(id)a4 forInference:(BOOL)a5
{
  if (!a3 || a5)
    return 0;
  else
    return objc_msgSend(a3, "containsObject:", a4);
}

+ (void)updateTensorsForFusedPaddingAndConvolutionLayer:(id)a3 layerNext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sourceTensors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceTensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:atIndexedSubscript:", v8, 0);

  objc_msgSend(v8, "childLayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:atIndexedSubscript:", v6, 0);

  objc_msgSend(v5, "sourceGradientTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v5, "sourceGradientTensors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultGradientTensors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, 0);

  }
  objc_msgSend(v5, "setSkipLayer:", 1);
  objc_msgSend(v6, "deviceOps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v6, "setDeviceOps:", v18);

  }
  v20 = v5;
  objc_msgSend(v6, "setPaddingPolicy:", 2);
  objc_msgSend(v6, "setPaddingSizeInX:", objc_msgSend(v20, "paddingLeft"));
  v19 = objc_msgSend(v20, "paddingTop");

  objc_msgSend(v6, "setPaddingSizeInY:", v19);
}

+ (void)updateLayersAndTensorsForComplexActivationFunction:(id)a3 inputTensor:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v5 = a4;
  v6 = objc_msgSend(v33, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(v33, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(v11, "deviceOps");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          v14 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v11, "setDeviceOps:", v14);

        }
        objc_msgSend(v11, "setSkipLayer:", 1);
        objc_msgSend(v11, "setIsLastFusedLayer:", 0);
      }
      else
      {
        v8 = v11;
      }

      ++v9;
    }
    while (v7 != v9);
    if (v8)
    {
      objc_msgSend(v8, "sourceTensors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:atIndexedSubscript:", v5, 0);

      objc_msgSend(v33, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resultTensors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resultTensors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:atIndexedSubscript:", v18, 0);

      objc_msgSend(v33, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setIsLastFusedLayer:", 1);

      objc_msgSend(v33, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "resultTensors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "parentLayers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:atIndexedSubscript:", v8, 0);

      objc_msgSend(v33, "lastObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sourceGradientTensors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        objc_msgSend(v33, "lastObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sourceGradientTensors");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sourceGradientTensors");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:atIndexedSubscript:", v30, 0);

      }
      objc_msgSend(v8, "fusedLayers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObjectsFromArray:", v33);

    }
  }

}

+ (void)updateTensorsForTwoFusedLayers:(id)a3 layerNext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v5 = a4;
  objc_msgSend(v5, "resultTensors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v7, 0);

  objc_msgSend(v7, "parentLayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:atIndexedSubscript:", v19, 0);

  objc_msgSend(v19, "sourceGradientTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v5, "sourceGradientTensors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sourceGradientTensors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:atIndexedSubscript:", v13, 0);

  }
  objc_msgSend(v19, "fusedLayers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v5);

  objc_msgSend(v5, "setSkipLayer:", 1);
  objc_msgSend(v5, "setIsLastFusedLayer:", 1);
  objc_msgSend(v19, "deviceOps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v19, "setDeviceOps:", v18);

  }
}

+ (void)updateTensorsForThreeFusedLayers:(id)a3 layerNext:(id)a4 layerNext2:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v7 = a5;
  v8 = a4;
  objc_msgSend(v7, "resultTensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "resultTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:atIndexedSubscript:", v10, 0);

  objc_msgSend(v10, "parentLayers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:atIndexedSubscript:", v23, 0);

  objc_msgSend(v23, "sourceGradientTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v7, "sourceGradientTensors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sourceGradientTensors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:atIndexedSubscript:", v16, 0);

  }
  objc_msgSend(v23, "fusedLayers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v8);

  objc_msgSend(v23, "fusedLayers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v7);

  objc_msgSend(v8, "setSkipLayer:", 1);
  objc_msgSend(v7, "setSkipLayer:", 1);
  objc_msgSend(v7, "setIsLastFusedLayer:", 1);
  objc_msgSend(v23, "deviceOps");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v23, "setDeviceOps:", v22);

  }
}

+ (BOOL)forwardSourceTensorToChildLayersFrom:(id)a3 stopGradientTensorList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  void *v56;
  NSObject *v57;
  NSObject *obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sourceTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1)
  {
    objc_msgSend(v6, "resultTensors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 == 1)
    {
      objc_msgSend(v6, "resultTensors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v13 = objc_claimAutoreleasedReturnValue();

      if ((-[NSObject computeFlags](v13, "computeFlags") & 1) != 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:].cold.3(a2);
        v14 = 0;
        goto LABEL_51;
      }
      if (v7)
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      else
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v15 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject containsObject:](v15, "containsObject:", v13))
      {
        +[MLCLog framework](MLCLog, "framework");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:].cold.1(a2);
        v14 = 0;
        goto LABEL_50;
      }
      v57 = v15;
      objc_msgSend(v6, "sourceTensors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastObject");
      v16 = objc_claimAutoreleasedReturnValue();

      -[NSObject parentLayers](v16, "parentLayers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count"))
      {
        -[NSObject parentLayers](v16, "parentLayers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sourceGradientTensors");
        v21 = v6;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        v6 = v21;
        if (v23 >= 2)
        {
          +[MLCLog framework](MLCLog, "framework");
          obj = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
            +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:].cold.2(a2);
          v14 = 0;
          v15 = v57;
          goto LABEL_49;
        }
      }
      else
      {

      }
      -[NSObject childLayers](v13, "childLayers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject childLayers](v16, "childLayers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v26 >= 1)
      {
        v27 = v26 + 1;
        do
        {
          -[NSObject childLayers](v16, "childLayers");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          if (!v29)
            break;
          -[NSObject childLayers](v16, "childLayers");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v27 - 2);
          v31 = (id)objc_claimAutoreleasedReturnValue();

          if (v31 == v6)
          {
            -[NSObject childLayers](v16, "childLayers");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "removeObjectAtIndex:", v27 - 2);

          }
          --v27;
        }
        while (v27 > 1);
      }
      v55 = v7;
      v56 = v6;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v24;
      v33 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v60 != v35)
              objc_enumerationMutation(obj);
            v37 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_msgSend(v37, "sourceTensors", v55);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "count");

            if (v39)
            {
              for (j = 0; j != v39; ++j)
              {
                objc_msgSend(v37, "sourceTensors");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "objectAtIndexedSubscript:", j);
                v42 = objc_claimAutoreleasedReturnValue();

                if (v42 == v13)
                {
                  objc_msgSend(v37, "sourceTensors");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "setObject:atIndexedSubscript:", v16, j);

                  -[NSObject childLayers](v16, "childLayers");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "addObject:", v37);

                }
              }
            }
          }
          v34 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        }
        while (v34);
      }

      -[NSObject parentLayers](v16, "parentLayers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "count"))
      {
        v6 = v56;
        objc_msgSend(v56, "sourceGradientTensors");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "count");

        v15 = v57;
        if (!v47)
        {
LABEL_48:
          v14 = 1;
          v7 = v55;
LABEL_49:

LABEL_50:
LABEL_51:

          goto LABEL_52;
        }
        -[NSObject parentLayers](v16, "parentLayers");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "lastObject");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "sourceGradientTensors");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "removeAllObjects");

        -[NSObject parentLayers](v16, "parentLayers");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lastObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "sourceGradientTensors");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "sourceGradientTensors");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addObjectsFromArray:", v53);

      }
      else
      {
        v6 = v56;
        v15 = v57;
      }

      goto LABEL_48;
    }
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:].cold.4(a2);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:].cold.5(a2);
  }
  v14 = 0;
LABEL_52:

  return v14;
}

+ (void)applyPatternMatcherForGraph:(id)a3 stopGradientTensorList:(id)a4 startAtLayerIndex:(unint64_t)a5 forInference:(BOOL)a6
{
  id v8;
  __int128 v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  id v25;
  __int128 v26;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v28 = a4;
  if (objc_msgSend(v8, "count") > a5)
  {
    *(_QWORD *)&v9 = 138412546;
    v26 = v9;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", a5, v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "skipLayer") & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if (!objc_msgSend(v11, "paddingLeft")
            && !objc_msgSend(v11, "paddingRight")
            && !objc_msgSend(v11, "paddingTop")
            && !objc_msgSend(v11, "paddingBottom")
            && +[MLCComputeEngineCommon forwardSourceTensorToChildLayersFrom:stopGradientTensorList:](MLCComputeEngineCommon, "forwardSourceTensorToChildLayersFrom:stopGradientTensorList:", v11, v28))
          {
            objc_msgSend(v11, "setSkipLayer:", 1);
            goto LABEL_27;
          }

        }
        objc_msgSend(v10, "resultTensors");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v11, "count") > 1)
          goto LABEL_27;
        objc_msgSend(v10, "resultTensors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "childLayers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15 <= 1)
        {
          v11 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          v31 = 0;
          v16 = v28;
          if (+[MLCPatternMatcher canTransformToReLUNFromLayer:stopGradientTensorList:fusedLayers:alpha:beta:](MLCPatternMatcher, "canTransformToReLUNFromLayer:stopGradientTensorList:fusedLayers:alpha:beta:", v10, v28, v11, (char *)&v31 + 4, &v31))
          {
            if (objc_msgSend(v11, "count") == 2 || objc_msgSend(v11, "count") == 3)
            {
              objc_msgSend(v11, "insertObject:atIndex:", v10, 0);
              objc_msgSend(v10, "sourceTensors");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[MLCComputeEngineCommon updateLayersAndTensorsForComplexActivationFunction:inputTensor:](MLCComputeEngineCommon, "updateLayersAndTensorsForComplexActivationFunction:inputTensor:", v11, v18);

              v19 = 0;
              goto LABEL_26;
            }
            +[MLCLog framework](MLCLog, "framework");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v33 = v21;
              v34 = 2112;
              v35 = v11;
              _os_log_impl(&dword_1D4999000, v20, OS_LOG_TYPE_INFO, "%@: cannot fuse layers = %@ to ReLUN", buf, 0x16u);

            }
            v16 = v28;
          }
          v22 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");

          v30 = 0;
          v23 = +[MLCPatternMatcher canTransformToHardSwishFromLayer:stopGradientTensorList:fusedLayers:inputTensor:](MLCPatternMatcher, "canTransformToHardSwishFromLayer:stopGradientTensorList:fusedLayers:inputTensor:", v10, v16, v22, &v30);
          v19 = v30;
          if (v23)
          {
            +[MLCComputeEngineCommon updateLayersAndTensorsForComplexActivationFunction:inputTensor:](MLCComputeEngineCommon, "updateLayersAndTensorsForComplexActivationFunction:inputTensor:", v22, v19);
            v11 = v22;
          }
          else
          {
            v11 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");

            v29 = v19;
            v24 = +[MLCPatternMatcher canTransformToGELUFromLayer:stopGradientTensorList:fusedLayers:inputTensor:](MLCPatternMatcher, "canTransformToGELUFromLayer:stopGradientTensorList:fusedLayers:inputTensor:", v10, v16, v11, &v29);
            v25 = v29;

            if (v24)
              +[MLCComputeEngineCommon updateLayersAndTensorsForComplexActivationFunction:inputTensor:](MLCComputeEngineCommon, "updateLayersAndTensorsForComplexActivationFunction:inputTensor:", v11, v25);
            v19 = v25;
          }
LABEL_26:

LABEL_27:
        }
      }

      ++a5;
    }
    while (a5 < objc_msgSend(v8, "count"));
  }

}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: cannot simplify redundant layer = %@, because its result is in stop gradient list", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: currently this function doesn't support multiple source tensors to parent layer", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: cannot simplify redundant layer = %@, because its result is liveout", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: currently this function doesn't support multiple outputs", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)forwardSourceTensorToChildLayersFrom:(const char *)a1 stopGradientTensorList:.cold.5(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: cannot forward multiple input tensors", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
