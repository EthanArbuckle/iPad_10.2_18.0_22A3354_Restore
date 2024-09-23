@implementation AXPearlWeakObjectShell

- (id)weakObjectReference
{
  return objc_loadWeakRetained(&self->_weakObjectReference);
}

- (void)setWeakObjectReference:(id)a3
{
  objc_storeWeak(&self->_weakObjectReference, a3);
}

- (id)weakSpatialProfileReference
{
  return objc_loadWeakRetained(&self->_weakSpatialProfileReference);
}

- (void)setWeakSpatialProfileReference:(id)a3
{
  objc_storeWeak(&self->_weakSpatialProfileReference, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakSpatialProfileReference);
  objc_destroyWeak(&self->_weakObjectReference);
}

@end
