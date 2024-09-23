@implementation ICASLinkContentType

- (ICASLinkContentType)initWithLinkContentType:(int64_t)a3
{
  ICASLinkContentType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASLinkContentType;
  result = -[ICASLinkContentType init](&v5, sel_init);
  if (result)
    result->_linkContentType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASLinkContentType linkContentType](self, "linkContentType", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E771BE18[v3 - 1];
}

- (int64_t)linkContentType
{
  return self->_linkContentType;
}

@end
