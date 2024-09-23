@implementation NSKnownKeysDictionary

+ (NSKnownKeysDictionary)alloc
{
  return (NSKnownKeysDictionary *)objc_opt_class();
}

+ (NSArray)classesForArchiving
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
}

+ (NSKnownKeysDictionary)allocWithZone:(_NSZone *)a3
{
  return (NSKnownKeysDictionary *)objc_opt_class();
}

+ (id)newInstanceWithSearchStrategy:(id)a3 inData:(id)a4
{
  return 0;
}

- (NSKnownKeysDictionary)initWithSearchStrategy:(id)a3
{
  return 0;
}

- (id)initForKeys:(id)a3
{
  return 0;
}

- (NSKnownKeysMappingStrategy)mapping
{
  return 0;
}

- (const)values
{
  return 0;
}

- (id)valueAtIndex:(unint64_t)a3
{
  return 0;
}

@end
