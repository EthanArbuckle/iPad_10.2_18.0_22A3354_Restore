@implementation GKObserverTrampoline

- (id)initObservingObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 block:(id)a6
{
  id v11;
  id v12;
  id v13;
  GKObserverTrampoline *v14;
  uint64_t v15;
  id block;
  uint64_t v17;
  NSString *keyPath;
  GKObserverTrampoline *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)GKObserverTrampoline;
  v14 = -[GKObserverTrampoline init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    block = v14->_block;
    v14->_block = (id)v15;

    v17 = objc_msgSend(v12, "copy");
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v17;

    v14->_options = a5;
    objc_storeStrong(&v14->_observee, a3);
    v19 = v14;
  }

  return v14;
}

- (void)startObserving
{
  objc_msgSend(self->_observee, "addObserver:forKeyPath:options:context:", self, self->_keyPath, self->_options, CFSTR("GKObserverTrampolineContext"));
}

- (id)token
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &self->_block);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void (**block)(id, id, id, void *);
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  if (a6 == CFSTR("GKObserverTrampolineContext") && !self->_cancellationPredicate)
  {
    block = (void (**)(id, id, id, void *))self->_block;
    -[GKObserverTrampoline token](self, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    block[2](block, v10, v11, v13);

  }
}

- (void)cancelObservation
{
  id observee;
  _QWORD block[5];

  if (GKAtomicCompareAndSwap32(0, 1u, (unsigned int *)&self->_cancellationPredicate))
  {
    if ((self->_options & 4) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__GKObserverTrampoline_cancelObservation__block_invoke;
      block[3] = &unk_1E75B1590;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      objc_msgSend(self->_observee, "removeObserver:forKeyPath:", self, self->_keyPath);
      observee = self->_observee;
      self->_observee = 0;

    }
  }
}

void __41__GKObserverTrampoline_cancelObservation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[GKObserverTrampoline cancelObservation](self, "cancelObservation");
  v3.receiver = self;
  v3.super_class = (Class)GKObserverTrampoline;
  -[GKObserverTrampoline dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_observee, 0);
}

@end
