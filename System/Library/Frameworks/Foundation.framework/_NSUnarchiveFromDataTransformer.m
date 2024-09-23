@implementation _NSUnarchiveFromDataTransformer

- (_NSUnarchiveFromDataTransformer)init
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
  v6.super_class = (Class)_NSUnarchiveFromDataTransformer;
  return -[NSValueTransformer init](&v6, sel_init);
}

- (id)transformedValue:(id)a3
{
  if (a3)
    return +[NSUnarchiver unarchiveObjectWithData:](NSUnarchiver, "unarchiveObjectWithData:");
  else
    return 0;
}

- (id)reverseTransformedValue:(id)a3
{
  return +[NSArchiver archivedDataWithRootObject:](NSArchiver, "archivedDataWithRootObject:", a3);
}

- (id)description
{
  return CFSTR("<shared NSUnarchiveFromData transformer>");
}

@end
