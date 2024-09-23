@implementation SGQuickResponsesDistributingCount

+ (id)numResponsesForScores:(id)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  char v34;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "replies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "replies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = +[SGQuickResponsesDistributingCount validClassesForClassCount:responseCount:config:](SGQuickResponsesDistributingCount, "validClassesForClassCount:responseCount:config:", objc_msgSend(v7, "count"), a4, v8);
  v13 = +[SGQuickResponsesDistributingCount responsesToFillForResponseCount:config:](SGQuickResponsesDistributingCount, "responsesToFillForResponseCount:config:", a4, v8);
  v32 = v7;
  +[SGQuickResponsesDistributingCount probsForClasses:withCount:](SGQuickResponsesDistributingCount, "probsForClasses:withCount:", v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v8;
  objc_msgSend(v8, "predictionParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v15, "isPerCategory");

  v16 = (void *)objc_opt_new();
  if (v12 && a4)
  {
    v17 = 0;
    v18 = (double)v13;
    v19 = 1;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v19 - 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "value");
      v22 = v21;

      objc_msgSend(v14, "objectAtIndexedSubscript:", v19 - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "index");

      if (v11)
      {
        if ((v34 & 1) != 0)
          objc_msgSend(v11, "categoryStyleGroups");
        else
          objc_msgSend(v11, "semanticClasses");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v27, "count");

      }
      else
      {
        objc_msgSend(v33, "replies");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "replyCountForIndex:", v24);
      }

      v28 = vcvtpd_u64_f64(v22 * v18);
      if (v26 < v28)
        v28 = v26;
      if (a4 - v17 >= v28)
        v29 = v28;
      else
        v29 = a4 - v17;
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v29);
      objc_msgSend(v16, "addObject:", v30);

      if (v19 >= v12)
        break;
      v17 += v29;
      ++v19;
    }
    while (v17 < a4);
  }

  return v16;
}

+ (unint64_t)validClassesForClassCount:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  void *v14;

  objc_msgSend(a5, "predictionParams", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "classDiscount");
  v10 = v9;

  v11 = vcvtpd_u64_f64((1.0 - v10) * (double)(a3 - 1));
  v12 = v11 + 1;
  if (v11 >= a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesRanking.m"), 262, CFSTR("validClasses %d out of range [1, %d]"), v12, a3);

  }
  return v12;
}

+ (unint64_t)responsesToFillForResponseCount:(unint64_t)a3 config:(id)a4
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v17;

  v7 = a4;
  objc_msgSend(v7, "predictionParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responsesBonus");
  v10 = v9;

  objc_msgSend(v7, "replies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "maxDistinctReplies");
  v13 = (unint64_t)(v10 * (double)(uint64_t)((v12 - a3) & ~((uint64_t)(v12 - a3) >> 63)));
  if (v12 <= a3)
    v14 = a3;
  else
    v14 = v12;
  v15 = v13 + a3;
  if (__CFADD__(v13, a3) || v15 > v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesRanking.m"), 276, CFSTR("responsesToFill %d out of range [%d, %d]"), v15, a3, v14);

  }
  return v15;
}

+ (id)probsForClasses:(id)a3 withCount:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  SGQuickResponsesClassScore *v15;
  void *v16;
  SGQuickResponsesClassScore *v17;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (a4)
  {
    v7 = 0;
    v8 = 0.0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v8 = v8 + v10;

      ++v7;
    }
    while (a4 != v7);
    v11 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v14 = v13 / v8;

      v15 = [SGQuickResponsesClassScore alloc];
      objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SGQuickResponsesClassScore initWithValue:index:](v15, "initWithValue:index:", objc_msgSend(v16, "index"), v14);

      objc_msgSend(v6, "addObject:", v17);
      ++v11;
    }
    while (a4 != v11);
  }

  return v6;
}

@end
