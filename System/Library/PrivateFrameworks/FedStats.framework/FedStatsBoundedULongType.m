@implementation FedStatsBoundedULongType

- (FedStatsBoundedULongType)initWithBound:(unint64_t)a3
{
  FedStatsBoundedULongType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FedStatsBoundedULongType;
  result = -[FedStatsBoundedULongType init](&v5, sel_init);
  if (result)
    result->_bound = a3;
  return result;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a3, "objectForKey:", CFSTR("bound"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedLongValue");
    if (!a4 || v8 < 0x20000001)
    {
      a4 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithBound:", objc_msgSend(v7, "unsignedLongValue"));
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The value for \"%@\" must be less than %lu"), CFSTR("bound"), 0x20000000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 302;
    goto LABEL_7;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The key \"%@\" is missing"), CFSTR("bound"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 300;
LABEL_7:
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v10, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_9:

  return a4;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v7 = objc_msgSend(v6, "longValue"), v7 == objc_msgSend(v6, "unsignedLongValue")))
  {
    v8 = objc_msgSend(v6, "unsignedLongValue");
    if (v8 + 1 <= -[FedStatsBoundedULongType bound](self, "bound"))
      v9 = v8 + 1;
    else
      v9 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("The encoder can only work with a positive integer"));
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedLongValue");
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = &unk_250C57A70;
    }
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 500, CFSTR("The decoder can only work with a number type"));
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v12;

  -[FedStatsBoundedULongType encodeToIndex:possibleError:](self, "encodeToIndex:possibleError:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedLongValue");
    v8 = -[FedStatsBoundedULongType classCount](self, "classCount");
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    objc_msgSend(v9, "replaceBytesInRange:withBytes:", v7, 1, &v12);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v11;

  v6 = a3;
  v11 = 0;
  if (objc_msgSend(v6, "length"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v6, "getBytes:range:", &v11, v7, 1);
      if (v11)
        break;
      if (++v7 >= (unint64_t)objc_msgSend(v6, "length"))
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsBoundedULongType decodeFromIndex:possibleError:](self, "decodeFromIndex:possibleError:", v9, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    if (a4)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("Only one factor in the input vector must be non-zero."));
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)classCount
{
  return -[FedStatsBoundedULongType bound](self, "bound") + 1;
}

- (int64_t)dataType
{
  return 1;
}

+ (id)gFedStatsOutOfBoundsNumber
{
  return &unk_250C57A70;
}

- (id)sampleForIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)MEMORY[0x24BDD16E0];
  if (a3)
    v4 = a3 - 1;
  else
    v4 = -[FedStatsBoundedULongType bound](self, "bound");
  return (id)objc_msgSend(v3, "numberWithUnsignedLong:", v4);
}

- (unint64_t)bound
{
  return self->_bound;
}

- (void)setBound:(unint64_t)a3
{
  self->_bound = a3;
}

@end
