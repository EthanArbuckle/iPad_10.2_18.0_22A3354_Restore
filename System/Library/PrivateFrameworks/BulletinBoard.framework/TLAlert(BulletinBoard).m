@implementation TLAlert(BulletinBoard)

+ (uint64_t)bb_toneLibraryAlertTypeForSectionID:()BulletinBoard
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = bb_toneLibraryAlertTypeForSectionID__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&bb_toneLibraryAlertTypeForSectionID__onceToken, &__block_literal_global_16);
  objc_msgSend((id)bb_toneLibraryAlertTypeForSectionID____sectionIDToAlertType, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

@end
