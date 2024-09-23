@implementation ICASTagAddApproach

- (ICASTagAddApproach)initWithTagAddApproach:(int64_t)a3
{
  ICASTagAddApproach *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASTagAddApproach;
  result = -[ICASTagAddApproach init](&v5, sel_init);
  if (result)
    result->_tagAddApproach = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASTagAddApproach tagAddApproach](self, "tagAddApproach", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C458[v3 - 1];
}

- (int64_t)tagAddApproach
{
  return self->_tagAddApproach;
}

@end
