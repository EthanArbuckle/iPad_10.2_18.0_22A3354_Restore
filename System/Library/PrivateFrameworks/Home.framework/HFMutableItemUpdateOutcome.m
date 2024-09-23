@implementation HFMutableItemUpdateOutcome

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableResults, 0);
}

- (HFMutableItemUpdateOutcome)initWithResults:(id)a3 type:(unint64_t)a4
{
  id v6;
  HFMutableItemUpdateOutcome *v7;
  uint64_t v8;
  NSMutableDictionary *mutableResults;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFMutableItemUpdateOutcome;
  v7 = -[HFItemUpdateOutcome initWithResults:type:](&v11, sel_initWithResults_type_, v6, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "mutableCopy");
    mutableResults = v7->_mutableResults;
    v7->_mutableResults = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFMutableItemUpdateOutcome mutableResults](self, "mutableResults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (NSMutableDictionary)mutableResults
{
  return self->_mutableResults;
}

- (void)safeSetObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[HFMutableItemUpdateOutcome mutableResults](self, "mutableResults");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v6);

  }
}

- (void)setResults:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[HFMutableItemUpdateOutcome setMutableResults:](self, "setMutableResults:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  HFItemUpdateOutcome *v4;
  void *v5;
  HFItemUpdateOutcome *v6;

  v4 = [HFItemUpdateOutcome alloc];
  -[HFMutableItemUpdateOutcome results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFItemUpdateOutcome initWithResults:type:](v4, "initWithResults:type:", v5, -[HFItemUpdateOutcome outcomeType](self, "outcomeType"));

  return v6;
}

- (id)allKeys
{
  void *v2;
  void *v3;

  -[HFMutableItemUpdateOutcome mutableResults](self, "mutableResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addResultsFromOutcome:(id)a3
{
  id v4;

  objc_msgSend(a3, "results");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome addResultsFromDictionary:](self, "addResultsFromDictionary:", v4);

}

- (void)addResultsFromDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMutableItemUpdateOutcome mutableResults](self, "mutableResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMutableItemUpdateOutcome mutableResults](self, "mutableResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsForKeys:", v4);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMutableItemUpdateOutcome mutableResults](self, "mutableResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)setMutableResults:(id)a3
{
  objc_storeStrong((id *)&self->_mutableResults, a3);
}

@end
