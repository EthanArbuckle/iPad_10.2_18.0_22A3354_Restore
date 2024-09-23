@implementation CUIThemeSchemaPSDLayer

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDLayer;
  return objc_msgSend(-[CUIThemeSchemaPSDLayer description](&v3, sel_description), "stringByAppendingFormat:", CFSTR("\rName: %@"), -[CUIThemeSchemaPSDLayer name](self, "name"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDLayer;
  -[CUIThemeSchemaPSDLayer dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
