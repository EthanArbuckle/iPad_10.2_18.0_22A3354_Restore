@implementation MPCSharedListeningQueueEventContentUpdatedMessage

- (MPCSharedListeningQueueEventContentUpdatedMessage)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4
{
  id v7;
  id v8;
  MPCSharedListeningQueueEventContentUpdatedMessage *v9;
  MPCSharedListeningQueueEventContentUpdatedMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCSharedListeningQueueEventContentUpdatedMessage;
  v9 = -[MPCSharedListeningQueueEventContentUpdatedMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedTitle, a3);
    objc_storeStrong((id *)&v10->_localizedMessage, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEventContentUpdatedMessage: %p localizedTitle=\"%@\" localizedMessage=\"%@\">"), self, self->_localizedTitle, self->_localizedMessage);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
