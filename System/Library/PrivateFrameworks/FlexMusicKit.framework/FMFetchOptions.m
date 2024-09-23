@implementation FMFetchOptions

- (FMFetchOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMFetchOptions;
  return -[FMFetchOptions init](&v3, sel_init);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
