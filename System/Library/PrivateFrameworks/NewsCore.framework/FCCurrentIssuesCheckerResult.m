@implementation FCCurrentIssuesCheckerResult

- (NSArray)followedIssues
{
  return self->_followedIssues;
}

- (void)setFollowedIssues:(id)a3
{
  objc_storeStrong((id *)&self->_followedIssues, a3);
}

- (NSArray)unreadFollowedIssues
{
  return self->_unreadFollowedIssues;
}

- (void)setUnreadFollowedIssues:(id)a3
{
  objc_storeStrong((id *)&self->_unreadFollowedIssues, a3);
}

- (NSArray)autoFavoriteIssues
{
  return self->_autoFavoriteIssues;
}

- (void)setAutoFavoriteIssues:(id)a3
{
  objc_storeStrong((id *)&self->_autoFavoriteIssues, a3);
}

- (NSArray)unbadgedIssues
{
  return self->_unbadgedIssues;
}

- (void)setUnbadgedIssues:(id)a3
{
  objc_storeStrong((id *)&self->_unbadgedIssues, a3);
}

- (NSArray)seenIssues
{
  return self->_seenIssues;
}

- (void)setSeenIssues:(id)a3
{
  objc_storeStrong((id *)&self->_seenIssues, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_seenIssues, 0);
  objc_storeStrong((id *)&self->_unbadgedIssues, 0);
  objc_storeStrong((id *)&self->_autoFavoriteIssues, 0);
  objc_storeStrong((id *)&self->_unreadFollowedIssues, 0);
  objc_storeStrong((id *)&self->_followedIssues, 0);
}

@end
