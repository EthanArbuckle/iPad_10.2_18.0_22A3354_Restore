@implementation _NSObservableKVO1Adaptor

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_NSObservableKVO1Adaptor;
  v5 = -[_NSConcreteObservation isEqual:](&v7, sel_isEqual_);
  if (v5)
    LOBYTE(v5) = (objc_opt_isKindOfClass() & 1) != 0
              && -[NSBoundKeyPath isEqual:](self->kp, "isEqual:", *((_QWORD *)a3 + 7));
  return v5;
}

- (_NSObservableKVO1Adaptor)initWithObservable:(id)a3 observer:(id)a4 keyPath:(id)a5
{
  _NSObservableKVO1Adaptor *v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_NSObservableKVO1Adaptor;
  v8 = -[_NSObservableKVO1Adaptor init](&v14, sel_init);
  if (v8)
  {
    v8->super.super._RHSobserver = (NSObserver *)a4;
    v8->super.super._LHSobservable = (NSObservable *)a3;
    if (-[NSObserver conformsToProtocol:](v8->super.super._RHSobserver, "conformsToProtocol:", &unk_1EDCD3238))-[NSObserver setObservation:](v8->super.super._RHSobserver, "setObservation:", v8);
    v9 = objc_msgSend(a5, "_wantsChanges");
    v8->emitsChanges = v9;
    if (v9)
      v10 = 39;
    else
      v10 = 37;
    -[NSObservable addObserver:forKeyPath:options:context:](v8->super.super._LHSobservable, "addObserver:forKeyPath:options:context:", v8, *((_QWORD *)a5 + 2), v10, &internalObservationContext);
    v8->kp = (NSObservableKeyPath *)a5;
    if ((-[NSObserver conformsToProtocol:](v8->super.super._RHSobserver, "conformsToProtocol:", &unk_1EDCD14C0) & 1) == 0)
      __assert_rtn("-[_NSObservableKVO1Adaptor initWithObservable:observer:keyPath:]", "NSObservingKeyPathSupport.m", 412, "[_RHSobserver conformsToProtocol:@protocol(NSObservable)]");
    v11 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, v8->super.super._RHSobserver, 1);
    v12 = v11;
    if (v11)
      addObserver((uint64_t)v11, v8);

  }
  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _NSKVO1AdaptorSlowDeliver((uint64_t)self->super.super._LHSobservable, self->super.super._RHSobserver, self->emitsChanges, (uint64_t)a3, (uint64_t)a4, a5);
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
  _NSKVO1AdaptorDeliver((uint64_t)self->super.super._LHSobservable, self->super.super._RHSobserver, self->emitsChanges, (uint64_t)v10, (uint64_t)v11, a8, a5, (uint64_t)a3, (uint64_t)a4);
}

- (void)remove
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->kp)
  {
    -[NSObservable removeObservation:forObservableKeyPath:](self->super.super._LHSobservable, "removeObservation:forObservableKeyPath:", self);

    self->kp = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSObservableKVO1Adaptor;
  -[_NSConcreteObservation remove](&v3, sel_remove);
}

- (void)finishObserving
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->kp)
  {
    -[NSObservable removeObservation:forObservableKeyPath:](self->super.super._LHSobservable, "removeObservation:forObservableKeyPath:", self);

    self->kp = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSObservableKVO1Adaptor;
  -[_NSConcreteObservation finishObserving](&v3, sel_finishObserving);
}

@end
