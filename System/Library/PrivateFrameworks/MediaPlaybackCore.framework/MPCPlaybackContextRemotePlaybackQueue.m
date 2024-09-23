@implementation MPCPlaybackContextRemotePlaybackQueue

- (MPCPlaybackContextRemotePlaybackQueue)initWithPlaybackContext:(id)a3
{
  id v5;
  MPCPlaybackContextRemotePlaybackQueue *v6;
  MPCPlaybackContextRemotePlaybackQueue *v7;

  v5 = a3;
  v6 = -[MPCPlaybackContextRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](self, "initWithMediaRemotePlaybackQueue:options:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playbackContext, a3);

  return v7;
}

- (void)getMusicPlaybackContextWithOptions:(unint64_t)a3 completion:(id)a4
{
  (*((void (**)(id, MPPlaybackContext *, _QWORD))a4 + 2))(a4, self->_playbackContext, 0);
}

- (BOOL)isRequestingImmediatePlayback
{
  return 0;
}

- (id)privateListeningOverride
{
  return (id)-[MPPlaybackContext privateListeningOverride](self->_playbackContext, "privateListeningOverride");
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
  return (id)-[MPPlaybackContext siriAssetInfo](self->_playbackContext, "siriAssetInfo");
}

- (id)siriRecommendationIdentifier
{
  return (id)-[MPPlaybackContext siriReferenceIdentifier](self->_playbackContext, "siriReferenceIdentifier");
}

- (id)siriWHAMetricsInfo
{
  return (id)-[MPPlaybackContext siriWHAMetricsInfo](self->_playbackContext, "siriWHAMetricsInfo");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p, playbackContext=%@>"), objc_opt_class(), self, self->_playbackContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackContext, 0);
}

@end
