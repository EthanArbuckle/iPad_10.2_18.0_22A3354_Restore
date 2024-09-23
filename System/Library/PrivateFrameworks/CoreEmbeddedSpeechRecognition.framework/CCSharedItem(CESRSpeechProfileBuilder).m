@implementation CCSharedItem(CESRSpeechProfileBuilder)

- (void)setIsBoosted:()CESRSpeechProfileBuilder
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &kIsBoostedKey, v2, (void *)3);

}

- (uint64_t)isBoosted
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &kIsBoostedKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
