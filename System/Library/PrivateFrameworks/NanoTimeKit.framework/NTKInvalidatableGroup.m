@implementation NTKInvalidatableGroup

- (NTKInvalidatableGroup)initWithInvalidatables:(id)a3
{
  id v4;
  NTKInvalidatableGroup *v5;
  uint64_t v6;
  NSArray *invalidatables;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKInvalidatableGroup;
  v5 = -[NTKInvalidatableGroup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    invalidatables = v5->_invalidatables;
    v5->_invalidatables = (NSArray *)v6;

  }
  return v5;
}

- (void)invalidate
{
  -[NSArray enumerateObjectsUsingBlock:](self->_invalidatables, "enumerateObjectsUsingBlock:", &__block_literal_global_90);
}

uint64_t __35__NTKInvalidatableGroup_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatables, 0);
}

@end
