@implementation BBBulletin(UniqueKey)

- (id)blt_uniqueKey
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "sectionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "publisherMatchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
