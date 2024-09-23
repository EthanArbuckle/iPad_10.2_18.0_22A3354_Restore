@implementation CLSInvestigationHelperSceneNodeLevelAndWeight

- (CLSInvestigationHelperSceneNodeLevelAndWeight)initWithTaxonomyNode:(id)a3 level:(unint64_t)a4 andWeight:(double)a5
{
  id v9;
  CLSInvestigationHelperSceneNodeLevelAndWeight *v10;
  CLSInvestigationHelperSceneNodeLevelAndWeight *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSInvestigationHelperSceneNodeLevelAndWeight;
  v10 = -[CLSInvestigationHelperSceneNodeLevelAndWeight init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_taxonomyNode, a3);
    v11->_level = a4;
    v11->_weight = a5;
  }

  return v11;
}

- (PFSceneTaxonomyNode)taxonomyNode
{
  return (PFSceneTaxonomyNode *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)level
{
  return self->_level;
}

- (double)weight
{
  return self->_weight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taxonomyNode, 0);
}

@end
