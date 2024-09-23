@implementation IRReplayEventsContainerDO

- (IRReplayEventsContainerDO)initWithReplayEvents:(id)a3
{
  id v5;
  IRReplayEventsContainerDO *v6;
  IRReplayEventsContainerDO *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRReplayEventsContainerDO;
  v6 = -[IRReplayEventsContainerDO init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_replayEvents, a3);

  return v7;
}

+ (id)replayEventsContainerDOWithReplayEvents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReplayEvents:", v4);

  return v5;
}

- (id)copyWithReplacementReplayEvents:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReplayEvents:", v3);

  return v4;
}

- (BOOL)isEqualToReplayEventsContainerDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSSet *replayEvents;
  void *v10;
  char v11;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (v6 = self->_replayEvents != 0,
        objc_msgSend(v4, "replayEvents"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = v7 == 0,
        v7,
        v6 == v8))
  {
    v11 = 0;
  }
  else
  {
    replayEvents = self->_replayEvents;
    if (replayEvents)
    {
      objc_msgSend(v5, "replayEvents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSSet isEqual:](replayEvents, "isEqual:", v10);

    }
    else
    {
      v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  IRReplayEventsContainerDO *v4;
  IRReplayEventsContainerDO *v5;
  BOOL v6;

  v4 = (IRReplayEventsContainerDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRReplayEventsContainerDO isEqualToReplayEventsContainerDO:](self, "isEqualToReplayEventsContainerDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_replayEvents, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRReplayEventsContainerDO)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  IRReplayEventsContainerDO *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF20]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("replayEvents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || (objc_msgSend(v4, "error"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    self = -[IRReplayEventsContainerDO initWithReplayEvents:](self, "initWithReplayEvents:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *replayEvents;

  replayEvents = self->_replayEvents;
  if (replayEvents)
    objc_msgSend(a3, "encodeObject:forKey:", replayEvents, CFSTR("replayEvents"));
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRReplayEventsContainerDO | replayEvents:%@>"), self->_replayEvents);
}

- (NSSet)replayEvents
{
  return self->_replayEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayEvents, 0);
}

@end
