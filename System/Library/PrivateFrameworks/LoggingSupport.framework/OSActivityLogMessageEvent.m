@implementation OSActivityLogMessageEvent

- (OSActivityLogMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  OSActivityLogMessageEvent *v4;
  unint64_t var0;
  char *v6;
  char *v7;
  uint64_t v8;
  NSString *category;
  uint64_t v10;
  NSString *subsystem;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OSActivityLogMessageEvent;
  v4 = -[OSActivityLogMessageEvent init](&v13, sel_init);
  if (v4)
  {
    var0 = a3->var8.var0.var0;
    v6 = os_log_copy_formatted_message((uint64_t)&a3->var8);
    if (v6)
    {
      v7 = v6;
      -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:](v4, "fillFromStreamEntry:eventMessage:persisted:", a3, v6, a3->var8.var4.var19);
      free(v7);
      -[OSActivityEventMessage fillEventData:length:privateBuffer:length:](v4, "fillEventData:length:privateBuffer:length:", a3->var8.var2.var11, a3->var8.var2.var12, a3->var8.var8.var12, a3->var8.var4.var14);
      if (a3->var8.var4.var16)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v8 = objc_claimAutoreleasedReturnValue();
        category = v4->_category;
        v4->_category = (NSString *)v8;

      }
      if (a3->var8.var4.var15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v10 = objc_claimAutoreleasedReturnValue();
        subsystem = v4->_subsystem;
        v4->_subsystem = (NSString *)v10;

      }
      v4->_senderProgramCounter = a3->var8.var0.var7;
      v4->_messageType = BYTE1(var0);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)_addProperties:(id)a3
{
  id v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSActivityLogMessageEvent;
  -[OSActivityEvent _addProperties:](&v12, sel__addProperties_, v4);
  v5 = -[OSActivityLogMessageEvent messageType](self, "messageType");
  if (v5 <= 1)
  {
    if (!v5)
    {
      v6 = CFSTR("Default");
      goto LABEL_13;
    }
    if (v5 == 1)
    {
      v6 = CFSTR("Info");
      goto LABEL_13;
    }
  }
  else
  {
    switch(v5)
    {
      case 2:
        v6 = CFSTR("Debug");
        goto LABEL_13;
      case 16:
        v6 = CFSTR("Error");
        goto LABEL_13;
      case 17:
        v6 = CFSTR("Fault");
        goto LABEL_13;
    }
  }
  v6 = CFSTR("Unknown");
LABEL_13:
  -[OSActivityLogMessageEvent subsystem](self, "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[OSActivityLogMessageEvent subsystem](self, "subsystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("subsystem"));

  }
  -[OSActivityLogMessageEvent category](self, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[OSActivityLogMessageEvent category](self, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("category"));

  }
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("messageType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[OSActivityLogMessageEvent senderProgramCounter](self, "senderProgramCounter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("senderProgramCounter"));

}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (unint64_t)senderProgramCounter
{
  return self->_senderProgramCounter;
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end
