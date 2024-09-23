@implementation _MPStorePlatformEntityRelationshipTranslator

- (_MPStorePlatformEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3 payloadTransformBlock:(id)a4
{
  id v6;
  _MPStorePlatformEntityRelationshipTranslator *v7;
  uint64_t v8;
  id payloadTransformBlock;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MPStorePlatformEntityRelationshipTranslator;
  v7 = -[_MPKeyPathEntityRelationshipTranslator initWithRelatedMPModelClass:](&v11, sel_initWithRelatedMPModelClass_, a3);
  if (v7)
  {
    v8 = MEMORY[0x19403A810](v6);
    payloadTransformBlock = v7->_payloadTransformBlock;
    v7->_payloadTransformBlock = (id)v8;

  }
  return v7;
}

- (id)prepareSource:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_payloadTransformBlock + 2))();

  return v9;
}

- (id)payloadTransformBlock
{
  return self->_payloadTransformBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payloadTransformBlock, 0);
}

@end
