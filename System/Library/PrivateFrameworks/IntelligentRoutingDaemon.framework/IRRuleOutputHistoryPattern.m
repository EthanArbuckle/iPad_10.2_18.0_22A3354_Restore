@implementation IRRuleOutputHistoryPattern

- (IRRuleOutputHistoryPattern)initWithRule:(id)a3
{
  IRRuleOutputHistoryPattern *v3;
  uint64_t v4;
  NSDictionary *scoreForCandidates;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IRRuleOutputHistoryPattern;
  v3 = -[IRRuleOutput initWithRule:](&v7, sel_initWithRule_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    scoreForCandidates = v3->_scoreForCandidates;
    v3->_scoreForCandidates = (NSDictionary *)v4;

  }
  return v3;
}

- (id)evaluateRuleOutputWithCandidateIdentifier:(id)a3
{
  id v4;
  IRRuleOutputEvaluation *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  unint64_t v9;
  IRRuleOutputEvaluation *v10;
  IRRuleOutputEvaluation *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  __CFString *v16;
  double v17;
  __CFString *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  IRRuleOutputEvaluation *v23;
  double v25;
  double v26;
  double v27;

  v4 = a3;
  v5 = objc_alloc_init(IRRuleOutputEvaluation);
  -[IRRuleOutput rule](self, "rule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[IRRuleOutput rule](self, "rule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[IRRuleOutputHistoryPattern numberOfEventsInHistory](self, "numberOfEventsInHistory");
    if (v9 >= objc_msgSend(v8, "minNumberOfEventsInHistory"))
    {
      -[IRRuleOutputHistoryPattern scoreForCandidates](self, "scoreForCandidates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[IRRuleOutputEvaluation setHasBoolean:](v5, "setHasBoolean:", 1);
        objc_msgSend(v8, "threshold");
        if (v14 == -2147483650.0 || (objc_msgSend(v8, "threshold"), v15 == 2147483650.0))
        {
          objc_msgSend(v8, "threshold");
          v16 = CFSTR("@max.self");
          if (v17 == -2147483650.0)
            v16 = CFSTR("@min.self");
          v18 = v16;
          objc_msgSend(v13, "doubleValue");
          if (v19 == 0.0)
          {
            -[IRRuleOutputEvaluation setBoolean:](v5, "setBoolean:", 0);
          }
          else
          {
            -[IRRuleOutputHistoryPattern scoreForCandidates](self, "scoreForCandidates");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "allValues");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "valueForKeyPath:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[IRRuleOutputEvaluation setBoolean:](v5, "setBoolean:", objc_msgSend(v13, "isEqual:", v22));

          }
        }
        else
        {
          objc_msgSend(v13, "doubleValue");
          v26 = v25;
          objc_msgSend(v8, "threshold");
          -[IRRuleOutputEvaluation setBoolean:](v5, "setBoolean:", v26 >= v27);
        }
      }
      v23 = v5;

    }
    else
    {
      v10 = v5;
    }

  }
  else
  {
    v11 = v5;
  }

  return v5;
}

- (NSDictionary)scoreForCandidates
{
  return self->_scoreForCandidates;
}

- (void)setScoreForCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_scoreForCandidates, a3);
}

- (unint64_t)numberOfEventsInHistory
{
  return self->_numberOfEventsInHistory;
}

- (void)setNumberOfEventsInHistory:(unint64_t)a3
{
  self->_numberOfEventsInHistory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreForCandidates, 0);
}

@end
