@implementation FCFeedPersonalizingSession

- (FCDateRange)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_dateRange, a3);
}

- (unint64_t)fixedArticleCount
{
  return self->_fixedArticleCount;
}

- (void)setFixedArticleCount:(unint64_t)a3
{
  self->_fixedArticleCount = a3;
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (void)setFeedType:(int64_t)a3
{
  self->_feedType = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
}

@end
