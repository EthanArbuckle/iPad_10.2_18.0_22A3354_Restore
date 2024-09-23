@implementation ASDTSpeakerThieleSmall

- (ASDTSpeakerThieleSmall)initWithSysCfgData:(id)a3
{
  id v4;
  ASDTSpeakerThieleSmall *v5;
  id v6;
  uint64_t v7;
  id v8;
  unsigned __int8 *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  ASDTSpeakerThieleSmall *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDTSpeakerThieleSmall;
  v5 = -[ASDTAcousticData initWithSysCfgData:andType:](&v21, sel_initWithSysCfgData_andType_, v4, 1399870547);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = *(unsigned __int16 *)objc_msgSend(v6, "bytes");
    if ((_DWORD)v7 == 2)
    {
      v8 = objc_retainAutorelease(v6);
      v9 = (unsigned __int8 *)objc_msgSend(v8, "bytes");
      if (ASDT::Acoustic::Base::valid((ASDT::Acoustic::Base *)v9, objc_msgSend(v8, "length"), 0x16uLL, 2))
      {
        ASDT::Acoustic::Data<ASDT::Acoustic::SpeakerThieleSmallV2,(unsigned short)2>::entries(v9);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          -[ASDTAcousticData setEntries:](v5, "setEntries:", v10);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            -[ASDTAcousticData name](v5, "name");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASDTAcousticData entries](v5, "entries");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v23 = v12;
            v24 = 2112;
            v25 = v13;
            _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

          }
          goto LABEL_8;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ASDTAcousticData name](v5, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTSpeakerThieleSmall initWithSysCfgData:].cold.1(v18, (uint64_t)buf, v19);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTAcousticData name](v5, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTSpeakerThieleSmall initWithSysCfgData:].cold.2(v16, (uint64_t)buf, v17);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTAcousticData name](v5, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTSpeakerThieleSmall initWithSysCfgData:].cold.3(v15, (uint64_t)buf, v7);
    }
    v14 = 0;
    goto LABEL_16;
  }
LABEL_8:
  v14 = v5;
LABEL_16:

  return v14;
}

- (void)initWithSysCfgData:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Could not generate entries from data.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)initWithSysCfgData:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Invalid data.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)initWithSysCfgData:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_1_7(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Unsupported data version: %hu", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

@end
