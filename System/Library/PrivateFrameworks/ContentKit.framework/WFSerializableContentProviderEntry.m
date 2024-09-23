@implementation WFSerializableContentProviderEntry

- (WFSerializableContentProviderEntry)initWithSerializedRepresentationBlock:(id)a3 deserializationBlock:(id)a4
{
  id v6;
  id v7;
  WFSerializableContentProviderEntry *v8;
  uint64_t v9;
  id serializationBlock;
  uint64_t v11;
  id deserializationBlock;
  WFSerializableContentProviderEntry *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFSerializableContentProviderEntry;
  v8 = -[WFSerializableContentProviderEntry init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    serializationBlock = v8->_serializationBlock;
    v8->_serializationBlock = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    deserializationBlock = v8->_deserializationBlock;
    v8->_deserializationBlock = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (id)serializationBlock
{
  return self->_serializationBlock;
}

- (id)deserializationBlock
{
  return self->_deserializationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deserializationBlock, 0);
  objc_storeStrong(&self->_serializationBlock, 0);
}

@end
