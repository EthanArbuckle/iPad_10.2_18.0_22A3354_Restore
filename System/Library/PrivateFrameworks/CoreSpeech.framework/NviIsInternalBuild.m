@implementation NviIsInternalBuild

void __NviIsInternalBuild_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  NviIsInternalBuild_isInternal = objc_msgSend(v0, "BOOLValue");

}

@end
