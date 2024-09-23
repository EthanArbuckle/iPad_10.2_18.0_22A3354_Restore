@implementation MLPLearningRateDecayHandler

- (MLPLearningRateDecayHandler)initWithLearningRate:(float)a3 decaySteps:(unint64_t)a4 decayRate:(float)a5 stairCase:(BOOL)a6
{
  MLPLearningRateDecayHandler *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MLPLearningRateDecayHandler;
  result = -[MLPLearningRateDecayHandler init](&v11, sel_init);
  if (result)
  {
    result->_decaySteps = a4;
    result->_learningRate = a3;
    result->_decayRate = a5;
    result->_stairCase = a6;
    result->_decayedLearningRate = a3;
  }
  return result;
}

- (void)updateGlobalStep
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  id v51;

  v5 = objc_msgSend_globalSteps(self, a2, v2, v3);
  objc_msgSend_setGlobalSteps_(self, v6, v5 + 1, v7);
  objc_msgSend_decayedLearningRate(self, v8, v9, v10);
  if (v14 > 0.0001)
  {
    v15 = objc_msgSend_globalSteps(self, v11, v12, v13);
    if (!(v15 % objc_msgSend_decaySteps(self, v16, v17, v18)))
    {
      v22 = objc_msgSend_globalSteps(self, v19, v20, v21);
      v26 = (float)(v22 / objc_msgSend_decaySteps(self, v23, v24, v25));
      objc_msgSend_stairCase(self, v27, v28, v29);
      objc_msgSend_learningRate(self, v30, v31, v32);
      v34 = v33;
      objc_msgSend_decayRate(self, v35, v36, v37);
      *(float *)&v39 = powf(v38, v26) * v34;
      objc_msgSend_setDecayedLearningRate_(self, v40, v41, v42, v39);
      objc_msgSend_delegate(self, v43, v44, v45);
      v51 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decayedLearningRate(self, v46, v47, v48);
      objc_msgSend_decayHandler_didUpdateLearningRate_(v51, v49, (uint64_t)self, v50);

    }
  }
}

- (float)learningRate
{
  return self->_learningRate;
}

- (unint64_t)decaySteps
{
  return self->_decaySteps;
}

- (float)decayRate
{
  return self->_decayRate;
}

- (BOOL)stairCase
{
  return self->_stairCase;
}

- (float)decayedLearningRate
{
  return self->_decayedLearningRate;
}

- (void)setDecayedLearningRate:(float)a3
{
  self->_decayedLearningRate = a3;
}

- (unint64_t)globalSteps
{
  return self->_globalSteps;
}

- (void)setGlobalSteps:(unint64_t)a3
{
  self->_globalSteps = a3;
}

- (MLPLearningRateDecayHandlerDelegate)delegate
{
  return (MLPLearningRateDecayHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
