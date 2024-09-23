@implementation CTFetchRoadsideProvidersContext

- (id)description
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR(">"));
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  CTFetchRoadsideProvidersContext *v4;
  char isKindOfClass;

  v4 = (CTFetchRoadsideProvidersContext *)a3;
  if (self == v4)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (CTFetchRoadsideProvidersContext)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CTFetchRoadsideProvidersContext;
  return -[CTFetchRoadsideProvidersContext init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
