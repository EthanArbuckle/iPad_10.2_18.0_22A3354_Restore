@implementation FinHealthRecurringHelper

+ (void)rootMeanSquareErrorForSlidingWindowWithCompletion:(id)a3 slidingWindowWidth:(unint64_t)a4 decimalThreshold:(id)a5 decimalDenominator:(id)a6 decimalKeyEntry:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(id, unint64_t, void *);
  unint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(id, unint64_t, void *))a8;
  if (1 - a4 + objc_msgSend(v20, "count"))
  {
    v18 = 0;
    do
    {
      objc_msgSend(a1, "rootMeanSquareError:decimalKey:startIndex:arrayLength:decimalDenominator:", v20, v16, v18, a4, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "lessThan:", v14))
        v17[2](v17, v18, v19);

      ++v18;
    }
    while (v18 < 1 - a4 + objc_msgSend(v20, "count"));
  }

}

+ (id)histogramKeysForTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionType");
  v6 = 0;
  if (v5 > 5)
  {
    if (v5 == 6)
    {
      objc_msgSend(v4, "amount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "histogramKeysForTopUpTransaction:amountFromDatabase:", v7, objc_msgSend(v4, "amountFromDatabase"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v5 != 10)
      goto LABEL_11;
LABEL_7:
    objc_msgSend(v4, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "histogramKeysForCardPurchaseTransaction:transactionAmount:transactionType:amountFromDatabase:", v7, v8, objc_msgSend(v4, "transactionType"), objc_msgSend(v4, "amountFromDatabase"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v5)
    goto LABEL_7;
  if (v5 == 3)
  {
    objc_msgSend(v4, "peerPaymentCounterpartHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "histogramKeysForPeerPaymentTransaction:transactionAmount:transactionPeerPaymentSubtype:amountFromDatabase:", v7, v8, objc_msgSend(v4, "peerPaymentType"), objc_msgSend(v4, "amountFromDatabase"));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (void *)v9;

LABEL_10:
  }
LABEL_11:

  return v6;
}

+ (id)histogramKeysForCardPurchaseTransaction:(id)a3 transactionAmount:(id)a4 transactionType:(int64_t)a5 amountFromDatabase:(int64_t)a6
{
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  FHSmartCompoundFeatureRankedValue *v17;
  FHSmartCompoundFeatureRankedValue *v18;
  FHSmartCompoundFeatureRankedValue *v19;
  FHSmartCompoundFeatureRankedValue *v20;
  FHSmartCompoundFeatureRankedValue *v21;
  void *v22;

  v9 = a3;
  objc_msgSend(a4, "doubleValue");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld_%.2f"), v9, a5, log(fabs(v10) + 1.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v11, "hash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld_%ld"), v9, a5, 14 * a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v13, "hash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _os_feature_enabled_impl();
  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v12, 0);
  v18 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v14, 0);
  v19 = v18;
  if (v15)
  {
    v20 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v12, 7);
    v21 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v14, 7);
    objc_msgSend(v16, "setWithObjects:", v17, v19, v20, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v16, "setWithObjects:", v17, v18, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

+ (id)histogramKeysForPeerPaymentTransaction:(id)a3 transactionAmount:(id)a4 transactionPeerPaymentSubtype:(int64_t)a5 amountFromDatabase:(int64_t)a6
{
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FHSmartCompoundFeatureRankedValue *v18;
  FHSmartCompoundFeatureRankedValue *v19;
  FHSmartCompoundFeatureRankedValue *v20;
  void *v21;

  v9 = a3;
  objc_msgSend(a4, "doubleValue");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld_%.2f"), v9, a5, log(fabs(v10) + 1.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v11, "hash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld_%ld"), v9, a5, 14 * a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v13, "hash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld"), v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v15, "hash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v12, 3);
  v19 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v14, 3);
  v20 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v16, 4);
  objc_msgSend(v17, "setWithObjects:", v18, v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)histogramKeysForTopUpTransaction:(id)a3 amountFromDatabase:(int64_t)a4
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FHSmartCompoundFeatureRankedValue *v11;
  FHSmartCompoundFeatureRankedValue *v12;
  void *v13;

  objc_msgSend(a3, "doubleValue");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), log(fabs(v5) + 1.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), 14 * a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v8, "hash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v7, 5);
  v12 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v9, 5);
  objc_msgSend(v10, "setWithObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)histogramKeysForMerchantDetailedCategoryTransaction:(id)a3 transactionAmount:(id)a4 transactionType:(int64_t)a5 amountFromDatabase:(int64_t)a6
{
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FHSmartCompoundFeatureRankedValue *v16;
  FHSmartCompoundFeatureRankedValue *v17;
  void *v18;

  v9 = a3;
  objc_msgSend(a4, "doubleValue");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld_%.2f"), v9, a5, log(fabs(v10) + 1.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v11, "hash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld_%ld"), v9, a5, 14 * a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v13, "hash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v12, 9);
  v17 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndIntegerRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndIntegerRank:featureRank:", v14, 9);
  objc_msgSend(v15, "setWithObjects:", v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)rootMeanSquareError:(id)a3 startIndex:(unint64_t)a4 arrayLength:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  double v19;
  void *v20;

  v7 = a3;
  if (a5 + a4 <= a4)
  {
    v12 = (double)a5;
    v14 = 0.0;
    if (0.0 / (double)a5 >= 7.0 - 2.0)
    {
LABEL_10:
      v18 = objc_alloc(MEMORY[0x24BDD1518]);
      v19 = sqrt(v14 / v12);
      goto LABEL_11;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0.0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", a4 + v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v9 = v9 + v11;

      ++v8;
    }
    while (a5 != v8);
    v12 = (double)a5;
    v13 = v9 / (double)a5;
    if (v13 >= 7.0 - 2.0)
    {
      v14 = 0.0;
      if (a5 + a4 > a4)
      {
        do
        {
          objc_msgSend(v7, "objectAtIndex:", a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          v14 = v14 + (v17 - v13) * (v17 - v13);
          ++a4;
          --a5;
        }
        while (a5);
      }
      goto LABEL_10;
    }
  }
  v18 = objc_alloc(MEMORY[0x24BDD1518]);
  v19 = 2.0 + 1.0;
LABEL_11:
  v20 = (void *)objc_msgSend(v18, "initWithDouble:", v19);

  return v20;
}

+ (id)rootMeanSquareError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "rootMeanSquareError:startIndex:arrayLength:", v4, 0, objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)rootMeanSquareError:(id)a3 decimalKey:(id)a4 startIndex:(unint64_t)a5 arrayLength:(unint64_t)a6 decimalDenominator:(id)a7
{
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;

  v11 = a3;
  v12 = a4;
  objc_msgSend(a7, "doubleValue");
  v14 = v13;
  v15 = 0.0;
  if (a5 + 1 < a6 + a5)
  {
    v16 = a6 - 1;
    v17 = a5;
    do
    {
      v18 = v17 + 1;
      objc_msgSend(v11, "objectAtIndex:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectAtIndex:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "decimalNumberBySubtracting:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v15 = v15 + v24 / v14;

      v17 = v18;
      --v16;
    }
    while (v16);
  }
  v25 = a6 - 1;
  v26 = (double)(a6 - 1);
  v27 = v15 / v26;
  if (v27 >= 7.0 - 2.0)
  {
    v30 = 0.0;
    if (a5 + 1 < a6 + a5)
    {
      do
      {
        v31 = a5 + 1;
        objc_msgSend(v11, "objectAtIndex:", a5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKey:", v12);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectAtIndex:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", v12);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "decimalNumberBySubtracting:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v38 = v37 / v14;

        v30 = v30 + (v38 - v27) * (v38 - v27);
        a5 = v31;
        --v25;
      }
      while (v25);
    }
    v28 = objc_alloc(MEMORY[0x24BDD1518]);
    v29 = sqrt(v30 / v26);
  }
  else
  {
    v28 = objc_alloc(MEMORY[0x24BDD1518]);
    v29 = 2.0 + 1.0;
  }
  v39 = (void *)objc_msgSend(v28, "initWithDouble:", v29);

  return v39;
}

@end
