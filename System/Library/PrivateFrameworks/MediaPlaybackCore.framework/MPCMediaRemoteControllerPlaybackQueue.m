@implementation MPCMediaRemoteControllerPlaybackQueue

- (MPCMediaRemoteControllerPlaybackQueue)initWithIdentifiers:(id)a3 playingIdentifier:(id)a4 queueIdentifier:(id)a5 queueProperties:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MPCMediaRemoteControllerPlaybackQueue *v14;
  uint64_t v15;
  NSArray *identifiers;
  uint64_t v17;
  NSString *playingIdentifier;
  uint64_t v19;
  NSString *queueIdentifier;
  uint64_t v21;
  NSDictionary *queueProperties;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MPCMediaRemoteControllerPlaybackQueue;
  v14 = -[MPCMediaRemoteControllerPlaybackQueue init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifiers = v14->_identifiers;
    v14->_identifiers = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    playingIdentifier = v14->_playingIdentifier;
    v14->_playingIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    queueIdentifier = v14->_queueIdentifier;
    v14->_queueIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    queueProperties = v14->_queueProperties;
    v14->_queueProperties = (NSDictionary *)v21;

  }
  return v14;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSString)playingIdentifier
{
  return self->_playingIdentifier;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSDictionary)queueProperties
{
  return self->_queueProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueProperties, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_playingIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
