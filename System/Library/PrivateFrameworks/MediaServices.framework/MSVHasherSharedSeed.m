@implementation MSVHasherSharedSeed

void __MSVHasherSharedSeed_block_invoke()
{
  BOOL v0;
  uint32_t v1;
  BOOL v2;

  if (MSVHasherSharedSeed___seed_0)
    v0 = MSVHasherSharedSeed___seed_1 == 0;
  else
    v0 = 1;
  if (v0)
  {
    do
    {
      MSVHasherSharedSeed___seed_0 = arc4random();
      v1 = arc4random();
      MSVHasherSharedSeed___seed_1 = v1;
      if (MSVHasherSharedSeed___seed_0)
        v2 = v1 == 0;
      else
        v2 = 1;
    }
    while (v2);
  }
}

@end
