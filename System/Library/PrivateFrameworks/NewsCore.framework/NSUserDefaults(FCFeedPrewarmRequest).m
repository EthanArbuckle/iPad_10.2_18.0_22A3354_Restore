@implementation NSUserDefaults(FCFeedPrewarmRequest)

- (uint64_t)fc_lastKnownFeedIDs
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("my_articles_last_known_feed_ids"));
}

- (uint64_t)setFc_lastKnownFeedIDs:()FCFeedPrewarmRequest
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("my_articles_last_known_feed_ids"));
}

@end
