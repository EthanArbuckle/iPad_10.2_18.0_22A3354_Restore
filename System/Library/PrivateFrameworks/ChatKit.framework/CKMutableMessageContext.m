@implementation CKMutableMessageContext

- (void)setServiceName:(id)a3
{
  NSString *v4;
  NSString *serviceName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  serviceName = self->super._serviceName;
  self->super._serviceName = v4;

}

- (void)setChatContext:(id)a3
{
  IMChatContext *v4;
  IMChatContext *chatContext;

  v4 = (IMChatContext *)objc_msgSend(a3, "copy");
  chatContext = self->super._chatContext;
  self->super._chatContext = v4;

}

- (void)setAudioMessage:(BOOL)a3
{
  self->super._audioMessage = a3;
}

- (void)setSpam:(BOOL)a3
{
  self->super._spam = a3;
}

- (void)setSenderUnknown:(BOOL)a3
{
  self->super._senderUnknown = a3;
}

- (void)setFromMe:(BOOL)a3
{
  self->super._fromMe = a3;
  if (a3)
  {
    *(_WORD *)&self->super._spam = 0;
    self->super._senderUnauthenticated = 0;
  }
}

- (void)setSenderUnauthenticated:(BOOL)a3
{
  self->super._senderUnauthenticated = a3;
}

@end
