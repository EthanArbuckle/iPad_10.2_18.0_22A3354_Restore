@implementation ICASTagDeleteApproach

- (ICASTagDeleteApproach)initWithTagDeleteApproach:(int64_t)a3
{
  ICASTagDeleteApproach *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASTagDeleteApproach;
  result = -[ICASTagDeleteApproach init](&v5, sel_init);
  if (result)
    result->_tagDeleteApproach = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASTagDeleteApproach tagDeleteApproach](self, "tagDeleteApproach", a3);
  if ((unint64_t)(v3 - 1) > 4)
    return CFSTR("unknown");
  else
    return *(&off_1E771C540 + v3 - 1);
}

- (int64_t)tagDeleteApproach
{
  return self->_tagDeleteApproach;
}

@end
