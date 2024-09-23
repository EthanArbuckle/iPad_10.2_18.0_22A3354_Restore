@implementation _CNSortsByPositionInAuxiliaryArray

+ (id)comparatorForSortingAccordingToAuxiliaryValues:(id)a3 transform:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAuxiliaryValues:transform:", v7, v6);

  objc_msgSend(v8, "comparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_CNSortsByPositionInAuxiliaryArray)initWithAuxiliaryValues:(id)a3 transform:(id)a4
{
  id v6;
  id v7;
  _CNSortsByPositionInAuxiliaryArray *v8;
  uint64_t v9;
  NSArray *auxiliaryValues;
  uint64_t v11;
  id transform;
  _CNSortsByPositionInAuxiliaryArray *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNSortsByPositionInAuxiliaryArray;
  v8 = -[_CNSortsByPositionInAuxiliaryArray init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    auxiliaryValues = v8->_auxiliaryValues;
    v8->_auxiliaryValues = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    transform = v8->_transform;
    v8->_transform = (id)v11;

    -[_CNSortsByPositionInAuxiliaryArray prepareRankingIndex](v8, "prepareRankingIndex");
    v13 = v8;
  }

  return v8;
}

- (void)prepareRankingIndex
{
  void *v3;
  NSArray *auxiliaryValues;
  NSDictionary *v5;
  NSDictionary *ranks;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  auxiliaryValues = self->_auxiliaryValues;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57___CNSortsByPositionInAuxiliaryArray_prepareRankingIndex__block_invoke;
  v8[3] = &unk_1E29BB980;
  v9 = v3;
  v7 = v3;
  -[NSArray enumerateObjectsUsingBlock:](auxiliaryValues, "enumerateObjectsUsingBlock:", v8);
  v5 = (NSDictionary *)objc_msgSend(v7, "copy");
  ranks = self->_ranks;
  self->_ranks = v5;

}

- (id)comparator
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48___CNSortsByPositionInAuxiliaryArray_comparator__block_invoke;
  v3[3] = &unk_1E29BB9A8;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

- (id)rankForObject:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[_CNSortsByPositionInAuxiliaryArray ranks](self, "ranks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNSortsByPositionInAuxiliaryArray transform](self, "transform");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[_CNSortsByPositionInAuxiliaryArray auxiliaryValues](self, "auxiliaryValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)transform
{
  return self->_transform;
}

- (NSDictionary)ranks
{
  return self->_ranks;
}

- (NSArray)auxiliaryValues
{
  return self->_auxiliaryValues;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_auxiliaryValues, 0);
  objc_storeStrong((id *)&self->_ranks, 0);
}

@end
