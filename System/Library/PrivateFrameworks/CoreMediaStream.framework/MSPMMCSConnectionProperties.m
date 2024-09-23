@implementation MSPMMCSConnectionProperties

void __MSPMMCSConnectionProperties_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  MSPlatform();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "socketOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D468F0], 0);
  v3 = (void *)MSPMMCSConnectionProperties_dict;
  MSPMMCSConnectionProperties_dict = v2;

}

@end
