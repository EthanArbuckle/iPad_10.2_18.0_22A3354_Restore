@implementation ETOptimizerDef

- (ETOptimizerDef)init
{
  ETOptimizerDef *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ETOptimizerDef;
  v2 = -[ETOptimizerDef init](&v4, sel_init);
  -[ETOptimizerDef setBatch_size:](v2, "setBatch_size:", 1);
  return v2;
}

- (unsigned)batch_size
{
  return self->_batch_size;
}

- (void)setBatch_size:(unsigned int)a3
{
  self->_batch_size = a3;
}

@end
