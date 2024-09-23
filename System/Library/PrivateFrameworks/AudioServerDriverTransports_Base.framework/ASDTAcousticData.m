@implementation ASDTAcousticData

+ (id)createWithSysCfgData:(id)a3 andType:(int)a4
{
  uint64_t v4;
  id v5;
  ASDTTrimGain *v6;
  ASDTTrimGain *v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if ((_DWORD)v4 == 1298745185 || (_DWORD)v4 == 1399867233)
  {
    v6 = -[ASDTTrimGain initWithSysCfgData:andType:]([ASDTTrimGain alloc], "initWithSysCfgData:andType:", v5, v4);
    goto LABEL_6;
  }
  if ((_DWORD)v4 == 1399870547)
  {
    v6 = -[ASDTSpeakerThieleSmall initWithSysCfgData:]([ASDTSpeakerThieleSmall alloc], "initWithSysCfgData:", v5);
LABEL_6:
    v7 = v6;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[ASDTAcousticData createWithSysCfgData:andType:].cold.1(v4);
  v7 = 0;
LABEL_10:

  return v7;
}

- (ASDTAcousticData)initWithSysCfgData:(id)a3 andType:(int)a4
{
  uint64_t v4;
  id v6;
  ASDTAcousticData *v7;
  id v8;
  int32x4_t v9;
  int8x8_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int16x8_t v13;
  void *v14;
  ASDTAcousticData *v15;
  unsigned __int32 v17;
  char v18;
  objc_super v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASDTAcousticData;
  v7 = -[ASDTAcousticData init](&v19, sel_init);
  if (!v7)
    goto LABEL_5;
  v8 = objc_retainAutorelease(v6);
  if (objc_msgSend(v8, "bytes") && (unint64_t)objc_msgSend(v8, "length") > 6)
  {
    -[ASDTAcousticData setDataType:](v7, "setDataType:", v4);
    v18 = 0;
    v9 = (int32x4_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v4), (uint32x4_t)xmmword_236D2B6A0);
    v10 = (int8x8_t)vmovn_s32(v9);
    v11 = vshlq_n_s32(v9, 0x18uLL);
    v12.i64[0] = 0x7F0000007F000000;
    v12.i64[1] = 0x7F0000007F000000;
    v13 = (int16x8_t)vorrq_s8((int8x16_t)vcgtq_s32(vdupq_n_s32(0x1F000001u), v11), (int8x16_t)vceqq_s32(v11, v12));
    *(int16x4_t *)v13.i8 = vrev64_s16((int16x4_t)vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)v13), (int8x8_t)0x3F003F003F003FLL, v10));
    v17 = vmovn_s16(v13).u32[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAcousticData setName:](v7, "setName:", v14);

LABEL_5:
    v15 = v7;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTAcousticData initWithSysCfgData:andType:].cold.1();
  v15 = 0;
LABEL_9:

  return v15;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (int)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int)a3
{
  self->_dataType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

+ (void)createWithSysCfgData:(unsigned int)a1 andType:.cold.1(unsigned int a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = HIBYTE(a1);
  if ((a1 - 0x20000000) >> 24 >= 0x5F)
    v1 = 32;
  v2 = BYTE2(a1);
  if (BYTE2(a1) - 32 >= 0x5F)
    v2 = 32;
  v3 = BYTE1(a1);
  if (BYTE1(a1) - 32 >= 0x5F)
    v3 = 32;
  v5[0] = 67109888;
  v5[1] = v1;
  v6 = 1024;
  v7 = v2;
  v8 = 1024;
  v9 = v3;
  if (a1 - 32 >= 0x5F)
    v4 = 32;
  else
    v4 = a1;
  v10 = 1024;
  v11 = v4;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ASDTAcousticData: Unsupported acoustic data type: '%c%c%c%c'", (uint8_t *)v5, 0x1Au);
}

- (void)initWithSysCfgData:andType:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ASDTAcousticData: Bad input data length.", v0, 2u);
}

@end
