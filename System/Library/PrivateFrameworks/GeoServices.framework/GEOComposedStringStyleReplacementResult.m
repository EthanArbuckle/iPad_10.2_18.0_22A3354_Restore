@implementation GEOComposedStringStyleReplacementResult

- (NSString)string
{
  return self->string;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->range.length;
  location = self->range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)token
{
  return self->token;
}

- (int)type
{
  return self->type;
}

- (NSDictionary)attributes
{
  return self->attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->attributes, 0);
  objc_storeStrong((id *)&self->token, 0);
  objc_storeStrong((id *)&self->string, 0);
}

@end
