@implementation HSUpdateResponse

- (unsigned)databaseRevision
{
  return self->_databaseRevision;
}

- (void)setDatabaseRevision:(unsigned int)a3
{
  self->_databaseRevision = a3;
}

@end
