@implementation ICActivityStreamDigest

- (ICActivityStreamDigest)initWithResolver:(id)a3
{
  id v5;
  ICActivityStreamDigest *v6;
  ICActivityStreamDigest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICActivityStreamDigest;
  v6 = -[ICActivityStreamDigest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resolverStorage, a3);

  return v7;
}

- (ICActivityEventResolving)resolverStorage
{
  return self->_resolverStorage;
}

- (NSDate)lastActivitySummaryViewedDate
{
  return self->_lastActivitySummaryViewedDate;
}

- (void)setLastActivitySummaryViewedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)recentUpdatesGenerationDate
{
  return self->_recentUpdatesGenerationDate;
}

- (void)setRecentUpdatesGenerationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)recentActivityEventsStorage
{
  return self->_recentActivityEventsStorage;
}

- (void)setRecentActivityEventsStorage:(id)a3
{
  objc_storeStrong(&self->_recentActivityEventsStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recentActivityEventsStorage, 0);
  objc_storeStrong((id *)&self->_recentUpdatesGenerationDate, 0);
  objc_storeStrong((id *)&self->_lastActivitySummaryViewedDate, 0);
  objc_storeStrong((id *)&self->_resolverStorage, 0);
}

- (ICTTTextEditFilter)objc_recentUpdatesFilter
{
  ICActivityStreamDigest *v2;
  id v3;

  v2 = self;
  v3 = ICActivityStreamDigest.recentUpdatesFilter.getter();

  return (ICTTTextEditFilter *)v3;
}

- (BOOL)objc_hasUnseenHighlights
{
  ICActivityStreamDigest *v2;
  char v3;
  char v4;

  v2 = self;
  if (-[ICActivityStreamDigest objc_hasUnseenSummary](v2, sel_objc_hasUnseenSummary))
  {
    ICActivityStreamDigest.recentUpdatesRange.getter();
    v4 = v3;

    return (v4 & 1) == 0;
  }
  else
  {

    return 0;
  }
}

- (BOOL)objc_hasUnseenSummary
{
  ICActivityStreamDigest *v2;
  char v3;

  v2 = self;
  v3 = ICActivityStreamDigest.hasUnseenSummary.getter();

  return v3 & 1;
}

- (BOOL)objc_hasRecentUpdates
{
  ICActivityStreamDigest *v2;
  BOOL v3;

  v2 = self;
  v3 = ICActivityStreamDigest.hasRecentUpdates.getter();

  return v3;
}

- (NSValue)objc_recentUpdatesRangeValue
{
  ICActivityStreamDigest *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;

  v2 = self;
  v3 = ICActivityStreamDigest.recentUpdatesRange.getter();
  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend((id)objc_opt_self(), sel_valueWithRange_, v3, v4);

  return (NSValue *)v6;
}

- (BOOL)objc_isCurrentUserMentionedInRecentSummary
{
  ICActivityStreamDigest *v2;
  char v3;

  v2 = self;
  v3 = ICActivityStreamDigest.isCurrentUserMentionedInRecentSummary.getter();

  return v3 & 1;
}

- (BOOL)objc_isCurrentUserMentionedInFilter:(id)a3
{
  id v4;
  ICActivityStreamDigest *v5;
  char *v6;
  char v7;
  char v8;
  uint64_t v10;
  char v11;
  char v12;

  v4 = a3;
  v5 = self;
  v6 = (char *)sub_1BDAD1C18(v4);
  sub_1BDADF684(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BDAD4010((uint64_t)&v10);
  swift_bridgeObjectRelease();
  v7 = v11;
  v8 = v12;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v7 | v8) & 1;
}

@end
