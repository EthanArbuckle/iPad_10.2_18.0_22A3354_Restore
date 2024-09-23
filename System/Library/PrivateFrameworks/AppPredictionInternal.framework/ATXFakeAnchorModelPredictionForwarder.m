@implementation ATXFakeAnchorModelPredictionForwarder

- (ATXFakeAnchorModelPredictionForwarder)init
{
  ATXFakeAnchorModelPredictionForwarder *v2;
  ATXFakeAnchorModelPredictionForwarder *v3;
  NSArray *forwardedPredictions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXFakeAnchorModelPredictionForwarder;
  v2 = -[ATXFakeAnchorModelPredictionForwarder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    forwardedPredictions = v2->_forwardedPredictions;
    v2->_forwardedPredictions = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (void)forwardPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_forwardedPredictions, a3);
}

- (NSArray)forwardedPredictions
{
  return self->_forwardedPredictions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardedPredictions, 0);
}

@end
