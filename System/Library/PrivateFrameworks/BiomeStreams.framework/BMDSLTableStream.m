@implementation BMDSLTableStream

- (BMDSLTableStream)initWithUpstream:(id)a3 expression:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  BMDSLTableStream *v13;
  BMDSLTableStream *v14;
  objc_super v16;

  v6 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMDSLTableStream;
  v13 = -[BMDSLBaseCodable initWithName:version:](&v16, sel_initWithName_version_, a5, v6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_upstream, a3);
    objc_storeStrong((id *)&v14->_expression, a4);
  }

  return v14;
}

- (BMDSLTableStream)initWithUpstream:(id)a3 expression:(id)a4
{
  return -[BMDSLTableStream initWithUpstream:expression:name:version:](self, "initWithUpstream:expression:name:version:", a3, a4, CFSTR("tableStream"), 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMDSLTableStream;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[BMDSLTableStream upstream](self, "upstream", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x1E0D01BD8]);

  -[BMDSLTableStream expression](self, "expression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("queryExpression"));

}

- (BMDSLTableStream)initWithCoder:(id)a3
{
  id v4;
  BMDSLTableStream *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLTableStream;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x1E0D01BD8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("queryExpression"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLTableStream initWithUpstream:expression:name:version:](v5, "initWithUpstream:expression:name:version:", v7, v9, v10, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (id)upstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMDSLTableStream upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bpsPublisher
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[BMDSLTableStream upstream](self, "upstream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bpsPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__BMDSLTableStream_bpsPublisher__block_invoke;
  v8[3] = &unk_1E2648CC8;
  v8[4] = self;
  v8[5] = a2;
  objc_msgSend(v5, "mapWithTransform:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __32__BMDSLTableStream_bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("BMDSLTableStream.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[input isKindOfClass:[BMTable class]]"));

  }
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "expression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryTable:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)select:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BMDSLTableStream *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BMDSLTableStream expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[BMDSLTableStream expression](self, "expression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01BF8]), "initWithChildren:columnNames:", v7, v4);
  v9 = -[BMDSLTableStream initWithUpstream:expression:]([BMDSLTableStream alloc], "initWithUpstream:expression:", self, v8);

  return v9;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void)setUpstream:(id)a3
{
  objc_storeStrong((id *)&self->_upstream, a3);
}

- (BMTableQueryExpression)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
  objc_storeStrong((id *)&self->_expression, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

@end
