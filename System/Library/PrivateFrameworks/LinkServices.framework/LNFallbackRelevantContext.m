@implementation LNFallbackRelevantContext

- (LNFallbackRelevantContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LNFallbackRelevantContext;
  return (LNFallbackRelevantContext *)-[LNRelevantContext _init](&v3, sel__init);
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3 == self)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (id)description
{
  return CFSTR("<fallback>");
}

- (id)analyticsDescription
{
  return CFSTR(".fallback");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
