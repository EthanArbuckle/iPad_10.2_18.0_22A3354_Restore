@implementation MLPOptimizerSGD

- (MLPOptimizerSGD)initWithNetwork:(id)a3 momentum:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  MLPOptimizerSGD *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  float v79;
  float v80;
  uint64_t v81;
  MPSVector *momentum;
  objc_super v84;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend_deviceHandler(v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_optimizerParams(v6, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CC71F8];
  objc_msgSend_optimizerParams(v6, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_learningRate(v24, v25, v26, v27);
  objc_msgSend_optimizerDescriptorWithLearningRate_gradientRescale_regularizationType_regularizationScale_(v20, v28, 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_gradientClipMin(v19, v31, v32, v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend_gradientClipMax(v19, v34, v35, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend_setApplyGradientClipping_(v30, v39, 1, v40);
      objc_msgSend_gradientClipMin(v19, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v44, v45, v46, v47);
      objc_msgSend_setGradientClipMin_(v30, v48, v49, v50);

      objc_msgSend_gradientClipMax(v19, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v54, v55, v56, v57);
      objc_msgSend_setGradientClipMax_(v30, v58, v59, v60);

    }
  }
  v61 = objc_alloc(MEMORY[0x1E0CC7200]);
  objc_msgSend_optimizerParams(v6, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_momentum(v65, v66, v67, v68);
  v70 = (void *)objc_msgSend_initWithDevice_momentumScale_useNestrovMomentum_optimizerDescriptor_(v61, v69, (uint64_t)v15, 0, v30);

  v84.receiver = self;
  v84.super_class = (Class)MLPOptimizerSGD;
  v74 = -[MLPOptimizer initWithNetwork:mpsOptimizer:](&v84, sel_initWithNetwork_mpsOptimizer_, v6, v70);
  if (v74)
  {
    objc_msgSend_optimizerParams(v6, v71, v72, v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_momentum(v75, v76, v77, v78);
    v80 = v79;

    if (v80 > 0.0)
    {
      v7[2](v7);
      v81 = objc_claimAutoreleasedReturnValue();
      momentum = v74->_momentum;
      v74->_momentum = (MPSVector *)v81;

    }
  }

  return v74;
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
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_mpsOptimizer(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_momentum(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputGradientVector_inputValuesVector_inputMomentumVector_resultValuesVector_(v13, v18, (uint64_t)v19, (uint64_t)v8, v9, v17, v9);

}

- (void)updateLearningRate:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend_mpsOptimizer(self, a2, v3, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend_setLearningRate_(v10, v7, v8, v9, v6);

}

- (MPSVector)momentum
{
  return (MPSVector *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMomentum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentum, 0);
}

@end
