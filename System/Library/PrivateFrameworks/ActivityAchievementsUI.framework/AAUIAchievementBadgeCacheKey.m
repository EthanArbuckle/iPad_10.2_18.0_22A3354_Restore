@implementation AAUIAchievementBadgeCacheKey

id __AAUIAchievementBadgeCacheKey_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __AAUIAchievementBadgeCacheKey_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  AAUIAchievementBadgeCacheKey_scale = v0;

}

@end
