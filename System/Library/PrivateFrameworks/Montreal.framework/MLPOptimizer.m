@implementation MLPOptimizer

+ (id)optimizerWithNetwork:(id)a3 momentum:(id)a4 velocity:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MLPOptimizerAdam *v18;
  const char *v19;
  uint64_t v20;
  MLPOptimizerSGD *v21;
  const char *v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_optimizerParams(v7, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_optimizerType(v13, v14, v15, v16);

  if (v17 == 1)
  {
    v18 = [MLPOptimizerAdam alloc];
    v20 = objc_msgSend_initWithNetwork_momentum_velocity_(v18, v19, (uint64_t)v7, (uint64_t)v8, v9);
  }
  else
  {
    v21 = [MLPOptimizerSGD alloc];
    v20 = objc_msgSend_initWithNetwork_momentum_(v21, v22, (uint64_t)v7, (uint64_t)v8);
  }
  v23 = (void *)v20;

  return v23;
}

- (MLPOptimizer)initWithNetwork:(id)a3 mpsOptimizer:(id)a4
{
  id v6;
  id v7;
  MLPOptimizer *v8;
  MLPOptimizer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MLPOptimizer;
  v8 = -[MLPOptimizer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_network, v6);
    objc_storeStrong((id *)&v9->_mpsOptimizer, a4);
  }

  return v9;
}

- (void)encodeToCommandBuffer:(id)a3 inputGradientVector:(id)a4 inputValuesVector:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("%@ not implemented in a subclass"), v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v11, v17, *MEMORY[0x1E0C99768], (uint64_t)v16, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v18);
}

- (void)encodeToCommandBuffer:(id)a3 inputGradientMatrix:(id)a4 inputValuesMatrix:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  v36 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_network(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matrixToVector_(v17, v18, (uint64_t)v8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matrixToVector_(v28, v29, (uint64_t)v9, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputGradientVector_inputValuesVector_(self, v32, (uint64_t)v36, (uint64_t)v20, v31);

  objc_msgSend_resetReadCount(v8, v33, v34, v35);
}

- (MPSNNOptimizer)mpsOptimizer
{
  return (MPSNNOptimizer *)objc_getProperty(self, a2, 8, 1);
}

- (MLPNetwork)network
{
  return (MLPNetwork *)objc_loadWeakRetained((id *)&self->_network);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_network);
  objc_storeStrong((id *)&self->_mpsOptimizer, 0);
}

@end
