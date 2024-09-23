@implementation ASDTGestalt

+ (id)getAcousticID
{
  uint64_t v2;
  void *v3;

  v2 = MGGetSInt32Answer();
  if ((int)v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%d"), "AID", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)runningOnInternalBuild
{
  return MGGetBoolAnswer();
}

@end
