@implementation _BPSMergedSide

- (_BPSMergedSide)initWithIndex:(int64_t)a3 merger:(id)a4
{
  id v7;
  _BPSMergedSide *v8;
  _BPSMergedSide *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSMergedSide;
  v8 = -[_BPSMergedSide init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    objc_storeStrong((id *)&v8->_merger, a4);
  }

  return v9;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  void *v5;
  _BPSMergedSide *v6;

  v6 = self;
  v4 = a3;
  -[_BPSMergedSide merger](v6, "merger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveCompletion:atIndex:", v4, -[_BPSMergedSide index](v6, "index"));

}

- (int64_t)receiveInput:(id)a3
{
  _BPSMergedSide *v4;
  id v5;
  void *v6;
  int64_t v7;

  v4 = self;
  v5 = a3;
  -[_BPSMergedSide merger](v4, "merger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "receiveInput:atIndex:", v5, -[_BPSMergedSide index](v4, "index"));

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSMergedSide merger](self, "merger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveSubscription:atIndex:", v4, -[_BPSMergedSide index](self, "index"));

}

- (_BPSMerged)merger
{
  return self->_merger;
}

- (void)setMerger:(id)a3
{
  objc_storeStrong((id *)&self->_merger, a3);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merger, 0);
}

@end
