@implementation BMDistributedContextTranslatedEventMessage

- (BMDistributedContextTranslatedEventMessage)initWithStreamIdentifier:(id)a3 eventData:(id)a4 eventDataVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMDistributedContextTranslatedEventMessage *v12;
  BMDistributedContextTranslatedEventMessage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMDistributedContextTranslatedEventMessage;
  v12 = -[BMDistributedContextTranslatedEventMessage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_streamIdentifier, a3);
    objc_storeStrong((id *)&v13->_eventData, a4);
    objc_storeStrong((id *)&v13->_eventDataVersion, a5);
  }

  return v13;
}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (void)setStreamIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_streamIdentifier, a3);
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (NSNumber)eventDataVersion
{
  return self->_eventDataVersion;
}

- (void)setEventDataVersion:(id)a3
{
  objc_storeStrong((id *)&self->_eventDataVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDataVersion, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

@end
