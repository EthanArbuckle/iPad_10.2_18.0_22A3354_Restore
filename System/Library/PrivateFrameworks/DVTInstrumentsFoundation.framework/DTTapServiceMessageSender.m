@implementation DTTapServiceMessageSender

- (DTTapServiceMessageSender)initWithChannel:(id)a3
{
  id v5;
  DTTapServiceMessageSender *v6;
  DTTapServiceMessageSender *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTTapServiceMessageSender;
  v6 = -[DTTapServiceMessageSender init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_channel, a3);

  return v7;
}

- (void)sendMessage:(id)a3
{
  -[DTXChannel sendMessage:replyHandler:](self->_channel, "sendMessage:replyHandler:", a3, 0);
}

- (void)sendBarrierMessage
{
  -[DTXChannel sendMessageSync:replyHandler:](self->_channel, "sendMessageSync:replyHandler:", *MEMORY[0x24BE2A980], &unk_24EB276F0);
}

- (DTXChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
