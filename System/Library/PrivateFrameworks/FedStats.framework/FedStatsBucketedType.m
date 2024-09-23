@implementation FedStatsBucketedType

- (FedStatsBucketedType)initWithBucketBoundaries:(id)a3
{
  id v4;
  FedStatsBucketedType *v5;
  FedStatsBucketedType *v6;
  NSNumber *minValue;
  NSNumber *maxValue;
  NSNumber *bucketCount;
  uint64_t v10;
  NSArray *bucketBoundaries;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FedStatsBucketedType;
  v5 = -[FedStatsBoundedULongType initWithBound:](&v13, sel_initWithBound_, objc_msgSend(v4, "count"));
  v6 = v5;
  if (v5)
  {
    minValue = v5->_minValue;
    v5->_minValue = 0;

    maxValue = v6->_maxValue;
    v6->_maxValue = 0;

    bucketCount = v6->_bucketCount;
    v6->_bucketCount = 0;

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    bucketBoundaries = v6->_bucketBoundaries;
    v6->_bucketBoundaries = (NSArray *)v10;

    v6->_version = 1;
  }

  return v6;
}

- (FedStatsBucketedType)initWithMinValue:(id)a3 maxValue:(id)a4 bucketCount:(id)a5
{
  id v9;
  id v10;
  id v11;
  FedStatsBucketedType *v12;
  FedStatsBucketedType *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  double v20;
  uint64_t v21;
  NSNumber *stepSize;
  NSArray *bucketBoundaries;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)FedStatsBucketedType;
  v12 = -[FedStatsBoundedULongType initWithBound:](&v25, sel_initWithBound_, objc_msgSend(v11, "unsignedLongValue") + 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_minValue, a3);
    objc_storeStrong((id *)&v13->_maxValue, a4);
    objc_storeStrong((id *)&v13->_bucketCount, a5);
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "floatValue");
    v16 = v15;
    objc_msgSend(v9, "floatValue");
    v18 = v16 - v17;
    objc_msgSend(v11, "floatValue");
    *(float *)&v20 = v18 / v19;
    objc_msgSend(v14, "numberWithFloat:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    stepSize = v13->_stepSize;
    v13->_stepSize = (NSNumber *)v21;

    bucketBoundaries = v13->_bucketBoundaries;
    v13->_bucketBoundaries = 0;

    v13->_version = 2;
  }

  return v13;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  float v24;
  int v25;
  float v26;
  float v27;
  float v28;
  id *v29;
  unint64_t v31;
  void *v32;
  float v33;
  float v34;
  unint64_t v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  objc_class *v42;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("bucketBoundaries"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("minValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("maxValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("bucketCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    v12 = v9 == 0;
  else
    v12 = 1;
  v14 = !v12 && v10 != 0;
  if ((((v7 != 0) ^ v14) & 1) == 0)
  {
    if (!a4)
      goto LABEL_37;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("You can either have \"%@\" or the triple (\"%@\",\"%@\",\"%@\") as keys, not all"), CFSTR("bucketBoundaries"), CFSTR("minValue"), CFSTR("maxValue"), CFSTR("bucketCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 301;
    goto LABEL_35;
  }
  if (!v7)
  {
    objc_msgSend(v10, "floatValue");
    if (v24 == (float)(int)objc_msgSend(v11, "intValue"))
    {
      v42 = (objc_class *)a1;
      v25 = objc_msgSend(v11, "unsignedIntValue");
      if (v25 == objc_msgSend(v11, "intValue"))
      {
        if (objc_msgSend(v11, "unsignedIntValue"))
        {
          objc_msgSend(v8, "floatValue");
          v27 = v26;
          objc_msgSend(v9, "floatValue");
          if (v27 >= v28)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The value of \"%@\" must be less than the value of \"%@\"), CFSTR("minValue"), CFSTR("maxValue"));
            goto LABEL_47;
          }
          v29 = (id *)objc_msgSend([v42 alloc], "initWithMinValue:maxValue:bucketCount:", v8, v9, v11);
LABEL_43:
          a4 = v29;
          goto LABEL_37;
        }
      }
    }
    if (!a4)
      goto LABEL_37;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The value of \"%@\" must be a positive integer"), CFSTR("bucketCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 302;
LABEL_35:
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v22, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_36:
    a4 = 0;
    goto LABEL_37;
  }
  v41 = (objc_class *)a1;
  v43 = a4;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v43)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The item \"%@\" in the list for \"%@\" is not a number"), v20, CFSTR("bucketBoundaries"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v23);
            *v43 = (id)objc_claimAutoreleasedReturnValue();

          }
          a4 = 0;
          goto LABEL_37;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v17)
        continue;
      break;
    }
  }

  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {
    a4 = v43;
    if (v43)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("You must have at least 2 elements for \"%@\"), CFSTR("bucketBoundaries"), v40);
LABEL_47:
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v39);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
    goto LABEL_37;
  }
  a4 = v43;
  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {
LABEL_42:
    v29 = (id *)objc_msgSend([v41 alloc], "initWithBucketBoundaries:", v15);
    goto LABEL_43;
  }
  v31 = 1;
  while (1)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    v34 = v33;
    v35 = v31 - 1;
    objc_msgSend(v15, "objectAtIndexedSubscript:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    v38 = v37;

    if (v34 <= v38)
      break;
    v31 = v35 + 2;
    if (objc_msgSend(v15, "count") <= v31)
      goto LABEL_42;
  }
  if (v43)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The entries for \"%@\" must be monotonically increasing"), CFSTR("bucketBoundaries"), v40);
    goto LABEL_47;
  }
