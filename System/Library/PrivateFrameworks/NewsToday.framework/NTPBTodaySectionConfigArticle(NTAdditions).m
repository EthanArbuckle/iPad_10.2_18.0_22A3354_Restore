@implementation NTPBTodaySectionConfigArticle(NTAdditions)

- (id)displayDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "displayDateString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "fc_dateFromStringWithISO8601Format:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
