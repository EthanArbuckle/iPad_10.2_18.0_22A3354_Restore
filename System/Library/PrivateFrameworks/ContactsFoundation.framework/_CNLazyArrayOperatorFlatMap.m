@implementation _CNLazyArrayOperatorFlatMap

- (_CNLazyArrayOperatorFlatMap)initWithInput:(id)a3 transform:(id)a4
{
  id v6;
  _CNLazyArrayOperatorFlatMap *v7;
  uint64_t v8;
  id transform;
  CNQueue *v10;
  CNQueue *buffer;
  _CNLazyArrayOperatorFlatMap *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CNLazyArrayOperatorFlatMap;
  v7 = -[_CNLazyArrayOperator initWithInput:](&v14, sel_initWithInput_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    transform = v7->_transform;
    v7->_transform = (id)v8;

    v10 = objc_alloc_init(CNQueue);
    buffer = v7->_buffer;
    v7->_buffer = v10;

    v12 = v7;
  }

  return v7;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[CNQueue count](self->_buffer, "count"))
  {
    -[CNQueue dequeue](self->_buffer, "dequeue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
    while (1)
    {
      -[_CNLazyArrayOperator input](self, "input");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nextObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        break;
      (*((void (**)(void))self->_transform + 2))();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v7;
      if (objc_msgSend(v7, "count"))
      {
        -[CNQueue enqueueObjectsFromArray:](self->_buffer, "enqueueObjectsFromArray:", v7);
        -[CNQueue dequeue](self->_buffer, "dequeue");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v7;
        goto LABEL_8;
      }
    }
    v3 = 0;
LABEL_8:

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong(&self->_transform, 0);
}

@end
