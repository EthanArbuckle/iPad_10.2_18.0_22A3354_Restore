@implementation _PFTempNestedSnapshot

- (_PFTempNestedSnapshot)initWithOwnedKKsD:(id)a3 andVersion:(unint64_t)a4
{
  _PFTempNestedSnapshot *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PFTempNestedSnapshot;
  result = -[_PFTempNestedSnapshot init](&v7, sel_init);
  if (result)
  {
    result->_snapshot = (NSKnownKeysDictionary *)a3;
    result->_version = a4;
  }
  return result;
}

- (const)knownKeyValuesPointer
{
  return -[NSKnownKeysDictionary values](self->_snapshot, "values");
}

- (id)_snapshot_
{
  return 0;
}

- (unsigned)_versionNumber
{
  return self->_version;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PFTempNestedSnapshot;
  -[_PFTempNestedSnapshot dealloc](&v3, sel_dealloc);
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSKnownKeysDictionary valueForKey:](self->_snapshot, "valueForKey:", a3);
}

@end
