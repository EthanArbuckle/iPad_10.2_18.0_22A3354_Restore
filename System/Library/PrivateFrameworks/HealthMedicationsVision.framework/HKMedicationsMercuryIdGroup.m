@implementation HKMedicationsMercuryIdGroup

- (id)description
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  int64_t v7;
  float v8;
  void *v9;
  objc_super v11;

  v3 = -[HKMedicationsMercuryIdGroup ingredientMatched](self, "ingredientMatched");
  v4 = CFSTR("no match");
  if (v3)
    v4 = CFSTR("ingredient matched");
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationsMercuryIdGroup;
  v5 = v4;
  -[HKMedicationsMercuryIdGroup description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKMedicationsMercuryIdGroup primaryHgId](self, "primaryHgId");
  -[HKMedicationsMercuryIdGroup maxJaccardSimilarity](self, "maxJaccardSimilarity");
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" %d %f %@"), v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)primaryHgId
{
  return self->_primaryHgId;
}

- (void)setPrimaryHgId:(int64_t)a3
{
  self->_primaryHgId = a3;
}

- (float)maxJaccardSimilarity
{
  return self->_maxJaccardSimilarity;
}

- (void)setMaxJaccardSimilarity:(float)a3
{
  self->_maxJaccardSimilarity = a3;
}

- (NSArray)subHgIds
{
  return self->_subHgIds;
}

- (void)setSubHgIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)ingredientMatched
{
  return self->_ingredientMatched;
}

- (void)setIngredientMatched:(BOOL)a3
{
  self->_ingredientMatched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subHgIds, 0);
}

@end
