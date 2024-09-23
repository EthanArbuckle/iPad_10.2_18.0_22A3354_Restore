@implementation _BPSAbstractCombineLatestSide

- (_BPSAbstractCombineLatestSide)initWithIndex:(unint64_t)a3 combiner:(id)a4
{
  id v7;
  _BPSAbstractCombineLatestSide *v8;
  _BPSAbstractCombineLatestSide *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSAbstractCombineLatestSide;
  v8 = -[_BPSAbstractCombineLatestSide init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    objc_storeStrong((id *)&v8->_combiner, a4);
  }

  return v9;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSAbstractCombineLatestSide combiner](self, "combiner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveSubscription:atIndex:", v4, -[_BPSAbstractCombineLatestSide index](self, "index"));

}

- (int64_t)receiveInput:(id)a3
{
  _BPSAbstractCombineLatestSide *v4;
  id v5;
  void *v6;
  int64_t v7;

  v4 = self;
  v5 = a3;
  -[_BPSAbstractCombineLatestSide combiner](v4, "combiner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "receiveInput:atIndex:", v5, -[_BPSAbstractCombineLatestSide index](v4, "index"));

  return v7;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  void *v5;
  _BPSAbstractCombineLatestSide *v6;

  v6 = self;
  v4 = a3;
  -[_BPSAbstractCombineLatestSide combiner](v6, "combiner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveCompletion:atIndex:", v4, -[_BPSAbstractCombineLatestSide index](v6, "index"));

}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (_BPSAbstractCombineLatest)combiner
{
  return self->_combiner;
}

- (void)setCombiner:(id)a3
{
  objc_storeStrong((id *)&self->_combiner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combiner, 0);
}

@end
