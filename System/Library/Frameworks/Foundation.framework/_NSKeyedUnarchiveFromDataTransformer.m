@implementation _NSKeyedUnarchiveFromDataTransformer

- (_NSKeyedUnarchiveFromDataTransformer)init
{
  objc_class *v3;
  NSString *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  +[NSValueTransformer _warnAboutInscureArchiverCitingOffender:]((uint64_t)NSValueTransformer, (uint64_t)v4);
  v6.receiver = self;
  v6.super_class = (Class)_NSKeyedUnarchiveFromDataTransformer;
  return -[NSValueTransformer init](&v6, sel_init);
}

- (id)transformedValue:(id)a3
{
  if (a3)
    return +[NSKeyedUnarchiver unarchiveObjectWithData:](NSKeyedUnarchiver, "unarchiveObjectWithData:");
  else
    return 0;
}

- (id)reverseTransformedValue:(id)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:](NSKeyedArchiver, "archivedDataWithRootObject:", a3);
}

- (id)description
{
  return CFSTR("<shared NSKeyedUnarchiveFromData transformer>");
}

@end
