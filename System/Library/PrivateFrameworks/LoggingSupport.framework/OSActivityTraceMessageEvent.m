@implementation OSActivityTraceMessageEvent

- (OSActivityTraceMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  OSActivityTraceMessageEvent *v4;
  unint64_t var0;
  char *v6;
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OSActivityTraceMessageEvent;
  v4 = -[OSActivityTraceMessageEvent init](&v9, sel_init);
  if (v4)
  {
    var0 = a3->var8.var0.var0;
    v6 = os_trace_copy_formatted_message((uint64_t)&a3->var8);
    if (v6)
    {
      v7 = v6;
      -[OSActivityEvent fillFromStreamEntry:eventMessage:persisted:](v4, "fillFromStreamEntry:eventMessage:persisted:", a3, v6, 0);
      -[OSActivityEventMessage fillEventData:length:privateBuffer:length:](v4, "fillEventData:length:privateBuffer:length:", a3->var8.var2.var11, a3->var8.var2.var12, 0, 0);
      objc_storeStrong((id *)&v4->_payload, a3->var8.var4.var13);
      v4->_senderProgramCounter = a3->var8.var0.var7;
      v4->_messageType = BYTE1(var0);
      free(v7);
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
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSActivityTraceMessageEvent;
  v4 = a3;
  -[OSActivityEvent _addProperties:](&v8, sel__addProperties_, v4);
  v5 = -[OSActivityTraceMessageEvent messageType](self, "messageType", v8.receiver, v8.super_class);
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
LABEL_12:
    v6 = CFSTR("Unknown");
    goto LABEL_13;
  }
  if (v5 == 2)
  {
    v6 = CFSTR("Debug");
    goto LABEL_13;
  }
  if (v5 == 16)
  {
    v6 = CFSTR("Error");
    goto LABEL_13;
  }
  if (v5 != 17)
    goto LABEL_12;
  v6 = CFSTR("Fault");
LABEL_13:
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("messageType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[OSActivityTraceMessageEvent senderProgramCounter](self, "senderProgramCounter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("senderProgramCounter"));

}

- (OS_xpc_object)payload
{
  return self->_payload;
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
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
