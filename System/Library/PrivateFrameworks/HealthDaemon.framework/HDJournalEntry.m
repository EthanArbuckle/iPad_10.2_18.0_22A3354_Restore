@implementation HDJournalEntry

- (NSString)entryClassName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)size
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (HDJournalEntry)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDJournalEntry;
  return -[HDJournalEntry init](&v4, sel_init, a3);
}

@end
