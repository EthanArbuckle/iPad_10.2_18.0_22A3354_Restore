@implementation _DKTombstoneRequirement

+ (id)requirement
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

- (NSPredicate)eventPredicate
{
  return 0;
}

- (NSArray)propertiesToFetch
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
