@implementation BMDSLTableMap

- (BMDSLTableMap)initWithUpstream:(id)a3 transform:(id)a4 schema:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  uint64_t v7;
  id v13;
  id v14;
  id v15;
  BMDSLTableMap *v16;
  BMDSLTableMap *v17;
  objc_super v19;

  v7 = *(_QWORD *)&a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMDSLTableMap;
  v16 = -[BMDSLBaseCodable initWithName:version:](&v19, sel_initWithName_version_, a6, v7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_upstream, a3);
    objc_storeStrong((id *)&v17->_transform, a4);
    objc_storeStrong((id *)&v17->_schema, a5);
  }

  return v17;
}

- (BMDSLTableMap)initWithUpstream:(id)a3 transform:(id)a4 schema:(id)a5
{
  return -[BMDSLTableMap initWithUpstream:transform:schema:name:version:](self, "initWithUpstream:transform:schema:name:version:", a3, a4, a5, CFSTR("tableMap"), 1);
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
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMDSLTableMap;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[BMDSLTableMap upstream](self, "upstream", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x1E0D01BD8]);

  -[BMDSLTableMap transform](self, "transform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("transform"));

  -[BMDSLTableMap schema](self, "schema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("schema"));

}

- (BMDSLTableMap)initWithCoder:(id)a3
{
  id v4;
  BMDSLTableMap *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLTableMap;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x1E0D01BD8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("transform"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLBaseCodable name](v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLTableMap initWithUpstream:transform:schema:name:version:](v5, "initWithUpstream:transform:schema:name:version:", v7, v9, v10, v11, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (id)upstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMDSLTableMap upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bpsPublisher
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[BMDSLTableMap upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bpsPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__BMDSLTableMap_bpsPublisher__block_invoke;
  v7[3] = &unk_1E2648270;
  v7[4] = self;
  objc_msgSend(v4, "mapWithTransform:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __29__BMDSLTableMap_bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v5 = v3;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
          objc_msgSend(*(id *)(a1 + 32), "transform");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "rowFromInput:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }
    v13 = objc_alloc(MEMORY[0x1E0D01C00]);
    v14 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(*(id *)(a1 + 32), "schema");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithRows:schema:", v14, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "transform");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rowFromInput:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0D01C00]);
    v24 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "schema");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v18, "initWithRows:schema:", v5, v14);
  }

  return v16;
}

- (id)select:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  BMDSLTableStream *v8;

  v4 = (objc_class *)MEMORY[0x1E0D01BF8];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithChildren:columnNames:", MEMORY[0x1E0C9AA60], v5);

  v8 = -[BMDSLTableStream initWithUpstream:expression:]([BMDSLTableStream alloc], "initWithUpstream:expression:", self, v7);
  return v8;
}

- (BMDSLRowTransform)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
  objc_storeStrong((id *)&self->_transform, a3);
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void)setUpstream:(id)a3
{
  objc_storeStrong((id *)&self->_upstream, a3);
}

- (BMTableSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_transform, 0);
}

@end
