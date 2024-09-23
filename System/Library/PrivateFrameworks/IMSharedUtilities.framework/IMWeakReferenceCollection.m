@implementation IMWeakReferenceCollection

- (IMWeakReferenceCollection)init
{
  IMWeakReferenceCollection *v2;
  uint64_t v3;
  NSMutableArray *list;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMWeakReferenceCollection;
  v2 = -[IMWeakReferenceCollection init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    list = v2->_list;
    v2->_list = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v10 = 0;
  if (v4)
  {
    v5 = -[NSMutableArray count](self->_list, "count");
    if (v5 - 1 >= 0)
    {
      v6 = v5;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_list, "objectAtIndex:", --v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          if (!v10)
          {
            objc_msgSend(v7, "object");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v9, &v10);

          }
        }
        else
        {
          -[NSMutableArray removeObjectAtIndex:](self->_list, "removeObjectAtIndex:", v6);
        }

      }
      while (v6 > 0);
    }
  }

}

- (unint64_t)count
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19E2EAB7C;
  v4[3] = &unk_1E3FB8488;
  v4[4] = &v5;
  -[IMWeakReferenceCollection enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E2EAC5C;
  v7[3] = &unk_1E3FB84B0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[IMWeakReferenceCollection enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)addObject:(id)a3
{
  id v4;
  BOOL v5;
  NSMutableArray *list;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = -[IMWeakReferenceCollection containsObject:](self, "containsObject:", v4);
    v4 = v8;
    if (!v5)
    {
      list = self->_list;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36B18]), "initRefWithObject:", v8);
      -[NSMutableArray addObject:](list, "addObject:", v7);

      v4 = v8;
    }
  }

}

- (void)removeObject:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = -[NSMutableArray count](self->_list, "count");
  if (v4 - 1 >= 0)
  {
    v5 = v4;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_list, "objectAtIndex:", --v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "object");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7
        || (v8 = (void *)v7,
            objc_msgSend(v6, "object"),
            v9 = (id)objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9 == v10))
      {
        -[NSMutableArray removeObjectAtIndex:](self->_list, "removeObjectAtIndex:", v5);
      }

    }
    while (v5 > 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

@end
