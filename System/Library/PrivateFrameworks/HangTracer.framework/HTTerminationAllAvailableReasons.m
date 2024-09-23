@implementation HTTerminationAllAvailableReasons

void __HTTerminationAllAvailableReasons_block_invoke()
{
  unint64_t v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v0 = 2;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v1);

    v2 = v0 >> 41;
    v0 *= 2;
  }
  while (!v2);
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)HTTerminationAllAvailableReasons_allReasons;
  HTTerminationAllAvailableReasons_allReasons = v3;

}

@end
