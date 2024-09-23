@implementation CADisplayModeCriteria

- (CADisplayModeCriteria)init
{
  CADisplayModeCriteriaPriv *v3;
  CGSize *v4;
  CADisplayModeCriteriaPriv *priv;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (CADisplayModeCriteriaPriv *)malloc_type_malloc(0x20uLL, 0x1000040F6D918ACuLL);
  v4 = (CGSize *)MEMORY[0x1E0C9D820];
  self->_priv = v3;
  v3->var0 = *v4;
  priv = self->_priv;
  priv->var1 = 0.0;
  priv->var2 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CADisplayModeCriteria;
  return -[CADisplayModeCriteria init](&v7, sel_init);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  free(self->_priv);
  v3.receiver = self;
  v3.super_class = (Class)CADisplayModeCriteria;
  -[CADisplayModeCriteria dealloc](&v3, sel_dealloc);
}

- (CGSize)resolution
{
  CADisplayModeCriteriaPriv *priv;
  double width;
  double height;
  CGSize result;

  priv = self->_priv;
  width = priv->var0.width;
  height = priv->var0.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setResolution:(CGSize)a3
{
  self->_priv->var0 = a3;
}

- (double)refreshRate
{
  return self->_priv->var1;
}

- (void)setRefreshRate:(double)a3
{
  self->_priv->var1 = a3;
}

- (NSString)hdrMode
{
  unsigned int v2;

  v2 = self->_priv->var2 - 1;
  if (v2 > 4)
    return 0;
  else
    return (NSString *)*(&off_1E159C5A0 + v2);
}

- (void)setHdrMode:(id)a3
{
  int v5;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Dolby")) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("HDR10")) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("SDR"));
  }
  self->_priv->var2 = v5;
}

@end
