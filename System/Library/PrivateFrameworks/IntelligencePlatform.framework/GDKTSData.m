@implementation GDKTSData

- (GDKTSData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6
{
  id v9;
  id v10;
  id v11;
  GDKTSData *v12;
  GDEntityIdentifier *v13;
  const char *v14;
  uint64_t v15;
  GDEntityIdentifier *tripEntityId;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *identifier;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  GDKTSDataAggregateRepresentation *data;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  GDKTSContextRepresentationProtocol *context;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)GDKTSData;
  v12 = -[GDKTSData init](&v30, sel_init);
  if (v12)
  {
    v13 = [GDEntityIdentifier alloc];
    v15 = objc_msgSend_initWithString_(v13, v14, (uint64_t)v9);
    tripEntityId = v12->_tripEntityId;
    v12->_tripEntityId = (GDEntityIdentifier *)v15;

    v19 = objc_msgSend_copy(v9, v17, v18);
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v19;

    v23 = objc_msgSend_copy(v11, v21, v22);
    data = v12->_data;
    v12->_data = (GDKTSDataAggregateRepresentation *)v23;

    v27 = objc_msgSend_copy(v10, v25, v26);
    context = v12->_context;
    v12->_context = (GDKTSContextRepresentationProtocol *)v27;

  }
  return v12;
}

- (NSString)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_tripEntityId(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_context(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithFormat_(v3, v16, (uint64_t)CFSTR("GDKTSData<tripEntityId: %@, identifier: %@, data: %@, context: %@>"), v6, v9, v12, v15);

  return (NSString *)v17;
}

- (GDKTSDataAggregateRepresentation)data
{
  return self->_data;
}

- (GDKTSContextRepresentationProtocol)context
{
  return self->_context;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (GDEntityIdentifier)tripEntityId
{
  return self->_tripEntityId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripEntityId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
