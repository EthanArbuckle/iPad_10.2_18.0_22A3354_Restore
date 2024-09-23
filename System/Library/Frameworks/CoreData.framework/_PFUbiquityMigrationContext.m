@implementation _PFUbiquityMigrationContext

- (void)dealloc
{
  objc_super v3;

  self->_transactionLog = 0;
  self->_sourceStoreSaveSnapshot = 0;

  self->_destinationStoreSaveSnapshot = 0;
  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityMigrationContext;
  -[_PFUbiquityMigrationContext dealloc](&v3, sel_dealloc);
}

@end
