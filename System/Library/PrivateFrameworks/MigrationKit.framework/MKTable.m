@implementation MKTable

- (MKTable)init
{
  MKTable *v2;
  id v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTable;
  v2 = -[MKTable init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[MKTable setRows:](v2, "setRows:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[MKTable setColumns:](v2, "setColumns:", v4);

  }
  return v2;
}

- (void)addRow:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  MKTableColumn *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[MKTable columns](self, "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v14, "totalColumns");

  if (v5 < v6)
  {
    do
    {
      -[MKTable columns](self, "columns");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MKTableColumn);
      objc_msgSend(v7, "addObject:", v8);

      -[MKTable columns](self, "columns");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      v11 = objc_msgSend(v14, "totalColumns");

    }
    while (v10 < v11);
  }
  -[MKTable columns](self, "columns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "adjustColumnsToFit:", v12);

  -[MKTable rows](self, "rows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

}

- (void)writeToLog
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MKTable rows](self, "rows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        +[MKLog log](MKLog, "log", v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[MKTable columns](self, "columns");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "asciiRepresentationUsingColumns:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v13;
          v19 = v12;
          _os_log_impl(&dword_21EC08000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

}

- (void)writeToDisk:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  MKTable *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MKTable rows](self, "rows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "csvRepresentation");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v8);
  }

  v17 = 0;
  v13 = objc_msgSend(v5, "writeToFile:atomically:encoding:error:", v4, 0, 4, &v17);
  v14 = v17;
  +[MKLog log](MKLog, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_21EC08000, v16, OS_LOG_TYPE_INFO, "%@: Wrote table to disk at %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[MKTable writeToDisk:].cold.1((uint64_t)self, (uint64_t)v14, v16);
  }

}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_storeStrong((id *)&self->_rows, a3);
}

- (NSMutableArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

- (void)writeToDisk:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "%@: Failed to write table to disk: %@", (uint8_t *)&v3, 0x16u);
}

@end
