@implementation ASDDSPConfiguration

- (ASDDSPConfiguration)initWithArray:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  ASDDSPConfiguration *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ASDDSPItemInfo *v16;
  ASDDSPItemInfo *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ASDDSPConfiguration;
  v8 = -[ASDDSPConfiguration init](&v32, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = -[ASDDSPItemInfo initWithDictionary:resourcePath:]([ASDDSPItemInfo alloc], "initWithDictionary:resourcePath:", v15, v7);
            if (!v16)
            {

              v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v18)
                -[ASDDSPConfiguration initWithArray:resourcePath:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

              v8 = 0;
              goto LABEL_16;
            }
            v17 = v16;
            objc_msgSend(v9, "addObject:", v16);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_storeStrong((id *)&v8->_dspItems, v9);
LABEL_16:
    v6 = v27;

  }
  return v8;
}

- (NSArray)dspItems
{
  return self->_dspItems;
}

- (void)setDspItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dspItems, 0);
}

- (void)initWithArray:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "ASDDSPConfiguration parse failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
