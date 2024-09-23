@implementation ATXScoredPrediction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predictedItem, 0);
}

- (ATXScoredPrediction)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  double v11;
  ATXScoredPrediction *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("predictedItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeFloatForKey:", CFSTR("score"));
  v10 = v9;

  LODWORD(v11) = v10;
  v12 = -[ATXScoredPrediction initWithPredictedItem:score:](self, "initWithPredictedItem:score:", v8, v11);

  return v12;
}

- (ATXScoredPrediction)initWithPredictedItem:(id)a3 score:(float)a4
{
  id v8;
  ATXScoredPrediction *v9;
  ATXScoredPrediction *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXScoredPrediction.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predictedItem"));

  }
  v13.receiver = self;
  v13.super_class = (Class)ATXScoredPrediction;
  v9 = -[ATXScoredPrediction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_predictedItem, a3);
    v10->_score = a4;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id predictedItem;
  double v5;
  id v6;

  predictedItem = self->_predictedItem;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", predictedItem, CFSTR("predictedItem"));
  *(float *)&v5 = self->_score;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("score"), v5);

}

+ (id)predictionsFrom:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "predictedItem", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)predictedItem
{
  return self->_predictedItem;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXScoredPrediction *v4;
  double v5;

  v4 = +[ATXScoredPrediction allocWithZone:](ATXScoredPrediction, "allocWithZone:", a3);
  *(float *)&v5 = self->_score;
  return -[ATXScoredPrediction initWithPredictedItem:score:](v4, "initWithPredictedItem:score:", self->_predictedItem, v5);
}

- (BOOL)isEqual:(id)a3
{
  ATXScoredPrediction *v4;
  ATXScoredPrediction *v5;
  BOOL v6;

  v4 = (ATXScoredPrediction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXScoredPrediction isEqualToScoredPredictionItem:](self, "isEqualToScoredPredictionItem:", v5);

  return v6;
}

- (BOOL)isEqualToScoredPredictionItem:(id)a3
{
  if (self->_score == *((float *)a3 + 2))
    return objc_msgSend(self->_predictedItem, "isEqual:", *((_QWORD *)a3 + 2));
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%f>"), self->_predictedItem, self->_score);
}

- (unint64_t)hash
{
  return objc_msgSend(self->_predictedItem, "hash");
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (float)score
{
  return self->_score;
}

@end
