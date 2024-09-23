@implementation NSArray(DOCFavoritesManager)

- (id)doc_computeNewRankForIndex:()DOCFavoritesManager
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3 & ~(a3 >> 63);
  v5 = objc_msgSend(a1, "count");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 != objc_msgSend(a1, "count"))
    {
      objc_msgSend(a1, "objectAtIndex:", v6 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "favoriteRank");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "objectAtIndex:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "favoriteRank");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      DOCRandomRankBetween(objc_msgSend(v21, "unsignedLongLongValue"), objc_msgSend(v8, "unsignedLongLongValue"));
      v10 = objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    objc_msgSend(a1, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "favoriteRank");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(a1, "doc_ranksForInsertingBelowRank:count:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();

LABEL_14:
      v8 = (void *)v10;
      return v8;
    }
    goto LABEL_12;
  }
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  objc_msgSend(v11, "numberWithUnsignedLongLong:", (unint64_t)(v13 * 1000.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    objc_msgSend(a1, "objectAtIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "favoriteRank");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedLongLongValue");

    if (objc_msgSend(v8, "unsignedLongLongValue") <= v16)
    {
      DOCRandomRankBetween(0, 0x3E8uLL);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedLongLongValue");

      if (!__CFADD__(v18, v16))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v18 + v16);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
LABEL_12:
      v10 = 0;
      goto LABEL_14;
    }
  }
  return v8;
}

- (id)doc_ranksForInsertingBetweenHigherRank:()DOCFavoritesManager lowerRank:count:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9 && a5)
  {
    v12 = objc_msgSend(v8, "unsignedLongLongValue");
    v13 = objc_msgSend(v10, "unsignedLongLongValue");
    v14 = v12 - v13;
    if (v12 > v13 && v14 >= a5)
    {
      objc_msgSend(a1, "_doc_ranksForInsertingBelowRank:spacing:count:", v8, v14 / a5, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)doc_ranksForInsertingBelowRank:()DOCFavoritesManager count:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  DOCRandomRankBetween(0, 0x3E8uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(a1, "_doc_ranksForInsertingBelowRank:spacing:count:", v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_doc_ranksForInsertingBelowRank:()DOCFavoritesManager spacing:count:
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a3;
  v8 = v7;
  if (a5 && a5 * a4 < (unint64_t)objc_msgSend(v7, "unsignedLongLongValue"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "unsignedLongLongValue") - a4;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      v10 -= a4;
      --a5;
    }
    while (a5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
