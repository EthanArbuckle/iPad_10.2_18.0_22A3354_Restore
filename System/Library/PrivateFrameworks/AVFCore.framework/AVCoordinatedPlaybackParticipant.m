@implementation AVCoordinatedPlaybackParticipant

- (AVCoordinatedPlaybackParticipant)initWithParticipantIdentifier:(id)a3 readyToPlay:(BOOL)a4 suspensionReasons:(id)a5
{
  AVCoordinatedPlaybackParticipant *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVCoordinatedPlaybackParticipant;
  v8 = -[AVCoordinatedPlaybackParticipant init](&v10, sel_init);
  if (v8)
  {
    v8->_identifier = (NSUUID *)objc_msgSend(a3, "copy");
    v8->_suspensionReasons = (NSArray *)objc_msgSend(a5, "copy");
    v8->_readyToPlay = a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCoordinatedPlaybackParticipant;
  -[AVCoordinatedPlaybackParticipant dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int v6;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v5 = -[NSUUID isEqual:](-[AVCoordinatedPlaybackParticipant identifier](self, "identifier"), "isEqual:", objc_msgSend(a3, "identifier"));
  if (!v5)
    return v5;
  v6 = -[AVCoordinatedPlaybackParticipant isReadyToPlay](self, "isReadyToPlay");
  if (v6 == objc_msgSend(a3, "isReadyToPlay"))
    LOBYTE(v5) = AVPlaybackCoordinatorArrayContainsSameElementsAsArray((uint64_t)-[AVCoordinatedPlaybackParticipant suspensionReasons](self, "suspensionReasons"), objc_msgSend(a3, "suspensionReasons"));
  else
LABEL_6:
    LOBYTE(v5) = 0;
  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](-[AVCoordinatedPlaybackParticipant identifier](self, "identifier"), "hash");
}

- (NSArray)suspensionReasons
{
  return self->_suspensionReasons;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isReadyToPlay
{
  return self->_readyToPlay;
}

@end
