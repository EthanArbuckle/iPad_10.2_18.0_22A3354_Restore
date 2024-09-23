@implementation HMDCKRecordIDSafeCharacters

void __HMDCKRecordIDSafeCharacters_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890._-"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HMDCKRecordIDSafeCharacters__hmf_once_v1;
  HMDCKRecordIDSafeCharacters__hmf_once_v1 = v0;

}

@end
