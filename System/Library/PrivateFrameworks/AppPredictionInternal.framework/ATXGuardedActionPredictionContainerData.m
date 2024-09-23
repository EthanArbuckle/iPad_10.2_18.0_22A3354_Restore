@implementation ATXGuardedActionPredictionContainerData

- (ATXGuardedActionPredictionContainerData)initWithScoredAction:(id)a3 slotSet:(id)a4 score:(float)a5
{
  id v9;
  id v10;
  ATXGuardedActionPredictionContainerData *v11;
  ATXGuardedActionPredictionContainerData *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXGuardedActionPredictionContainerData;
  v11 = -[ATXGuardedActionPredictionContainerData init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scoredAction, a3);
    objc_storeStrong((id *)&v12->_slotSet, a4);
    v12->_score = a5;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotSet, 0);
  objc_storeStrong((id *)&self->_scoredAction, 0);
}

@end
