@implementation iconclassificationOutput

- (iconclassificationOutput)initWithLeaf_leaf_predictions_probabilities:(id)a3
{
  id v5;
  iconclassificationOutput *v6;
  iconclassificationOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)iconclassificationOutput;
  v6 = -[iconclassificationOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_leaf_leaf_predictions_probabilities, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E62894E8);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("leaf/leaf/predictions/probabilities")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", self->_leaf_leaf_predictions_probabilities);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MLMultiArray)leaf_leaf_predictions_probabilities
{
  return self->_leaf_leaf_predictions_probabilities;
}

- (void)setLeaf_leaf_predictions_probabilities:(id)a3
{
  objc_storeStrong((id *)&self->_leaf_leaf_predictions_probabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaf_leaf_predictions_probabilities, 0);
}

@end
