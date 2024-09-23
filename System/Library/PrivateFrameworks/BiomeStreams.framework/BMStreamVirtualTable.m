@implementation BMStreamVirtualTable

- (BMStreamVirtualTable)initWithStream:(id)a3
{
  return -[BMStreamVirtualTable initWithStream:useCase:](self, "initWithStream:useCase:", a3, *MEMORY[0x1E0D01C98]);
}

- (BMStreamVirtualTable)initWithStream:(id)a3 useCase:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  BMStreamVirtualTable *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "schema");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__BMStreamVirtualTable_initWithStream_useCase___block_invoke;
  v14[3] = &unk_1E2648E88;
  v10 = v7;
  v15 = v10;
  v11 = v8;
  v16 = v11;
  v12 = -[BMStreamVirtualTable initWithSchema:publisherBlockWithOptions:acceptPublisherOptions:](self, "initWithSchema:publisherBlockWithOptions:acceptPublisherOptions:", v9, v14, 1);

  if (v12)
    objc_storeStrong((id *)&v12->_stream, a3);

  return v12;
}

uint64_t __47__BMStreamVirtualTable_initWithStream_useCase___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "publisherWithUseCase:options:", *(_QWORD *)(a1 + 40), a2);
}

- (BMStreamVirtualTable)initWithSchema:(id)a3 publisherBlock:(id)a4
{
  id v6;
  id v7;
  BMStreamVirtualTable *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__BMStreamVirtualTable_initWithSchema_publisherBlock___block_invoke;
  v10[3] = &unk_1E2648EB0;
  v11 = v6;
  v7 = v6;
  v8 = -[BMStreamVirtualTable initWithSchema:publisherBlockWithOptions:acceptPublisherOptions:](self, "initWithSchema:publisherBlockWithOptions:acceptPublisherOptions:", a3, v10, 0);

  return v8;
}

uint64_t __54__BMStreamVirtualTable_initWithSchema_publisherBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BMStreamVirtualTable)initWithSchema:(id)a3 publisherBlockWithOptions:(id)a4 acceptPublisherOptions:(BOOL)a5
{
  id v9;
  id v10;
  BMStreamVirtualTable *v11;
  BMStreamVirtualTable *v12;
  uint64_t v13;
  id publisherBlock;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMStreamVirtualTable;
  v11 = -[BMStreamVirtualTable init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_schema, a3);
    v13 = objc_msgSend(v10, "copy");
    publisherBlock = v12->_publisherBlock;
    v12->_publisherBlock = (id)v13;

    v12->_acceptPublisherOptions = a5;
  }

  return v12;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[BMSQLSchema tableName](self->_schema, "tableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> table: %@"), v4, self, v5);

  return v6;
}

- (BMStreamBase)stream
{
  return self->_stream;
}

- (BOOL)acceptPublisherOptions
{
  return self->_acceptPublisherOptions;
}

- (BMSQLSchema)schema
{
  return self->_schema;
}

- (id)publisherBlock
{
  return self->_publisherBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_publisherBlock, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
