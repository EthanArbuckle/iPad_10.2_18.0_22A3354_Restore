@implementation AFBArray

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (self->_count <= a3)
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@ index %tu out of range for array of size %tu"), v8, a3, self->_count);

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  return (id)(*((uint64_t (**)(void))self->_objectAtIndex + 2))();
}

- (AFBArray)initWithBufRef:(id)a3 count:(unint64_t)a4 objectAtIndex:(id)a5
{
  id v9;
  id v10;
  AFBArray *v11;
  AFBArray *v12;
  uint64_t v13;
  id objectAtIndex;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AFBArray;
  v11 = -[AFBArray init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bufRef, a3);
    v12->_count = a4;
    v13 = MEMORY[0x2207C94F0](v10);
    objectAtIndex = v12->_objectAtIndex;
    v12->_objectAtIndex = (id)v13;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectAtIndex, 0);
  objc_storeStrong((id *)&self->_bufRef, 0);
}

- (AFBArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  AFBArray *v5;

  v5 = (AFBArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", a3, a4);

  return v5;
}

- (AFBArray)initWithCoder:(id)a3
{
  AFBArray *result;

  result = (AFBArray *)a3;
  __break(1u);
  return result;
}

@end
