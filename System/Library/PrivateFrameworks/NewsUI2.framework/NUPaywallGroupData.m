@implementation NUPaywallGroupData

- (NUPaywallGroupData)initWithGroupType:(int64_t)a3 groupID:(id)a4 groupCount:(int)a5 groupPosition:(int)a6 groupedArticleIDs:(id)a7 groupedIssueIDs:(id)a8 groupedTagIDs:(id)a9
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v14 = sub_1D6E26978();
  v16 = v15;
  if (a7)
    a7 = (id)sub_1D6E26D80();
  if (a8)
    a8 = (id)sub_1D6E26D80();
  if (a9)
    v17 = sub_1D6E26D80();
  else
    v17 = 0;
  return (NUPaywallGroupData *)PaywallGroupData.init(groupType:groupID:groupCount:groupPosition:groupedArticleIDs:groupedIssueIDs:groupedTagIDs:)(a3, v14, v16, a5, a6, (uint64_t)a7, (uint64_t)a8, v17);
}

- (NUPaywallGroupData)init
{
  NUPaywallGroupData *result;

  result = (NUPaywallGroupData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D6899AE8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___NUPaywallGroupData_groupData, (uint64_t (*)(_QWORD))MEMORY[0x1E0D56758]);
}

@end
