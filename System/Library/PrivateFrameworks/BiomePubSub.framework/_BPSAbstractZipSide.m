@implementation _BPSAbstractZipSide

- (_BPSAbstractZipSide)initWithIndex:(int64_t)a3 zip:(id)a4
{
  id v7;
  _BPSAbstractZipSide *v8;
  _BPSAbstractZipSide *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSAbstractZipSide;
  v8 = -[_BPSAbstractZipSide init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    objc_storeStrong((id *)&v8->_zip, a4);
  }

  return v9;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSAbstractZipSide zip](self, "zip");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveSubscription:index:", v4, -[_BPSAbstractZipSide index](self, "index"));

}

- (int64_t)receiveInput:(id)a3
{
  _BPSAbstractZipSide *v4;
  id v5;
  void *v6;
  int64_t v7;

  v4 = self;
  v5 = a3;
  -[_BPSAbstractZipSide zip](v4, "zip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "receiveInput:index:", v5, -[_BPSAbstractZipSide index](v4, "index"));

  return v7;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  void *v5;
  _BPSAbstractZipSide *v6;

  v6 = self;
  v4 = a3;
  -[_BPSAbstractZipSide zip](v6, "zip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveCompletion:index:", v4, -[_BPSAbstractZipSide index](v6, "index"));

}

- (_BPSAbstractZip)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
  objc_storeStrong((id *)&self->_zip, a3);
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
  objc_storeStrong((id *)&self->_zip, 0);
}

@end
