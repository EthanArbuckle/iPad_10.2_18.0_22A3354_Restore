@implementation ICASLinkAddApproach

- (ICASLinkAddApproach)initWithLinkAddApproach:(int64_t)a3
{
  ICASLinkAddApproach *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASLinkAddApproach;
  result = -[ICASLinkAddApproach init](&v5, sel_init);
  if (result)
    result->_linkAddApproach = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASLinkAddApproach linkAddApproach](self, "linkAddApproach", a3);
  if ((unint64_t)(v3 - 1) > 6)
    return CFSTR("unknown");
  else
    return off_1E771C750[v3 - 1];
}

- (int64_t)linkAddApproach
{
  return self->_linkAddApproach;
}

@end
