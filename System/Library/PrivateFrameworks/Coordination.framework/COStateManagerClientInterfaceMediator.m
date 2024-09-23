@implementation COStateManagerClientInterfaceMediator

- (COStateManagerClientInterfaceMediator)initWithStateManager:(id)a3
{
  id v4;
  COStateManagerClientInterfaceMediator *v5;
  COStateManagerClientInterfaceMediator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COStateManagerClientInterfaceMediator;
  v5 = -[COStateManagerClientInterfaceMediator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_manager, v4);

  return v6;
}

- (void)changesObserved:(id)a3 forPredicate:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "changesObserved:forPredicate:", v9, v6);

}

- (COStateManager)manager
{
  return (COStateManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
}

@end
