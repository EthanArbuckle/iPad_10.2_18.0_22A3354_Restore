@implementation _HFSetContainer

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t (**v4)(_QWORD, _QWORD);
  void *v5;
  unint64_t v6;

  -[_HFSetContainer hashGenerator](self, "hashGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_HFSetContainer hashGenerator](self, "hashGenerator");
    v4 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[_HFSetContainer object](self, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ((uint64_t (**)(_QWORD, void *))v4)[2](v4, v5);

  }
  else
  {
    -[_HFSetContainer object](self, "object");
    v4 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hash");
  }

  return v6;
}

- (id)hashGenerator
{
  return self->_hashGenerator;
}

- (BOOL)isEqual:(id)a3
{
  _HFSetContainer *v4;
  void *v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  char v9;

  v4 = (_HFSetContainer *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_HFSetContainer object](v4, "object");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HFSetContainer comparator](self, "comparator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[_HFSetContainer comparator](self, "comparator");
        v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[_HFSetContainer object](self, "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v8, v5);

      }
      else
      {
        -[_HFSetContainer object](self, "object");
        v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v5);
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)object
{
  return self->_object;
}

- (id)comparator
{
  return self->_comparator;
}

+ (id)containerWithObject:(id)a3 atIndex:(unint64_t)a4 comparator:(id)a5 hashGenerator:(id)a6
{
  id v9;
  id v10;
  id v11;
  _HFSetContainer *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(_HFSetContainer);
  -[_HFSetContainer setObject:](v12, "setObject:", v11);

  -[_HFSetContainer setIndex:](v12, "setIndex:", a4);
  -[_HFSetContainer setComparator:](v12, "setComparator:", v10);

  -[_HFSetContainer setHashGenerator:](v12, "setHashGenerator:", v9);
  return v12;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void)setHashGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashGenerator, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
