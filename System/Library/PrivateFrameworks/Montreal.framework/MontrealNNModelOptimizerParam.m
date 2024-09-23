@implementation MontrealNNModelOptimizerParam

- (MontrealNNModelOptimizerParam)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  MontrealNNModelOptimizerParam *v28;
  const char *v29;
  double v30;
  double v31;
  MontrealNNModelOptimizerParam *v32;
  objc_super v34;

  v4 = a3;
  objc_msgSend_exMRL_stringForKey_(v4, v5, (uint64_t)off_1EE418E28, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (!v7)
    goto LABEL_13;
  if ((objc_msgSend_isEqualToString_(v7, v8, (uint64_t)off_1EE418E30, v9) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v10, v11, (uint64_t)off_1EE418E38, v12))
    {
      v13 = 2;
      goto LABEL_6;
    }
LABEL_13:
    v32 = 0;
    goto LABEL_14;
  }
  v13 = 1;
LABEL_6:
  objc_msgSend_exMRL_numberForKey_(v4, v11, (uint64_t)off_1EE418E40, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14;
  v19 = 0;
  v20 = 0;
  if (v14)
  {
    objc_msgSend_floatValue(v14, v15, v16, v17);
    v20 = v21;
  }
  objc_msgSend_exMRL_numberForKey_(v4, v15, (uint64_t)off_1EE418E48, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v22;
  if (v22)
  {
    objc_msgSend_floatValue(v22, v23, v24, v25);
    v19 = v27;
  }
  v34.receiver = self;
  v34.super_class = (Class)MontrealNNModelOptimizerParam;
  v28 = -[MontrealNNModelOptimizerParam init](&v34, sel_init);
  if (v28)
  {
    LODWORD(v30) = v20;
    LODWORD(v31) = v19;
    v28 = (MontrealNNModelOptimizerParam *)objc_msgSend_initWithOptimizerType_learningRate_momentum_gradientClipMin_gradientClipMax_(v28, v29, v13, 0, 0, v30, v31);
  }
  self = v28;

  v32 = self;
LABEL_14:

  return v32;
}

- (MontrealNNModelOptimizerParam)initWithOptimizerType:(unint64_t)a3 learningRate:(float)a4 momentum:(float)a5 gradientClipMin:(id)a6 gradientClipMax:(id)a7
{
  id v13;
  id v14;
  MontrealNNModelOptimizerParam *v15;
  MontrealNNModelOptimizerParam *v16;
  int v17;
  objc_super v19;

  v13 = a6;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)MontrealNNModelOptimizerParam;
  v15 = -[MontrealNNModelOptimizerParam init](&v19, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_12;
  v15->_optimizerType = a3;
  v15->_learningRate = a4;
  if (a4 == 0.0)
  {
    if (a3 == 1)
    {
      v17 = 973279855;
    }
    else
    {
      if (a3 != 2)
        goto LABEL_8;
      v17 = 1036831949;
    }
    LODWORD(v15->_learningRate) = v17;
  }
LABEL_8:
  if (v13 && v14)
  {
    objc_storeStrong((id *)&v15->_gradientClipMin, a6);
    objc_storeStrong((id *)&v16->_gradientClipMax, a7);
  }
  v16->_momentum = a5;
LABEL_12:

  return v16;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  id v35;

  v6 = a4;
  v7 = a3;
  v11 = objc_msgSend_optimizerType(self, v8, v9, v10);
  objc_msgSend_appendFormat_(v7, v12, (uint64_t)CFSTR("\r %@ Algorithm = %tu (Adam: %tu, SGD: %tu)"), v13, v6, v11, 1, 2);
  objc_msgSend_learningRate(self, v14, v15, v16);
  objc_msgSend_appendFormat_(v7, v18, (uint64_t)CFSTR("\r %@ Learning Rate = %lf"), v19, v6, v17);
  objc_msgSend_momentum(self, v20, v21, v22);
  objc_msgSend_appendFormat_(v7, v24, (uint64_t)CFSTR("\r %@ Use Momentum = %lf"), v25, v6, v23);
  objc_msgSend_gradientClipMin(self, v26, v27, v28);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gradientClipMax(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v33, (uint64_t)CFSTR("\r %@ Gradient Clip Min = %@, Max = %@"), v34, v6, v35, v32);

}

- (unint64_t)optimizerType
{
  return self->_optimizerType;
}

- (float)learningRate
{
  return self->_learningRate;
}

- (float)momentum
{
  return self->_momentum;
}

- (NSNumber)gradientClipMin
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)gradientClipMax
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientClipMax, 0);
  objc_storeStrong((id *)&self->_gradientClipMin, 0);
}

@end
