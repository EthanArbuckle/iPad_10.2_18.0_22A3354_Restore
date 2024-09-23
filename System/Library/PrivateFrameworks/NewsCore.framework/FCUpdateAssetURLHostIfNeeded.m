@implementation FCUpdateAssetURLHostIfNeeded

void __FCUpdateAssetURLHostIfNeeded_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  char v4;

  NewsCoreUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ED0F8829 = objc_msgSend(v0, "BOOLForKey:", CFSTR("replace_cdn_with_cvws"));

  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentContainerIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0F8838;
  qword_1ED0F8838 = v2;

  if (byte_1ED0F8829)
    v4 = 0;
  else
    v4 = FCShouldReroutePermanentURLsForContainerIdentifier((void *)qword_1ED0F8838) ^ 1;
  byte_1ED0F882A = v4;
}

@end
