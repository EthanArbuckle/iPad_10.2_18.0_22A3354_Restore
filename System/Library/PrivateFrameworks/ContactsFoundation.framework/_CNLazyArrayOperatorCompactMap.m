@implementation _CNLazyArrayOperatorCompactMap

- (_CNLazyArrayOperatorCompactMap)initWithInput:(id)a3 transform:(id)a4
{
  id v6;
  _CNLazyArrayOperatorCompactMap *v7;
  uint64_t v8;
  id transform;
  _CNLazyArrayOperatorCompactMap *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNLazyArrayOperatorCompactMap;
  v7 = -[_CNLazyArrayOperator initWithInput:](&v12, sel_initWithInput_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    transform = v7->_transform;
    v7->_transform = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;

  while (1)
  {
    -[_CNLazyArrayOperator input](self, "input");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    (*((void (**)(void))self->_transform + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return v5;
  }
  v5 = 0;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
}

@end
