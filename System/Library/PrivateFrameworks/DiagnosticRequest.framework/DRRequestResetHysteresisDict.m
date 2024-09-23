@implementation DRRequestResetHysteresisDict

void ___DRRequestResetHysteresisDict_block_invoke()
{
  id v0;

  _hysteresisDict();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

}

@end
