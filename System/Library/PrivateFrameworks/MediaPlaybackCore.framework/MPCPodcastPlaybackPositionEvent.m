@implementation MPCPodcastPlaybackPositionEvent

- (NSString)podcastAdamID
{
  return self->_podcastAdamID;
}

- (void)setPodcastAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_podcastAdamID, a3);
}

- (NSString)episodeAdamID
{
  return self->_episodeAdamID;
}

- (void)setEpisodeAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_episodeAdamID, a3);
}

- (NSString)episodeUUID
{
  return self->_episodeUUID;
}

- (void)setEpisodeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_episodeUUID, a3);
}

- (NSString)feedURL
{
  return self->_feedURL;
}

- (void)setFeedURL:(id)a3
{
  objc_storeStrong((id *)&self->_feedURL, a3);
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)position
{
  return self->_position;
}

- (void)setPosition:(double)a3
{
  self->_position = a3;
}

- (BOOL)subscribable
{
  return self->_subscribable;
}

- (void)setSubscribable:(BOOL)a3
{
  self->_subscribable = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_episodeUUID, 0);
  objc_storeStrong((id *)&self->_episodeAdamID, 0);
  objc_storeStrong((id *)&self->_podcastAdamID, 0);
}

@end
