@implementation OSActivityCreateEvent

- (OSActivityCreateEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  OSActivityCreateEvent *v4;
  OSActivityCreateEvent *v5;
  objc_super v7;

  if (a3->var8.var3.var10)
  {
    v7.receiver = self;
    v7.super_class = (Class)OSActivityCreateEvent;
    v4 = -[OSActivityCreateEvent init](&v7, sel_init);
    v5 = v4;
    if (v4)
    {
      -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:](v4, "fillFromStreamEntry:eventMessage:persisted:", a3, a3->var8.var3.var10, 0);
      v5->_creatorActivityID = a3->var8.var2.var11;
      v5->_creatorProcessUniqueID = a3->var8.var2.var12;
      v5->_senderProgramCounter = a3->var8.var0.var7;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)_addProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OSActivityCreateEvent;
  -[OSActivityEvent _addProperties:](&v7, sel__addProperties_, v4);
  objc_msgSend(v4, "setObject:forKey:", CFSTR("OSActivityCreateEvent"), CFSTR("eventType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[OSActivityCreateEvent senderProgramCounter](self, "senderProgramCounter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("senderProgramCounter"));

  if (-[OSActivityCreateEvent creatorActivityID](self, "creatorActivityID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityCreateEvent creatorActivityID](self, "creatorActivityID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("creatorActivityID"));

  }
}

- (unint64_t)creatorActivityID
{
  return self->_creatorActivityID;
}

- (unint64_t)creatorProcessUniqueID
{
  return self->_creatorProcessUniqueID;
}

- (unint64_t)senderProgramCounter
{
  return self->_senderProgramCounter;
}

@end
