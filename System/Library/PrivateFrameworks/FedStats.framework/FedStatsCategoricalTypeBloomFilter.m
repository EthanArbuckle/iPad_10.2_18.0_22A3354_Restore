@implementation FedStatsCategoricalTypeBloomFilter

- (FedStatsCategoricalTypeBloomFilter)initWithBloomFilter:(id)a3 transformVariant:(id)a4
{
  id v7;
  id v8;
  FedStatsCategoricalTypeBloomFilter *v9;
  FedStatsCategoricalTypeBloomFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsCategoricalTypeBloomFilter;
  v9 = -[FedStatsCategoricalTypeBloomFilter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bloomFilter, a3);
    objc_storeStrong((id *)&v10->_transformVariant, a4);
  }

  return v10;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FedStatsCategoricalTypeBloomFilter *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("fileName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BE7A5A0];
      objc_msgSend(v6, "filePathURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bloomFilterWithPathToFile:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("transformVariant"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (a4)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v14);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v12 = 0;
        }
        else
        {
          v12 = -[FedStatsCategoricalTypeBloomFilter initWithBloomFilter:transformVariant:]([FedStatsCategoricalTypeBloomFilter alloc], "initWithBloomFilter:transformVariant:", v10, v11);
        }
      }
      else
      {
        if (!a4)
        {
          v12 = 0;
          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot load Bloom filter at '%@'"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v11);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_19:
      goto LABEL_20;
    }
    if (a4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 101;
      goto LABEL_11;
    }
  }
  else if (a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 100;
LABEL_11:
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v13, v10);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (id)filter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v31;
  unsigned __int8 md[8];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsCategoricalTypeBloomFilter transformVariant](self, "transformVariant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("extractHost"));

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "host");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v10)
        {
          if (v12)
          {
            objc_msgSend(v9, "host");
            v13 = objc_claimAutoreleasedReturnValue();
LABEL_13:

            v5 = (void *)v13;
            goto LABEL_14;
          }
        }
      }
    }
    else
    {
      -[FedStatsCategoricalTypeBloomFilter transformVariant](self, "transformVariant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("extractDomain"));

      if (!v16)
      {
LABEL_14:
        objc_msgSend(v5, "dataUsingEncoding:", 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = objc_retainAutorelease(v22);
          CC_SHA256((const void *)objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"), md);
          v25 = *(_QWORD *)md;
          if (*(uint64_t *)md < 0)
            v25 = -*(_QWORD *)md;
          v31 = v25;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v31, 8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[FedStatsCategoricalTypeBloomFilter bloomFilter](self, "bloomFilter");
          v27 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v27, "computeHashesWithSeed:forData:reuse:", 1, v26, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[FedStatsCategoricalTypeBloomFilter bloomFilter](self, "bloomFilter");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v27) = objc_msgSend(v29, "getWithHashes:", v28);

          v14 = 0;
          if ((v27 & 1) == 0)
            v14 = v4;

        }
        else
        {
          v14 = 0;
        }

        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      if (v17)
      {
        objc_msgSend(v17, "host");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "host");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v18)
        {
          if (v20)
          {
            objc_msgSend(v9, "host");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "safari_highLevelDomainFromHost");
            v13 = objc_claimAutoreleasedReturnValue();

            v5 = v21;
            goto LABEL_13;
          }
        }
      }
    }

    v14 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v14 = 0;
LABEL_24:

  return v14;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(v13, "objectForKey:", CFSTR("fileName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a8 = (id *)v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0;
      +[FedStatsCategoricalTypeAssetSpecifier assetSpecifierWithKey:requiredForCollectionKey:error:](FedStatsCategoricalTypeAssetSpecifier, "assetSpecifierWithKey:requiredForCollectionKey:error:", v16, 0, &v28);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v28;
      v19 = v18;
      if (v17)
      {
        if (v14)
        {
          v27 = v18;
          objc_msgSend(v17, "assetSpecifierValueForDataPoint:error:", v14, &v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v27;

          if (v15)
          {
            objc_msgSend(v15, "objectForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              a8 = (id *)objc_msgSend(v13, "mutableCopy");
              objc_msgSend(a8, "setObject:forKey:", v21, CFSTR("fileName"));
            }
            else if (a8)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing asset URL for '%@'"), v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 300, v24);
              *a8 = (id)objc_claimAutoreleasedReturnValue();

              a8 = 0;
            }

          }
          else
          {
            if (a7)
            {
              v29[0] = v20;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }
            a8 = (id *)v13;
          }

          v19 = v26;
        }
        else
        {
          if (a6)
          {
            objc_msgSend(v17, "parameters");
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          a8 = (id *)v13;
        }
      }
      else if (a8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot process asset specifier '%@'"), v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 300, v19, v23);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

        a8 = 0;
      }

    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Value for '%@' must be either a string or URL"), CFSTR("fileName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v22);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      a8 = 0;
    }
  }

  return a8;
}

- (_PASBloomFilter)bloomFilter
{
  return self->_bloomFilter;
}

- (NSString)transformVariant
{
  return self->_transformVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformVariant, 0);
  objc_storeStrong((id *)&self->_bloomFilter, 0);
}

@end
