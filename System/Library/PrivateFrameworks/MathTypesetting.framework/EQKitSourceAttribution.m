@implementation EQKitSourceAttribution

- (EQKitSourceAttribution)initWithSource:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  EQKitSourceAttribution *v7;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)EQKitSourceAttribution;
  v7 = -[EQKitSourceAttribution init](&v9, sel_init);
  if (v7)
  {
    v7->mSource = (NSString *)objc_msgSend(a3, "copy");
    v7->mRange.location = location;
    v7->mRange.length = length;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitSourceAttribution;
  -[EQKitSourceAttribution dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  uint64_t v6;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
      LOBYTE(v5) = self->mRange.location == objc_msgSend(a3, "range")
                && self->mRange.length == v6
                && -[NSString isEqualToString:](self->mSource, "isEqualToString:", objc_msgSend(a3, "source"));
  }
  return v5;
}

- (NSString)source
{
  return self->mSource;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->mRange.length;
  location = self->mRange.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
