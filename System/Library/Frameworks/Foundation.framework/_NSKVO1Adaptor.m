@implementation _NSKVO1Adaptor

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_NSKVO1Adaptor;
  v5 = -[_NSConcreteObservation isEqual:](&v7, sel_isEqual_);
  if (v5)
    LOBYTE(v5) = (objc_opt_isKindOfClass() & 1) != 0
              && -[NSBoundKeyPath isEqual:](self->kp, "isEqual:", *((_QWORD *)a3 + 7));
  return v5;
}

- (_NSKVO1Adaptor)initWithObservable:(id)a3 observer:(id)a4 keyPath:(id)a5
{
  _NSKVO1Adaptor *v8;
  int v9;
  uint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_NSKVO1Adaptor;
  v8 = -[_NSKVO1Adaptor init](&v12, sel_init);
  if (v8)
  {
    v8->super._RHSobserver = (NSObserver *)a4;
    v8->super._LHSobservable = (NSObservable *)a3;
    if (-[NSObserver conformsToProtocol:](v8->super._RHSobserver, "conformsToProtocol:", &unk_1EDCD3238))
      -[NSObserver setObservation:](v8->super._RHSobserver, "setObservation:", v8);
    v9 = objc_msgSend(a5, "_wantsChanges");
    v8->emitsChanges = v9;
    if (v9)
      v10 = 39;
    else
      v10 = 37;
    -[NSObservable addObserver:forKeyPath:options:context:](v8->super._LHSobservable, "addObserver:forKeyPath:options:context:", v8, *((_QWORD *)a5 + 2), v10, &internalObservationContext);
    v8->kp = (NSObservableKeyPath *)a5;
  }
  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _NSKVO1AdaptorSlowDeliver((uint64_t)self->super._LHSobservable, self->super._RHSobserver, self->emitsChanges, (uint64_t)a3, (uint64_t)a4, a5);
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9
{
  id v10;
  id v11;

  if ((id)*MEMORY[0x1E0C9B0D0] == a7)
    v10 = 0;
  else
    v10 = a7;
  if ((id)*MEMORY[0x1E0C9B0D0] == a6)
    v11 = 0;
  else
    v11 = a6;
  _NSKVO1AdaptorDeliver((uint64_t)self->super._LHSobservable, self->super._RHSobserver, self->emitsChanges, (uint64_t)v10, (uint64_t)v11, a8, a5, (uint64_t)a3, (uint64_t)a4);
}

- (void)_setEmitsChanges:(BOOL)a3
{
  self->emitsChanges = a3;
}

- (void)remove
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->kp)
  {
    -[NSObservable removeObservation:forObservableKeyPath:](self->super._LHSobservable, "removeObservation:forObservableKeyPath:", self);

    self->kp = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSKVO1Adaptor;
  -[_NSConcreteObservation remove](&v3, sel_remove);
}

- (void)finishObserving
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->kp)
  {
    -[NSObservable removeObservation:forObservableKeyPath:](self->super._LHSobservable, "removeObservation:forObservableKeyPath:", self);

    self->kp = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSKVO1Adaptor;
  -[_NSConcreteObservation finishObserving](&v3, sel_finishObserving);
}

@end
