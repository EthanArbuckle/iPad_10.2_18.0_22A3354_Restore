@implementation MPMRInitPropertyPlaybackPositionMap

void *___MPMRInitPropertyPlaybackPositionMap_block_invoke_3_130()
{
  return &unk_1E31E49C0;
}

uint64_t ___MPMRInitPropertyPlaybackPositionMap_block_invoke_2_128()
{
  return 0;
}

void *___MPMRInitPropertyPlaybackPositionMap_block_invoke_126()
{
  return &unk_1E31E65E0;
}

void *___MPMRInitPropertyPlaybackPositionMap_block_invoke_4()
{
  return &unk_1E31E65E0;
}

uint64_t ___MPMRInitPropertyPlaybackPositionMap_block_invoke_3()
{
  return MEMORY[0x1E0C9AAA0];
}

id ___MPMRInitPropertyPlaybackPositionMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "deviceSpecificUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rembok"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
