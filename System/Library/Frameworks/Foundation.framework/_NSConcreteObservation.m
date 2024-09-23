@implementation _NSConcreteObservation

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (NSObservable *)*((_QWORD *)a3 + 1) == self->_LHSobservable)
    return (NSObserver *)*((_QWORD *)a3 + 2) == self->_RHSobserver;
  return 0;
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%p) (%@ => %@)"), objc_opt_class(), self, -[NSObservable debugDescription](self->_LHSobservable, "debugDescription"), -[NSObserver debugDescription](self->_RHSobserver, "debugDescription"));
}

- (_NSConcreteObservation)initWithObservable:(id)a3 observer:(id)a4
{
  _NSConcreteObservation *v6;
  _QWORD *v7;
  void *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_NSConcreteObservation;
  v6 = -[_NSConcreteObservation init](&v10, sel_init);
  if (v6)
  {
    v6->_RHSobserver = (NSObserver *)a4;
    v6->_LHSobservable = (NSObservable *)a3;
    if (-[NSObserver conformsToProtocol:](v6->_RHSobserver, "conformsToProtocol:", &unk_1EDCD3238))
      -[NSObserver setObservation:](v6->_RHSobserver, "setObservation:", v6);
    if (-[_NSConcreteObservation conformsToProtocol:](v6, "conformsToProtocol:", &unk_1EDCD14C0))
    {
      if ((-[NSObserver conformsToProtocol:](v6->_RHSobserver, "conformsToProtocol:", &unk_1EDCD14C0) & 1) == 0)
        __assert_rtn("-[_NSConcreteObservation initWithObservable:observer:]", "NSObserving.m", 113, "[_RHSobserver conformsToProtocol:@protocol(NSObservable)]");
      v7 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, v6->_RHSobserver, 1);
      v8 = v7;
      if (v7)
        addObserver((uint64_t)v7, v6);

    }
  }
  return v6;
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
  if (a3 != 32)
    __assert_rtn("-[_NSConcreteObservation _observerStorageOfSize:]", "NSObserving.m", 126, "sz == 4 * sizeof(id)");
  return self->_observers;
}

- (void)remove
{
  NSObservable *LHSobservable;
  _QWORD *v4;
  _QWORD *v5;

  LHSobservable = self->_LHSobservable;
  if (LHSobservable)
  {
    v4 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, LHSobservable, 0);
    if (v4)
    {
      v5 = v4;
      removeObservation((uint64_t)v4, (uint64_t)self->_RHSobserver);
      v4 = v5;
    }

  }
}

- (void)finishObserving
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[_NSConcreteObservation remove](self, "remove");
  v3.receiver = self;
  v3.super_class = (Class)_NSConcreteObservation;
  -[_NSConcreteObservation finishObserving](&v3, sel_finishObserving);
}

- (void)_receiveBox:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t StackObservedValueClassAndBoxSize;
  uint64_t v7;
  Class v8;
  _DWORD *v9;
  _QWORD *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if ((NSObserver *)*((_QWORD *)a3 + 2) == self->_RHSobserver)
  {
    v4 = *((_QWORD *)a3 + 1);
    v5 = *((_DWORD *)a3 + 6);
    v11[0] = 0;
    StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v11);
    MEMORY[0x1E0C80A78](StackObservedValueClassAndBoxSize);
    v9 = objc_constructInstance(v8, (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    v9[6] = v5;
    *((_QWORD *)v9 + 1) = v4;
    *((_QWORD *)v9 + 2) = self;
    v10 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 0);
    objc_msgSend(v10, "_receiveBox:", v9);

  }
  else
  {
    -[NSObservable _receiveBox:](self->_LHSobservable, "_receiveBox:");
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[_NSConcreteObservation remove](self, "remove");

  -[_NSConcreteObservation _destroyObserverList](self, "_destroyObserverList");
  v3.receiver = self;
  v3.super_class = (Class)_NSConcreteObservation;
  -[_NSConcreteObservation dealloc](&v3, sel_dealloc);
}

@end
