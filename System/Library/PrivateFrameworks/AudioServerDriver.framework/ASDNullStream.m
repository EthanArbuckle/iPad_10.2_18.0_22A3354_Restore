@implementation ASDNullStream

- (id)readInputBlock
{
  void *v2;
  int v3;
  _QWORD v5[4];
  int v6;

  -[ASDStream physicalFormat](self, "physicalFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bytesPerFrame");

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__ASDNullStream_readInputBlock__block_invoke;
  v5[3] = &__block_descriptor_36_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
  v6 = v3;
  return (id)MEMORY[0x220733498](v5);
}

uint64_t __31__ASDNullStream_readInputBlock__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  bzero(a4, (*(_DWORD *)(a1 + 32) * a2));
  return 0;
}

- (id)writeMixBlock
{
  return &__block_literal_global;
}

uint64_t __30__ASDNullStream_writeMixBlock__block_invoke()
{
  return 0;
}

@end
