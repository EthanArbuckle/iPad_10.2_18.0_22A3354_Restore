@implementation AXProcessGetName

void __AXProcessGetName_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)AXProcessGetName__AXProcessName;
  AXProcessGetName__AXProcessName = v1;

}

@end
