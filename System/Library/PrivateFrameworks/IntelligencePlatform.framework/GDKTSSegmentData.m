@implementation GDKTSSegmentData

- (GDKTSSegmentData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GDKTSSegmentData *v14;
  GDEntityIdentifier *v15;
  const char *v16;
  uint64_t v17;
  GDEntityIdentifier *segmentEntityId;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *identifier;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSString *segmentId;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  GDKTSDataRepresentation *data;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  GDKTSContextRepresentationProtocol *context;
  objc_super v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)GDKTSSegmentData;
  v14 = -[GDKTSSegmentData init](&v39, sel_init);
  if (v14)
  {
    v15 = [GDEntityIdentifier alloc];
    v17 = objc_msgSend_initWithString_(v15, v16, (uint64_t)v10);
    segmentEntityId = v14->_segmentEntityId;
    v14->_segmentEntityId = (GDEntityIdentifier *)v17;

    v21 = objc_msgSend_copy(v10, v19, v20);
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v21;

    objc_msgSend_segmentId(v13, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_copy(v25, v26, v27);
    segmentId = v14->_segmentId;
    v14->_segmentId = (NSString *)v28;

    v32 = objc_msgSend_copy(v12, v30, v31);
    data = v14->_data;
    v14->_data = (GDKTSDataRepresentation *)v32;

    v36 = objc_msgSend_copy(v11, v34, v35);
    context = v14->_context;
    v14->_context = (GDKTSContextRepresentationProtocol *)v36;

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
  objc_msgSend_segmentEntityId(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segmentId(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_context(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithFormat_(v3, v16, (uint64_t)CFSTR("GDKTSSegmentData<segmentEntityId: %@, identifier: %@, data: %@, context: %@>"), v6, v9, v12, v15);

  return (NSString *)v17;
}

- (GDKTSDataRepresentation)data
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

- (NSString)segmentId
{
  return self->_segmentId;
}

- (GDEntityIdentifier)segmentEntityId
{
  return self->_segmentEntityId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentEntityId, 0);
  objc_storeStrong((id *)&self->_segmentId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
