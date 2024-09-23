@implementation HMDCKRecordIDEncodedCharacters

void __HMDCKRecordIDEncodedCharacters_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  HMDCKRecordIDSafeCharacters();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "addCharactersInString:", CFSTR("%0123456789abcdefABCDEF"));
  v2 = objc_msgSend(v1, "copy");

  v3 = (void *)HMDCKRecordIDEncodedCharacters__hmf_once_v3;
  HMDCKRecordIDEncodedCharacters__hmf_once_v3 = v2;

}

@end
