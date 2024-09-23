@implementation ASDTExclavesStream

- (ASDTExclavesStream)initWithConfig:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  ASDTExclavesStream *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDTExclavesStream;
  v8 = -[ASDTStream initWithConfig:withDevice:](&v11, sel_initWithConfig_withDevice_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "asdtExclavesBufferName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTExclavesStream setExclavesBufferName:](v8, "setExclavesBufferName:", v9);

  }
  return v8;
}

- (ASDTExclavesStream)initWithDirection:(unsigned int)a3 withDevice:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDTExclavesStream;
  return -[ASDTStream initWithDirection:withDevice:](&v5, sel_initWithDirection_withDevice_, *(_QWORD *)&a3, a4);
}

- (BOOL)usesExclavesNamedBuffer
{
  void *v2;
  BOOL v3;

  -[ASDTExclavesStream exclavesBufferName](self, "exclavesBufferName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)allocExclavesNamedBuffer:(unsigned int)a3
{
  void *v5;
  id v6;
  NamedBuffer *v7;
  NamedBuffer *value;
  ASDT::Exclaves::NamedBuffer *v9;
  NamedBuffer *v10;
  NamedBuffer *v11;
  BOOL v12;
  uint64_t v13;
  NamedBuffer *v15;

  -[ASDTExclavesStream exclavesBufferName](self, "exclavesBufferName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASDTExclavesStream exclavesBufferName](self, "exclavesBufferName");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    ASDT::Exclaves::NamedBuffer::Create((ASDT::Exclaves::NamedBuffer *)objc_msgSend(v6, "UTF8String"), (const char *)a3, (ASDT::Exclaves::NamedBuffer **)&v15);
    v7 = v15;
    v15 = 0;
    value = self->_exclavesBuffer.__ptr_.__value_;
    self->_exclavesBuffer.__ptr_.__value_ = v7;
    if (value)
    {
      (*(void (**)(NamedBuffer *))(*(_QWORD *)value + 8))(value);
      v9 = (ASDT::Exclaves::NamedBuffer *)v15;
      v15 = 0;
      if (v9)
        (*(void (**)(ASDT::Exclaves::NamedBuffer *))(*(_QWORD *)v9 + 8))(v9);
    }

  }
  else
  {
    v10 = self->_exclavesBuffer.__ptr_.__value_;
    self->_exclavesBuffer.__ptr_.__value_ = 0;
    if (v10)
      (*(void (**)(NamedBuffer *))(*(_QWORD *)v10 + 8))(v10);
  }
  v11 = self->_exclavesBuffer.__ptr_.__value_;
  v12 = v11 != 0;
  if (v11)
    v13 = a3;
  else
    v13 = 0;
  -[ASDTExclavesStream setExclavesBufferSize:](self, "setExclavesBufferSize:", v13);
  return v12;
}

- (void)freeExclavesNamedBuffer
{
  NamedBuffer *value;

  value = self->_exclavesBuffer.__ptr_.__value_;
  self->_exclavesBuffer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(NamedBuffer *, SEL))(*(_QWORD *)value + 8))(value, a2);
  -[ASDTExclavesStream setExclavesBufferSize:](self, "setExclavesBufferSize:", 0);
}

- (void)exclavesBuffer
{
  return self->_exclavesBuffer.__ptr_.__value_;
}

- (id)exclavesReadInput
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  id *v7;
  NamedBuffer *value;
  void *v9;
  _QWORD aBlock[6];
  unsigned int v12;
  int v13;

  -[ASDStream physicalFormat](self, "physicalFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bytesPerFrame");

  v5 = -[ASDTStream ioBufferSize](self, "ioBufferSize");
  -[ASDTStream updateClientPositionBlock](self, "updateClientPositionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTStream setUpdateClientPositionCopy:](self, "setUpdateClientPositionCopy:", v6);

  v7 = -[ASDTStream getUpdateClientPositionUnretainedAddress](self, "getUpdateClientPositionUnretainedAddress");
  value = self->_exclavesBuffer.__ptr_.__value_;
  if (value)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__ASDTExclavesStream_exclavesReadInput__block_invoke;
    aBlock[3] = &__block_descriptor_56_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
    v12 = v4;
    v13 = v5 / v4;
    aBlock[4] = value;
    aBlock[5] = v7;
    v9 = _Block_copy(aBlock);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

uint64_t __39__ASDTExclavesStream_exclavesReadInput__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned __int8 *a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a3)
    __39__ASDTExclavesStream_exclavesReadInput__block_invoke_cold_1();
  if (!a4)
    __39__ASDTExclavesStream_exclavesReadInput__block_invoke_cold_2();
  v6 = (unint64_t)*(double *)(a3 + 80);
  v7 = ASDT::Exclaves::NamedBuffer::Read(*(ASDT::Exclaves::NamedBuffer **)(a1 + 32), a4, a2, *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), v6);
  v8 = **(_QWORD **)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, v6 + a2);
  return v7;
}

- (id)readInputBlock
{
  void *v3;
  objc_super v5;

  if (-[ASDStream direction](self, "direction") == 1768845428
    && -[ASDTExclavesStream usesExclavesNamedBuffer](self, "usesExclavesNamedBuffer"))
  {
    -[ASDTExclavesStream exclavesReadInput](self, "exclavesReadInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ASDTExclavesStream;
    -[ASDTStream readInputBlock](&v5, sel_readInputBlock);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)exclavesBufferName
{
  return self->_exclavesBufferName;
}

- (void)setExclavesBufferName:(id)a3
{
  objc_storeStrong((id *)&self->_exclavesBufferName, a3);
}

- (unsigned)exclavesBufferSize
{
  return self->_exclavesBufferSize;
}

- (void)setExclavesBufferSize:(unsigned int)a3
{
  self->_exclavesBufferSize = a3;
}

- (void).cxx_destruct
{
  NamedBuffer *value;

  objc_storeStrong((id *)&self->_exclavesBufferName, 0);
  value = self->_exclavesBuffer.__ptr_.__value_;
  self->_exclavesBuffer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(NamedBuffer *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 41) = 0;
  return self;
}

void __39__ASDTExclavesStream_exclavesReadInput__block_invoke_cold_1()
{
  __assert_rtn("-[ASDTExclavesStream exclavesReadInput]_block_invoke", "ASDTExclavesStream.mm", 106, "ioCycleInfo");
}

void __39__ASDTExclavesStream_exclavesReadInput__block_invoke_cold_2()
{
  __assert_rtn("-[ASDTExclavesStream exclavesReadInput]_block_invoke", "ASDTExclavesStream.mm", 107, "ioMainBuffer");
}

@end
