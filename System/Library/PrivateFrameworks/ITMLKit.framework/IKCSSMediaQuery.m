@implementation IKCSSMediaQuery

- (IKCSSMediaQuery)initWithQueryList:(id)a3
{
  id v5;
  IKCSSMediaQuery *v6;
  IKCSSMediaQuery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKCSSMediaQuery;
  v6 = -[IKCSSMediaQuery init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_evaluated = 0;
    objc_storeStrong((id *)&v6->_queryList, a3);
  }

  return v7;
}

- (id)queryExpression
{
  void *v2;
  void *v3;

  -[IKCSSMediaQuery queryList](self, "queryList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expressionAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)evaluate
{
  BOOL result;

  if (self->_evaluated)
    return self->_evaluationResult;
  result = -[IKCSSMediaQueryList evaluate](self->_queryList, "evaluate");
  self->_evaluationResult = result;
  self->_evaluated = 1;
  return result;
}

- (void)setNeedsReEvaluation
{
  self->_evaluated = 0;
}

- (id)description
{
  return (id)-[IKCSSMediaQueryList description](self->_queryList, "description");
}

+ (id)mediaQueryFromTokenList:(id)a3
{
  id v3;
  IKCSSMediaQuery *v4;
  void *v5;
  IKCSSMediaQuery *v6;
  uint64_t v8;

  v8 = 0;
  v3 = a3;
  v4 = [IKCSSMediaQuery alloc];
  +[IKCSSMediaQuery buildMediaQueryList:offset:consumed:](IKCSSMediaQuery, "buildMediaQueryList:offset:consumed:", v3, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[IKCSSMediaQuery initWithQueryList:](v4, "initWithQueryList:", v5);
  return v6;
}

+ (id)buildMediaQueryList:(id)a3 offset:(unint64_t)a4 consumed:(unint64_t *)a5
{
  id v7;
  IKCSSMediaQueryOrList *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v7 = a3;
  v8 = objc_alloc_init(IKCSSMediaQueryOrList);
  if (objc_msgSend(v7, "count") <= a4)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    do
    {
      v13 = 0;
      +[IKCSSMediaQuery buildMediaQuery:offset:consumed:](IKCSSMediaQuery, "buildMediaQuery:offset:consumed:", v7, a4, &v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSMediaQueryOrList addSubQueryList:](v8, "addSubQueryList:", v10);
      v11 = v13;

      a4 += v11 + 1;
      v9 += v11 + 1;
    }
    while (a4 < objc_msgSend(v7, "count"));
  }
  *a5 = v9;

  return v8;
}

+ (id)buildMediaQuery:(id)a3 offset:(unint64_t)a4 consumed:(unint64_t *)a5
{
  id v7;
  IKCSSMediaQueryAndList *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = objc_alloc_init(IKCSSMediaQueryAndList);
  v9 = 0;
  if (objc_msgSend(v7, "count") > a4)
  {
    v10 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", a4 + v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "type") == 1)
        break;
      if (objc_msgSend(v11, "type") == 6)
      {
        if ((v10 & 1) == 0)
          -[IKCSSMediaQueryAndList setType:](v8, "setType:", CFSTR("all"));
        +[IKCSSMediaQuery buildMediaQueryExpression:](IKCSSMediaQuery, "buildMediaQueryExpression:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKCSSMediaQueryAndList type](v8, "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setMediaType:", v15);

        -[IKCSSMediaQueryAndList addQuery:](v8, "addQuery:", v12);
LABEL_13:
        v10 = 1;
        goto LABEL_14;
      }
LABEL_15:

      ++v9;
      if (a4 + v9 >= objc_msgSend(v7, "count"))
        goto LABEL_19;
    }
    objc_msgSend(v11, "token");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "type") != 1)
    {
      if (objc_msgSend(v12, "type") == 14)
      {

        goto LABEL_19;
      }
      if (!((objc_msgSend(v12, "type") != 18) | v10 & 1))
      {
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("not"));

        if (!v14)
        {
          objc_msgSend(v12, "stringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[IKCSSMediaQueryAndList setType:](v8, "setType:", v16);

          goto LABEL_13;
        }
        -[IKCSSMediaQueryAndList setNegated:](v8, "setNegated:", 1);
        v10 = 0;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_19:
  *a5 = v9;

  return v8;
}

+ (id)buildMediaQueryExpression:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  IKCSSMediaQueryExpression *v26;
  void *v27;
  id v29;
  id v30;
  char v31;
  void *v32;

  v3 = a3;
  objc_msgSend(v3, "cssValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    v6 = 0;
    v32 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0.0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "type") != 1)
      {
        v13 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v11, "token");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "type") == 1)
        goto LABEL_5;
      v14 = objc_msgSend(v12, "type");
      if (!v6)
      {
        if (v14 == 18)
        {
          objc_msgSend(v12, "stringValue");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 0;
          v8 = 4;
          goto LABEL_16;
        }
        v6 = 0;
LABEL_5:
        v13 = 0;
        goto LABEL_16;
      }
      if (!v5)
      {
        v13 = 0;
        v5 = v14 == 21;
        goto LABEL_16;
      }
      if (v14 == 18 || objc_msgSend(v12, "type") == 3)
      {
        objc_msgSend(v12, "stringValue");
        v15 = objc_claimAutoreleasedReturnValue();

        v8 = 1;
        v9 = (void *)v15;
        v13 = 1;
LABEL_12:
        v5 = 1;
        goto LABEL_16;
      }
      if (objc_msgSend(v12, "type") == 11)
      {
        objc_msgSend(v12, "doubleValue");
        v10 = v16;
        objc_msgSend(v12, "properties");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v13 = v17 != 0;
        if (v17)
        {
          objc_msgSend(v17, "objectForKey:", CFSTR("unit"));
          v29 = v3;
          v19 = objc_claimAutoreleasedReturnValue();

          v8 = 3;
          v32 = (void *)v19;
          v3 = v29;
        }

        goto LABEL_12;
      }
      if (objc_msgSend(v12, "type") != 13)
      {
        v13 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v12, "doubleValue");
      v10 = v20;
      v21 = v7 + 1;
      if (v7 + 1 >= (unint64_t)objc_msgSend(v4, "count"))
      {
        v13 = 0;
        v5 = 1;
        v8 = 2;
        goto LABEL_16;
      }
      v30 = v3;
      v13 = 0;
      v31 = 0;
      while (1)
      {
        objc_msgSend(v4, "objectAtIndex:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "type") == 1)
          break;
LABEL_37:

        ++v21;
        v5 = 1;
        if (v21 >= objc_msgSend(v4, "count"))
          goto LABEL_42;
      }
      objc_msgSend(v22, "token");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "type") == 1)
        goto LABEL_36;
      v24 = objc_msgSend(v23, "type");
      if ((v31 & 1) != 0)
        break;
      if (v24 == 5 && objc_msgSend(v23, "charValue") == 47)
        goto LABEL_35;

      v5 = 1;
