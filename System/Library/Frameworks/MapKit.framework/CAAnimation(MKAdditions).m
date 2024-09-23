@implementation CAAnimation(MKAdditions)

- (uint64_t)_mapkit_ID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForUndefinedKey:", CFSTR("_mapkit_ID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)set_mapkit_ID:()MKAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forUndefinedKey:", v2, CFSTR("_mapkit_ID"));

}

@end
