@implementation GEOComposedStringTokenReplacementResult

- (id)copyWithZone:(_NSZone *)a3
{
  GEOComposedStringTokenReplacementResult *v4;
  uint64_t v5;
  NSString *string;
  uint64_t v7;
  NSAttributedString *attributedString;

  v4 = -[GEOComposedStringTokenReplacementResult init](+[GEOComposedStringTokenReplacementResult allocWithZone:](GEOComposedStringTokenReplacementResult, "allocWithZone:", a3), "init");
  v4->success = self->success;
  v4->type = self->type;
  v5 = -[NSString copy](self->string, "copy");
  string = v4->string;
  v4->string = (NSString *)v5;

  v7 = -[NSAttributedString copy](self->attributedString, "copy");
  attributedString = v4->attributedString;
  v4->attributedString = (NSAttributedString *)v7;

  v4->range = self->range;
  return v4;
}

- (BOOL)success
{
  return self->success;
}

- (int)type
{
  return self->type;
}

- (NSString)string
{
  return self->string;
}

- (NSAttributedString)attributedString
{
  return self->attributedString;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->attributedString, 0);
  objc_storeStrong((id *)&self->string, 0);
}

@end
