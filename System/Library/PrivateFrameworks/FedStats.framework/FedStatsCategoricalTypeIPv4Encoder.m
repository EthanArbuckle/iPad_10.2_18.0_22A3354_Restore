@implementation FedStatsCategoricalTypeIPv4Encoder

- (FedStatsCategoricalTypeIPv4Encoder)initWithSignificantBitCount:(unint64_t)a3
{
  FedStatsCategoricalTypeIPv4Encoder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FedStatsCategoricalTypeIPv4Encoder;
  result = -[FedStatsCategoricalTypeIPv4Encoder init](&v5, sel_init);
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
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 24);
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
  void *v13;
  int v14;
  void *v15;
  __CFString *v16;
  void *v18;
  void *v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v4, "count") == 4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = &stru_250C51910;
      v9 = *(_QWORD *)v22;
      while (2)
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -1;
          objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "scanUnsignedInteger:", &v20);

          if (!v14)
          {

            v16 = 0;
            goto LABEL_18;
          }
          intToBitString(v20, 8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v15);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v10;
          v11 = v8;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v8 = &stru_250C51910;
    }

    -[__CFString substringToIndex:](v8, "substringToIndex:", -[FedStatsCategoricalTypeIPv4Encoder significantBitCount](self, "significantBitCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByPaddingToLength:withString:startingAtIndex:", -[__CFString length](v8, "length"), CFSTR("0"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v19;
    v16 = v11;
LABEL_18:

  }
  else
  {
    v16 = 0;
  }

  return v16;
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
