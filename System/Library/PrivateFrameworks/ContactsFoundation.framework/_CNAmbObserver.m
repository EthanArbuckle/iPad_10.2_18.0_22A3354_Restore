@implementation _CNAmbObserver

- (_CNAmbObserver)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  _CNAmbObserver *v9;
  _CNAmbObserver *v10;
  _CNAmbObserver *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNAmbObserver;
  v9 = -[_CNAmbObserver init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = v10;
  }

  return v10;
}

- (void)declareWinner
{
  self->_isWinner = 1;
}

- (void)observerDidReceiveResult:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "observerWillRelayEvent:", self);

  if (self->_isWinner)
    -[CNObserver observerDidReceiveResult:](self->_observer, "observerDidReceiveResult:", v5);

}

- (void)observerDidComplete
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "observerWillRelayEvent:", self);

  if (self->_isWinner)
    -[CNObserver observerDidComplete](self->_observer, "observerDidComplete");
}

- (void)observerDidFailWithError:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "observerWillRelayEvent:", self);

  if (self->_isWinner)
    -[CNObserver observerDidFailWithError:](self->_observer, "observerDidFailWithError:", v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
