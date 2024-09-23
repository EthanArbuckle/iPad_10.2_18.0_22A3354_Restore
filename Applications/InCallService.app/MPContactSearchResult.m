@implementation MPContactSearchResult

- (CNContact)contact
{
  return (CNContact *)sub_1001712B4();
}

- (void)setContact:(id)a3
{
  id v4;
  MPContactSearchResult *v5;

  v4 = a3;
  v5 = self;
  sub_100171308((uint64_t)v4);

}

- (CNContactMatchInfo)matchInfo
{
  return (CNContactMatchInfo *)sub_100171334();
}

- (void)setMatchInfo:(id)a3
{
  id v4;
  MPContactSearchResult *v5;

  v4 = a3;
  v5 = self;
  sub_100171388((uint64_t)v4);

}

- (id)preferredPhoneNumber
{
  return sub_1001713B4();
}

- (void)setPreferredPhoneNumber:(id)a3
{
  id v5;
  MPContactSearchResult *v6;

  v5 = a3;
  v6 = self;
  sub_100171428((uint64_t)a3);

}

- (MPContactSearchResult)initWithContact:(id)a3 matchInfo:(id)a4 preferredPhoneNumber:(id)a5
{
  id v7;
  id v8;
  id v9;
  MPContactSearchResult *result;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  sub_100171434(v7, v8, a5);
  return result;
}

- (MPContactSearchResult)init
{
  sub_100171524();
}

- (void).cxx_destruct
{

  sub_100135FA0(OBJC_IVAR___MPContactSearchResult_matchInfo);
}

@end
