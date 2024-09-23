@implementation BPSOrderedMergeUpstreamState

- (id)nextEvent
{
  return self->_nextEvent;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (void)setNextEvent:(id)a3
{
  objc_storeStrong(&self->_nextEvent, a3);
}

- (BPSOrderedMergeUpstreamState)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BPSOrderedMergeUpstreamState *v9;

  v4 = (void *)MEMORY[0x1E0CB3510];
  v5 = a3;
  objc_msgSend(v4, "bm_allowedClassesForSecureCodingBMBookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("nextEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("lastReturnedEvent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BPSOrderedMergeUpstreamState initWithNextEvent:lastReturnedEvent:](self, "initWithNextEvent:lastReturnedEvent:", v7, v8);
  return v9;
}

- (BPSOrderedMergeUpstreamState)initWithNextEvent:(id)a3 lastReturnedEvent:(id)a4
{
  id v7;
  id v8;
  BPSOrderedMergeUpstreamState *v9;
  BPSOrderedMergeUpstreamState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSOrderedMergeUpstreamState;
  v9 = -[BPSOrderedMergeUpstreamState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_nextEvent, a3);
    objc_storeStrong(&v10->_lastReturnedEvent, a4);
  }

  return v10;
}

- (void)attachUpstream:(id)a3
{
  objc_storeStrong((id *)&self->_upstream, a3);
}

- (void)setLastReturnedEvent:(id)a3
{
  objc_storeStrong(&self->_lastReturnedEvent, a3);
}

- (BPSOrderedMergeUpstreamState)init
{
  return -[BPSOrderedMergeUpstreamState initWithNextEvent:lastReturnedEvent:](self, "initWithNextEvent:lastReturnedEvent:", 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastReturnedEvent, 0);
  objc_storeStrong(&self->_nextEvent, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BPSOrderedMergeUpstreamState nextEvent](self, "nextEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("nextEvent"));

  -[BPSOrderedMergeUpstreamState lastReturnedEvent](self, "lastReturnedEvent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lastReturnedEvent"));

}

- (id)lastReturnedEvent
{
  return self->_lastReturnedEvent;
}

@end
