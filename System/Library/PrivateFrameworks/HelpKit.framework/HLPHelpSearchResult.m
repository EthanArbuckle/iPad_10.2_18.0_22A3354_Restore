@implementation HLPHelpSearchResult

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[HLPHelpSearchResult identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(v4, "setWeight:", -[HLPHelpSearchResult weight](self, "weight"));
  objc_msgSend(v4, "setMatchCount:", -[HLPHelpSearchResult matchCount](self, "matchCount"));
  -[HLPHelpSearchResult relevanceScore](self, "relevanceScore");
  objc_msgSend(v4, "setRelevanceScore:");
  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HLPHelpSearchResult identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HLPHelpSearchResult weight](self, "weight");
  v6 = -[HLPHelpSearchResult matchCount](self, "matchCount");
  -[HLPHelpSearchResult relevanceScore](self, "relevanceScore");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier: %@, weight: %ld matchCount: %ld relevanceScore %f"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(double)a3
{
  self->_relevanceScore = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (int64_t)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(int64_t)a3
{
  self->_matchCount = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
