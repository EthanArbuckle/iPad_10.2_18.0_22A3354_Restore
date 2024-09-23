@implementation NTKPigmentEditOptionArray

- (NTKPigmentEditOptionArray)init
{
  return -[NTKPigmentEditOptionArray initWithEquality:](self, "initWithEquality:", 0);
}

- (NTKPigmentEditOptionArray)initWithEquality:(unint64_t)a3
{
  NTKPigmentEditOptionArray *v4;
  NTKPigmentEditOptionArray *v5;
  uint64_t v6;
  NSMutableArray *backing;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKPigmentEditOptionArray;
  v4 = -[NTKPigmentEditOptionArray init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_equality = a3;
    v6 = objc_opt_new();
    backing = v5->_backing;
    v5->_backing = (NSMutableArray *)v6;

  }
  return v5;
}

+ (id)array
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (NTKPigmentEditOptionArray)arrayWithEquality:(unint64_t)a3
{
  return (NTKPigmentEditOptionArray *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEquality:", a3);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_backing, "count");
}

- (unint64_t)indexOfPigment:(id)a3
{
  id v4;
  NSMutableArray *backing;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  backing = self->_backing;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__NTKPigmentEditOptionArray_indexOfPigment___block_invoke;
  v9[3] = &unk_1E6BD8D98;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](backing, "enumerateObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __44__NTKPigmentEditOptionArray_indexOfPigment___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  char v9;
  int v10;
  id v11;
  id v12;

  v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v8 == 1)
  {
    v12 = v7;
    v10 = objc_msgSend(*(id *)(a1 + 40), "isEqual:", v7);
    v7 = v12;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
    goto LABEL_7;
  }
  if (!v8)
  {
    v11 = v7;
    v9 = objc_msgSend(*(id *)(a1 + 40), "isEqualIgnoringFraction:", v7);
    v7 = v11;
    if ((v9 & 1) != 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (id)pigmentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_backing, "objectAtIndex:", a3);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_backing, "objectAtIndexedSubscript:", a3);
}

- (id)pigmentForPigment:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = -[NTKPigmentEditOptionArray indexOfPigment:](self, "indexOfPigment:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
  }
  else
  {
    -[NTKPigmentEditOptionArray pigmentAtIndex:](self, "pigmentAtIndex:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)containsPigment:(id)a3
{
  return -[NTKPigmentEditOptionArray indexOfPigment:](self, "indexOfPigment:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumeratePigmentsUsingBlock:(id)a3
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_backing, "enumerateObjectsUsingBlock:", a3);
}

- (void)enumeratePigmentsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](self->_backing, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)addPigment:(id)a3
{
  unint64_t v4;
  NSMutableArray *backing;
  id v6;

  v6 = a3;
  v4 = -[NTKPigmentEditOptionArray indexOfPigment:](self, "indexOfPigment:");
  backing = self->_backing;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray addObject:](backing, "addObject:", v6);
  else
    -[NSMutableArray replaceObjectAtIndex:withObject:](backing, "replaceObjectAtIndex:withObject:", v4, v6);

}

- (void)insertPigment:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v6;
  NSMutableArray *backing;
  id v8;

  v8 = a3;
  v6 = -[NTKPigmentEditOptionArray indexOfPigment:](self, "indexOfPigment:");
  backing = self->_backing;
  if (v6 == a4)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](backing, "replaceObjectAtIndex:withObject:", a4, v8);
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](backing, "removeObjectAtIndex:");
    -[NSMutableArray insertObject:atIndex:](self->_backing, "insertObject:atIndex:", v8, a4);
  }

}

- (void)removePigment:(id)a3
{
  unint64_t v4;

  v4 = -[NTKPigmentEditOptionArray indexOfPigment:](self, "indexOfPigment:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_backing, "removeObjectAtIndex:", v4);
}

- (void)removePigmentAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_backing, "removeObjectAtIndex:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_backing, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t i;
  void *v8;
  void *v9;
  unint64_t equality;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NTKPigmentEditOptionArray equality](self, "equality"), v5 == objc_msgSend(v4, "equality"))
    && (v6 = -[NTKPigmentEditOptionArray count](self, "count"), v6 == objc_msgSend(v4, "count")))
  {
    if (-[NTKPigmentEditOptionArray count](self, "count"))
    {
      for (i = 0; i < -[NTKPigmentEditOptionArray count](self, "count"); ++i)
      {
        -[NTKPigmentEditOptionArray pigmentAtIndex:](self, "pigmentAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "pigmentAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        equality = self->_equality;
        if (equality == 1)
        {
          if (!objc_msgSend(v8, "isEqual:", v9))
            goto LABEL_13;
        }
        else if (!equality && (objc_msgSend(v8, "isEqualIgnoringFraction:", v9) & 1) == 0)
        {
LABEL_13:

          goto LABEL_14;
        }

      }
    }
    v11 = 1;
  }
  else
  {
LABEL_14:
    v11 = 0;
  }

  return v11;
}

- (unint64_t)equality
{
  return self->_equality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

@end
