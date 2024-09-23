@implementation SGQuickResponsesReplyOption

- (SGQuickResponsesReplyOption)initWithPosition:(unint64_t)a3 records:(id)a4 actualOptionsDisplayedCount:(double)a5 imputedOptionsDisplayedCount:(double)a6 imputedOptionsDisplayed:(id)a7 config:(id)a8
{
  id v14;
  id v15;
  id v16;
  SGQuickResponsesReplyOption *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  NSNumber *position;
  uint64_t v35;
  NSNumber *ucb;
  objc_super v38;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  v38.receiver = self;
  v38.super_class = (Class)SGQuickResponsesReplyOption;
  v17 = -[SGQuickResponsesReplyOption init](&v38, sel_init);
  if (v17)
  {
    objc_msgSend(v14, "replyRecords");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "selected");
    v21 = v20;
    objc_msgSend(v19, "displayed");
    v23 = v22;
    objc_msgSend(v19, "matched");
    v25 = v24;
    objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;
    objc_msgSend(v16, "predictionParams");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "personalizationExplorationFactor");
    +[SGQuickResponsesReplyOption ucbCombinedForSelected:displayed:actualOptionsDisplayed:matched:imputedDisplayed:imputedOptionsDisplayed:explorationFactor:](SGQuickResponsesReplyOption, "ucbCombinedForSelected:displayed:actualOptionsDisplayed:matched:imputedDisplayed:imputedOptionsDisplayed:explorationFactor:", v21, v23, a5, v25, v28, a6, v30);
    v32 = v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a3);
    position = v17->_position;
    v17->_position = (NSNumber *)v33;

    v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", v32);
    ucb = v17->_ucb;
    v17->_ucb = (NSNumber *)v35;

  }
  return v17;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[SGQuickResponsesReplyOption ucb](self, "ucb");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ucb");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  if (v7)
  {
    -[SGQuickResponsesReplyOption position](self, "position");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "position");
  }
  else
  {
    objc_msgSend(v4, "ucb");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGQuickResponsesReplyOption ucb](self, "ucb");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  return v10;
}

- (NSNumber)position
{
  return self->_position;
}

- (NSNumber)ucb
{
  return self->_ucb;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ucb, 0);
  objc_storeStrong((id *)&self->_position, 0);
}

+ (double)ucbTunedVarianceForMean:(double)a3 displayed:(double)a4 totalDisplayed:(double)a5
{
  double v5;
  double v6;
  double v7;

  v5 = (1.0 - a3) * a3;
  v6 = log(a5) / a4;
  v7 = v5 + sqrt(v6 + v6);
  if (v7 > 0.25)
    v7 = 0.25;
  return v6 * v7;
}

+ (double)ucbWithMean:(double)a3 varianceOfMean:(double)a4 explorationFactor:(double)a5
{
  double result;

  result = sqrt(a4) * a5 + a3;
  if (result > 1.0)
    return 1.0;
  return result;
}

+ (double)ucbCombinedWithMeanA:(double)a3 meanB:(double)a4 varianceA:(double)a5 varianceB:(double)a6 explorationFactor:(double)a7
{
  double v7;
  double result;

  v7 = 1.0 / a5 / (1.0 / a5 + 1.0 / a6);
  +[SGQuickResponsesReplyOption ucbWithMean:varianceOfMean:explorationFactor:](SGQuickResponsesReplyOption, "ucbWithMean:varianceOfMean:explorationFactor:", (1.0 - v7) * a4 + v7 * a3, (1.0 - v7) * a6 + v7 * a5 + v7 * (1.0 - v7) * ((a3 - a4) * (a3 - a4)), a7);
  return result;
}

+ (double)ucbCombinedForSelected:(double)a3 displayed:(double)a4 actualOptionsDisplayed:(double)a5 matched:(double)a6 imputedDisplayed:(double)a7 imputedOptionsDisplayed:(double)a8 explorationFactor:(double)a9
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double result;

  v12 = a3 / a4;
  if (v12 <= 1.0)
    v13 = v12;
  else
    v13 = 1.0;
  if (a6 / a7 <= 1.0)
    v14 = a6 / a7;
  else
    v14 = 1.0;
  +[SGQuickResponsesReplyOption ucbTunedVarianceForMean:displayed:totalDisplayed:](SGQuickResponsesReplyOption, "ucbTunedVarianceForMean:displayed:totalDisplayed:", v13);
  v16 = v15;
  +[SGQuickResponsesReplyOption ucbTunedVarianceForMean:displayed:totalDisplayed:](SGQuickResponsesReplyOption, "ucbTunedVarianceForMean:displayed:totalDisplayed:", v14, a7, a8);
  +[SGQuickResponsesReplyOption ucbCombinedWithMeanA:meanB:varianceA:varianceB:explorationFactor:](SGQuickResponsesReplyOption, "ucbCombinedWithMeanA:meanB:varianceA:varianceB:explorationFactor:", v13, v14, v16, v17, a9);
  return result;
}

+ (id)sortedReplyOptionsForRecords:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  SGQuickResponsesReplyOption *v17;
  void *v18;
  unint64_t v19;

  v5 = a3;
  v6 = a4;
  +[SGQuickResponsesReplyOption totalDisplayedCountForRecords:](SGQuickResponsesReplyOption, "totalDisplayedCountForRecords:", v5);
  v8 = v7;
  +[SGQuickResponsesReplyOption imputedDisplayedForRecords:config:](SGQuickResponsesReplyOption, "imputedDisplayedForRecords:config:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", CFSTR("@sum.self"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = (void *)objc_opt_new();
  objc_msgSend(v5, "replyRecords");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    do
    {
      v17 = -[SGQuickResponsesReplyOption initWithPosition:records:actualOptionsDisplayedCount:imputedOptionsDisplayedCount:imputedOptionsDisplayed:config:]([SGQuickResponsesReplyOption alloc], "initWithPosition:records:actualOptionsDisplayedCount:imputedOptionsDisplayedCount:imputedOptionsDisplayed:config:", v16, v5, v9, v6, v8, v12);
      objc_msgSend(v13, "addObject:", v17);

      ++v16;
      objc_msgSend(v5, "replyRecords");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v16 < v19);
  }
  objc_msgSend(v13, "sortUsingSelector:", sel_compare_);

  return v13;
}

+ (double)totalDisplayedCountForRecords:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "replyRecords", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "displayed");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (id)imputedDisplayedForRecords:(id)a3 config:(id)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "totalDisplayed");
  v6 = v5;
  objc_msgSend(v4, "totalSelected");
  v8 = v7;
  objc_msgSend(v4, "totalUnmatched");
  v10 = v9;
  v11 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "replyRecords", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = fmax(v6 - v8, 0.0);
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v18, "displayed");
        v20 = v19;
        objc_msgSend(v18, "selected");
        v22 = v21;
        objc_msgSend(v18, "matched");
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", v23 + v10 * ((v20 - v22) / v15));
        objc_msgSend(v11, "addObject:", v24);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  return v11;
}

@end
