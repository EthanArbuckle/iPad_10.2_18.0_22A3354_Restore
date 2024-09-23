@implementation BMCoreDuetStream

- (BMCoreDuetStream)initWithKnowledgeStore:(id)a3 clientContext:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMCoreDuetStream *v12;
  BMCoreDuetStream *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMCoreDuetStream;
  v12 = -[BMCoreDuetStream init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

- (id)publisherForQuery:(id)a3
{
  id v4;
  BMKnowledgeContextPublisher *v5;
  void *v6;
  void *v7;
  BMKnowledgeContextPublisher *v8;

  v4 = a3;
  v5 = [BMKnowledgeContextPublisher alloc];
  -[BMCoreDuetStream store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMCoreDuetStream context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMKnowledgeContextPublisher initWithQuery:store:context:includeLiveEvents:](v5, "initWithQuery:store:context:includeLiveEvents:", v4, v6, v7, 0);

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_DKEventQuery)query
{
  return self->_query;
}

- (_DKKnowledgeQuerying)store
{
  return self->_store;
}

- (_CDUserContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
