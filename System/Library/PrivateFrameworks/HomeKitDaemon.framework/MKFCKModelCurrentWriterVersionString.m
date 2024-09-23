@implementation MKFCKModelCurrentWriterVersionString

void __MKFCKModelCurrentWriterVersionString_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareVersion");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "versionString");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MKFCKModelCurrentWriterVersionString__hmf_once_v3;
  MKFCKModelCurrentWriterVersionString__hmf_once_v3 = v1;

}

@end
