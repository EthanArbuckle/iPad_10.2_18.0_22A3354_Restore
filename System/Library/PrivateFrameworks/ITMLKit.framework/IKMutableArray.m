@implementation IKMutableArray

- (IKMutableArray)initWithCapacity:(int64_t)a3
{
  IKMutableArray *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKMutableArray;
  result = -[IKMutableArray init](&v5, sel_init);
  if (result)
    result->_expectedCapacity = a3;
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[IKMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a4);
  -[IKMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v6, a4);

}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  -[IKMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v4, -[IKArray count](self, "count"));

}

- (void)removeObject:(id)a3
{
  unint64_t v4;

  v4 = -[IKArray indexOfObject:](self, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[IKMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v4);
}

- (void)insertObject:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  if (!v14)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot insert nil object"), v13);
    goto LABEL_6;
  }
  if (a4 < 0 || -[IKArray count](self, "count") < a4)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Index :%ld out of range"), a4);
LABEL_6:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  if (-[IKArray count](self, "count") == 2)
    -[IKMutableArray _convertToArrayStore](self, "_convertToArrayStore");
  -[IKArray arrayStore](self, "arrayStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IKArray arrayStore](self, "arrayStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", v14, a4);

  }
  else if (a4)
  {
    -[IKArray setObj1:](self, "setObj1:", v14);
  }
  else
  {
    -[IKArray obj0](self, "obj0");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKArray setObj1:](self, "setObj1:", v12);

    -[IKArray setObj0:](self, "setObj0:", v14);
  }

}

- (void)removeObjectAtIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

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
    objc_msgSend(v10, "removeObjectAtIndex:", a3);

    -[IKArray arrayStore](self, "arrayStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 == 2)
    {
      -[IKArray arrayStore](self, "arrayStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKArray setObj0:](self, "setObj0:", v14);

      -[IKArray arrayStore](self, "arrayStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKArray setObj1:](self, "setObj1:", v16);

      -[IKArray setArrayStore:](self, "setArrayStore:", 0);
    }
  }
  else
  {
    if (!a3)
    {
      -[IKArray obj1](self, "obj1");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKArray setObj0:](self, "setObj0:", v17);

    }
    -[IKArray setObj1:](self, "setObj1:", 0);
  }
}

- (void)addObjectsFromArray:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "obj0");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "obj0");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKMutableArray addObject:](self, "addObject:", v5);

    objc_msgSend(v10, "obj1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v10, "obj1");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKMutableArray addObject:](self, "addObject:", v7);
LABEL_6:

    }
  }
  else
  {
    objc_msgSend(v10, "arrayStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[IKMutableArray _convertToArrayStore](self, "_convertToArrayStore");
      -[IKArray arrayStore](self, "arrayStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v9);

      goto LABEL_6;
    }
  }

}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "obj0");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v13, "obj0");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v8, objc_msgSend(v6, "firstIndex"));

    objc_msgSend(v13, "obj1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v13, "obj1");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v10, objc_msgSend(v6, "lastIndex"));
LABEL_6:

    }
  }
  else
  {
    objc_msgSend(v13, "arrayStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[IKMutableArray _convertToArrayStore](self, "_convertToArrayStore");
      -[IKArray arrayStore](self, "arrayStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertObjects:atIndexes:", v12, v6);

      goto LABEL_6;
    }
  }

}

- (void)removeObjectsAtIndexes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  id v14;

  v14 = a3;
  -[IKArray arrayStore](self, "arrayStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IKArray arrayStore](self, "arrayStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectsAtIndexes:", v14);

    -[IKArray arrayStore](self, "arrayStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 <= 2)
    {
      if (v7 == 1)
      {
        -[IKArray arrayStore](self, "arrayStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKArray setObj0:](self, "setObj0:", v11);
      }
      else
      {
        if (v7 != 2)
        {
LABEL_12:
          -[IKArray setArrayStore:](self, "setArrayStore:", 0);
          goto LABEL_13;
        }
        -[IKArray arrayStore](self, "arrayStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKArray setObj0:](self, "setObj0:", v9);

        -[IKArray arrayStore](self, "arrayStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKArray setObj1:](self, "setObj1:", v11);
      }

      goto LABEL_12;
    }
  }
  else
  {
    v12 = objc_msgSend(v14, "lastIndex");
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v12; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v14, "indexLessThanIndex:", i))
        -[IKMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", i);
    }
  }
LABEL_13:

}

- (void)_convertToArrayStore
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = -[IKMutableArray expectedCapacity](self, "expectedCapacity");
  if (v4)
    v5 = v4;
  else
    v5 = 2;
  objc_msgSend(v3, "arrayWithCapacity:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[IKArray obj0](self, "obj0");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IKArray obj0](self, "obj0");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v7);

    -[IKArray setObj0:](self, "setObj0:", 0);
    -[IKArray obj1](self, "obj1");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[IKArray obj1](self, "obj1");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

      -[IKArray setObj1:](self, "setObj1:", 0);
    }
  }
  -[IKArray setArrayStore:](self, "setArrayStore:", v10);

}

- (int64_t)expectedCapacity
{
  return self->_expectedCapacity;
}

@end
