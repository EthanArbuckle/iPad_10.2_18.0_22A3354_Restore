@implementation EFMeasuredObject

+ (id)object:(id)a3 withMeasure:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:measure:", v5, a4);

  return v6;
}

- (EFMeasuredObject)initWithObject:(id)a3 measure:(double)a4
{
  id v6;
  EFMeasuredObject *v7;
  EFMeasuredObject *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EFMeasuredObject;
  v7 = -[EFMeasuredObject init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[EFMeasuredObject setMeasure:](v7, "setMeasure:", a4);
    -[EFMeasuredObject setObject:](v8, "setObject:", v6);
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EFMeasuredObject measure](self, "measure");
  v6 = v5;
  -[EFMeasuredObject object](self, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %lf: %@>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  void *v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFMeasuredObject.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[otherObject isKindOfClass:[EFMeasuredObject class]]"));

  }
  -[EFMeasuredObject measure](self, "measure");
  v7 = v6;
  objc_msgSend(v5, "measure");
  if (v7 >= v8)
  {
    -[EFMeasuredObject measure](self, "measure");
    v11 = v10;
    objc_msgSend(v5, "measure");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

+ (id)max:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "measure", (_QWORD)v14);
        v10 = v9;
        objc_msgSend(v4, "measure");
        if (v10 > v11)
        {
          v12 = v8;

          v4 = v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v4;
}

+ (id)reverseSortedObjects:(id)a3 limit:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a4)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", 0, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

uint64_t __47__EFMeasuredObject_reverseSortedObjects_limit___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (double)measure
{
  return self->_measure;
}

- (void)setMeasure:(double)a3
{
  self->_measure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
