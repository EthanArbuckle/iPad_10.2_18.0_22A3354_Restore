@implementation HDExtractionResult

- (HDExtractionResult)initWithItems:(id)a3
{
  id v4;
  HDExtractionResult *v5;
  uint64_t v6;
  NSArray *items;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDExtractionResult;
  v5 = -[HDExtractionResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    items = v5->_items;
    v5->_items = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)allUnits
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "units", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HDExtractionResult *v4;
  HDExtractionResult *v5;
  NSArray *items;
  NSArray *v7;
  void *v8;
  NSArray *v9;
  void *v10;
  char v11;

  v4 = (HDExtractionResult *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      items = self->_items;
      -[HDExtractionResult items](v5, "items");
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (items == v7)
      {
        v11 = 1;
      }
      else
      {
        -[HDExtractionResult items](v5, "items");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = self->_items;
          -[HDExtractionResult items](v5, "items");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[NSArray isEqualToArray:](v9, "isEqualToArray:", v10);

        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_items, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, %lu items>"), v5, self, -[NSArray count](self->_items, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSArray hk_map:](self->_items, "hk_map:", &__block_literal_global_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n\t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[HDExtractionResult description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@\n\t%@>"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __38__HDExtractionResult_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugDescription");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDExtractionResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  HDExtractionResult *v8;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("Items"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HDExtractionResult initWithItems:](self, "initWithItems:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_items, CFSTR("Items"));
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
