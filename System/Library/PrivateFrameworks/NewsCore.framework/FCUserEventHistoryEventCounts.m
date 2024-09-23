@implementation FCUserEventHistoryEventCounts

- (FCUserEventHistoryEventCounts)initWithArticleSeenEventCount:(int64_t)a3 articleVisitedEventCount:(int64_t)a4 articleReadEventCount:(int64_t)a5 articleLikedEventCount:(int64_t)a6 articleDislikedEventCount:(int64_t)a7 articleSharedEventCount:(int64_t)a8 articleSavedEventCount:(int64_t)a9 feedViewEventCount:(int64_t)a10 tagFollowedEventCount:(int64_t)a11 tagUnfollowedEventCount:(int64_t)a12 tagMutedEventCount:(int64_t)a13
{
  FCUserEventHistoryEventCounts *result;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FCUserEventHistoryEventCounts;
  result = -[FCUserEventHistoryEventCounts init](&v20, sel_init);
  if (result)
  {
    result->_articleSeenEventCount = a3;
    result->_articleVisitedEventCount = a4;
    result->_articleReadEventCount = a5;
    result->_articleLikedEventCount = a6;
    result->_articleDislikedEventCount = a7;
    result->_articleSharedEventCount = a8;
    result->_articleSavedEventCount = a9;
    result->_feedViewEventCount = a10;
    result->_tagFollowedEventCount = a11;
    result->_tagUnfollowedEventCount = a12;
    result->_tagMutedEventCount = a13;
  }
  return result;
}

+ (FCUserEventHistoryEventCounts)empty
{
  return -[FCUserEventHistoryEventCounts initWithArticleSeenEventCount:articleVisitedEventCount:articleReadEventCount:articleLikedEventCount:articleDislikedEventCount:articleSharedEventCount:articleSavedEventCount:feedViewEventCount:tagFollowedEventCount:tagUnfollowedEventCount:tagMutedEventCount:]([FCUserEventHistoryEventCounts alloc], "initWithArticleSeenEventCount:articleVisitedEventCount:articleReadEventCount:articleLikedEventCount:articleDislikedEventCount:articleSharedEventCount:articleSavedEventCount:feedViewEventCount:tagFollowedEventCount:tagUnfollowedEventCount:tagMutedEventCount:", -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleSeenEventCount: %lld"),
    -[FCUserEventHistoryEventCounts articleSeenEventCount](self, "articleSeenEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleVisitedEventCount: %lld"),
    -[FCUserEventHistoryEventCounts articleVisitedEventCount](self, "articleVisitedEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleReadEventCount: %lld"),
    -[FCUserEventHistoryEventCounts articleReadEventCount](self, "articleReadEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleLikedEventCount: %lld"),
    -[FCUserEventHistoryEventCounts articleLikedEventCount](self, "articleLikedEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleDislikedEventCount: %lld"),
    -[FCUserEventHistoryEventCounts articleDislikedEventCount](self, "articleDislikedEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleSharedEventCount: %lld"),
    -[FCUserEventHistoryEventCounts articleSharedEventCount](self, "articleSharedEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleSavedEventCount: %lld"),
    -[FCUserEventHistoryEventCounts articleSavedEventCount](self, "articleSavedEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; feedViewEventCount: %lld"),
    -[FCUserEventHistoryEventCounts feedViewEventCount](self, "feedViewEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; tagFollowedEventCount: %lld"),
    -[FCUserEventHistoryEventCounts tagFollowedEventCount](self, "tagFollowedEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; tagUnfollowedEventCount: %lld"),
    -[FCUserEventHistoryEventCounts tagUnfollowedEventCount](self, "tagUnfollowedEventCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; tagMutedEventCount: %lld"),
    -[FCUserEventHistoryEventCounts tagMutedEventCount](self, "tagMutedEventCount"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)articleSeenEventCount
{
  return self->_articleSeenEventCount;
}

- (void)setArticleSeenEventCount:(int64_t)a3
{
  self->_articleSeenEventCount = a3;
}

- (int64_t)articleVisitedEventCount
{
  return self->_articleVisitedEventCount;
}

- (void)setArticleVisitedEventCount:(int64_t)a3
{
  self->_articleVisitedEventCount = a3;
}

- (int64_t)articleReadEventCount
{
  return self->_articleReadEventCount;
}

- (void)setArticleReadEventCount:(int64_t)a3
{
  self->_articleReadEventCount = a3;
}

- (int64_t)articleLikedEventCount
{
  return self->_articleLikedEventCount;
}

- (void)setArticleLikedEventCount:(int64_t)a3
{
  self->_articleLikedEventCount = a3;
}

- (int64_t)articleDislikedEventCount
{
  return self->_articleDislikedEventCount;
}

- (void)setArticleDislikedEventCount:(int64_t)a3
{
  self->_articleDislikedEventCount = a3;
}

- (int64_t)articleSharedEventCount
{
  return self->_articleSharedEventCount;
}

- (void)setArticleSharedEventCount:(int64_t)a3
{
  self->_articleSharedEventCount = a3;
}

- (int64_t)articleSavedEventCount
{
  return self->_articleSavedEventCount;
}

- (void)setArticleSavedEventCount:(int64_t)a3
{
  self->_articleSavedEventCount = a3;
}

- (int64_t)feedViewEventCount
{
  return self->_feedViewEventCount;
}

- (void)setFeedViewEventCount:(int64_t)a3
{
  self->_feedViewEventCount = a3;
}

- (int64_t)tagFollowedEventCount
{
  return self->_tagFollowedEventCount;
}

- (void)setTagFollowedEventCount:(int64_t)a3
{
  self->_tagFollowedEventCount = a3;
}

- (int64_t)tagUnfollowedEventCount
{
  return self->_tagUnfollowedEventCount;
}

- (void)setTagUnfollowedEventCount:(int64_t)a3
{
  self->_tagUnfollowedEventCount = a3;
}

- (int64_t)tagMutedEventCount
{
  return self->_tagMutedEventCount;
}

- (void)setTagMutedEventCount:(int64_t)a3
{
  self->_tagMutedEventCount = a3;
}

@end
