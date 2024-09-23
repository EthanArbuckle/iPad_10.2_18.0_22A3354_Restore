@implementation IAMICStorageProvider

- (IAMPropertyStorage)propertyStorage
{
  IAMPropertyStorage *propertyStorage;
  IAMICPropertyStorage *v4;
  IAMPropertyStorage *v5;

  propertyStorage = self->_propertyStorage;
  if (!propertyStorage)
  {
    v4 = objc_alloc_init(IAMICPropertyStorage);
    v5 = self->_propertyStorage;
    self->_propertyStorage = (IAMPropertyStorage *)v4;

    propertyStorage = self->_propertyStorage;
  }
  return propertyStorage;
}

- (IAMMessageMetadataStorage)messageMetadataStorage
{
  IAMMessageMetadataStorage *messageMetadataStorage;
  IAMICMessageMetadataStorage *v4;
  IAMMessageMetadataStorage *v5;

  messageMetadataStorage = self->_messageMetadataStorage;
  if (!messageMetadataStorage)
  {
    v4 = objc_alloc_init(IAMICMessageMetadataStorage);
    v5 = self->_messageMetadataStorage;
    self->_messageMetadataStorage = (IAMMessageMetadataStorage *)v4;

    messageMetadataStorage = self->_messageMetadataStorage;
  }
  return messageMetadataStorage;
}

- (IAMMessageEntryProvider)messageEntryProvider
{
  IAMMessageEntryProvider *messageEntryProvider;
  IAMICMessageEntryProvider *v4;
  IAMMessageEntryProvider *v5;

  messageEntryProvider = self->_messageEntryProvider;
  if (!messageEntryProvider)
  {
    v4 = objc_alloc_init(IAMICMessageEntryProvider);
    v5 = self->_messageEntryProvider;
    self->_messageEntryProvider = (IAMMessageEntryProvider *)v4;

    messageEntryProvider = self->_messageEntryProvider;
  }
  return messageEntryProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyStorage, 0);
  objc_storeStrong((id *)&self->_messageMetadataStorage, 0);
  objc_storeStrong((id *)&self->_messageEntryProvider, 0);
}

@end
