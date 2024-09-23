@implementation NSUnknownRequestTypeResult

- (NSUnknownRequestTypeResult)initWithSubresults:(id)a3
{
  NSUnknownRequestTypeResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSUnknownRequestTypeResult;
  v4 = -[NSUnknownRequestTypeResult init](&v6, sel_init);
  if (v4)
    v4->_subresults = (NSArray *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_subresults = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSUnknownRequestTypeResult;
  -[NSUnknownRequestTypeResult dealloc](&v3, sel_dealloc);
}

@end
