@implementation OSActivityTransitionEvent

- (OSActivityTransitionEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  OSActivityTransitionEvent *v4;
  OSActivityTransitionEvent *v5;
  unint64_t var10;
  objc_super v8;
  char __str[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)OSActivityTransitionEvent;
  v4 = -[OSActivityTransitionEvent init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    var10 = a3->var8.var3.var10;
    v4->_transitionToActivityID = var10;
    snprintf(__str, 0x80uLL, "Transition to 0x%llx", var10 & 0xFFFFFFFFFFFFFFLL);
    -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:](v5, "fillFromStreamEntry:eventMessage:persisted:", a3, __str, 0);
  }
  return v5;
}

- (void)_addProperties:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSActivityTransitionEvent;
  v4 = a3;
  -[OSActivityEvent _addProperties:](&v6, sel__addProperties_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityTransitionEvent transitionToActivityID](self, "transitionToActivityID", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("transitionToActivityID"));

}

- (unint64_t)transitionToActivityID
{
  return self->_transitionToActivityID;
}

@end
