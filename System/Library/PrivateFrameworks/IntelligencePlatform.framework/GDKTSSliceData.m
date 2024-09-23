@implementation GDKTSSliceData

- (GDKTSSliceData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  GDKTSSliceData *v16;
  uint64_t v17;
  GDKTSQueryParams *parameters;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *identifier;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  GDKTSDataAggregateRepresentation *data;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  GDKTSContextRepresentationProtocol *context;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)GDKTSSliceData;
  v16 = -[GDKTSSliceData init](&v32, sel_init);
  if (v16)
  {
    v17 = objc_msgSend_copy(v13, v14, v15);
    parameters = v16->_parameters;
    v16->_parameters = (GDKTSQueryParams *)v17;

    v21 = objc_msgSend_copy(v10, v19, v20);
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v21;

    v25 = objc_msgSend_copy(v12, v23, v24);
    data = v16->_data;
    v16->_data = (GDKTSDataAggregateRepresentation *)v25;

    v29 = objc_msgSend_copy(v11, v27, v28);
    context = v16->_context;
    v16->_context = (GDKTSContextRepresentationProtocol *)v29;

  }
  return v16;
}

- (GDKTSSliceData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  GDKTSSliceData *v14;
  uint64_t v15;
  NSString *identifier;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  GDKTSDataAggregateRepresentation *data;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  GDKTSContextRepresentationProtocol *context;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)GDKTSSliceData;
  v14 = -[GDKTSSliceData init](&v26, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v9, v12, v13);
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v19 = objc_msgSend_copy(v11, v17, v18);
    data = v14->_data;
    v14->_data = (GDKTSDataAggregateRepresentation *)v19;

    v23 = objc_msgSend_copy(v10, v21, v22);
    context = v14->_context;
    v14->_context = (GDKTSContextRepresentationProtocol *)v23;

  }
  return v14;
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
  objc_msgSend_parameters(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_context(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithFormat_(v3, v16, (uint64_t)CFSTR("GDKTSSliceData<parameters: %@, identifier: %@, data: %@, context: %@>"), v6, v9, v12, v15);

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

- (GDKTSQueryParams)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
