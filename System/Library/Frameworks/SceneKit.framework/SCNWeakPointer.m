@implementation SCNWeakPointer

- (id)copyWeakRef
{
  -[SCNWeakPointer weakRef](self, "weakRef");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)weakRef
{
  return objc_loadWeakRetained(&self->weakRef);
}

- (void)setWeakRef:(id)a3
{
  objc_storeWeak(&self->weakRef, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->weakRef);
}

@end
