@implementation ATXActionResult

- (BOOL)isSampledResultForLoggingOnly
{
  return !self->_scoredAction
      && -[NSString isEqualToString:](self->_actionKey, "isEqualToString:", CFSTR("predictionItem"));
}

- (ATXActionResult)initWithScoredAction:(id)a3 predictionItem:(const ATXPredictionItem *)a4 actionKey:(id)a5
{
  id v9;
  id v10;
  ATXActionResult *v11;
  ATXActionResult *v12;
  ATXActionResult *v13;
  unint64_t *p_actionHash;
  unint64_t *v15;
  uint64_t i;
  NSString *key;
  uint64_t v18;
  NSString *actionKey;
  _BYTE v21[8];
  float v22[820];
  __int16 v23;
  objc_super v24;

  v9 = a3;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)ATXActionResult;
  v11 = -[ATXActionResult init](&v24, sel_init);
  v12 = v11;
  v13 = v11;
  if (v11)
  {
    if (a4)
    {
      v11->_hasPredictionItem = 1;
      objc_storeStrong((id *)&v11->_predictionItem.key, a4->key);
      p_actionHash = &v12->_predictionItem.actionHash;
      v15 = &a4->actionHash;
    }
    else
    {
      v11->_hasPredictionItem = 0;
      v22[819] = -31337.0;
      v23 = 0;
      for (i = 16; i != 3284; i += 4)
        *(float *)&v21[i] = -31337.0;
      key = v11->_predictionItem.key;
      v11->_predictionItem.key = 0;

      p_actionHash = &v12->_predictionItem.actionHash;
      v15 = (unint64_t *)v22;
    }
    memcpy(p_actionHash, v15, 0xCD2uLL);
    v18 = objc_msgSend(v10, "copy");
    actionKey = v13->_actionKey;
    v13->_actionKey = (NSString *)v18;

    objc_storeStrong((id *)&v12->_scoredAction, a3);
  }

  return v13;
}

- (id)initForLoggingWithPredictionItem:(const ATXPredictionItem *)a3
{
  return -[ATXActionResult initWithScoredAction:predictionItem:actionKey:](self, "initWithScoredAction:predictionItem:actionKey:", 0, a3, CFSTR("predictionItem"));
}

- (void)setPredictionItem:(const ATXPredictionItem *)a3
{
  unint64_t *p_actionHash;
  uint64_t i;
  NSString *key;
  _BYTE v7[8];
  float v8[822];

  if (a3)
  {
    self->_hasPredictionItem = 1;
    p_actionHash = &a3->actionHash;
    objc_storeStrong((id *)&self->_predictionItem.key, a3->key);
    memcpy(&self->_predictionItem.actionHash, p_actionHash, 0xCD2uLL);
  }
  else
  {
    self->_hasPredictionItem = 0;
    v8[819] = -31337.0;
    LOWORD(v8[820]) = 0;
    for (i = 16; i != 3284; i += 4)
      *(float *)&v7[i] = -31337.0;
    key = self->_predictionItem.key;
    self->_predictionItem.key = 0;

    memcpy(&self->_predictionItem.actionHash, v8, 0xCD2uLL);
  }
}

- (const)predictionItem
{
  if (self->_hasPredictionItem)
    return &self->_predictionItem;
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<Key: %@ Scored Action: %@>"), self->_actionKey, self->_scoredAction);
}

- (ATXScoredPrediction)scoredAction
{
  return self->_scoredAction;
}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionKey, 0);
  objc_storeStrong((id *)&self->_scoredAction, 0);

}

- (id).cxx_construct
{
  uint64_t i;

  *((_QWORD *)self + 1) = 0;
  *((float *)self + 823) = -31337.0;
  *((_WORD *)self + 1648) = 0;
  for (i = 24; i != 3292; i += 4)
    *(float *)((char *)self + i) = -31337.0;
  return self;
}

@end
