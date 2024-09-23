@implementation _EXQueryObserver

- (_EXQueryObserver)initWithQueries:(id)a3 delegate:(id)a4
{
  id v6;
  _EXQueryObserver *v7;
  _EXQueryObserver *v8;
  objc_super v10;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_EXQueryObserver;
  v7 = -[_EXQueryController initWithQueries:](&v11, sel_initWithQueries_, a3);
  v8 = v7;
  if (v7)
  {
    v10.receiver = v7;
    v10.super_class = (Class)_EXQueryObserver;
    -[_EXQueryController setDelegate:](&v10, sel_setDelegate_, v7);
    -[_EXQueryObserver setInternalDelegate:](v8, "setInternalDelegate:", v6);
  }

  return v8;
}

- (void)queryControllerDidUpdate:(id)a3 difference:(id)a4
{
  id v5;

  -[_EXQueryObserver internalDelegate](self, "internalDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observerDidUpdate:", self);

}

- (NSArray)extensions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXQueryObserver;
  -[_EXQueryController extensions](&v3, sel_extensions);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (_EXQueryObserverDelegate)internalDelegate
{
  return (_EXQueryObserverDelegate *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalDelegate);
}

@end
