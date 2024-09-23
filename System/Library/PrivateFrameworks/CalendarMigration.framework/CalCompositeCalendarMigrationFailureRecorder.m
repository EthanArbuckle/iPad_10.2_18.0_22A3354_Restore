@implementation CalCompositeCalendarMigrationFailureRecorder

- (CalCompositeCalendarMigrationFailureRecorder)initWithFailureRecorders:(id)a3
{
  id v4;
  CalCompositeCalendarMigrationFailureRecorder *v5;
  uint64_t v6;
  NSArray *failureRecorders;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalCompositeCalendarMigrationFailureRecorder;
  v5 = -[CalCompositeCalendarMigrationFailureRecorder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    failureRecorders = v5->_failureRecorders;
    v5->_failureRecorders = (NSArray *)v6;

  }
  return v5;
}

- (void)recordMigrationFailure:(id)a3
{
  id v4;
  void *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CalCompositeCalendarMigrationFailureRecorder failureRecorders](self, "failureRecorders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "recordMigrationFailure:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)reportRecordedFailures
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CalCompositeCalendarMigrationFailureRecorder failureRecorders](self, "failureRecorders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reportRecordedFailures");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSArray)failureRecorders
{
  return self->_failureRecorders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureRecorders, 0);
}

@end
