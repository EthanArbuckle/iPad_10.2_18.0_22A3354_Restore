@implementation LCFProactivePredictionRankerHolder

- (id)init:(id)a3 prediction:(id)a4
{
  id v7;
  id v8;
  LCFProactivePredictionRankerHolder *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LCFProactivePredictionRankerHolder;
  v9 = -[LCFProactivePredictionRankerHolder init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureSet, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (LCFFeatureSet)featureSet
{
  return self->_featureSet;
}

- (MLFeatureProvider)prediction
{
  return self->_prediction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prediction, 0);
  objc_storeStrong((id *)&self->_featureSet, 0);
}

@end
