@implementation FinHealthInsightsCorrelationHelper

+ (id)kendallCoefficientWithIndexedAmountSums:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;

  v3 = a3;
  v4 = v3;
  if (!v3 || (unint64_t)objc_msgSend(v3, "count") < 2)
    goto LABEL_14;
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    v5 = 0;
    do
    {
      for (i = v7; i < objc_msgSend(v4, "count"); ++i)
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "lessThan:", v10);

        if (v11)
        {
          ++v5;
        }
        else
        {
          objc_msgSend(v4, "objectAtIndex:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndex:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "greaterThan:", v13);

          v6 += v14;
        }
      }
      ++v7;
    }
    while (v7 < objc_msgSend(v4, "count") - 1);
  }
  if (v6 + v5)
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", (double)(v5 - v6) / (double)(v6 + v5));
  else
LABEL_14:
    v15 = 0;

  return v15;
}

+ (id)spearmanCoefficientWithIndexedAmountSums:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t j;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t k;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;

  v3 = a3;
  v4 = v3;
  if (!v3 || (unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v22 = 0;
    goto LABEL_25;
  }
  v5 = objc_msgSend(v4, "count");
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = 0x24BDD1000uLL;
  v41 = v5;
  if (v5 < 2)
  {
    v20 = (double)v5;
    v9 = 1;
    v21 = 1;
  }
  else
  {
    v8 = 0;
    v9 = 1;
    v10 = v5;
    for (i = 1; i != v5; ++i)
    {
      objc_msgSend(v4, "objectAtIndex:", i, v41);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", i - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:", v13);

      if (v14)
      {
        if (v9)
        {
          v43 = v5 - i;
          v15 = (double)v10 / (double)v9;
          v16 = v8;
          for (j = 1; j <= v9; ++j)
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v15);
            objc_msgSend(v4, "objectAtIndex:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKey:", v18, v19);

            --v16;
          }
          v9 = 1;
          v5 = v41;
          v10 = v43;
        }
        else
        {
          v9 = 1;
          v10 = v5 - i;
        }
      }
      else
      {
        v10 += v5 - i;
        ++v9;
      }
      ++v8;
    }
    v7 = 0x24BDD1000;
    if (!v9)
      goto LABEL_19;
    v20 = (double)v10 / (double)v9;
    v21 = v5;
  }
  v23 = v21 - 1;
  for (k = 1; k <= v9; ++k)
  {
    v25 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 1304)), "initWithDouble:", v20);
    objc_msgSend(v4, "objectAtIndex:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v25, v26);

    --v23;
  }
LABEL_19:
  objc_msgSend(*(id *)(v7 + 1304), "zero", v41);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v5)
  {
    v29 = 0;
    v30 = v5;
    do
    {
      v31 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 1304)), "initWithInteger:", v30);
      objc_msgSend(v4, "objectAtIndex:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "decimalNumberBySubtracting:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "decimalNumberByRaisingToPower:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "decimalNumberByAdding:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 0x24BDD1000;
      ++v29;
      v28 = v36;
      --v30;
    }
    while (v30);
  }
  else
  {
    v36 = (void *)v27;
  }
  v37 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 1304)), "initWithDouble:", ((double)v42 * (double)v42 + -1.0) * (double)v42 / 6.0);
  objc_msgSend(*(id *)(v7 + 1304), "one");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "decimalNumberByDividingBy:", v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "decimalNumberBySubtracting:", v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v22;
}

@end