LABEL_42:
      v8 = 2;
      v3 = v30;
LABEL_16:

LABEL_17:
      if (++v7 >= (unint64_t)objc_msgSend(v4, "count") || v13)
      {
        if (v8)
        {
          v26 = objc_alloc_init(IKCSSMediaQueryExpression);
          -[IKCSSMediaQueryExpression setType:](v26, "setType:", v8);
          -[IKCSSMediaQueryExpression setKey:](v26, "setKey:", v6);
          if (v8 == 1)
          {
            -[IKCSSMediaQueryExpression setStringValue:](v26, "setStringValue:", v9);
            goto LABEL_50;
          }
          -[IKCSSMediaQueryExpression setDoubleValue:](v26, "setDoubleValue:", v10);
          if (v8 == 3)
          {
            v27 = v32;
            -[IKCSSMediaQueryExpression setDimension:](v26, "setDimension:", v32);
            goto LABEL_51;
          }
        }
        else
        {
          v26 = 0;
        }
LABEL_50:
        v27 = v32;
        goto LABEL_51;
      }
    }
    if (v24 == 13)
    {
      objc_msgSend(v23, "doubleValue");
      v13 = 1;
      v31 = 1;
      v10 = v10 / v25;
    }
    else
    {
LABEL_35:
      v31 = 1;
    }
LABEL_36:

    goto LABEL_37;
  }
  v6 = 0;
  v27 = 0;
  v9 = 0;
  v26 = 0;
LABEL_51:

  return v26;
}

- (BOOL)evaluated
{
  return self->_evaluated;
}

- (BOOL)evaluationResult
{
  return self->_evaluationResult;
}

- (IKCSSMediaQueryList)queryList
{
  return self->_queryList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryList, 0);
}

@end
