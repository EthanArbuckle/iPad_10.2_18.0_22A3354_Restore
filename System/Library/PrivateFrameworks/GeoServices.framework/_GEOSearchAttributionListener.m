@implementation _GEOSearchAttributionListener

- (_GEOSearchAttributionListener)initWithIdentifier:(id)a3
{
  id v4;
  _GEOSearchAttributionListener *v5;
  uint64_t v6;
  NSString *identifier;
  _GEOSearchAttributionListener *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOSearchAttributionListener;
  v5 = -[_GEOSearchAttributionListener init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)addCompletionHandler:(id)a3 errorHandler:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *completionHandlers;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *errorHandlers;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (v17)
  {
    if (!self->_completionHandlers)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      completionHandlers = self->_completionHandlers;
      self->_completionHandlers = v7;

    }
    v9 = (void *)objc_msgSend(v17, "copy");
    v10 = self->_completionHandlers;
    v11 = (void *)MEMORY[0x18D765024]();
    -[NSMutableArray addObject:](v10, "addObject:", v11);

  }
  if (v6)
  {
    if (!self->_errorHandlers)
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      errorHandlers = self->_errorHandlers;
      self->_errorHandlers = v12;

    }
    v14 = (void *)objc_msgSend(v6, "copy");
    v15 = self->_errorHandlers;
    v16 = (void *)MEMORY[0x18D765024]();
    -[NSMutableArray addObject:](v15, "addObject:", v16);

  }
}

- (void)handleInfo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_completionHandlers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)handleError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_errorHandlers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
