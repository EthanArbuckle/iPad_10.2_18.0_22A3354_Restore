@implementation NUAddToSafariReadingListActivity

- (id)activityType
{
  return CFSTR("com.apple.news.activity.AddToSafariReadingList");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  NUBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Add to Safari Reading List"), &stru_24D5A3F98, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
