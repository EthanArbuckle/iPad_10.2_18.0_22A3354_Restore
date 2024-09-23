@implementation CMIArrayWithDefaultArray

- (CMIArrayWithDefaultArray)initWithMainArray:(id)a3 defaultArray:(id)a4
{
  id v7;
  id v8;
  CMIArrayWithDefaultArray *v9;
  CMIArrayWithDefaultArray *v10;
  unint64_t v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMIArrayWithDefaultArray;
  v9 = -[CMIArrayWithDefaultArray init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainArray, a3);
    objc_storeStrong((id *)&v10->_defaultArray, a4);
    v11 = objc_msgSend(v7, "count");
    if (v11 <= objc_msgSend(v8, "count"))
      v12 = v8;
    else
      v12 = v7;
    v10->_count = objc_msgSend(v12, "count");
  }

  return v10;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (-[NSArray count](self->_mainArray, "count") <= a3
    || (-[NSArray objectAtIndex:](self->_mainArray, "objectAtIndex:", a3),
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (-[NSArray count](self->_defaultArray, "count") <= a3)
      objc_exception_throw(objc_retainAutorelease((id)*MEMORY[0x1E0C99858]));
    -[NSArray objectAtIndex:](self->_defaultArray, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    goto LABEL_19;
  }
  v6 = (void *)v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:
      v8 = v6;
LABEL_19:
      cmiMergedObject(v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (-[NSArray count](self->_defaultArray, "count") <= a3)
    {
      v7 = 0;
    }
    else
    {
      -[NSArray objectAtIndex:](self->_defaultArray, "objectAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v6, "count");
      if (v10 == objc_msgSend(v7, "count"))
        goto LABEL_13;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (-[NSArray count](self->_defaultArray, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_defaultArray, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
LABEL_13:
  cmiMergedObject(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v9;
}

- (NSArray)mainArray
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)defaultArray
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultArray, 0);
  objc_storeStrong((id *)&self->_mainArray, 0);
}

@end
