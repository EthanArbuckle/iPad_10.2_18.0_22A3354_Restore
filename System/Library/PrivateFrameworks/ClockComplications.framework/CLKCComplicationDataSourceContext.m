@implementation CLKCComplicationDataSourceContext

- (CLKCComplicationDataSourceContext)init
{
  CLKCComplicationDataSourceContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKCComplicationDataSourceContext;
  result = -[CLKCComplicationDataSourceContext init](&v3, sel_init);
  if (result)
    result->_showsBackground = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_opt_new();
  *((_BYTE *)result + 8) = self->_showsBackground;
  return result;
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (void)setShowsBackground:(BOOL)a3
{
  self->_showsBackground = a3;
}

@end
