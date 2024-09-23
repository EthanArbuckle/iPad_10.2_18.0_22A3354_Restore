@implementation ULObserverRecord

- (ULObserverRecord)initWithObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  ULObserverRecord *v7;
  ULObserverRecord *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULObserverRecord;
  v7 = -[ULObserverRecord init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ULObserverRecord setObserver:](v7, "setObserver:", v6);
    -[ULObserverRecord setSelector:](v8, "setSelector:", a4);
  }

  return v8;
}

- (id)observer
{
  return objc_loadWeakRetained(&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak(&self->_observer, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observer);
}

@end
