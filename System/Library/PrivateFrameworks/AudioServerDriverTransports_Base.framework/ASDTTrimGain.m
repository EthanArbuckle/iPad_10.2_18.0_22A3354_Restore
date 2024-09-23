@implementation ASDTTrimGain

- (ASDTTrimGain)initWithSysCfgData:(id)a3 andType:(int)a4
{
  uint64_t v4;
  id v6;
  ASDTTrimGain *v7;
  id v8;
  uint64_t v9;
  id v10;
  unsigned __int8 *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  ASDTTrimGain *v16;
  void *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASDTTrimGain;
  v7 = -[ASDTAcousticData initWithSysCfgData:andType:](&v20, sel_initWithSysCfgData_andType_, v6, v4);
  if (v7)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = *(unsigned __int16 *)objc_msgSend(v8, "bytes");
    if ((_DWORD)v9 == 2)
    {
      v10 = objc_retainAutorelease(v8);
      v11 = (unsigned __int8 *)objc_msgSend(v10, "bytes");
      if (ASDT::Acoustic::Base::valid((ASDT::Acoustic::Base *)v11, objc_msgSend(v10, "length"), 6uLL, 2))
      {
        ASDT::Acoustic::Data<ASDT::Acoustic::TrimGainV2,(unsigned short)2>::entries(v11);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          -[ASDTAcousticData setEntries:](v7, "setEntries:", v12);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            -[ASDTAcousticData name](v7, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASDTAcousticData entries](v7, "entries");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v22 = v14;
            v23 = 2112;
            v24 = v15;
            _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

          }
          goto LABEL_8;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ASDTAcousticData name](v7, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTTrimGain initWithSysCfgData:andType:].cold.1(v18, buf);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTTrimGain initWithSysCfgData:andType:].cold.2();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTAcousticData name](v7, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTTrimGain initWithSysCfgData:andType:].cold.3(v17, (uint64_t)buf, v9);
    }
    v16 = 0;
    goto LABEL_16;
  }
LABEL_8:
  v16 = v7;
LABEL_16:

  return v16;
}

- (void)initWithSysCfgData:(void *)a1 andType:(uint8_t *)buf .cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Could not generate entries from data.", buf, 0xCu);

}

- (void)initWithSysCfgData:andType:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid Trim data.", v0, 2u);
}

- (void)initWithSysCfgData:(uint64_t)a3 andType:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_1_7(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Unsupported data version: %hu", (uint8_t *)a2);

}

@end
