@implementation ATXMinimalActionParameters

- (ATXMinimalActionParameters)initWithMinimalSlotResolutionParameters:(id)a3 actionTime:(id)a4 bundleId:(id)a5 actionType:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXMinimalActionParameters *v15;
  ATXMinimalActionParameters *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXMinimalActionParameters;
  v15 = -[ATXMinimalActionParameters init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_minimalSlotResolutionParams, a3);
    objc_storeStrong((id *)&v16->_actionTime, a4);
    objc_storeStrong((id *)&v16->_bundleId, a5);
    objc_storeStrong((id *)&v16->_actionType, a6);
  }

  return v16;
}

- (id)getContainerWithScore:(float)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  ATXActionPredictionContainer *v14;

  -[ATXMinimalSlotResolutionParameters actionAndSlotSet](self->_minimalSlotResolutionParams, "actionAndSlotSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "copyWithParameterWhitelist:", v8);

  if (v9 && objc_msgSend(v9, "hasActionTitle"))
  {
    objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", self->_bundleId, self->_actionType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CF9090]);
    *(float *)&v12 = a3;
    v13 = (void *)objc_msgSend(v11, "initWithPredictedItem:score:", v9, v12);
    v14 = -[ATXActionPredictionContainer initWithScoredAction:slotSet:actionKey:]([ATXActionPredictionContainer alloc], "initWithScoredAction:slotSet:actionKey:", v13, v7, v10);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  return -[ATXMinimalSlotResolutionParameters hash](self->_minimalSlotResolutionParams, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXMinimalActionParameters *v4;
  ATXMinimalSlotResolutionParameters *minimalSlotResolutionParams;
  void *v6;
  char v7;

  v4 = (ATXMinimalActionParameters *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      minimalSlotResolutionParams = self->_minimalSlotResolutionParams;
      -[ATXMinimalActionParameters minimalSlotResolutionParams](v4, "minimalSlotResolutionParams");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[ATXMinimalSlotResolutionParameters isEqual:](minimalSlotResolutionParams, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (ATXMinimalSlotResolutionParameters)minimalSlotResolutionParams
{
  return self->_minimalSlotResolutionParams;
}

- (NSDate)actionTime
{
  return self->_actionTime;
}

- (void)setActionTime:(id)a3
{
  objc_storeStrong((id *)&self->_actionTime, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_actionTime, 0);
  objc_storeStrong((id *)&self->_minimalSlotResolutionParams, 0);
}

@end
