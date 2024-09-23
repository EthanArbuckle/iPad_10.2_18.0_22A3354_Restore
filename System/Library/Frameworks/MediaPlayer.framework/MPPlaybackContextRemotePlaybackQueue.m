@implementation MPPlaybackContextRemotePlaybackQueue

- (MPPlaybackContextRemotePlaybackQueue)initWithPlaybackContext:(id)a3
{
  id v5;
  MPPlaybackContextRemotePlaybackQueue *v6;
  MPPlaybackContextRemotePlaybackQueue *v7;

  v5 = a3;
  v6 = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](self, "initWithMediaRemotePlaybackQueue:options:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playbackContext, a3);

  return v7;
}

- (id)asMusicPlaybackContextWithOptions:(unint64_t)a3 error:(id *)a4
{
  return self->_playbackContext;
}

- (BOOL)isRequestingImmediatePlayback
{
  return 0;
}

- (id)privateListeningOverride
{
  return -[MPPlaybackContext privateListeningOverride](self->_playbackContext, "privateListeningOverride");
}

- (int64_t)replaceIntent
{
  return self->_replaceIntent;
}

- (void)setReplaceIntent:(int64_t)a3
{
  self->_replaceIntent = a3;
}

- (id)siriAssetInfo
{
  return -[MPPlaybackContext siriAssetInfo](self->_playbackContext, "siriAssetInfo");
}

- (id)siriRecommendationIdentifier
{
  return -[MPPlaybackContext siriReferenceIdentifier](self->_playbackContext, "siriReferenceIdentifier");
}

- (id)siriWHAMetricsInfo
{
  return -[MPPlaybackContext siriWHAMetricsInfo](self->_playbackContext, "siriWHAMetricsInfo");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, playbackContext=%@>"), objc_opt_class(), self, self->_playbackContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackContext, 0);
}

@end
