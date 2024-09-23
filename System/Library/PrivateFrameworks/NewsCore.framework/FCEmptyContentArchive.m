@implementation FCEmptyContentArchive

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

- (id)description
{
  return CFSTR("<Empty>");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCEmptyContentArchive)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCEmptyContentArchive;
  return -[FCEmptyContentArchive init](&v4, sel_init, a3);
}

- (id)unarchiveIntoContentContext:(id)a3
{
  FCContentUnarchiveResult *v3;

  v3 = [FCContentUnarchiveResult alloc];
  return -[FCContentUnarchiveResult initWithInterestToken:storageSize:](v3, "initWithInterestToken:storageSize:", MEMORY[0x1E0C9AA60], 0);
}

- (id)manifest
{
  return +[FCContentManifest empty](FCContentManifest, "empty");
}

@end
