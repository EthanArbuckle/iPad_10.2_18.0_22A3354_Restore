@implementation CLKDropLeftRedundantDesignator

void __CLKDropLeftRedundantDesignator_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  CLKLocalizedString(CFSTR("INTERVAL_DROP_LEFTMOST_REDUNDANT_DESIGNATOR"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v3 = v0;
    v2 = objc_msgSend(v0, "BOOLValue");
    v1 = v3;
    if ((v2 & 1) == 0)
      CLKDropLeftRedundantDesignator_dropLeft = 1;
  }

}

@end
