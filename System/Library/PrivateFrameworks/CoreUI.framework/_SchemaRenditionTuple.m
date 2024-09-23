@implementation _SchemaRenditionTuple

- (_SchemaRenditionTuple)init
{
  _SchemaRenditionTuple *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SchemaRenditionTuple;
  result = -[_SchemaRenditionTuple init](&v3, sel_init);
  result->info = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = objc_alloc_init((Class)objc_opt_class(self, a2));
  CUIRenditionKeyCopy(v5 + 1, &self->key[0].identifier, 0x16u);
  v5[12] = -[NSMutableDictionary mutableCopyWithZone:](self->info, "mutableCopyWithZone:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SchemaRenditionTuple;
  -[_SchemaRenditionTuple dealloc](&v3, sel_dealloc);
}

- (id)description
{
  CUIRenditionKey *v3;
  NSString *v4;
  id v5;
  objc_super v7;

  v3 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->key);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\telement: %ld,\tpart: %ld,\tsize: %ld,\tdirection: %ld,\tvalue: %ld,\tdimension1: %ld,\tdimension2: %ld,\tstate: %ld,\tlayer: %ld,\tscale:%ld,\tidentifier:%ld"), -[CUIRenditionKey themeElement](v3, "themeElement"), -[CUIRenditionKey themePart](v3, "themePart"), -[CUIRenditionKey themeSize](v3, "themeSize"), -[CUIRenditionKey themeDirection](v3, "themeDirection"), -[CUIRenditionKey themeValue](v3, "themeValue"), -[CUIRenditionKey themeDimension1](v3, "themeDimension1"), -[CUIRenditionKey themeDimension2](v3, "themeDimension2"), -[CUIRenditionKey themeState](v3, "themeState"), -[CUIRenditionKey themeLayer](v3, "themeLayer"), -[CUIRenditionKey themeScale](v3, "themeScale"), -[CUIRenditionKey themeIdentifier](v3, "themeIdentifier"));

  v5 = -[NSMutableDictionary description](self->info, "description");
  v7.receiver = self;
  v7.super_class = (Class)_SchemaRenditionTuple;
  return objc_msgSend(-[_SchemaRenditionTuple description](&v7, sel_description), "stringByAppendingFormat:", CFSTR("\nKey:%@\nCUInfo:\n%@"), v4, v5);
}

@end
