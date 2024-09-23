@implementation CSIsInternalBuild

void __CSIsInternalBuild_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  CSIsInternalBuild_isInternal = objc_msgSend(v0, "BOOLValue");

}

@end
