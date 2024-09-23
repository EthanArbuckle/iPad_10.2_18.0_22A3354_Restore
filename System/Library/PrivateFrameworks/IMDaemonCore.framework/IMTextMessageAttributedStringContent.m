@implementation IMTextMessageAttributedStringContent

- (IMTextMessageAttributedStringContent)initWithMessageBodyWithNativeAttributes:(id)a3 fileTransferGuids:(id)a4
{
  id v6;
  id v7;
  IMTextMessageAttributedStringContent *v8;
  uint64_t v9;
  NSAttributedString *messageBodyWithNativeAttributes;
  uint64_t v11;
  NSArray *fileTransferGuids;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMTextMessageAttributedStringContent;
  v8 = -[IMTextMessageAttributedStringContent init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    messageBodyWithNativeAttributes = v8->_messageBodyWithNativeAttributes;
    v8->_messageBodyWithNativeAttributes = (NSAttributedString *)v9;

    v11 = objc_msgSend(v7, "copy");
    fileTransferGuids = v8->_fileTransferGuids;
    v8->_fileTransferGuids = (NSArray *)v11;

  }
  return v8;
}

- (NSAttributedString)messageBodyWithNativeAttributes
{
  return self->_messageBodyWithNativeAttributes;
}

- (NSArray)fileTransferGuids
{
  return self->_fileTransferGuids;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTransferGuids, 0);
  objc_storeStrong((id *)&self->_messageBodyWithNativeAttributes, 0);
}

@end
