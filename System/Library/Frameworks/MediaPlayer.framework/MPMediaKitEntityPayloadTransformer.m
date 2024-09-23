@implementation MPMediaKitEntityPayloadTransformer

- (MPMediaKitEntityPayloadTransformer)initWithType:(id)a3 transformedType:(id)a4
{
  id v8;
  id v9;
  MPMediaKitEntityPayloadTransformer *v10;
  MPMediaKitEntityPayloadTransformer *v11;
  uint64_t v12;
  NSMutableDictionary *attributes;
  uint64_t v14;
  NSMutableDictionary *meta;
  uint64_t v16;
  NSMutableDictionary *relationships;
  void *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaKitEntityTranslator.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  }
  v20.receiver = self;
  v20.super_class = (Class)MPMediaKitEntityPayloadTransformer;
  v10 = -[MPMediaKitEntityPayloadTransformer init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_type, a3);
    objc_storeStrong((id *)&v11->_transformedType, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    attributes = v11->_attributes;
    v11->_attributes = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    meta = v11->_meta;
    v11->_meta = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    relationships = v11->_relationships;
    v11->_relationships = (NSMutableDictionary *)v16;

  }
  return v11;
}

- (NSDictionary)transformedPayload
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("id"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_type, CFSTR("type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_transformedType, CFSTR("_MPMKT_transformedType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_attributes, CFSTR("attributes"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_meta, CFSTR("meta"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_relationships, CFSTR("relationships"));
  return (NSDictionary *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)type
{
  return self->_type;
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (NSMutableDictionary)meta
{
  return self->_meta;
}

- (NSString)transformedType
{
  return self->_transformedType;
}

- (NSMutableDictionary)relationships
{
  return self->_relationships;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_transformedType, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
