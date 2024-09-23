@implementation CRKIDSMessageFormatter

- (id)formatMessageForSending:(id)a3
{
  id v3;
  void *v4;
  CRKIDSMessagePayload *v5;
  void *v6;
  CRKIDSMessagePayload *v7;
  void *v8;

  v3 = a3;
  +[CRKIDSMessageMetadata metadataWithMessageType:](CRKIDSMessageMetadata, "metadataWithMessageType:", objc_msgSend(v3, "messageType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [CRKIDSMessagePayload alloc];
  objc_msgSend(v3, "dictionaryValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CRKIDSMessagePayload initWithMessageContent:messageMetadata:](v5, "initWithMessageContent:messageMetadata:", v6, v4);
  -[CRKIDSMessagePayload dictionaryValue](v7, "dictionaryValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
