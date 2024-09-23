@implementation ICCRCoderUnarchiverCompletionHandler

- (id)block
{
  return self->block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)dependency
{
  return objc_loadWeakRetained(&self->dependency);
}

- (void)setDependency:(id)a3
{
  objc_storeWeak(&self->dependency, a3);
}

- (id)value
{
  return objc_loadWeakRetained(&self->value);
}

- (void)setValue:(id)a3
{
  objc_storeWeak(&self->value, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->value);
  objc_destroyWeak(&self->dependency);
  objc_storeStrong(&self->block, 0);
}

@end
