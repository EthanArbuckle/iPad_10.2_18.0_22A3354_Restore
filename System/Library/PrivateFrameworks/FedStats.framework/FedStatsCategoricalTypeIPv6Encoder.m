@implementation FedStatsCategoricalTypeIPv6Encoder

- (FedStatsCategoricalTypeIPv6Encoder)initWithSignificantBitCount:(unint64_t)a3
{
  FedStatsCategoricalTypeIPv6Encoder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FedStatsCategoricalTypeIPv6Encoder;
  result = -[FedStatsCategoricalTypeIPv6Encoder init](&v5, sel_init);
  if (result)
    result->_significantBitCount = a3;
  return result;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "objectForKey:", CFSTR("significantBitCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 56);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = v6;
  if (objc_msgSend(v6, "integerValue") > 0)
  {
LABEL_6:
    a4 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithSignificantBitCount:", objc_msgSend(v7, "unsignedIntegerValue"));
    goto LABEL_7;
  }
  if (a4)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Parameter '%@' must be positive in %@ constructor"), CFSTR("significantBitCount"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_7:

  return a4;
}

- (id)preEncode:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __CFString *v17;
  void *v19;
  void *v20;
  FedStatsCategoricalTypeIPv6Encoder *v21;
  unsigned int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v4, "count") == 6)
  {
    v21 = self;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = &stru_250C51910;
      v9 = *(_QWORD *)v24;
      while (2)
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -1;
          v13 = objc_msgSend(v12, "length");
          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "scanHexInt:", &v22);

            if (!v15)
            {

              v17 = 0;
              goto LABEL_21;
            }
            v13 = v22;
          }
          else
          {
            v22 = 0;
          }
          intToBitString(v13, 16);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v16);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v10;
          v11 = v8;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v8 = &stru_250C51910;
    }

    -[__CFString substringToIndex:](v8, "substringToIndex:", -[FedStatsCategoricalTypeIPv6Encoder significantBitCount](v21, "significantBitCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByPaddingToLength:withString:startingAtIndex:", -[__CFString length](v8, "length"), CFSTR("0"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v20;
    v17 = v11;
LABEL_21:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return a3;
}

- (unint64_t)significantBitCount
{
  return self->_significantBitCount;
}

@end
