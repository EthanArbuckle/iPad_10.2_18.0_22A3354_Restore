@implementation CMLogItemInternal

- (CMLogItemInternal)initWithTimestamp:(double)a3
{
  CMLogItemInternal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMLogItemInternal;
  result = -[CMLogItemInternal init](&v5, sel_init);
  if (result)
    result->fTimestamp = a3;
  return result;
}

@end
