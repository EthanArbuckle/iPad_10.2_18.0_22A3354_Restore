@implementation HDMutableDatabaseTransactionContext

- (void)addAccessibilityAssertion:(id)a3
{
  id v4;
  NSMutableSet *accessibilityAssertions;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  accessibilityAssertions = self->super._accessibilityAssertions;
  v8 = v4;
  if (!accessibilityAssertions)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->super._accessibilityAssertions;
    self->super._accessibilityAssertions = v6;

    v4 = v8;
    accessibilityAssertions = self->super._accessibilityAssertions;
  }
  -[NSMutableSet addObject:](accessibilityAssertions, "addObject:", v4);

}

- (void)addAccessibilityAssertions:(id)a3
{
  NSMutableSet *accessibilityAssertions;
  NSMutableSet *v4;
  objc_class *v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *v9;

  accessibilityAssertions = self->super._accessibilityAssertions;
  if (accessibilityAssertions)
  {
    v9 = (NSMutableSet *)a3;
    -[NSMutableSet addObjectsFromArray:](accessibilityAssertions, "addObjectsFromArray:", v9);
    v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E20];
    v7 = a3;
    v8 = (NSMutableSet *)objc_msgSend([v6 alloc], "initWithArray:", v7);

    v4 = self->super._accessibilityAssertions;
    self->super._accessibilityAssertions = v8;
  }

}

- (HDMutableDatabaseTransactionContext)contextWithAccessibilityAssertion:(id)a3
{
  if (a3)
    -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](self, "addAccessibilityAssertion:");
  return self;
}

+ (id)contextForWriting
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  objc_msgSendSuper2(&v5, sel_contextForWriting);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

+ (id)contextForWritingProtectedData
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  objc_msgSendSuper2(&v5, sel_contextForWritingProtectedData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

+ (id)contextForReading
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  objc_msgSendSuper2(&v5, sel_contextForReading);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

+ (id)contextForReadingProtectedData
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  objc_msgSendSuper2(&v5, sel_contextForReadingProtectedData);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

+ (id)contextForAccessibilityAssertion:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HDMutableDatabaseTransactionContext;
  objc_msgSendSuper2(&v6, sel_contextForAccessibilityAssertion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (void)setJournalType:(int64_t)a3
{
  self->super._journalType = a3;
}

- (void)setCacheScope:(int64_t)a3
{
  self->super._cacheScope = a3;
}

- (void)setRequiresWrite:(BOOL)a3
{
  if (self)
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)setRequiresProtectedData:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    v3 = 2;
    if (!a3)
      v3 = 0;
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFFDLL | v3;
  }
}

- (void)setHighPriority:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    v3 = 16;
    if (!a3)
      v3 = 0;
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFEFLL | v3;
  }
}

- (void)setSkipJournalMerge:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    v3 = 4;
    if (!a3)
      v3 = 0;
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFFBLL | v3;
  }
}

- (void)setSkipTransactionStartTasks:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    v3 = 32;
    if (!a3)
      v3 = 0;
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFDFLL | v3;
  }
}

- (void)setRequiresNewDatabaseConnection:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    v3 = 8;
    if (!a3)
      v3 = 0;
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFF7 | v3;
  }
}

- (void)setAllowsJournalingDuringProtectedRead:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    v3 = 64;
    if (!a3)
      v3 = 0;
    self->super._options = self->super._options & 0xFFFFFFFFFFFFFFBFLL | v3;
  }
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->super._statistics, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)[HDDatabaseTransactionContext alloc], (void *)self->super._options, (void *)self->super._journalType, (void *)self->super._cacheScope, self->super._accessibilityAssertions, self->super._statistics);
}

@end
