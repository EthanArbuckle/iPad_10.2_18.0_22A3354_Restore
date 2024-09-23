@implementation IMJunkRecoveryTranscriptChatItem

- (id)_initWithItem:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMJunkRecoveryTranscriptChatItem;
  v3 = -[IMChatItem _initWithItem:](&v6, sel__initWithItem_, a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_setGUID:", CFSTR("jr:"));
  return v4;
}

- (NSDate)earliestMessageDate
{
  return self->_earliestMessageDate;
}

- (void)setEarliestMessageDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestMessageDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestMessageDate, 0);
}

@end
