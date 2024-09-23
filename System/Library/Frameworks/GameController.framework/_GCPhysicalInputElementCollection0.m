@implementation _GCPhysicalInputElementCollection0

- (unint64_t)count
{
  return 0;
}

- (id)elementAtIndex:(unint64_t)a3
{
  id v3;

  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** %s: index %lu beyond bounds for empty collection."), "-[_GCPhysicalInputElementCollection0 elementAtIndex:]", a3);
  +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_claimAutoreleasedReturnValue(), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)elementForAlias:(id)a3
{
  return 0;
}

@end
