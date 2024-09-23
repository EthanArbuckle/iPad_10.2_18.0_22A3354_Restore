@implementation IMReportSpamChatItem

- (id)_initWithItem:(id)a3 wasReportedAsSpam:(BOOL)a4 isGroup:(BOOL)a5 hasMultipleMessages:(BOOL)a6 showReportSMSSpam:(BOOL)a7 isBusinessChat:(BOOL)a8
{
  _BYTE *v13;
  _BYTE *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)IMReportSpamChatItem;
  v13 = -[IMChatItem _initWithItem:](&v16, sel__initWithItem_, a3);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "_setGUID:", CFSTR("rs:"));
    v14[56] = a4;
    v14[57] = a5;
    v14[58] = a6;
    v14[59] = a7;
    v14[60] = a8;
  }
  return v14;
}

- (BOOL)wasReportedAsSpam
{
  return self->_wasReportedAsSpam;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (BOOL)hasMultipleMessages
{
  return self->_hasMultipleMessages;
}

- (BOOL)showReportSMSSpam
{
  return self->_showReportSMSSpam;
}

- (BOOL)isBusinessChat
{
  return self->_isBusinessChat;
}

@end
