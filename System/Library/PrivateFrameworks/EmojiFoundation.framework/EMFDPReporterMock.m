@implementation EMFDPReporterMock

- (EMFDPReporterMock)init
{
  EMFDPReporterMock *v3;
  NSMutableArray *v4;
  NSMutableArray *recordsWritten;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMFDPReporterMock;
  v3 = -[EMFDPReporterMock init](&v7, sel_init);
  if (v3 == self)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recordsWritten = self->_recordsWritten;
    self->_recordsWritten = v4;

  }
  return v3;
}

- (BOOL)record:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray addObject:](self->_recordsWritten, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return 1;
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_recordsWritten, "removeAllObjects");
}

- (NSArray)recordsWritten
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_recordsWritten, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsWritten, 0);
}

@end
