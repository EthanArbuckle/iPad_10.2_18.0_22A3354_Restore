@implementation MLPOptimizerAdam

- (MLPOptimizerAdam)initWithNetwork:(id)a3 momentum:(id)a4 velocity:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  double v61;
  const char *v62;
  void *v63;
  MLPOptimizerAdam *v64;
  uint64_t v65;
  MPSVector *momentum;
  uint64_t v67;
  MPSVector *velocity;
  objc_super v70;

  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend_deviceHandler(v8, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_optimizerParams(v8, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CC71F8];
  objc_msgSend_learningRate(v22, v24, v25, v26);
  objc_msgSend_optimizerDescriptorWithLearningRate_gradientRescale_regularizationType_regularizationScale_(v23, v27, 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gradientClipMin(v22, v30, v31, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    objc_msgSend_gradientClipMax(v22, v33, v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend_setApplyGradientClipping_(v29, v38, 1, v39);
      objc_msgSend_gradientClipMin(v22, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v43, v44, v45, v46);
      objc_msgSend_setGradientClipMin_(v29, v47, v48, v49);

      objc_msgSend_gradientClipMax(v22, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v53, v54, v55, v56);
      objc_msgSend_setGradientClipMax_(v29, v57, v58, v59);

    }
  }
  v60 = objc_alloc(MEMORY[0x1E0CC71F0]);
  LODWORD(v61) = 841731191;
  v63 = (void *)objc_msgSend_initWithDevice_beta1_beta2_epsilon_timeStep_optimizerDescriptor_(v60, v62, (uint64_t)v18, 0, v29, 0.899999976, 0.999000013, v61);
  v70.receiver = self;
  v70.super_class = (Class)MLPOptimizerAdam;
  v64 = -[MLPOptimizer initWithNetwork:mpsOptimizer:](&v70, sel_initWithNetwork_mpsOptimizer_, v8, v63);
  if (v64)
  {
    v9[2](v9);
    v65 = objc_claimAutoreleasedReturnValue();
    momentum = v64->_momentum;
    v64->_momentum = (MPSVector *)v65;

    v10[2](v10);
    v67 = objc_claimAutoreleasedReturnValue();
    velocity = v64->_velocity;
    v64->_velocity = (MPSVector *)v67;

  }
  return v64;
}

- (void)encodeToCommandBuffer:(id)a3 inputGradientVector:(id)a4 inputValuesVector:(id)a5
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
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_mpsOptimizer(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_momentum(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_velocity(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputGradientVector_inputValuesVector_inputMomentumVector_inputVelocityVector_resultValuesVector_(v13, v22, (uint64_t)v23, (uint64_t)v8, v9, v17, v21, v9);

}

- (MPSVector)momentum
{
  return (MPSVector *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMomentum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MPSVector)velocity
{
  return (MPSVector *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVelocity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_velocity, 0);
  objc_storeStrong((id *)&self->_momentum, 0);
}

@end
