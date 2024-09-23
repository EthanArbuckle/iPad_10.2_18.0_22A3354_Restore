@implementation IKArray

+ (id)array
{
  return objc_alloc_init((Class)a1);
}

- (IKArray)initWithNSArray:(id)a3
{
  id v4;
  IKArray *v5;
  IKArray *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKArray;
  v5 = -[IKArray init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[IKArray _setupWithNSArray:](v5, "_setupWithNSArray:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IKArray *v4;
  void *v5;
  IKArray *v6;

  if (-[IKArray isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  v4 = [IKArray alloc];
  -[IKArray toNSArray](self, "toNSArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKArray initWithNSArray:](v4, "initWithNSArray:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  IKMutableArray *v4;
  void *v5;
  IKMutableArray *v6;

  v4 = [IKMutableArray alloc];
  -[IKArray toNSArray](self, "toNSArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKArray initWithNSArray:](v4, "initWithNSArray:", v5);

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t var0;
  int64_t v14;
  unint64_t v15;
  id *v16;
  unint64_t v17;

  -[IKArray arrayStore](self, "arrayStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IKArray arrayStore](self, "arrayStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

    return v11;
  }
  else
  {
    var0 = a3->var0;
    v14 = -[IKArray count](self, "count");
    if (v14 - a3->var0 < a5)
      a5 = v14 - a3->var0;
    if (a5)
    {
      v15 = var0;
      v16 = a4;
      v17 = a5;
      do
      {
        *v16++ = -[IKArray objectAtIndex:](self, "objectAtIndex:", v15++);
        --v17;
      }
      while (v17);
    }
    a3->var0 = a5 + var0;
    a3->var1 = a4;
    a3->var2 = a3->var3;
    return a5;
  }
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (a3 < 0 || -[IKArray count](self, "count") <= a3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Index :%ld out of range"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise");

  }
  -[IKArray arrayStore](self, "arrayStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[IKArray arrayStore](self, "arrayStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 1)
    {
      -[IKArray obj1](self, "obj1");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
        v11 = 0;
        goto LABEL_12;
      }
      -[IKArray obj0](self, "obj0");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v12;
  }
LABEL_12:

  return v11;
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[IKArray arrayStore](self, "arrayStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[IKArray arrayStore](self, "arrayStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "indexOfObject:", v4);
    }
    else
    {
      -[IKArray obj1](self, "obj1");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqual:", v4) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        -[IKArray obj0](self, "obj0");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v4))
          v7 = 0;
        else
          v7 = 0x7FFFFFFFFFFFFFFFLL;

      }
    }

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)count
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  -[IKArray arrayStore](self, "arrayStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IKArray arrayStore](self, "arrayStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
  }
  else
  {
    -[IKArray obj1](self, "obj1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 2;
    }
    else
    {
      -[IKArray obj0](self, "obj0");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

    }
  }

  return v5;
}

- (id)firstObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[IKArray obj0](self, "obj0");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[IKArray arrayStore](self, "arrayStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)lastObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[IKArray obj1](self, "obj1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[IKArray obj0](self, "obj0");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[IKArray arrayStore](self, "arrayStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (id)objectEnumerator
{
  return -[_IKArrayEnumerator initWithArray:]([_IKArrayEnumerator alloc], "initWithArray:", self);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  -[IKArray arrayStore](self, "arrayStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IKArray arrayStore](self, "arrayStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v4);
LABEL_3:

    goto LABEL_4;
  }
  v10 = 0;
  -[IKArray obj0](self, "obj0");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[IKArray obj0](self, "obj0"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v4[2](v4, v8, 0, &v10),
        v8,
        !v10))
  {
    -[IKArray obj1](self, "obj1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[IKArray obj1](self, "obj1");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, 1, &v10);
      goto LABEL_3;
    }
  }
LABEL_4:

}

- (id)toNSArray
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[IKArray arrayStore](self, "arrayStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[IKArray obj1](self, "obj1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKArray obj0](self, "obj0");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v4)
    {
      v14[0] = v6;
      -[IKArray obj1](self, "obj1");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v8;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = (void **)v14;
      v11 = 2;
    }
    else
    {
      if (!v6)
      {
        v5 = 0;
        goto LABEL_8;
      }
      -[IKArray obj0](self, "obj0");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v8;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = &v13;
      v11 = 1;
    }
    objc_msgSend(v9, "arrayWithObjects:count:", v10, v11, v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_9;
  }
  -[IKArray arrayStore](self, "arrayStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
LABEL_9:

  return v5;
}

- (void)_setupWithNSArray:(id)a3
{
  uint64_t v4;
  NSMutableArray *v5;
  void *arrayStore;
  void *v7;
  id obj0;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "count");
  if (v4 >= 3)
  {
    v5 = (NSMutableArray *)objc_msgSend(v13, "mutableCopy");
    arrayStore = self->_arrayStore;
    self->_arrayStore = v5;
LABEL_7:

    v11 = v13;
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    obj0 = self->_obj0;
    self->_obj0 = v7;

    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    arrayStore = self->_obj1;
    self->_obj1 = v9;
    goto LABEL_7;
  }
  v10 = v4 < 1;
  v11 = v13;
  if (!v10)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    arrayStore = self->_obj0;
    self->_obj0 = v12;
    goto LABEL_7;
  }
LABEL_8:

}

- (id)obj0
{
  return self->_obj0;
}

- (void)setObj0:(id)a3
{
  objc_storeStrong(&self->_obj0, a3);
}

- (id)obj1
{
  return self->_obj1;
}

- (void)setObj1:(id)a3
{
  objc_storeStrong(&self->_obj1, a3);
}

- (NSMutableArray)arrayStore
{
  return self->_arrayStore;
}

- (void)setArrayStore:(id)a3
{
  objc_storeStrong((id *)&self->_arrayStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrayStore, 0);
  objc_storeStrong(&self->_obj1, 0);
  objc_storeStrong(&self->_obj0, 0);
}

@end
