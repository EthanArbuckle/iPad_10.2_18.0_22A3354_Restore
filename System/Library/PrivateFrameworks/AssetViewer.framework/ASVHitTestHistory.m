@implementation ASVHitTestHistory

- (ASVHitTestHistory)initWithResultCapacity:(unint64_t)a3 decisionCapacity:(unint64_t)a4
{
  ASVHitTestHistory *v6;
  ASVHitTestHistory *v7;
  uint64_t v8;
  NSMutableArray *results;
  uint64_t v10;
  NSMutableArray *decisions;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASVHitTestHistory;
  v6 = -[ASVHitTestHistory init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_resultCapacity = a3;
    v6->_decisionCapacity = a4;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    results = v7->_results;
    v7->_results = (NSMutableArray *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    decisions = v7->_decisions;
    v7->_decisions = (NSMutableArray *)v10;

  }
  return v7;
}

- (void)addResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a3;
  -[ASVHitTestHistory results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[ASVHitTestHistory results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = -[ASVHitTestHistory resultCapacity](self, "resultCapacity");

  if (v7 > v8)
  {
    -[ASVHitTestHistory results](self, "results");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

  }
}

- (void)addDecision:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a3;
  -[ASVHitTestHistory decisions](self, "decisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[ASVHitTestHistory decisions](self, "decisions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = -[ASVHitTestHistory decisionCapacity](self, "decisionCapacity");

  if (v7 > v8)
  {
    -[ASVHitTestHistory decisions](self, "decisions");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

  }
}

- (id)recentResultsForCount:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[ASVHitTestHistory results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < a3)
    a3 = v6;
  if (a3)
  {
    -[ASVHitTestHistory results](self, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") - a3;

    -[ASVHitTestHistory results](self, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subarrayWithRange:", v8, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v10;
}

- (id)recentDecisionsForCount:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  -[ASVHitTestHistory decisions](self, "decisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_6;
  -[ASVHitTestHistory decisions](self, "decisions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") - 1;

  if (v8 < a3)
    a3 = v8;
  if (a3)
  {
    -[ASVHitTestHistory decisions](self, "decisions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") - a3;

    -[ASVHitTestHistory decisions](self, "decisions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subarrayWithRange:", v10, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v12;
}

- (void)clearHistory
{
  void *v3;
  id v4;

  -[ASVHitTestHistory results](self, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[ASVHitTestHistory decisions](self, "decisions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)reinitializeDecisionHistoryWithDecision:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASVHitTestHistory decisions](self, "decisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[ASVHitTestHistory decisions](self, "decisions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (unint64_t)resultCapacity
{
  return self->_resultCapacity;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (unint64_t)decisionCapacity
{
  return self->_decisionCapacity;
}

- (NSMutableArray)decisions
{
  return self->_decisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decisions, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
