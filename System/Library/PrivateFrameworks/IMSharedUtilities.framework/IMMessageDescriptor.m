@implementation IMMessageDescriptor

- (IMMessageDescriptor)initWithMessageBody:(id)a3 messageGUID:(id)a4
{
  id v6;
  id v7;
  IMMessageDescriptor *v8;
  uint64_t v9;
  NSAttributedString *messageBody;
  uint64_t v11;
  NSString *messageGUID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMMessageDescriptor;
  v8 = -[IMMessageDescriptor init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    messageBody = v8->_messageBody;
    v8->_messageBody = (NSAttributedString *)v9;

    v11 = objc_msgSend(v7, "copy");
    messageGUID = v8->_messageGUID;
    v8->_messageGUID = (NSString *)v11;

  }
  return v8;
}

- (NSArray)messageParts
{
  NSArray *messageParts;
  void *v4;
  NSAttributedString *messageBody;
  id v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v10[4];
  id v11;

  messageParts = self->_messageParts;
  if (!messageParts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    messageBody = self->_messageBody;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_19E2E8BA0;
    v10[3] = &unk_1E3FB5510;
    v11 = v4;
    v6 = v4;
    -[NSAttributedString __im_visitMessageParts:](messageBody, "__im_visitMessageParts:", v10);
    v7 = (NSArray *)objc_msgSend(v6, "copy");
    v8 = self->_messageParts;
    self->_messageParts = v7;

    messageParts = self->_messageParts;
  }
  return messageParts;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (NSAttributedString)messageBody
{
  return self->_messageBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_messageParts, 0);
}

@end
