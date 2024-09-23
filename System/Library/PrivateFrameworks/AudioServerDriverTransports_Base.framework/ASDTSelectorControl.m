@implementation ASDTSelectorControl

- (ASDTSelectorControl)initWithConfig:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  ASDTSelectorControl *v23;
  void *v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  unsigned int v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32 = 0;
  if (!objc_msgSend(v6, "asdtControlClassID:", &v32))
  {
LABEL_23:
    v23 = 0;
    goto LABEL_24;
  }
  v8 = objc_msgSend(v6, "asdtIsSettable");
  v9 = objc_msgSend(v6, "asdtElement");
  v10 = objc_msgSend(v6, "asdtScope");
  objc_msgSend(v7, "plugin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)ASDTSelectorControl;
  self = -[ASDSelectorControl initWithIsSettable:forElement:inScope:withPlugin:andObjectClassID:](&v31, sel_initWithIsSettable_forElement_inScope_withPlugin_andObjectClassID_, v8, v9, v10, v11, v32);

  if (!self)
    goto LABEL_14;
  objc_msgSend(v6, "asdtSelectorControlItems");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTSelectorControl initWithConfig:withDevice:].cold.1(v7);
LABEL_22:

    goto LABEL_23;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (!v13)
    goto LABEL_13;
  v14 = v13;
  v15 = *(_QWORD *)v28;
  v25 = v7;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v17, "asdtName", v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "asdtSelectorControlItemKind");
      v20 = objc_msgSend(v17, "asdtSelectorControlItemSelected");
      v26 = 0;
      if ((objc_msgSend(v17, "asdtSelectorControlItemValue:", &v26) & 1) == 0)
      {
        v7 = v25;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ASDTSelectorControl initWithConfig:withDevice:].cold.3(v25);
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BE0A268], "withValue:name:andKind:selected:", v26, v18, v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v7 = v25;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ASDTSelectorControl initWithConfig:withDevice:].cold.2(v25);
LABEL_21:

        goto LABEL_22;
      }
      v22 = (void *)v21;
      -[ASDSelectorControl addValue:](self, "addValue:", v21);

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    v7 = v25;
    if (v14)
      continue;
    break;
  }
LABEL_13:

LABEL_14:
  self = self;
  v23 = self;
LABEL_24:

  return v23;
}

- (void)initWithConfig:(void *)a1 withDevice:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Selector control must contain items.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)initWithConfig:(void *)a1 withDevice:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Memory allocation error for selector value.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)initWithConfig:(void *)a1 withDevice:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Selector control items must include a value.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

@end
