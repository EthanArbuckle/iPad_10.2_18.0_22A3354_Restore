@implementation OSActivityLossEvent

- (OSActivityLossEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  OSActivityLossEvent *v4;
  OSActivityLossEvent *v5;
  unint64_t var11;
  unsigned int var12;
  BOOL v8;
  const char *v9;
  objc_super v11;
  char __str[256];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)OSActivityLossEvent;
  v4 = -[OSActivityLossEvent init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_startMachTimestamp = a3->var8.var3.var10;
    var11 = a3->var8.var2.var11;
    v4->_endMachTimestamp = var11;
    var12 = a3->var8.var9.var12;
    v4->_count = var12;
    v8 = a3->var8.var9.var12 == 63;
    v4->_saturated = v8;
    v9 = (const char *)&_CTF_NULLSTR;
    if (v8)
      v9 = ">=";
    snprintf(__str, 0x100uLL, "lost %s%u unreliable messages from %llu-%llu (Mach continuous exact start-approx. end)", v9, var12, v4->_startMachTimestamp, var11);
    -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:](v5, "fillFromStreamEntry:eventMessage:persisted:", a3, __str, 1);
  }
  return v5;
}

- (void)_addProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OSActivityLossEvent;
  v4 = a3;
  -[OSActivityEvent _addProperties:](&v9, sel__addProperties_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityLossEvent startMachTimestamp](self, "startMachTimestamp", v9.receiver, v9.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("startMachTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityLossEvent endMachTimestamp](self, "endMachTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("endMachTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[OSActivityLossEvent count](self, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[OSActivityLossEvent saturated](self, "saturated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("saturated"));

}

- (unint64_t)startMachTimestamp
{
  return self->_startMachTimestamp;
}

- (unint64_t)endMachTimestamp
{
  return self->_endMachTimestamp;
}

- (unsigned)count
{
  return self->_count;
}

- (BOOL)saturated
{
  return self->_saturated;
}

@end
