@implementation BPSMulticastDownstream

- (id)nextEvent
{
  void *v3;
  void *v4;

  -[BPSMulticastDownstream multicast](self, "multicast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEventForMulticastDownstream:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)completed
{
  BPSMulticastDownstream *v2;
  void *v3;

  v2 = self;
  -[BPSMulticastDownstream multicast](self, "multicast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "completedForMulticastDownstream:", v2);

  return (char)v2;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSMulticastDownstream multicast](self, "multicast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BPSMulticast)multicast
{
  return self->_multicast;
}

- (BPSSubscriber)subscriber
{
  return self->_subscriber;
}

- (id)startWithSubscriber:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[BPSMulticastDownstream setSubscriber:](self, "setSubscriber:", v4);
  v7.receiver = self;
  v7.super_class = (Class)BPSMulticastDownstream;
  -[BPSPublisher startWithSubscriber:](&v7, sel_startWithSubscriber_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_subscriber, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)reset
{
  objc_super v3;

  -[BPSMulticastDownstream setSubscriber:](self, "setSubscriber:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BPSMulticastDownstream;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (BPSMulticastDownstream)initWithMulticast:(id)a3
{
  id v5;
  BPSMulticastDownstream *v6;
  BPSMulticastDownstream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSMulticastDownstream;
  v6 = -[BPSMulticastDownstream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_multicast, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_multicast, 0);
}

@end