LABEL_37:

  return a4;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  float v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  uint64_t v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  float v43;
  float v44;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v18 = CFSTR("The encoder can only work with a number type");
      v19 = 401;
LABEL_18:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v19, v18);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_19:
    v9 = 0;
    goto LABEL_32;
  }
  objc_msgSend(v6, "floatValue");
  v11 = v10;
  if (-[FedStatsBucketedType version](self, "version") == 1)
  {
    -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    if (v11 < v14)
    {
LABEL_8:

LABEL_2:
      v9 = &unk_250C57A88;
      goto LABEL_32;
    }
    -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    if (v11 > v17)
    {

      goto LABEL_8;
    }

    -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    v30 = v29;

    if (v11 == v30)
    {
      v31 = (void *)MEMORY[0x24BDD16E0];
      -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v32, "count") - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_32;
    }
    -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count") - 1;

    if (v39 >= 2)
    {
      v40 = 0;
      do
      {
        -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndex:", (v39 + v40) >> 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "floatValue");
        v44 = v43;

        if (v11 < v44)
          v39 = (v39 + v40) >> 1;
        else
          v40 = (v39 + v40) >> 1;
      }
      while (v39 - v40 > 1);
    }
    v36 = (void *)MEMORY[0x24BDD16E0];
    v37 = v39;
    goto LABEL_30;
  }
  if (-[FedStatsBucketedType version](self, "version") != 2)
  {
    if (a4)
    {
      v18 = CFSTR("The encoder is malformed");
      v19 = 900;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  -[FedStatsBucketedType minValue](self, "minValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;

  -[FedStatsBucketedType maxValue](self, "maxValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v25 = v24;

  v9 = &unk_250C57A88;
  if (v11 >= v22 && v11 <= v25)
  {
    if (v11 == v25)
    {
      -[FedStatsBucketedType bucketCount](self, "bucketCount");
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_31:
      v9 = (void *)v26;
      goto LABEL_32;
    }
    -[FedStatsBucketedType stepSize](self, "stepSize");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "floatValue");
    v35 = (unint64_t)(float)((float)(v11 - v22) / v34);

    v36 = (void *)MEMORY[0x24BDD16E0];
    v37 = v35 + 1;
LABEL_30:
    objc_msgSend(v36, "numberWithUnsignedLong:", v37);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
LABEL_32:

  return v9;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v10 = CFSTR("The decoder can only work with a number type");
LABEL_9:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 500, v10);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  v8 = objc_msgSend(v6, "unsignedLongValue");
  if (v8 >= -[FedStatsBucketedType classCount](self, "classCount"))
  {
    if (a4)
    {
      v10 = CFSTR("The decoder requires a number less than the class count");
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v9 = objc_msgSend(v7, "unsignedLongValue");
  if (v9)
    -[FedStatsBucketedType sampleForIndex:](self, "sampleForIndex:", v9);
  else
    +[FedStatsBoundedULongType gFedStatsOutOfBoundsNumber](FedStatsBoundedULongType, "gFedStatsOutOfBoundsNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v11;
}

- (int64_t)dataType
{
  return 2;
}

- (id)indexToInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  double v17;
  void *v18;
  float v19;
  double v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    goto LABEL_7;
  if (-[FedStatsBucketedType version](self, "version") != 1)
  {
    if (-[FedStatsBucketedType version](self, "version") == 2)
    {
      -[FedStatsBucketedType minValue](self, "minValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v11;
      v13 = (float)(unint64_t)(objc_msgSend(v4, "unsignedLongValue") - 1);
      -[FedStatsBucketedType stepSize](self, "stepSize");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v16 = v12 + (float)(v13 * v15);

      *(float *)&v17 = v16;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v5;
      v18 = (void *)MEMORY[0x24BDD16E0];
      -[FedStatsBucketedType stepSize](self, "stepSize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      *(float *)&v20 = v16 + v19;
      objc_msgSend(v18, "numberWithFloat:", v20);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "unsignedLongValue") - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "unsignedLongValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_8:

  return v9;
}

- (unint64_t)classCount
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[FedStatsBucketedType version](self, "version");
  if (v3 == 2)
  {
    -[FedStatsBucketedType bucketCount](self, "bucketCount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntValue") + 1;
  }
  else
  {
    if (v3 != 1)
      return 0x7FFFFFFFFFFFFFFFLL;
    -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
  }

  return v5;
}

- (id)sampleForIndex:(unint64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  float v22;
  double v23;

  v5 = -[FedStatsBucketedType version](self, "version");
  if (v5 == 1)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (!a3)
    {
      objc_msgSend(v13, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      *(float *)&v12 = *(float *)&v12 + 1.0;
      goto LABEL_10;
    }
    objc_msgSend(v13, "objectAtIndex:", a3 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;
    -[FedStatsBucketedType bucketBoundaries](self, "bucketBoundaries");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    *(float *)&v20 = (float)(v16 + v19) * 0.5;
    objc_msgSend(v6, "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    return v21;
  }
  if (v5 == 2)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    if (a3)
    {
      -[FedStatsBucketedType minValue](self, "minValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v9 = v8;
      -[FedStatsBucketedType stepSize](self, "stepSize");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v9 + ((double)a3 + -0.5) * v11;
      *(float *)&v12 = v12;
LABEL_10:
      objc_msgSend(v6, "numberWithFloat:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    -[FedStatsBucketedType maxValue](self, "maxValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    *(float *)&v23 = v22 + 1.0;
    objc_msgSend(v6, "numberWithFloat:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v21 = 0;
  return v21;
}

- (NSArray)bucketBoundaries
{
  return self->_bucketBoundaries;
}

- (void)setBucketBoundaries:(id)a3
{
  objc_storeStrong((id *)&self->_bucketBoundaries, a3);
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id)a3
{
  objc_storeStrong((id *)&self->_minValue, a3);
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id)a3
{
  objc_storeStrong((id *)&self->_maxValue, a3);
}

- (NSNumber)bucketCount
{
  return self->_bucketCount;
}

- (void)setBucketCount:(id)a3
{
  objc_storeStrong((id *)&self->_bucketCount, a3);
}

- (NSNumber)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(id)a3
{
  objc_storeStrong((id *)&self->_stepSize, a3);
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepSize, 0);
  objc_storeStrong((id *)&self->_bucketCount, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_bucketBoundaries, 0);
}

@end
