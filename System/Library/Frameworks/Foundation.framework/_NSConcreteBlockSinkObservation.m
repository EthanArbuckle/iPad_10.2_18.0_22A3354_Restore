@implementation _NSConcreteBlockSinkObservation

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (NSObservable *)*((_QWORD *)a3 + 1) == self->_LHSobservable)
    return (id)*((_QWORD *)a3 + 2) == self->_block;
  return 0;
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
  return 0;
}

- (id)_observerStorage
{
  return 0;
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%p) (%@ => %@)"), objc_opt_class(), self, -[NSObservable debugDescription](self->_LHSobservable, "debugDescription"), objc_msgSend(self->_block, "debugDescription"));
}

- (_NSConcreteBlockSinkObservation)initWithObservable:(id)a3 blockSink:(id)a4 tag:(int)a5
{
  _NSConcreteBlockSinkObservation *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_NSConcreteBlockSinkObservation;
  v8 = -[_NSConcreteBlockSinkObservation init](&v10, sel_init);
  if (v8)
  {
    v8->_block = (id)objc_msgSend(a4, "copy");
    v8->_LHSobservable = (NSObservable *)a3;
    v8->_tag = a5;
  }
  return v8;
}

- (void)remove
{
  NSObservable *LHSobservable;
  _QWORD *v4;
  void *v5;
  id block;

  LHSobservable = self->_LHSobservable;
  if (LHSobservable)
  {
    self->_LHSobservable = 0;
    block = self->_block;
    self->_block = 0;
    v4 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, LHSobservable, 0);
    v5 = v4;
    if (v4)
      removeObservation((uint64_t)v4, (uint64_t)self);

  }
}

- (void)_receiveBox:(id)a3
{
  int v3;
  int tag;

  if ((NSObservable *)*((_QWORD *)a3 + 2) == self->_LHSobservable)
  {
    v3 = *((_DWORD *)a3 + 6);
    tag = self->_tag;
    if (v3 != tag || tag == 3)
    {
      if (v3 == 3)
        -[_NSConcreteBlockSinkObservation finishObserving](self, "finishObserving");
    }
    else
    {
      (*((void (**)(void))self->_block + 2))();
    }
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
  -[_NSConcreteBlockSinkObservation remove](self, "remove");
  v3.receiver = self;
  v3.super_class = (Class)_NSConcreteBlockSinkObservation;
  -[_NSConcreteBlockSinkObservation dealloc](&v3, sel_dealloc);
}

@end
