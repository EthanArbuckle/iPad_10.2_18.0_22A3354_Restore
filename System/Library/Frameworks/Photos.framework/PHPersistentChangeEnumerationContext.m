@implementation PHPersistentChangeEnumerationContext

- (PHPersistentChangeEnumerationContext)init
{
  PHPersistentChangeEnumerationContext *v2;
  NSMutableSet *v3;
  NSMutableSet *untrashedIdentifiersAsInserts;
  NSMutableSet *v5;
  NSMutableSet *trashedIdentifiersAsDeletes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHPersistentChangeEnumerationContext;
  v2 = -[PHPersistentChangeEnumerationContext init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    untrashedIdentifiersAsInserts = v2->_untrashedIdentifiersAsInserts;
    v2->_untrashedIdentifiersAsInserts = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    trashedIdentifiersAsDeletes = v2->_trashedIdentifiersAsDeletes;
    v2->_trashedIdentifiersAsDeletes = v5;

  }
  return v2;
}

- (NSMutableSet)untrashedIdentifiersAsInserts
{
  return self->_untrashedIdentifiersAsInserts;
}

- (NSMutableSet)trashedIdentifiersAsDeletes
{
  return self->_trashedIdentifiersAsDeletes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashedIdentifiersAsDeletes, 0);
  objc_storeStrong((id *)&self->_untrashedIdentifiersAsInserts, 0);
}

@end
