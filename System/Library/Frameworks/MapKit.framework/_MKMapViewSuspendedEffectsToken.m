@implementation _MKMapViewSuspendedEffectsToken

- (_MKMapViewSuspendedEffectsToken)initWithOwner:(id)a3
{
  id v4;
  _MKMapViewSuspendedEffectsToken *v5;
  _MKMapViewSuspendedEffectsToken *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MKMapViewSuspendedEffectsToken;
  v5 = -[_MKMapViewSuspendedEffectsToken init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_owner, v4);

  return v6;
}

- (void)invalidate
{
  id WeakRetained;

  if (!self->_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    objc_msgSend(WeakRetained, "_startEffects");

    self->_invalidated = 1;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[_MKMapViewSuspendedEffectsToken invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_MKMapViewSuspendedEffectsToken;
  -[_MKMapViewSuspendedEffectsToken dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
}

@end
