@implementation NSQueryGenerationToken

+ (NSQueryGenerationToken)currentQueryGenerationToken
{
  return (NSQueryGenerationToken *)qword_1ECD8DA38;
}

- (BOOL)_isEnabled
{
  return _MergedGlobals_76 != (_QWORD)self;
}

+ (id)unpinnedQueryGenerationToken
{
  return (id)_MergedGlobals_76;
}

+ (id)nostoresQueryGenerationToken
{
  return (id)qword_1ECD8DA40;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_76 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]([_NSQueryGenerationToken alloc], CFSTR("unpinned"), 1);
    qword_1ECD8DA38 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]([_NSQueryGenerationToken alloc], CFSTR("current"), 1);
    qword_1ECD8DA40 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]([_NSQueryGenerationToken alloc], CFSTR("nostore"), 1);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSQueryGenerationToken)initWithCoder:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSQueryGenerationToken: %p>"), self);
}

@end
