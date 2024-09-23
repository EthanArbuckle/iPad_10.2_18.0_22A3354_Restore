@implementation DPMetadataExpectedClasses

void ___DPMetadataExpectedClasses_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_DPMetadataExpectedClasses__DPMetadataExpectedClassesSet;
  _DPMetadataExpectedClasses__DPMetadataExpectedClassesSet = v5;

}

@end
