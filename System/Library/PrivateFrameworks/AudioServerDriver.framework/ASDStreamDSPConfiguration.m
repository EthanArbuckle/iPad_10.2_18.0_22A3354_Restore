@implementation ASDStreamDSPConfiguration

- (ASDStreamDSPConfiguration)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  ASDStreamDSPConfiguration *v8;
  void *v9;
  ASDDSPConfiguration *v10;
  ASDDSPConfiguration *hardwareDSP;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ASDStreamDSPConfiguration;
  v8 = -[ASDStreamDSPConfiguration init](&v21, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Hardware"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[ASDDSPConfiguration initWithArray:resourcePath:]([ASDDSPConfiguration alloc], "initWithArray:resourcePath:", v9, v7);
      hardwareDSP = v8->_hardwareDSP;
      v8->_hardwareDSP = v10;

      if (!v8->_hardwareDSP)
      {
        v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v12)
          -[ASDStreamDSPConfiguration initWithDictionary:resourcePath:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

        v8 = 0;
      }
    }

  }
  return v8;
}

- (ASDDSPConfiguration)hardwareDSP
{
  return self->_hardwareDSP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareDSP, 0);
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "ASDStreamDSPConfiguration parse failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
