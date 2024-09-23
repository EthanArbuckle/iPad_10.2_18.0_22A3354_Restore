@implementation DSPGMLInputProvider

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_allInputFeatureNames);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[MLFeatureDescription name](self->_featureDescription, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", self->_input);
  else
    -[NSMutableDictionary objectForKeyedSubscript:](self->_featureCache, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_allInputFeatureNames, 0);
  objc_storeStrong((id *)&self->_featureCache, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);
}

@end
