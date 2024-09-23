@implementation ASDDSPGraphLoader

+ (id)graphWithConfiguration:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = a3;
  objc_msgSend(v29, "dspItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v4)
    goto LABEL_28;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v31;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[ASDDSPGraphLoader graphWithGraphInfo:](ASDDSPGraphLoader, "graphWithGraphInfo:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
        if (!v10)
          goto LABEL_29;
        continue;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v6)
        {
          if (+[ASDDSPGraphLoader applyAUStrip:toGraph:](ASDDSPGraphLoader, "applyAUStrip:toGraph:", v9, v6))
          {
            continue;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            +[ASDDSPGraphLoader graphWithConfiguration:].cold.2(v9, v6);
LABEL_27:

          goto LABEL_28;
        }
        v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v11)
          +[ASDDSPGraphLoader graphWithConfiguration:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_28:
        v6 = 0;
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        continue;
      if (!v6)
      {
        v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v20)
          +[ASDDSPGraphLoader graphWithConfiguration:].cold.3(v20, v21, v22, v23, v24, v25, v26, v27);
        goto LABEL_28;
      }
      if (!+[ASDDSPGraphLoader applyPropertyStrip:toGraph:](ASDDSPGraphLoader, "applyPropertyStrip:toGraph:", v9, v6))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          +[ASDDSPGraphLoader graphWithConfiguration:].cold.4(v9, v6);
        goto LABEL_27;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v5)
      continue;
    break;
  }
LABEL_29:

  return v6;
}

+ (id)graphWithGraphInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substitutions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "includePaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASDDSPGraphInterpreter compileText:withSubstitutions:includingPaths:](ASDDSPGraphInterpreter, "compileText:withSubstitutions:includingPaths:", v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v8;

    goto LABEL_6;
  }
  objc_msgSend(v3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substitutions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "includePaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASDDSPGraphInterpreter compileFile:withSubstitutions:includingPaths:](ASDDSPGraphInterpreter, "compileFile:withSubstitutions:includingPaths:", v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v12)
    +[ASDDSPGraphLoader graphWithGraphInfo:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  v10 = 0;
LABEL_6:

  return v10;
}

+ (BOOL)applyAUStrip:(id)a3 toGraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "AUStripInfo value:%@ path:%@", (uint8_t *)&v25, 0x16u);

  }
  objc_msgSend(v5, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "setAUStrip:", v10);

  }
  else
  {
    objc_msgSend(v5, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(v5, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dictionaryWithContentsOfFile:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v6, "setAUStrip:", v15);
    }
    else
    {
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        +[ASDDSPGraphLoader applyAUStrip:toGraph:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)applyPropertyStrip:(id)a3 toGraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "setPropertyStrip:", v8);

  }
  else
  {
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(v5, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dictionaryWithContentsOfFile:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v6, "setPropertyStrip:", v13);
    }
    else
    {
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v14)
        +[ASDDSPGraphLoader applyPropertyStrip:toGraph:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
      v9 = 0;
    }
  }

  return v9;
}

+ (void)graphWithConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Error applying AUStrip. DSPGraph must be the first item in a DSPConfiguration.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

+ (void)graphWithConfiguration:(void *)a1 .cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_219C60000, MEMORY[0x24BDACB70], v5, "Applying AUStrip %@ to graph %@ failed", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

+ (void)graphWithConfiguration:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Error applying PropertyStrip. DSPGraph must be the first item in a DSPConfiguration.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

+ (void)graphWithConfiguration:(void *)a1 .cold.4(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_219C60000, MEMORY[0x24BDACB70], v5, "Applying PropertyStrip %@ to graph %@ failed", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

+ (void)graphWithGraphInfo:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "DSPGraphInfo doesn't specify either text or path", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

+ (void)applyAUStrip:(uint64_t)a3 toGraph:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "AUStripInfo doesn't specify either value or path", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

+ (void)applyPropertyStrip:(uint64_t)a3 toGraph:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "PropertyStripInfo doesn't specify either value or path", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
