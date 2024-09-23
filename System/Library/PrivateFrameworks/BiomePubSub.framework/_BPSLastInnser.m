@implementation _BPSLastInnser

- (_BPSLastInnser)initWithDownstream:(id)a3
{
  id v5;
  _BPSLastInnser *v6;
  _BPSLastInnser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BPSLastInnser;
  v6 = -[_BPSLastInnser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_downstream, a3);

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSLastInnser downstream](self, "downstream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveSubscription:", v4);

}

- (int64_t)receiveInput:(id)a3
{
  _BPSLastInnser *v4;

  v4 = self;
  -[_BPSLastInnser setLast:](v4, "setLast:", a3);

  return 1;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BPSLastInnser *v8;

  v8 = self;
  v4 = a3;
  -[_BPSLastInnser downstream](v8, "downstream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BPSLastInnser last](v8, "last");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveInput:", v6);

  -[_BPSLastInnser downstream](v8, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receiveCompletion:", v4);

}

- (void)cancel
{
  void *v2;
  _BPSLastInnser *v3;

  v3 = self;
  -[_BPSLastInnser downstream](v3, "downstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (id)last
{
  return self->_last;
}

- (void)setLast:(id)a3
{
  objc_storeStrong(&self->_last, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_last, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
