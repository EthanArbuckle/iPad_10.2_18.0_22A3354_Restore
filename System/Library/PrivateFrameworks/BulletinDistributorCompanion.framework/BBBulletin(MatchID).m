@implementation BBBulletin(MatchID)

- (id)sectionMatchID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "universalSectionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "sectionID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (uint64_t)matchesPublisherBulletinID:()MatchID andRecordID:
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  if (a3)
    v7 = a3;
  else
    v7 = a4;
  v8 = v7;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "publisherMatchID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v8);

  return v12;
}

@end
