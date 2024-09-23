@implementation MPCSharedListeningEvent

- (id)_initWithType:(int64_t)a3 participant:(id)a4
{
  id v6;
  MPCSharedListeningEvent *v7;
  MPCSharedListeningEvent *v8;
  uint64_t v9;
  MPCSharedListeningEventParticipant *participant;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCSharedListeningEvent;
  v7 = -[MPCSharedListeningEvent init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    participant = v8->_participant;
    v8->_participant = (MPCSharedListeningEventParticipant *)v9;

  }
  return v8;
}

- (id)description
{
  int64_t type;
  uint64_t v4;
  uint64_t v5;

  type = self->_type;
  switch(type)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningEvent: %p unknown/invalid>"), self, v4, v5);
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningEvent: %p participant=%@ sessionEvent=%@>"), self, self->_participant, self->_sessionEvent);
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningEvent: %p participant=%@ playbackEvent=%@>"), self, self->_participant, self->_playbackEvent);
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningEvent: %p participant=%@ queueEvent=%@>"), self, self->_participant, self->_queueEvent);
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningEvent: %p participant=%@ reactionEvent=%@>"), self, self->_participant, self->_reactionEvent);
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningEvent: %p participant=%@ customEvent=%@>"), self, self->_participant, self->_customEvent);
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningEvent: %p unknown/eventType=%ld>"), self, type, v5);
      break;
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPCSharedListeningEventParticipant)participant
{
  return self->_participant;
}

- (int64_t)type
{
  return self->_type;
}

- (MPCSharedListeningSessionEvent)sessionEvent
{
  return self->_sessionEvent;
}

- (MPCSharedListeningPlaybackEvent)playbackEvent
{
  return self->_playbackEvent;
}

- (MPCSharedListeningQueueEvent)queueEvent
{
  return self->_queueEvent;
}

- (MPCSharedListeningReactionEvent)reactionEvent
{
  return self->_reactionEvent;
}

- (MPCSharedListeningCustomEvent)customEvent
{
  return self->_customEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customEvent, 0);
  objc_storeStrong((id *)&self->_reactionEvent, 0);
  objc_storeStrong((id *)&self->_queueEvent, 0);
  objc_storeStrong((id *)&self->_playbackEvent, 0);
  objc_storeStrong((id *)&self->_sessionEvent, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

+ (id)eventWithSessionEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[MPCSharedListeningEvent _initWithType:participant:]([MPCSharedListeningEvent alloc], "_initWithType:participant:", 1, v6);

  v8 = (void *)v7[3];
  v7[3] = v5;

  return v7;
}

+ (id)eventWithPlaybackEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[MPCSharedListeningEvent _initWithType:participant:]([MPCSharedListeningEvent alloc], "_initWithType:participant:", 2, v6);

  v8 = (void *)v7[4];
  v7[4] = v5;

  return v7;
}

+ (id)eventWithQueueEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[MPCSharedListeningEvent _initWithType:participant:]([MPCSharedListeningEvent alloc], "_initWithType:participant:", 3, v6);

  v8 = (void *)v7[5];
  v7[5] = v5;

  return v7;
}

+ (id)eventWithReactionEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[MPCSharedListeningEvent _initWithType:participant:]([MPCSharedListeningEvent alloc], "_initWithType:participant:", 4, v6);

  v8 = (void *)v7[6];
  v7[6] = v5;

  return v7;
}

+ (id)eventWithCustomEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[MPCSharedListeningEvent _initWithType:participant:]([MPCSharedListeningEvent alloc], "_initWithType:participant:", 5, v6);

  v8 = (void *)v7[7];
  v7[7] = v5;

  return v7;
}

@end
