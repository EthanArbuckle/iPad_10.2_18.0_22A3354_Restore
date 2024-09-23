@implementation CUIThemeSchemaPSDLayerGroup

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDLayerGroup;
  return objc_msgSend(-[CUIThemeSchemaPSDLayer description](&v3, sel_description), "stringByAppendingFormat:", CFSTR("\risStart: %d"), -[CUIThemeSchemaPSDLayerGroup isStart](self, "isStart"));
}

- (BOOL)isStart
{
  return self->isStart;
}

- (void)setIsStart:(BOOL)a3
{
  self->isStart = a3;
}

@end
