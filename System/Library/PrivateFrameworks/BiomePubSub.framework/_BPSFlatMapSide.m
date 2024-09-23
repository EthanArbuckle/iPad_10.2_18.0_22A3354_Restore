@implementation _BPSFlatMapSide

- (_BPSFlatMapSide)initWithIndex:(int64_t)a3 outer:(id)a4
{
  id v7;
  _BPSFlatMapSide *v8;
  _BPSFlatMapSide *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSFlatMapSide;
  v8 = -[_BPSFlatMapSide init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outer, a4);
    v9->_index = a3;
  }

  return v9;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSFlatMapSide outer](self, "outer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveInnerSubscription:index:", v4, -[_BPSFlatMapSide index](self, "index"));

}

- (int64_t)receiveInput:(id)a3
{
  _BPSFlatMapSide *v4;
  id v5;
  void *v6;
  int64_t v7;

  v4 = self;
  v5 = a3;
  -[_BPSFlatMapSide outer](v4, "outer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "receiveInnerInput:index:", v5, -[_BPSFlatMapSide index](v4, "index"));

  return v7;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  void *v5;
  _BPSFlatMapSide *v6;

  v6 = self;
  v4 = a3;
  -[_BPSFlatMapSide outer](v6, "outer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveInnerCompletion:index:", v4, -[_BPSFlatMapSide index](v6, "index"));

}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (_BPSFlatMapOuter)outer
{
  return self->_outer;
}

- (void)setOuter:(id)a3
{
  objc_storeStrong((id *)&self->_outer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outer, 0);
}

@end
