@implementation SGMIDomainCountingTableGuardedData

- (SGMIDomainCountingTableGuardedData)init
{
  SGMIDomainCountingTableGuardedData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGMIDomainCountingTableGuardedData;
  result = -[SGMIDomainCountingTableGuardedData init](&v3, sel_init);
  if (result)
    result->_schemaVersion = -1;
  return result;
}

- (void)setSchemaVersion:(int64_t)a3
{
  NSArray *currentColumns;

  if (self->_schemaVersion != a3)
  {
    currentColumns = self->_currentColumns;
    self->_currentColumns = 0;

    self->_schemaVersion = a3;
  }
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (NSArray)currentColumns
{
  return self->_currentColumns;
}

- (void)setCurrentColumns:(id)a3
{
  objc_storeStrong((id *)&self->_currentColumns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentColumns, 0);
}

@end
