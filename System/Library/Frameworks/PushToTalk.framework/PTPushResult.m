@implementation PTPushResult

- (id)_initWithResultType:(int64_t)a3 participant:(id)a4
{
  id v7;
  PTPushResult *v8;
  PTPushResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PTPushResult;
  v8 = -[PTPushResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_participant, a4);
  }

  return v9;
}

+ (PTPushResult)leaveChannelPushResult
{
  return (PTPushResult *)-[PTPushResult _initWithResultType:participant:]([PTPushResult alloc], "_initWithResultType:participant:", 1, 0);
}

+ (PTPushResult)pushResultForActiveRemoteParticipant:(PTParticipant *)participant
{
  PTParticipant *v3;
  id v4;

  v3 = participant;
  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s: parameter '%@' cannot be nil"), "+[PTPushResult pushResultForActiveRemoteParticipant:]", CFSTR("participant"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("participant must be a kind of PTParticipant"));
  v4 = -[PTPushResult _initWithResultType:participant:]([PTPushResult alloc], "_initWithResultType:participant:", 2, v3);

  return (PTPushResult *)v4;
}

+ (PTPushResult)serviceUpdatePushResult
{
  return (PTPushResult *)-[PTPushResult _initWithResultType:participant:]([PTPushResult alloc], "_initWithResultType:participant:", 4, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (PTParticipant)participant
{
  return self->_participant;
}

- (void)setParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_participant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
}

@end
