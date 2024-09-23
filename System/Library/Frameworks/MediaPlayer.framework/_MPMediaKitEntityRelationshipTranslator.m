@implementation _MPMediaKitEntityRelationshipTranslator

- (_MPMediaKitEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3 mediaKitType:(id)a4 payloadTransformBlock:(id)a5
{
  id v9;
  id v10;
  _MPMediaKitEntityRelationshipTranslator *v11;
  _MPMediaKitEntityRelationshipTranslator *v12;
  uint64_t v13;
  id payloadTransformBlock;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_MPMediaKitEntityRelationshipTranslator;
  v11 = -[_MPKeyPathEntityRelationshipTranslator initWithRelatedMPModelClass:](&v16, sel_initWithRelatedMPModelClass_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaKitType, a4);
    v13 = MEMORY[0x19403A810](v10);
    payloadTransformBlock = v12->_payloadTransformBlock;
    v12->_payloadTransformBlock = (id)v13;

  }
  return v12;
}

- (id)prepareSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MPMediaKitEntityPayloadTransformer *v17;
  NSString *mediaKitType;
  void *v19;
  MPMediaKitEntityPayloadTransformer *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relationships"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", self->_mediaKitType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") != 1)
    goto LABEL_4;
  objc_msgSend(v10, "firstObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_4;
  v12 = (void *)v11;
  +[MPBaseEntityTranslator translatorForMPModelClass:](MPMediaKitEntityTranslator, "translatorForMPModelClass:", -[_MPKeyPathEntityRelationshipTranslator relatedMPModelClass](self, "relatedMPModelClass"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifiersForPayload:context:", v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relationshipPayloadProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "payloadForRelatedEntityWithIdentifierSet:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_4:
    v17 = [MPMediaKitEntityPayloadTransformer alloc];
    mediaKitType = self->_mediaKitType;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_MPMKT_transformedType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = -[MPMediaKitEntityPayloadTransformer initWithType:transformedType:](v17, "initWithType:transformedType:", mediaKitType, v19);
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[MPMediaKitEntityPayloadTransformer initWithType:transformedType:](v17, "initWithType:transformedType:", mediaKitType, v21);

    }
    (*((void (**)(void))self->_payloadTransformBlock + 2))();
    -[MPMediaKitEntityPayloadTransformer transformedPayload](v20, "transformedPayload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (NSString)mediaKitType
{
  return self->_mediaKitType;
}

- (void)setMediaKitType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)payloadTransformBlock
{
  return self->_payloadTransformBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payloadTransformBlock, 0);
  objc_storeStrong((id *)&self->_mediaKitType, 0);
}

@end
