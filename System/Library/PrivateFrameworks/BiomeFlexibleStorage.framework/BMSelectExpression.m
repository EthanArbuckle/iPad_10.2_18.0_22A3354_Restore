@implementation BMSelectExpression

- (BMSelectExpression)initWithChildren:(id)a3 columnNames:(id)a4
{
  id v7;
  id v8;
  BMSelectExpression *v9;
  uint64_t v10;
  NSArray *columnNames;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSelectExpression;
  v9 = -[BMSelectExpression init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    columnNames = v9->_columnNames;
    v9->_columnNames = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_children, a3);
  }

  return v9;
}

- (id)queryTable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  BMSQLRow *v30;
  BMTableSchema *v31;
  void *v32;
  BMTableSchema *v33;
  BMTable *v34;
  void *v35;
  BMTable *v36;
  void *v38;
  BMSelectExpression *v39;
  id obj;
  void *v41;
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v39 = self;
  -[BMSelectExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  v7 = v4;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v53;
    v7 = v4;
    do
    {
      v10 = 0;
      v11 = v7;
      do
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v10), "queryTable:", v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v7;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v8);
  }
  v38 = v4;

  v12 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[BMSelectExpression columnNames](v39, "columnNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v49;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v17);
        objc_msgSend(v7, "schema", v38);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "columnNames");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "indexOfObject:", v18);

        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "addIndex:", v21);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v15);
  }

  v41 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v7, "rows");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v45;
    v25 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v45 != v24)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v26);
        v28 = (void *)objc_msgSend(v25, "mutableCopy", v38);
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __33__BMSelectExpression_queryTable___block_invoke;
        v42[3] = &unk_1E664A028;
        v42[4] = v27;
        v29 = v28;
        v43 = v29;
        objc_msgSend(v12, "enumerateIndexesUsingBlock:", v42);
        if (objc_msgSend(v29, "count"))
        {
          v30 = -[BMSQLRow initWithValues:]([BMSQLRow alloc], "initWithValues:", v29);
          objc_msgSend(v41, "addObject:", v30);

        }
        ++v26;
      }
      while (v23 != v26);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v23);
  }

  v31 = [BMTableSchema alloc];
  -[BMSelectExpression columnNames](v39, "columnNames");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[BMTableSchema initWithColumnNames:](v31, "initWithColumnNames:", v32);

  v34 = [BMTable alloc];
  v35 = (void *)objc_msgSend(v41, "copy");
  v36 = -[BMTable initWithRows:schema:](v34, "initWithRows:schema:", v35, v33);

  return v36;
}

void __33__BMSelectExpression_queryTable___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "valueAtIdx:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  *a3 = 0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BMSelectExpression columnNames](self, "columnNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("columnNames"));

  -[BMSelectExpression children](self, "children");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("children"));

}

- (BMSelectExpression)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BMSelectExpression *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("columnNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("children"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BMSelectExpression initWithChildren:columnNames:](self, "initWithChildren:columnNames:", v6, v5);
  return v7;
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
