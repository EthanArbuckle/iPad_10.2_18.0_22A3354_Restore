@implementation BMDSLTableAggregator

- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4 classKeyPaths:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  id v13;
  id v14;
  id v15;
  BMDSLTableAggregator *v16;
  BMDSLTableAggregator *v17;
  uint64_t v18;
  NSArray *classNames;
  uint64_t v20;
  NSArray *classKeyPaths;
  BMDSLTableAggregator *v22;
  NSObject *v23;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (a7 == 1)
  {
    v25.receiver = self;
    v25.super_class = (Class)BMDSLTableAggregator;
    v16 = -[BMDSLBaseCodable initWithName:version:](&v25, sel_initWithName_version_, a6, 1);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_transforms, a3);
      v18 = objc_msgSend(v14, "copy");
      classNames = v17->_classNames;
      v17->_classNames = (NSArray *)v18;

      v20 = objc_msgSend(v15, "copy");
      classKeyPaths = v17->_classKeyPaths;
      v17->_classKeyPaths = (NSArray *)v20;

    }
    self = v17;
    v22 = self;
  }
  else
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[BMDSLTableAggregator initWithTableTransforms:classNames:classKeyPaths:name:version:].cold.1(a7, v23);

    v22 = 0;
  }

  return v22;
}

- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4
{
  return -[BMDSLTableAggregator initWithTableTransforms:classNames:classKeyPaths:name:version:](self, "initWithTableTransforms:classNames:classKeyPaths:name:version:", a3, a4, 0, CFSTR("tableAggregator"), 1);
}

- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4 classKeyPaths:(id)a5
{
  return -[BMDSLTableAggregator initWithTableTransforms:classNames:classKeyPaths:name:version:](self, "initWithTableTransforms:classNames:classKeyPaths:name:version:", a3, a4, a5, CFSTR("tableAggregator"), 1);
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
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLTableAggregator;
  -[BMDSLBaseCodable encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[BMDSLTableAggregator transforms](self, "transforms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("transforms"));

  -[BMDSLTableAggregator classNames](self, "classNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("classNames"));

  -[BMDSLTableAggregator classKeyPaths](self, "classKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BMDSLTableAggregator classKeyPaths](self, "classKeyPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("classKeyPaths"));

  }
}

- (BMDSLTableAggregator)initWithCoder:(id)a3
{
  id v4;
  BMDSLTableAggregator *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  NSArray *classNames;
  NSArray *v15;
  void *v16;
  BMDSLTableAggregator *v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BMDSLTableAggregator;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("transforms"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("classNames"));
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("classKeyPaths"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    classNames = v5->_classNames;
    v5->_classNames = v11;
    v15 = v11;

    -[BMDSLBaseCodable name](v5, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BMDSLTableAggregator initWithTableTransforms:classNames:classKeyPaths:name:version:](v5, "initWithTableTransforms:classNames:classKeyPaths:name:version:", v9, v15, v13, v16, -[BMDSLBaseCodable version](v5, "version"));

    v5 = v17;
  }

  return v5;
}

- (id)bpsAggregator
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  -[BMDSLTableAggregator transforms](self, "transforms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[BMDSLTableAggregator classNames](self, "classNames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v8);

      ++v6;
      -[BMDSLTableAggregator transforms](self, "transforms");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

    }
    while (v6 < v11);
  }
  v12 = objc_alloc(MEMORY[0x1E0D02438]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__BMDSLTableAggregator_bpsAggregator__block_invoke;
  v16[3] = &unk_1E2649280;
  v16[4] = self;
  v17 = v3;
  v13 = v3;
  v14 = (void *)objc_msgSend(v12, "initWithAccumulator:closure:", 0, v16);

  return v14;
}

id __37__BMDSLTableAggregator_bpsAggregator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  NSString *v25;
  void *v26;
  objc_class *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v5 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "transforms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      v10 = MEMORY[0x1E0C9AA60];
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "transforms");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_alloc(MEMORY[0x1E0D01C00]);
        objc_msgSend(v12, "schema");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithRows:schema:", v10, v14);
        objc_msgSend(v5, "setObject:atIndexedSubscript:", v15, v9);

        ++v9;
        objc_msgSend(*(id *)(a1 + 32), "transforms");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v9 < v17);
    }
  }
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "classKeyPaths");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v20);
        v25 = *(NSString **)(*((_QWORD *)&v40 + 1) + 8 * i);
        NSSelectorFromString(v25);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "valueForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v28 = objc_claimAutoreleasedReturnValue();

            v19 = (void *)v28;
          }

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v22);
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "integerValue");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transforms");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "rowTransform");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowFromInput:", v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "rows");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "arrayByAddingObject:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setRows:", v37);

  objc_msgSend(v5, "setObject:atIndexedSubscript:", v31, v30);
  v38 = v5;

  return v38;
}

- (NSArray)transforms
{
  return self->_transforms;
}

- (void)setTransforms:(id)a3
{
  objc_storeStrong((id *)&self->_transforms, a3);
}

- (NSArray)classNames
{
  return self->_classNames;
}

- (NSArray)classKeyPaths
{
  return self->_classKeyPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classKeyPaths, 0);
  objc_storeStrong((id *)&self->_classNames, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
}

- (void)initWithTableTransforms:(int)a1 classNames:(NSObject *)a2 classKeyPaths:name:version:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLTableAggregator", (uint8_t *)v2, 8u);
}

@end
