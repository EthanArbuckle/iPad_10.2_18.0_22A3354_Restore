@implementation MFMessageTransferResult

- (MFMessageTransferResult)initWithResultCode:(unint64_t)a3 failedMessages:(id)a4 transferedMessage:(id)a5
{
  MFMessageTransferResult *v8;
  MFMessageTransferResult *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFMessageTransferResult;
  v8 = -[MFMessageTransferResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_resultCode = a3;
    v8->_failedMessages = (NSArray *)objc_msgSend(a4, "copy");
    v9->_transferedMessages = (NSArray *)objc_msgSend(a5, "copy");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageTransferResult;
  -[MFMessageTransferResult dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  unint64_t v3;
  __CFString *v4;

  v3 = -[MFMessageTransferResult resultCode](self, "resultCode");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_1E81CA620[v3];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p (\n\tresult:%@\n\ttransfered:%@\n\tfailed:%@)>"), objc_opt_class(), self, v4, -[MFMessageTransferResult transferedMessages](self, "transferedMessages"), -[MFMessageTransferResult failedMessages](self, "failedMessages"));
}

- (unint64_t)resultCode
{
  return self->_resultCode;
}

- (NSArray)failedMessages
{
  return self->_failedMessages;
}

- (NSArray)transferedMessages
{
  return self->_transferedMessages;
}

@end
