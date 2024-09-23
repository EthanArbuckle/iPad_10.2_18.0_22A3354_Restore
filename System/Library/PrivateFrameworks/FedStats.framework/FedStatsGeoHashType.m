@implementation FedStatsGeoHashType

+ (unint64_t)geoHashCharToInteger:(char)a3
{
  uint64_t v3;

  v3 = a3 - 48;
  if (v3 > 0x4A)
    return -1;
  else
    return *(_QWORD *)&kFedStatsGeoHashMap[8 * v3 + 32];
}

- (FedStatsGeoHashType)initWithGeoHashLength:(unint64_t)a3
{
  FedStatsGeoHashType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FedStatsGeoHashType;
  result = -[FedStatsBoundedULongType initWithBound:](&v5, sel_initWithBound_, 1 << (5 * a3));
  if (result)
    result->_hashLength = a3;
  return result;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a3, "objectForKey:", CFSTR("hashLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!a4)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing key \"%@\"), CFSTR("hashLength"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 300;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v5, "doubleValue"), v7 = v6, objc_msgSend(v5, "doubleValue"), v7 != round(v8))
    || (v9 = objc_msgSend(v5, "unsignedLongValue"), v9 != objc_msgSend(v5, "longValue"))
    || !objc_msgSend(v5, "unsignedLongValue"))
  {
    if (!a4)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The value for key \"%@\" must be a positive integer"), CFSTR("hashLength"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 302;
LABEL_11:
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v11, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
    goto LABEL_12;
  }
  a4 = -[FedStatsGeoHashType initWithGeoHashLength:]([FedStatsGeoHashType alloc], "initWithGeoHashLength:", objc_msgSend(v5, "unsignedLongValue"));
LABEL_12:

  return a4;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = &unk_250C57B48;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("The geohash type accepts only a string to encode"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_18;
  }
  v10 = objc_msgSend(v6, "length");
  if (v10 > -[FedStatsGeoHashType hashLength](self, "hashLength"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This geohash encoder accepts hashes of length %lu"), -[FedStatsGeoHashType hashLength](self, "hashLength"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  v12 = 1;
  v13 = objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 1);
  if (-[FedStatsGeoHashType hashLength](self, "hashLength"))
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = +[FedStatsGeoHashType geoHashCharToInteger:](FedStatsGeoHashType, "geoHashCharToInteger:", *(char *)(v13 + v14));
      if (v17 == -1)
        break;
      v16 = v17 + 32 * v16;
      v14 = ++v15;
      if (-[FedStatsGeoHashType hashLength](self, "hashLength") <= v15)
      {
        v12 = v16 + 1;
        goto LABEL_15;
      }
    }
    v18 = (void *)MEMORY[0x24BDD16E0];
    v19 = 0;
  }
  else
  {
LABEL_15:
    v18 = (void *)MEMORY[0x24BDD16E0];
    v19 = v12;
  }
  objc_msgSend(v18, "numberWithUnsignedLong:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v9;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  int v10;
  void *v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "unsignedLongValue");
  if (v7 == objc_msgSend(v6, "longValue"))
  {
    if (v7)
    {
      v8 = v7 - 1;
      v9 = malloc_type_malloc(-[FedStatsGeoHashType hashLength](self, "hashLength") + 1, 0x100004077774924uLL);
      v9[-[FedStatsGeoHashType hashLength](self, "hashLength")] = 0;
      v10 = -[FedStatsGeoHashType hashLength](self, "hashLength");
      do
      {
        v9[--v10] = kFedStatsGeoHashMap[v8 & 0x1F];
        v8 >>= 5;
      }
      while ((_BYTE)v10);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      free(v9);
    }
    else
    {
      -[FedStatsGeoHashType sampleForIndex:](self, "sampleForIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 500, CFSTR("The geohash decoder accepts only positive integers"));
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)sampleForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsGeoHashType decodeFromIndex:possibleError:](self, "decodeFromIndex:possibleError:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(&stru_250C51910, "stringByPaddingToLength:withString:startingAtIndex:", -[FedStatsGeoHashType hashLength](self, "hashLength"), CFSTR("@"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)hashLength
{
  return self->_hashLength;
}

- (void)setHashLength:(unint64_t)a3
{
  self->_hashLength = a3;
}

@end
