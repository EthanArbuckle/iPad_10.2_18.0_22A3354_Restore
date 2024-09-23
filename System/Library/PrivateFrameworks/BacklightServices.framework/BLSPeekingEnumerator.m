@implementation BLSPeekingEnumerator

+ (id)peekingEnumeratorWithEnumerator:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = -[BLSPeekingEnumerator initWithEnumerator:]((id *)[BLSPeekingEnumerator alloc], v3);

  return v4;
}

- (id)initWithEnumerator:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BLSPeekingEnumerator;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)nextObject
{
  id v3;
  void *v4;
  id peekedObject;

  v3 = self->_peekedObject;
  if (v3)
  {
    v4 = v3;
    peekedObject = self->_peekedObject;
    self->_peekedObject = 0;

  }
  else
  {
    -[NSEnumerator nextObject](self->_enumerator, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)peekNextObject
{
  id *p_peekedObject;
  id v4;

  p_peekedObject = &self->_peekedObject;
  v4 = self->_peekedObject;
  if (!v4)
  {
    -[NSEnumerator nextObject](self->_enumerator, "nextObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(p_peekedObject, v4);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_peekedObject, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
