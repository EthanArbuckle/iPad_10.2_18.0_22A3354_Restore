@implementation _CNFlatMapEnumerator

- (_CNFlatMapEnumerator)initWithEnumerator:(id)a3 transform:(id)a4
{
  id v7;
  id v8;
  _CNFlatMapEnumerator *v9;
  _CNFlatMapEnumerator *v10;
  uint64_t v11;
  id transform;
  _CNFlatMapEnumerator *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNFlatMapEnumerator;
  v9 = -[_CNFlatMapEnumerator init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    v11 = objc_msgSend(v8, "copy");
    transform = v10->_transform;
    v10->_transform = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (id)nextObject
{
  void *v3;

  if (self->_buffer)
    goto LABEL_3;
  while (1)
  {
    -[_CNFlatMapEnumerator refillBuffer](self, "refillBuffer");
LABEL_3:
    -[_CNFlatMapEnumerator nextBufferedObject](self, "nextBufferedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      break;
    if (!self->_buffer)
    {
      v3 = 0;
      return v3;
    }
  }
  return v3;
}

- (id)nextBufferedObject
{
  return -[NSEnumerator nextObject](self->_buffer, "nextObject");
}

- (void)refillBuffer
{
  NSEnumerator *v3;
  NSEnumerator *buffer;
  id v5;

  -[NSEnumerator nextObject](self->_enumerator, "nextObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*((void (**)(void))self->_transform + 2))();
    v3 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    buffer = self->_buffer;
    self->_buffer = v3;
  }
  else
  {
    buffer = self->_buffer;
    self->_buffer = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
